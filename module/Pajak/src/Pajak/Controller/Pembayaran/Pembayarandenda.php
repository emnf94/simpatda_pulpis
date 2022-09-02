<?php

namespace Pajak\Controller\Pembayaran;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Pembayaran\PembayarandendaFrm;
use Pajak\Model\Pembayaran\PembayarandendaBase;

class Pembayarandenda extends AbstractActionController
{

    public function indexAction()
    {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        if ($session['s_akses'] != 2 && $session['s_akses'] != 6) {
            return $this->redirect()->toRoute('main');;
        } else {
            $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
            $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
            $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getdata();
            $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
            $recordspejabat = array();
            foreach ($ar_pejabat as $ar_pejabat) {
                $recordspejabat[] = $ar_pejabat;
            }
            $view = new ViewModel(array(
                'form' => $form,
                'ar_ttd0' => $ar_ttd0,
                'ar_pejabat' => $recordspejabat
            ));
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
    }

    public function dataGridBelumAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Pendataan\PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembayarandendaTable')->getGridCountBelum($base);
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
        $data = $this->Tools()->getService('PembayarandendaTable')->getGridDataBelum($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SPTPD/STPD'><center>" . $row['t_nourut'] . "/" . $row['t_nostpd'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Tanggal Pendataan'><center>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</center></td>";
            $s .= "<td data-title='Denda' style='text-align: right'>" . number_format($row['t_jmlhdendapembayaran'], 0, ',', '.') . "</td>";
            $s .= "<td data-title='#'><center><button onclick='bukaCetakSTPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak STPD'><i class='glyph-icon icon-print'></i> STPD</button> <a href='pembayarandenda/form_pembayarandenda?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-dollar'></i> Bayarkan</a></center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridbelum" => $s,
            "rowsbelum" => $base->rows,
            "countbelum" => $count,
            "pagebelum" => $page,
            "startbelum" => $start,
            "total_halamanbelum" => $total_pages,
            "paginatorebelum" => $datapaging['paginatore'],
            "akhirdatabelum" => $datapaging['akhirdata'],
            "awaldatabelum" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridSudahAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new PembayarandendaBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembayarandendaTable')->getGridCountSudah($base);
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
        $data = $this->Tools()->getService('PembayarandendaTable')->getGridDataSudah($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SPTPD/STPD'><center><b style='color:red;'>" . $row['t_nourut'] . "/" . $row['t_nostpd'] . "</b></center></td>";
            $s .= "<td data-title='NPWPD'><center><b style='color:red;'>" . $row['t_npwpd'] . "</b></center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Tgl. Pembayaran Denda'><center>" . date('d-m-Y', strtotime($row['t_tglbayardenda'])) . "</center></td>";
            $s .= "<td data-title='Jml. Pembayaran Denda' style='text-align: right'>" . number_format($row['t_jmlhbayardenda'], 0, ',', '.') . "</td>";
            $hapus = "";
            $operator = "";
            if ($session['s_akses'] == 2) {
                $hapus = "<a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyph-icon icon-trash'></i> Hapus</a>";
                $operator = $row['s_nama'];
            }
            $s .= "<td data-title='#'><center> <button onclick='bukaCetakSSPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SSPD'><i class='glyph-icon icon-print'></i> SSPD </button> $hapus <br>$operator</center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator1($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridsudah" => $s,
            "rowssudah" => $base->rows,
            "countsudah" => $count,
            "pagesudah" => $page,
            "startsudah" => $start,
            "total_halamansudah" => $total_pages,
            "paginatoresudah" => $datapaging['paginatore'],
            "akhirdatasudah" => $datapaging['akhirdata'],
            "awaldatasudah" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function FormPembayarandendaAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PembayarandendaFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapenetapan = $this->Tools()->getService('PenetapanTable')->getPenetapan($id);
            $datapenetapan['t_tgldaftar'] = date('d-m-Y', strtotime($datapenetapan['t_tgldaftar']));
            $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
            $data->t_idtransaksi = $id;
            // denda
            $data->t_jmlhbayardenda = number_format($datapenetapan['t_jmlhdendapembayaran'], 0, ',', '.');
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PembayarandendaBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('PembayarandendaTable')->simpanpembayarandenda($base, $session, $post);
                return $this->redirect()->toRoute('pembayarandenda');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapenetapan' => $datapenetapan
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

    public function hapusAction()
    {
        /** Hapus Pembayarandenda
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('PembayarandendaTable')->hapusPembayarandenda($this->params('page'), $session);
        return $this->getResponse();
    }

    public function cetakpembayaranAction()
    {
        /** Cetak Pembayarandenda
         * @param string $tglcetak Tanggal Mencetak Dokumen
         * @param date('d-m-Y') $tglbayar0 Tanggal Minimal Pembayarandenda
         * @param date('d-m-Y') $tglbayar1 Tanggal Maximal Pembayarandenda
         * @param int $t_kecamatan 
         * @param int $t_kelurahan  
         * @param int $t_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembayarandendaTable')->getPembayaranByTgl($data_get->tglbayar0, $data_get->tglbayar1, $data_get->jenispajak);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
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
    }

    public function cetakpembayaranexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembayarandendaTable')->getPembayaranByTgl($data_get->tglbayar0, $data_get->tglbayar1, $data_get->jenispajak);
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
            ->setCellValue('A1', 'Data Pembayaran Denda')
            // judul atas
            ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetak)))
            ->setCellValue('A5', 'Tanggal Bayar  : ' . date('d-m-Y', strtotime($data_get->tglbayar0)) . ' s/d ' . date('d-m-Y', strtotime($data_get->tglbayar1)))
            ->setCellValue('A6', 'No.')
            ->setCellValue('B6', 'Nama')
            ->setCellValue('C6', 'NPWPD/NPWRD')
            ->setCellValue('D6', 'Nama Objek')
            ->setCellValue('E6', 'NIOP/NIOR')
            ->setCellValue('F6', 'Jenis Pajak/Ret.')
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
            $ex->setCellValue("G" . $counter, date('d-m-Y', strtotime($v['t_tglbayardenda'])));
            $ex->setCellValue("H" . $counter, $v['t_jmlhbayardenda']);
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
            $total_pembayaran += $v['t_jmlhbayardenda'];
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
        header('Content-Disposition: attachment; filename="cetakpembayarandenda.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function dataPembayaranAction()
    {
        /** Mendapatkan Data Pembayarandenda
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PembayarandendaTable')->getDataPembayaranID($data_get['idtransaksi']);
        $data_render = array(
            "idtransaksi" => $data['t_idtransaksi'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat'],
            "tglpembayaran" => date('d-m-Y', strtotime($data['t_tglpembayaran'])),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetaksspdAction()
    {
        /** Cetak SSRD
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PembayarandendaTable')->getDataPembayaranID($data_get['idtransaksi']);
        //        var_dump($data); exit();
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function dataPendataanAction()
    {
        /** Mendapatkan Data Pendataan
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // Mengambil Data WP, OP dan Transaksi
        $data = $this->Tools()->getService('PenagihanTable')->getDataPenagihanID($data_get['idtransaksi']);
        $data_render = array(
            "idtransaksi" => $data['t_idtransaksi'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat'],
            "tglketetapan" => date('d-m-Y', strtotime($data['t_tglpendataan'])),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetakstpdAction()
    {
        /** Cetak SKRD
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PenagihanTable')->getDataPenagihanID($data_get['idtransaksi']);

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }
}
