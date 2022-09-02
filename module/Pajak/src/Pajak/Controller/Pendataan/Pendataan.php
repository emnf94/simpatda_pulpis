<?php

namespace Pajak\Controller\Pendataan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Pendataan\PendataanFrm;
use Pajak\Model\Pendataan\PendataanBase;

class Pendataan extends AbstractActionController
{

    public function indexAction()
    {
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
            'ar_ttd0' => $recordspejabat,
            "idjenis" => $this->params('s_idjenis'),
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

    public function menuPajakAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $s_idjenis = $this->getEvent()->getRouteMatch()->getParam('s_idjenis');
        $jenisobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjekId($s_idjenis);
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $jmlpendataan_hotel = $this->Tools()->getService('PendataanTable')->getjmlpendataanHotel();
        $jmlpendataan_Restoran = $this->Tools()->getService('PendataanTable')->getjmlpendataanRestoran();
        $jmlpendataan_hiburan = $this->Tools()->getService('PendataanTable')->getjmlpendataanHiburan();
        $jmlpendataan_reklame = $this->Tools()->getService('PendataanTable')->getjmlpendataanReklame();
        $jmlpendataan_ppj = $this->Tools()->getService('PendataanTable')->getjmlpendataanPpj();
        $jmlpendataan_minerba = $this->Tools()->getService('PendataanTable')->getjmlpendataanMinerba();
        $jmlpendataan_parkir = $this->Tools()->getService('PendataanTable')->getjmlpendataanParkir();
        $jmlpendataan_air = $this->Tools()->getService('PendataanTable')->getjmlpendataanAir();
        $jmlpendataan_walet = $this->Tools()->getService('PendataanTable')->getjmlpendataanWalet();
        $view = new ViewModel(array(
            'datauser' => $session,
            's_idjenis' => $s_idjenis,
            'jenisobjek' => $jenisobjek,
            "idjenis" => $this->params('s_idjenis'),
            'dataobjek' => $recordspajak,
            'jmlpendataan_hotel' => $jmlpendataan_hotel,
            'jmlpendataan_restoran' => $jmlpendataan_Restoran,
            'jmlpendataan_hiburan' => $jmlpendataan_hiburan,
            'jmlpendataan_reklame' => $jmlpendataan_reklame,
            'jmlpendataan_ppj' => $jmlpendataan_ppj,
            'jmlpendataan_minerba' => $jmlpendataan_minerba,
            'jmlpendataan_parkir' => $jmlpendataan_parkir,
            'jmlpendataan_air' => $jmlpendataan_air,
            'jmlpendataan_walet' => $jmlpendataan_walet
        ));

        $data = array(
            'datauser' => $session
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function menuRetribusiAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $s_idjenis = $this->getEvent()->getRouteMatch()->getParam('s_idjenis');
        $jenisobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjekId($s_idjenis);
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $jmlpendataan_ret_kesehatan = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetkesehatan();
        $jmlpendataan_ret_kebersihan = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetkebersihan();
        $jmlpendataan_ret_capil = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetcapil();
        $jmlpendataan_ret_pemakaman = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetpemakaman();
        $jmlpendataan_ret_parkir = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetparkir();
        $jmlpendataan_ret_pasar = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetpasar();
        $jmlpendataan_ret_kendaraan = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetkendaraan();
        $jmlpendataan_ret_pemadam = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetpemadam();
        $jmlpendataan_ret_peta = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetpeta();
        $jmlpendataan_ret_kakus = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetkakus();
        $jmlpendataan_ret_limbahcair = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetlimbahcair();
        $jmlpendataan_ret_teraulang = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetteraulang();
        $jmlpendataan_ret_pendidikan = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetpendidikan();
        $jmlpendataan_ret_menara = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetmenara();
        $jmlpendataan_ret_kekayaan = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetkekayaan();
        $jmlpendataan_ret_pasargrosir = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetpasargrosir();
        $jmlpendataan_ret_pelelangan = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetpelelangan();
        $jmlpendataan_ret_terminal = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetterminal();
        $jmlpendataan_ret_khususparkir = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetkhususparkir();
        $jmlpendataan_ret_villa = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetvilla();
        $jmlpendataan_ret_rmhhewan = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetrmhhewan();
        $jmlpendataan_ret_kepelabuhan = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetkepelabuhan();
        $jmlpendataan_ret_rekreasi = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetrekreasi();
        $jmlpendataan_ret_nyebrangair = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetnyebrangair();
        $jmlpendataan_ret_usaha = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetusaha();
        $jmlpendataan_ret_imb = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetimb();
        $jmlpendataan_ret_alkohol = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetalkohol();
        $jmlpendataan_ret_gangguan = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetgangguan();
        $jmlpendataan_ret_trayek = $this->Tools()->getService('PendataanTable')->getjmlpendataanRettrayek();
        $jmlpendataan_ret_perikanan = $this->Tools()->getService('PendataanTable')->getjmlpendataanRetperikanan();

        $view = new ViewModel(array(
            's_idjenis' => $s_idjenis,
            'jenisobjek' => $jenisobjek,
            "idjenis" => $this->params('s_idjenis'),
            'dataobjek' => $recordspajak,
            'jmlpendataan_ret_kesehatan' => $jmlpendataan_ret_kesehatan,
            'jmlpendataan_ret_kebersihan' => $jmlpendataan_ret_kebersihan,
            'jmlpendataan_ret_capil' => $jmlpendataan_ret_capil,
            'jmlpendataan_ret_pemakaman' => $jmlpendataan_ret_pemakaman,
            'jmlpendataan_ret_parkir' => $jmlpendataan_ret_parkir,
            'jmlpendataan_ret_pasar' => $jmlpendataan_ret_pasar,
            'jmlpendataan_ret_kendaraan' => $jmlpendataan_ret_kendaraan,
            'jmlpendataan_ret_pemadam' => $jmlpendataan_ret_pemadam,
            'jmlpendataan_ret_peta' => $jmlpendataan_ret_peta,
            'jmlpendataan_ret_kakus' => $jmlpendataan_ret_kakus,
            'jmlpendataan_ret_limbahcair' => $jmlpendataan_ret_limbahcair,
            'jmlpendataan_ret_teraulang' => $jmlpendataan_ret_teraulang,
            'jmlpendataan_ret_pendidikan' => $jmlpendataan_ret_pendidikan,
            'jmlpendataan_ret_menara' => $jmlpendataan_ret_menara,
            'jmlpendataan_ret_kekayaan' => $jmlpendataan_ret_kekayaan,
            'jmlpendataan_ret_pasargrosir' => $jmlpendataan_ret_pasargrosir,
            'jmlpendataan_ret_pelelangan' => $jmlpendataan_ret_pelelangan,
            'jmlpendataan_ret_terminal' => $jmlpendataan_ret_terminal,
            'jmlpendataan_ret_khususparkir' => $jmlpendataan_ret_khususparkir,
            'jmlpendataan_ret_villa' => $jmlpendataan_ret_villa,
            'jmlpendataan_ret_rmhhewan' => $jmlpendataan_ret_rmhhewan,
            'jmlpendataan_ret_kepelabuhan' => $jmlpendataan_ret_kepelabuhan,
            'jmlpendataan_ret_rekreasi' => $jmlpendataan_ret_rekreasi,
            'jmlpendataan_ret_nyebrangair' => $jmlpendataan_ret_nyebrangair,
            'jmlpendataan_ret_usaha' => $jmlpendataan_ret_usaha,
            'jmlpendataan_ret_imb' => $jmlpendataan_ret_imb,
            'jmlpendataan_ret_alkohol' => $jmlpendataan_ret_alkohol,
            'jmlpendataan_ret_gangguan' => $jmlpendataan_ret_gangguan,
            'jmlpendataan_ret_trayek' => $jmlpendataan_ret_trayek,
            'jmlpendataan_ret_perikanan' => $jmlpendataan_ret_perikanan

        ));

        $data = array(
            'datauser' => $session
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridWpAction()
    {
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
        $count = $this->Tools()->getService('PendaftaranTable')->getGridCountWp($base, $allParams['s_idjenis'], $post);
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
        $data = $this->Tools()->getService('PendaftaranTable')->getGridDataWp($base, $start, $allParams['s_idjenis'], $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama WP'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'>" . $row['t_nop'] . "</td>";
            $s .= "<td data-title='Nama OP'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Alamat OP'>" . $row['t_alamatobjek'] . "</td>";
            $s .= "<td data-title='Kelurahan OP'>" . $row['s_namakelobjek'] . "</td>";
            $s .= "<td data-title='Kecamatan OP'>" . $row['s_namakecobjek'] . "</td>";
            $s .= "<td data-title='Kecamatan OP'>" . $row['s_namakorek'] . "</td>";
            if ($row['t_status_wp'] == 't') {
                $cetakKartudata = "<button class='btn btn-primary btn-xs btn-flat' type='button' onclick='bukaCetakKartudata($row[t_idobjek])'><span class='glyph-icon icon-print'></span> Kartu Data</button>";
                if ($allParams['s_idjenis'] == 4) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagereklame?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 6) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pageminerba?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 8) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pageair?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 1 || $allParams['s_idjenis'] == 2 || $allParams['s_idjenis'] == 3 || $allParams['s_idjenis'] == 7) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagedefault?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 5) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pageppj?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 9) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagewalet?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 13) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagekebersihan?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 16) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pageparkirtepi?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 17) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagepasar?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 18) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagekir?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 19) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagepemadam?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 23) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pageteraulang?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 25) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagemenara?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 26) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagekekayaandaerah?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 27) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagepasargrosir?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 29) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pageterminal?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 30) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagetempatparkir?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 37) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pageimb?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 39) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pageho?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 40) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagetrayek?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else if ($allParams['s_idjenis'] == 41) {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pageperikanan?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                } else {
                    $s .= "<td data-title='#'><center>" . $cetakKartudata . "<a href='form_pagedefaultret?t_idobjek=$row[t_idobjek]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Pendataan</a></center></td>";
                }
            } else {
                $s .= "<td data-title='#'><center><span class='btn btn-xs btn-flat btn-danger'><i class='glyph-icon icon-minus-circle'></i> OP TUTUP</span></center></td>";
            }
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridwp" => $s,
            "rowswp" => $base->rows,
            "countwp" => $count,
            "pagewp" => $page,
            "startwp" => $start,
            "total_halamanwp" => $total_pages,
            "paginatorewp" => $datapaging['paginatore'],
            "akhirdatawp" => $datapaging['akhirdata'],
            "awaldatawp" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridSudahAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PendataanTable')->getGridCountSudah($base, $allParams['s_idjenis'], $post);
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
        $data = $this->Tools()->getService('PendataanTable')->getGridDataSudah($base, $start, $allParams['s_idjenis'], $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $is_esptpd = ($row['is_esptpd'] != 0 ? '<span class="btn btn-xs btn-success">WP</span><br><b style="color:#db403c">e-SPTPD</b>' : '<span class="btn btn-xs btn-info">' . $ar_pemda->s_namasingkatinstansi . '</span><br><b style="color:#3850b8">SIMPATDA</b>');
            $status_bayar = (!empty($row['t_tglpembayaran'])) ? '<b style="color:GREEN;"><i class="glyph-icon icon-money"></i> LUNAS</b>' : '<b style="color:red;"><i class="glyph-icon icon-money"></i> BELUM </b>';
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SPTPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_nourut'] . "</center></td>";
            $s .= "<td data-title='Tanggal Pendataan'><center>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama WP'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Masa Pajak' class='text-center'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . ' s/d ' . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>";

            $s .= "<td data-title='Nama Rekening'>" . $row['korek'] . "<br>" . $row['s_namakorek'] . "</td>";
            $s .= "<td data-title='Jumlah Pajak' style='color:black; text-align: right'>" . number_format($row['t_jmlhpajak'], 2) . "</td>";
            $s .= "<td data-title='KODE BAYAR' style='text-align: center;color:red;'><b>" . $row['t_kodebayar'] . "</b><BR>" . $status_bayar . "</td>";
            $s .= "<td data-title='Jumlah Pajak' style='text-align: center'>" . $is_esptpd . "</td>";
            $edit = "";
            $hapus = "";
            $operator = "";
            if (empty($row['t_tglpembayaran'])) {
                if ($row['t_jenispajak'] == 4) {
                    $edit = "<a href='form_pagereklameedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat' title='Edit'><i class='glyphicon glyphicon-pencil'></i></a>";
                } elseif ($row['t_jenispajak'] == 6) {
                    $edit = "<a href='form_pageminerbaedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat' title='Edit'><i class='glyphicon glyphicon-pencil'></i></a>";
                } elseif ($row['t_jenispajak'] == 8) {
                    $edit = "<a href='form_pageairedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat' title='Edit'><i class='glyphicon glyphicon-pencil'></i></a>";
                } elseif ($row['t_jenispajak'] == 1 || $row['t_jenispajak'] == 2 || $row['t_jenispajak'] == 3 || $row['t_jenispajak'] == 7) {
                    $edit = "<a href='form_pagedefaultedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat' title='Edit'><i class='glyphicon glyphicon-pencil'></i></a>";
                } elseif ($row['t_jenispajak'] == 5) {
                    $edit = "<a href='form_pageppjedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat' title='Edit'><i class='glyphicon glyphicon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 9) {
                    $edit = "<a href='form_pagewaletedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 13) {
                    $edit = "<a href='form_pagekebersihanedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 16) {
                    $edit = "<a href='form_pageparkirtepiedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 17) {
                    $edit = "<a href='form_pagepasaredit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 18) {
                    $edit = "<a href='form_pagepengujiankendaraanbermotoredit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 19) {
                    $edit = "<a href='form_pagepemadamedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 23) {
                    $edit = "<a href='form_pageteraulangedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 25) {
                    $edit = "<a href='form_pagemenaraedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 26) {
                    $edit = "<a href='form_pagekekayaandaerahedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 27) {
                    $edit = "<a href='form_pagepasargrosiredit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 29) {
                    $edit = "<a href='form_pageterminaledit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 30) {
                    $edit = "<a href='form_pagetempatparkiredit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 37) {
                    $edit = "<a href='form_pageimbedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 39) {
                    $edit = "<a href='form_pagehoedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 40) {
                    $edit = "<a href='form_pagetrayekedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 41) {
                    $edit = "<a href='form_pageperikananedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else if ($row['t_jenispajak'] == 12) {
                    $edit = "<a href='form_pagekesehatanedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i></a>";
                } else {
                    $edit = "<a href='form_pagedefaultretedit?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat' title='Edit'><i class='glyphicon glyphicon-pencil'></i></a>";
                }
                $hapus = "";
                if ($session['s_akses'] == 2) {
                    $hapus = "<a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat' title='Hapus'><i class='glyph-icon icon-trash'></i></a>";
                    $operator = $row['s_nama'];
                }
            }

            if ($row['t_jenispajak'] == 2) {
                $upload = "<a href='uploadfile?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-info btn-xs btn-flat' title='Download File'><b><i class='glyph-icon icon-cloud-download'></i></b></a>";
            } else {
                $upload = "";
            }

            if ($row['s_jenispungutan'] == 'Retribusi') {

                $cetak = "<button onclick='bukaCetakSKRD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SKRD'><i class='glyph-icon icon-print'></i></button>
                          <a href='cetakkodebayar?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak Kode Bayar'><i class='glyph-icon icon-print'></i></a>";
            } elseif ($row['s_jenispungutan'] == 'Pajak') {
                if ($row['t_jenispajak'] == 4 || $row['t_jenispajak'] == 8) {
                    $modelcetak = "<button onclick='bukaCetakSKPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SKPD'><i class='glyph-icon icon-print'></i></button>";
                } else {
                    $modelcetak = "<button onclick='bukaCetakSPTPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SPTPD'><i class='glyph-icon icon-print'></i></button>";
                }

                $cetak = $modelcetak;

                $cetak .= " <a href='cetakkodebayar?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak Kode Bayar'><i class='glyph-icon icon-print'></i></a>";
            }
            $s .= "<td data-title='#'><center> 
                    $upload
                    $cetaksk
                    $cetak
                    $edit
                    $hapus
                    <br>
                    $operator
                    </center></td>";
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
            "awaldatasudah" => $datapaging['awaldata'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridMasahabisAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PendataanTable')->getGridCountMasahabis($base, $allParams['s_idjenis'], $post);
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
        $data = $this->Tools()->getService('PendataanTable')->getGridDataMasahabis($base, $start, $allParams['s_idjenis'], $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. Urut'><center>" . $row['t_nourut'] . "</center></td>";
            $s .= "<td data-title='Tanggal Pendataan'><center>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</center></td>";
            $s .= "<td data-title='NPWPD'><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Masa Pajak'><center>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Pajak' style='color:black; text-align: right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            $s .= "<td data-title='#'><center> <button onclick='bukaCetakHimbauan($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak Himbauan'><i class='glyph-icon icon-print'></i> Himbauan</button></center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator2($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "grid2" => $s,
            "rows2" => $base->rows,
            "count2" => $count,
            "page2" => $page,
            "start2" => $start,
            "total_halaman2" => $total_pages,
            "paginatore2" => $datapaging['paginatore'],
            "akhirdata2" => $datapaging['akhirdata'],
            "awaldata2" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridBelumLaporAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new PendataanBase();
        $base->exchangeArray($allParams);
        $data = $this->Tools()->getService('PendataanTable')->getGridDataBelumLapor($base, $allParams['s_idjenis'], $allParams['page'], $allParams['rows']);
        $s = "";
        $counter = 1;
        $namapajak = '';
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td style='text-align:center'>" . $counter . "</td>";
            $s .= "<td style='text-align:center'><input type='checkbox' name='idobjekdbelumlapor' id='idobjekdbelumlapor' value='" . $row['t_idobjek'] . "'/></td>";
            $s .= "<td style='text-align:center'><b style='color:red; font-size:12px;'>" . $row['t_npwpdwp'] . "</b></td>";
            $s .= "<td>" . $row['t_namawp'] . "</td>";
            $s .= "<td style='text-align:center'>" . $row['t_nop'] . "</td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td>" . $row['t_alamatlengkapobjek'] . "</td>";
            $s .= "<td>" . $row['t_notelpobjek'] . "</td>";
            $s .= "<td>" . $row['t_nohpobjek'] . "</td>";
            $s .= "</tr>";
            $counter++;
            $namapajak = $row['s_namajenis'];
        }

        $s .= "<script type='text/javascript'>
                    $(document).ready(function () {
                        $('.tableBelumLapor tr').click(function (event) {
                            if (event.target.type !== 'checkbox') {
                                $(':checkbox', this).trigger('click');
                            }
                        }); 
                    });
                </script>";
        $htmlcount = '';
        $bulan = (int) $allParams['page'];
        $abulan = ['1' => 'Januari', '2' => 'Februari', '3' => 'Maret', '4' => 'April', '5' => 'Mei', '6' => 'Juni', '7' => 'Juli', '8' => 'Agustus', '9' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
        $htmlcount .= "<b style='color:red; animation: blinker 1s linear infinite;'>" . count($data) . " OP $namapajak Belum Melaporkan SPTPD Pada Masa Pajak " . $abulan[$bulan] . " " . $allParams['rows'] . "</b>";
        $data_render = array(
            "gridbelumlapor" => $s,
            "jumlah" => $htmlcount
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function FormPageinputteguranAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\TeguranlaporanFrm();
        if ($req->isGet()) {
            $idobjek = $req->getQuery()->get('idobjekbelumlapor');
            $bulanmasapajak = $req->getQuery()->get('bulanmasapajak');
            $tahunmasapajak = $req->getQuery()->get('tahunmasapajak');
            $s_idjenis = $req->getQuery()->get('s_idjenis');
            $abulan = ['01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
            $masapajak = $abulan[$bulanmasapajak];

            $datamauditegur = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjekArray($idobjek);
            $maxnoteguran = $this->Tools()->getService('PendaftaranTable')->getNoteguran();
            $noteguran = (int) $maxnoteguran['t_noteguran'] + 1;

            $jenispajak = $this->Tools()->getService('PendaftaranTable')->JenisPajak($s_idjenis);
            //            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new \Pajak\Model\Pendataan\TeguranBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                for ($i = 0; count($post['t_noteguran']) > $i; $i++) {
                    $this->Tools()->getService('TeguranTable')->simpansuratteguran($base, $post, $session, $i);
                }
                return $this->redirect()->toRoute("teguranlaporan", array("controllers" => "Teguranlaporan", "action" => "index"));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datamauditegur' => $datamauditegur,
            'noteguran' => $noteguran,
            'bulanpajak' => $bulanmasapajak,
            'masapajak' => $masapajak,
            'tahunpajak' => $tahunmasapajak,
            'jenispajak' => $jenispajak['s_namajenis']
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }

        $belumditetapkan = $this->Tools()->getService('PenetapanTable')->getBelumDitetapkan();
        $data = array(
            'belumditetapkan' => $belumditetapkan,
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function FormPagedefaultAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PendataanFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];

            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y')));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y')));
            $data->t_tglpendataan = date('d-m-Y');
            if ($datapendataansebelumnya['t_berdasarmasa'] == 'No') {
                $t_berdasarmasa = 'Tidak Berdasar Masa';
            } else {
                $t_berdasarmasa = 'Berdasar Masa';
            }
            if ($datapendataansebelumnya['s_idkorek'] == 34 || $datapendataansebelumnya['s_idkorek'] == '34') {
                $data->t_berdasarmasa = 'Tidak Berdasar Masa';
                $data->t_keterangankatering = $datapendataansebelumnya['t_keterangankatering'];
                $data->t_keterangankatering = $datapendataansebelumnya['t_opdkatering'];
            }
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanPeriodeMax(date('Y'));
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            // var_dump($post);
            //    die();
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());

                if ($post['t_jenispajak'] == 2 || $post['t_berdasarmasa'] == 'Tidak Berdasar Masa') {
                    $sudahditetapkan = null;
                } else {
                    if (!empty($post['t_idtransaksi']))
                        $sudahditetapkan = $this->Tools()->getService('PendataanTable')->getPendataanSeMasa($base, $post["t_idtransaksi"]);
                    else
                        //                         $sudahditetapkan = null;
                        $sudahditetapkan = $this->Tools()->getService('PendataanTable')->getPendataanMasapajakAwal($base);
                }

                if (empty($sudahditetapkan)) {
                    $this->flashMessenger()->addMessage('<div class="alert alert-success"><i class="glyph-icon icon-check-circle"></i> Pendataan Pajak Telah Tersimpan!</div>');
                    
                    $this->Tools()->getService('PendataanTable')->simpanpendataanself($base, $session, $post);
                    return $this->redirect()->toRoute("pendataan", array(
                        "controllers" => "Pendataan",
                        "action" => "index",
                        "page" => $req->getPost()['t_jenisobjekpajak']
                    ));
                } else {
                    $id = $base->t_idobjek;
                    $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);

                    $abulan = array('01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember');
                    $this->flashMessenger()->addMessage('<div class="alert alert-danger"><i class="glyph-icon icon-exclamation-triangle"></i> Data WP [' . $datapendaftaran['t_nama'] . '] untuk Bulan ' . $abulan[date('m', strtotime($base->t_masaawal))] . ' Tahun ' . date('Y', strtotime($base->t_masaawal)) . ' sudah pernah ditetapkan!</div>');
                    return $this->redirect()->toRoute("pendataan", array(
                        "controllers" => "Pendataan",
                        "action" => "index",
                        "page" => $req->getPost()['t_jenisobjekpajak']
                    ));
                }
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }

        $view = new ViewModel(array(
            'form' => $form,

            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            't_berdasarmasa' => $t_berdasarmasa
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

    public function FormPagedefaulteditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PendataanFrm();
        if ($req->isGet()) {
            $message = '';
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_tglpendataan = date('d-m-Y', strtotime($data->t_tglpendataan));
            $data->t_masaawal = date('d-m-Y', strtotime($data->t_masaawal));
            $data->t_masaakhir = date('d-m-Y', strtotime($data->t_masaakhir));
            $data->t_jmlhpajak = number_format($data->t_jmlhpajak, 2, ',', '.');
            $data->t_dasarpengenaan = number_format($data->t_dasarpengenaan, 0, ',', '.');

            $datatransaksi = $this->Tools()->getService('PendataanTable')->getDataPendataanID($id);
            // if ($datapendaftaran['t_jenisobjek'] == 2) {
            //     if ($datatransaksi['s_idkorek'] == 25) {
            //         $t_berdasarmasa = 'Tidak Berdasar Masa';
            //     } else {
            //         $t_berdasarmasa = 'Berdasar Masa';
            //     }
            // } else {
            //     $t_berdasarmasa = null;
            // }
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];
            // if ($datatransaksi['s_idkorek']==34||$datatransaksi['s_idkorek']=='34'){
            // $data->t_berdasarmasa2 = 'Tidak Berdasar Masa';
            $data->t_keterangankatering = $datatransaksi['t_keterangankatering'];
            $data->t_opdkatering = $datatransaksi['t_opdkatering'];
            $data->t_masaawalketering = date('d-m-Y', strtotime($data->t_masaawal));
            $data->t_masaakhirketering = date('d-m-Y', strtotime($data->t_masaakhir));

            // }
            // var_dump($data);exit();
            $form->bind($data);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            't_berdasarmasa' => $t_berdasarmasa
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

    public function FormPageppjAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $id = (int) $req->getQuery()->get('t_idobjek');


        $form = new \Pajak\Form\Pendataan\PendataanppjFrm();

        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $comboKlasifikasi = $this->Tools()->getService('DetailPpjTable')->getcomboIdKlasifikasiedit($datapendaftaran['s_idkorek']);
            $form = new \Pajak\Form\Pendataan\PendataanppjFrm($comboKlasifikasi);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $rekening = $this->Tools()->getService('RekeningTable')->getdataRekeningPPJ();
            $recordsrekening = array();
            foreach ($rekening as $rekening) {
                $recordsrekening[] = $rekening;
            }
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month '));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y') . ' last day of previous month '));
            $data->t_tglpendataan = date('d-m-Y');
            if ($datapendataansebelumnya['t_berdasarmasa'] == 'No') {
                $t_berdasarmasa = 'Tidak Berdasar Masa';
            } else {
                $t_berdasarmasa = 'Berdasar Masa';
            }
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanPeriodeMax(date('Y'));
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $httpadapter = new \Zend\File\Transfer\Adapter\Http();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());


                if (!empty($post['t_idtransaksi'])) :
                    $sudahditetapkan = $this->Tools()->getService('PendataanTable')->getPendataanSeMasa($base, $post["t_idtransaksi"]);
                else :
                    //                     $sudahditetapkan = null;
                    $sudahditetapkan = $this->Tools()->getService('PendataanTable')->getPendataanMasapajakAwal($base);
                endif;

                if (empty($sudahditetapkan)) {
                    //                    $file = $this->params()->fromFiles();
                    $data = $this->Tools()->getService('PendataanTable')->simpanpendataanself($base, $session, $post);
                    $baseppj = new \Pajak\Model\Pendataan\DetailPpjBase();
                    $this->Tools()->getService('DetailPpjTable')->simpanpendataanppj($baseppj, $data, $post);



                    $this->flashMessenger()->addMessage('<div class="alert alert-success"><i class="glyph-icon icon-check-circle"></i> Pendataan Pajak Telah Tersimpan!</div>');
                    return $this->redirect()->toRoute("pendataan", array(
                        "controllers" => "Pendataan",
                        "action" => "index",
                        "page" => $req->getPost()['t_jenisobjekpajak']
                    ));
                } else {
                    $id = $base->t_idobjek;
                    $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);

                    $abulan = array('01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember');
                    $this->flashMessenger()->addMessage('<div class="alert alert-danger"><i class="glyph-icon icon-exclamation-triangle"></i> Data WP [' . $datapendaftaran['t_nama'] . '] untuk Bulan ' . $abulan[date('m', strtotime($base->t_masaawal))] . ' Tahun ' . date('Y', strtotime($base->t_masaawal)) . ' sudah pernah ditetapkan!</div>');
                    return $this->redirect()->toRoute("pendataan", array(
                        "controllers" => "Pendataan",
                        "action" => "index",
                        "page" => $req->getPost()['t_jenisobjekpajak']
                    ));
                }
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            't_berdasarmasa' => $t_berdasarmasa,
            'rekeningppj' => $recordsrekening
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

    public function FormPageppjeditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();

        $form = new \Pajak\Form\Pendataan\PendataanppjFrm();
        if ($req->isGet()) {
            $message = '';
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $rekening_pln = $this->Tools()->getService('RekeningTable')->getdataRekeningPPJ();

            $data->t_tglpendataan = date('d-m-Y', strtotime($data->t_tglpendataan));
            $data->t_masaawal = date('d-m-Y', strtotime($data->t_masaawal));
            $data->t_masaakhir = date('d-m-Y', strtotime($data->t_masaakhir));
            $datatransaksi = $this->Tools()->getService('PendataanTable')->getDataPendataanID($id);
            $detailppj = $this->Tools()->getService('DetailPpjTable')->getDetailByIdTransaksi($id);
            // $lampiranppj_a = $this->Tools()->getService('LampiranPpjTable')->getLampiranByIdTransaksi($id, '1');
            // $lampiranppj_b = $this->Tools()->getService('LampiranPpjTable')->getLampiranByIdTransaksi($id, '2');
            // \var_dump($datatransaksi['t_asallistrik']);

            $comboKlasifikasi = $this->Tools()->getService('DetailPpjTable')->getcomboIdKlasifikasiedit($datatransaksi['s_idkorek']);
            $form = new \Pajak\Form\Pendataan\PendataanppjFrm($comboKlasifikasi);
            $data->t_klasifikasi = $datatransaksi['t_klasifikasi'];
            if ($datatransaksi['t_klasifikasi'] == 1) {
                $data->jumlahbagihasil = $datatransaksi['t_jumlahbagihasil'];
            }
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_asallistrik = $datatransaksi['t_asallistrik'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];
            $form->bind($data);
        }

        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'detailppj' => $detailppj,
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

    public function FormPagereklameAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanreklameFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $datapendaftaran['t_tgldaftar'] = date('d-m-Y', strtotime($datapendaftaran['t_tgldaftar']));
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_tglpendataan = date('d-m-Y');
            $data->t_masaawal = date('d-m-Y', strtotime(date('d-m-Y') . ' first day of previous month'));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('d-m-Y') . ' first day of previous month'));
            $data->t_tglpenetapan = date('d-m-Y', strtotime(date('d-m-Y')));
            $message = '';
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            // $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
            $ar_jenisreklame = $this->Tools()->getService('ReklameTable')->getdata();
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $basedetailreklame = new \Pajak\Model\Pendataan\DetailreklameBase();
            $form->setInputFilter($base->getInputFilter());
            $post = array_merge_recursive($req->getPost()->toArray(), $req->getFiles()->toArray());

            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $basedetailreklame->exchangeArray($form->getData());

                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanofficial($base, $session, $post);

                if (!empty($post['t_rekomendasi']['name'])) {
                    $dir = 'public/upload/rekomendasireklame/' . $dataparent['t_idtransaksi'];
                    if (is_dir($dir) == false) {
                        mkdir("" . $dir . "", 0777, true);       // Create directory if it does not exist
                        copy("/public/.htaccess", $dir);
                        copy("/public/index.html", $dir);
                        // echo("kosong");
                    } else {
                        // echo("ada");
                    }
                    $httpadapter = new \Zend\File\Transfer\Adapter\Http();
                    $httpadapter->setDestination($dir);
                    $httpadapter->receive($post['t_rekomendasi']['name']);
                }

                $this->Tools()->getService('DetailreklameTable')->simpanpendataanreklame($post, $dataparent, $post['t_rekomendasi']['name'], $dir);

                $this->flashMessenger()->addMessage('<div class="alert alert-success"><i class="glyph-icon icon-check-circle"></i> Pendataan Pajak Telah Tersimpan!</div>');
                // $this->flashMessenger()->addMessage('Pendataan Pajak Telah Tersimpan!');
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $view = new ViewModel(array(

            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message
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

    public function FormPagereklameeditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $message = '';
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranReklamebyIdTransaksi($id);

            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_tglpendataan = date('d-m-Y', strtotime($data->t_tglpendataan));
            $data->t_masaawal = date('d-m-Y', strtotime($data->t_masaawal));
            $data->t_masaakhir = date('d-m-Y', strtotime($data->t_masaakhir));
            $data->t_tglpenetapan = date('d-m-Y', strtotime($data->t_tglpenetapan));
            $data->t_jmlhpajak = number_format($data->t_jmlhpajak, 0, ',', '.');
            $data->t_dasarpengenaan = number_format($data->t_dasarpengenaan, 0, ',', '.');
            $data->t_tipewaktu = $datapendaftaran['t_tipewaktu'];
            $data->t_naskah = $datapendaftaran['t_naskah'];
            $data->t_lokasi = $datapendaftaran['t_lokasi'];
            $data->t_rekomendasi = $datapendaftaran['t_suratrekomendasi'] . "/" . $datapendaftaran['t_namafilerekomendasi'];
            $data->t_jenisreklameusaha = $datapendaftaran['t_jenisreklameusaha'];

            $datatransaksi = $this->Tools()->getService('PendataanTable')->getPendataanReklameByIdTransaksi($id);

            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_kelasjalan = $datatransaksi['t_kelasjalan'];


            $datadetail = $this->Tools()->getService('DetailreklameTable')->getDetailReklameByIdTransaksi($id);
            $ar_jenisreklame = $this->Tools()->getService('ReklameTable')->getDataIdKorek($datatransaksi['s_idkorek']);


            $form = new \Pajak\Form\Pendataan\PendataanreklameFrm();
            $form->bind($data);
        }

        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            't_jenisreklame' => $data->t_jenisreklame,
            'ar_jenisreklame' => $ar_jenisreklame,
            'datadetail' => $datadetail
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

    public function getformrekomendasiAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $form = "";
        if ($data_get['t_kelasjalan'] == 5) {
            $form .= "<label class='col-sm-2 control-label'>Surat Rekomendasi</label>
                            <div class='col-sm-6'>
                                <input type='file' id='t_rekomendasi' name='t_rekomendasi' accept='.jpg,.jpeg,.png,.pdf' onchange='ceksize(this)' required>
                            </div>";
        }
        $data = array(
            'form' => $form
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function FormPageparkirAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanparkirFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $rekening = $this->Tools()->getService('RekeningTable')->getdataRekeningParkir();
            $recordsrekening = array();
            foreach ($rekening as $rekening) {
                $recordsrekening[] = $rekening;
            }
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $datapendaftaran['t_tgldaftar'] = date('d-m-Y', strtotime($datapendaftaran['t_tgldaftar']));
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_tglpendataan = date('d-m-Y');
            // $data->t_masaawal = date('d-m-Y', strtotime(date('d-m-Y') . ' first day of previous month'));
            // $data->t_masaakhir = date('d-m-Y', strtotime(date('d-m-Y') . ' last day of previous month'));
            //            $data->t_masaawal = date('01-m-Y');
            //            $data->t_masaakhir = date('01-m-Y');
            $message = '';
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());

                if (!empty($post['t_idtransaksi'])) {
                    $sudahditetapkan = $this->Tools()->getService('PendataanTable')->getPendataanSeMasa($base, $post["t_idtransaksi"]);
                } else {
                    $sudahditetapkan = $this->Tools()->getService('PendataanTable')->getPendataanMasapajakAwal($base);
                }

                if (empty($sudahditetapkan)) {
                    $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanself($base, $session, $post);
                    $this->Tools()->getService('DetailparkirTable')->simpanpendataanparkir($post, $dataparent);

                    $this->flashMessenger()->addMessage('<div class="alert alert-success"><i class="glyph-icon icon-check-circle"></i> Pendataan Pajak Telah Tersimpan!</div>');
                    return $this->redirect()->toRoute("pendataan", array(
                        "controllers" => "Pendataan",
                        "action" => "index",
                        "page" => $req->getPost()['t_jenisobjekpajak']
                    ));
                } else {
                    $id = $base->t_idobjek;
                    $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
                    $abulan = array('01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember');
                    $this->flashMessenger()->addMessage('<div class="alert alert-danger"><i class="glyph-icon icon-exclamation-triangle"></i> Data WP [' . $datapendaftaran['t_nama'] . '] untuk Bulan ' . $abulan[date('m', strtotime($base->t_masaawal))] . ' Tahun ' . date('Y', strtotime($base->t_masaawal)) . ' sudah pernah ditetapkan!</div>');
                    return $this->redirect()->toRoute("pendataan", array(
                        "controllers" => "Pendataan",
                        "action" => "index",
                        "page" => $req->getPost()['t_jenisobjekpajak']
                    ));
                }
            }
        }

        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'ar_ttd0' => $recordspejabat,
            'message' => $message,
            'rekeningparkir' => $recordsrekening
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

    public function FormPageparkireditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanparkirFrm();
        $datadetail = null;
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailparkirTable')->getPendataanParkirByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
            $datadetail = $this->Tools()->getService('DetailparkirTable')->getDetailParkirByIdTransaksi($id);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $rekening = $this->Tools()->getService('RekeningTable')->getdataRekeningParkir();
        $recordsrekening = array();
        foreach ($rekening as $rekening) {
            $recordsrekening[] = $rekening;
        }

        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'datadetail' => $datadetail,
            'rekeningparkir' => $recordsrekening
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

    public function FormPageminerbaAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanminerbaFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);

            $rekening = $this->Tools()->getService('RekeningTable')->getdataRekeningMineral();
            $recordsrekening = array();
            foreach ($rekening as $rekening) {
                $recordsrekening[] = $rekening;
            }


            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $datapendaftaran['t_tgldaftar'] = date('d-m-Y', strtotime($datapendaftaran['t_tgldaftar']));
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_tglpendataan = date('d-m-Y');
            $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month '));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y') . ' last day of previous month '));
            $message = '';
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);

            if ($form->isValid()) {
                $base->exchangeArray($form->getData());

                if (!empty($post['t_idtransaksi'])) {
                    $sudahditetapkan = '';
                    // $this->Tools()->getService('PendataanTable')->getPendataanSeMasa($base, $post["t_idtransaksi"]);
                } else {
                    $sudahditetapkan = '';
                    // $sudahditetapkan = $this->Tools()->getService('PendataanTable')->getPendataanMasapajakAwal($base);
                }

                if (empty($sudahditetapkan)) {
                    $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanself($base, $session, $post);

                    $this->Tools()->getService('DetailminerbaTable')->simpanpendataanminerba($post, $dataparent);
                    $this->flashMessenger()->addMessage('<div class="alert alert-success"><i class="glyph-icon icon-check-circle"></i> Pendataan Pajak Telah Tersimpan!</div>');
                    return $this->redirect()->toRoute("pendataan", array(
                        "controllers" => "Pendataan",
                        "action" => "index",
                        "page" => $req->getPost()['t_jenisobjekpajak']
                    ));
                } else {
                    $id = $base->t_idobjek;
                    $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
                    $abulan = array('01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember');
                    $this->flashMessenger()->addMessage('<div class="alert alert-danger"><i class="glyph-icon icon-exclamation-triangle"></i> Data WP [' . $datapendaftaran['t_nama'] . '] untuk Bulan ' . $abulan[date('m', strtotime($base->t_masaawal))] . ' Tahun ' . date('Y', strtotime($base->t_masaawal)) . ' sudah pernah ditetapkan!</div>');
                    return $this->redirect()->toRoute("pendataan", array(
                        "controllers" => "Pendataan",
                        "action" => "index",
                        "page" => $req->getPost()['t_jenisobjekpajak']
                    ));
                }
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            // 'zonaminerba' => $zonaminerba,
            'rekeningmineral' => $recordsrekening
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
            'dataobjek' => $recordspajak,
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function FormPageminerbaeditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanminerbaFrm();
        $datadetail = null;
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailminerbaTable')->getPendataanMinerbaByIdTransaksi($id);

            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
            $datadetail = $this->Tools()->getService('DetailminerbaTable')->getDetailMinerbaByIdTransaksi($id);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $rekening = $this->Tools()->getService('RekeningTable')->getdataRekeningMineral();
        $recordsrekening = array();
        foreach ($rekening as $rekening) {
            $recordsrekening[] = $rekening;
        }

        $jenis = $this->Tools()->getService('DetailminerbaTable')->getdataJenisMinerba();
        $recordsjenis = array();
        foreach ($jenis as $jenis) {
            $recordsjenis[] = $jenis;
        }

        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'datadetail' => $datadetail,
            'rekeningmineral' => $recordsrekening,
            'rekeningsub' => $recordsjenis

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

    public function FormPageairAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();

        $form = new \Pajak\Form\Pendataan\PendataanairFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $datapendaftaran['t_tgldaftar'] = date('d-m-Y', strtotime($datapendaftaran['t_tgldaftar']));
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnyaABT($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $data->t_tglpendataan = date('d-m-Y');
            $data->t_masaawal = (!empty($datapendataansebelumnya['t_masaawal'])) ? date('d-m-Y', strtotime($datapendataansebelumnya['t_masaawal'] . ' first day of next month ')) : date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month'));
            $data->t_masaakhir = (!empty($datapendataansebelumnya['t_masaakhir'])) ? date('d-m-Y', strtotime($datapendataansebelumnya['t_masaakhir'] . ' last day of next month ')) : date('d-m-Y', strtotime(date('t-m-Y') . 'last day of previous month'));
            $data->t_tglpenetapan = date('d-m-Y');

            $datakompensasi = $this->Tools()->getService('PendataanTable')->getKompensasi($datapendaftaran['t_idobjek'], $datapendaftaran['t_jenisobjek']);
            $data->t_kompensasi = number_format($datakompensasi['t_restitusi'], 0, ',', '.');
            $data->t_idkeberatan = $datakompensasi['t_idkeberatan'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $basedetailair = new \Pajak\Model\Pendataan\DetailairBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $basedetailair->exchangeArray($form->getData());

                if (!empty($post['t_idtransaksi'])) {
                    $sudahditetapkan = $this->Tools()->getService('PendataanTable')->getPendataanSeMasa($base, $post["t_idtransaksi"]);
                } else {
                    $sudahditetapkan = $this->Tools()->getService('PendataanTable')->getPendataanMasapajakAwal($base);
                }

                if (empty($sudahditetapkan)) {
                    $data = $this->Tools()->getService('PendataanTable')->simpanpendataanofficial($base, $session, $post);
                    $this->Tools()->getService('DetailairTable')->simpanpendataanair($basedetailair, $data);

                    $this->flashMessenger()->addMessage('<div class="alert alert-success"><i class="glyph-icon icon-check-circle"></i> Pendataan Pajak Telah Tersimpan!</div>');
                    return $this->redirect()->toRoute("pendataan", array(
                        "controllers" => "Pendataan",
                        "action" => "index",
                        "page" => $req->getPost()['t_jenisobjekpajak']
                    ));
                } else {
                    $id = $base->t_idobjek;
                    $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);

                    $abulan = array('01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember');
                    $this->flashMessenger()->addMessage('<div class="alert alert-danger"><i class="glyph-icon icon-exclamation-triangle"></i> Data WP [' . $datapendaftaran['t_nama'] . '] untuk Bulan ' . $abulan[date('m', strtotime($base->t_masaawal))] . ' Tahun ' . date('Y', strtotime($base->t_masaawal)) . ' sudah pernah ditetapkan!</div>');
                    return $this->redirect()->toRoute("pendataan", array(
                        "controllers" => "Pendataan",
                        "action" => "index",
                        "page" => $req->getPost()['t_jenisobjekpajak']
                    ));
                }
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message
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

    public function FormPageaireditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        // $cmbUkuranpipa = $this->Tools()->getService('AirTable')->getcomboIdPipa();
        // $cmbKodekelompok = $this->Tools()->getService('AirTable')->getcomboIdKodekelompok();
        $form = new \Pajak\Form\Pendataan\PendataanairFrm();
        $datadetail = null;
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);

            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailairTable')->getPendataanairByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_tglpenetapan = date('d-m-Y', strtotime($datatransaksi['t_tglpenetapan']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $data->t_hargadasarair = number_format($datatransaksi['s_tarifdasarkorek'], 0, ',', '.');
            $datadetail = $this->Tools()->getService('DetailairTable')->getDetailAirByIdTransaksi($id);


            $data->t_jmlhpajakasli = number_format($datatransaksi['t_jmlhpajakasli'], 0, ',', '.');
            $data->t_kompensasi = number_format($datatransaksi['t_kompensasi'], 0, ',', '.');

            $data->t_idair = $datadetail['t_idair'];
            $data->t_volumem3 = number_format($datadetail['t_volume'], 0, ',', '.');
            $data->t_volume = $datadetail['t_volume'];

            $data->t_lamawaktu = $datadetail['t_lamawaktu'];


            $data->t_debitair = $datadetail['t_debitair'];
            $data->t_kualitasair = $datadetail['t_kualitasair'];
            $data->t_totalbiaya = number_format($datadetail['t_totalbiaya'], 0, ",", ".");
            $data->t_peruntukan = $datadetail['t_peruntukan'];
            $form->bind($data);
        }

        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }

        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagewaletAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanwaletFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $datapendaftaran['t_tgldaftar'] = date('d-m-Y', strtotime($datapendaftaran['t_tgldaftar']));
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            $data->t_masaawal = date('d-m-Y');
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];


            $data->t_tarifdasar = number_format($datapendataansebelumnya['t_tarifdasar'], 0, ',', '.');
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanPeriodeMax(date('Y'));
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $data->t_tglpendataan = date('d-m-Y');

            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);

            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $sudahditetapkan = (!empty($post['t_idtransaksi'])) ? $this->Tools()->getService('PendataanTable')->getPendataanSeMasa($base, $post["t_idtransaksi"]) : null;
                if (empty($sudahditetapkan)) {
                    $data = $this->Tools()->getService('PendataanTable')->simpanpendataanwalet($base, $session, $post);
                    $this->Tools()->getService('PendataanTable')->simpandetailwalet($base, $session, $post, $data);
                    $this->flashMessenger()->addMessage('Pendataan Pajak Telah Tersimpan!');
                    return $this->redirect()->toRoute("pendataan", array(
                        "controllers" => "Pendataan",
                        "action" => "index",
                        "page" => $req->getPost()['t_jenisobjekpajak']
                    ));
                } else {
                    $id = $base->t_idobjek;
                    $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
                    $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranId($id);
                    $datapendaftaran['t_tgldaftar'] = date('d-m-Y', strtotime($datapendaftaran['t_tgldaftar']));
                    $data->t_tglpendataan = date('d-m-Y');
                    $data->t_idwp = $datapendaftaran['t_idwp'];
                    $message = 'Data WP untuk bulan ' . date('m', strtotime($base->t_masaawal)) . ' tahun ' . date('Y', strtotime($base->t_masaawal)) . ' sudah pernah ditetapkan';
                    $form->bind($data);
                }
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagewaleteditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanwaletFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_tarifdasarkorek = number_format($data->t_tarifdasarkorek, 0, ',', '.');
            $data->t_dasarpengenaan = number_format($data->t_dasarpengenaan, 0, ',', '.');
            $message = '';

            $datatransaksi = $this->Tools()->getService('PendataanTable')->getDataPendataanID($id);

            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');

            $datawalet = $this->Tools()->getService('PendataanTable')->getPendataanWalet($id);
            // var_dump($datawalet);
            // exit();
            $data->t_hargapasar = $datawalet['t_hargapasar'];
            $data->t_volume = $datawalet['t_volume'];

            $form->bind($data);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }

        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    // FORM RETRIBUSI
    /**
     * author : Roni Mustapa
     * email : ronimustapa@gmail.com
     * created : 09/04/2019
     */
    public function FormPagedefaultretAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataandefaultretFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            // var_dump($post);exit();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailretribusiTable')->simpandetailretribusi($post, $dataparent);
                // var_dump($coba);exit();
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $ar_tarif = $this->Tools()->getService('DetailparkirtepiTable')->getdataTarifParkir();
        $recordstarif = array();
        foreach ($ar_tarif as $ar_tarif) {
            $recordstarif[] = $ar_tarif;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'data_tarif' => $recordstarif
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

    public function FormPageparkirtepiAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataandefaultretFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                // var_dump($post);exit();
                $this->Tools()->getService('DetailparkirtepiTable')->simpandetailparkirtepi($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $ar_tarif = $this->Tools()->getService('DetailparkirtepiTable')->getdataTarifParkir();
        $recordstarif = array();
        foreach ($ar_tarif as $ar_tarif) {
            $recordstarif[] = $ar_tarif;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'data_tarif' => $recordstarif
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

    public function FormPagekirAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataandefaultretFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            // var_dump($post);exit();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailkirTable')->simpandetailretribusi($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $ar_tarif = $this->Tools()->getService('DetailkirTable')->getdataTarif();
        $recordstarif = array();
        foreach ($ar_tarif as $ar_tarif) {
            $recordstarif[] = $ar_tarif;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'data_tarif' => $recordstarif
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

    public function FormPagepemadamAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanpemadamFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $tarif = $this->Tools()->getService('DetailpemadamTable')->getdataTarifPemadam();
            $recordstarif = array();
            foreach ($tarif as $tarif) {
                $recordstarif[] = $tarif;
            }
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month '));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y') . ' last day of previous month '));
            $data->t_tglpenetapan = date('d-m-Y');
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailpemadamTable')->simpandetailpemadam($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'jenistarif' => $recordstarif
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

    public function FormPageteraulangAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanteraFrm();
        if ($req->isGet()) {
            $id = $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $tarif = $this->Tools()->getService('DetailteraTable')->getdataTarifTera();
            $recordstarif = array();
            foreach ($tarif as $tarif) {
                $recordstarif[] = $tarif;
            }
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month '));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y') . ' last day of previous month '));
            $data->t_tglpenetapan = date('d-m-Y');
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailteraTable')->simpanpendataantera($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'jenistarif' => $recordstarif
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

    public function FormPagemenaraAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PendataanFrm();
        //        $form = new \Pajak\Form\Pendataan\PendataanmenaraFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            //            $data->t_tarifdasar = $datapendataansebelumnya['s_tarifdasarkorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month '));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y') . ' last day of previous month '));
            $data->t_tglpenetapan = date('d-m-Y');
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                //                    $this->Tools()->getService('DetailmenaraTable')->simpandetailmenara($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
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

    public function FormPagekekayaandaerahAction()
    {

        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataankekayaandaerahFrm();

        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);

            $datakekayaan = $this->Tools()->getService('DetailkekayaanTable')->getdataJeniskekayaan();
            $recordsjenis = array();
            foreach ($datakekayaan as $datakekayaan) {
                $recordsjenis[] = $datakekayaan;
            }

            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = strtoupper($datapendataansebelumnya['s_namakorek']);
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailkekayaanTable')->simpandetail($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }

        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'jenislayanan' => $recordsjenis
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


    public function FormPagekebersihanAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $comboKlasifikasi = $this->Tools()->getService('DetailkebersihanTable')->getcomboIdKlasifikasi();
        // var_dump($comboKlasifikasi); exit();
        $form = new \Pajak\Form\Pendataan\PendataankebersihanFrm($comboKlasifikasi);
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                // var_dump($dataparent); exit();
                $this->Tools()->getService('DetailkebersihanTable')->simpandetailkebersihan($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagepasarAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $comboKlasifikasi = $this->Tools()->getService('DetailpasarTable')->getcomboIdKlasifikasi();
        // var_dump($comboKlasifikasi); exit();
        $form = new \Pajak\Form\Pendataan\PendataanpasarFrm($comboKlasifikasi);
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month '));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y') . ' last day of previous month '));
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }

        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                // var_dump($dataparent); exit();
                $this->Tools()->getService('DetailpasarTable')->simpandetailpasar($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagepasargrosirAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $comboKlasifikasi = $this->Tools()->getService('DetailpasargrosirTable')->getcomboIdKlasifikasi();
        // var_dump($comboKlasifikasi); exit();
        $form = new \Pajak\Form\Pendataan\PendataanpasargrosirFrm($comboKlasifikasi);
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                // var_dump($dataparent); exit();
                $this->Tools()->getService('DetailpasargrosirTable')->simpandetailpasargrosir($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagetempatparkirAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $comboJeniskendaraan = $this->Tools()->getService('DetailtempatparkirTable')->getcomboIdJeniskendaraan();
        // var_dump($comboKlasifikasi); exit();
        $form = new \Pajak\Form\Pendataan\PendataantempatparkirFrm($comboJeniskendaraan);
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                // var_dump($dataparent); exit();
                $this->Tools()->getService('DetailtempatparkirTable')->simpandetailtempatparkir($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPageterminalAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataandefaultretFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                // var_dump($post);exit();
                $this->Tools()->getService('DetailterminalTable')->simpandetailterminal($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $ar_jenispel = $this->Tools()->getService('DetailterminalTable')->getdataJenis();
        $recordsjenispel = array();
        foreach ($ar_jenispel as $ar_jenispel) {
            $recordsjenispel[] = $ar_jenispel;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'data_jenispel' => $recordsjenispel
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

    public function FormPageimbAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $imb_luas = $this->Tools()->getService('DetailimbTable')->getcomboIdImbluas();
        $imb_lantai = $this->Tools()->getService('DetailimbTable')->getcomboIdImblantai();
        $imb_gunabgn = $this->Tools()->getService('DetailimbTable')->getcomboIdImbgunabgn();
        $imb_lokasi = $this->Tools()->getService('DetailimbTable')->getcomboIdImblokasi();
        $imb_kondisi = $this->Tools()->getService('DetailimbTable')->getcomboIdImbkondisi();
        $form = new \Pajak\Form\Pendataan\PendataanimbFrm($imb_luas, $imb_lantai, $imb_gunabgn, $imb_lokasi, $imb_kondisi);
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month '));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y') . ' last day of previous month '));
            $data->t_tglpendataan = date('d-m-Y');
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailimbTable')->simpandetailimb($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        // $tarifdasar = $this->Tools()->getService('DetailimbTable')->getDataIdTarif(1);
        // var_dump($tarifdasar);exit();
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagehoAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $ho_kolasi = $this->Tools()->getService('DetailhoTable')->getcomboIdHolokasi();
        $recordskolasi = array();
        foreach ($ho_kolasi as $ho_kolasi) {
            $recordskolasi[] = $ho_kolasi;
        }
        $ho_gangguan = $this->Tools()->getService('DetailhoTable')->getcomboIdHogangguan();
        $ho_skala = $this->Tools()->getService('DetailhoTable')->getcomboIdHoskala();
        $form = new \Pajak\Form\Pendataan\PendataanhoFrm($ho_kolasi, $ho_gangguan, $ho_skala);
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month '));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y') . ' last day of previous month '));
            $data->t_tglpendataan = date('d-m-Y');
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailhoTable')->simpandetailho($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'datakolasi' => $recordskolasi,
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

    public function FormPagetrayekAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataantrayekFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month '));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y') . ' last day of previous month '));
            $data->t_tglpendataan = date('d-m-Y');
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            // var_dump($post);exit();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailtrayekTable')->simpandetailretribusi($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $ar_tarif = $this->Tools()->getService('DetailtrayekTable')->getdataTarif();
        $recordstarif = array();
        foreach ($ar_tarif as $ar_tarif) {
            $recordstarif[] = $ar_tarif;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'datatarif' => $recordstarif
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

    //     public function FormPagetrayekAction() {
    //         $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
    //         $req = $this->getRequest();
    //         $form = new \Pajak\Form\Pendataan\PendataantrayekFrm();
    //         if ($req->isGet()) {
    //             $id = (int) $req->getQuery()->get('t_idobjek');
    //             $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
    //             $tarif = $this->Tools()->getService('DetailtrayekTable')->getdataTarif();
    //             $recordstarif = array();
    //             foreach ($tarif as $tarif) {
    //                 $recordstarif[] = $tarif;
    //             }

    //             $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
    //             $data->t_idobjek = $datapendaftaran['t_idobjek'];
    //             $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
    //             $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
    //             $message = '';
    // //jika pernah melakukan pendataan sebelumnya
    //             $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
    //             $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
    //             $data->t_korek = $datapendataansebelumnya['korek'];
    //             $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
    //             $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
    //             $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month '));
    //             $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y') . ' last day of previous month '));
    //             $data->t_tglpendataan = date('d-m-Y');
    //             $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
    //             $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
    //             $form->bind($data);
    //         }
    //         if ($this->getRequest()->isPost()) {
    //             $base = new PendataanBase();
    //             $form->setInputFilter($base->getInputFilter());
    //             $post = $req->getPost()->toArray();
    //             // var_dump($post);exit();
    //             $form->setData($post);
    //             // var_dump($form);exit();
    //             if ($form->isValid()) {
    //                 $base->exchangeArray($form->getData());

    //                 $dataparent = 
    //                 $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
    //                 // var_dump($dataparent);exit();
    //                 $this->Tools()->getService('DetailtrayekTable')->simpandetailretribusi($post, $dataparent);
    //                 // var_dump($coba);exit();
    //                 return $this->redirect()->toRoute("pendataan", array(
    //                             "controllers" => "Pendataan",
    //                             "action" => "index",
    //                             "page" => $req->getPost()['t_jenisobjekpajak']
    //                 ));
    //             }
    //         }
    //         $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
    //         $recordspejabat = array();
    //         foreach ($ar_pejabat as $ar_pejabat) {
    //             $recordspejabat[] = $ar_pejabat;
    //         }
    //         $view = new ViewModel(array(
    //             'form' => $form,
    //             'datapendaftaran' => $datapendaftaran,
    //             'message' => $message,
    //             'ar_ttd0' => $recordspejabat,
    //             'datatarif' => $recordstarif,
    //         ));
    //         $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
    //         $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
    //         $recordspajak = array();
    //         foreach ($dataobjek as $dataobjek) {
    //             $recordspajak[] = $dataobjek;
    //         }
    //         $data = array(
    //             'data_pemda' => $ar_pemda,
    //             'datauser' => $session,
    //             'dataobjek' => $recordspajak
    //         );
    //         $this->layout()->setVariables($data);
    //         return $view;
    //     }

    public function FormPageperikananAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $data_tarifKapal = $this->Tools()->getService('DetailperikananTable')->getcomboIdKapal();
        $data_tarifBudidaya = $this->Tools()->getService('DetailperikananTable')->getcomboIdBudidaya();
        $data_tarifBudidayaMutiara = $this->Tools()->getService('DetailperikananTable')->getcomboIdBudidayaMutiara();
        $form = new \Pajak\Form\Pendataan\PendataanperikananFrm($data_tarifKapal, $data_tarifBudidaya, $data_tarifBudidayaMutiara);
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $data->t_masaawal = date('d-m-Y', strtotime(date('01-m-Y') . ' first day of previous month '));
            $data->t_masaakhir = date('d-m-Y', strtotime(date('t-m-Y') . ' last day of previous month '));
            $data->t_tglpendataan = date('d-m-Y');
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailperikananTable')->simpandetailperikanan($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    /*
      EDIT RETRIBUSI
     */

    public function FormPagekesehataneditAction()
    {

        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataandefaultretFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);

            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            $datatransaksi = $this->Tools()->getService('PendataanTable')->getDataPendataanID($id);
            $data->t_tglpenetapan = date('d-m-Y', strtotime($datatransaksi['t_tglpenetapan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_namakegiatan = $datatransaksi['t_namakegiatan'];
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = strtoupper($datatransaksi['s_namakorek']);
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
            $datadetail = $this->Tools()->getService('DetailretribusiTable')->getDetailKesehatanByIdTransaksi($id);
            //            var_dump($form->bind($data)); exit();
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'datadetail' => $datadetail
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

    public function FormPagekebersihaneditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $comboKlasifikasi = $this->Tools()->getService('DetailkebersihanTable')->getcomboIdKlasifikasi();
        $form = new \Pajak\Form\Pendataan\PendataankebersihanFrm($comboKlasifikasi);
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailkebersihanTable')->getPendataanKebersihanByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_idrumahdinas = $datatransaksi['t_idkebersihan'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];
            $data->t_klasifikasi = $datatransaksi['t_idklasifikasi'];
            $data->t_kategori = $datatransaksi['t_idtarif'];
            $data->t_jmlhbln = $datatransaksi['t_jmlhbln'];
            $data->t_tarifdasar = number_format($datatransaksi['t_tarifdasar'], 0, ',', '.');
            // $data->t_potongan = number_format($datatransaksi['t_potongan'], 0, ',', '.');
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagepasareditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $comboKlasifikasi = $this->Tools()->getService('DetailpasarTable')->getcomboIdKlasifikasi();
        // var_dump($comboKlasifikasi); exit();
        $form = new \Pajak\Form\Pendataan\PendataanpasarFrm($comboKlasifikasi);
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailpasarTable')->getPendataanPasarByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_idrumahdinas = $datatransaksi['t_idpasar'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];
            $data->t_klasifikasi = $datatransaksi['t_idklasifikasi'];
            $data->t_jenisbangunan = $datatransaksi['t_jenisbangunan'];
            $data->t_keteranganpasar = $datatransaksi['t_keteranganpasar'];
            $data->t_nokios = $datatransaksi['t_nokios'];
            $data->t_panjang = $datatransaksi['t_panjang'];
            $data->t_lebar = $datatransaksi['t_lebar'];
            $data->t_luas = $datatransaksi['t_luas'];
            $data->t_jmlhbln = $datatransaksi['t_jmlhbln'];
            $data->t_tarifdasar = number_format($datatransaksi['t_tarifdasar'], 0, ',', '.');
            // $data->t_potongan = number_format($datatransaksi['t_potongan'], 0, ',', '.');
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagepemadameditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanpemadamFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailpemadamTable')->getPendataanPemadamByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_idretpemadam = $datatransaksi['t_idretpemadam'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
            $datadetail = $this->Tools()->getService('DetailpemadamTable')->getDetailPemadamByIdTransaksi($id);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $tarif = $this->Tools()->getService('DetailpemadamTable')->getdataTarifPemadam();
        $recordstarif = array();
        foreach ($tarif as $tarif) {
            $recordstarif[] = $tarif;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'datadetail' => $datadetail,
            'jenistarif' => $recordstarif
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

    public function FormPageteraulangeditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanteraFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailteraTable')->getPendataanTeraByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_idrettera = $datatransaksi['t_idrettera'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = strtoupper($datatransaksi['s_namakorek']);
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
            $datadetail = $this->Tools()->getService('DetailteraTable')->getDetailTeraByIdTransaksi($id);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $tarif = $this->Tools()->getService('DetailteraTable')->getdataTariftera();
        $recordstarif = array();
        foreach ($tarif as $tarif) {
            $recordstarif[] = $tarif;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'datadetail' => $datadetail,
            'jenistarif' => $recordstarif
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

    public function FormPagemenaraeditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PendataanFrm();
        if ($req->isGet()) {
            $message = '';
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_tglpendataan = date('d-m-Y', strtotime($data->t_tglpendataan));
            $data->t_masaawal = date('d-m-Y', strtotime($data->t_masaawal));
            $data->t_masaakhir = date('d-m-Y', strtotime($data->t_masaakhir));
            $data->t_jmlhpajak = number_format($data->t_jmlhpajak, 0, ',', '.');
            $data->t_dasarpengenaan = number_format($data->t_dasarpengenaan, 0, ',', '.');

            $datatransaksi = $this->Tools()->getService('PendataanTable')->getDataPendataanID($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = strtoupper($datatransaksi['s_namakorek']);
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];
            $form->bind($data);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            't_berdasarmasa' => $t_berdasarmasa
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

    public function FormPagekekayaandaeraheditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataankekayaandaerahFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            $datakekayaan = $this->Tools()->getService('DetailkekayaanTable')->getdataJeniskekayaan();
            $recordsjenis = array();
            foreach ($datakekayaan as $datakekayaan) {
                $recordsjenis[] = $datakekayaan;
            }


            // 't_idtransaksi' => (int)($dataparent['t_idtransaksi']),
            //         't_jenislayanan' => (int)($datapost['t_idjenis'][$i]),
            //         't_jeniskekayaan'=> (int)($datapost['t_jeniskekayaan'][$i]),
            //         't_keterangan' => $datapost['t_uraian'][$i],
            //         't_jumlah' => (float)(str_ireplace(".", "", $datapost['t_jumlah'][$i])),
            //         't_lamawaktu'=>(int)($datapost['t_lamawaktu'][$i]),
            //         't_jumlahitem' => (int)($datapost['t_jumlahitem'][$i]),
            //         't_tarifdasar'=>(float)(str_ireplace(".", "", $datapost['t_tarifdasar'][$i])),
            //     );
            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);

            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            $datatransaksi = $this->Tools()->getService('PendataanTable')->getDataPendataanID($id);

            $data->t_tglpenetapan = date('d-m-Y', strtotime($datatransaksi['t_tglpenetapan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_namakegiatan = $datatransaksi['t_namakegiatan'];
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = strtoupper($datatransaksi['s_namakorek']);
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
            $datadetail = $this->Tools()->getService('DetailkekayaanTable')->getDetailKekayaanByIdTransaksi($id);
            $jeniskekayaan = $this->Tools()->getService('DetailkekayaanTable')->getjeniskekayaan();
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'datadetail' => $datadetail,
            'jenislayanan' => $recordsjenis,
            'jeniskekayaan' => $jeniskekayaan,
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

    public function FormPagepengujiankendaraanbermotoreditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataankekayaandaerahFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            // $datakekayaan = $this->Tools()->getService('DetailkekayaanTable')->getdataJeniskekayaan();
            $ar_tarif = $this->Tools()->getService('DetailkirTable')->getdataTarif();
            $recordstarif = array();
            foreach ($ar_tarif as $ar_tarif) {
                $recordstarif[] = $ar_tarif;
            }

            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            $datatransaksi = $this->Tools()->getService('PendataanTable')->getDataPendataanID($id);
            $data->t_tglpenetapan = date('d-m-Y', strtotime($datatransaksi['t_tglpenetapan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_namakegiatan = $datatransaksi['t_namakegiatan'];
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = strtoupper($datatransaksi['s_namakorek']);
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
            $datadetail = $this->Tools()->getService('DetailkirTable')->getDetailPengujianKendaraanBermotorByIdTransaksi($id);
            //            var_dump($form->bind($data)); exit();
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'datadetail' => $datadetail,
            'data_tarif' => $recordstarif
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

    public function FormPagetrayekeditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataantrayekFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            // $datakekayaan = $this->Tools()->getService('DetailkekayaanTable')->getdataJeniskekayaan();
            $ar_tarif = $this->Tools()->getService('DetailtrayekTable')->getdataTarif();
            $recordstarif = array();
            foreach ($ar_tarif as $ar_tarif) {
                $recordstarif[] = $ar_tarif;
            }

            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            $datatransaksi = $this->Tools()->getService('PendataanTable')->getDataPendataanID($id);
            $data->t_tglpenetapan = date('d-m-Y', strtotime($datatransaksi['t_tglpenetapan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_namakegiatan = $datatransaksi['t_namakegiatan'];
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = strtoupper($datatransaksi['s_namakorek']);
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
            $datadetail = $this->Tools()->getService('DetailtrayekTable')->getPendataanTrayekByIdTransaksi($id);
            //            var_dump($form->bind($data)); exit();
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'datadetail' => $datadetail,
            'data_tarif' => $recordstarif
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

    public function FormPagepasargrosireditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $comboKlasifikasi = $this->Tools()->getService('DetailpasargrosirTable')->getcomboIdKlasifikasi();
        // var_dump($comboKlasifikasi); exit();
        $form = new \Pajak\Form\Pendataan\PendataanpasargrosirFrm($comboKlasifikasi);
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailpasargrosirTable')->getPendataanPasargrosirByIdTransaksi($id);
            $data->t_idpasargrosir = $datatransaksi['t_idpasargrosir'];
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_idrumahdinas = $datatransaksi['t_idpasar'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];
            $data->t_klasifikasi = $datatransaksi['t_idklasifikasi'];
            $data->t_jenisbangunan = $datatransaksi['t_jenisbangunan'];
            $data->t_panjang = $datatransaksi['t_panjang'];
            $data->t_lebar = $datatransaksi['t_lebar'];
            $data->t_luas = $datatransaksi['t_luas'];
            $data->t_jmlhbln = $datatransaksi['t_jmlhbln'];
            $data->t_tarifdasar = number_format($datatransaksi['t_tarifdasar'], 0, ',', '.');
            // $data->t_potongan = number_format($datatransaksi['t_potongan'], 0, ',', '.');
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }

        $view = new ViewModel(array(
            't_jenisbangunan' => $data->t_jenisbangunan,
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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
            'dataobjek' => $recordspajak,
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function FormPagetempatparkireditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $comboJeniskendaraan = $this->Tools()->getService('DetailtempatparkirTable')->getcomboIdJeniskendaraan();
        // var_dump($comboKlasifikasi); exit();
        $form = new \Pajak\Form\Pendataan\PendataantempatparkirFrm($comboJeniskendaraan);
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailtempatparkirTable')->getPendataanTempatparkirByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_idrumahdinas = $datatransaksi['t_idpasar'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];
            $data->t_jeniskendaraan = $datatransaksi['t_jeniskendaraan'];
            $data->t_jmlhkendaraan = $datatransaksi['t_jumlah'];
            $data->t_keterangan = $datatransaksi['t_keterangan'];
            $data->t_tarifdasar = number_format($datatransaksi['t_tarifdasar'], 0, ',', '.');
            // $data->t_potongan = number_format($datatransaksi['t_potongan'], 0, ',', '.');
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagerumahdinasAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanrumahdinasFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailrumahdinasTable')->simpandetailrumahdinas($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagerumahdinaseditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanrumahdinasFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailrumahdinasTable')->getPendataanRumahDinasByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_idrumahdinas = $datatransaksi['t_idrumahdinas'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];
            $data->t_panjang = $datatransaksi['t_panjang'];
            $data->t_lebar = $datatransaksi['t_lebar'];
            $data->t_luas = $datatransaksi['t_luas'];
            $data->t_jmlhbln = $datatransaksi['t_jmlhbln'];
            $data->t_tarifdasar = number_format($datatransaksi['t_tarifdasar'], 0, ',', '.');
            $data->t_potongan = number_format($datatransaksi['t_potongan'], 0, ',', '.');
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagepanggungreklameAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanpanggungreklameFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailpanggungreklameTable')->simpandetailpanggungreklame($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagepanggungreklameeditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataanpanggungreklameFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailpanggungreklameTable')->getPendataanPanggungReklameByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_idrpangrek = $datatransaksi['t_idrpangrek'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];
            $data->t_panjang = $datatransaksi['t_panjang'];
            $data->t_lebar = $datatransaksi['t_lebar'];
            $data->t_luas = $datatransaksi['t_luas'];
            $data->t_tarifdasar = number_format($datatransaksi['t_tarifdasar'], 0, ',', '.');
            $data->t_jmlhbln = $datatransaksi['t_jmlhbln'];
            $data->t_potongan = number_format($datatransaksi['t_potongan'], 0, ',', '.');
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagetanahreklameAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataantanahreklameFrm($this->Tools()->getService('DetailtanahreklameTable')->getcomboIdTanahReklame());
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailtanahreklameTable')->simpandetailtanahreklame($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagetanahreklameeditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataantanahreklameFrm($this->Tools()->getService('DetailtanahreklameTable')->getcomboIdTanahReklame());
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailtanahreklameTable')->getPendataanTanahReklameByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_idrpangrek = $datatransaksi['t_idrpangrek'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];
            $data->t_panjang = $datatransaksi['t_panjang'];
            $data->t_lebar = $datatransaksi['t_lebar'];
            $data->t_luas = $datatransaksi['t_luas'];
            $data->t_tarifdasar = number_format($datatransaksi['t_tarifdasar'], 0, ',', '.');
            $data->t_jmlhblnhari = $datatransaksi['t_jmlhblnhari'];
            $data->t_lokasitanah = $datatransaksi['t_lokasitanah'];
            $data->t_potongan = number_format($datatransaksi['t_potongan'], 0, ',', '.');
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function CariTarifpipaAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // $t_volume = $data_get['t_tarifdasarkorek'] * $data_get['t_jmlhsumur'];
        $data_tarifpipa = $this->Tools()->getService('AirTable')->getdataTarifpipaId($data_get['t_kodekelompok']);

        if ($data_get['t_idkorek'] == 103) {
            $t_volume = $data_tarifpipa['s_pipa1'] * $data_get['t_jmlhsumur'];
        } elseif ($data_get['t_idkorek'] == 104) {
            $t_volume = $data_tarifpipa['s_pipa2'] * $data_get['t_jmlhsumur'];
        } elseif ($data_get['t_idkorek'] == 105) {
            $t_volume = $data_tarifpipa['s_pipa3'] * $data_get['t_jmlhsumur'];
        } elseif ($data_get['t_idkorek'] == 106) {
            $t_volume = $data_tarifpipa['s_pipa4'] * $data_get['t_jmlhsumur'];
        } elseif ($data_get['t_idkorek'] == 107) {
            $t_volume = $data_tarifpipa['s_pipa5'] * $data_get['t_jmlhsumur'];
        } elseif ($data_get['t_idkorek'] == 108) {
            $t_volume = $data_tarifpipa['s_pipa6'] * $data_get['t_jmlhsumur'];
        } elseif ($data_get['t_idkorek'] == 109) {
            $t_volume = $data_tarifpipa['s_pipa7'] * $data_get['t_jmlhsumur'];
        }

        $data = array(
            't_volume' => $t_volume,
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function CariKodeJenisAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data_kodejenis = $this->Tools()->getService('AirTable')->getdataKodeJenisId($data_get['t_kodekelompok']);
        $data_jenis .= '<option value="">Pilih Kode Jenis</option>';
        foreach ($data_kodejenis as $row) :
            $data_jenis .= '<option value="' . $row['s_id'] . '">' . $row['s_nourut'] . ' [ ' . $row['s_deskripsi'] . ' ]</option>';
        endforeach;
        $dataToRender = [
            't_kodejenis' => $data_jenis,
        ];
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($dataToRender));
    }

    public function caritariftanahreklameAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('DetailtanahreklameTable')->getDataId($data_get['t_lokasitanah']);
        $data_render = array(
            "t_tarifdasar" => number_format($data['s_tarif'], 0, ",", "."),
            "s_satuan" => $data['s_satuan']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function FormPagetanahlainAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataantanahlainFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailtanahlainTable')->simpandetailtanahlain($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagetanahlaineditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataantanahlainFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailtanahlainTable')->getPendataanTanahLainByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_idrpangrek = $datatransaksi['t_idrpangrek'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];
            $data->t_panjang = $datatransaksi['t_panjang'];
            $data->t_lebar = $datatransaksi['t_lebar'];
            $data->t_luas = $datatransaksi['t_luas'];
            $data->t_tarifdasar = number_format($datatransaksi['t_tarifdasar'], 0, ',', '.');
            $data->t_jmlhbln = $datatransaksi['t_jmlhbln'];
            $data->t_potongan = number_format($datatransaksi['t_potongan'], 0, ',', '.');
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat
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

    public function FormPagegedungAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataangedungFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idobjek');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $tarifgedung = $this->Tools()->getService('DetailgedungTable')->gettarifgedung();
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
            //jika pernah melakukan pendataan sebelumnya
            $datapendataansebelumnya = $this->Tools()->getService('PendataanTable')->getPendataanSebelumnya($id);
            $data->t_idkorek = $datapendataansebelumnya['s_idkorek'];
            $data->t_korek = $datapendataansebelumnya['korek'];
            $data->t_namakorek = $datapendataansebelumnya['s_namakorek'];
            $data->t_tarifpajak = $datapendataansebelumnya['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('PendataanTable')->getPendataanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendataanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $dataparent = $this->Tools()->getService('PendataanTable')->simpanpendataanretribusi($base, $session, $post);
                $this->Tools()->getService('DetailgedungTable')->simpandetailgedung($post, $dataparent);
                return $this->redirect()->toRoute("pendataan", array(
                    "controllers" => "Pendataan",
                    "action" => "index",
                    "page" => $req->getPost()['t_jenisobjekpajak']
                ));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }

        $recordsgedung = array();
        foreach ($tarifgedung as $tarifgedung) {
            $recordsgedung[] = $tarifgedung;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'tarifgedung' => $recordsgedung
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

    public function FormPagegedungeditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\PendataangedungFrm();
        $datadetail = null;
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdTransaksi($id);
            //            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data = $this->Tools()->getService('PendataanTable')->getPendataanId($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';

            $datatransaksi = $this->Tools()->getService('DetailgedungTable')->getPendataanGedungByIdTransaksi($id);
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $data->t_nourut = $datatransaksi['t_nourut'];
            $data->t_periodepajak = $datatransaksi['t_periodepajak'];
            $data->t_tglpendataan = date('d-m-Y', strtotime($datatransaksi['t_tglpendataan']));
            $data->t_masaawal = date('d-m-Y', strtotime($datatransaksi['t_masaawal']));
            $data->t_masaakhir = date('d-m-Y', strtotime($datatransaksi['t_masaakhir']));
            $data->t_idkorek = $datatransaksi['s_idkorek'];
            $data->t_korek = $datatransaksi['korek'];
            $data->t_namakorek = $datatransaksi['s_namakorek'];
            $data->t_jmlhpajak = number_format($datatransaksi['t_jmlhpajak'], 0, ',', '.');
            $form->bind($data);
            $datadetail = $this->Tools()->getService('DetailgedungTable')->getDetailGedungByIdTransaksi($id);
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $tarifgedung = $this->Tools()->getService('DetailgedungTable')->gettarifgedung();
        $recordsgedung = array();
        foreach ($tarifgedung as $tarifgedung) {
            $recordsgedung[] = $tarifgedung;
        }

        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            'ar_ttd0' => $recordspejabat,
            'datadetail' => $datadetail,
            'tarifgedung' => $recordsgedung
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

    public function caritarifgedungAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('DetailgedungTable')->gettarifgedungId($data_get['t_idtarifgedung']);
        $data_render = array(
            "t_tarif" => number_format($data['s_tarif'], 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungretgedungAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_tarif = str_ireplace(".", "", $data_get['t_tarif']);
        $t_total = $t_tarif * $data_get['t_jumlah'];
        $data_render = array(
            "t_total" => number_format($t_total, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungtotalretgedungAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jmlhpajak = str_ireplace(".", "", $data_get['t_total1']) + str_ireplace(".", "", $data_get['t_total2']) + str_ireplace(".", "", $data_get['t_total3']) +
            str_ireplace(".", "", $data_get['t_total4']) + str_ireplace(".", "", $data_get['t_total5']) + str_ireplace(".", "", $data_get['t_total6']) +
            str_ireplace(".", "", $data_get['t_total7']);
        $data_render = array(
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungretimbluasAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $tarifdasar = $this->Tools()->getService('DetailimbTable')->getDataIdTarif(1);
        $t_jumlah = str_ireplace(".", "", $data_get['t_jmlhbangunan']) * $data_get['t_panjang'] * $data_get['t_lebar'];

        $data = array(
            't_luas' => number_format($t_jumlah, 2, ".", "."),
            't_tarifdasar' => number_format($tarifdasar['s_tarif'], 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungtotalretimbAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // var_dump($data_get);exit();
        $koe_luas = $this->Tools()->getService('DetailimbTable')->getDataIdKoefisienluas($data_get['t_imbluas']);

        $koe_lantai = $this->Tools()->getService('DetailimbTable')->getDataIdKoefisienlantai($data_get['t_imblantai']);
        // var_dump($koe_lantai);exit();
        $koe_gunabgn = $this->Tools()->getService('DetailimbTable')->getDataIdKoefisiengunabgn($data_get['t_imbgunabgn']);
        $koe_lokasi = $this->Tools()->getService('DetailimbTable')->getDataIdKoefisienlokasi($data_get['t_imblokasi']);
        $koe_kondisi = $this->Tools()->getService('DetailimbTable')->getDataIdKoefisienkondisi($data_get['t_imbkondisi']);
        $jumlah_koef = $koe_luas['s_koefisien'] * $koe_lantai['s_koefisien'] * $koe_gunabgn['s_koefisien'] * $koe_lokasi['s_koefisien'] * $koe_kondisi['s_koefisien'];
        // var_dump($jumlah_koef);exit();

        $data = array(
            't_jmlhpajak' => number_format($jumlah_koef * $data_get['t_luas'] * str_ireplace(".", "", $data_get['t_tarifdasar']), 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungretholuasAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_panjang']) * str_ireplace(".", "", $data_get['t_lebar']);
        $data = array(
            't_luas' => number_format($t_jumlah, 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungtotalrethoAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $indeks_lokasi = $this->Tools()->getService('DetailhoTable')->getDataIdIndekslokasi($data_get['t_kwslokasi']);
        $indeks_gangguan = $this->Tools()->getService('DetailhoTable')->getDataIdIndeksgangguan($data_get['t_gangguan']);
        $indeks_luas = $this->Tools()->getService('DetailhoTable')->getDataIdIndeksluas($data_get['t_luas']);
        $tarifdasar = $this->Tools()->getService('DetailhoTable')->getDataIdTarif($data_get['t_skala']);
        $jumlah_indeks = $indeks_lokasi['s_indeks'] * $indeks_gangguan['s_indeks'] * $indeks_luas['s_indeks'];
        $data = array(
            't_indeks_luas' => $indeks_luas['s_indeks'],
            't_tarifdasar' => number_format($tarifdasar['s_tarif'], 0, ",", "."),
            't_jmlhpajak' => number_format($jumlah_indeks * $tarifdasar['s_tarif'], 0, ",", "."),
            //            't_jmlhpajak' => $indeks_luas['s_indeks'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungretkapalAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // $tarifdasar_kapal = $this->Tools()->getService('DetailperikananTable')->getDataIdKapal($data_get['t_jeniskapal']);
        // $t_jumlah = $tarifdasar_kapal['s_tarif'] * str_ireplace(".", "", $data_get['t_jmlhgt']);
        $data = array(
            // 't_tarifdasar' => number_format($tarifdasar_kapal['s_tarif'], 0, ",", "."),
            't_satuan' => $tarifdasar_kapal['s_satuan'],
            't_jmlhpajak' => number_format($data_get['t_tarifdasar'], 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function carikekayaandaerahAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('DetailkekayaanTable')->getdataKategorisatu($data_get['t_klasifikasi']);
        $data_jenis .= '<option value="">Silahkan Pilih</option>';
        foreach ($data as $row) :
            $data_jenis .= '<option value="' . $row['s_idkategorisatu'] . '">' . strtoupper($row['s_keterangan']) . '</option>';
        endforeach;
        $dataToRender = [
            't_kategori' => $data_jenis,
        ];
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($dataToRender));
    }

    public function carikategorikekayaanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        if ($data_get['t_kategorisatu'] == 3) {
            $data1 = $this->Tools()->getService('DetailkekayaanTable')->getdataTarifkategori(3);
        } else if ($data_get['t_kategorisatu'] == 1 || $data_get['t_kategorisatu'] == 2 || $data_get['t_kategorisatu'] == 4 || $data_get['t_kategorisatu'] == 5 || $data_get['t_kategorisatu'] == 6 || $data_get['t_kategorisatu'] == 7 || $data_get['t_kategorisatu'] == 8 || $data_get['t_kategorisatu'] == 9) {
            $data = $this->Tools()->getService('DetailkekayaanTable')->getdataKategoridua($data_get['t_kategorisatu']);
            $data_jenis .= '<option value="">Silahkan Pilih</option>';
            foreach ($data as $row) :
                $data_jenis .= '<option value="' . $row['s_idtarif'] . '">' . strtoupper($row['s_keterangan']) . '</option>';
            endforeach;
        } else {
            $data2 = $this->Tools()->getService('DetailkekayaanTable')->getdataTarifkategori($data_get['t_kategorisatu']);
        }
        $dataToRender = [
            't_kategori' => $data_jenis,
            't_tarifret' => $data1['s_tarif'],
            't_tarif' => number_format($data2['s_tarif'], 0, ",", "."),
            't_satuan' => $data1['s_satuan'],
            't_satuan2' => $data2['s_satuan'],
            't_idkategori' => $data_get['t_kategorisatu']
        ];
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($dataToRender));
    }

    public function caritarifkekayaanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $ar_tarif = $this->Tools()->getService('DetailkekayaanTable')->getdataTarif($data_get['t_idtarif']);
        //        var_dump($ar_tarif);exit();
        $data = array(
            't_satuan' => $ar_tarif['s_satuan'],
            't_nilaitanah' => number_format($ar_tarif['s_nilaitanah'], 0, ",", "."),
            't_nilaibangunan' => number_format($ar_tarif['s_nilaibangunan'], 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungretribusikekayaanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        //        $datatarif = $this->Tools()->getService('KekayaandaerahTable')->getDataKlasifikasi($data_get['t_klasifikasi']);
        // var_dump($datatarif['s_nilailuastanah']); exit();
        if ($data_get['t_kategorisatu'] == 3) {
            $t_luastanah = $data_get['t_jmlhbln'] * str_ireplace(".", "", $data_get['t_luastanah']) * str_ireplace(".", "", $data_get['t_hargatanah']);
            $t_jmlhpajak = $t_luastanah * $data_get['t_tarifretribusi'];
        } elseif ($data_get['t_kategorisatu'] == 8 || $data_get['t_kategorisatu'] == 9) {
            $t_jmlhpajak = $data_get['t_jmlhbln'] * str_ireplace(".", "", $data_get['t_hargadasarsewa']);
        } elseif ($data_get['t_kategorisatu'] == 1 || $data_get['t_kategorisatu'] == 2 || $data_get['t_kategorisatu'] == 4 || $data_get['t_kategorisatu'] == 5 || $data_get['t_kategorisatu'] == 6 || $data_get['t_kategorisatu'] == 7) {
            $t_luastanah = $data_get['t_jmlhbln'] * str_ireplace(".", "", $data_get['t_luastanah']) * str_ireplace(".", "", $data_get['t_nilailuastanah']);
            $t_luasbangunan = $data_get['t_jmlhbln'] * str_ireplace(".", "", $data_get['t_luasbangunan']) * str_ireplace(".", "", $data_get['t_nilailuasbangunan']);
            $t_jmlhpajak = $t_luastanah + $t_luasbangunan;
        } else {
            $t_jmlhpajak = $data_get['t_jmlhbln'] * str_ireplace(".", "", $data_get['t_hargadasarsewa']);
        }


        $data_render = array(
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", "."),
            //            "t_nilailuastanah" => number_format($datatarif['s_nilailuastanah'], 0, ",", "."),
            //            "t_nilailuasbangunan" => number_format($datatarif['s_nilailuasbangunan'], 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    //hapus
    public function hapusAction()
    {
        /** Hapus Pendataan
         * @param int $s_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */

        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $getwalet = $this->Tools()->getService('PendataanTable')->getPendataanWalet($this->params('s_idjenis'));
        if (!empty($getwalet['t_iddetailwalet'])) {
            $this->Tools()->getService('PendataanTable')->hapusPendataanwalet($getwalet['t_iddetailwalet']);
        }

        $this->Tools()->getService('PendataanTable')->hapusPendataan($this->params('s_idjenis'));
        return $this->getResponse();
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
                $data = $this->Tools()->getService('PendaftaranTable')->getByKecamatan($ex);
                $opsi = "";
                $opsi .= "<option value=''>Semua Kelurahan</option>";
                foreach ($data as $r) {
                    $opsi .= "<option value='" . $r['s_idkel'] . "'>" . str_pad($r['s_kodekel'], 2, "0", STR_PAD_LEFT) . " || " . $r['s_namakel'] . "</option>";
                }
                $res->setContent($opsi);
            }
        }
        return $res;
    }

    public function cetakkodebayarAction()
    {
        /** Cetak Kode Bayar
         * @param int $t_idwp
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 02/01/2016
         */
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

    public function cetakpendataanAction()
    {
        /** Cetak Pendataan
         * @param string $tglcetak Tanggal Mencetak Dokumen
         * @param date('d-m-Y') $tglpendataan0 Tanggal Minimal Pendataan
         * @param date('d-m-Y') $tglpendataan1 Tanggal Maximal Pendataan
         * @param int $t_kecamatan 
         * @param int $t_kelurahan  
         * @param int $t_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PendataanTable')->getDataPendataan($data_get->tglpendataan0, $data_get->tglpendataan1, $data_get->t_kecamatan, $data_get->t_kelurahan, $data_get->t_idkorek);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglpendataan0' => $data_get->tglpendataan0,
            'tglpendataan1' => $data_get->tglpendataan1,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda
        ));

        $pdf->setOption("paperSize", "legal-L");
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

        $data = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);
        $data_render = array(
            "idtransaksi" => $data_get['idtransaksi'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat_lengkapwp'],
            "namaop" => $data['t_namaobjek'],
            "alamatop" => $data['t_alamatlengkapobjek'],
            "tglketetapan" => date('d-m-Y', strtotime($data['t_tglpendataan'])),
            "jenispajak" => $data['s_namajenis'],
            "idjenispajak" => $data['t_jenisobjek'],
            "t_idobjek" => $data['t_idobjek']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataWPObjekAction()
    {
        /** Mendapatkan Data WP Objek
         * @param int $page
         * @author Roni Mustapa <ronimustapa@gmail.com>
         * @date 20/06/2019
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // Mengambil Data WP, OP dan Transaksi
        $data = $this->Tools()->getService('PendataanTable')->getDataWPObjek($data_get['idobjek']);
        $data_render = array(
            "idobjek" => $data['t_idobjek'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat_lengkapwp'],
            "namaop" => $data['t_namaobjek'],
            "alamatop" => $data['t_alamatlengkapobjek'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetakkartudataAction()
    {
        /** Cetak Kartu Data
         * @param int $idobjek
         * @author Roni Mustapa <ronimustapa@gmail.com>
         * @date 20/06/2019
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data Jenis Pajak
        $datajenispajak = $this->Tools()->getService('PendaftaranTable')->getDataJenisPajak($data_get['idobjek']);
        // var_dump($datajenispajak);exit();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranIDObjek($data_get['idobjek']);
        // Mengambil Data Penetapan dan Pembayaran
        $dataarr = array();
        for ($i = 1; $i <= 12; $i++) {
            $datatransaksi = $this->Tools()->getService('PendaftaranTable')->getTransaksi($i, $data_get['periode'], $data_get['idobjek']);
            if ($datatransaksi == false) {
                $datatransaksi = array(
                    "t_tglpendataan" => null,
                    "t_jmlhpajak" => null,
                    "t_tglpembayaran" => null,
                    "t_jmlhpembayaran" => null
                );
            } else {
                $datatransaksi = $datatransaksi;
            }
            $dataarr[] = array_merge($datatransaksi);
        }
        $datatransaksireklame = $this->Tools()->getService('PendaftaranTable')->getTransaksireklame($data_get['periode'], $data_get['idobjek']);
        $datatransaksikatering = $this->Tools()->getService('PendaftaranTable')->getTransaksikatering($data_get['periode'], $data_get['idobjek']);
        // $datatransaksiair = $this->Tools()->getService('PendaftaranTable')->getTransaksiAir($data_get['periode'], $data_get['idobjek']);
        // $datatransaksiair = $this->Tools()->getService('PendaftaranTable')->getTransaksiAir($i, $data_get['periodekartudata'], $data_get['objekpajakwp']);
        $datatransaksiretribusi = $this->Tools()->getService('PendaftaranTable')->getTransaksiRetribusi($data_get['periode'], $data_get['idobjek']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttdmengetahui']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttddiperiksa']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'datatransaksi' => $dataarr,
            'datatransaksireklame' => $datatransaksireklame,
            // 'datatransaksiair' => $datatransaksiair,
            'datatransaksiretribusi' => $datatransaksiretribusi,
            'ar_pemda' => $ar_pemda,
            'ar_mengetahui' => $ar_mengetahui,
            'ar_diperiksa' => $ar_diperiksa,
            "datajenispajak" => $datajenispajak,
            'periodepajak' => $data_get['periode'],
            'datatransaksikatering' => $datatransaksikatering,
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function cetaksptpdhotelAction()
    {
        /** Cetak SPTPD Hotel
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $rekening = $this->Tools()->getService('RekeningTable')->getRekeningByJenis(1);


        // Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);
        // Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('PendataanTable')->getDataPendataanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $ar_operator = $this->Tools()->getService('UserTable')->getUserId($datasekarang['t_operatorpendataan']);
        // var_dump($ar_ttd);exit();

        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
            'rekening' => $rekening,
            'operator' => $ar_operator
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetaksptpdrestoranAction()
    {
        /** Cetak SPTPD Restoran
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $rekening = $this->Tools()->getService('RekeningTable')->getRekeningByJenis(2);
        // Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);
        // Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('PendataanTable')->getDataPendataanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $ar_operator = $this->Tools()->getService('UserTable')->getUserId($datasekarang['t_operatorpendataan']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
            'rekening' => $rekening,
            'operator' => $ar_operator
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetaksptpdhiburanAction()
    {
        /** Cetak SPTPD Hiburan
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $rekening = $this->Tools()->getService('RekeningTable')->getRekeningByJenis(3);
        // Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);
        // Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('PendataanTable')->getDataPendataanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $ar_operator = $this->Tools()->getService('UserTable')->getUserId($datasekarang['t_operatorpendataan']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
            'rekening' => $rekening,
            'operator' => $ar_operator
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetaksptpdreklameAction()
    {
        /** Cetak SPTPD Reklame
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);
        $datareklame = $this->Tools()->getService('DetailreklameTable')->getDetailReklameByIdTransaksi($data_get['idtransaksi']);
        // Mengambil Data Sebelumnya
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datareklame' => $datareklame,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "legal");
        return $pdf;
    }

    public function cetaksptpdppjAction()
    {
        /** Cetak SPTPD PPJ
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $rekening = $this->Tools()->getService('RekeningTable')->getRekeningByJenis(5);
        // $rekening = $this->Tools()->getService('RekeningTable')->getRekeningSubByJenis(5);
        // Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);

        // $detailppjsekarang = $this->Tools()->getService('DetailPpjTable')->getPendataanByIdTransaksi($data_get['idtransaksi']);
        // Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('PendataanTable')->getDataPendataanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
        // Mengambil data Detail Minerba
        // $datadetailppj = $this->Tools()->getService('PendataanTable')->getDataDetailPPJ($data_get['idtransaksi']);
        // $t_tarifdasarkorek = $datadetailppj->current();
        // Mengambil Data Pemda
        $petugas_penerima = $this->Tools()->getService('PejabatTable')->getPejabatId($datasekarang['t_operatorpendataan']);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $ar_operator = $this->Tools()->getService('UserTable')->getUserId($datasekarang['t_operatorpendataan']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            // 'detailppj' => $detailppjsekarang,
            // 'data_detailppj' => $datadetailppj,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
            'rekening' => $rekening,
            't_tarifdasarkorek' => $t_tarifdasarkorek['s_persentarifkorek'],
            'petugas_penerima' => $petugas_penerima,
            'operator' => $ar_operator
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetaklampiranppjAction()
    {
        /** Cetak SPTPD PPJ
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['t_idtransaksi']);
        $detailppjsekarang = $this->Tools()->getService('DetailPpjTable')->getPendataanByIdTransaksi($data_get['t_idtransaksi']);
        $lampiranppj_a = $this->Tools()->getService('LampiranPpjTable')->getLampiranByIdTransaksi($data_get['t_idtransaksi'], 1);
        $lampiranppj_b = $this->Tools()->getService('LampiranPpjTable')->getLampiranByIdTransaksi($data_get['t_idtransaksi'], 2);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'detailppj' => $detailppjsekarang,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
            'lampiranppj_a' => $lampiranppj_a,
            'lampiranppj_b' => $lampiranppj_b,
        ));
        $pdf->setOption("paperSize", "legal");
        return $pdf;
    }

    public function cetaksptpdminerbaAction()
    {
        /** Cetak SPTPD Minerba
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);
        // Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('PendataanTable')->getDataPendataanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);

        // Mengambil data Detail Minerba
        $datadetailminerba = $this->Tools()->getService('PendataanTable')->getDataDetailMinerba($data_get['idtransaksi']);

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $ar_operator = $this->Tools()->getService('UserTable')->getUserId($datasekarang['t_operatorpendataan']);
        // var_dump($ar_ttd);exit();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            'dataminerba' => $datadetailminerba,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
            'operator' => $ar_operator
        ));
        // var_dump($ar_ttd);exit();
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetaksptpdparkirAction()
    {
        /** Cetak SPTPD Parkir
         * @param int $idtransaksi
         * @author Roni Mustapa <ronimustapa@gmail.com>
         * @date 31/01/2019
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $rekening = $this->Tools()->getService('RekeningTable')->getRekeningByJenis(7);
        //// Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);
        //// Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('PendataanTable')->getDataPendataanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
        //// Mengambil Data Pemda
        // Mengambil Data WP, OP dan Transaksi
        // $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);
        // Mengambil Data Sebelumnya
        // $datasebelumnya = $this->Tools()->getService('PendataanTable')->getDataPendataanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
        // Mengambil data Detail Minerba
        // $datadetailparkir = $this->Tools()->getService('PendataanTable')->getDataDetailParkir($data_get['idtransaksi']);

        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $ar_operator = $this->Tools()->getService('UserTable')->getUserId($datasekarang['t_operatorpendataan']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            // 'dataparkir' => $datadetailparkir,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
            'rekening' => $rekening,
            'operator' => $ar_operator
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetaksptpdabtAction()
    {
        /** Cetak SPTPD ABT
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);
        // Mengambil Data Detail Air
        $dataair = $this->Tools()->getService('DetailAirTable')->getDetailAirByIdTransaksi($data_get['idtransaksi']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'dataair' => $dataair,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "legal");
        return $pdf;
    }

    public function cetaksptpdwaletAction()
    {
        /** Cetak SPTPD Walet
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $rekening = $this->Tools()->getService('RekeningTable')->getRekeningByJenis(9);
        // Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);
        $datawalet = $this->Tools()->getService('PendataanTable')->getPendataanWalet($data_get['idtransaksi']);
        // var_dump($datawalet);
        // exit();

        // Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('PendataanTable')->getDataPendataanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $ar_operator = $this->Tools()->getService('UserTable')->getUserId($datasekarang['t_operatorpendataan']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'datawalet' => $datawalet,
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
            'rekening' => $rekening,
            'operator' => $ar_operator
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function tentukanMasaAction()
    {
        /** tentukan Masa Pajak Akhir
         * @param int $t_masaawal
         * @author Roni Mustapa <ronimustapa@gmail.com>
         * @date 06/02/2019
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();

        $t_masaakhir = date('t', strtotime($data_get['t_masaawal'])) . '-' . date('m', strtotime($data_get['t_masaawal'])) . '-' . date('Y', strtotime($data_get['t_masaawal']));

        $data_render = array(
            "t_masaakhir" => $t_masaakhir
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungpajakAction()
    {
        /** Hitung Pajak Default
         * @param int $t_dasarpengenaan
         * @param int $t_tarifpajak
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 13/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        if ($data_get['t_jenispajak'] == 2) { // restoran
            //            if ($data_get['t_idkorek'] == 21) { // katering
            //                $datarek = $this->Tools()->getService('RekeningTable')->getdataRekeningId($data_get['t_idkorek']);
            //                $t_dasarpengenaan = str_ireplace(".", "", $data_get['t_dasarpengenaan']);
            //                $t_tarifpajak = $datarek['s_persentarifkorek'];
            //                $t_jmlhpajak = ($t_dasarpengenaan * $t_tarifpajak / 100);
            //            } else {
            $t_dasarpengenaan = str_ireplace(".", "", $data_get['t_dasarpengenaan']);
            //            if ($t_dasarpengenaan < 3000000) {
            //                $t_tarifpajak = 0;
            //                $t_jmlhpajak = ($t_dasarpengenaan * $t_tarifpajak / 100);
            //            } else {
            //                $t_tarifpajak = 10;
            $t_tarifpajak = $data_get['t_tarifpajak'];
            $t_jmlhpajak = ($t_dasarpengenaan * $t_tarifpajak / 100);
            //            }
            //            }
            $t_jmlhkenaikan = 0;
            if (!empty($data_get['t_tarifkenaikan']) || $data_get['t_tarifkenaikan'] != 0) {
                $t_jmlhkenaikan = ($t_jmlhpajak * $data_get['t_tarifkenaikan'] / 100);
                $t_jmlhpajak = $t_jmlhpajak + $t_jmlhkenaikan;
            }
        } else {
            $t_dasarpengenaan = str_ireplace(".", "", $data_get['t_dasarpengenaan']);
            $t_tarifpajak = $data_get['t_tarifpajak'];
            $t_jmlhpajak = ($t_dasarpengenaan * $t_tarifpajak / 100);
            $t_jmlhkenaikan = 0;
            if (!empty($data_get['t_tarifkenaikan']) || $data_get['t_tarifkenaikan'] != 0) {
                $t_jmlhkenaikan = ($t_jmlhpajak * $data_get['t_tarifkenaikan'] / 100);
                $t_jmlhpajak = $t_jmlhpajak + $t_jmlhkenaikan;
            }
        }
        $data_render = array(
            "t_jmlhpajak" => $t_jmlhpajak,
            "t_jmlhkenaikan" => $t_jmlhkenaikan,
            "t_tarifpajak" => $t_tarifpajak
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungpajakreklameAction()
    {
        $req = $this->getRequest();
        $postedData = $req->getPost();
        if ($postedData['t_tipewaktu'] == 1) {
            $termin = "Tahun";
        } elseif ($postedData['t_tipewaktu'] == 2) {
            $termin = "Bulan";
        } elseif ($postedData['t_tipewaktu'] == 3) {
            $termin = "Hari";
        } else {
            $termin = "Kali";
        }

        if ($postedData['t_jenisreklame'] == 1 || $postedData['t_jenisreklame'] == 2) {
            $hitungj = ($postedData['t_nsr'] * $postedData['t_tinggi']) * $postedData['t_jangkawaktu'];
            $hitungjsub = $hitungj * $postedData['t_jumlah'];
            $jmlhpajaksub = 0;
            if ($hitungj <= $postedData['t_nsr']) {
                $jmlhpajaksub .= $postedData['t_nsr'] * $postedData['t_jumlah'];
            } else {
                $jmlhpajaksub .= $hitungjsub;
            }
            $param = "(( " . $postedData['t_tinggi'] . " m x Rp. " . number_format($postedData['t_nsr'], 0, ",", ".") . " )" . " x " . $postedData['t_jangkawaktu'] . " " . $termin . " ) x " . $postedData['t_jumlah'] . " Buah";

            $data_render = array(
                "t_jmlhpajaksub" => number_format($jmlhpajaksub, 0, ",", "."),
                "t_param" => $param
            );
        } else if ($postedData['t_jenisreklame'] == 10 || $postedData['t_jenisreklame'] == 11 || $postedData['t_jenisreklame'] == 12 || $postedData['t_jenisreklame'] == 13) {
            $hitungj = $postedData['t_folio'] * $postedData['t_nsr'] * $postedData['t_jangkawaktu'];
            $hitungjsub = $hitungj;
            $jmlhpajaksub = 0;
            if ($hitungj <= $postedData['t_nsr']) {
                $jmlhpajaksub .= $postedData['t_nsr'] * $postedData['t_jumlah'];
            } else {
                $jmlhpajaksub .= $hitungjsub;
            }
            $param = "( Rp. " . number_format($postedData['t_nsr'], 0, ",", ".")  . " x " . $postedData['t_jangkawaktu'] . " " . $termin . " ) x " . $postedData['t_folio'] . " Buah";

            $data_render = array(
                "t_jmlhpajaksub" => number_format($jmlhpajaksub, 0, ",", "."),
                "t_param" => $param
            );
        } else {
            $hitungj = (($postedData['t_panjang'] * $postedData['t_lebar']) * $postedData['t_nsr']) * $postedData['t_sisi'] * $postedData['t_jangkawaktu'];
            $hitungjsub = $hitungj * $postedData['t_jumlah'];
            $jmlhpajaksub = 0;
            if ($hitungj <= $postedData['t_nsr']) {
                $jmlhpajaksub .= $postedData['t_nsr'] * $postedData['t_jumlah'];
            } else {
                $jmlhpajaksub .= $hitungjsub;
            }
            $param = "((( " . $postedData['t_panjang'] . " m x " . $postedData['t_lebar'] . " m)  Rp. " . number_format($postedData['t_nsr'], 0, ",", ".") . " )" . " x " . $postedData['t_sisi'] .  " sisi x " . $postedData['t_jangkawaktu'] . " " . $termin . " ) x " . $postedData['t_jumlah'] . " Buah";

            $data_render = array(
                "t_jmlhpajaksub" => number_format($jmlhpajaksub, 0, ",", "."),
                "t_param" => $param
            );
        }

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungpajakairAction()
    {

        // RUMUS PAJAK AIR = NPA X TARIF (20%)
        // NPA =  (Volume) x FNA x HAB (HDA) 
        // FNA = Faktor Nilai Air
        // HAB = HARGA AIR BAKU (HARGA DASAR AIR)
        // Volume (progresif)
        // Bobot kulitas air (BKA) 
        // Sumberdaya Alam (SA)= 60%
        // Kompensasi pemulihan, peruntukan dan pengelolaan (KPPP) = 40% 
        // Kompensasi Berdasarkan Volume Progresif (KBVP) => berkasarkan tabel ketetapan perda
        // FNA = (SA x BKA)+(PPP x KBVP)
        // HAB = TOTAL BIAYA / (masa pajak atau usia produksi(hari)xdebit sumur)

        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_volume = str_ireplace(".", "", $data_get['t_volume']);
        $BKA      = $data_get['t_kualitasair'];
        $t_idperuntukan = $data_get['t_peruntukan'];
        $t_debitair = $data_get['t_debitair'];
        $t_masaawal = date_create($data_get['t_masaawal']);
        $t_masaakhir = date_create($data_get['t_masaakhir']);
        $selisih = (int) $data_get['t_lamawaktu'] * 365;
        $t_totalbiaya = str_ireplace(".", "", $data_get['t_totalbiaya']);
        $HDA = round(($t_totalbiaya / ($selisih * $t_debitair)), 2);
        $dataair = $this->Tools()->getService('PendaftaranTable')->getByidPeruntukan($t_idperuntukan);
        $t_volume1 = 0;
        $t_volume2 = 0;
        $t_volume3 = 0;
        $t_volume4 = 0;
        $t_volume5 = 0;
        $t_fna1 = 0;
        $t_fna2 = 0;
        $t_fna3 = 0;
        $t_fna4 = 0;
        $t_fna5 = 0;
        $t_npa1 = 0;
        $t_npa2 = 0;
        $t_npa3 = 0;
        $t_npa4 = 0;
        $t_npa5 = 0;
        $t_hda1 = $HDA;
        $t_hda2 = $HDA;
        $t_hda3 = $HDA;
        $t_hda4 = $HDA;
        $t_hda5 = $HDA;

        if ($t_volume <= 50) {
            $t_volume1 = $t_volume;
            $t_fna1 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume1']);
            $t_npa1 = $t_volume1 * $t_fna1 * $HDA;
            $t_hda2 = 0;
            $t_hda3 = 0;
            $t_hda4 = 0;
            $t_hda5 = 0;
        } elseif ($t_volume >= 51 && $t_volume <= 500) {
            $t_volume1 = 50;
            $t_volume2 = $t_volume - $t_volume1;
            $t_fna1 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume1']);
            $t_fna2 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume2']);
            $t_npa1 = $t_volume1 * $t_fna1 * $HDA;
            $t_npa2 = $t_volume2 * $t_fna2 * $HDA;
            $t_hda3 = 0;
            $t_hda4 = 0;
            $t_hda5 = 0;
        } elseif ($t_volume >= 501 && $t_volume <= 1000) {
            $t_volume1 = 50;
            $t_volume2 = 450;
            $t_volume3 = $t_volume - ($t_volume1 + $t_volume2);
            $t_fna1 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume1']);
            $t_fna2 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume2']);
            $t_fna3 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume3']);
            $t_npa1 = $t_volume1 * $t_fna1 * $HDA;
            $t_npa2 = $t_volume2 * $t_fna2 * $HDA;
            $t_npa3 = $t_volume3 * $t_fna3 * $HDA;
            $t_hda4 = 0;
            $t_hda5 = 0;
        } elseif ($t_volume >= 1001 && $t_volume <= 2500) {
            $t_volume1 = 50;
            $t_volume2 = 450;
            $t_volume3 = 500;
            $t_volume4 = $t_volume - ($t_volume1 + $t_volume2 + $t_volume3);
            $t_fna1 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume1']);
            $t_fna2 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume2']);
            $t_fna3 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume3']);
            $t_fna4 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume4']);
            $t_npa1 = $t_volume1 * $t_fna1 * $HDA;
            $t_npa2 = $t_volume2 * $t_fna2 * $HDA;
            $t_npa3 = $t_volume3 * $t_fna3 * $HDA;
            $t_npa4 = $t_volume4 * $t_fna4 * $HDA;
            $t_hda5 = 0;
        } elseif ($t_volume > 2500) {
            $t_volume1 = 50;
            $t_volume2 = 450;
            $t_volume3 = 500;
            $t_volume4 = 1500;
            $t_volume5 = $t_volume - ($t_volume1 + $t_volume2 + $t_volume3 + $t_volume4);
            $t_volume5 = ($t_volume5 < 0) ? 0 : $t_volume5;
            $t_fna1 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume1']);
            $t_fna2 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume2']);
            $t_fna3 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume3']);
            $t_fna4 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume4']);
            $t_fna5 = (60 / 100 * $BKA) + (40 / 100 * $dataair['s_volume5']);
            $t_npa1 = $t_volume1 * $t_fna1 * $HDA;
            $t_npa2 = $t_volume2 * $t_fna2 * $HDA;
            $t_npa3 = $t_volume3 * $t_fna3 * $HDA;
            $t_npa4 = $t_volume4 * $t_fna4 * $HDA;
            $t_npa5 = $t_volume5 * $t_fna5 * $HDA;
        } else {
        }



        $t_totalnpa = ceil($t_npa1 + $t_npa2 + $t_npa3 + $t_npa4 + $t_npa5);
        $t_jmlhpajakasli = ceil($t_totalnpa * $data_get['t_tarifpajak'] / 100);
        // var_dump(str_ireplace(".", "",($data_get['t_kompensasi'])));exit();
        $t_jmlhpajak = $t_jmlhpajakasli - (str_ireplace(".", "", ($data_get['t_kompensasi'])));

        $data_render = array(
            "t_jmlhpajakasli" => number_format($t_jmlhpajakasli, 0, ",", "."),
            "t_volume1" => number_format($t_volume1, 0, ',', '.'),
            "t_volume2" => number_format($t_volume2, 0, ',', '.'),
            "t_volume3" => number_format($t_volume3, 0, ',', '.'),
            "t_volume4" => number_format($t_volume4, 0, ',', '.'),
            "t_volume5" => number_format($t_volume5, 0, ',', '.'),
            "t_fna1" => number_format($t_fna1, 2, ',', '.'),
            "t_fna2" => number_format($t_fna2, 2, ',', '.'),
            "t_fna3" => number_format($t_fna3, 2, ',', '.'),
            "t_fna4" => number_format($t_fna4, 2, ',', '.'),
            "t_fna5" => number_format($t_fna5, 2, ',', '.'),
            "t_hda1" => number_format($t_hda1, 2, ',', '.'),
            "t_hda2" => number_format($t_hda2, 2, ',', '.'),
            "t_hda3" => number_format($t_hda3, 2, ',', '.'),
            "t_hda4" => number_format($t_hda4, 2, ',', '.'),
            "t_hda5" => number_format($t_hda5, 2, ',', '.'),
            "t_npa1" => number_format($t_npa1, 2, ',', '.'),
            "t_npa2" => number_format($t_npa2, 2, ',', '.'),
            "t_npa3" => number_format($t_npa3, 2, ',', '.'),
            "t_npa4" => number_format($t_npa4, 2, ',', '.'),
            "t_npa5" => number_format($t_npa5, 2, ',', '.'),
            "t_totalnpa" =>  number_format($t_totalnpa, 2, ',', '.'),
            "t_jmlhpajak" => number_format($t_jmlhpajak, 2, ',', '.'),


        );

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }


    public function hitungretribusiAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_jumlah1']) + str_ireplace(".", "", $data_get['t_jumlah2']) + str_ireplace(".", "", $data_get['t_jumlah3']) + str_ireplace(".", "", $data_get['t_jumlah4']) + str_ireplace(".", "", $data_get['t_jumlah5']) + str_ireplace(".", "", $data_get['t_jumlah6']) + str_ireplace(".", "", $data_get['t_jumlah7']);
        $data = array(
            't_jmlhpajak' => number_format($t_jumlah, 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungjmlhretribusiAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_volume']) * str_ireplace(".", "", $data_get['t_hargadasar']);
        $data = array(
            't_jumlah' => number_format($t_jumlah, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungtotalretribusiAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_jumlah1']) + str_ireplace(".", "", $data_get['t_jumlah2']) + str_ireplace(".", "", $data_get['t_jumlah3']) + str_ireplace(".", "", $data_get['t_jumlah4']) + str_ireplace(".", "", $data_get['t_jumlah5']) + str_ireplace(".", "", $data_get['t_jumlah6']) + str_ireplace(".", "", $data_get['t_jumlah7']);
        $data = array(
            't_jmlhpajak' => number_format($t_jumlah, 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function caritarifkirAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('DetailkirTable')->getDataId($data_get['t_idtarif']);
        $data_render = array(
            "t_hargadasar" => number_format($data['s_tarif'], 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function caritarifparkirtepiAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('DetailparkirtepiTable')->getDataIdParkirtepi($data_get['t_idtarif']);
        $data_render = array(
            "t_hargadasar" => number_format($data['s_tarif'], 0, ",", "."),
            "t_satuan" => $data['s_satuan']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungretribusipengujiankendaraanbermotorAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_jumlahkendaraan']) * str_ireplace(".", "", $data_get['t_hargadasar']);
        $data = array(
            't_jumlah' => number_format($t_jumlah, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungtotalretribusipengujiankendaraanbermotorAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_jumlah1']) + str_ireplace(".", "", $data_get['t_jumlah2']) + str_ireplace(".", "", $data_get['t_jumlah3']) + str_ireplace(".", "", $data_get['t_jumlah4']) + str_ireplace(".", "", $data_get['t_jumlah5']) + str_ireplace(".", "", $data_get['t_jumlah6']) + str_ireplace(".", "", $data_get['t_jumlah7']);
        $data = array(
            't_jmlhpajak' => number_format($t_jumlah, 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungretribusiparkirAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_volume']) * str_ireplace(".", "", $data_get['t_hargadasar']);
        $data = array(
            't_jumlah' => number_format($t_jumlah, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungtotalretribusiparkirAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_jumlah1']) + str_ireplace(".", "", $data_get['t_jumlah2']) + str_ireplace(".", "", $data_get['t_jumlah3']) + str_ireplace(".", "", $data_get['t_jumlah4']) + str_ireplace(".", "", $data_get['t_jumlah5']) + str_ireplace(".", "", $data_get['t_jumlah6']) + str_ireplace(".", "", $data_get['t_jumlah7']);
        $data = array(
            't_jmlhpajak' => number_format($t_jumlah, 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function caritarifpemadamAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('DetailpemadamTable')->getDataId($data_get['t_idtarif']);
        $data_render = array(
            "t_tarifdasar" => number_format($data['s_tarif'], 0, ",", "."),
            "t_satuan" => $data['s_satuan']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungretpemadamAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_jmltitikbuah']) * str_ireplace(".", "", $data_get['t_tarifdasar']);
        $data = array(
            't_jumlah' => number_format($t_jumlah, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungtotalretpemadamAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jmlhpajak = str_ireplace(".", "", $data_get['t_jumlah1']) + str_ireplace(".", "", $data_get['t_jumlah2']) + str_ireplace(".", "", $data_get['t_jumlah3']) + str_ireplace(".", "", $data_get['t_jumlah4']) + str_ireplace(".", "", $data_get['t_jumlah5']) + str_ireplace(".", "", $data_get['t_jumlah6']) + str_ireplace(".", "", $data_get['t_jumlah7']);
        $data = array(
            't_jmlhpajak' => number_format($t_jmlhpajak, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function caritarifteraAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataTarif = $this->Tools()->getService('DetailteraTable')->getDataTeraId($data_get['t_idtarif']);
        $data = array(
            't_hargadasar' => number_format($dataTarif['s_tarif'], 0, ",", "."),
            't_satuan' => $dataTarif['s_satuan']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungretteraAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_volume']) * str_ireplace(".", "", $data_get['t_hargadasar']);
        $data = array(
            't_jumlah' => number_format($t_jumlah, 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungtotalretteraAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jmlhpajak = str_ireplace(".", "", $data_get['t_jumlah1']) + str_ireplace(".", "", $data_get['t_jumlah2']) + str_ireplace(".", "", $data_get['t_jumlah3']) + str_ireplace(".", "", $data_get['t_jumlah4']) + str_ireplace(".", "", $data_get['t_jumlah5']) + str_ireplace(".", "", $data_get['t_jumlah6']) + str_ireplace(".", "", $data_get['t_jumlah7']) + str_ireplace(".", "", $data_get['t_jumlah8']) + str_ireplace(".", "", $data_get['t_jumlah8']) + str_ireplace(".", "", $data_get['t_jumlah9']) + str_ireplace(".", "", $data_get['t_jumlah10']);
        $data = array(
            't_jmlhpajak' => number_format($t_jmlhpajak, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function caritariftrayekAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('DetailtrayekTable')->getDataId($data_get['t_idtarif']);
        $data_render = array(
            "t_hargadasar" => number_format($data['s_tarif'], 0, ",", "."),
            "t_satuan" => $data['s_satuan']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungrettrayekAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_jmlhperjalanan']) * str_ireplace(".", "", $data_get['t_jmlhkendaraan']) * str_ireplace(".", "", $data_get['t_hargadasar']);
        $data = array(
            't_jumlah' => number_format($t_jumlah, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function carijenispelayananterminalAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataTarif = $this->Tools()->getService('DetailterminalTable')->getdataTarifTerminal($data_get['t_idjenis']);
        $opsi = "";
        $opsi .= "<option value=''>Silahkan Pilih</option>";
        foreach ($dataTarif as $r) {
            $opsi .= "<option value='" . $r['s_idtarif'] . "'>" . str_pad($r['s_idtarif'], 2, "0", STR_PAD_LEFT) . " || " . $r['s_keterangan'] . "</option>";
        }
        $data_render = array(
            'res' => $opsi,
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function caritarifterminalAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('DetailterminalTable')->getDataIdTerminal($data_get['t_idtarif']);
        $data_render = array(
            "t_hargadasar" => number_format($data['s_tarifdasar'], 0, ",", "."),
            "t_satuan" => $data['s_satuan']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cariKlasifikasiTarifKebersihanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataKlasifikasi = $this->Tools()->getService('DetailkebersihanTable')->getDataKlasifikasiKategori($data_get['t_klasifikasi']);
        $opsi = "";
        $opsi .= "<option value=''>Silahkan Pilih</option>";
        foreach ($dataKlasifikasi as $r) {
            $opsi .= "<option value='" . $r['s_idtarif'] . "'>" . str_pad($r['s_idklasifikasi'], 2, "0", STR_PAD_LEFT) . " || " . $r['s_keterangan'] . "</option>";
        }
        $data_render = array(
            'res' => $opsi,
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungretribusikebersihanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $datatarif = $this->Tools()->getService('DetailkebersihanTable')->getDataKlasifikasiTarif($data_get['t_kategori']);
        // var_dump($datatarif['s_nilailuastanah']); exit();
        $t_jmlhpajak = $data_get['t_jmlhbln'] * $datatarif['s_tarifdasar'];
        $data_render = array(
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", "."),
            "t_tarifdasar" => number_format($datatarif['s_tarifdasar'], 0, ",", "."),
            "t_satuan" => $datatarif['s_satuan']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cariKlasifikasiTarifPasarAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataKlasifikasi = $this->Tools()->getService('DetailpasarTable')->getDataKlasifikasiKategori($data_get['t_klasifikasi']);
        $opsi = "";
        $opsi .= "<option value=''>Silahkan Pilih</option>";
        foreach ($dataKlasifikasi as $r) {
            $opsi .= "<option value='" . $r['s_idtarif'] . "'>" . str_pad($r['s_idklasifikasi'], 2, "0", STR_PAD_LEFT) . " || " . $r['s_keterangan'] . "</option>";
        }
        $data_render = array(
            'res' => $opsi,
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungretribusipasarAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        $t_luas = $data_get['t_panjang'] * $data_get['t_lebar'];

        $t_jmlhpajak = $data_get['t_jangkawaktu'] * $t_luas * str_ireplace(".", "", $data_get['t_tarifdasar']);
        $data_render = array(
            // "t_jenisbangunan" => $data_get['t_jenisbangunan'],
            // "t_tipewaktu" => $datatarif['s_satuan'],
            "t_luas" => $t_luas,
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", "."),
            // "t_tarifdasar" => number_format($datatarif['s_tarifdasar'], 0, ",", "."),
        );

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cariKlasifikasiTarifPasargrosirAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataKlasifikasi = $this->Tools()->getService('DetailpasargrosirTable')->getDataKlasifikasiKategori($data_get['t_klasifikasi']);
        $opsi = "";
        $no = 1;
        $opsi .= "<option value=''>Silahkan Pilih</option>";
        foreach ($dataKlasifikasi as $r) {
            $opsi .= "<option value='" . $r['s_idtarif'] . "'>" . $no++ . " || " . $r['s_keterangan'] . "</option>";
        }
        $data_render = array(
            'res' => $opsi,
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cariKlasifikasiTarifPasargrosireditAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataKlasifikasi = $this->Tools()->getService('DetailpasargrosirTable')->getDataKlasifikasiKategori($data_get['t_klasifikasi']);

        $opsi = "";
        $no = 1;
        $opsi .= "<option value=''>Silahkan Pilih</option>";
        foreach ($dataKlasifikasi as $r) {
            if ((int) ($r['s_idtarif']) == (int)($data_get['t_jenisbangunan'])) {
                $selec = 'selected';
                $s_satuan = $r['s_satuan'];
            } else {
                $selec = '';
            }

            $opsi .= "<option " . $selec . " value='" . $r['s_idtarif'] . "'>" . $no++ . " || " . $r['s_keterangan'] . "</option>";
        }
        // var_dump($s_satuan);exit();
        // exit();
        $data_render = array(
            's_satuan' => $s_satuan,
            'res' => $opsi,
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungretribusipasargrosirAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $datatarif = $this->Tools()->getService('DetailpasargrosirTable')->getDataKlasifikasiTarif($data_get['t_jenisbangunan']);
        // var_dump($datatarif['s_nilailuastanah']); exit();
        $t_luas = $data_get['t_panjang'] * $data_get['t_lebar'];
        $t_jmlhpajak = $data_get['t_jmlhbln'] * $t_luas * $datatarif['s_tarifdasar'];
        $data_render = array(
            "t_tipewaktu" => $datatarif['s_satuan'],
            "t_luas" => $t_luas,
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", "."),
            "t_tarifdasar" => number_format($datatarif['s_tarifdasar'], 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function carikategorigolonganparkirAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('DetailtempatparkirTable')->getDataJeniskendaraan($data_get['t_idkorek']);
        $opsi = "";
        $opsi .= "<option value=''>-- SILAHKAN PILIH --</option>";
        foreach ($data as $v) {
            $opsi .= "<option value='" . $v['s_idtarif'] . "'>" . $v['s_idtarif'] . " || " . $v['s_jeniskendaraan'] . "</option>";
        }
        $data_render = array(
            "t_jeniskendaraan" => $opsi
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungretribusitempatparkirAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $datatarif = $this->Tools()->getService('DetailtempatparkirTable')->getDataTarif($data_get['t_jeniskendaraan']);
        $t_jmlhpajak = $data_get['t_jmlhkendaraan'] * $datatarif['s_tarifdasar'];
        $data_render = array(
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", "."),
            "t_tarifdasar" => number_format($datatarif['s_tarifdasar'], 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungretribusirumahdinasAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_luas = $data_get['t_panjang'] * $data_get['t_lebar'];
        $datatarif = $this->Tools()->getService('RumahdinasTable')->getDataRange($t_luas);
        $t_jmlhpajak = ($t_luas * $datatarif['s_tarif'] * $data_get['t_jmlhbln']) - str_ireplace(".", "", $data_get['t_potongan']);
        $data_render = array(
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", "."),
            "t_tarifdasar" => number_format($datatarif['s_tarif'], 0, ",", "."),
            "t_luas" => $t_luas
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungretpangrekAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_luas = $data_get['t_panjang'] * $data_get['t_lebar'];
        $t_tarifdasar = str_ireplace(".", "", $data_get['t_tarifdasar']);
        $t_jmlhpajak = ($t_luas * $t_tarifdasar * $data_get['t_jmlhbln']) - str_ireplace(".", "", $data_get['t_potongan']);
        $data_render = array(
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", "."),
            "t_luas" => $t_luas
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungrettanahlainAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_luas = $data_get['t_panjang'] * $data_get['t_lebar'];
        $t_tarifdasar = str_ireplace(".", "", $data_get['t_tarifdasar']);
        $t_jmlhpajak = ($t_luas * $t_tarifdasar * $data_get['t_jmlhbln']) - str_ireplace(".", "", $data_get['t_potongan']);
        $data_render = array(
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", "."),
            "t_luas" => $t_luas
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungrettanrekAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_luas = $data_get['t_panjang'] * $data_get['t_lebar'];
        $t_jmlhblnhari = $data_get['t_jmlhblnhari'];
        $t_tarifdasar = (int) str_ireplace(".", "", $data_get['t_tarifdasar']);
        $t_jmlhpajak = ($t_luas * $t_tarifdasar * $t_jmlhblnhari) - str_ireplace(".", "", $data_get['t_potongan']);
        $data_render = array(
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", "."),
            "t_luas" => $t_luas
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function CariPendaftaranByObjekAction()
    {
        /** Cari Transaksi By Objek Pajak
         * @param int $npwpd
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 29/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // Mengambil Data WP, OP dan Transaksi
        $op = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdObjek($data_get['idobjek']);
        $dataop = " <div class='col-sm-12' style='font-size:11px'>
        <label class='col-sm-2'>NPWPD</label>
        <div class='col-sm-10'>
        : " . $op['t_npwpd'] . "
        </div>
        </div>
        <div class='col-sm-12' style='font-size:11px'>
        <label class='col-sm-2'>Nama WP</label>
        <div class='col-sm-10'>
        : " . $op['t_nama'] . "
        </div>
        </div>
        <div class='col-sm-12' style='font-size:11px'>
        <label class='col-sm-2'>Alamat WP</label>
        <div class='col-sm-10'>
        : " . $op['t_alamat'] . "
        ,Desa/Kel. " . $op['s_namakel'] . "
        ,Kec. " . $op['s_namakec'] . "
        ,Kab. " . $op['t_kabupaten'] . "
        </div>
        </div>
        <div class='col-sm-12' style='font-size:11px'>
        <label class='col-sm-2'>NIOP</label>
        <div class='col-sm-10'>
        : " . $op['t_nop'] . "
        </div>
        </div>
        <div class='col-sm-12' style='font-size:11px'>
        <label class='col-sm-2'>Nama OP</label>
        <div class='col-sm-10'>
        : " . $op['t_namaobjek'] . "
        </div>
        </div>
        <div class='col-sm-12' style='font-size:11px'>
        <label class='col-sm-2'>Alamat OP</label>
        <div class='col-sm-10'>
        : " . $op['t_alamatobjek'] . "
        ,Desa/Kel. " . $op['s_namakelobjek'] . "
        ,Kec. " . $op['s_namakecobjek'] . "
        ,Kab. " . $op['t_kabupatenobjek'] . "
        </div>
        </div>
        <div class='col-sm-12' style='font-size:11px'>
        <label class='col-sm-2 control-label'>Periode Pajak</label>
        <div class='col-sm-2'>
        <input type='text' class='form-control' name='periodepajak' id='periodepajak'>
        </div>
        <div class='col-sm-1'>
        <input type='button' class='btn btn-sm btn-primary' value='Cari' onclick='CariPendataanByObjek(" . $op['t_idobjek'] . ");'>
        </div>
        </div>";
        $datatransaksi = "";
        $data_render = array(
            "dataop" => $dataop,
            "datatransaksi" => $datatransaksi
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function CariPendataanByObjekAction()
    {
        /** Cari Pendataan By Objek Pajak
         * @param int $idobjek
         * @param int $periodepajak
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 29/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $abulan = ['1' => 'Januari', '2' => 'Februari', '3' => 'Maret', '4' => 'April', '5' => 'Mei', '6' => 'Juni', '7' => 'Juli', '8' => 'Agustus', '9' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
        $dataawal = $this->Tools()->getService('ObjekTable')->getPendataanAwalbyIdObjek($data_get['idobjek']);

        $datatransaksi = "  <div class='remove-columns'>
        <table class='table table-bordered table-striped table-condensed cf' style='font-size : 11px; color:black'>
        <thead class='cf' style='background-color:blue'>
        <tr>";
        if ($dataawal['t_idkorek'] == 34) {
            $datatransaksi .=
                "
        <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>No</th>
        ";
        } else {
            $datatransaksi .=
                "
        <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Masa Pajak</th>
        ";
        }

        $datatransaksi .= "<th colspan='4' style='background-color: #00BCA4; color: white; text-align:center'>Pendataan</th>
        <th colspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Pembayaran</th>
        </tr>
        <tr>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Kode Rekening</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Masa Pajak</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Pajak (Rp.)</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Jml. (Rp.)</th>
        </tr>
        </thead>
        <tbody>";
        //        $tombolTeguranDanSKPDJ = "<td data-title='#' style='text-align:right'><a href='javascript:void(0)' class='btn btn-primary btn-xs' onclick='bukaCetakSuratTeguran($dataparameterTeguran, $data_get[idobjek])'><i class='glyph-icon icon-print'></i> Surat Teguran</href> <a href='javascript:void(0)' class='btn btn-warning btn-xs' onclick='pilihskpdjabatan($dataparameter)'><i class='glyph-icon icon-hand-o-up'></i> SKPD Jabatan</href></td>";

        if ($dataawal['t_idkorek'] == 34) { //katering
            $rowKatering = $this->Tools()->getService('ObjekTable')->getPendataanKatering($data_get['periodepajak'], $data_get['idobjek']);
            $i = 1;
            foreach ($rowKatering as $row) {
                $t_tglpembayaran = (!empty($row['t_tglpembayaran']) ? date('d-m-Y', strtotime($row['t_tglpembayaran'])) : '-'); // returns true
                $datatransaksi .= "         <tr>
                <td data-title='No' style='text-align:center'>" . $i++ . "</td>
                <td data-title='Kode Rekening'>" . $row['korek'] . " - " . $row['s_namakorek'] . "</td>
                <td data-title='Tgl' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</td>
                <td data-title='Masa Pajak' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>
                <td data-title='Pajak' style='text-align:right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>
                <td data-title='Tgl. Bayar' style='text-align:center'>" . $t_tglpembayaran . "</td>
                <td data-title='Jml. Bayar' style='text-align:right'>" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "</td>

                </tr>";
            }
        } else {
            for ($i = 1; $i <= 12; $i++) {
                $row = $this->Tools()->getService('ObjekTable')->getPendataanbyMasa($i, $data_get['periodepajak'], $data_get['idobjek']);
                if ($row == false) {
                    //                $today = (int) date('m');
                    $tglpembanding = $data_get['periodepajak'] . "-" . str_pad($i, 2, '0', STR_PAD_LEFT) . "-01";
                    if ($dataawal['t_masaawal'] <= date('Y-m-t', strtotime($tglpembanding)) && date('Y-m-d') >= date('Y-m-t', strtotime($tglpembanding))) { //jika belum melaporkan pajak dan pernah melaporkan sebelumnya
                        $dataparameter = $data_get['periodepajak'] . "" . str_pad($i, 2, '0', STR_PAD_LEFT) . "01";
                        $dataparameterTeguran = $data_get['periodepajak'] . "" . str_pad($i, 2, '0', STR_PAD_LEFT) . "01";
                        $datatransaksi .= "     <tr>
                        <td data-title='Masa Pajak' style='text-align:left'>" . $abulan[$i] . "</td>
                        <td data-title='Kode Rekening'><b style='color:red'>Belum Melakukan Pelaporan Pajak</b></td>
                        <td data-title='Tgl' style='text-align:center'></td>
                        <td data-title='Masa Pajak' style='text-align:center'></td>
                        <td data-title='Pajak' style='text-align:right'></td>
                        <td data-title='Tgl. Bayar' style='text-align:center'>-</td>
                        <td data-title='#' style='text-align:right'>
                        <a href='javascript:void(0)' class='btn btn-warning btn-xs' onclick='pilihskpdjabatan($dataparameter)'><i class='glyph-icon icon-hand-o-up'></i> SKPD Jabatan</href></td>
                        </tr>";
                        //<a href='javascript:void(0)' class='btn btn-primary btn-xs' onclick='bukaCetakSuratTeguran($dataparameterTeguran, $data_get[idobjek])'><i class='glyph-icon icon-print'></i> Surat Teguran</href> 
                    } else { // data sebelum wp daftar dan dilakukan pendataan sama sekali
                        $datatransaksi .= "     <tr>
                        <td data-title='Masa Pajak' style='text-align:left'>" . $abulan[$i] . "</td>
                        <td data-title='Kode Rekening'>-</td>
                        <td data-title='Tgl' style='text-align:center'>-</td>
                        <td data-title='Masa Pajak' style='text-align:center'>-</td>
                        <td data-title='Pajak' style='text-align:right'>-</td>
                        <td data-title='Tgl. Bayar' style='text-align:center'>-</td>
                        <td data-title='Jml. Bayar' style='text-align:right'>-</td>
                        </tr>";
                    }
                } else {
                    $t_tglpembayaran = (!empty($row['t_tglpembayaran']) ? date('d-m-Y', strtotime($row['t_tglpembayaran'])) : '-'); // returns true
                    $datatransaksi .= "         <tr>
                    <td data-title='Masa Pajak' style='text-align:left'>" . $abulan[$i] . "</td>
                    <td data-title='Kode Rekening'>" . $row['korek'] . " - " . $row['s_namakorek'] . "</td>
                    <td data-title='Tgl' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</td>
                    <td data-title='Masa Pajak' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>
                    <td data-title='Pajak' style='text-align:right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>
                    <td data-title='Tgl. Bayar' style='text-align:center'>" . $t_tglpembayaran . "</td>
                    <td data-title='Jml. Bayar' style='text-align:right'>" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "</td>
                    </tr>";
                }
            }
        }
        $datatransaksi .= "             </tbody>
        </table>
        </div>";
        $data_render = array(
            "datatransaksi" => $datatransaksi
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function CariPendataanByObjekOfficialAction()
    {
        /** Cari Pendataan By Objek Pajak
         * @param int $idobjek
         * @param int $periodepajak
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 29/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $datatransaksi = "  <div class='remove-columns'>
        <table class='table table-bordered table-striped table-condensed cf' style='font-size : 11px; color:black'>
        <thead class='cf' style='background-color:blue'>
        <tr>
        <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>No.</th>
        <th colspan='4' style='background-color: #00BCA4; color: white; text-align:center'>Pendataan</th>
        <th colspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Pembayaran</th>
        </tr>
        <tr>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Kode Rekening</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Masa Pajak</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Pajak (Rp.)</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Jml. (Rp.)</th>
        </tr>
        </thead>
        <tbody>";
        $dataawal = $this->Tools()->getService('ObjekTable')->getPendataanAwalbyIdObjek($data_get['idobjek']);
        if ($dataawal['t_idkorek'] == 25) { //katering
            $rowKatering = $this->Tools()->getService('ObjekTable')->getPendataanKatering($data_get['periodepajak'], $data_get['idobjek']);
            $i = 1;
            foreach ($rowKatering as $row) {
                $t_tglpembayaran = (!empty($row['t_tglpembayaran']) ? date('d-m-Y', strtotime($row['t_tglpembayaran'])) : '-'); // returns true
                $datatransaksi .= "         <tr>
                <td data-title='No.' style='text-align:center'>" . $i++ . "</td>
                <td data-title='Kode Rekening'>" . $row['korek'] . " - " . $row['s_namakorek'] . "</td>
                <td data-title='Tgl' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</td>
                <td data-title='Masa Pajak' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>
                <td data-title='Pajak' style='text-align:right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>
                <td data-title='Tgl. Bayar' style='text-align:center'>" . $t_tglpembayaran . "</td>
                <td data-title='Jml. Bayar' style='text-align:right'>" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "</td>

                </tr>";
            }
        } else {
            for ($i = 1; $i <= 12; $i++) {
                $row = $this->Tools()->getService('ObjekTable')->getPendataanbyMasa($i, $data_get['periodepajak'], $data_get['idobjek']);
                if ($row == false) {
                    //                $today = (int) date('m');
                    $tglpembanding = $data_get['periodepajak'] . "-" . str_pad($i, 2, '0', STR_PAD_LEFT) . "-01";
                    if ($dataawal['t_masaawal'] <= date('Y-m-t', strtotime($tglpembanding)) && date('Y-m-d') >= date('Y-m-t', strtotime($tglpembanding))) { //jika belum melaporkan pajak dan pernah melaporkan sebelumnya
                        $dataparameter = $data_get['periodepajak'] . "" . str_pad($i, 2, '0', STR_PAD_LEFT) . "01";
                        $dataparameterTeguran = $data_get['periodepajak'] . "" . str_pad($i, 2, '0', STR_PAD_LEFT) . "01";
                        $datatransaksi .= "     <tr>
                        <td data-title='No.' style='text-align:center'>" . $i . "</td>
                        <td data-title='Kode Rekening'><b style='color:red'>Belum dilakukan pendataan</b></td>
                        <td data-title='Tgl' style='text-align:center'></td>
                        <td data-title='Masa Pajak' style='text-align:center'></td>
                        <td data-title='Pajak' style='text-align:right'></td>
                        <td data-title='Tgl. Bayar' style='text-align:center'>" . $dataawal['s_jenisobjek'] . "</td>";

                        $datatransaksi .= "<td data-title='#' style='text-align:center'></td>";

                        $datatransaksi .= "</tr>";
                    } else { // data sebelum wp daftar dan dilakukan pendataan sama sekali
                        $datatransaksi .= "     <tr>
                        <td data-title='No.' style='text-align:center'>" . $i . "</td>
                        <td data-title='Kode Rekening'>-</td>
                        <td data-title='Tgl' style='text-align:center'>-</td>
                        <td data-title='Masa Pajak' style='text-align:center'>-</td>
                        <td data-title='Pajak' style='text-align:right'>-</td>
                        <td data-title='Tgl. Bayar' style='text-align:center'>-</td>
                        <td data-title='Jml. Bayar' style='text-align:right'>-</td>
                        </tr>";
                    }
                } else {
                    $t_tglpembayaran = (!empty($row['t_tglpembayaran']) ? date('d-m-Y', strtotime($row['t_tglpembayaran'])) : '-'); // returns true
                    $datatransaksi .= "         <tr>
                    <td data-title='No.' style='text-align:center'>" . $i . "</td>
                    <td data-title='Kode Rekening'>" . $row['korek'] . " - " . $row['s_namakorek'] . "</td>
                    <td data-title='Tgl' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</td>
                    <td data-title='Masa Pajak' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>
                    <td data-title='Pajak' style='text-align:right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>
                    <td data-title='Tgl. Bayar' style='text-align:center'>" . $t_tglpembayaran . "</td>
                    <td data-title='Jml. Bayar' style='text-align:right'>" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "</td>
                    </tr>";
                }
            }
        }
        $datatransaksi .= "             </tbody>
        </table>
        </div>";
        $data_render = array(
            "datatransaksi" => $datatransaksi
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function CariPendataanReklameByObjekAction()
    {
        /** Cari Pendataan By Objek Pajak
         * @param int $idobjek
         * @param int $periodepajak
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 29/11/2016
         */

        $req = $this->getRequest();
        $data_get = $req->getPost();
        $datatransaksi = "  <div class='remove-columns'>
        <table class='table table-bordered table-striped table-condensed cf' style='font-size : 11px; color:black'>
        <thead class='cf' style='background-color:blue'>
        <tr>
        <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>No.</th>
        <th colspan='4' style='background-color: #00BCA4; color: white; text-align:center'>Pendataan</th>
        <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Penetapan</th>
        <th colspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Pembayaran</th>
        </tr>
        <tr>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Kode Rekening</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Masa Pajak</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Pajak (Rp.)</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Jml. (Rp.)</th>
        </tr>
        </thead>
        <tbody>";
        $dataHistory = $this->Tools()->getService('ObjekTable')->getHistoryReklame($data_get['idobjek']);
        $i = 1;
        foreach ($dataHistory as $row) {
            $t_tglpenetapan = (!empty($row['t_tglpenetapan']) ? date('d-m-Y', strtotime($row['t_tglpenetapan'])) : '-'); // returns true
            $t_tglpembayaran = (!empty($row['t_tglpembayaran']) ? date('d-m-Y', strtotime($row['t_tglpembayaran'])) : '-'); // returns true
            $datatransaksi .= " <tr>
            <td data-title='No.' style='text-align:center'>" . $i++ . "</td>
            <td data-title='Kode Rekening'>" . $row['korek'] . "<br>" . $row['s_namakorek'] . "";
            if (!empty($row['t_suratrekomendasi'])) {
                $datatransaksi .= " <br>File :  <a href='http://" . $_SERVER['HTTP_HOST'] . "/" . $row['t_suratrekomendasi'] . "/" . $row['t_namafilerekomendasi'] . "' target='_blank'>" . $row['t_namafilerekomendasi'] . "</a> ";
            }
            $datatransaksi .= "</td>
            <td data-title='Tgl' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</td>
            <td data-title='Masa Pajak' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>
            <td data-title='Pajak' style='text-align:right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>
            <td data-title='Tgl' style='text-align:center'>" . $t_tglpenetapan . "</td>
            <td data-title='Tgl' style='text-align:center'>" . $t_tglpembayaran . "</td>
            <td data-title='Pajak' style='text-align:right'>" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "</td>
            </tr>";
        }

        $datatransaksi .= "             </tbody>
        </table>
        </div>";
        $data_render = array(
            "datatransaksi" => $datatransaksi
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function CariPendataanAirByObjekAction()
    {
        /** Cari Pendataan By Objek Pajak
         * @param int $idobjek
         * @param int $periodepajak
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 29/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $datatransaksi = "  <div class='remove-columns'>
        <table class='table table-bordered table-striped table-condensed cf' style='font-size : 11px; color:black'>
        <thead class='cf' style='background-color:blue'>
        <tr>
        <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>No.</th>
        <th colspan='4' style='background-color: #00BCA4; color: white; text-align:center'>Pendataan</th>
        <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Penetapan</th>
        <th colspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Pembayaran</th>
        </tr>
        <tr>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Kode Rekening</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Masa Pajak</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Pajak (Rp.)</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
        <th style='background-color: #00BCA4; color: white; text-align:center'>Jml. (Rp.)</th>
        </tr>
        </thead>
        <tbody>";
        $dataawal = $this->Tools()->getService('ObjekTable')->getPendataanAwalbyIdObjek($data_get['idobjek']);
        for ($i = 1; $i <= 12; $i++) {
            $row = $this->Tools()->getService('ObjekTable')->getPendataanbyMasa($i, $data_get['periodepajak'], $data_get['idobjek']);
            if ($row == false) {
                $tglpembanding = $data_get['periodepajak'] . "-" . str_pad($i, 2, '0', STR_PAD_LEFT) . "-01";
                if ($dataawal['t_masaawal'] <= date('Y-m-t', strtotime($tglpembanding)) && date('Y-m-d') >= date('Y-m-t', strtotime($tglpembanding))) { //jika belum melaporkan pajak dan pernah melaporkan sebelumnya
                    $dataparameter = $data_get['periodepajak'] . "" . str_pad($i, 2, '0', STR_PAD_LEFT) . "01";
                    $dataparameterTeguran = $data_get['periodepajak'] . "" . str_pad($i, 2, '0', STR_PAD_LEFT) . "01" . str_pad($data_get['idobjek'], 9, '0', STR_PAD_LEFT);
                    $datatransaksi .= "     <tr>
                    <td data-title='No.' style='text-align:center'>" . $i . "</td>
                    <td data-title='Kode Rekening'><b style='color:red'>Belum Melakukan Penetapan</b></td>
                    <td data-title='Tgl' style='text-align:center'></td>
                    <td data-title='Masa Pajak' style='text-align:center'></td>
                    <td data-title='Pajak' style='text-align:right'></td>
                    <td data-title='Tgl. Penetapan' style='text-align:center'></td>
                    <td data-title='Tgl. Bayar' style='text-align:center'></td>
                    <td data-title='#' style='text-align:right'><a href='javascript:void(0)' class='btn btn-warning btn-xs' onclick='pilihskpdjabatan($dataparameter)'><i class='glyph-icon icon-hand-o-up'></i> SKPD Jabatan</href></td>
                    </tr>";
                } else { // data sebelum wp daftar dan dilakukan pendataan sama sekali
                    $datatransaksi .= "     <tr>
                    <td data-title='No.' style='text-align:center'>" . $i . "</td>
                    <td data-title='Kode Rekening'>-</td>
                    <td data-title='Tgl' style='text-align:center'>-</td>
                    <td data-title='Masa Pajak' style='text-align:center'>-</td>
                    <td data-title='Pajak' style='text-align:right'>-</td>
                    <td data-title='Tgl. Penetapan' style='text-align:center'>-</td>
                    <td data-title='Tgl. Bayar' style='text-align:center'>-</td>
                    <td data-title='Jml. Bayar' style='text-align:right'>-</td>
                    </tr>";
                }
            } else {
                $t_tglpembayaran = (!empty($row['t_tglpembayaran']) ? date('d-m-Y', strtotime($row['t_tglpembayaran'])) : '-'); // returns true
                $datatransaksi .= "         <tr>
                <td data-title='No.' style='text-align:center'>" . $i . "</td>
                <td data-title='Kode Rekening'>" . $row['korek'] . " - " . $row['s_namakorek'] . "</td>
                <td data-title='Tgl' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</td>
                <td data-title='Masa Pajak' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>
                <td data-title='Pajak' style='text-align:right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>
                <td data-title='Tgl. Penetapan' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_tglpenetapan'])) . "</td>
                <td data-title='Tgl. Bayar' style='text-align:center'>" . $t_tglpembayaran . "</td>
                <td data-title='Jml. Bayar' style='text-align:right'>" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "</td>
                </tr>";
            }
        }
        $datatransaksi .= "             </tbody>
        </table>
        </div>";
        $data_render = array(
            "datatransaksi" => $datatransaksi
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridRekeningAction()
    {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
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
        $count = $this->Tools()->getService('RekeningTable')->getGridCountRekening($base, $parametercari);
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
        $data = $this->Tools()->getService('RekeningTable')->getGridDataRekening($base, $start, $parametercari);

        if ($parametercari['t_jenisobjek'] == 4 || $parametercari['t_jenisobjek'] == 5) {
            foreach ($data as $row) {
                $s .= "<tr>";
                $s .= "<td>" . $row['korek'] . "</td>";
                $s .= "<td>" . $row['s_namakorek'] . "</td>";
                $s .= "<td><a href='#' onclick='pilihRekening(" . $row['s_idkorek'] . ");return false;' class='btn btn-sm btn-primary'><span class='glyph-icon icon-hand-o-up'> Pilih </a></td>";
                $s .= "</tr>";
            }
        } else {
            foreach ($data as $row) {
                $s .= "<tr>";
                $s .= "<td>" . $row['korek'] . "</td>";
                $s .= "<td>" . $row['s_namakorek'] . "</td>";
                $s .= "<td>" . $row['s_persentarifkorek'] . "</td>";
                $s .= "<td><a href='#' onclick='pilihRekening(" . $row['s_idkorek'] . ");return false;' class='btn btn-sm btn-primary'><span class='glyph-icon icon-hand-o-up'> Pilih </a></td>";
                $s .= "</tr>";
            }
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

    public function pilihRekeningAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataRekening = $this->Tools()->getService('RekeningTable')->getDataRekeningId($data_get['s_idkorek']);
        if ($dataRekening['t_berdasarmasa'] == 'Yes') {
            $t_berdasarmasa = "Berdasar Masa";
        } else {
            $t_berdasarmasa = "Tidak Berdasar Masa";
        }
        $opsi = "";
        if ($dataRekening['s_jenisobjek'] == 4) {
            $dataReklame = $this->Tools()->getService('ReklameTable')->getDataReklameByIdRekening($data_get['s_idkorek']);
            $opsi .= "<option value=''>Silahkan Pilih</option>";
            foreach ($dataReklame as $row) {
                $opsi .= "<option value='" . $row['s_kodejenis'] . "'>" . $row['s_namareklame'] . "</option>";
            }
        }

        $t_klasifikasi = "";
        if ($dataRekening['s_jenisobjek'] == 5) {
            $dataKlasifikasi = $this->Tools()->getService('DetailPpjTable')->getcomboIdKlasifikasi($data_get['s_idkorek']);
            $t_klasifikasi .= "<option value=''>Silahkan Pilih</option>";
            foreach ($dataKlasifikasi as $row) {
                $t_klasifikasi .= "<option value='" . $row['s_idklasifikasippj'] . "'>" . $row['s_namaklasifikasi'] . "</option>";
            }
        }


        $data = array(
            't_idkorek' => $dataRekening['s_idkorek'],
            't_korek' => $dataRekening['korek'],
            't_namakorek' => strtoupper($dataRekening['s_namakorek']),
            't_tarifpajak' => $dataRekening['s_persentarifkorek'],
            't_tarifdasarkorek' => number_format($dataRekening['s_tarifdasarkorek'], 0, ',', '.'),
            't_jenisreklame' => $opsi,
            't_klasifikasi' => $t_klasifikasi,
            't_berdasarmasa' => $t_berdasarmasa,
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungpajakppjAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        if ($data_get['t_klasifikasi'] == 1) {
            $t_klasifikasi = $data_get['t_klasifikasi'];
            $t_jumlahpajak = $data_get['t_jumlahbagihasil'];

            $data = array(
                't_klasifikasi' => $t_klasifikasi,
                't_jmlhpajak' => $t_jumlahpajak,
            );
            return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
        } elseif ($data_get['t_klasifikasi'] == 2) {
            $t_klasifikasi = $data_get['t_klasifikasi'];
            $t_jumlahtagihan = str_replace(".", "", $data_get['t_jumlahtagihan']);
            $t_biayapemakaian = str_replace(".", "", $data_get['t_biayapemakaian']);
            $t_tarif = 1.5 / 100;
            $t_njtl = $t_jumlahtagihan + $t_biayapemakaian;
            $t_jumlahpajak =  $t_njtl * $t_tarif;

            $data = array(
                't_klasifikasi' => $t_klasifikasi,
                't_njtl' => number_format($t_njtl, 0, ',', '.'),
                't_jmlhpajak' => number_format($t_jumlahpajak, 0, ',', '.'),
            );
            return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
        } elseif ($data_get['t_klasifikasi'] == 3) {
            $hargasatuanlistrik = $this->Tools()->getService('DetailPpjTable')->getHargaSatuanListrikid($data_get['t_hargasatuanlistrik']);
            $hargalistrik = $hargasatuanlistrik['s_hargasatuanlistrik'];
            $t_klasifikasi = $data_get['t_klasifikasi'];
            $t_jumlahkwh = str_replace(".", "", $data_get['t_jumlahkwh']);
            $t_faktordaya = $data_get['t_faktordaya'];
            $t_tarif = 1 / 100;
            $t_njtl = $t_jumlahkwh * $t_faktordaya * $hargalistrik;
            $t_jumlahpajak = $t_njtl * $t_tarif;


            $data = array(
                't_klasifikasi' => $t_klasifikasi,
                't_njtl' => number_format($t_njtl, 0, ',', '.'),
                't_jmlhpajak' => number_format($t_jumlahpajak, 0, ',', '.'),
            );
            return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
        } elseif ($data_get['t_klasifikasi'] == 4) {
            $hargasatuanlistrik = $this->Tools()->getService('DetailPpjTable')->getHargaSatuanListrikid($data_get['t_hargasatuanlistrik']);
            $hargalistrik = $hargasatuanlistrik['s_hargasatuanlistrik'];
            $t_klasifikasi = $data_get['t_klasifikasi'];

            $t_jumlahkvautama = str_replace(".", "", $data_get['t_jumlahkvautama']);
            $t_jumlahkvacadangan = str_replace(".", "", $data_get['t_jumlahkvacadangan']);
            $t_jumlahkvadarurat = str_replace(".", "", $data_get['t_jumlahkvadarurat']);

            $t_jamnyalautama = $data_get['t_jamnyalautama'];
            $t_jamnyalacadangan = $data_get['t_jamnyalacadangan'];
            $t_jamnyaladarurat = $data_get['t_jamnyaladarurat'];

            $t_faktordayautama = $data_get['t_faktordayautama'];
            $t_tarifutama = 1;

            $t_njtlutama = $t_jumlahkvautama * $t_faktordayautama * $t_jamnyalautama * $hargalistrik;
            $t_njtlcadangan = $t_jumlahkvacadangan * $t_faktordayautama * $t_jamnyalacadangan * $hargalistrik;
            $t_njtldarurat = $t_jumlahkvadarurat * $t_faktordayautama * $t_jamnyaladarurat * $hargalistrik;

            $t_jumlahutama = $t_njtlutama * $t_tarifutama / 100;
            $t_jumlahcadangan = $t_njtlcadangan * $t_tarifutama / 100;
            $t_jumlahdarurat = $t_njtldarurat * $t_tarifutama / 100;

            $t_jumlahpajak = $t_jumlahutama + $t_jumlahcadangan + $t_jumlahdarurat;

            $data = array(
                't_klasifikasi' => $t_klasifikasi,
                't_jumlahutama' => number_format($t_jumlahutama, 0, ',', '.'),
                't_jumlahcadangan' => number_format($t_jumlahcadangan, 0, ',', '.'),
                't_jumlahdarurat' => number_format($t_jumlahdarurat, 0, ',', '.'),
                't_jmlhpajak' => number_format($t_jumlahpajak, 0, ',', '.'),
                't_njtlutama' => number_format($t_njtlutama, 0, ',', '.'),
                't_njtlcadangan' => number_format($t_njtlcadangan, 0, ',', '.'),
                't_njtldarurat' => number_format($t_njtldarurat, 0, ',', '.'),
            );
            return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
        }
    }


    public function formPerhitunganPpjAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $combohargasatuanlistrik = $this->Tools()->getService('DetailPpjTable')->getHargaSatuanListrik();
        $form = "";
        if ($data_get['t_klasifikasi'] == 1) {
            if (!empty($data_get['t_idtransaksi'])) {
                $val = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['t_idtransaksi']);
                $jumlahbagihasil = number_format($val['t_jumlahbagihasil'], 0, ',', '.');
                $iddetail = $val['t_iddetailppj'];
            } else {
                $jumlahbagihasil = 0;
            }
            $form .= "<label class='col-sm-2 control-label'></label>";
            $form .= "<div class='col-sm-7'>";
            $form .= "
            <table class='table table-bordered table-striped table-condensed cf' style='font-size: 11px;'>
            <tr>
                <th style='background-color:#00BCA4; color: white;' class='text-center'>Jumlah Setoran (Rp. )</th>
            </tr>
            <tr>
                <td>
                    <input type='text' id='jumlahbagihasil' name='jumlahbagihasil' value='" . $jumlahbagihasil;
            $form .=
                "' class='form-control' style='text-align:right;' onchange='hitungpajakppj()' onkeypress='return numbersonly(this, event);' onkeyup='this.value = formatCurrency(this.value);hitungpajakppj()'>
                </td> 
            </tr>
            <tr>
                <td colspan='3'>
                    
                </td>
            </tr>
            <input type='hidden' id='t_iddetailppj' name='t_iddetailppj' readonly value='" . $iddetail;
            $form .=
                "' class='form-control' style='text-align:right;'>
            </table>
            ";
            $form .= "</div>";
        } elseif ($data_get['t_klasifikasi'] == 2) {
            if (!empty($data_get['t_idtransaksi'])) {
                $val = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['t_idtransaksi']);
                $jumlahtagihan = number_format($val['t_jumlahtagihan'], 0, ',', '.');
                $biayapemakaian = number_format($val['t_biayapemakaian'], 0, ',', '.');
                $njtl = number_format($val['t_jumlahtagihan'] + $val['t_biayapemakaian'], 0, ',', '.');
                $iddetail = $val['t_iddetailppj'];
            } else {
                $jumlahtagihan = 0;
                $biayapemakaian = 0;
                $njtl = 0;
            }
            $form .= "<label class='col-sm-2 control-label'></label>";
            $form .= "<div class='col-sm-7'>";
            $form .= "
            <table class='table table-bordered table-striped table-condensed cf' style='font-size: 11px;'>
            <tr>
                <th style='background-color:#00BCA4; color: white;' class='text-center'>Jumlah Tagihan (Rp. )</th>
                <th style='background-color:#00BCA4; color: white;' class='text-center'>Biaya Pemakaian Kwh (Rp. )</th>
                <th style='background-color:#00BCA4; color: white;' class='text-center'>NJTL</th>
            </tr>   
            <tr>
                <td>
                    <input type='text' id='jumlahtagihan' name='jumlahtagihan' value='" . $jumlahtagihan;
            $form .=
                "' class='form-control' style='text-align:right;' onkeypress='return numbersonly(this, event);' onkeyup='this.value = formatCurrency(this.value);hitungpajakppj();' onchange='hitungpajakppj()'>
                </td> 
                <td>
                    <input type='text' id='biayapemakaian' name='biayapemakaian'value='" . $biayapemakaian;
            $form .=
                "' class='form-control' style='text-align:right;' onkeypress='return numbersonly(this, event);' onkeyup='this.value = formatCurrency(this.value);hitungpajakppj();' onchange='hitungpajakppj()'>
                </td>
                <td>
                    <input type='text' id='njtl' name='njtl' value='" . $njtl;
            $form .=
                "' readonly class='form-control' style='text-align:right;'>
                </td> 
            </tr>
            <tr>
                <td colspan='3'>
                    <b><i>NJTL = Jumlah Tagihan + Biaya Pemakaian</i></b><br>
                    <b><i>Tarif Pajak = 1,5%</i></b><br>
                    <b><i>Total Pajak = NJTL x Tarif Pajak</i></b>
                </td>
            </tr>
            <input type='hidden' id='t_iddetailppj' name='t_iddetailppj' readonly value='" . $iddetail;
            $form .=
                "' class='form-control' style='text-align:right;'>
            </table>
            ";
            $form .= "</div>";
        } elseif ($data_get['t_klasifikasi'] == 3) {
            if (!empty($data_get['t_idtransaksi'])) {
                $val = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['t_idtransaksi']);
                $hargasatuanlistrik = $this->Tools()->getService('DetailPpjTable')->getHargaSatuanListrikid($val['t_hargasatuanlistrik']);
                $kwh = number_format($val['t_jumlahkwh'], 0, ',', '.');
                $njtl = number_format($val['t_jumlahkwh'] * 85 / 100 * $hargasatuanlistrik['s_hargasatuanlistrik'], 0, ',', '.');
                $iddetail = $val['t_iddetailppj'];
            } else {
                $kwh = 0;
                $njtl = 0;
            }
            $form .= "<label class='col-sm-2 control-label'>Harga Satuan Listrik</label>";
            $form .= "<div class='col-sm-6'>";
            $form .=
                "<select id='hargasatuanlistrik' name='hargasatuanlistrik'
                 class='form-control' onchange='hitungpajakppj()'>
                        <option value=''>Silahkan Pilih</option>";

            foreach ($combohargasatuanlistrik as $r) {
                if ($val['t_hargasatuanlistrik'] == $r['s_idhargasatuanlistrik']) {
                    $selected = "selected";
                } else {
                    $selected = "";
                }
                $form .= "<option value='" . $r['s_idhargasatuanlistrik'] . "'";
                $form .= $selected;
                $form .= ">" . $r['s_namasatuanlistrik'] . ", Rp. " . number_format($r['s_hargasatuanlistrik'], 0, ',', '.') . "</option>";
            }

            $form .= "</select>";
            $form .=
                "
            <table class='table table-bordered table-striped table-condensed cf' style='font-size: 11px;'>
            <tr>
                <th style='background-color:#00BCA4; color: white;' class='text-center'>Jumlah Kwh/bulan</th>
                <th style='background-color:#00BCA4; color: white;' class='text-center'>Faktor Daya</th>
                <th style='background-color:#00BCA4; color: white;' class='text-center'>NJTL</th>
            </tr>
            <tr>
                <td>
                    <input type='text' id='jumlahkwh' class='form-control' name='jumlahkwh' value='" . $kwh;
            $form .=
                "' style='text-align:right;' onkeypress='return numbersonly(this, event);' onkeyup='this.value = formatCurrency(this.value);hitungpajakppj();' onchange='hitungpajakppj()'>
                </td> 
                <td>
                    <input type='text' id='faktordaya' name='faktordaya' class='form-control' style='text-align:right;' readonly value='0.85'>
                </td>
                <td>
                    <input type='text' id='njtl' name='njtl' value='" . $njtl;
            $form .=
                "' readonly class='form-control' style='text-align:right;'>
                </td>
            </tr>
            <tr>
                <td colspan='4'>
                    <b><i>NJTL = Jumlah Kwh/Bulan x Faktor Daya x Harga Satuan Listrik</i></b><br>
                    <b><i>Tarif Pajak = 1%</i></b><br>
                    <b><i>NJTL = NJTL x Tarif Pajak</i></b>
                </td>
            </tr>
            <input type='hidden' id='t_iddetailppj' name='t_iddetailppj' readonly value='" . $iddetail;
            $form .=
                "' class='form-control' style='text-align:right;'>
            </table>
            ";
            $form .= "</div>";
        } elseif ($data_get['t_klasifikasi'] == 4) {
            if (!empty($data_get['t_idtransaksi'])) {

                $val = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['t_idtransaksi']);
                $iddetail = $val['t_iddetailppj'];

                $hargasatuanlistrik = $this->Tools()->getService('DetailPpjTable')->getHargaSatuanListrikid($val['t_hargasatuanlistrik']);

                $t_jumlahkvautama = $val['t_jumlahkvautama'];
                $t_jumlahkvacadangan = $val['t_jumlahkvacadangan'];
                $t_jumlahkvadarurat = $val['t_jumlahkvadarurat'];

                $t_jamnyalautama = number_format($val['t_jamnyalautama'], 0, ',', '.');
                $t_jamnyalacadangan = number_format($val['t_jamnyalacadangan'], 0, ',', '.');
                $t_jamnyaladarurat = number_format($val['t_jamnyaladarurat'], 0, ',', '.');

                $t_faktordaya = 85;

                $njtlutama = $t_jumlahkvautama * $t_faktordaya / 100 * $t_jamnyalautama * $hargasatuanlistrik['s_hargasatuanlistrik'];
                $njtlcadangan = $t_jumlahkvacadangan * $t_faktordaya / 100 * $t_jamnyalacadangan * $hargasatuanlistrik['s_hargasatuanlistrik'];
                $njtldarurat = $t_jumlahkvadarurat * $t_faktordaya / 100 * $t_jamnyaladarurat * $hargasatuanlistrik['s_hargasatuanlistrik'];

                $ppjutama = $njtlutama * $val['t_tarif'] / 100;
                $ppjcadangan = $njtlcadangan * $val['t_tarif'] / 100;
                $ppjdarurat = $njtldarurat * $val['t_tarif'] / 100;

                $jumlahppj = $ppjutama + $ppjcadangan + $ppjdarurat;
            } else {
                $kwh = 0;
                $njtl = 0;
            }

            $form .= "<label class='col-sm-2 control-label'>Harga Satuan Listrik</label>";
            $form .= "<div class='col-sm-7'>";
            $form .=
                "<select id='hargasatuanlistrik' name='hargasatuanlistrik'
                 class='form-control' onchange='hitungpajakppj()'>
                        <option value=''>Silahkan Pilih</option>";

            foreach ($combohargasatuanlistrik as $r) {
                if ($val['t_hargasatuanlistrik'] == $r['s_idhargasatuanlistrik']) {
                    $selected = "selected";
                } else {
                    $selected = "";
                }
                $form .= "<option value='" . $r['s_idhargasatuanlistrik'] . "'";
                $form .= $selected;
                $form .= ">" . $r['s_namasatuanlistrik'] . ", Rp. " . number_format($r['s_hargasatuanlistrik'], 0, ',', '.') . "</option>";
            }
            $form .= "</select>";
            $form .=
                "
            <table class='table table-bordered table-striped table-condensed cf' style='font-size: 11px;'>
            <tr>
                <th style='background-color:#00BCA4; color: white;' class='text-center' width='14%'>Penggunaan</th>
                <th style='background-color:#00BCA4; color: white;' class='text-center' width='15%'>kVA</th>
                <th style='background-color:#00BCA4; color: white;' class='text-center' width='10%'>Faktor Daya</th>
                <th style='background-color:#00BCA4; color: white;' class='text-center' width='11%'>Jam Nyala</th>
                
                <th style='background-color:#00BCA4; color: white;' class='text-center' width='20%'>NJTL</th>
                <th style='background-color:#00BCA4; color: white;' class='text-center' width='20%'>PPJ(NJTL x Tarif)</th>
            </tr>
            <tr>
                <td>
                UTAMA
                </td> 
                <td>
                    <input type='text' id='jumlahkvautama' name='jumlahkvautama' value='" . $t_jumlahkvautama;
            $form .=
                "' class='form-control' style='text-align:right;' onkeypress='return numbersonly(this, event);' onkeyup='this.value = formatCurrency(this.value);hitungpajakppj()' onchange='hitungpajakppj()' value='0'>
                </td> 
                <td>
                    <input type='text' id='faktordayautama' name='faktordayautama' class='form-control' style='text-align:right;' readonly value='0.85'>
                </td>
                <td>
                    <input type='text' id='jamnyalautama' name='jamnyalautama' class='form-control' style='text-align:right;' readonly value='240'>
                </td>
                
                <td>
                    <input type='text' id='njtlutama' name='njtlutama' value='" . number_format($njtlutama, 0, ',', '.');
            $form .=
                "'readonly class='form-control' style='text-align:right;'>
                </td>
                <td>
                    <input type='text' id='jumlahutama' name='jumlahutama' value='" . number_format($ppjutama, 0, ',', '.');
            $form .=
                "'class='form-control' style='text-align:right;' readonly>
                </td>
            </tr>
            <tr>
                <td>
                CADANGAN
                </td> 
                <td>
                    <input type='text' id='jumlahkvacadangan' name='jumlahkvacadangan' value= '" . $t_jumlahkvacadangan;
            $form .=
                "'class='form-control' style='text-align:right;' onkeypress='return numbersonly(this, event);' onkeyup='this.value = formatCurrency(this.value);hitungpajakppj()' onchange='hitungpajakppj()' value='0'>
                </td> 
                <td>
                    <input type='text' id='faktordayacadangan' name='faktordayacadangan' class='form-control' style='text-align:right;' readonly value='0.85'>
                </td>
                <td>
                    <input type='text' id='jamnyalacadangan' name='jamnyalacadangan' class='form-control' style='text-align:right;' readonly value='120'>
                </td>
                
                <td>
                    <input type='text' id='njtlcadangan' name='njtlcadangan' value='" . number_format($njtlcadangan, 0, ',', '.');
            $form .=
                "'readonly class='form-control' style='text-align:right;'>
                </td>
                <td>
                    <input type='text' id='jumlahcadangan' name='jumlahcadangan' value='" . number_format($ppjcadangan, 0, ',', '.');
            $form .=
                "'class='form-control' style='text-align:right;' readonly>
                </td>
                 
            </tr>
            <tr>
                <td>
                DARURAT
                </td> 
                <td>
                    <input type='text' id='jumlahkvadarurat' name='jumlahkvadarurat' value='" . $t_jumlahkvadarurat;
            $form .=
                "'class='form-control' style='text-align:right;' onkeypress='return numbersonly(this, event);' onkeyup='this.value = formatCurrency(this.value);hitungpajakppj()' onchange='hitungpajakppj()' value='0'>
                </td> 
                <td>
                    <input type='text' id='faktordayadarurat' name='faktordayadarurat' class='form-control' style='text-align:right;' readonly value='0.85'>
                </td>
                <td>
                    <input type='text' id='jamnyaladarurat' name='jamnyaladarurat' class='form-control' style='text-align:right;' readonly value='40'>
                </td>
                <td>
                    <input type='text' id='njtldarurat' name='njtldarurat' value='" . number_format($njtldarurat, 0, ',', '.');
            $form .=
                "'readonly class='form-control' style='text-align:right;'>
                </td>
                <td>
                    <input type='text' id='jumlahdarurat' name='jumlahdarurat' value='" . number_format($ppjdarurat, 0, ',', '.');
            $form .=
                "'class='form-control' style='text-align:right;' readonly>
                </td>
               
                 
            </tr>
            <tr>
                <td colspan='5'>
                    <b><i>NJTL = Jumlah KvA/Bulan x Faktor Daya x Harga Satuan Listrik</i></b><br>
                    <b><i>Tarif Pajak = 1%</i></b>
                </td>
                <td>
                    <input type='text' id='jumlahsemua' name='jumlahsemua' value='" . number_format($jumlahppj, 0, ',', '.');
            $form .=
                "'class='form-control' style='text-align:right;' readonly>
                </td>
            </tr>
            <tr>
                <td colspan='6'>
                    
                    Jam Nyala :
                    <br>* 240 Jam Penggunaan Utama,
                    <br>* 120 Jam Penggunaan Cadangan,
                    <br>* 40 Jam Penggunaan Darurat,
                </td>
            </tr>
            <input type='hidden' id='t_iddetailppj' name='t_iddetailppj' readonly value='" . $iddetail;
            $form .=
                "' class='form-control' style='text-align:right;'>
            </table>
            ";
            $form .= "</div>";
        }

        $data = array(
            'formdasarpengenaan' => $form
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function pilihRekeningReklameAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataRekening = $this->Tools()->getService('RekeningTable')->getDataRekeningId($data_get['s_idkorek']);
        if ($dataRekening['t_berdasarmasa'] == 'Yes') {
            $t_berdasarmasa = "Berdasar Masa";
        } else {
            $t_berdasarmasa = "Tidak Berdasar Masa";
        }

        $data = array(
            't_idkorek' => $dataRekening['s_idkorek'],
            't_korek' => $dataRekening['korek'],
            't_namakorek' => strtoupper($dataRekening['s_namakorek']),
            't_tarifpajak' => $dataRekening['s_persentarifkorek'],
            't_tarifdasarkorek' => number_format($dataRekening['s_tarifdasarkorek'], 0, ',', '.'),
            't_berdasarmasa' => $t_berdasarmasa,

        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function caritarifminerbaAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        $dataRekening = $this->Tools()->getService('DetailminerbaTable')->getdatatarifJenisMinerba($data_get['t_jenis']);
        $s_besarpungutan = $dataRekening['s_tarif'] * $dataRekening['s_harga'] / 100;

        $data = array(
            't_tarifpersen' => $dataRekening['s_tarif'],
            's_tarifdasarkorek' => number_format($dataRekening['s_harga'], 0, ",", "."),
            's_besarpungutan' => number_format($s_besarpungutan, 0, ",", "."),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungpajakminerbaAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = ((float) $data_get['t_volume']) * str_ireplace(".", "", $data_get['t_hargapasaran']);

        $t_pajak = $t_jumlah * $data_get['t_tarifpersen'] / 100;
        $data = array(
            't_jumlah' => number_format($t_jumlah, 0, ",", "."),
            't_pajak' => number_format($t_pajak, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungtotalpajakminerbaAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_jumlah1']) + str_ireplace(".", "", $data_get['t_jumlah2']) + str_ireplace(".", "", $data_get['t_jumlah3']) + str_ireplace(".", "", $data_get['t_jumlah4']) + str_ireplace(".", "", $data_get['t_jumlah5']) + str_ireplace(".", "", $data_get['t_jumlah6']) + str_ireplace(".", "", $data_get['t_jumlah7']) + str_ireplace(".", "", $data_get['t_jumlah8']) + str_ireplace(".", "", $data_get['t_jumlah9']) + str_ireplace(".", "", $data_get['t_jumlah10']);
        $t_jmlhpajak = str_ireplace(".", "", $data_get['t_pajak1']) + str_ireplace(".", "", $data_get['t_pajak2']) + str_ireplace(".", "", $data_get['t_pajak3']) + str_ireplace(".", "", $data_get['t_pajak4']) + str_ireplace(".", "", $data_get['t_pajak5']) + str_ireplace(".", "", $data_get['t_pajak6']) + str_ireplace(".", "", $data_get['t_pajak7']) + str_ireplace(".", "", $data_get['t_pajak8']) + str_ireplace(".", "", $data_get['t_pajak9']) + str_ireplace(".", "", $data_get['t_pajak10']);
        $t_pajak = $t_jmlhpajak;

        $t_jmlhkenaikan = 0;
        if (!empty($data_get['t_tarifkenaikan']) || $data_get['t_tarifkenaikan'] != 0) {
            $t_jmlhkenaikan = ($t_pajak * $data_get['t_tarifkenaikan'] / 100);
            $t_pajak = $t_pajak + $t_jmlhkenaikan;
        }
        $data = array(


            't_dasarpengenaan' => number_format($t_jumlah, 0, ",", "."),
            't_jmlhpajak' => number_format($t_pajak, 0, ",", "."),
            "t_jmlhkenaikan" => number_format($t_jmlhkenaikan, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }


    public function hitungtotalpajakppjAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        if ($data_get['t_asallistrik'] == 2) {
            $tarif_pajak = 1.5;
            $t_subtotalkwh0 = str_ireplace(".", "", $data_get['subtotalkwh0']);
            $t_subtotalkwh1 = str_ireplace(".", "", $data_get['subtotalkwh1']);
            $t_jmlhpajak = ($t_subtotalkwh0 + $t_subtotalkwh1) * 1.5 / 100;
        } else {
            $tarif_pajak = 0;
            $t_subtotalpajak0 = str_ireplace(".", "", $data_get['subtotalpajak0']);
            $t_subtotalpajak1 = str_ireplace(".", "", $data_get['subtotalpajak1']);
            $t_jmlhpajak = ($t_subtotalpajak0 + $t_subtotalpajak1);
        }

        $t_pajak = $t_jmlhpajak;

        $t_jmlhkenaikan = 0;
        if (!empty($data_get['t_tarifkenaikan']) || $data_get['t_tarifkenaikan'] != 0) {
            $t_jmlhkenaikan = ($t_pajak * $data_get['t_tarifkenaikan'] / 100);
            $t_pajak = $t_pajak + $t_jmlhkenaikan;
        }
        $data = array(
            't_tarifdasar' => $tarif_pajak,
            't_jmlhpajak' => number_format($t_pajak, 0, ",", "."),
            "t_jmlhkenaikan" => number_format($t_jmlhkenaikan, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function caritarifparkirAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataRekening = $this->Tools()->getService('RekeningTable')->getDataRekeningId($data_get['t_idkorek']);
        $data = array(
            //            't_hargapasaran' => number_format($dataRekening['s_tarifdasarkorek'], 0, ",", "."),
            't_tarifpersen' => $dataRekening['s_persentarifkorek']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungpajakparkirAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_jmlh_kendaraan']) * str_ireplace(".", "", $data_get['t_hargadasar']);
        $t_pajak = $t_jumlah * $data_get['t_tarifpersen'] / 100;
        $data = array(
            't_jumlah' => number_format($t_jumlah, 0, ",", "."),
            't_pajak' => number_format($t_pajak, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungtotalpajakparkirAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_jumlah1']) + str_ireplace(".", "", $data_get['t_jumlah2']) + str_ireplace(".", "", $data_get['t_jumlah3']) + str_ireplace(".", "", $data_get['t_jumlah4']) + str_ireplace(".", "", $data_get['t_jumlah5']) + str_ireplace(".", "", $data_get['t_jumlah6']) + str_ireplace(".", "", $data_get['t_jumlah7']);
        $t_jmlhpajak = str_ireplace(".", "", $data_get['t_pajak1']) + str_ireplace(".", "", $data_get['t_pajak2']) + str_ireplace(".", "", $data_get['t_pajak3']) + str_ireplace(".", "", $data_get['t_pajak4']) + str_ireplace(".", "", $data_get['t_pajak5']) + str_ireplace(".", "", $data_get['t_pajak6']) + str_ireplace(".", "", $data_get['t_pajak7']);
        $t_pajak = $t_jmlhpajak;
        $t_jmlhkenaikan = 0;
        if (!empty($data_get['t_tarifkenaikan']) || $data_get['t_tarifkenaikan'] != 0) {
            $t_jmlhkenaikan = ($t_pajak * $data_get['t_tarifkenaikan'] / 100);
            $t_pajak = $t_pajak + $t_jmlhkenaikan;
        }
        $data = array(
            // 't_jmlhpajak' => number_format($t_jmlhpajak, 0, ",", "."),
            't_dasarpengenaan' => number_format($t_jumlah, 0, ",", "."),
            't_jmlhpajak' => number_format($t_pajak, 0, ",", "."),
            "t_jmlhkenaikan" => number_format($t_jmlhkenaikan, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungpajakwaletAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        $t_jumlah = $data_get['t_dasarpengenaan'] * $data_get['t_tarif'] / 100;
        if (!empty($data_get['t_tarifkenaikan']) || $data_get['t_tarifkenaikan'] != 0) {
            $t_jmlhkenaikan = ($t_jumlah * $data_get['t_tarifkenaikan'] / 100);
            $t_jmlhpajak = $t_jumlah + $t_jmlhkenaikan;
        } else {
            $t_jmlhpajak = $t_jumlah;
        }
        $data = array(

            't_jmlhpajak' => number_format($t_jmlhpajak, 0, ",", "."),
            't_jmlhkenaikan' => number_format($t_jmlhkenaikan, 0, ",", "."),
        );
        // var_dump($data);exit();
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function cetakhimbauanAction()
    {
        /** Cetak Himbauan
         * @param int $t_idwp
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 02/01/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['t_idtransaksi']);

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function cetaknppdselfAction()
    {
        /** Cetak NPPD Self Assesment
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 22/01/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP, OP dan Transaksi
        $data = $this->Tools()->getService('PendataanTable')->getDataNppdObjek($data_get['idwpobjeknppd']);
        $datanppd = $this->Tools()->getService('PendataanTable')->getDataNppdSelf($data_get['idwpobjeknppd']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'datanppd' => $datanppd,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetaknppdofficialAction()
    {
        /** Cetak NPPD Official Assesment
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 22/01/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        if ($data_get['jenisobjek'] == 4) {
            $data = $this->Tools()->getService('PenetapanTable')->getDataPenetapanReklame($data_get['idtransaksi']);
            $ar_jenisreklame = $this->Tools()->getService('ReklameTable')->getDataTarifReklame($data['t_jenisreklame']);
            $dataukuran =  $ar_rekening = $this->Tools()->getService('DetailreklameTable')->getketeranganukuran($data['t_ukuranmedia']);
        } elseif ($data_get['jenisobjek'] == 8) {
            $data = $this->Tools()->getService('PenetapanTable')->getDataPenetapanABT($data_get['idtransaksi']);
        }
        //        var_dump($tarif_njor['s_njor3']);
        //        exit();
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $ar_ttd1 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd1']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
            'ar_ttd1' => $ar_ttd1,
            'jenisobjek' => $data_get['jenisobjek'],
            'ar_jenisreklame' => $ar_jenisreklame,
            'peruntukan_air' => $peruntukan_air,
            'dataukuran' => $dataukuran
            //            'ukuranpipa' => $ukuranpipa
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function pilihskpdjabatanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data_render = array(
            "t_tglpendataan" => date('01-m-Y', strtotime($data_get['parameter'] . '+1 month')),
            "t_masaawal" => date('d-m-Y', strtotime($data_get['parameter'])),
            "t_masaakhir" => date('t-m-Y', strtotime($data_get['parameter'])),
            "t_tarifkenaikan" => 25
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataSuratTeguranAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdObjek($data_get['idobjekwp']);
        $data_render = array(
            "idobjekwp" => $data_get['idobjekwp'],
            "t_masaawal" => date('d-m-Y', strtotime($data_get['parameter'])),
            "t_masaakhir" => date('t-m-Y', strtotime($data_get['parameter'])),
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamatlengkapobjek'],
            "jenispajak" => $data['s_namajenis'],
            "idjenispajak" => $data['t_jenisobjek'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetaksuratteguranAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdObjek($data_get['idobjekwp']);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglpendataan0' => $data_get->tglpendataan0,
            'tglpendataan1' => $data_get->tglpendataan1,
            'masapajak' => date('d-m-Y', strtotime($data_get->masaawal)) . ' s/d ' . date('d-m-Y', strtotime($data_get->masaakhir)),
            'nomor_surat' => $data_get->nomorsrt,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function cetakskpdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        if ($data_get['jenisobjek'] == 4) {
            $data = $this->Tools()->getService('PenetapanTable')->getDataPenetapanReklame($data_get['idtransaksi']);
            $ar_jenisreklame = $this->Tools()->getService('ReklameTable')->getDetailJenisReklame($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 8) {
            $data = $this->Tools()->getService('PenetapanTable')->getDataPenetapanABT($data_get['idtransaksi']);
        }

        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
            'jenisobjek' => $data_get['jenisobjek'],
            'ar_jenisreklame' => $ar_jenisreklame,
            'peruntukan_air' => $peruntukan_air
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetakskrdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        // var_dump($data_get['jenisobjek']); die;
        $data = $this->Tools()->getService('PendataanTable')->getPendataanRetribusi($data_get['idtransaksi']);
        $datakorek = $this->Tools()->getService('RekeningTable')->getRekeningParentByKorek(substr($data['korek'], 0, 12));



        if ($data_get['jenisobjek'] == 13) {
            $datadetail = $this->Tools()->getService('DetailkebersihanTable')->getPendataanKebersihanByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 17) {
            $datadetail = $this->Tools()->getService('DetailpasarTable')->getPendataanPasarByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 26) {
            $datadetail = $this->Tools()->getService('DetailkekayaanTable')->getDetailKekayaanById($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 30) {
            $datadetail = $this->Tools()->getService('DetailtempatparkirTable')->getPendataanTempatparkirByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 12) {
            $datadetail = $this->Tools()->getService('DetailretribusiTable')->getPendataanPelayananKesehatanByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 18) {
            $datadetail = $this->Tools()->getService('DetailkirTable')->getPendataanPengujianKendaraanBermotorByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 16) {
            $datadetail = $this->Tools()->getService('DetailparkirtepiTable')->getPendataanParkirTepiByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 40) {
            $datadetail = $this->Tools()->getService('DetailtrayekTable')->getPendataanTrayekByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 37) {
            $datadetail = $this->Tools()->getService('DetailimbTable')->getPendataanImbByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 29) {
            $datadetail = $this->Tools()->getService('DetailterminalTable')->getPendataanterminalByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 27) {
            // var_dump($data_get['idtransaksi']);exit(); 

            $datadetail = $this->Tools()->getService('DetailpasargrosirTable')->getPendataanPasargrosirByIdTransaksi($data_get['idtransaksi']);
            // var_dump($datadetail);exit(); 
            $detailpasargrosir = $this->Tools()->getService('DetailpasargrosirTable')->getnamatarif($datadetail['t_jenisbangunan']);
        }


        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'datakorek' => $datakorek,
            'datadetail' => $datadetail,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
            'jenisobjek' => $data_get['jenisobjek'],
            'detailpasargrosir' => $detailpasargrosir,
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetakskAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PendataanTable')->getPendataanRetribusi($data_get['idtransaksi']);
        //        var_dump($data['t_periodepajak']); exit();
        if ($data_get['jenisobjek'] == 17) {
            $datadetail = $this->Tools()->getService('DetailpasarTable')->getPendataanPasarByIdTransaksi($data_get['idtransaksi']);
            $datadetailsampah = $this->Tools()->getService('DetailkebersihanTable')->getPendataanSampahByDatapasar($data['t_idwp'], $data);
        }
        //        elseif ($data_get['jenisobjek'] == 11) {
        //            $datadetail = $this->Tools()->getService('PendataanTable')->getPanggungReklame($data_get['idtransaksi']);
        //        }
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'datadetail' => $datadetail,
            'datadetailsampah' => $datadetailsampah,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
            'jenisobjek' => $data_get['jenisobjek']
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetakdaftarreklameAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new PendataanBase();
        $base->exchangeArray($allParams);
        $data = $this->Tools()->getService('PendataanTable')->getDaftarReklame($base);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function formattglAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $tlg = (int) substr($data_get->tgl, 0, 2);

        $bln = (int) substr($data_get->tgl, 2, 2);
        if ($bln < 1) {
            $bln = 1;
        } elseif ($bln > 12) {
            $bln = 12;
        }

        $thn = substr($data_get->tgl, 4, 5);
        $tglfix = str_pad($tlg, 2, "0", STR_PAD_LEFT) . "-" . str_pad($bln, 2, "0", STR_PAD_LEFT) . "-20" . $thn;
        if ($tlg < 1) {
            $tglfix = "01-" . str_pad($bln, 2, "0", STR_PAD_LEFT) . "-20" . $thn;
        } elseif ($tlg > 28) {
            $tglfix0 = "28-" . str_pad($bln, 2, "0", STR_PAD_LEFT) . "-20" . $thn;
            $tglfix = date('t-m-Y', strtotime($tglfix0));
        }
        $data = array(
            'tgl' => $tglfix
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungtglAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_masaawal = date('d-m-Y', strtotime($data_get->t_masaawal));
        $t_masaakhir =  date("Y-m-t", strtotime($t_masaawal));


        $t_masaakhir = date('t-m-Y', strtotime($t_masaawal));
        $data = array(
            't_masaakhir' => $t_masaakhir,
            't_masaawal' => $t_masaawal
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function cetakregisterpajakAction()
    {
        $req = $this->getRequest();
        // $data_get = $req->getPost();
        $data_get = $req->getQuery();

        $data = $this->Tools()->getService('PendataanTable')->getDaftarRegisterPajak($data_get['tglinput0'], $data_get['tglinput1'], $data_get['s_idjenis'], $data_get['t_statusbayar']);
        $ar_jenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get['s_idjenis']);

        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksa']);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'data_jenis' => $ar_jenis,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'ar_pemda' => $ar_pemda,
                'tglcetak' => $data_get['tglcetak'],
                'tglpencetakan' => $data_get['tglinput0'] . ' s.d. ' . $data_get['tglinput1'],
                'formatcetak' => $data_get->formatcetak
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'data_jenis' => $ar_jenis,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'ar_pemda' => $ar_pemda,
                'tglcetak' => $data_get['tglcetak'],
                'tglpencetakan' => $data_get['tglinput0'] . ' s.d. ' . $data_get['tglinput1'],
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetakpendterimadimukaAction()
    {
        $req = $this->getRequest();
        // $data_get = $req->getPost();
        $data_get = $req->getQuery();

        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksa']);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);
        $data = $this->Tools()->getService('PendataanTable')->getDataTransaksiByPerMasaAkhirpajak($data_get['tglcetak'], $data_get['periodepajak'], $data_get['s_idjenispenetapan']);
        // var_dump($data);exit();
        $ar_jenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get['s_idjenispenetapan']);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'data_jenis' => $ar_jenis,
            'ar_pemda' => $ar_pemda,
            'ar_diperiksa' => $ar_diperiksa,
            'ar_mengetahui' => $ar_mengetahui,
            'tglcetak' => $data_get['tglcetak'],
            'periode' => $data_get['periodepajak']
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakdaftarblmlaporAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $datajenispajak = $this->Tools()->getService('PendataanTable')->getJenisPajak($data_get->s_idjenis);
        $data = $this->Tools()->getService('PendataanTable')->getdaftarbelumlapor($data_get->idobjekbelumlapor);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'datajenispajak' => $datajenispajak,
            'data' => $data,
            'bulan' => $data_get->bulanmasapajak,
            'tahun' => $data_get->tahunmasapajak,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function getComboKawasanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // var_dump($data_get->t_kodekawasan);exit();
        $getkawasanwilayah = $this->Tools()->getService('ReklameTable')->comboLokasi($data_get->t_kodekawasan);
        $opsi = "";
        $opsi .= "
     <option value=''>Silahkan Pilih</option>";
        foreach ($getkawasanwilayah as $r) {
            $opsi .= "<option value='" . $r['s_idkawasan'] . "'>" . $r['s_kawasan'] . ' || ' . $r['s_lokasi'] . "</option>";
        }

        $data_render = array(
            'res' => $opsi,

        );
        // var_dump($data_render);exit();
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }


    public function getComboJenisReklameAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        $getJenisReklame = $this->Tools()->getService('ReklameTable')->getComboJenisReklame($data_get->t_kodekawasan);
        $opsi = "";
        $opsi .= "
           <option value=''>Silahkan Pilih</option>";
        foreach ($getJenisReklame as $r) {
            // var_dump($r);
            $opsi .= "<option value='" . $r['s_idjenis'] . "'>" . str_pad($r['s_idjenis'], 2, "0", STR_PAD_LEFT) . ' || ' . $r['s_nama'] . "</option>";
        }

        $data_render = array(
            'res' => $opsi,

        );

        // var_dump($data_render);exit();
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function comboJenisReklameAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('ReklameTable')->getDataIdKorek($data_get['t_idkorek']);
        $res = '<option value="">Silahkan Pilih</option>';
        $counter = 1;
        foreach ($data as $row) :
            $res .= '<option value="' . $row['s_idreklamejenis'] . '">' . $row['s_namareklamejenis'] . '</option>';
        endforeach;

        $dataToRender = [
            'res' => $res,
        ];
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($dataToRender));
    }

    public function carijenisminerbaAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        $dataJenisminerba = $this->Tools()->getService('DetailminerbaTable')->getDataJenisMinerba($data_get['t_idkorek']);

        $opsi = "";
        $opsi .= "
            <option value=''>Silahkan Pilih</option>";
        foreach ($dataJenisminerba as $r) {
            $opsi .= "<option value='" . $r['s_idjenisminerba'] . "'>" . $r['s_namajenisminerba'] . "</option>";
        }
        // var_dump($opsi);exit();
        $data = array(
            'opsi' => $opsi,
        );
        // var_dump($data); die;
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function carirekeningminerbaAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataJenisminerba = $this->Tools()->getService('RekeningTable')->getDataRekeningMblb();
        $opsi = "";
        $opsi .= "
            <option value=''>Silahkan Pilih</option>";
        foreach ($dataJenisminerba as $r) {
            $opsi .= "<option value='" . $r['s_idkorek'] . "'>" . $r['korek'] . ' || ' . $r['s_namakorek'] . "</option>";
        }
        // var_dump($opsi);exit();
        $data = array(
            'opsi' => $opsi,
            // 't_tarifpersen' => $dataRekening['s_persentarifkorek']
        );
        // var_dump($data); die;
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function carirekeningreklameAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // var_dump($data_get);exit();
        $ar_rekening = $this->Tools()->getService('DetailreklameTable')->getdatarekeningreklame($data_get->t_jenisreklame);
        $data = array(
            't_idkorek' => $ar_rekening['s_idkorek'],
            't_korek' => $ar_rekening['korek'],
            't_namakorek' => $ar_rekening['s_namakorek'],
            's_persentarifkorek' => $ar_rekening['s_persentarifkorek'],
            's_keterangan' => $ar_rekening['s_keterangan']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }
    public function hitungluasreklameAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = array(
            't_luas' => $data_get['t_panjang'] * $data_get['t_lebar'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }
    public function carilokasikelasAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // $permanen = $this->Tools()->getService('DetailreklameTable')->getpermanen($data_get->t_jenisreklame);
        if ($data_get->t_kelasjalan == 5) {
            $datalokasi = $this->Tools()->getService('DetailreklameTable')->getLokasiAll($data_get->t_kelasjalan);
        } else {
            $datalokasi = $this->Tools()->getService('DetailreklameTable')->getLokasiByKelas($data_get->t_kelasjalan);
        }
        $no = 1;
        $opsi = "";
        $opsi .= "
        <option value=''>Silahkan Pilih</option>";
        foreach ($datalokasi as $r) {
            // var_dump($r);
            $opsi .= "<option value='" . $r['s_idreklamelokasi'] . "'>" . $r['s_namareklamelokasi'] . "</option>";
        }
        $data_render = array(
            'datalokasi' => $opsi,

        );
        //var_dump($opsi);
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }
    public function hitungjangkawaktuAction()
    {
        date_default_timezone_set('Asia/Jakarta');
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_masaawal = date_create(date('d-m-Y', strtotime($data_get->t_masaawal)));
        $t_masaakhir = date_create(date('d-m-Y', strtotime($data_get->t_masaakhir)));
        $selisih = date_diff($t_masaawal, $t_masaakhir);
        // var_dump($t_masaawal);exit();
        // var_dump($this->diffInMonths($t_masaawal, $t_masaakhir));
        //tipe waktu 1=>tahun 2=>bulan 3=>hari
        if ($data_get->t_tipewaktu == '1') {
            $t_jangkawaktu = $selisih->y + 1;
            $t_tipewaktu = 'Tahun';
        } elseif ($data_get->t_tipewaktu == '2') {
            $timeStart = strtotime($data_get->t_masaawal);
            $timeEnd = strtotime($data_get->t_masaakhir);
            // $numBulan = 1 + (date("Y",$timeEnd)-date("Y",$timeStart))*12;
            // $numBulan += date("m",$timeEnd)-date("m",$timeStart);
            // $t_jangkawaktu=$numBulan;
            $tahun = $selisih->y;
            if ($tahun > 0) {
                $bulantahun = 12 * $tahun;
            } else {
                $bulantahun = 0;
            }
            $bulan = $selisih->m;
            if ($bulan <= 0) {
                $bulan = date("m", $timeEnd) - date("m", $timeStart);
                if ((int)(date('d', $timeEnd)) >= (int)(date('d', $timeStart))) {
                    $tambah = 1;
                } else {
                    $tambah = 0;
                }
                // var_dump((int)(date('d',$timeEnd)));
                $bulan = $bulan + $tambah;
            } elseif (((int)$bulan == 1) && ((int)(date('m', $timeEnd) == (int)(date('m', $timeStart))))) {


                // var_dump((int)(date('d',$timeEnd)));
                $bulan = 1;
            } else {
                $bulan = $selisih->m + 1;
            }


            $t_jangkawaktu = $bulan + $bulantahun;

            $t_tipewaktu = 'Bulan';
        } elseif ($data_get->t_tipewaktu == '3') {
            $t_jangkawaktu = $selisih->days + 1;
            $t_tipewaktu = 'Hari';
        } else {
            $t_jangkawaktu = 1;
        }


        $data['t_jangkawaktu'] = $t_jangkawaktu;
        $data['t_tipewaktu'] = $t_tipewaktu;
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function caritarifreklameAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        if ($data_get->t_jenisreklameusaha == 1) {
            $tarifpersen = 15 / 100;
        } else {
            $tarifpersen = 20 / 100;
        }

        $t_tarifreklame = $this->Tools()->getService('DetailreklameTable')->gettarifreklame($data_get->t_jenisreklame);
        $t_nilaistrategis = $this->Tools()->getService('DetailreklameTable')->getnilaistrategis($data_get->t_jenisreklame, $data_get->t_kelasjalan);
        $data['s_njop'] = $t_tarifreklame;
        $data['s_nilaistrategis'] = $t_nilaistrategis;
        $data['s_nsr'] = ($t_tarifreklame + $t_nilaistrategis) * $tarifpersen;
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function selisihtanggalAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_masaawal = date_create($data_get->t_masaawal);
        $t_masaakhir = date_create($data_get->t_masaakhir);
        $selisih = date_diff($t_masaawal, $t_masaakhir)->days;
        $data['t_lamawaktu'] = $selisih;
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }
    public function cariukuranmediaAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $datarange = $this->Tools()->getService('DetailreklameTable')->getcomborangeukuranmedia($data_get->t_jenisreklame);
        $no = 1;
        $opsi = "";
        $opsi .= "<option value=''>Silahkan Pilih</option>";
        foreach ($datarange as $r) {
            $opsi .= "<option value='" . $r['s_idukurannilaireklame'] . "'>" . $no++ . ' || ' . $r['s_keteranganukuran'] . "</option>";
        }
        $data_render = array(
            'opsi' => $opsi,
        );

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function carikelasjalanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $kelas = $this->Tools()->getService('DetailreklameTable')->getcombokelasjalan($data_get->t_jenisreklame);
        $permanen = $this->Tools()->getService('DetailreklameTable')->getpermanen($data_get->t_jenisreklame);
        $no = 1;
        $opsi = "";
        $opsi .= "<option value=''>Silahkan Pilih</option>";

        foreach ($kelas as $k) {
            if ($permanen['s_permanen'] == 2) {
                $namakelas = "Insidentil";
            } else {

                if ($k['s_idreklamelokasi'] == 1) {
                    $namakelas = "Utama";
                } elseif ($k['s_idreklamelokasi'] == 2) {
                    $namakelas = "A";
                } elseif ($k['s_idreklamelokasi'] == 3) {
                    $namakelas = "B";
                } else {
                    $namakelas = "C";
                }
            }
            $opsi .= "<option value='" . $k['s_idreklamelokasi'] . "'> " . $namakelas . " </option>";
        }
        $data_render = array(
            'opsi' => $opsi,
        );

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function getmasaakhirwaletAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_masaawal = date('d-m-Y', strtotime($data_get->t_masaawal));
        $t_masaakhir =  date("Y-m-t", strtotime($t_masaawal));


        $t_masaakhir = date('t-m-Y', strtotime($t_masaawal));
        $data = array(
            't_masaakhir' => $t_masaakhir,
            't_masaawal' => $t_masaawal
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function gethargadasarwaletAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jenissarang = $data_get->t_jenissarang;

        if ($t_jenissarang == '1' || $t_jenissarang == 1) {
            $t_tarifdasar = number_format(6500000, 0, ',', '.');
        } elseif ($t_jenissarang == '2' || $t_jenissarang == 2) {
            $t_tarifdasar = number_format(4500000, 0, ',', '.');
        } else if ($t_jenissarang == '3' || $t_jenissarang == 3) {
            $t_tarifdasar = number_format(4000000, 0, ',', '.');
        } else {
            $t_tarifdasar = 0;
        }

        $data = array(
            't_tarifdasar' => $t_tarifdasar
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function dasarpengenaanwaletAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_dasarpengenaan = preg_replace("/[^0-9]/", "", $data_get->t_hargapasar) * $data_get->t_volume;
        $data = array(
            't_dasarpengenaan' => $t_dasarpengenaan
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function gettarifpajakwaletAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_umurbangunan = $data_get->t_umurbangunan;

        if ($t_umurbangunan == '1' || $t_umurbangunan == 1) {
            $t_tarifpajak = 5;
        } elseif ($t_umurbangunan == '2' || $t_umurbangunan == 2) {
            $t_tarifpajak = 7;
        } else {
            $t_tarifpajak = 10;
        }

        $data = array(
            't_tarifpajak' => $t_tarifpajak
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function getobjekkateingAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        $dataobjek = $this->Tools()->getService('PendataanTable')->getrekeningbyidobjek($data_get->idobjek);
        // $dataobjek = $this->Tools()->getService('RekeningTable')->getDataJenisMinerba($tarif);
        // var_dump($dataobjek);exit();
        if ($dataobjek['t_korekobjek'] == '33' || $dataobjek['t_korekobjek'] == 33) {
            $status = 1; //katering
            $t_berdasarmasa = "Tidak Berdasar Masa";
            $dataRekening = $this->Tools()->getService('RekeningTable')->getDataRekeningId(34);
        }
        // var_dump($dataRekening);exit();
        $data = array(

            't_idkorek' => $dataRekening['s_idkorek'],
            't_korek' => $dataRekening['korek'],
            't_namakorek' => strtoupper($dataRekening['s_namakorek']),
            't_tarifpajak' => $dataRekening['s_persentarifkorek'],
            // 't_berdasarmasa' => $t_berdasarmasa,
        );

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function carijeniskekayaanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $no = 1;
        $datakekayaan = $this->Tools()->getService('DetailkekayaanTable')->getdatajenis($data_get->t_idjenis);
        $opsi = "";
        $opsi .= "
        <option value=''>Silahkan Pilih</option>";
        foreach ($datakekayaan as $r) {
            $opsi .= "<option value='" . $r['s_idkategorisatu'] . "'>" . $r['s_idkategorisatu'] . ' || ' . $r['s_keterangan'] . "</option>";
        }
        $data = array(
            'opsi' => $opsi,
        );

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function caritarifkekayaandaerahAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // var_dump($data_get->t_jeniskekayaan);exit();
        $dataTarif = $this->Tools()->getService('DetailkekayaanTable')->getdatatarifkekayaan($data_get->t_jeniskekayaan);

        $data = array(
            't_satuan' => $dataTarif['s_satuan'],
            't_tarifdasar' => number_format($dataTarif['s_tarif'], 0, ',', '.'),


        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungkeakyaanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_tarifdasar = (int)(str_ireplace(".", "", $data_get->t_tarifdasar));
        // $t_jumlahitem = (int) $data_get->t_jumlahitem;
        $t_jumlahitem = (float) $data_get->t_jumlahitem;
        $t_lamawaktu =  (int) $data_get->t_lamawaktu;
        $t_jumlah = $t_tarifdasar * $t_jumlahitem * $t_lamawaktu;

        $data = array(
            't_jumlah' => number_format($t_jumlah, 0, ',', '.'),

        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function uploadfileAction()
    {

        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $id = $req->getQuery()->get('t_idtransaksi');
        $message = '';
        $datapendaftaran = $this->Tools()->getService('PendataanTable')->getDataPendataanID($id);
        $view = new ViewModel(array(
            'form' => '',
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
            't_idtransaksi' => $id,

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

    public function datagriduploadAction()
    {

        $basePath = $this->getRequest()->getBasePath();
        $uri = new \Zend\Uri\Uri($this->getRequest()->getUri());
        $uri->setPath($basePath);
        $uri->setQuery(array());
        $uri->setFragment('');
        $baseUrl = $uri->getScheme() . '://' . $uri->getHost() . '/' . 'esptpd_Pulang Pisau';

        // var_dump($baseUrl);exit();
        $req = $this->getRequest();
        $post = $req->getPost();
        // var_dump($post);exit();
        $data = $this->Tools()->getService('PendataanTable')->getdataupload($post->t_idtransaksi);
        $s = '<table class="table table-bordered table-striped table-condensed cf" style="font-size:11px; color: black">
             <thead>
             <tr><th style="background-color: #00BCA4; color: white; text-align:center">No</th>
               <th style="background-color: #00BCA4; color: white; text-align:center">Nama File</th>
           </tr>
       </thead>
      <tbody>';
        $no = 1;
        foreach ($data as $key) {
            $s .= '<tr><td style="text-align:center">' . $no++ . '</td>';
            $actual_link = "$_SERVER[HTTP_HOST]";
            if ($actual_link == "localhost:86") {
                $s .= '<td><a href="http://localhost:8056/esptpd_pulangpisau/public/upload/filetransaksi/' . $post->t_idtransaksi . '/' . $key['t_namaberkas'] . '"target="_blank">' . $key['t_namaberkas'] . ' </a></td>';
            } else {
                $s .= '<td><a href="http://37.44.244.32:86/public/upload/filetransaksi/' . $post->t_idtransaksi . '/' . $key['t_namaberkas'] . '"target="_blank">' . $key['t_namaberkas'] . ' </a></td>';
            }
        }
        $s .= '</tbody></table>';
        $data = array(
            's' => $s
        );

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }
}
