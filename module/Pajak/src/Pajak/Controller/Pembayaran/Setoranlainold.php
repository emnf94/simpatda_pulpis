<?php

namespace Pajak\Controller\Pembayaran;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Pembayaran\SetoranlainFrm;
use Pajak\Model\Pembayaran\SetoranlainBase;

class Setoranlain extends AbstractActionController {

    public function indexAction() {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_ttd0 as $ar_ttd0) {
            $recordspejabat[] = $ar_ttd0;
        }
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'ar_ttd0' => $recordspejabat,
            'dataobjek' => $recordspajak
        ));
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new SetoranlainBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('SetoranlainTable')->getGridCount($base);
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
        $data = $this->Tools()->getService('SetoranlainTable')->getGridData($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        $via = [1 => 'Bendahara Penerima', 2 => 'Bank/Kasda'];
        $kodebukti = [
            1 => '1 - SKPD',
            2 => '2 - SKR',
            3 => '3 - Surat Setoran',
            4 => '4 - Lain-lain'
        ];
        foreach ($data as $row) {
            $s .= "<tr style='font-size:90%;'>";
            $s .= "<td data-title='No. Setoran'><center style='font-weight:bold'>" . $row['t_nomorurut'] . "</center></td>";
            $s .= "<td data-title='SatKer'><center style='color:red; font-weight:bold'>" . $row['s_kodesatker'] . ' - ' . $row['s_namasatker'] . "</center></td>";
            $s .= "<td data-title='Rekening'><center>" . $row['korek'] . ' - ' . $row['s_namakorek'] . "</center></td>";
            $s .="<td data-title='Rekening'>" . $row['t_keterangan'] ."</td>";
            $s .= "<td data-title='Tanggal Setor' class='text-center'>" . (($row['t_tglsetor'] != NULL) ? date('d-m-Y', strtotime($row['t_tglsetor'])) : '-') . "</td>";
            $s .= "<td data-title='Jumlah Setor' style='text-align: right'>" . number_format($row['t_jumlahsetor'], 0, ',', '.') . "</td>";
            $s .= "<td data-title='Setor Via'>" . $via[$row['t_viasetor']] . "</td>";
            $s .= "<td data-title='Kode Bukti' class='text-right'>" . $kodebukti[$row['t_kodebukti']] . "</td>";
            $s .= "<td data-title='#'><a href='setoranlain/tambah?t_idsetoranlain=" . $row['t_idsetoranlain'] . "' class='btn btn-xs btn-warning'>Edit</a> <a href='javascript:;' onclick='hapus(" . $row['t_idsetoranlain'] . ")' class='btn btn-xs btn-danger'>Hapus</a></td>";
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

    public function tambahAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new SetoranlainFrm();
        if ($this->getRequest()->isGet()):
            $data_setor = $this->Tools()->getService('SetoranlainTable')->getsetoranlainId($this->getRequest()->getQuery()->t_idsetoranlain);
            if ($data_setor['t_idsetoranlain'] != NULL):
                $form->get('t_idsetoranlain')->setValue($data_setor['t_idsetoranlain']);
                $form->get('t_idsatker')->setValue($data_setor['t_idsatker']);
                $form->get('t_idrekening')->setValue($data_setor['t_idrekening']);
                $form->get('t_tahunpajak')->setValue($data_setor['t_tahunpajak']);
                $form->get('t_jumlahsetor')->setValue(number_format($data_setor['t_jumlahsetor'], 0, ',', '.'));
                $form->get('t_tglsetor')->setValue(date('d-m-Y', strtotime($data_setor['t_tglsetor'])));
                $form->get('t_viasetor')->setValue($data_setor['t_viasetor']);
                $form->get('t_kodebukti')->setValue($data_setor['t_kodebukti']);
                $form->get('t_keterangan')->setValue($data_setor['t_keterangan']);
            endif;
        endif;
        if ($this->getRequest()->isPost()) {
            $base = new SetoranlainBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('SetoranlainTable')->simpan($base);
                return $this->redirect()->toRoute('setoranlain');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'data_setor' => $data_setor,
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function hapusAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('SetoranlainTable')->hapus($this->getRequest()->getPost()->id);
        return $this->getResponse();
    }

    public function cetakpembayaranAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('SetoranlainTable')->gePembayaranByTglALL($data_get->tglbayar0, $data_get->tglbayar1);
        // $data = $this->Tools()->getService('SetoranlainTable')->gePembayaranByTglALL($data_get->tglbayar0, $data_get->tglbayar1, $data_get->jenispajak);
        
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        if (empty($data_get->formatcetak)){
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglbayar0' => $data_get->tglbayar0,
            'tglbayar1' => $data_get->tglbayar1,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }else{
             $view = new ViewModel(array(
            'data' => $data,
            'tglbayar0' => $data_get->tglbayar0,
            'tglbayar1' => $data_get->tglbayar1,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda,
            'formatcetak'=> 'excel',
        ));
             $datas = array('nilai' => '3');
             $this->layout()->setVariables($datas);
             return $view;
         }
    }


    public function cetakpembayaranexcelAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembayaranTable')->gePembayaranByTgl($data_get->tglbayar0, $data_get->tglbayar1, $data_get->jenispajak);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1:D5')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:H6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('H')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(20);
        $object->getActiveSheet()->mergeCells('A1:J2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->mergeCells('A5:D5');
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
                ->setCellValue('A1', 'Data Pembayaran')
                // judul atas
                ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetak)))
                ->setCellValue('A5', 'Tanggal Bayar  : ' . date('d-m-Y', strtotime($data_get->tglbayar0)) . ' s/d ' . date('d-m-Y', strtotime($data_get->tglbayar1)))
                ->setCellValue('A6', 'No.')
                ->setCellValue('B6', 'Nama')
                ->setCellValue('C6', 'NPWPD')
                ->setCellValue('D6', 'Nama Objek')
                ->setCellValue('E6', 'NIOP')
                ->setCellValue('F6', 'Jenis Pajak')
                ->setCellValue('G6', 'Tgl. Pembayaran')
                ->setCellValue('H6', 'Jumlah Pembayaran');
        $counter = 7;
        $no = 1;
        $total_pembayaran = 0;
        $ex = $object->setActiveSheetIndex(0);
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $v['t_nama']);
            $ex->setCellValue("C" . $counter, $v['t_npwpd']);
            $ex->setCellValue("D" . $counter, $v['t_namaobjek']);
            $ex->setCellValue("E" . $counter, $v['t_nop']);
            $ex->setCellValue("F" . $counter, $v['s_namajenis']);
            $ex->setCellValue("G" . $counter, date('d-m-Y', strtotime($v['t_tglpembayaran'])));
            $ex->setCellValue("H" . $counter, $v['t_jmlhpembayaran']);
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
            $no++;
            $total_pembayaran += $v['t_jmlhpembayaran'];
        }
        $ex->setCellValue("H" . $counter, $total_pembayaran);
        $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
