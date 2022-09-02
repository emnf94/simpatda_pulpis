<?php

namespace Pajak\Controller\Skpdkbt;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Skpdkbt\SkpdkbtFrm;
use Pajak\Model\Skpdkbt\SkpdkbtBase;
use Pajak\Form\Skpdkbt\SkpdkbtPembayaranFrm;
use Pajak\Model\Skpdkbt\SkpdkbtPembayaranBase;

class Skpdkbt extends AbstractActionController {

    public function indexAction() {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getdata();
        $records = array();
        foreach ($ar_ttd0 as $ar_ttd0) {
            $records[] = $ar_ttd0;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'ar_ttd0' => $records
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

    public function dataGridSkpdkbtAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new SkpdkbtBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('SkpdkbtTable')->getGridCountSkpdkbt($base);
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
        $data = $this->Tools()->getService('SkpdkbtTable')->getGridDataSkpdkbt($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SPTPD/SSPD' style='color:black'><center>" . $row['t_nourut'] . "/" . $row['t_nopembayaran'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Tanggal SKPDKBT'><center>" . date('d-m-Y', strtotime($row['t_tglskpdkbt'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Skpdkbt' style='text-align: right'>" . number_format($row['t_totalskpdkbt'], 0, ',', '.') . "</td>";
            $hapus = "";
            if ($session['s_akses'] == 2) {
                $hapus = "<a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat' title='Hapus'><i class='glyph-icon icon-trash'></i></a>";
            }
//            $pembayaran = "<a href='skpdkbt/form_pembayaranskpdkbt?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-dollar'></i> Pembayaran</a> ";
            $s .= "<td data-title='#'><center> <button onclick='bukaCetakSKPDKBT($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SKPDKBT'><i class='glyph-icon icon-print'></i> SKPDKBT </button> $hapus</center></td>";
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

    public function dataGridPembayaranSkpdkbtAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new SkpdkbtBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('SkpdkbtTable')->getGridCountPembayaranSkpdkbt($base);
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
        $data = $this->Tools()->getService('SkpdkbtTable')->getGridDataPembayaranSkpdkbt($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SPTPD/SSPD' style='color:black'><center>" . $row['t_nourut'] . "/" . $row['t_nopembayaran'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Tgl. Pembayaran'><center>" . date('d-m-Y', strtotime($row['t_tglbayarskpdkbt'])) . "</center></td>";
            $s .= "<td data-title='Jml. Pembayaran' style='text-align: right'>" . number_format($row['t_jmlhbayarskpdkbt'], 0, ',', '.') . "</td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator2($base->rows, $count, $page, $total_pages, $start);
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

    public function FormPembayaranskpdkbtAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new SkpdkbtPembayaranFrm();
        // masuk form
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datatransaksi = $this->Tools()->getService('SkpdkbtTable')->getTransaksiSKPDKBTByIdTransaksi($id);
            $datatransaksi['t_tgldaftar'] = date('d-m-Y', strtotime($datatransaksi['t_tgldaftar']));
            $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
            $data->t_idskpdkbt = $datatransaksi['t_idskpdkbt'];
            $data->t_jmlhbayarskpdkbt = number_format($datatransaksi['t_totalskpdkbt'], 0, ',', '.');
            $form->bind($data);
        }
        // simpan data
        if ($this->getRequest()->isPost()) {
            $base = new SkpdkbtPembayaranBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('SkpdkbtTable')->simpanpembayaranskpdkbt($base, $session);
                return $this->redirect()->toRoute('skpdkbt');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datatransaksi' => $datatransaksi
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
        /** Hapus Skpdkbt
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('SkpdkbtTable')->hapusSkpdkbt($this->params('page'), $session);
        return $this->getResponse();
    }

    public function cetakpembayaranAction() {
        /** Cetak Skpdkbt
         * @param string $tglcetak Tanggal Mencetak Dokumen
         * @param date('d-m-Y') $tglbayar0 Tanggal Minimal Skpdkbt
         * @param date('d-m-Y') $tglbayar1 Tanggal Maximal Skpdkbt
         * @param int $t_kecamatan 
         * @param int $t_kelurahan  
         * @param int $t_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('SkpdkbtTable')->getDataSkpdkbt($data_get->tglbayar0, $data_get->tglbayar1, $data_get->t_kecamatan, $data_get->t_kelurahan, $data_get->t_idkorek);
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

    public function dataSkpdkbtAction() {
        /** Mendapatkan Data Skpdkbt
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('SkpdkbtTable')->getTransaksiSKPDKBTByIdTransaksi($data_get['idtransaksi']);
        $data_render = array(
            "idtransaksi" => $data['t_idtransaksi'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat'],
            "tglskpdkbt" => date('d-m-Y', strtotime($data['t_tglskpdkbt'])),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetakskpdkbtAction() {
        /** Cetak SSRD
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('SkpdkbtTable')->getTransaksiSKPDKBTByIdTransaksi($data_get['idtransaksi']);

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

}
