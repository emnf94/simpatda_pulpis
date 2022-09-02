<?php

namespace Pajak\Controller\Pembukuan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class Pembukuan extends AbstractActionController
{

    public function indexAction()
    {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();

        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }

        $ar_kecamatan = $this->Tools()->getService('KecamatanTable')->getdata();
        $recordskecamatan = array();
        foreach ($ar_kecamatan as $ar_kecamatan) {
            $recordskecamatan[] = $ar_kecamatan;
        }

        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }

        $dataanggaran = $this->Tools()->getService('TargetTable')->getdataTarget();
        $recordsanggaran = array();
        foreach ($dataanggaran as $dataanggaran) {
            $recordsanggaran[] = $dataanggaran;
            //var_dump($dataanggaran);
        }

        $dataopd = $this->Tools()->getService('TargetTable')->getdaopd();
        $recordsopd = array();
        foreach ($dataopd as $dataopd) {
            $recordsopd[] = $dataopd;
        }


        $view = new ViewModel(array(
            'form' => $form,
            'dataobjek' => $recordspajak,
            'ar_kecamatan' => $recordskecamatan,
            'ar_pejabat' => $recordspejabat,
            'data_anggaran' => $recordsanggaran,
            'recordsopd' => $recordsopd,
        ));
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function cetakrealisasi__Action()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembukuanTable')->getdataRealisasi($data_get->tglcetak, $data_get->s_idtarget);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakrealisasiAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getdataRealisasi($data_get->tglawal, $data_get->tglakhir, $data_get->s_idtarget);
        // $bphtb_bulanlalu = $this->Tools()->getService('BphtbTable')->getRealisasiBulanlalu($data_get->tglakhir);
        // $bphtb_bulanini = $this->Tools()->getService('BphtbTable')->getRealisasiBulanini($data_get->tglakhir);
        // $bphtb_sdbulanini = $this->Tools()->getService('BphtbTable')->getRealisasiSdBulanini($data_get->tglakhir);
        // var_dump($bphtb_sdbulanini['total']);exit();
        $tahunbphtb = date('Y', strtotime($data_get->tglawal));
        $data_pbb = "";
        // $this->Tools()->getService('PbbTable')->getRealisasiPbbTotal($tahunbphtb);
        //        var_dump($data_pbb['total_tahunanpbb']); exit();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();


        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'jenispad' => $data_get->jenispad,
                'data' => $data,
                'tglawal' => $data_get->tglawal,
                'tglakhir' => $data_get->tglakhir,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'dataget' => $data_get,
                'data_pbb' => $data_pbb['total_tahunanpbb'],
                'bphtb_bulanlalu' => $bphtb_bulanlalu['total'],
                'bphtb_bulanini' => $bphtb_bulanini['total'],
                'bphtb_sdbulaini' => $bphtb_sdbulanini['total'],
                'formatcetak' => $data_get->formatcetak
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'jenispad' => $data_get->jenispad,
                'data' => $data,
                'tglawal' => $data_get->tglawal,
                'tglakhir' => $data_get->tglakhir,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'dataget' => $data_get,
                'bphtb_bulanlalu' => $bphtb_bulanlalu['total'],
                'bphtb_bulanini' => $bphtb_bulanini['total'],
                'bphtb_sdbulaini' => $bphtb_sdbulanini['total'],
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetakrealisasiexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembukuanTable')->getdataRealisasi($data_get->tglcetak, $data_get->s_idtarget);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:N7')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('I')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(18);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(40);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('J')->setWidth(30);
        $object->getActiveSheet()->mergeCells('A1:J2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->mergeCells('A6:A7');
        $object->getActiveSheet()->mergeCells('B6:B7');
        $object->getActiveSheet()->mergeCells('C6:C7');
        $object->getActiveSheet()->mergeCells('D6:D7');
        $object->getActiveSheet()->mergeCells('E6:G6');
        $object->getActiveSheet()->mergeCells('I6:J6');
        $object->getActiveSheet()->getStyle('A6:J6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6:G6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I6:J6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I6:J6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A7:J7')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6:A7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B6:B7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C6:C7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D6:D7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6:E7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H6:H7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H6:H7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'REALISASI Bulan ' . date('m', strtotime($data_get->tglcetak)) . ' Tahun ' . date('Y', strtotime($data_get->tglcetak)))
            // judul atas
            ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetak)))
            ->setCellValue('A6', 'No.')
            ->setCellValue('B6', 'Kode Rekening')
            ->setCellValue('C6', 'Jenis Penerimaan')
            ->setCellValue('D6', 'Target Anggaran')
            ->setCellValue('E6', 'Realisasi')
            ->setCellValue('H6', '%')
            ->setCellValue('I6', 'Selisih')
            // judul bawah
            ->setCellValue('E7', 's/d Bulan Lalu')
            ->setCellValue('F7', 'Bulan ini')
            ->setCellValue('G7', 's/d Bulan ini')
            ->setCellValue('I7', 'Selisih Target')
            ->setCellValue('J7', '%');
        $counter = 8;
        $no = 1;
        $total_target = 0;
        $total_bulanlalu = 0;
        $total_bulanini = 0;
        $total_sdbulanini = 0;
        $total_selisih = 0;
        $ex = $object->setActiveSheetIndex(0);
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $v['korek']);
            $ex->setCellValue("C" . $counter, $v['s_namakorek']);
            $ex->setCellValue("D" . $counter, number_format($v['targetjumlah'], 0, ',', '.'));
            $ex->setCellValue("E" . $counter, number_format($v['real_bulanlalu'], 0, ',', '.'));
            $ex->setCellValue("F" . $counter, number_format($v['real_bulanini'], 0, ',', '.'));
            $ex->setCellValue("G" . $counter, number_format($v['real_sdbulanini'], 0, ',', '.'));
            if ($v['targetjumlah'] != null || $v['targetjumlah'] != 0) {
                $persenreal = $v['real_sdbulanini'] / $v['targetjumlah'] * 100;
            } else {
                $persenreal = 0;
            }
            $ex->setCellValue("H" . $counter, $persenreal);
            $selisih = $v['real_sdbulanini'] - $v['targetjumlah'];
            $ex->setCellValue("I" . $counter, number_format($selisih, 0, ',', '.'));
            if ($v['targetjumlah'] != null || $v['targetjumlah'] != 0) {
                $persenkurang = $selisih / $v['targetjumlah'] * 100;
            } else {
                $persenkurang = 0;
            }
            $ex->setCellValue("J" . $counter, $persenkurang);
            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $counter = $counter + 1;
            $no++;
            $total_target += $v['targetjumlah'];
            $total_bulanlalu += $v['real_bulanlalu'];
            $total_bulanini += $v['real_bulanini'];
            $total_sdbulanini += $v['real_sdbulanini'];
            $total_selisih += $selisih;
        }
        $ex->setCellValue("D" . $counter, number_format($total_target, 0, ',', '.'));
        $ex->setCellValue("E" . $counter, number_format($total_bulanlalu, 0, ',', '.'));
        $ex->setCellValue("F" . $counter, number_format($total_bulanini, 0, ',', '.'));
        $ex->setCellValue("G" . $counter, number_format($total_sdbulanini, 0, ',', '.'));
        $ex->setCellValue("I" . $counter, number_format($total_selisih, 0, ',', '.'));
        $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="cetakrealisasi.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetakrealisasiobjekAction()
    {
        $req = $this->getRequest();

        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembukuanTable')->getdataRealisasiObjek($data_get->perioderealisasiobjek, $data_get->t_kecamatanrealisasiobjek, $data_get->t_kelurahanrealisasiobjek);

        if (!empty($data_get->t_kelurahanrealisasiobjek)) {
            $datakelurahan = $this->Tools()->getService('KelurahanTable')->getDataId($data_get->t_kelurahanrealisasiobjek);
        }
        if (!empty($data_get->t_kecamatanrealisasiobjek)) {
            $datakecamatan = $this->Tools()->getService('KecamatanTable')->getDataId($data_get->t_kecamatanrealisasiobjek);
        }

        // var_dump($req);die;
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglcetak' => $data_get->tglcetak,
            'periode' => $data_get->perioderealisasiobjek,
            'ar_pemda' => $ar_pemda,
            'kelurahan' => $datakelurahan,
            'kecamatan' => $datakecamatan,
            'ar_diperiksa' => $ar_diperiksa,
            'ar_mengetahui' => $ar_mengetahui,
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakrealisasiobjekexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembukuanTable')->getdataRealisasiObjek($data_get->perioderealisasiobjek, $data_get->t_kecamatanrealisasiobjek, $data_get->t_kelurahanrealisasiobjek);
        $datakelurahan = $this->Tools()->getService('KelurahanTable')->getDataId($data_get->t_kelurahanrealisasiobjek);
        $datakecamatan = $this->Tools()->getService('KecamatanTable')->getDataId($data_get->t_kecamatanrealisasiobjek);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:F6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(18);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(30);
        $object->getActiveSheet()->mergeCells('A1:F2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->getStyle('A6:F6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'REALISASI Tahun ' . date('Y', strtotime($data_get->tglcetak)))
            // judul atas
            ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetak)))
            ->setCellValue('A6', 'No.')
            ->setCellValue('B6', 'Kode Rekening')
            ->setCellValue('C6', 'Nama Rekening')
            ->setCellValue('D6', 'Penetapan (Rp.)')
            ->setCellValue('E6', 'Realisasi (Rp.)')
            ->setCellValue('F6', 'Selisih (Rp.)');
        $counter = 7;
        $no = 1;
        $total_penetapan = 0;
        $total_realisasi = 0;
        $total_selisih = 0;
        $ex = $object->setActiveSheetIndex(0);
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $v['korek']);
            $ex->setCellValue("C" . $counter, $v['s_namakorek']);
            $ex->setCellValue("D" . $counter, number_format($v['penetapan'], 0, ',', '.'));
            $ex->setCellValue("E" . $counter, number_format($v['realisasi'], 0, ',', '.'));
            $selisih = $v['penetapan'] - $v['realisasi'];
            $ex->setCellValue("F" . $counter, number_format($selisih, 0, ',', '.'));
            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $counter = $counter + 1;
            $no++;
            $total_penetapan += $v['penetapan'];
            $total_realisasi += $v['realisasi'];
            $total_selisih += $selisih;
        }
        $ex->setCellValue("C" . $counter, number_format($total_penetapan, 0, ',', '.'));
        $ex->setCellValue("D" . $counter, number_format($total_realisasi, 0, ',', '.'));
        $ex->setCellValue("E" . $counter, number_format($total_selisih, 0, ',', '.'));
        $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="cetakrealisasi.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetakketsetAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();

        $data = $this->Tools()->getService('PembukuanTable')->getdataKetetapanSetoran($data_get->tglcetak, $data_get->periodeketset, $data_get->jenisobj, $data_get->korekid);
        if (!empty($data_get->jenisobj)) {
            $ar_jenisobj = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get->jenisobj);
        }
        if (!empty($data_get->korekid)) {
            $ar_korek = $this->Tools()->getService('RekeningTable')->getRekeningId($data_get->korekid);
        }

        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'tglcetak' => $data_get->tglcetak,
                'periodeketset' => $data_get->periodeketset,
                'ar_pemda' => $ar_pemda,
                'ar_jenisobj' => $ar_jenisobj,
                'ar_korek' => $ar_korek,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'formatcetak' => $data_get->formatcetak
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'tglcetak' => $data_get->tglcetak,
                'periodeketset' => $data_get->periodeketset,
                'ar_pemda' => $ar_pemda,
                'ar_jenisobj' => $ar_jenisobj,
                'ar_korek' => $ar_korek,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetakketsetexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembukuanTable')->getdataKetetapanSetoran($data_get->tglcetak, $data_get->jenisobj, $data_get->korekid);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A6:Q7')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('D:Q')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('A1')->getFont()->setBold(true)->setSize(14);

        //
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(38);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('J')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('K')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('L')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('M')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('N')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('O')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('P')->setWidth(40);
        $object->getActiveSheet()->getColumnDimension('Q')->setWidth(40);


        // Merge
        $object->getActiveSheet()->mergeCells('A1:Q2');
        $object->getActiveSheet()->mergeCells('A4:D4');

        $object->getActiveSheet()->mergeCells('A6:A7');
        $object->getActiveSheet()->mergeCells('B6:B7');
        $object->getActiveSheet()->mergeCells('C6:C7');
        $object->getActiveSheet()->mergeCells('D6:O6');
        $object->getActiveSheet()->mergeCells('P6:P7');
        $object->getActiveSheet()->mergeCells('Q6:Q7');


        // Border
        $object->getActiveSheet()->getStyle('A6:Q6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6:Q6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A7:Q7')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6:A7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B6:B7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C6:C7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('K7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('L7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('M7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('N7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('O6:O7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('P6:P7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('Q6:Q7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'DAFTAR KETETAPAN DAN SETORAN')
            // judul atas
            ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetak)))
            ->setCellValue('A6', 'No.')
            ->setCellValue('B6', 'WP')
            ->setCellValue('C6', 'OP')
            ->setCellValue('D6', 'Periode Pajak')
            ->setCellValue('P6', 'Total')
            ->setCellValue('Q6', 'Piutang')
            // judul bawah
            ->setCellValue('D7', 'Januari')
            ->setCellValue('E7', 'Februari')
            ->setCellValue('F7', 'Maret')
            ->setCellValue('G7', 'April')
            ->setCellValue('H7', 'Mei')
            ->setCellValue('I7', 'Juni')
            ->setCellValue('J7', 'Juli')
            ->setCellValue('K7', 'Agustus')
            ->setCellValue('L7', 'September')
            ->setCellValue('M7', 'Oktober')
            ->setCellValue('N7', 'Nopember')
            ->setCellValue('O7', 'Desember');
        $counter = 8;
        $no = 1;
        //        $total_target = 0;
        //        $total_bulanlalu = 0;
        //        $total_bulanini = 0;
        //        $total_sdbulanini = 0;
        //        $total_selisih = 0;
        $ex = $object->setActiveSheetIndex(0);
        foreach ($data as $v) {
            // Merge
            $object->getActiveSheet()->mergeCells('A' . $counter . ':' . 'A' . ($counter + 1));
            $object->getActiveSheet()->mergeCells('B' . $counter . ':' . 'B' . ($counter + 1));
            $object->getActiveSheet()->mergeCells('C' . $counter . ':' . 'C' . ($counter + 1));
            $object->getActiveSheet()->mergeCells('Q' . $counter . ':' . 'Q' . ($counter + 1));

            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $v['t_nama'] . " - " . $v['t_npwpd']);
            $ex->setCellValue("C" . $counter, $v['t_namaobjek'] . " - " . $v['t_nop']);
            $ex->setCellValue("D" . $counter, number_format($v['data_jan']));
            $ex->setCellValue("E" . $counter, number_format($v['data_feb']));
            $ex->setCellValue("F" . $counter, number_format($v['data_mar']));
            $ex->setCellValue("G" . $counter, number_format($v['data_apr']));
            $ex->setCellValue("H" . $counter, number_format($v['data_mei']));
            $ex->setCellValue("I" . $counter, number_format($v['data_jun']));
            $ex->setCellValue("J" . $counter, number_format($v['data_jul']));
            $ex->setCellValue("K" . $counter, number_format($v['data_agu']));
            $ex->setCellValue("L" . $counter, number_format($v['data_sep']));
            $ex->setCellValue("M" . $counter, number_format($v['data_okt']));
            $ex->setCellValue("N" . $counter, number_format($v['data_nov']));
            $ex->setCellValue("O" . $counter, number_format($v['data_des']));
            $total_data = $v['data_jan'] + $v['data_feb'] + $v['data_mar'] + $v['data_apr'] + $v['data_mei'] + $v['data_jun'] + $v['data_jul'] + $v['data_agu'] + $v['data_sep'] + $v['data_okt'] + $v['data_nov'] + $v['data_des'];
            $total_bayar = $v['bayar_jan'] + $v['bayar_feb'] + $v['bayar_mar'] + $v['bayar_apr'] + $v['bayar_mei'] + $v['bayar_jun'] + $v['bayar_jul'] + $v['bayar_agu'] + $v['bayar_sep'] + $v['bayar_okt'] + $v['bayar_nov'] + $v['bayar_des'];
            $ex->setCellValue("P" . $counter, number_format($total_data));

            $ex->setCellValue("D" . ($counter + 1), number_format($v['bayar_jan']));
            $ex->setCellValue("E" . ($counter + 1), number_format($v['bayar_feb']));
            $ex->setCellValue("F" . ($counter + 1), number_format($v['bayar_mar']));
            $ex->setCellValue("G" . ($counter + 1), number_format($v['bayar_apr']));
            $ex->setCellValue("H" . ($counter + 1), number_format($v['bayar_mei']));
            $ex->setCellValue("I" . ($counter + 1), number_format($v['bayar_jun']));
            $ex->setCellValue("J" . ($counter + 1), number_format($v['bayar_jul']));
            $ex->setCellValue("K" . ($counter + 1), number_format($v['bayar_agu']));
            $ex->setCellValue("L" . ($counter + 1), number_format($v['bayar_sep']));
            $ex->setCellValue("M" . ($counter + 1), number_format($v['bayar_okt']));
            $ex->setCellValue("N" . ($counter + 1), number_format($v['bayar_nov']));
            $ex->setCellValue("O" . ($counter + 1), number_format($v['bayar_des']));
            $ex->setCellValue("P" . ($counter + 1), number_format($total_bayar));

            $ex->setCellValue("Q" . $counter, number_format($total_data - $total_bayar));
            $object->getActiveSheet()->getStyle('A' . $counter . ':' . 'A' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter . ':' . 'B' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter . ':' . 'C' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter . ':' . 'D' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter . ':' . 'E' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter . ':' . 'F' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter . ':' . 'G' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter . ':' . 'H' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I' . $counter . ':' . 'I' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('J' . $counter . ':' . 'J' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('K' . $counter . ':' . 'K' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('L' . $counter . ':' . 'L' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('M' . $counter . ':' . 'M' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('N' . $counter . ':' . 'N' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('O' . $counter . ':' . 'O' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('P' . $counter . ':' . 'P' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('Q' . $counter . ':' . 'Q' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('R' . $counter . ':' . 'R' . ($counter + 1))->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $counter = $counter + 1;
            $no++;
        }
        //        $ex->setCellValue("D" . $counter, number_format($total_target, 0, ',', '.'));
        //        $ex->setCellValue("E" . $counter, number_format($total_bulanlalu, 0, ',', '.'));
        //        $ex->setCellValue("F" . $counter, number_format($total_bulanini, 0, ',', '.'));
        //        $ex->setCellValue("G" . $counter, number_format($total_sdbulanini, 0, ',', '.'));
        //        $ex->setCellValue("I" . $counter, number_format($total_selisih, 0, ',', '.'));
        $object->getActiveSheet()->getStyle('A' . $counter . ':' . 'Q' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter . ':' . 'Q' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="cetakketset.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetakpenddimukaAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        //      var_dump($data_get->korekobjtrans); exit();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getDataTransaksiByPerMasaAkhirpajak($data_get->tglcetak, $data_get->periodedimuka, $data_get->jenisobjdimuka, $data_get->korekobjdimuka);
        // $total = $this->Tools()->getService('PembukuanTable')->getDataTotalTransaksiByPerMasaPajak($data_get->masaawaltrans, $data_get->periodetrans, $data_get->jenisobjtrans, $data_get->korekobjtrans);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_namajenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get->jenisobjtrans);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'periodedimuka' => $data_get->periodedimuka,
            'jenisobjdimuka' => $data_get->jenisobjdimuka,
            'ar_namajenis' => $ar_namajenis['s_namajenis'],
            'ar_pemda' => $ar_pemda,
            'ar_diperiksa' => $ar_diperiksa,
            'ar_mengetahui' => $ar_mengetahui,
            'tglcetak' => $data_get->tglcetak
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetaktransmasa__Action()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembukuanTable')->getDataTransaksiByMasaPajak($data_get->masaawaltrans, $data_get->periodetrans, $data_get->jenisobjtrans);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'masaawaltrans' => $data_get->masaawaltrans,
            'periodetrans' => $data_get->periodetrans,
            'jenisobjtrans' => $data_get->jenisobjtrans,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetaktransmasaAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        //      var_dump($data_get->korekobjtrans); exit();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getDataTransaksiByPerMasaPajak($data_get->masaawaltrans, $data_get->periodetrans, $data_get->jenisobjtrans, $data_get->korekobjtrans);
        $total = $this->Tools()->getService('PembukuanTable')->getDataTotalTransaksiByPerMasaPajak($data_get->masaawaltrans, $data_get->periodetrans, $data_get->jenisobjtrans, $data_get->korekobjtrans);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_namajenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get->jenisobjtrans);
        if (!empty($data_get->jenisobjtrans)) {
            $namajenis = $ar_namajenis['s_namajenis'];
        } else {
            $namajenis = "Semua Pajak";
        }
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'total' => $total,
            'masaawaltrans' => $data_get->masaawaltrans,
            'periodetrans' => $data_get->periodetrans,
            'jenisobjtrans' => $data_get->jenisobjtrans,
            'ar_namajenis' => $namajenis,
            'ar_pemda' => $ar_pemda,
            'ar_diperiksa' => $ar_diperiksa,
            'ar_mengetahui' => $ar_mengetahui,
            'tglcetak' => $data_get->tglcetak
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetaktransmasaexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembukuanTable')->getDataTransaksiByMasaPajak($data_get->masaawaltrans, $data_get->periodetrans, $data_get->jenisobjtrans);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:F6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(18);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('J')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('K')->setWidth(20);
        $object->getActiveSheet()->mergeCells('A1:F2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->getStyle('A6:K6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6:K6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('f6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('K6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'DAFTAR TRANSAKSI PER MASA PAJAK')
            // judul atas
            ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetak)))
            ->setCellValue('A6', 'No.')
            ->setCellValue('B6', 'Nama')
            ->setCellValue('C6', 'NPWPD')
            ->setCellValue('D6', 'NIOP')
            ->setCellValue('E6', 'Jenis Pajak')
            ->setCellValue('F6', 'Masa Pajak/Periode')
            ->setCellValue('G6', 'Jumlah Pajak')
            ->setCellValue('H6', 'Tgl. Pembayaran')
            ->setCellValue('I6', 'Jumlah Pembayaran')
            ->setCellValue('J6', 'Tgl. Jatuh Tempo')
            ->setCellValue('K6', 'Jumlah Tunggakan');
        $counter = 7;
        $no = 1;
        $totalpendataan = 0;
        $totalpembayaran = 0;
        $ex = $object->setActiveSheetIndex(0);
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $v['t_nama']);
            $ex->setCellValue("C" . $counter, $v['t_npwpd']);
            $ex->setCellValue("D" . $counter, $v['t_nop']);
            $ex->setCellValue("E" . $counter, $v['s_namajenis']);
            $ex->setCellValue("F" . $counter, date('d-m-Y', strtotime($v['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($v['t_masaakhir'])) . " / " . $v['t_periodepajak']);
            $ex->setCellValue("G" . $counter, number_format($v['t_jmlhpajak'], 0, ',', '.'));
            $t_tglpembayaran = (!empty($v['t_tglpembayaran']) ? date('d-m-Y', strtotime($v['t_tglpembayaran'])) : '-');
            $ex->setCellValue("H" . $counter, $t_tglpembayaran);
            $ex->setCellValue("I" . $counter, number_format($v['t_jmlhpembayaran'], 0, ',', '.'));
            $ex->setCellValue("J" . $counter, date('d-m-Y', strtotime($v['t_tgljatuhtempo'])));
            $ex->setCellValue("K" . $counter, number_format($v['t_jmlhpajak'] - $v['t_jmlhpembayaran'], 0, ',', '.'));
            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('L' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $counter = $counter + 1;
            $no++;
            $totalpendataan += $v['t_jmlhpajak'];
            $totalpembayaran += $v['t_jmlhpembayaran'];
        }
        //        $ex->setCellValue("C" . $counter, number_format($total_penetapan, 0, ',', '.'));
        //        $ex->setCellValue("D" . $counter, number_format($total_realisasi, 0, ',', '.'));
        //        $ex->setCellValue("E" . $counter, number_format($total_selisih, 0, ',', '.'));
        $object->getActiveSheet()->getStyle('A' . $counter . ':K' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter . ':K' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('L' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="cetaktransmasa.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function dataGridAction()
    {
        /** DataGrid Tabel Pendaftaran
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 03/11/2016
         */
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new \Pajak\Model\Pendaftaran\PendaftaranBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PendaftaranTable')->getGridCount($base, $post);
        if ($count > 0 && $limit > 0) {
            $total_pages = ceil($count / $limit);
        } else {
            $total_pages = 0;
        }
        if ($page > $total_pages)
            $page = $total_pages;
        $start = $limit * $page - $limit;
        if ($start < 0)
            $start = 0;
        $data = $this->Tools()->getService('PendaftaranTable')->getGridData($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No' style='color:black'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='NPWPD' style='color:black'><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama' style='color:black'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='Alamat' style='color:black'>" . $row['t_alamat'] . "</td>";
            $s .= "<td data-title='Kelurahan' style='color:black'>" . $row['s_namakel'] . "</td>";
            $s .= "<td data-title='Kecamatan' style='color:black'>" . $row['s_namakec'] . "</td>";
            $s .= "<td data-title='Kabupaten' style='color:black'>" . $row['t_kabupaten'] . "</td>";
            $s .= "<td data-title='Tanggal Pendaftaran' style='color:black'><center>" . date('d-m-Y', strtotime($row['t_tgldaftar'])) . "</center></td>";
            $jmlop = $this->Tools()->getService('ObjekTable')->getJmlOP($row['t_idwp']);
            $s .= "<td data-title='Jumlah OP' style='color:black'><center>" . $jmlop . "</center></td>";
            $s .= "<td data-title='#'><center><a href='javascript:void(0)' class='btn btn-warning btn-xs' onclick='pilihwp($row[t_idwp])' title='Pilih WP'><i class='glyph-icon icon-hand-o-up'></i> Pilih</a></center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "grid" => $s,
            "rows" => $base->rows,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages,
            "paginatore" => $datapaging['paginatore'],
            "akhirdata" => $datapaging['akhirdata'],
            "awaldata" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function pilihwpAction()
    {
        /** Hitung Pajak Default
         * @param int $t_dasarpengenaan
         * @param int $t_tarifpajak
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 13/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PembukuanTable')->getdataWpbyId($data_get['t_idwp']);
        $dataobjek = $this->Tools()->getService('PembukuanTable')->getdataWpObjekbyId($data_get['t_idwp']);
        $jenisobjbukuwp = "";
        $jenisobjbukuwp .= "<option value=''>Silahkan Pilih</option>";
        foreach ($dataobjek as $r) {
            $jenisobjbukuwp .= "<option value='" . $r['t_idobjek'] . "'>" . $r['t_nop'] . " || " . $r['t_namaobjek'] . " (" . $r['s_namajenis'] . ")</option>";
        }

        $data_render = array(
            "t_npwpd" => $data['t_npwpd'],
            "jenisobjbukuwp" => $jenisobjbukuwp
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function comboKelurahanCamatAction()
    {
        $frm = new \Pajak\Form\Pendaftaran\PendaftaranFrm();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Pajak\Model\Pendaftaran\PendaftaranBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                // $data = $this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan($ex);
                $data = $this->Tools()->getService('PendaftaranTable')->getByKecamatan($ex);
                $opsi = "";
                $opsi .= "<option value=''>Pilih Semua</option>";
                foreach ($data as $r) {
                    $opsi .= "<option value='" . $r['s_idkel'] . "'>" . str_pad($r['s_kodekel'], 2, "0", STR_PAD_LEFT) . " || " . $r['s_namakel'] . "</option>";
                }
                $res->setContent($opsi);
            }
        }
        return $res;
    }

    public function cetakbukuwpAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $dataarr = array();
        for ($i = 1; $i <= 12; $i++) {
            $datatransaksi = $this->Tools()->getService('PembukuanTable')->getDataBukuWP($data_get->periodepajakbukuwp, $data_get->jenisobjbukuwp, $i);
            if ($datatransaksi == false) {
                $datatransaksi = array(
                    't_tglpendataan' => null,
                    't_jmlhpajak' => null,
                    't_tgljatuhtempo' => null,
                    't_jmlhpembayaran' => null,
                    't_tglpembayaran' => null,
                    't_jmlhdendapembayaran' => null,
                    't_tgldendapembayaran' => null,
                    't_jmlhbayardenda' => null,
                    't_tglbayardenda' => null,
                    't_jmlhbulandendapembayaran' => null
                );
            } else {
                $datatransaksi = $datatransaksi;
            }
            $dataarr[] = array_merge($datatransaksi);
        }
        $ar_transaksireklame = $this->Tools()->getService('PembukuanTable')->getDataBukuWPreklame($data_get->periodepajakbukuwp, $data_get->jenisobjbukuwp);
        $ar_wpobjek = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdObjek($data_get->jenisobjbukuwp);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $dataarr,
            'ar_transaksireklame' => $ar_transaksireklame,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda,
            'periode' => $data_get->periodepajakbukuwp,
            'ar_wpobjek' => $ar_wpobjek
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakbukuwpexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $dataarr = array();
        for ($i = 1; $i <= 12; $i++) {
            $datatransaksi = $this->Tools()->getService('PembukuanTable')->getDataBukuWP($data_get->periodepajakbukuwp, $data_get->jenisobjbukuwp, $i);
            if ($datatransaksi == false) {
                $datatransaksi = array(
                    't_tglpendataan' => null,
                    't_jmlhpajak' => null,
                    't_tgljatuhtempo' => null,
                    't_jmlhpembayaran' => null,
                    't_tglpembayaran' => null,
                    't_jmlhdendapembayaran' => null,
                    't_tgldendapembayaran' => null,
                    't_jmlhbayardenda' => null,
                    't_tglbayardenda' => null,
                    't_jmlhbulandendapembayaran' => null
                );
            } else {
                $datatransaksi = $datatransaksi;
            }
            $dataarr[] = array_merge($datatransaksi);
        }
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:F6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('G6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('H')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('H6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('I')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('J6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('J')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('K6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('K')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(18);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('J')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('K')->setWidth(20);
        $object->getActiveSheet()->mergeCells('A1:F2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->mergeCells('B5:C5');
        $object->getActiveSheet()->mergeCells('E5:F5');
        $object->getActiveSheet()->mergeCells('I5:J5');
        $object->getActiveSheet()->getStyle('A6:K6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A5:K5')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A5:K5')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6:K6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('K5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('K6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'BUKU WAJIB PAJAK')
            // judul atas
            ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetak)))
            ->setCellValue('A6', 'Bulan')
            ->setCellValue('B5', 'SPTPD')
            ->setCellValue('B6', 'Tgl.')
            ->setCellValue('C6', 'Nilai')
            ->setCellValue('D6', 'Tgl. Jatuh Tempo')
            ->setCellValue('E5', 'Realisasi Penerimaan')
            ->setCellValue('E6', 'Tgl.')
            ->setCellValue('F6', 'Pokok')
            ->setCellValue('G6', 'Denda')
            ->setCellValue('H6', 'Lebih/Kurang bayar')
            ->setCellValue('I5', 'Denda')
            ->setCellValue('I6', 'Uraian')
            ->setCellValue('J6', 'Jml.Denda')
            ->setCellValue('K6', 'Jml.Piutang Pajak');
        $counter = 7;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        $total_piutang = 0;
        $total_nilai = 0;
        $total_bayar = 0;
        $total_denda = 0;
        foreach ($dataarr as $k => $v) {
            $abulan = ['1' => 'Januari', '2' => 'Februari', '3' => 'Maret', '4' => 'April', '5' => 'Mei', '6' => 'Juni', '7' => 'Juli', '8' => 'Agustus', '9' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
            $t_masapajak = $abulan[$k + 1] . " " . $data_get->periodepajakbukuwp;
            $ex->setCellValue("A" . $counter, $t_masapajak);
            $ex->setCellValue("B" . $counter, ($v['t_tglpendataan'] != NULL) ? date('d-m-Y', strtotime($v['t_tglpendataan'])) : '-');
            $ex->setCellValue("C" . $counter, $v['t_jmlhpajak']);
            $ex->setCellValue("D" . $counter, ($v['t_tgljatuhtempo'] != NULL) ? date('d-m-Y', strtotime($v['t_tgljatuhtempo'])) : '-');
            $ex->setCellValue("E" . $counter, ($v['t_tglpembayaran'] != NULL) ? date('d-m-Y', strtotime($v['t_tglpembayaran'])) : '-');
            $ex->setCellValue("F" . $counter, $v['t_jmlhpembayaran']);
            $ex->setCellValue("G" . $counter, $v['t_jmlhbayardenda']);
            $ex->setCellValue("H" . $counter, '');
            $ex->setCellValue("I" . $counter, ($v['t_jmlhbulandendapembayaran'] != NULL) ? $v['t_jmlhbulandendapembayaran'] . '(bulan) x ' . $v['t_jmlhpajak'] . 'x 2%' : '-');
            $ex->setCellValue("J" . $counter, $v['t_jmlhdendapembayaran']);
            $ex->setCellValue("K" . $counter, ($v['t_jmlhpajak'] + $v['t_jmlhdendapembayaran']) - ($v['t_jmlhpembayaran'] + $v['t_jmlhbayardenda']));
            $object->getActiveSheet()->getStyle('C' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('F' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('G' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('H' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('J' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('K' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $counter = $counter + 1;
            $total_piutang += $piutang;
            $total_nilai += $v['t_jmlhpajak'];
            $total_bayar += $v['t_jmlhpembayaran'];
            $total_denda += $v['t_jmlhbayardenda'];
            $no++;
        }
        //        die();
        //        $ex->setCellValue("C" . $counter, number_format($total_penetapan, 0, ',', '.'));
        //        $ex->setCellValue("D" . $counter, number_format($total_realisasi, 0, ',', '.'));
        //        $ex->setCellValue("H" . $counter, $total_piutang);
        $ex->setCellValue("C" . $counter, $total_nilai);
        $ex->setCellValue("F" . $counter, $total_bayar);
        $ex->setCellValue("G" . $counter, $total_denda);
        $object->getActiveSheet()->getStyle('C' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('F' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('G' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('I' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('J' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('K' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        //        $object->getActiveSheet()->getStyle('H' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('A' . $counter . ':K' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter . ':K' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="bukuwp.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
        //        $pdf = new \LosPdf\View\Model\PdfModel();
        //        $pdf->setVariables(array(
        //            'data' => $dataarr,
        //            'tglcetak' => $data_get->tglcetak,
        //            'ar_pemda' => $ar_pemda,
        //            'periode' => $data_get->periodepajakbukuwp
        //        ));
        //        $pdf->setOption("paperSize", "legal-L");
        //        return $pdf;
    }

    public function cetakbelumbayarAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $dataarr = $this->Tools()->getService('PembukuanTable')->getDataBelumbayar($data_get->periodepajakbukuwp, $data_get->jenisobjbukuwp);

        $ar_wpobjek = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdObjek($data_get->jenisobjbukuwp);

        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $dataarr,
            'tglcetak' => $data_get->tglcetak,
            'periodepajak' => $data_get->periodepajakbukuwp,
            'ar_pemda' => $ar_pemda,
            'ar_wpobjek' => $ar_wpobjek,
            'ar_mengetahui' => $ar_mengetahui
        ));
        $pdf->setOption("paperSize", "legal");
        return $pdf;
    }

    public function cetakpiutangAction()
    {
        //////============editan id kecmatan dan kode kelurahan

        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // var_dump($data_get);exit();        

        // if (!empty($data_get->t_kecamatanpiutang)) {
        //     $datakelurahan = $this->Tools()->getService('KelurahanTable')->getDataId($data_get->t_kelurahanpiutang);
        // }
        // if (!empty($data_get->t_kelurahanpiutang)) {
        //     $datakecamatan = $this->Tools()->getService('KecamatanTable')->getDataId($data_get->t_kecamatanpiutang);
        // }

        // $kodekelurahan = $datakelurahan->s_kodekel;
        // var_dump($datakelurahan);die;

        $data = $this->Tools()->getService('PenagihanTable')->getDataPiutangSemuaperiode($data_get->periodepiutang, $data_get->t_kecamatanpiutang, $data_get->t_kelurahanpiutang, $data_get->jenisobjpiutang);
        // foreach ($data as $key) {
        //             # code...
        //             var_dump($key);
        //         }        
        // die;
        $ar_jenispajak = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdObjek($data_get->jenisobjpiutang);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'periodepiutang' => $data_get->periodepiutang,
            'tglcetak' => $data_get->tglcetakpiutang,
            'kelurahan' => $datakelurahan,
            'kecamatan' => $datakecamatan,
            'ar_pemda' => $ar_pemda,
            'ar_jenispajak' => $ar_jenispajak
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    //////=================== aslinya id kecamatan dan id kelurahan (#)
    // public function cetakpiutangAction() {
    //     $req = $this->getRequest();
    //     $data_get = $req->getQuery();
    //     $data = $this->Tools()->getService('PenagihanTable')->getDataPiutangSemuaperiode($data_get->periodepiutang, $data_get->t_kecamatanpiutang, $data_get->t_kelurahanpiutang, $data_get->jenisobjpiutang);
    //     if (!empty($data_get->t_kecamatanpiutang)) {
    //         $datakelurahan = $this->Tools()->getService('KelurahanTable')->getDataId($data_get->t_kelurahanpiutang);
    //     }
    //     if (!empty($data_get->t_kelurahanpiutang)) {
    //         $datakecamatan = $this->Tools()->getService('KecamatanTable')->getDataId($data_get->t_kecamatanpiutang);
    //     }
    //     $ar_jenispajak = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdObjek($data_get->jenisobjpiutang);
    //     $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
    //     $pdf = new \LosPdf\View\Model\PdfModel();
    //     $pdf->setVariables(array(
    //         'data' => $data,
    //         'periodepiutang' => $data_get->periodepiutang,
    //         'tglcetak' => $data_get->tglcetakpiutang,
    //         'kelurahan' => $datakelurahan,
    //         'kecamatan' => $datakecamatan,
    //         'ar_pemda' => $ar_pemda,
    //         'ar_jenispajak' => $ar_jenispajak
    //     ));
    //     $pdf->setOption("paperSize", "legal-L");
    //     return $pdf;
    // }

    public function cetakpiutangexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataPiutang($data_get->periodepiutang, $data_get->t_kecamatanpiutang, $data_get->t_kelurahanpiutang, $data_get->jenisobjpiutang);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:F6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('H')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(18);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(20);
        $object->getActiveSheet()->mergeCells('A1:F2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->getStyle('A6:H6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6:H6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'DATA PIUTANG')
            // judul atas
            ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetakpiutang)))
            ->setCellValue('A6', 'No.')
            ->setCellValue('B6', 'Nama')
            ->setCellValue('C6', 'NPWPD')
            ->setCellValue('D6', 'NIOP')
            ->setCellValue('E6', 'Tanggal Pendataan')
            ->setCellValue('F6', 'Masa Pajak')
            ->setCellValue('G6', 'Jenis Pajak')
            ->setCellValue('H6', 'Tunggakan');
        $counter = 7;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        $total_piutang = 0;
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $v['t_nama']);
            $ex->setCellValue("C" . $counter, $v['t_npwpd']);
            $ex->setCellValue("D" . $counter, $v['t_nop']);
            $ex->setCellValue("E" . $counter, date('d-m-Y', strtotime($v['t_tglpendataan'])));
            $ex->setCellValue("F" . $counter, date('d-m-Y', strtotime($v['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($v['t_masaakhir'])));
            $ex->setCellValue("G" . $counter, $v['s_namajenis']);
            $piutang = (float) $v['t_jmlhpajak'] - (float) $v['t_jmlhpembayaran'];
            ////            var_dump($v['t_jmlhpajak']);
            //            var_dump($piutang);
            $ex->setCellValue("H" . $counter, $piutang);
            $object->getActiveSheet()->getStyle('H' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $counter = $counter + 1;
            $total_piutang += $piutang;
            $no++;
        }
        //        die();
        //        $ex->setCellValue("C" . $counter, number_format($total_penetapan, 0, ',', '.'));
        //        $ex->setCellValue("D" . $counter, number_format($total_realisasi, 0, ',', '.'));
        $ex->setCellValue("H" . $counter, $total_piutang);
        $object->getActiveSheet()->getStyle('H' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('A' . $counter . ':H' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter . ':H' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="datapiutang.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetaktunggakanAction()
    {
        /** Cetak Pembukuan
         * @param string $tglcetak Tanggal Mencetak Dokumen
         * @param date('d-m-Y') $tgljatuhtempo0 Tanggal Minimal Piutang
         * @param date('d-m-Y') $tgljatuhtempo1 Tanggal Maximal Piutang
         * @param int $t_kecamatan 
         * @param int $t_kelurahan  
         * @param int $t_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataTunggakan($data_get->tgljatuhtempo0tunggakan, $data_get->tgljatuhtempo1tunggakan, $data_get->t_kecamatantunggakan, $data_get->t_kelurahantunggakan, $data_get->jenisobjtunggakan);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tgljatuhtempo0' => $data_get->tgljatuhtempo0tunggakan,
            'tgljatuhtempo1' => $data_get->tgljatuhtempo1tunggakan,
            'tglcetak' => $data_get->tglcetaktunggakan,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetaktunggakanexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataTunggakan($data_get->tgljatuhtempo0tunggakan, $data_get->tgljatuhtempo1tunggakan, $data_get->t_kecamatantunggakan, $data_get->t_kelurahantunggakan, $data_get->jenisobjtunggakan);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:F6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('H')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(18);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('J')->setWidth(20);
        $object->getActiveSheet()->mergeCells('A1:F2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->getStyle('A6:J6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6:J6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'DATA PIUTANG')
            // judul atas
            ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetaktunggakan)))
            ->setCellValue('A6', 'No.')
            ->setCellValue('B6', 'Nama')
            ->setCellValue('C6', 'NPWPD')
            ->setCellValue('D6', 'NIOP')
            ->setCellValue('E6', 'Tanggal Pendataan')
            ->setCellValue('F6', 'Jumlah Pajak')
            ->setCellValue('G6', 'Tgl. Pembayaran')
            ->setCellValue('H6', 'Jumlah Pembayaran')
            ->setCellValue('I6', 'Tgl. Jatuh Tempo')
            ->setCellValue('J6', 'Jumlah Tunggakan');
        $counter = 7;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        $total_tunggakan = 0;
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $v['t_nama']);
            $ex->setCellValue("C" . $counter, $v['t_npwpd']);
            $ex->setCellValue("D" . $counter, $v['t_nop']);
            $ex->setCellValue("E" . $counter, date('d-m-Y', strtotime($v['t_tglpendataan'])));
            $ex->setCellValue("F" . $counter, number_format($v['t_jmlhpajak'], 0, ',', '.'));
            $ex->setCellValue("G" . $counter, '-');
            $ex->setCellValue("H" . $counter, 0);
            $ex->setCellValue("I" . $counter, date('d-m-Y', strtotime($v['t_tgljatuhtempo'])));
            $tunggakan = $v['t_jmlhpajak'] - $v['t_jmlhpembayaran'];
            $ex->setCellValue("J" . $counter, $tunggakan);
            $object->getActiveSheet()->getStyle('J' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $counter = $counter + 1;
            $no++;
            $total_tunggakan += $tunggakan;
        }
        //        $ex->setCellValue("C" . $counter, number_format($total_penetapan, 0, ',', '.'));
        //        $ex->setCellValue("D" . $counter, number_format($total_realisasi, 0, ',', '.'));
        $ex->setCellValue("J" . $counter, $total_tunggakan);
        $object->getActiveSheet()->getStyle('J' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('A' . $counter . ':J' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter . ':J' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="datatunggakan.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetakkasharianAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getdataKasHarian($data_get->tglproses, $data_get->idtarget);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglcetak' => $data_get->tglcetak,
            'tglproses' => $data_get->tglproses,
            'ar_pemda' => $ar_pemda,
            'ar_diperiksa' => $ar_diperiksa,
            'ar_mengetahui' => $ar_mengetahui,
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakkasharianexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getdataKasHarian($data_get->tglproses, $data_get->idtarget);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:F6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $object->getActiveSheet()->getStyle('B5')->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        //        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $object->getActiveSheet()->getStyle('C5')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('D5')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('G5')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('G5')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('H')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('H6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('I')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('I6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

        $object->getActiveSheet()->getColumnDimension('A')->setWidth(18);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(65);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(20);

        $object->getActiveSheet()->mergeCells('A1:F2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->mergeCells('A5:A6');
        $object->getActiveSheet()->mergeCells('B5:B6');
        $object->getActiveSheet()->mergeCells('C5:C6');
        $object->getActiveSheet()->mergeCells('D5:F5');
        $object->getActiveSheet()->mergeCells('G5:I5');

        $object->getActiveSheet()->getStyle('A6:I6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A5:I5')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A5:I5')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6:I6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C6')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);

        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'LAPORAN HARIAN BUKU KAS UMUM')
            // judul atas
            ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetak)))
            ->setCellValue('A5', 'Kode Rekening')
            ->setCellValue('B5', 'Jenis Penerimaan')
            ->setCellValue('C5', 'Target Anggaran')
            ->setCellValue('D5', 'Penerimaan')
            ->setCellValue('D6', 's/d Hari lalu')
            ->setCellValue('E6', 'Hari ini')
            ->setCellValue('F6', 's/d Hari ini')
            ->setCellValue('G6', 's/d Hari lalu')
            ->setCellValue('G5', 'Pengeluaran')
            ->setCellValue('H6', 'Hari ini')
            ->setCellValue('I6', 's/d Hari ini');


        $counter = 7;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        $total_target = 0;
        $total_sdharilalu = 0;
        $total_hariini = 0;
        $total_sdhariini = 0;
        $total_sdharilalu_pengeluaran = 0;
        $total_sdhariini_pengeluaran = 0;
        $total_hariini_pengeluaran = 0;
        foreach ($data as $k => $v) {

            $ex->setCellValue("A" . $counter, $v['korek']);
            $ex->setCellValue("B" . $counter, $v['s_namakorek']);
            $ex->setCellValue("C" . $counter, $v['targetjumlah']);
            $ex->setCellValue("D" . $counter, $v['real_sdharilalu']);
            $ex->setCellValue("E" . $counter, $v['real_hariini']);
            $ex->setCellValue("F" . $counter, $v['real_sdhariini']);
            $ex->setCellValue("G" . $counter, $v['pengeluaran_sdharilalu']);
            $ex->setCellValue("H" . $counter, $v['pengeluaran_hariini']);
            $ex->setCellValue("I" . $counter, $v['pengeluaran_sdhariini']);

            $object->getActiveSheet()->getStyle('C' . $counter . ':I' . $counter)->getNumberFormat()->setFormatCode('#,##0');

            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);

            $counter = $counter + 1;
            $total_target += $v['targetjumlah'];
            $total_sdharilalu += $v['real_sdharilalu'];
            $total_hariini += $v['real_hariini'];
            $total_sdhariini += $v['real_sdhariini'];

            $total_sdharilalu_pengeluaran += $v['pengeluaran_sdharilalu'];
            $total_hariini_pengeluaran += $v['pengeluaran_hariini'];
            $total_sdhariini_pengeluaran += $v['pengeluaran_sdhariini'];
            $no++;
        }
        //        die();
        //        $ex->setCellValue("C" . $counter, number_format($total_penetapan, 0, ',', '.'));
        //        $ex->setCellValue("D" . $counter, number_format($total_realisasi, 0, ',', '.'));
        //        $ex->setCellValue("H" . $counter, $total_piutang);
        $ex->setCellValue("C" . $counter, $total_target / 2);
        $ex->setCellValue("D" . $counter, $total_sdharilalu / 2);
        $ex->setCellValue("E" . $counter, $total_hariini / 2);
        $ex->setCellValue("F" . $counter, $total_sdhariini / 2);
        $ex->setCellValue("G" . $counter, $total_sdharilalu_pengeluaran / 2);
        $ex->setCellValue("H" . $counter, $total_hariini_pengeluaran / 2);
        $ex->setCellValue("I" . $counter, $total_sdhariini_pengeluaran / 2);
        $object->getActiveSheet()->getStyle('C' . $counter . ':I' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('A' . $counter . ':I' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter . ':I' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);


        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="laporanharianbku.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetakbppsAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        //        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        //        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getdataBpps($data_get->tgl1, $data_get->tgl2, $data_get->viapembayaran);
        $data2 = $this->Tools()->getService('PembukuanTable')->getdataBpps($data_get->tgl1, $data_get->tgl2, $data_get->viapembayaran);
        $parent_korek = ['namakorek' => [], 'jeniskorek' => []];
        foreach ($data2 as $row) :
            if (!in_array($row['korek_parent'], $parent_korek['namakorek'])) :
                array_push($parent_korek['namakorek'], $row['korek_parent']);
                array_push($parent_korek['jeniskorek'], $row['s_jenisobjek']);
            endif;
        endforeach;
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'parent_korek' => $parent_korek,
            'tgl1' => $data_get->tgl1,
            'tgl2' => $data_get->tgl2,
            'viapembayaran' => $data_get->viapembayaran,
            'ar_pemda' => $ar_pemda,
            'ar_diperiksa' => $ar_diperiksa,
            'ar_mengetahui' => $ar_mengetahui,
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakbppsexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembukuanTable')->getdataBpps($data_get->tgl1, $data_get->tgl2, $data_get->viapembayaran);
        $data2 = $this->Tools()->getService('PembukuanTable')->getdataBpps($data_get->tgl1, $data_get->tgl2, $data_get->viapembayaran);
        $parent_korek = ['namakorek' => [], 'jeniskorek' => []];
        foreach ($data2 as $row) :
            if (!in_array($row['korek_parent'], $parent_korek['namakorek'])) :
                array_push($parent_korek['namakorek'], $row['korek_parent']);
                array_push($parent_korek['jeniskorek'], $row['s_jenisobjek']);
            endif;
        endforeach;
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $object = new \PHPExcel();
        $object->getActiveSheet()->getStyle('A1:F2')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A1:F2')->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $object->getActiveSheet()->getStyle('B5')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('D5')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('F5')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A5')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A3')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

        $object->getActiveSheet()->getColumnDimension('A')->setWidth(5);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(65);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(45);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(22);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(22);

        $object->getActiveSheet()->mergeCells('A1:F2');
        $object->getActiveSheet()->mergeCells('A3:F3');
        //        $object->getActiveSheet()->mergeCells('B3:F3');
        //        $object->getActiveSheet()->mergeCells('B4:F4');
        //        $object->getActiveSheet()->mergeCells('B5:F5');
        //        $object->getActiveSheet()->getStyle('A6:I6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('A5:I5')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('A5:I5')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('A6:I6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('A6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('B5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('B6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('C5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('C5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('C6')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('C6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('D6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('E5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('E6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('F5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('F6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('G6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('H6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('I5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('I5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('I6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $via = [0 => 'BKP & BANK', 1 => 'BKP', 2 => 'BANK'];
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'BUKU PEMBANTU PENERIMAAN SEJENIS VIA: ' . $via[(int) $data_get->viapembayaran])
            ->setCellValue('A2', 'TAHUN ANGGARAN:' . date('Y', strtotime($data_get->tgl1)))
            ->setCellValue('A3', $data_get->tgl1 . ' s/d ' . $data_get->tgl2)
            ->setCellValue('A5', 'No.')
            ->setCellValue('B5', 'Nama Rekening')
            ->setCellValue('C5', 'Tgl. Pembayaran')
            ->setCellValue('D5', 'Nama OPD/Instansi')
            ->setCellValue('E5', 'Keterangan')
            ->setCellValue('F5', 'Jumlah');
        // judul atas




        $counter = 6;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        $total_parent = 0;
        $counter_awal = 6;
        $no_parent = 1;
        foreach ($parent_korek['namakorek'] as $col_parent => $row_parent) :
            $ex->setCellValue("A" . $counter, $no_parent);
            $ex->setCellValue("B" . $counter, $row_parent);
            $no_child = 1;
            $total_child = 0;
            foreach ($data as $row) :
                if ($row['s_jenisobjek'] == $parent_korek['jeniskorek'][$col_parent]) :
                    $counter++;
                    $ex->setCellValue("A" . $counter, $no_parent . '.' . $no_child);
                    $ex->setCellValue("B" . $counter, $row['korek_child']);
                    $ex->setCellValue("C" . $counter, $row['t_tglpembayaran']);
                    $ex->setCellValue("D" . $counter, $row['t_namasatker']);
                    $ex->setCellValue("E" . $counter, $row['t_keterangan']);
                    $ex->setCellValue("F" . $counter, $row['t_jmlhpembayaran']);
                    $object->getActiveSheet()->getStyle('F' . $counter)->getNumberFormat()->setFormatCode('#,##0');
                    $no_child++;
                    $total_child += $row['t_jmlhpembayaran'];
                endif;
            endforeach;
            $counter++;
            $ex->setCellValue("D" . $counter, 'Jumlah ' . $row_parent);
            $ex->setCellValue("F" . $counter, $total_child);
            $object->getActiveSheet()->getStyle('F' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $total_parent += $total_child;
            $counter++;
            $no_parent++;

        endforeach;

        $ex->setCellValue("D" . $counter, 'Jumlah Total');
        $ex->setCellValue("F" . $counter, $total_parent);

        $object->getActiveSheet()->getStyle('F' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        //        
        //        $object->getActiveSheet()->getStyle('A'.$counter_awal.':A'.$counter)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="laporanbpps.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetakbppsrinciAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $rekening = NULL;
        if ($data_get->jenispajak) :
            $rekening = $this->Tools()->getService('RekeningTable')->getRekeningParentByJenis($data_get->jenispajak);
            $anggaran = $this->Tools()->getService('TargetdetailTable')->temukanTargetdetailRekening($data_get->anggaran, $rekening['s_idkorek']);
            $anggaranHeader = $this->Tools()->getService('TargetTable')->getTargetId($data_get->anggaran);
        endif;
        $data = $this->Tools()->getService('PembukuanTable')->getdataBppsRinci($data_get->bulan, $data_get->viapembayaran, $data_get->jenispajak);
        $data_bulanlalu = $this->Tools()->getService('PembukuanTable')->getdataBppsRinciBulanLalu($data_get->bulan, $data_get->viapembayaran, $data_get->jenispajak);
        $data_bulanini = $this->Tools()->getService('PembukuanTable')->getdataBppsRinciBulanIni($data_get->bulan, $data_get->viapembayaran, $data_get->jenispajak);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'bulan' => $data_get->bulan,
            'databulanlalu' => $data_bulanlalu,
            'databulanini' => $data_bulanini,
            'viapembayaran' => $data_get->viapembayaran,
            'ar_pemda' => $ar_pemda,
            'ar_diperiksa' => $ar_diperiksa,
            'ar_mengetahui' => $ar_mengetahui,
            'anggaran' => $anggaran,
            'anggaranheader' => $anggaranHeader,
        ));
        $pdf->setOption("paperSize", "legal-P");
        return $pdf;
    }

    public function cetakbppsrinciexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $rekening = NULL;
        if ($data_get->jenispajak) :
            $rekening = $this->Tools()->getService('RekeningTable')->getRekeningParentByJenis($data_get->jenispajak);
            $anggaran = $this->Tools()->getService('TargetdetailTable')->temukanTargetdetailRekening($data_get->anggaran, $rekening['s_idkorek']);
            $anggaranHeader = $this->Tools()->getService('TargetTable')->getTargetId($data_get->anggaran);
        endif;
        $data = $this->Tools()->getService('PembukuanTable')->getdataBppsRinci($data_get->bulan, $data_get->viapembayaran, $data_get->jenispajak);
        $databulanlalu = $this->Tools()->getService('PembukuanTable')->getdataBppsRinciBulanLalu($data_get->bulan, $data_get->viapembayaran, $data_get->jenispajak);
        $databulanini = $this->Tools()->getService('PembukuanTable')->getdataBppsRinciBulanIni($data_get->bulan, $data_get->viapembayaran, $data_get->jenispajak);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        $object = new \PHPExcel();
        $object->getActiveSheet()->getStyle('A1:E2')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A10:E10')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A1:E2')->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);

        $object->getActiveSheet()->getColumnDimension('A')->setWidth(5);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(45);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(22);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(22);

        $object->getActiveSheet()->mergeCells('A1:E1');
        $object->getActiveSheet()->mergeCells('A2:E2');

        $via = [0 => 'BKP & BANK', 1 => 'BKP', 2 => 'BANK'];
        $abulan = [
            'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Agustus',
            'September',
            'Oktober',
            'November',
            'Desember'
        ];
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'BUKU PEMBANTU')
            ->setCellValue('A2', 'PERINCIAN OBJEK PENERIMAAN')
            ->setCellValue('B5', 'Nama Rekening')
            ->setCellValue('C5', ': ' . strtoupper($anggaran['s_namakorek']))
            ->setCellValue('B6', 'Kode Rekening')
            ->setCellValue('C6', ': ' . str_replace('00', '', str_replace('.', '', $anggaran['korek'])))
            ->setCellValue('B7', 'Jumlah Anggaran')
            ->setCellValue('C7', ': ' . number_format($anggaran['jumlahanggaran'], 0, ',', '.'))
            ->setCellValue('B8', 'Tahun Anggaran')
            ->setCellValue('C8', ': ' . $abulan[$data_get->bulan - 1] . ' ' . $anggaranHeader->s_tahuntarget)
            ->setCellValue('A10', 'No.')
            ->setCellValue('B10', 'No. BKU Penerimaan')
            ->setCellValue('C10', 'Tanggal Setor')
            ->setCellValue('D10', 'No. STS&Buku Penerimaan Lainnya')
            ->setCellValue('E10', 'Jumlah');
        // judul atas




        $counter = 11;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        $totalbayar = 0;
        foreach ($data as $col => $row) :
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("C" . $counter, $row['t_tglpembayaran']);
            $ex->setCellValue("D" . $counter, $row['t_nopembayaran']);
            $ex->setCellValue("E" . $counter, $row['t_jmlhpembayaran']);
            $object->getActiveSheet()->getStyle('E' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $totalbayar += $row['t_jmlhpembayaran'];
            $no++;
            $counter++;
        endforeach;
        $ex->setCellValue("D" . $counter, 'Jumlah Bulan Ini');
        $ex->setCellValue("E" . $counter, $totalbayar);
        $ex->setCellValue("D" . ($counter + 1), 'Jumlah s/d Bulan Lalu');
        $ex->setCellValue("E" . ($counter + 1), $databulanlalu['jumlah']);
        $ex->setCellValue("D" . ($counter + 2), 'Jumlah s/d Bulan Ini');
        $ex->setCellValue("E" . ($counter + 2), $databulanini['jumlah']);
        $object->getActiveSheet()->getStyle('E' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('E' . ($counter + 1))->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('E' . ($counter + 2))->getNumberFormat()->setFormatCode('#,##0');



        //        $ex->setCellValue("D" . $counter, 'Jumlah Total');
        //        $ex->setCellValue("F" . $counter, $total_parent);
        //
        //        $object->getActiveSheet()->getStyle('F' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        ////        
        //        $object->getActiveSheet()->getStyle('A'.$counter_awal.':A'.$counter)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="laporanbppsrinci.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetakbkuAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getdataBKU($data_get->bulan, $data_get->tahun);
        $total = $this->Tools()->getService('PembukuanTable')->getdataBKUTotal($data_get->bulan, $data_get->tahun);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'total' => $total,
            'tglcetak' => $data_get->tglcetak,
            'bulan' => $data_get->bulan,
            'tahun' => $data_get->tahun,
            'ar_pemda' => $ar_pemda,
            'ar_diperiksa' => $ar_diperiksa,
            'ar_mengetahui' => $ar_mengetahui,
        ));
        $pdf->setOption("paperSize", "legal-P");
        return $pdf;
    }

    public function cetakbkuexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getdataBKU($data_get->bulan, $data_get->tahun);
        $total = $this->Tools()->getService('PembukuanTable')->getdataBKUTotal($data_get->bulan, $data_get->tahun);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $object = new \PHPExcel();
        // Add some data
        $bulan_text = [
            "Januari",
            "Februari",
            "Maret",
            "April",
            "Mei",
            "Juni",
            "Juli",
            "Agustus",
            "September",
            "Oktober",
            "November",
            "Desember"
        ];
        $object->getActiveSheet()->getStyle('A1:F2')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A1:F2')->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $object->getActiveSheet()->getStyle('A7:E7')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

        $object->getActiveSheet()->getColumnDimension('A')->setWidth(22);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(65);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(22);

        $object->getActiveSheet()->mergeCells('A1:F2');
        $object->getActiveSheet()->mergeCells('B3:F3');
        $object->getActiveSheet()->mergeCells('B4:F4');
        $object->getActiveSheet()->mergeCells('B5:F5');


        //        $object->getActiveSheet()->getStyle('A6:I6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('A5:I5')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('A5:I5')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('A6:I6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('A6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('B5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('B6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('C5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('C5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('C6')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('C6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('D6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('E5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('E6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('F5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('F6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('G6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('H6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('I5')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('I5')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
        //                ->getActiveSheet()->getStyle('I6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);

        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'BUKU KAS UMUM')
            ->setCellValue('A2', 'Bulan ' . $bulan_text[$data_get->bulan - 1] . ' Tahun ' . $data_get->tahun)
            ->setCellValue('A3', 'SKPD')
            ->setCellValue('B3', ': ' . strtoupper($ar_pemda->s_namainstansi))
            ->setCellValue('A4', 'Pengguna Anggaran')
            ->setCellValue('B4', ': ' . $ar_mengetahui->s_namapej)
            ->setCellValue('A5', 'Bendahara Penerimaan')
            ->setCellValue('B5', ': ' . $ar_diperiksa->s_namapej)
            ->setCellValue('A7', 'Tanggal')
            ->setCellValue('B7', 'Kode Rekening')
            ->setCellValue('C7', 'Nama Rekening')
            ->setCellValue('D7', 'Penerimaan')
            ->setCellValue('E7', 'Pengeluaran');
        // judul atas




        $counter = 8;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        $total_penerimaan = 0;
        $total_penyetoran = 0;
        $counter_awal = 8;
        foreach ($data as $k => $v) {

            $ex->setCellValue("A" . $counter, date('d/m/Y', strtotime($v['tglbayar'])));
            $ex->setCellValue("B" . $counter, $v['korek']);
            $ex->setCellValue("C" . $counter, $v['s_namakorek']);
            $ex->setCellValue("D" . $counter, $v['pembayaran']);
            $ex->setCellValue("E" . $counter, $v['penyetoran']);

            $object->getActiveSheet()->getStyle('D' . $counter . ':E' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            //            
            //            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            //                    ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            //                    ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            //                    ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            //                    ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            //                    ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            //                    ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            //                    ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            //                    ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            //                    ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            //                    
            $counter++;
            $total_penerimaan += $v['pembayaran'];
            $total_penyetoran += $v['penyetoran'];
            $no++;
        }

        $total_sdbulanlalu = 0;
        $total_setor_sdbulanlalu = 0;
        foreach ($total as $kk => $vv) {

            $total_sdbulanlalu += $vv['pembayaran'];
            $total_setor_sdbulanlalu += $vv['penyetoran'];
        }

        $total_sdbulanini_penerimaan = $total_penerimaan + $total_sdbulanlalu;
        $total_sdbulanini_penyetoran = $total_penyetoran + $total_setor_sdbulanlalu;

        $ex->setCellValue("C" . $counter, 'Jumlah Bulan Ini');
        $ex->setCellValue("C" . ($counter + 1), 'Jumlah s/d Bulan Lalu');
        $ex->setCellValue("C" . ($counter + 2), 'Jumlah Semua s/d Bulan Ini');
        $ex->setCellValue("C" . ($counter + 3), 'Sisa Kas');
        $ex->setCellValue("D" . $counter, $total_penerimaan);
        $ex->setCellValue("D" . ($counter + 1), $total_sdbulanlalu);
        $ex->setCellValue("D" . ($counter + 2), $total_sdbulanini_penerimaan);
        $ex->setCellValue("E" . $counter, $total_penyetoran);
        $ex->setCellValue("E" . ($counter + 1), $total_setor_sdbulanlalu);
        $ex->setCellValue("E" . ($counter + 2), $total_sdbulanini_penyetoran);
        $ex->setCellValue("E" . ($counter + 3), ($total_sdbulanini_penerimaan - $total_sdbulanini_penyetoran));

        $object->getActiveSheet()->getStyle('D' . $counter . ':E' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('D' . ($counter + 1) . ':E' . ($counter + 1))->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('D' . ($counter + 2) . ':E' . ($counter + 2))->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('E' . ($counter + 3))->getNumberFormat()->setFormatCode('#,##0');

        $object->getActiveSheet()->getStyle('A' . $counter_awal . ':A' . $counter)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="laporanbku.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetakbppAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getdataBPP($data_get->bulan, $data_get->tahun);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'bulan' => $data_get->bulan,
            'tahun' => $data_get->tahun,
            'ar_pemda' => $ar_pemda,
            'ar_diperiksa' => $ar_diperiksa,
            'ar_mengetahui' => $ar_mengetahui,
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakbppexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getdataBPP($data_get->bulan, $data_get->tahun);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $object = new \PHPExcel();
        $object->getActiveSheet()->getStyle('A1:J2')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('J3')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

        $object->getActiveSheet()->getStyle('J3')->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $object->getActiveSheet()->getStyle('A1:J2')->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $object->getActiveSheet()->getStyle('A4:I4')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

        $object->getActiveSheet()->getColumnDimension('A')->setWidth(5);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(22);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(65);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(22);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(22);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(22);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(22);
        $object->getActiveSheet()->getColumnDimension('J')->setWidth(22);

        $object->getActiveSheet()->mergeCells('A1:J1');
        $object->getActiveSheet()->mergeCells('A2:J2');
        $object->getActiveSheet()->mergeCells('A3:A4');
        $object->getActiveSheet()->mergeCells('B3:F3');
        $object->getActiveSheet()->mergeCells('G3:I3');
        $object->getActiveSheet()->mergeCells('J3:J4');

        $bulan_text = [
            "Januari",
            "Februari",
            "Maret",
            "April",
            "Mei",
            "Juni",
            "Juli",
            "Agustus",
            "September",
            "Oktober",
            "November",
            "Desember"
        ];
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'BUKU PENERIMAAN DAN PENYETORAN')
            ->setCellValue('A2', 'Bulan ' . $bulan_text[$data_get->bulan - 1] . ' Tahun ' . $data_get->tahun)
            ->setCellValue('A3', 'No')
            ->setCellValue('B3', 'PENERIMAAN')
            ->setCellValue('B4', 'Tanggal')
            ->setCellValue('C4', 'Kode Bayar')
            ->setCellValue('D4', 'Kode Rekening')
            ->setCellValue('E4', 'Uraian')
            ->setCellValue('F4', 'Jumlah')
            ->setCellValue('G4', 'Tanggal')
            ->setCellValue('H4', 'No.STS')
            ->setCellValue('I4', 'Jumlah')
            ->setCellValue('G3', 'PENYETORAN')
            ->setCellValue('J3', 'KETERANGAN');
        // judul atas




        $counter = 5;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        $total_penerimaan = 0;
        $total_penyetoran = 0;
        foreach ($data as $k => $v) :
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, date('d/m/Y', strtotime($v['tglbayar'])));
            $ex->setCellValue("C" . $counter, $v['nobukti']);
            $ex->setCellValue("D" . $counter, $v['korek']);
            $ex->setCellValue("E" . $counter, $v['uraian']);
            $ex->setCellValue("F" . $counter, $v['penerimaan']);
            $ex->setCellValue("G" . $counter, ($v['tglsetor'] != NULL) ? date('d/m/Y', strtotime($v['tglsetor'])) : '-');
            $ex->setCellValue("H" . $counter, $v['nosts']);
            $ex->setCellValue("I" . $counter, $v['penyetoran']);
            $object->getActiveSheet()->getStyle('F' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('G' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('I' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $total_penerimaan += $v['penerimaan'];
            $total_penyetoran += $v['penyetoran'];
            $no++;
            $counter++;
        endforeach;

        $ex->setCellValue("E" . $counter, 'Jumlah');
        $ex->setCellValue("E" . ($counter + 1), 'Selisih (Penerimaan - Penyetoran)');
        $ex->setCellValue("F" . $counter, $total_penerimaan);
        $ex->setCellValue("I" . $counter, $total_penyetoran);
        $ex->setCellValue("F" . ($counter + 1), ($total_penerimaan - $total_penyetoran));

        $object->getActiveSheet()->getStyle('F' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('F' . ($counter + 1))->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('I' . $counter)->getNumberFormat()->setFormatCode('#,##0');

        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="laporanbppsrinci.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetakrekapviaAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getdataRekapPenerimaan($data_get->tgl1, $data_get->tgl2, $data_get->viapembayaran);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        $total = 0;
        foreach ($data as $col => $row) :
            $total += $row['jumlah'];
        endforeach;
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'parent_korek' => $parent_korek,
            'total_rekap' => $total,
            'tgl1' => $data_get->tgl1,
            'tgl2' => $data_get->tgl2,
            'viapembayaran' => $data_get->viapembayaran,
            'ar_pemda' => $ar_pemda,
            'ar_diperiksa' => $ar_diperiksa,
            'ar_mengetahui' => $ar_mengetahui,
        ));
        $pdf->setOption("paperSize", "legal-P");
        return $pdf;
    }

    public function cetakrekapviaexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getdataRekapPenerimaan($data_get->tgl1, $data_get->tgl2, $data_get->viapembayaran);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        $total = 0;
        foreach ($data as $col => $row) :
            $total += $row['jumlah'];
        endforeach;
        $object = new \PHPExcel();
        $object->getActiveSheet()->getStyle('A1:D1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('C2:C3')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('A7:D7')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

        $object->getActiveSheet()->getStyle('A1:D1')->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);

        $object->getActiveSheet()->getColumnDimension('A')->setWidth(5);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(65);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(22);
        $object->getActiveSheet()->mergeCells('A1:D1');
        //        $object->getActiveSheet()->mergeCells('A2:D2');


        $via = [0 => 'BKP & BANK', 1 => 'BKP', 2 => 'BANK'];
        $abulan = ['01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'REKAPITULASI PENERIMAAN VIA ' . $via[(int) $data_get->viapembayaran])
            ->setCellValue('A2', 'No...')
            ->setCellValue('C2', 'Bank')
            ->setCellValue('D2', ': ' . $ar_pemda->s_namabank)
            ->setCellValue('C3', 'No.Rek')
            ->setCellValue('D3', ': ' . $ar_pemda->s_norekbank)
            ->setCellValue('A4', 'Harap diterima uang sebesar Rp. ' . number_format($total, 0, ',', '.'))
            ->setCellValue('A5', 'dengan huruf: ' . $this->Tools()->terbilang($total, 3) . ' Rupiah')
            ->setCellValue('A7', 'No')
            ->setCellValue('B7', 'Kode Rekening')
            ->setCellValue('C7', 'Uraian Rincian Objek')
            ->setCellValue('D7', 'Jumlah (Rp.)');
        // judul atas




        $counter = 8;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);

        $total_semua = 0;
        foreach ($data as $col => $row) :
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $row['korek']);
            $ex->setCellValue("C" . $counter, $row['s_namakorek']);
            $ex->setCellValue("D" . $counter, $row['jumlah']);
            $object->getActiveSheet()->getStyle('D' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $total_semua += $row['jumlah'];
            $no++;
            $counter++;
        endforeach;

        $ex->setCellValue("C" . $counter, 'Jumlah');
        $ex->setCellValue("D" . $counter, $total_semua);

        //        
        $object->getActiveSheet()->getStyle('D' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        //        $object->getActiveSheet()->getStyle('F' . ($counter+1))->getNumberFormat()->setFormatCode('#,##0');
        //        $object->getActiveSheet()->getStyle('I' . $counter)->getNumberFormat()->setFormatCode('#,##0');

        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="laporanrekapitulasipenerimaan.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetakspjAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $tglawal = date('01-01-Y', strtotime($data_get->tglcetak));
        $tglakhir = date('d-m-Y', strtotime($data_get->tglcetak));
        // $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        // $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $data = $this->Tools()->getService('PembukuanTable')->getdataRealisasi($tglawal, $tglakhir, $data_get->s_idtarget);
        // $data = $this->Tools()->getService('PembukuanTable')->getdataRealisasi($data_get->tglcetak, $data_get->s_idtarget);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_pejabat0 = $this->Tools()->getService('PejabatTable')->getPejabatId(1);
        $ar_pejabat1 = $this->Tools()->getService('PejabatTable')->getPejabatId(5);

        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'ar_pejabat0' => $ar_pejabat0,
                'ar_pejabat1' => $ar_pejabat1,
                'formatcetak' => $data_get->formatcetak
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'ar_pejabat0' => $ar_pejabat0,
                'ar_pejabat1' => $ar_pejabat1,
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetakspjexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembukuanTable')->getdataRealisasi($data_get->tglcetak, $data_get->s_idtarget);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A6:N7')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('I')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(18);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(40);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('J')->setWidth(30);
        $object->getActiveSheet()->mergeCells('A1:J1');
        $object->getActiveSheet()->mergeCells('A2:J2');
        $object->getActiveSheet()->mergeCells('A3:J3');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->mergeCells('A6:A7');
        $object->getActiveSheet()->mergeCells('B6:B7');
        $object->getActiveSheet()->mergeCells('C6:C7');
        $object->getActiveSheet()->mergeCells('D6:D7');
        $object->getActiveSheet()->mergeCells('E6:G6');
        $object->getActiveSheet()->mergeCells('I6:J6');
        $object->getActiveSheet()->getStyle('A6:J6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6:G6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I6:J6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I6:J6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A7:J7')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('A6:A7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B6:B7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C6:C7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D6:D7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E6:E7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H6:H7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H6:H7')->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J7')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->setActiveSheetIndex(0)
            ->setCellValue('A1', 'LAPORAN PERTANGGUNGJAWABAN BENDAHARA PENERIMAAN SKPD')
            ->setCellValue('A2', '(SPJ - PENDAPATAN - FUNGSIONAL)')
            ->setCellValue('A3', 'Bulan ' . date('m', strtotime($data_get->tglcetak)) . ' Tahun ' . date('Y', strtotime($data_get->tglcetak)))
            // judul atas
            ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetak)))
            ->setCellValue('A6', 'No.')
            ->setCellValue('B6', 'Kode Rekening')
            ->setCellValue('C6', 'Jenis Penerimaan')
            ->setCellValue('D6', 'Target Anggaran')
            ->setCellValue('E6', 'Realisasi')
            ->setCellValue('H6', '%')
            ->setCellValue('I6', 'Selisih')
            // judul bawah
            ->setCellValue('E7', 's/d Bulan Lalu')
            ->setCellValue('F7', 'Bulan ini')
            ->setCellValue('G7', 's/d Bulan ini')
            ->setCellValue('I7', 'Selisih Target')
            ->setCellValue('J7', '%');
        $counter = 8;
        $no = 1;
        $total_target = 0;
        $total_bulanlalu = 0;
        $total_bulanini = 0;
        $total_sdbulanini = 0;
        $total_selisih = 0;
        $ex = $object->setActiveSheetIndex(0);
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $v['korek']);
            $ex->setCellValue("C" . $counter, $v['s_namakorek']);
            $ex->setCellValue("D" . $counter, number_format($v['targetjumlah'], 0, ',', '.'));
            $ex->setCellValue("E" . $counter, number_format($v['real_bulanlalu'], 0, ',', '.'));
            $ex->setCellValue("F" . $counter, number_format($v['real_bulanini'], 0, ',', '.'));
            $ex->setCellValue("G" . $counter, number_format($v['real_sdbulanini'], 0, ',', '.'));
            if ($v['targetjumlah'] != null || $v['targetjumlah'] != 0) {
                $persenreal = $v['real_sdbulanini'] / $v['targetjumlah'] * 100;
            } else {
                $persenreal = 0;
            }
            $ex->setCellValue("H" . $counter, $persenreal);
            $selisih = $v['real_sdbulanini'] - $v['targetjumlah'];
            $ex->setCellValue("I" . $counter, number_format($selisih, 0, ',', '.'));
            if ($v['targetjumlah'] != null || $v['targetjumlah'] != 0) {
                $persenkurang = $selisih / $v['targetjumlah'] * 100;
            } else {
                $persenkurang = 0;
            }
            $ex->setCellValue("J" . $counter, $persenkurang);
            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $counter = $counter + 1;
            $no++;
            $total_target += $v['targetjumlah'];
            $total_bulanlalu += $v['real_bulanlalu'];
            $total_bulanini += $v['real_bulanini'];
            $total_sdbulanini += $v['real_sdbulanini'];
            $total_selisih += $selisih;
        }
        $ex->setCellValue("D" . $counter, number_format($total_target, 0, ',', '.'));
        $ex->setCellValue("E" . $counter, number_format($total_bulanlalu, 0, ',', '.'));
        $ex->setCellValue("F" . $counter, number_format($total_bulanini, 0, ',', '.'));
        $ex->setCellValue("G" . $counter, number_format($total_sdbulanini, 0, ',', '.'));
        $ex->setCellValue("I" . $counter, number_format($total_selisih, 0, ',', '.'));
        $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="cetakrealisasi.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function selectRekeningJenisAction()
    {
        $post = $this->getRequest()->getPost();
        $rekening = $this->Tools()->getService('RekeningTable')->getRekeningSubByJenis($post->jenis);
        $data_rekening = "<select class='form-control' name='korekketset' id='korekketset'>";
        $data_rekening .= "<option value=''>Semua Rekening</option>";
        foreach ($rekening as $row) :
            $data_rekening .= "<option value='" . $row['s_idkorek'] . "'>" . $row['s_namakorek'] . "</option>";
        endforeach;
        $data_rekening .= "</select>";
        $dataToRender = [
            'rekening' => $data_rekening
        ];
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($dataToRender));
    }

    public function selectRekeningJenisTransAction()
    {
        $post = $this->getRequest()->getPost();
        $rekening = $this->Tools()->getService('RekeningTable')->getRekeningSubByJenis($post->jenis);
        $data_rekening = "<select class='form-control' name='korekobjtrans' id='korekobjtrans'>";
        $data_rekening .= "<option value=''>Semua Rekening</option>";
        foreach ($rekening as $row) :
            $data_rekening .= "<option value='" . $row['s_idkorek'] . "'>" . $row['s_namakorek'] . "</option>";
        endforeach;
        $data_rekening .= "</select>";
        $dataToRender = [
            'rekening' => $data_rekening
        ];
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($dataToRender));
    }

    public function selectRekeningJenisDimukaAction()
    {
        $post = $this->getRequest()->getPost();
        $rekening = $this->Tools()->getService('RekeningTable')->getRekeningSubByJenis($post->jenis);
        $data_rekening = "<select class='form-control' name='korekobjdimuka' id='korekobjdimuka'>";
        $data_rekening .= "<option value=''>Semua Rekening</option>";
        foreach ($rekening as $row) :
            $data_rekening .= "<option value='" . $row['s_idkorek'] . "'>" . $row['s_namakorek'] . "</option>";
        endforeach;
        $data_rekening .= "</select>";
        $dataToRender = [
            'rekening' => $data_rekening
        ];
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($dataToRender));
    }

    public function cetakregisterpajakAction()
    {
        $req = $this->getRequest();
        // $data_get = $req->getPost();
        $data_get = $req->getQuery();

        $data = $this->Tools()->getService('PendataanTable')->getDaftarRegisterPajak($data_get['tglinput0'], $data_get['tglinput1'], $data_get['s_idjenis'], $data_get['t_statusbayar']);
        $ar_jenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get['s_idjenis']);
        // var_dump($data_jenis['s_namajenis']); exit();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'data_jenis' => (!empty($data_get['s_idjenis'])) ? $ar_jenis['s_namajenis'] : '',
                'ar_pemda' => $ar_pemda,
                'tglcetak' => $data_get['tglcetak'],
                'tglpencetakan' => $data_get['tglinput0'] . ' s.d. ' . $data_get['tglinput1'],
                'formatcetak' => $data_get->formatcetak,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'data_jenis' => (!empty($data_get['s_idjenis'])) ? $ar_jenis['s_namajenis'] : '',
                'ar_pemda' => $ar_pemda,
                'tglcetak' => $data_get['tglcetak'],
                'tglpencetakan' => $data_get['tglinput0'] . ' s.d. ' . $data_get['tglinput1'],
                'formatcetak' => $data_get->formatcetak,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetakrealisasiperjenisAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembukuanTable')->getdataRealisasiPerjenis($data_get->periode, $data_get->targetanggaran, $data_get->jenispungutan);

        // $data_bphtb = $this->Tools()->getService('BphtbTable')->getRealisasiSdBulanini($data_get->periode);
        $data_pbb = "";
        // $this->Tools()->getService('PbbTable')->getRealisasiPbbTotal($data_get->periode);
        //        var_dump($data_pbb['total_tahunanpbb']); exit();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'real_bphtb' => $data_bphtb['total'],
                'real_pbb' => $data_pbb['total_tahunanpbb'],
                'periode' => $data_get->periode,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'dataget' => $data_get,
                'jenispungutan' => $data_get->jenispungutan,
                'formatcetak' => $data_get->formatcetak
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'real_bphtb' => $data_bphtb['total'],
                'real_pbb' => $data_pbb['total_tahunanpbb'],
                'periode' => $data_get->periode,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'dataget' => $data_get,
                'jenispungutan' => $data_get->jenispungutan,
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetaksetoranlainAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // var_dump($data_get);exit();
        $tglbayar0 = date('Y-m-d', strtotime($data_get->tahunsetoranlain . '-' . $data_get->bulansetoranlain . '-' . '01'));
        $tglbayar1 = date("Y-m-t", strtotime($tglbayar0));
        $dataopd = $this->Tools()->getService('PembukuanTable')->dataopdbyid($data_get->s_idsatker);
        $datatarget = $this->Tools()->getService('PembukuanTable')->datakelompoktarget($data_get->s_idkelompoktarget);
        $datas = $this->Tools()->getService('PembukuanTable')->getdataRealisasiOPD($tglbayar0, $tglbayar1, $data_get->s_idkelompoktarget, $dataopd['s_idsatker']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->pejabatlaplain1);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->pejabatlaplain);
        $tottarget = $this->Tools()->getService('PembukuanTable')->totaltargets($data_get->s_idkelompoktarget);
        $totalbulanini = $this->Tools()->getService('PembukuanTable')->totalbulanini($tglbayar0, $tglbayar1, $dataopd['s_idsatker'], $key['s_idkorek']);
        // foreach ($datatarget as $key ) {

        // $rekening = $this->Tools()->getService('RekeningTable')->getRekeningIdkorek($key['s_idkorek']);
        // $rekeningpokok[] = $this->Tools()->getService('RekeningTable')->getRekeningpokok($rekening['s_tipekorek'],$rekening['s_jeniskorek'],$rekening['s_objekkorek'],$rekening['s_rinciankorek']);

        // }
        // var_dump($tottarget['totaltarget']);exit();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        if ($data_get->formatcetak == '1') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'totalbulanini' => $totalbulanini['bulanini'],
                'tottarget' => $tottarget['totaltarget'],
                // 'rekeningpokok'=>$rekeningpokok,
                'datas' => $datas,
                's_idsatker' => $data_get->s_idsatker,
                'dataopd' => $dataopd,
                'data' => $datatransaksi,
                'bulan' => $data_get->bulansetoranlain,
                'tglcetak' => $data_get->tglcetak,
                'formatcetak' => $data_get->formatcetak,
                'ar_pemda' => $ar_pemda,
                'tahun' => $data_get->tahunsetoranlain,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == '2') {
            $view = new ViewModel(array(
                'totalbulanini' => $totalbulanini['bulanini'],
                'tottarget' => $tottarget['totaltarget'],
                // 'rekeningpokok'=>$rekeningpokok,
                'datas' => $datas,
                's_idsatker' => $data_get->s_idsatker,
                'dataopd' => $dataopd,
                'data' => $datatransaksi,
                'bulan' => $data_get->bulansetoranlain,
                'tglcetak' => $data_get->tglcetak,
                'formatcetak' => $data_get->formatcetak,
                'ar_pemda' => $ar_pemda,
                'tahun' => $data_get->tahunsetoranlain,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function gettargetsatkerAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $datatargetopd = $this->Tools()->getService('TargetTable')->gettargetopdbyidsatker($data_get->s_idsatker);
        $opsi = "";
        $opsi .= "<option value=''>Silahkan Pilih</option>";
        foreach ($datatargetopd as $r) {
            $opsi .= "<option value='" . $r['s_idkelompoktarget'] . "'>" . $r['s_idkelompoktarget'] . " || " . $r['t_namaobjek'] . " (" . $r['s_namatarget'] . ")</option>";
        }

        $data_render = array(
            'opsi' => $opsi
        );

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetaksemuasetoranlainAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // var_dump($data_get);exit();
        $tglbayar0 = date('Y-m-d', strtotime($data_get->tahunsetoranlain . '-' . $data_get->bulansetoranlain . '-' . '01'));
        $tglbayar1 = date("Y-m-t", strtotime($tglbayar0));
        $gettarget = $this->Tools()->getService('PembukuanTable')->getalltargets($data_get->tahunsetoranlain);
        $group = [];
        foreach ($gettarget as $k) {
            // if ($k['s_idsatker']==45){
            $totaltarget = $this->Tools()->getService('PembukuanTable')->totaltarget($k['s_idkelompoktarget']);
            $dataopd = $this->Tools()->getService('PembukuanTable')->dataopdbyid($k['s_idsatker']);
            $datatarget = $this->Tools()->getService('PembukuanTable')->datakelompoktarget($k['s_idkelompoktarget']);
            $totalbulanini = $this->Tools()->getService('PembukuanTable')->totalbulanini($tglbayar0, $tglbayar1, $dataopd['s_idsatker']);

            $totalbulanlalu = $this->Tools()->getService('PembukuanTable')->totalbulanlalu($tglbayar0, $dataopd['s_idsatker'], $data_get->tahunsetoranlain);

            $totalsampaidenganbulanini = $totalbulanlalu['totalbulanlalu'] + $totalbulanini['totalbulanini'];
            $selisihtotal = $totalsampaidenganbulanini - $totaltarget['totaltarget'];

            $persentotal = $totalsampaidenganbulanini / $totaltarget['totaltarget'] * 100;
            $minerbabulanini = $this->Tools()->getService('PembukuanTable')->totaltotalminerbabulanini($tglbayar0, $tglbayar1, $dataopd['s_idsatker']);
            $minerbulanlalu = $this->Tools()->getService('PembukuanTable')->totalminerbabulanlalu($tglbayar0, $dataopd['s_idsatker']);
            // $datatransaksi=[];
            $data = $this->Tools()->getService('PembukuanTable')->datasetoran($tglbayar0, $tglbayar1, $dataopd['s_idsatker'], $data_get->tahunsetoranlain);
            // if (!isset($group[$k['s_idsatker']])) {
            $dataperopd[$k['s_idsatker']] = array(
                //'totalsdgn'=>$totalsdgn,
                'selisihtotal' => $selisihtotal,
                'persentotal' => $persentotal,
                'totalbulanini' => $totalbulanini['totalbulanini'],
                'totalbulanlalu' => $totalbulanlalu['totalbulanlalu'],
                'totalsampaidenganbulanini' => $totalsampaidenganbulanini,
                'datatransaksi' => $data,
                'dataopd' => $dataopd,
                'totaltarget' => $totaltarget['totaltarget'],
                'minerbabulanini' => $minerbabulanini,
                'minerbulanlalu' => $minerbulanlalu

            );
        }
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->pejabatlaplain1);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->pejabatlaplain);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        if ($data_get->formatcetak == '1') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(

                'data' => $dataperopd,
                'bulan' => $data_get->bulansetoranlain,
                'tglcetak' => $data_get->tglcetak,
                'formatcetak' => $data_get->formatcetak,
                'ar_pemda' => $ar_pemda,
                'tahun' => $data_get->tahunsetoranlain,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == '2') {
            $view = new ViewModel(array(
                'data' => $dataperopd,
                'bulan' => $data_get->bulansetoranlain,
                'tglcetak' => $data_get->tglcetak,
                'formatcetak' => $data_get->formatcetak,
                'ar_pemda' => $ar_pemda,
                'tahun' => $data_get->tahunsetoranlain,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }
}
