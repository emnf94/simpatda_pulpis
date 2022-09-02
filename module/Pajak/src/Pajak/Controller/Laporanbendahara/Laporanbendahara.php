<?php

namespace Pajak\Controller\Laporanbendahara;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Laporanbendahara\LaporanbendaharaFrm;
use Pajak\Model\Laporanbendahara\LaporanbendaharaBase;

class Laporanbendahara extends AbstractActionController {

    public function indexAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $s_idjenis = $this->getEvent()->getRouteMatch()->getParam('s_idjenis');
        $jenisobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjekId($s_idjenis);
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            's_idjenis' => $s_idjenis,
            'jenisobjek' => $jenisobjek,
            'ar_ttd0' => $recordspejabat
        ));
        $recordspajak = $this->Tools()->getService('ObjekTable')->getDataObjekLeftMenu($session['s_wp']);
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
        $base = new LaporanbendaharaBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('LaporanbendaharaTable')->getGridCount($base);
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
        $data = $this->Tools()->getService('LaporanbendaharaTable')->getGridData($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. Urut'><center>" . $row['t_nourut'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Tanggal Laporanbendahara'><center>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Pajak' style='color:black; text-align: right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            $t_tglpembayaran = (!empty($row['t_tglpembayaran']) ? date('d-m-Y', strtotime($row['t_tglpembayaran'])) : '-'); // returns true
            $t_jmlhpembayaran = ($row['t_jmlhpembayaran'] != 0 ? number_format($row['t_jmlhpembayaran'], 0, ',', '.') : 'Belum Bayar'); // returns true
            $s .= "<td data-title='Jumlah Pembayaran' style='color:black; text-align: right'>" . $t_tglpembayaran . " / " . $t_jmlhpembayaran . "</td>";
            if (empty($row['t_tglpembayaran'])) {
                $sptpd = "<a href='laporanbendahara/cetaksptpdrestoran?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak SPTPD'><i class='glyph-icon icon-print'></i></a>";
                $kodebayar = "<a href='laporanbendahara/cetakkodebayar?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak Kode Bayar'><i class='glyph-icon icon-print'></i></a>";
                $sspd = "";
            } else {
                $sptpd = "";
                $kodebayar = "";
                $sspd = "<a href='laporanbendahara/cetaksspd?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak SSPD'><i class='glyph-icon icon-print'></i></a>";
            }
            $s .= "<td data-title='#'><center>$sptpd $kodebayar $sspd</center></td>";
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

    public function FormPagedefaultAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new LaporanbendaharaFrm();
        if ($this->getRequest()->isPost()) {
            $base = new LaporanbendaharaBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('LaporanbendaharaTable')->simpankatering($base, $session, $post);
                return $this->redirect()->toRoute("laporanbendahara", array(
                            "controllers" => "Laporanbendahara",
                            "action" => "index"
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $datarek = $this->Tools()->getService('RekeningTable')->getRekeningId(21);
        $datarek->t_idkorek = $datarek->s_idkorek;
        $datarek->t_namakorek = $datarek->s_namakorek;
        $datarek->t_tarifpajak = $datarek->s_persentarifkorek;
        $form->bind($datarek);
        $view = new ViewModel(array(
            'form' => $form
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function hapusAction() {
        /** Hapus Laporanbendahara
         * @param int $s_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('LaporanbendaharaTable')->hapusLaporanbendahara($this->params('s_idkorek'), $session);
        return $this->getResponse();
    }

    public function cetakkodebayarAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
// Mengambil Data WP
        $data = $this->Tools()->getService('PembayaranTable')->getDataPembayaranID($data_get['t_idtransaksi']);

// Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'data' => $data,
            'ar_pemda' => $ar_pemda,
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function cetaksptpdrestoranAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
// Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get->t_idtransaksi);
// Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('PendataanTable')->getDataPendataanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
// Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "legal");
        return $pdf;
    }

    public function hitungpajakAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_dasarpengenaan = str_ireplace(".", "", $data_get['t_dasarpengenaan']);
        $t_jmlhpajak = ($t_dasarpengenaan * $data_get['t_tarifpajak'] / 100);
        $data_render = array(
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridWpAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $req->isGet();
        $parametercari = $req->getQuery();
        $base = new \Pajak\Model\Pendaftaran\PendaftaranBase();
        $base->exchangeArray($allParams);
        if ($base->direction == 2)
            $base->page = $base->page + 1;
        if ($base->direction == 1)
            $base->page = $base->page - 1;
        if ($base->page <= 0)
            $base->page = 1;
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PendaftaranTable')->getGridCountKatering($base, $parametercari);
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
        $data = $this->Tools()->getService('PendaftaranTable')->getGridDataKatering($base, $start, $parametercari);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama WP'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'>" . $row['t_nop'] . "</td>";
            $s .= "<td data-title='Nama OP'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Alamat OP'>" . $row['t_alamatlengkapobjek'] . "</td>";
            $s .= "<td data-title='#'><center><a href='#' onclick='pilihWP(" . $row['t_idobjek'] . ");return false;' class='btn btn-xs btn-danger'><span class='glyph-icon icon-hand-o-up'> Pilih WP</a></center></td>";
            $s .= "</tr>";
            $counter++;
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

    public function pilihWPAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdObjek($data_get['t_idobjek']);
        $datareturn = array(
            't_idobjek' => $data['t_idobjek'],
            't_npwpd' => $data['t_npwpd'],
            't_nama' => $data['t_nama'],
            't_nop' => $data['t_nop'],
            't_namaobjek' => $data['t_namaobjek']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($datareturn));
    }

}
