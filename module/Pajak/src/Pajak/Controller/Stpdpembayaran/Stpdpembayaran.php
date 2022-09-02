<?php

namespace Pajak\Controller\Stpdpembayaran;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Stpdpembayaran\StpdpembayaranFrm;
use Pajak\Model\Stpdpembayaran\StpdpembayaranBase;

class Stpdpembayaran extends AbstractActionController {

    public function indexAction() {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null, $this->Tools()->getService('PendaftaranTable')->getcomboIdTempatUsaha());
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getdata();
        $view = new ViewModel(array(
            'form' => $form,
            'ar_ttd0' => $ar_ttd0
        ));
        $datarekening = $this->Tools()->getService('RekeningTable')->getdataRekening();
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'datarekening' => $datarekening
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridBelumAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new StpdpembayaranBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('StpdpembayaranTable')->getGridCountBelum($base);
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
        $data = $this->Tools()->getService('StpdpembayaranTable')->getGridDataBelum($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No' style='color:black'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='Nomor Urut' style='color:black'><center>" . $row['t_nourut'] . "</center></td>";
            $s .= "<td data-title='Nama' style='color:black'><form method='post' action='pendaftaran/detailpendaftaran' id='formtambah'><input type='hidden' name='id_register' value='" . $row['t_nama'] . "'/> <input value='" . $row['t_nama'] . "' style='border:none; outline:none;' class='btn btn-xs btn-primary' type='submit'> </form></td>";
            $s .= "<td data-title='Alamat Pasar' style='color:black'>" . $row['t_alamatpasar'] . "</td>";
            $s .= "<td data-title='Jenis Tempat' style='color:black'>" . $row['s_namatempat'] . "</td>";
            $s .= "<td data-title='Tanggal Pembayaran' style='color:black'><center>" . date('d-m-Y', strtotime($row['t_tglpembayaran'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Pembayaran Pokok' style='color:black; text-align:right'>" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "</td>";
            $s .= "<td data-title='#'><center><a href='stpdpembayaran/tetapkan?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-check-circle-o'></i> Tetapkan Denda</a></center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginatorbelum($base->rows, $count, $page, $total_pages, $start);
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

    public function dataGridSudahAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new StpdpembayaranBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('StpdpembayaranTable')->getGridCountSudah($base);
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
        $data = $this->Tools()->getService('StpdpembayaranTable')->getGridDataSudah($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No' style='color:black'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='Nomor Urut' style='color:black'><center>" . $row['t_nourut'] . "</center></td>";
            $s .= "<td data-title='Nama' style='color:black'><form method='post' action='pendaftaran/detailpendaftaran' id='formtambah'><input type='hidden' name='id_register' value='" . $row['t_nama'] . "'/> <input value='" . $row['t_nama'] . "' style='border:none; outline:none;' class='btn btn-xs btn-primary' type='submit'> </form></td>";
            $s .= "<td data-title='Alamat Pasar' style='color:black'>" . $row['t_alamatpasar'] . "</td>";
            $s .= "<td data-title='Jenis Tempat' style='color:black'>" . $row['s_namatempat'] . "</td>";
            $s .= "<td data-title='Tanggal Penetapan Denda' style='color:black'><center>" . date('d-m-Y', strtotime($row['t_tgldendapembayaran'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Bulan' style='color:black'>" . $row['t_jmlhbulandendapembayaran'] . "</td>";
            $s .= "<td data-title='Jumlah Denda' style='color:black; text-align: right'>" . number_format($row['t_jmlhdendapembayaran'], 0, ',', '.') . "</td>";
            $hapus = "";
            if ($session['s_akses'] == 2) {
                $hapus = "<a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat' title='Hapus'><i class='glyph-icon icon-trash'></i></a>";
            }
            $s .= "<td data-title='#'><center> <button onclick='bukaCetakSTRD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak STRD'><i class='glyph-icon icon-print'></i></button> $hapus</center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginatorsudah($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridsudah0" => $s,
            "rowssudah0" => $base->rows,
            "countsudah0" => $count,
            "pagesudah0" => $page,
            "startsudah0" => $start,
            "total_halamansudah0" => $total_pages,
            "paginatoresudah0" => $datapaging['paginatore'],
            "akhirdatasudah0" => $datapaging['akhirdata'],
            "awaldatasudah0" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridSudahDibayarkanAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new StpdpembayaranBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('StpdpembayaranTable')->getGridCountSudahDibayarkan($base);
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
        $data = $this->Tools()->getService('StpdpembayaranTable')->getGridDataSudahDibayarkan($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No' style='color:black'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='Nomor Urut' style='color:black'><center>" . $row['t_nourut'] . "</center></td>";
            $s .= "<td data-title='Nama' style='color:black'><form method='post' action='pendaftaran/detailpendaftaran' id='formtambah'><input type='hidden' name='id_register' value='" . $row['t_nama'] . "'/> <input value='" . $row['t_nama'] . "' style='border:none; outline:none;' class='btn btn-xs btn-primary' type='submit'> </form></td>";
            $s .= "<td data-title='Alamat Pasar' style='color:black'>" . $row['t_alamatpasar'] . "</td>";
            $s .= "<td data-title='Alamat Pasar' style='color:black'>" . $row['s_namatempat'] . "</td>";
            $s .= "<td data-title='Tanggal Pembayaran Denda' style='color:black'><center>" . date('d-m-Y', strtotime($row['t_tglbayardenda'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Pembayaran Denda' style='color:black; text-align: right'>" . number_format($row['t_jmlhbayardenda'], 0, ',', '.') . "</td>";
            $s .= "<td data-title='#'><center> <button onclick='bukaCetakSSRD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SSRD Denda'><i class='glyph-icon icon-print'></i></button> <a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyph-icon icon-trash'></i> Hapus</a></center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginatorsudah($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridsudah1" => $s,
            "rowssudah1" => $base->rows,
            "countsudah1" => $count,
            "pagesudah1" => $page,
            "startsudah1" => $start,
            "total_halamansudah1" => $total_pages,
            "paginatoresudah1" => $datapaging['paginatore'],
            "akhirdatasudah1" => $datapaging['akhirdata'],
            "awaldatasudah1" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function tetapkanAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new StpdpembayaranFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapembayaran = $this->Tools()->getService('PembayaranTable')->getPembayaran($id);
            $datapembayaran['t_tgldaftar'] = date('d-m-Y', strtotime($datapembayaran['t_tgldaftar']));
            $data = $this->Tools()->getService('PembayaranTable')->getPembayaranId($id);
            // Perhitungan Denda
            $datadenda = $this->hitungdenda($datapembayaran['t_tglpenetapan'], $datapembayaran['t_jmlhpenetapan'], $datapembayaran['t_tglpembayaran']);
            $data->t_idtransaksi = $id;
            $data->t_tgldendapembayaran = date('d-m-Y');
            $data->t_jmlhbulandendapembayaran = $datadenda['t_jmlhbulandendapembayaran'];
            $data->t_jmlhdendapembayaran = number_format($datadenda['t_jmlhdendapembayaran'], 0, ',', '.');
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new StpdpembayaranBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if (!$form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('StpdpembayaranTable')->simpanpenetapandenda($base, $session);
                return $this->redirect()->toRoute('stpdpembayaran');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapembayaran' => $datapembayaran
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function bayarkanAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new StpdpembayaranFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapenetapandenda = $this->Tools()->getService('StpdpembayaranTable')->getPenetapanDenda($id);
            $datapenetapandenda['t_tgldaftar'] = date('d-m-Y', strtotime($datapenetapandenda['t_tgldaftar']));
            $data = $this->Tools()->getService('StpdpembayaranTable')->getStpdPembayaranId($id);
            $data->t_idtransaksi = $id;
            $data->t_tglbayardenda = date('d-m-Y');
            $data->t_jmlhbayardenda = number_format($datapenetapandenda['t_jmlhdendapembayaran'], 0, ',', '.');
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new StpdpembayaranBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if (!$form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('StpdpembayaranTable')->simpanpembayarandenda($base, $session);
                return $this->redirect()->toRoute('stpdpembayaran');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapenetapandenda' => $datapenetapandenda
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
        /** Hapus Stpdpembayaran
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('StpdpembayaranTable')->hapusStpdpembayaran($this->params('page'), $session);
        return $this->getResponse();
    }

    public function cetakpembayaranAction() {
        /** Cetak Stpdpembayaran
         * @param string $tglcetak Tanggal Mencetak Dokumen
         * @param date('d-m-Y') $tglbayar0 Tanggal Minimal Stpdpembayaran
         * @param date('d-m-Y') $tglbayar1 Tanggal Maximal Stpdpembayaran
         * @param int $t_kecamatan 
         * @param int $t_kelurahan  
         * @param int $t_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('StpdpembayaranTable')->getDataStpdpembayaran($data_get->tglbayar0, $data_get->tglbayar1, $data_get->t_kecamatan, $data_get->t_kelurahan, $data_get->t_idkorek);
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

    public function dataStpdpembayaranAction() {
        /** Mendapatkan Data Stpdpembayaran
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('StpdpembayaranTable')->getDataStpdPembayaranID($data_get['idtransaksi1']);
        $data_render = array(
            "idtransaksi" => $data['t_idtransaksi'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat'],
            "t_tglbayardenda" => date('d-m-Y', strtotime($data['t_tglbayardenda'])),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetakssrdAction() {
        /** Cetak SSRD Denda
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('StpdpembayaranTable')->getDataStpdPembayaranID($data_get['idtransaksi1']);

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function hitungdenda($t_tglpenetapan, $t_jmlhpenetapan, $t_tglpembayaran) {
        $dt1 = date('Y-m-d', strtotime($t_tglpenetapan));
        $dt2 = date('Y-m-d', strtotime($t_tglpembayaran));
        $date1 = new \DateTime($dt1);
        $date2 = new \DateTime($dt2);
        $bulan = $date1->diff($date2)->m;
        $denda = $bulan * 2 * $t_jmlhpenetapan / 100;
        $datadenda = array(
            't_jmlhbulandendapembayaran' => $bulan,
            't_jmlhdendapembayaran' => $denda
        );
        return $datadenda;
    }

}