//        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="cetakpembayaran.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function dataGridRekeningAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        // var_dump($req);exit();   
        $req->isGet();
        $parametercari = $req->getQuery();
        // var_dump($parametercari);exit();
        $base = new \Pajak\Model\Setting\RekeningBase();
        $base->exchangeArray($allParams);
        if ($base->direction == 2)
            $base->page = $base->page + 1;
        if ($base->direction == 1)
            $base->page = $base->page - 1;
        if ($base->page <= 0)
            $base->page = 1;
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('RekeningTable')->getGridCountRekeningSetoranlain($base, $parametercari);
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
        $s = "";
        $data = $this->Tools()->getService('RekeningTable')->getGridDataRekeningSetoranlain($base, $start, $parametercari);
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td>" . $row['korek'] . "</td>";
            $s .= "<td>" . $row['s_namakorek'] . "</td>";
            $s .= "<td>" . $row['s_persentarifkorek'] . "</td>";
            $s .= "<td><a href='#' onclick='pilihRekening(" . $row['s_idkorek'] . ");return false;' class='btn btn-xs btn-primary'><span class='glyph-icon icon-hand-o-up'> Pilih </a></td>";
            $s .= "</tr>";
        }
        $data_render = array(
            "grid" => $s,
            "rows" => 10,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridSatkerAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $req->isGet();
        $parametercari = $req->getQuery();
        $base = new \Pajak\Model\Setting\SatkerBase();
        $base->exchangeArray($allParams);
        if ($base->direction == 2)
            $base->page = $base->page + 1;
        if ($base->direction == 1)
            $base->page = $base->page - 1;
        if ($base->page <= 0)
            $base->page = 1;
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('SatkerTable')->getGridCount($base, $parametercari);
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
        $s = "";
        $data = $this->Tools()->getService('SatkerTable')->getGridData($base, $start, $parametercari);
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td>" . $row['s_kodesatker'] . "</td>";
            $s .= "<td>" . $row['s_namasatker'] . "</td>";
            $s .= "<td><a href='#' onclick='pilihSatker(" . $row['s_idsatker'] . ");return false;' class='btn btn-xs btn-primary'><span class='glyph-icon icon-hand-o-up'> Pilih </a></td>";
            $s .= "</tr>";
        }
        $data_render = array(
            "grid" => $s,
            "rows" => 10,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function pilihRekeningAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataRekening = $this->Tools()->getService('RekeningTable')->getDataRekeningId($data_get['s_idkorek']);
        if ($dataRekening['t_berdasarmasa'] == 'Yes') {
            $t_berdasarmasa = "Berdasar Masa";
        } else {
            $t_berdasarmasa = "Tidak Berdasar Masa";
        }
        // $opsi = "";
        // if ($dataRekening['s_jenisobjek'] == 4) {
        //     $dataReklame = $this->Tools()->getService('ReklameTable')->getDataReklameByIdRekening($data_get['s_idkorek']);
        //     $opsi .= "<option value=''>Silahkan Pilih</option>";
        //     foreach ($dataReklame as $row) {
        //         $opsi .= "<option value='" . $row['s_idreklame'] . "'>" . $row['s_namareklame'] . "</option>";
        //     }
        // }
        $data = array(
            't_idkorek' => $dataRekening['s_idkorek'],
            't_korek' => $dataRekening['korek'],
            't_namakorek' => $dataRekening['s_namakorek'],
            't_tarifpajak' => $dataRekening['s_persentarifkorek'],
            't_tarifdasarkorek' => number_format($dataRekening['s_tarifdasarkorek'], 0, ',', '.'),
            't_jenisreklame' => $opsi,
            't_berdasarmasa' => $t_berdasarmasa,
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function pilihSatkerAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataSatker = $this->Tools()->getService('SatkerTable')->getdataSatkerId($data_get['s_idsatker']);
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($dataSatker));
    }

}
