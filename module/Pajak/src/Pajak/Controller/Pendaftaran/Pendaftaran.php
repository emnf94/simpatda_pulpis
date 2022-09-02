<?php

namespace Pajak\Controller\Pendaftaran;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Pendaftaran\PendaftaranFrm;
use Pajak\Model\Pendaftaran\PendaftaranBase;
use Pajak\Form\Pendaftaran\ObjekFrm;
use Pajak\Model\Pendaftaran\ObjekBase;

class Pendaftaran extends AbstractActionController
{

    public function indexAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new PendaftaranFrm();
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
        $ar_objekpajak = $this->Tools()->getService('ObjekTable')->getAllDataObjek();
        $ar_tipeusaha = $this->Tools()->getService('TipeusahaTable')->getdata();
        $descPendaftaran = $this->Tools()->getService('PendaftaranTable')->getDescTablePendaftaran();

        $recordspendaftaran = array();
        foreach ($descPendaftaran as $descPendaftaran) {
            $recordspendaftaran[] = $descPendaftaran;
        }
        $descPendaftaranOP = $this->Tools()->getService('PendaftaranTable')->getDescTablePendaftaranop();
        $recordspendaftaranOP = array();
        foreach ($descPendaftaranOP as $descPendaftaranOP) {
            $recordspendaftaranOP[] = $descPendaftaranOP;
        }

        $view = new ViewModel(array(
            'form' => $form,
            'ar_pejabat' => $recordspejabat,
            'ar_kecamatan' => $recordskecamatan,
            'ar_objekpajak' => $ar_objekpajak,
            'ar_tipeusaha' => $ar_tipeusaha,
            'descPendaftaran' => $recordspendaftaran,
            'descPendaftaranOP' => $recordspendaftaranOP
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

    public function dataGridAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new PendaftaranBase();
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
            if ($row['t_kecamatan'] == 0) {
                $kecamatan = $row['kecamatanluarwp'];
                $kelurahan = $row['kelurahanluarwp'];
            } else {
                $kecamatan = $row['s_namakec'];
                $kelurahan = $row['s_namakel'];
            }
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='Tanggal Pendaftaran'><center>" . date('d-m-Y', strtotime($row['t_tgldaftar'])) . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='Alamat'>" . $row['t_alamat'] . "</td>";
            $s .= "<td data-title='Kelurahan'>" . $kecamatan . "</td>";
            $s .= "<td data-title='Kecamatan'>" . $kelurahan . "</td>";
            $s .= "<td data-title='Kabupaten'>" . $row['t_kabupaten'] . "</td>";
            $jmlop = $this->Tools()->getService('ObjekTable')->getJmlOP($row['t_idwp']);
            //mencari data transaksi yg di objek wp
            $jmlwp_trans = $this->Tools()->getService('PendaftaranTable')->getDataJmlhWp($row['t_idwp']);
            $jmlobjek_wp = $this->Tools()->getService('PendaftaranTable')->getDataObjekSelf($row['t_idwp']);
            $s .= "<td data-title='Jumlah OP'><center>" . $jmlop . "</center></td>";
            $hapus = "";
            $operator = "";
            // print_r($s);exit();
            if ($session['s_akses'] == 2) {
                if ($jmlwp_trans['jmlh_wp'] > 0) {
                    $hapus = "<button class='btn btn-danger btn-xs' type='button' onclick='bukaAlert()' title='Hapus Pendaftaran'><span class='glyph-icon icon-trash'></span></button>";
                } else if ($jmlop > 0) {
                    $hapus = "<button class='btn btn-danger btn-xs' type='button' onclick='bukaAlert2()' title='Hapus Pendaftaran'><span class='glyph-icon icon-trash'></span></button>";
                } else {

                    $hapus = "<a href='#' onclick='hapus(" . $row['t_idwp'] . ");return false;' class='btn btn-danger btn-xs' title='Hapus Pendaftaran'><i class='glyph-icon icon-trash'></i></a>";
                }
                $operator = $row['s_nama'];
            }
            $tutup = "<a href='pendaftaran/form_tutup?t_idwp=$row[t_idwp]' class='btn btn-danger btn-xs' title='Tutup WP'> <i class='glyph-icon icon-close'></i></a>";
            //$mapwp = "<a href='pendaftaran/detailwp?&t_idwp=$row[t_idwp]' class='btn btn-success btn-xs' title='Map WP'><i class='glyph-icon icon-map-marker'></i></a>";
            $mapwp = "";
            if ($jmlobjek_wp['jmlh_objekpajak'] > 0) {
                $suratpernyataan = "";
                // $suratpernyataan = "<button onclick='bukaCetakSuratpernyataan($row[t_idwp])' class='btn btn-primary btn-xs' title='Cetak Surat Keterangan'><i class='glyph-icon icon-print'></i></button>";
            } else {
                $suratpernyataan = "";
            }
            $suratpengukuhan = "<button onclick='bukaCetakPengukuhan($row[t_idwp])' class='btn btn-primary btn-xs' title='Cetak Surat Pengukuhan'><i class='glyph-icon icon-print'></i></button>";
            $suratfiskal = "<button onclick='bukaCetakFiskal($row[t_idwp])' class='btn btn-primary btn-xs' title='Cetak Surat Fiskal'><i class='glyph-icon icon-print'></i></button>";
            if ($row['t_jenispendaftaran'] == "R") {
                $s .= "<td data-title='#'><center>$mapwp <a href='pendaftaran/cetaknpwpd?&t_idwp=$row[t_idwp]' target='_blank' class='btn btn-primary btn-xs' title='Cetak NRWPD'><i class='glyph-icon icon-print'></i></a> 
                $suratpernyataan
                $suratpengukuhan
                $suratfiskal
                <a href='pendaftaran/form_tambahobjek?t_idwp=$row[t_idwp]' class='btn btn-success btn-xs' title='Tambah Objek'><i class='glyph-icon icon-plus'></i></a> <a href='pendaftaran/form_edit?t_idwp=$row[t_idwp]' class='btn btn-warning btn-xs' title='Ubah Pendaftaran'> <i class='glyph-icon icon-pencil' title='Edit'></i></a> 
                $hapus <br>$operator</center></td>";
            } else {
                $s .= "<td data-title='#'><center>$mapwp <a href='pendaftaran/cetaknpwpd?&t_idwp=$row[t_idwp]' target='_blank' class='btn btn-primary btn-xs' title='Cetak NPWPD'><i class='glyph-icon icon-print'></i></a> 
                $suratpernyataan
                $suratpengukuhan
                $suratfiskal
                <a href='pendaftaran/form_tambahobjek?t_idwp=$row[t_idwp]' class='btn btn-success btn-xs' title='Tambah Objek'><i class='glyph-icon icon-plus'></i></a> <a href='pendaftaran/form_edit?t_idwp=$row[t_idwp]' class='btn btn-warning btn-xs' title='Ubah Pendaftaran'> <i class='glyph-icon icon-pencil'></i></a> 
                $hapus <br>$operator</center></td>";
            }
            // <button onclick='bukaCetakKartuData($row[t_idwp])' target='_blank' class='btn btn-primary btn-xs' title='Cetak Kartu Data'><i class='glyph-icon icon-print'></i></button>
            // <button onclick='bukaCetakRekapData($row[t_idwp])' target='_blank' class='btn btn-primary btn-xs' title='Cetak Rekap Data'><i class='glyph-icon icon-print'></i></button>
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "griddaftar" => $s,
            "rowsdaftar" => $base->rows,
            "countdaftar" => $count,
            "pagedaftar" => $page,
            "startdaftar" => $start,
            "total_halamandaftar" => $total_pages,
            "paginatoredaftar" => $datapaging['paginatore'],
            "akhirdatadaftar" => $datapaging['akhirdata'],
            "awaldatadaftar" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridobjekAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new ObjekBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('ObjekTable')->getGridCountOp($base, $post);
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
        $data = $this->Tools()->getService('ObjekTable')->getGridDataOp($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            if (!empty($row['t_tipeusaha'])) {
                $tipeusaha = str_pad($row['t_tipeusaha'], 2, "0", STR_PAD_LEFT) . ' - ' . $row['s_namausaha'];
            } else {
                $tipeusaha = '-';
            }
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . date('d-m-Y', strtotime($row['t_tgldaftarobjek'])) . "</center></td>";
            $s .= "<td><b style='color:red'>" . $row['t_npwpdwp'] . "</b><br>" . $row['t_namawp'] . "</td>";
            $s .= "<td><b style='color:blue'>" . $row['t_nop'] . "</b><br>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td>" . $row['t_alamatobjek'] . "</td>";
            $s .= "<td>" . $row['s_namakelobjek'] . "</td>";
            $s .= "<td>" . $row['s_namakecobjek'] . "</td>";
            $s .= "<td>" . $row['s_namajenis'] . "</td>";
            $s .= "<td style='text-align:center;'>" . $tipeusaha . "</td>";
            $s .= "<td>" . $row['korek'] . '<br>' . $row['s_namakorek'] . "</td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator1($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridobjek" => $s,
            "rowsobjek" => $base->rows,
            "countobjek" => $count,
            "pageobjek" => $page,
            "startobjek" => $start,
            "total_halamanobjek" => $total_pages,
            "paginatoreobjek" => $datapaging['paginatore'],
            "akhirdataobjek" => $datapaging['akhirdata'],
            "awaldataobjek" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridTutupAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new PendaftaranBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;

        $count = $this->Tools()->getService('PendaftaranTable')->getGridCountTutup($base);
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
        $data = $this->Tools()->getService('PendaftaranTable')->getGridDataTutup($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='Alamat'>" . $row['t_alamat'] . "</td>";
            $s .= "<td data-title='Kelurahan'>" . $row['s_namakel'] . "</td>";
            $s .= "<td data-title='Kecamatan'>" . $row['s_namakec'] . "</td>";
            $s .= "<td data-title='Kabupaten'>" . $row['t_kabupaten'] . "</td>";
            $s .= "<td data-title='Tanggal Pendaftaran'><center>" . date('d-m-Y', strtotime($row['t_tgldaftar'])) . "</center></td>";
            $jmlop = $this->Tools()->getService('ObjekTable')->getJmlOP($row['t_idwp']);
            $s .= "<td data-title='Jumlah OP'><center>" . $jmlop . "</center></td>";
            $hapus = "";
            $operator = "";
            if ($session['s_akses'] == 2) {
                $hapus = "<a href='#' onclick='hapustutup(" . $row['t_idwp'] . ");return false;' class='btn btn-danger btn-xs' title='Hapus Pendaftaran'><i class='glyph-icon icon-trash'></i></a>";
                $operator = $row['s_nama'];
            }
            $bukaKembali = "<a href='pendaftaran/form_bukakembali?t_idwp=$row[t_idwp]' class='btn btn-warning btn-xs' title='Buka Kembali WP'> <i class='glyph-icon icon-edit'></i></a>";
            // $mapwp = "<a href='pendaftaran/detailwp?&t_idwp=$row[t_idwp]' class='btn btn-success btn-xs' title='Map WP'><i class='glyph-icon icon-map-marker'></i></a>";
            $mapwp = "";
            $s .= "<td data-title='#'><center>$mapwp $bukaKembali $hapus <br>$operator</center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator2($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridtutup" => $s,
            "rowstutup" => $base->rows,
            "counttutup" => $count,
            "pagetutup" => $page,
            "starttutup" => $start,
            "total_halamantutup" => $total_pages,
            "paginatoretutup" => $datapaging['paginatore'],
            "akhirdatatutup" => $datapaging['akhirdata'],
            "awaldatatutup" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function FormTambahAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $no = $this->Tools()->getService('PendaftaranTable')->nopendaftaran();
        $t_nopendaftaran = str_pad((int) $no['t_nopendaftaran'] + 1, 7, '0', STR_PAD_LEFT);
        $form = new PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null, $t_nopendaftaran);
        $req = $this->getRequest();
        if ($this->getRequest()->isPost()) {
            $base = new PendaftaranBase();
            $httpadapter = new \Zend\File\Transfer\Adapter\Http();
            $extensionvalidator = new \Zend\Validator\File\MimeType(array('image/jpeg', 'image/jpg', 'image/png', 'image/bmp'));
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $File = $this->params()->fromFiles('t_photowp');
                //                $httpadapter->setValidators(array($extensionvalidator), $File['name']);
                if ($httpadapter->isValid($File['name'])) {
                    $httpadapter->setDestination('public/upload/photowp/');
                    if ($httpadapter->receive($File["name"])) {
                        //                        $newFile = $httpadapter->getFileName();
                        $newFile = 'public/upload/photowp/' . $File['name'];
                    }
                }
                // simpan ke tabel pendaftaran
                $returnval = $this->Tools()->getService('PendaftaranTable')->simpanpendaftaran($base, $session, $post, $req->getPost(), $newFile);
                if ($returnval['result'] == 1) {
                    $this->flashMessenger()->addMessage('Data Wajib Pajak Telah Tersimpan');
                }
                $datawp = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyNoDaftar($returnval['data']);
                return $this->redirect()->toRoute("pendaftaran", array(
                    "controllers" => "Pendaftaran",
                    "action" => "form_tambahobjek",
                    "page" => $datawp['t_idwp']
                ));
            }
        }
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $view = new ViewModel(array(
            'data_pemda' => $ar_pemda,
            'form' => $form
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

    public function FormEditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idwp');
            $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranId($id);
            $data->t_nopendaftaran = str_pad((int) $data->t_nopendaftaran, 7, '0', STR_PAD_LEFT);
            $data->t_tgldaftar = date('d-m-Y', strtotime($data->t_tgldaftar));
            $data->t_rt = str_replace(' ', '', $data->t_rt);
            $data->t_rw = str_replace(' ', '', $data->t_rw);
            $form = new PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), $this->comboKelurahanCamat($data->t_kelurahan), null, $this->comboKelurahanCamat($data->t_kecamatan_badan));
            $form->bind($data);
        }
        $view = new ViewModel(array(
            'form' => $form,
            'photo_wp' => $data->t_photowp
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

    public function FormTutupAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PendaftaranFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idwp');
            $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranId($id);
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendaftaranBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if (!$form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('PendaftaranTable')->simpantutupwp($base, $session);
                return $this->redirect()->toRoute('pendaftaran');
            }
        }
        $view = new ViewModel(array(
            'data' => $data,
            'form' => $form,
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

    public function FormBukakembaliAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PendaftaranFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idwp');
            $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranId($id);
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PendaftaranBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if (!$form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('PendaftaranTable')->simpanbukawp($base, $session);
                return $this->redirect()->toRoute('pendaftaran');
            }
        }
        $view = new ViewModel(array(
            'data' => $data,
            'form' => $form,
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

    public function FormTambahobjekAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $this->params("page");
            if ($id == 0) {
                $id = (int) $req->getQuery()->get('t_idwp');
            }
            $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranId($id);
            $datawpobjek = $this->Tools()->getService('PendaftaranTable')->temukanPendaftaran($id);
            $datawparray = $datawpobjek->current();
            $datawparray['t_tgldaftar'] = date('d-m-Y', strtotime($datawparray['t_tgldaftar']));
            $dataobjek = $this->Tools()->getService('ObjekTable')->getDataObjek($id);
            $table_objek = '';
            $counter = 1;
            // var_dump($dataobjek);
            // exit;
            foreach ($dataobjek as $row) {
                $jmlobjek_trans = $this->Tools()->getService('PendaftaranTable')->getDataJmlhObjek($row['t_idobjek']);
                $table_objek .= "<tr>
                <td>" . $counter++ . "</td>
                <td style='color:red; font-size:12px; font-weight:bold'>" . $row['t_nop'] . "</td>
                <td>" . $row['t_namaobjek'] . "</td>
                <td>" . $row['s_namajenis'] . "</td>
                <td>" . $row['t_alamatobjek'] . ", RT. " . $row['t_rtobjek'] . ", RW. " . $row['t_rwobjek'] . ", Kel/Desa " . $row['s_namakelobjek'] . ", Kec. " . $row['s_namakecobjek'] . "</td>
                <td>" . $row['korek'] . " - " . $row['s_namakorek'] . "</td>
                <td style='text-align:center;'>" . str_pad($row['t_tipeusaha'], 2, "0", STR_PAD_LEFT) . ' - ' . $row['s_namausaha'] . "</td>";
                $hapus = "";
                $operator = "";
                if ($session['s_akses'] == 2) {
                    if ($jmlobjek_trans['jmlh_objek'] > 0) {
                        $hapus = "<button class='btn btn-danger btn-xs' type='button' onclick='bukaAlert()'><span class='glyph-icon icon-trash'></span></button>";
                    } else {
                        $hapus = "<button class='btn btn-danger btn-xs' type='button' onclick='hapusobjekpajak($row[t_idobjek])'><span class='glyph-icon icon-trash'></span></button>";
                    }
                    $operator = $row['s_nama'];
                }
                // $mapop = "<a href='" . $this->cekurl() . "/pendaftaran/detailop?t_idobjek=$row[t_idobjek]' class='btn btn-success btn-xs' title='Map OP'><i class='glyph-icon icon-map-marker'></i></a>";
                $mapop = "";
                $table_objek .= "<td style='text-align: center'>
                " . $mapop . " 
                <button class='btn btn-warning btn-xs' type='button' onclick='editobjekpajak(" . $row['t_idobjek'] . ")'><span class='glyph-icon icon-pencil' title='Edit'></span></button>
                " . $hapus . "<br>" . $operator . "</td>
            </tr>";
            }
            $form = new ObjekFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatanObjek(), null, null, $this->Tools()->getService('ObjekTable')->getcomboIdJenis($datawparray['t_jenispendaftaran']), null, $this->Tools()->getService('TipeusahaTable')->getcomboIdJenis());
            $form->bind($data);
        }
        if ($req->isPost()) {
            $form = new ObjekFrm();
            $kb = new ObjekBase();
            $httpadapter = new \Zend\File\Transfer\Adapter\Http();
            $extensionvalidator = new \Zend\Validator\File\MimeType(array('image/jpeg', 'image/jpg', 'image/png', 'image/bmp'));
            $form->setInputFilter($kb->getInputFilter());
            $form->setData($req->getPost());
            if ($form->isValid()) {
                $newFile = '';
                $kb->exchangeArray($form->getData());
                $File = $this->params()->fromFiles('t_gambarobjek');
                //                $httpadapter->setValidators(array($extensionvalidator), $File['name']);
                if ($httpadapter->isValid($File['name'])) {
                    $httpadapter->setDestination('public/upload/');
                    if ($httpadapter->receive($File["name"])) {
                        //                        $newFile = $httpadapter->getFileName();
                        $newFile = 'public/upload/' . $File['name'];
                    }
                }
                $returnval = $this->Tools()->getService('ObjekTable')->simpanobjek($kb, $session, $newFile);
                if ($returnval['result'] == 1) {
                    $this->flashMessenger()->addMessage('Data Objek Telah Tersimpan');
                }
                return $this->redirect()->toRoute("pendaftaran", array(
                    "controllers" => "Pendaftaran",
                    "action" => "form_tambahobjek",
                    "page" => $kb->t_idwp
                ));
            }
        }
        // var_dump($datawparray);
        // exit;
        $view = new ViewModel(array(
            'form' => $form,
            'data' => $datawparray,
            'datauser' => $session,
            'table_objek' => $table_objek,
            'dataobjek' => $dataobjek,
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

    public function noobjekAction()
    {
        /** No. Objek Pajak
         * @param int $t_idobjek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 13/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('ObjekTable')->noobjek($data_get['t_jenisobjek']);
        $t_noobjek = str_pad($data['t_noobjek'] + 1, 5, "0", STR_PAD_LEFT);
        $data_render = array(
            "t_noobjek" => $t_noobjek
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function nopendaftaranAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PendaftaranTable')->nopendaftaran($data_get['t_jenispendaftaran']);
        $t_nopendaftaran = str_pad($data['t_nopendaftaran'] + 1, 7, "0", STR_PAD_LEFT);
        $data_render = array(
            "t_nopendaftaran" => $t_nopendaftaran
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function editobjekpajakAction()
    {
        /** Edit Data Objek Pajak
         * @param int $t_idobjek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 13/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('ObjekTable')->getDataObjekId($data_get['t_idobjek']);
        // var_dump($data);exit();
        $datakec = $this->Tools()->getService('PendaftaranTable')->getByKecamatancombo($data['t_kelurahanobjek']);

        // var_dump($data['t_kecamatanobjek']);
        // var_dump($data['t_kelurahanobjek']);
        // exit;
        $selectkelurahan = "";
        // $selectkelurahan .= "<option value=''>Silahkan Pilih</option>";
        foreach ($datakec as $r) {
            if ($r['s_kodekel'] == $data['t_kelurahanobjek']) {
                $selectkelurahan .= "<option value='" . $r['s_kodekel'] . "' selected>" . str_pad($r['s_kodekel'], 2, "0", STR_PAD_LEFT) . " || " . $r['s_namakel'] . "'</option>";
            } else {
                $selectkelurahan .= "<option value='" . $r['s_kodekel'] . "'>" . str_pad($r['s_kodekel'], 2, "0", STR_PAD_LEFT) . " || " . $r['s_namakel'] . "</option>";
            }
        }

        $datakorek = $this->Tools()->getService('RekeningTable')->getdataRekeningByIdJenisObjek($data['t_jenisobjek']);
        $opsi = "";
        $opsi .= "<option value=''>Silahkan Pilih</option>";
        foreach ($datakorek as $r) {
            if ($data['t_korekobjek'] == $r['s_idkorek']) {
                $opsi .= "<option value='" . $r['s_idkorek'] . "' selected>" . $r['korek'] . " || " . $r['s_namakorek'] . "</option>";
            } else {
                $opsi .= "<option value='" . $r['s_idkorek'] . "'>" . $r['korek'] . " || " . $r['s_namakorek'] . "</option>";
            }
        }

        $data_render = array(
            "t_idobjek" => $data['t_idobjek'],
            "t_jenisobjek" => $data['t_jenisobjek'],
            "t_noobjek" => str_pad($data['t_noobjek'], 5, '0', STR_PAD_LEFT),
            "t_korekobjek" => $opsi,
            "t_tgldaftarobjek" => date('d-m-Y', strtotime($data['t_tgldaftarobjek'])),
            "t_namaobjek" => $data['t_namaobjek'],
            "t_alamatobjek" => $data['t_alamatobjek'],
            "t_namaobjekpj" => $data['t_namaobjekpj'],
            "t_alamatobjekpj" => $data['t_alamatobjekpj'],
            "t_rtobjek" => str_replace(' ', '', $data['t_rtobjek']),
            "t_rwobjek" => str_replace(' ', '', $data['t_rwobjek']),
            "t_kecamatanobjek" => $data['t_kecamatanobjek'],
            "t_kelurahanobjek" => $selectkelurahan,
            // "t_kelurahanobjek" => $data['t_kelurahanobjek'],
            "t_kabupatenobjek" => $data['t_kabupatenobjek'],
            "t_notelpobjek" => $data['t_notelpobjek'],
            "t_kodeposobjek" => $data['t_kodeposobjek'],
            "t_latitudeobjek" => $data['t_latitudeobjek'],
            "t_longitudeobjek" => $data['t_longitudeobjek'],
            "t_gambarobjek" => $data['t_gambarobjek'],
            "t_tipeusaha" => $data['t_tipeusaha']
        );
        // var_dump($data_render);exit();
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hapusAction()
    {
        /** Hapus Pendaftaran
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('PendaftaranTable')->hapusPendaftaran($this->params('page'));
        return $this->getResponse();
    }

    public function hapusobjekpajakAction()
    {
        /** Hapus Pendaftaran
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('ObjekTable')->hapusPendaftaranObjek($this->params('page'));
        return $this->getResponse();
    }

    public function comboKelurahanCamatAction()
    {
        $frm = new PendaftaranFrm();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new PendaftaranBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $s = "";
                if ($ex->t_kecamatan == '0') {
                    $s .= " <div class='col-sm-12'>
                                <label class='col-sm-2 '>Kecamatan</label>
                                <div class='col-md-4'>
                                    <input type='text' class='form-control' name='t_kecamatanluar' id='t_kecamatanluar'>
                                </div>
                                <label class='col-sm-1'>Kelurahan</label>
                                <div class='col-md-4'>
                                    <input type='text' class='form-control' name='t_kelurahanluar' id='t_kelurahanluar'>
                                </div>
                            </div>";
                }
                $data = $this->Tools()->getService('PendaftaranTable')->getByKecamatan($ex);

                $opsi = "";
                $opsi .= "<option value=''>Silahkan Pilih</option>";
                foreach ($data as $r) {
                    // if ((int)$r['s_kodekel'] == 18) {
                    //     $kode = '0';
                    // } else {
                    //     $kode  = $r['s_kodekel'];
                    // }
                    // $opsi .= "<option value='" . $r['s_kodekel'] . "'>" . str_pad($kode, 2, "0", STR_PAD_LEFT) . " || " . $r['s_namakel'] . "</option>";
                    $opsi .= "<option value='" . $r['s_idkel'] . "'>" . str_pad($r['s_kodekel'], 2, "0", STR_PAD_LEFT) . " || " . $r['s_namakel'] . "</option>";
                }
                //                $res->setContent($opsi);
            }
        }
        $data_render = array(
            'res' => $opsi,
            'keckelluar' => $s
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function comboKelurahanCamat($id_kecamatan)
    {
        $selectData = array();
        $data = $this->Tools()->getService('PendaftaranTable')->getByKecamatancombo($id_kecamatan);
        foreach ($data as $row) {
            // $selectData[$row['s_kodekel']] = str_pad($row['s_kodekel'], 2, "0", STR_PAD_LEFT) . " || " . $row['s_namakel'];
            $selectData[$row['s_idkel']] = str_pad($row['s_kodekel'], 2, "0", STR_PAD_LEFT) . " || " . $row['s_namakel'];
        }
        return $selectData;
    }

    public function ceknikAction()
    {
        /** Cek Nik Sama
         * @param string $t_nik
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 30/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PendaftaranTable')->ceknik($data_get['t_jenispendaftaran'], $data_get['t_nik']);
        $message = "";
        if (!empty($data)) {
            if ($data_get['t_nik'] == '0000000000000000') {
                $message .= "";
                $t_nik = $data_get['t_nik'];
            } else {
                $message .= "<i style='color:red; font-size:12px'>NIK " . $data['t_nik'] . " telah digunakan a/n " . $data['t_nama'] . "</i>";
                $t_nik = "";
            }
        } else {
            $message .= "";
            $t_nik = $data_get['t_nik'];
        }
        $data_render = array(
            "message" => $message,
            "t_nik" => $t_nik
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function ceknikcapilAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $token = md5("pajak" . date("dmY"));
        $url = "http://222.124.25.110:8181/index.html?user=dppkad&kunci=$token&akses=nik&nomor_nik=$data_get->t_nik";
        $json = curl_init($url);
        $options = array(
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => array('Content-type: application/json'),
        );
        curl_setopt_array($json, $options); // setting curl options
        $result = curl_exec($json); // getting json result s
        @$decode = json_decode($result, true);
        if (!empty($decode['data'])) {
            foreach ($decode['data'] as $row) {
                $data = $row;
            };
            $datakec = $this->Tools()->getService('KecamatanTable')->getidkecamatanbyname($data['nama_kec']);
            $datakel = $this->Tools()->getService('KelurahanTable')->getidkelurahanbyname($data['nama_kel']);
        } else {
            $data['nama_lengkap'] = '';
            $data['alamat'] = '';
            $data['rt'] = '';
            $data['rw'] = '';
            $data['nama_kab'] = '';
            $datakec['s_idkec'] = '';
            $datakel['s_idkel'] = '';
        }

        $data_render = array(
            "nama_lengkap" => $data['nama_lengkap'],
            "alamat" => $data['alamat'],
            "rt" => $data['rt'],
            "rw" => $data['rw'],
            "nama_kab" => $data['nama_kab'],
            "idkec" => $datakec['s_idkec'],
            "idkel" => $datakel['s_idkel']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataWPAction()
    {
        /** Mendapatkan Data Pendaftaran
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranIDWP($data_get['t_idwp']);
        $dataobjek = $this->Tools()->getService('ObjekTable')->getDataObjek($data_get['t_idwp']);
        $selectobjek = "";
        // $selectobjek .= "<select id='objekpajakwp' class='form-control'>";
        $selectobjek .= "<option value=''>Pilih Objek Pajak</option>";
        foreach ($dataobjek as $r) {
            $selectobjek .= "<option value='" . $r['t_idobjek'] . "'>" . $r['t_nop'] . " || " . $r['t_namaobjek'] . "</option>";
        }
        // $selectobjek .= "</select>";
        $data_render = array(
            "idwp" => $data['t_idwp'],
            "npwpdwp" => $data['t_npwpd'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat'],
            "objekpajak" => $selectobjek
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataWPobjekAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranId($data_get['t_idwp']);
        $dataobjek = $this->Tools()->getService('ObjekTable')->getDataObjekSelf($data_get['t_idwp']);
        $selectobjek = "";
        // $selectobjek .= "<select id='objekpajakwp' class='form-control'>";
        $selectobjek .= "<option value=''>Pilih Objek Pajak</option>";
        foreach ($dataobjek as $r) {
            $selectobjek .= "<option value='" . $r['t_idobjek'] . "'>" . $r['t_nop'] . " || " . $r['s_namajenis'] . "</option>";
        }
        // $selectobjek .= "</select>";
        $data_render = array(
            "idwp" => $data->t_idwp,
            "npwpdwp" => $data->t_npwpdwp,
            "namawp" => $data->t_nama,
            "alamatwp" => $data->t_alamat,
            "objekpajak" => $selectobjek
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataWPSuratAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataobjek = $this->Tools()->getService('ObjekTable')->getDataObjekId($data_get['t_idobjek']);
        // var_dump($dataobjek); exit();
        $data_render = array(
            "idobjekwp" => $dataobjek['t_idobjek'],
            "npwpdwp" => $dataobjek['t_npwpdwp'],
            "namawp" => $dataobjek['t_namawp'],
            "namausaha" => $dataobjek['t_namaobjek'],
            "alamatusaha" => $dataobjek['t_alamatobjek'],
            "namajenis" => $dataobjek['s_namajenis']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetakkartudataAction()
    {
        /** Cetak Kartu Data 
         * @param int $t_idwpkartudata
         * @param date('Y') $periodekartudata
         * @param int $mengetahuikartudata
         * @param int $diperiksakartudata
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data Jenis Pajak
        $datajenispajak = $this->Tools()->getService('PendaftaranTable')->getDataJenisPajak($data_get['objekpajakwp']);
        // Mengambil Data WP
        $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranIDObjek($data_get['objekpajakwp']);
        // Mengambil Data Penetapan dan Pembayaran
        $dataarr = array();
        for ($i = 1; $i <= 12; $i++) {
            $datatransaksi = $this->Tools()->getService('PendaftaranTable')->getTransaksi($i, $data_get['periodekartudata'], $data_get['objekpajakwp']);
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
        $datatransaksireklame = $this->Tools()->getService('PendaftaranTable')->getTransaksireklame($data_get['periodekartudata'], $data_get['objekpajakwp']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahuikartudata']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksakartudata']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'datatransaksi' => $dataarr,
            'datatransaksireklame' => $datatransaksireklame,
            'ar_pemda' => $ar_pemda,
            'ar_mengetahui' => $ar_mengetahui,
            'ar_diperiksa' => $ar_diperiksa,
            "datajenispajak" => $datajenispajak,
            'periodepajak' => $data_get['periodekartudata']
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function cetakrekapdataAction()
    {
        //Roni : uodate rekap data wp belum lunas
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data Jenis Pajak
        // $datajenispajak = $this->Tools()->getService('PendaftaranTable')->getDataJenisPajak($data_get['objekpajakwp']);
        // Mengambil Data WP
        $data = $this->Tools()->getService('PendaftaranTable')->temukanPendaftaran($data_get['idwprekapdata']);
        // Mengambil Data Penetapan dan Pembayaran
        $datatransaksi = $this->Tools()->getService('PendaftaranTable')->getTransaksiRekapdata($data_get['perioderekapdata'], $data_get['idwprekapdata']);
        // var_dump($datatransaksi); exit();
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data->current(),
            'datatransaksi' => $datatransaksi,
            'ar_pemda' => $ar_pemda,
            // "datajenispajak" => $datajenispajak,
            'periodepajak' => $data_get['perioderekapdata']
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function cetaknpwpdAction()
    {
        /** Cetak NPWPD
         * @param int $t_idwp
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranIDWP($data_get['t_idwp']);
        if ($data['t_kecamatan'] == 0) {
            $kecamatan = $data['kecamatanluarwp'];
            $kelurahan = $data['kelurahanluarwp'];
        } else {
            $kecamatan = $data['s_namakec'];
            $kelurahan = $data['s_namakel'];
        }
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId(4);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'kecamatan' => $kecamatan,
            'kelurahan' => $kelurahan,
            'ar_pemda' => $ar_pemda,
            'ar_mengetahui' => $ar_mengetahui,
        ));
        $pdf->setOption("paperSize", "Legal-l");
        return $pdf;
    }

    public function cetakpendaftaranAction()
    {
        /** Cetak Pendaftaran 
         * @param string $tglcetak Tanggal Mencetak Dokumen
         * @param date('d-m-Y') $tgldaftar0 Tanggal Minimal Pendaftaran WP
         * @param date('d-m-Y') $tgldaftar1 Tanggal Maximal Pendaftaran WP
         * @param int $t_kecamatan 
         * @param int $t_kelurahan  
         * @param int $t_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PendaftaranTable')->getviewwp($data_get->tgldaftar0, $data_get->tgldaftar1, $data_get->t_kecamatan, $data_get->t_kelurahan, $data_get->t_jenispendaftaran, $data_get->t_status_wp);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'arr_data' => $records,
                'tgldaftar0' => $data_get->tgldaftar0,
                'tgldaftar1' => $data_get->tgldaftar1,
                'tglcetak' => $data_get->tglcetak,
                'statuswp' => $data_get->t_status_wp,
                'jenispendaftaran' => $data_get->t_jenispendaftaran,
                'ar_pemda' => $ar_pemda,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'formatcetak' => $data_get->formatcetak
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'arr_data' => $records,
                'tgldaftar0' => $data_get->tgldaftar0,
                'tgldaftar1' => $data_get->tgldaftar1,
                'tglcetak' => $data_get->tglcetak,
                'statuswp' => $data_get->t_status_wp,
                'jenispendaftaran' => $data_get->t_jenispendaftaran,
                'ar_pemda' => $ar_pemda,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetakpendaftaranexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $kolom = $data_get['pilihanselect'];
        $arr_data = explode(',', $kolom);
        $records = array();
        foreach ($arr_data as $arr_data) {
            $records[] = $arr_data;
        }
        $chars = array(
            0 => 'B', 1 => 'C', 2 => 'D', 3 => 'E', 4 => 'F', 5 => 'G', 6 => 'H', 7 => 'I', 8 => 'J', 9 => 'K', 10 => 'L',
            11 => 'M', 12 => 'N', 13 => 'O', 14 => 'P', 15 => 'Q', 16 => 'R', 17 => 'S', 18 => 'T', 19 => 'U', 20 => 'V',
            21 => 'W', 22 => 'X', 23 => 'Y', 24 => 'Z'
        );
        $data = $this->Tools()->getService('PendaftaranTable')->getviewwp($data_get->tgldaftar0, $data_get->tgldaftar1, $data_get->t_kecamatan, $data_get->t_kelurahan);

        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1:' . $chars[count($records) - 1] . '2')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A4:C4')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:F6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->mergeCells('A1:' . $chars[count($records) - 1] . '2');
        $object->getActiveSheet()->mergeCells('A4:C4');
        $object->setActiveSheetIndex(0)->setCellValue('A1', 'DAFTAR PENDAFTARAN WP')->setCellValue('A4', 'Tanggal Pendaftaran  : ' . $data_get->tgldaftar0 . ' S/D ' . $data_get->tgldaftar1);
        $object->setActiveSheetIndex(0)->setCellValue('A6', 'No.');
        foreach ($records as $key => $arr_row) {
            switch ($arr_row) {
                case "t_tgldaftar":
                    $datarow = "Tgl. Daftar";
                    break;
                case "t_npwpd":
                    $datarow = "NPWPD";
                    break;
                case "t_nama":
                    $datarow = "Nama";
                    break;
                case "t_nik":
                    $datarow = "NIK";
                    break;
                case "t_alamat_lengkap":
                    $datarow = "Alamat";
                    break;
                case "t_notelp":
                    $datarow = "No. Telp.";
                    break;
                case "t_kodepos":
                    $datarow = "Kode Pos";
                    break;
                case "t_email":
                    $datarow = "Email";
                    break;
                default:
                    $datarow = "";
            }
            if ($datarow == '') {
            } else {
                $object->setActiveSheetIndex(0)->setCellValue($chars[$key] . '6', $datarow);
            }
        }
        $counter = 7;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            foreach ($records as $key => $arr_row) {
                if ($arr_row == 't_tgldaftar') {
                    $ex->setCellValue($chars[$key] . "" . $counter, date('d-m-Y', strtotime($v[$arr_row])));
                } else {
                    $ex->setCellValue($chars[$key] . "" . $counter, $v[$arr_row]);
                }
            }
            $counter = $counter + 1;
            $no++;
        }
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="pendaftaran.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetakpendaftaranopAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('ObjekTable')->getviewobjek($data_get->tgldaftar0op, $data_get->tgldaftar1op, $data_get->t_kecamatanop, $data_get->t_kelurahanop, $data_get->t_jenispajakop, $data_get->t_koderekeningop, $data_get->t_status_objek, $data_get->t_tipeusaha);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        if (!empty($data_get->t_jenispajakop)) {
            $ar_jenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get->t_jenispajakop);
        }
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'arr_data' => $records,
                'tgldaftar0' => $data_get->tgldaftar0op,
                'tgldaftar1' => $data_get->tgldaftar1op,
                'tglcetak' => $data_get->tglcetakop,
                'ar_pemda' => $ar_pemda,
                'ar_jenis' => $ar_jenis,
                'statusobjek' => $data_get->t_status_objek,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'formatcetak' => $data_get->formatcetak
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'arr_data' => $records,
                'tgldaftar0' => $data_get->tgldaftar0op,
                'tgldaftar1' => $data_get->tgldaftar1op,
                'tglcetak' => $data_get->tglcetakop,
                'ar_pemda' => $ar_pemda,
                'ar_jenis' => $ar_jenis,
                'statusobjek' => $data_get->t_status_objek,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetakpendaftaranopexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $kolom = $data_get['pilihanselectop'];
        $arr_data = explode(',', $kolom);

        $records = array();
        foreach ($arr_data as $arr_data) {
            $records[] = $arr_data;
        }
        $chars = array(
            0 => 'B', 1 => 'C', 2 => 'D', 3 => 'E', 4 => 'F', 5 => 'G', 6 => 'H', 7 => 'I', 8 => 'J', 9 => 'K', 10 => 'L',
            11 => 'M', 12 => 'N', 13 => 'O', 14 => 'P', 15 => 'Q', 16 => 'R', 17 => 'S', 18 => 'T', 19 => 'U', 20 => 'V',
            21 => 'W', 22 => 'X', 23 => 'Y', 24 => 'Z'
        );
        $data = $this->Tools()->getService('ObjekTable')->getviewobjek($data_get->tgldaftar0op, $data_get->tgldaftar1op, $data_get->t_kecamatanop, $data_get->t_kelurahanop, $data_get->t_jenispajakop);

        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1:' . $chars[count($records) - 1] . '2')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A4:C4')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:F6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->mergeCells('A1:' . $chars[count($records) - 1] . '2');
        $object->getActiveSheet()->mergeCells('A4:C4');
        $object->setActiveSheetIndex(0)->setCellValue('A1', 'DAFTAR PENDAFTARAN OBJEK PAJAK')->setCellValue('A4', 'Tanggal Pendaftaran  : ' . $data_get->tgldaftar0op . ' S/D ' . $data_get->tgldaftar1op);
        $object->setActiveSheetIndex(0)->setCellValue('A6', 'No.');
        foreach ($records as $key => $arr_row) {
            switch ($arr_row) {
                case "t_npwpdwp":
                    $datarow = "NPWPD";
                    break;
                case "t_namawp":
                    $datarow = "Nama WP";
                    break;
                case "t_alamat_lengkapwp":
                    $datarow = "Alamat WP";
                    break;
                case "t_tgldaftarobjek":
                    $datarow = "Tgl. Daftar OP";
                    break;
                case "t_nop":
                    $datarow = "NIOP";
                    break;
                case "t_namaobjek":
                    $datarow = "Nama OP";
                    break;
                case "t_alamatlengkapobjek":
                    $datarow = "Alamat OP";
                    break;
                case "t_kodeposobjek":
                    $datarow = "Kode Pos OP";
                    break;
                case "t_notelpobjek":
                    $datarow = "No. Telp. OP";
                    break;
                case "t_latitudeobjek":
                    $datarow = "Latitude OP";
                    break;
                case "t_longitudeobjek":
                    $datarow = "Longitude OP";
                    break;
                default:
                    $datarow = "";
            }
            if ($datarow == '') {
            } else {
                $object->setActiveSheetIndex(0)->setCellValue($chars[$key] . '6', $datarow);
            }
        }
        $counter = 7;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            foreach ($records as $key => $arr_row) {
                if ($arr_row == 't_tgldaftarobjek') {
                    $ex->setCellValue($chars[$key] . "" . $counter, date('d-m-Y', strtotime($v[$arr_row])));
                } else {
                    $ex->setCellValue($chars[$key] . "" . $counter, $v[$arr_row]);
                }
            }
            $counter = $counter + 1;
            $no++;
        }
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="pendaftaran.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function detailwpAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = $req->getQuery()->get('t_idwp');
            $data = $this->Tools()->getService('PendaftaranTable')->getDataWp($id);
            $datawp = array();
            foreach ($data as $data) {
                $datawp[] = $data;
            }
        }
        $location = "";
        foreach ($datawp as $row) {
            //"<img src=".$row['t_gambarobjek']."> ". 
            $detailwp = $row['s_namajenis'] . " <br>" . $row['t_npwpdwp'] . " <br>" . addslashes($row['t_namaobjek']) . " <br>" . $row['t_alamatlengkapobjek'];
            $location .= "['" . $detailwp . "', " . $row['t_latitudeobjek'] . ", " . $row['t_longitudeobjek'] . "],";
        }
        $view = new ViewModel(array(
            'location' => $location
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

    public function detailopAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = $req->getQuery()->get('t_idobjek');
            $data = $this->Tools()->getService('PendaftaranTable')->getDataOp($id);
        }
        $view = new ViewModel(array(
            'data' => $data,
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

    public function cetaksuratpernyataanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('ObjekTable')->getDataObjekIdObjek($data_get['jenisobjek']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksa']);

        if ($data_get['formatcetak'] == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'ar_pemda' => $ar_pemda,
                'ar_mengetahui' => $ar_mengetahui,
                'ar_diperiksa' => $ar_diperiksa,
                'periodepajak' => $data_get['periode'],
                'formatcetak' => $data_get['formatcetak'],
            ));
            $pdf->setOption("paperSize", "potrait");
            return $pdf;
        } elseif ($data_get['formatcetak'] == 'word') {
            $view = new ViewModel(array(
                'data' => $data,
                'ar_pemda' => $ar_pemda,
                'ar_mengetahui' => $ar_mengetahui,
                'ar_diperiksa' => $ar_diperiksa,
                'periodepajak' => $data_get['periode'],
                'formatcetak' => $data_get['formatcetak']
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetaksuratpenunjukanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('ObjekTable')->getDataObjekIdObjek($data_get['jenisobjek']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksa']);

        if ($data_get['formatcetak'] == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'ar_pemda' => $ar_pemda,
                'ar_mengetahui' => $ar_mengetahui,
                'ar_diperiksa' => $ar_diperiksa,
                'periodepajak' => $data_get['periode'],
                'formatcetak' => $data_get['formatcetak'],
            ));
            $pdf->setOption("paperSize", "potrait");
            return $pdf;
        } elseif ($data_get['formatcetak'] == 'word') {
            $view = new ViewModel(array(
                'data' => $data,
                'ar_pemda' => $ar_pemda,
                'ar_mengetahui' => $ar_mengetahui,
                'ar_diperiksa' => $ar_diperiksa,
                'periodepajak' => $data_get['periode'],
                'formatcetak' => $data_get['formatcetak']
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetaksuratpengukuhanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // var_dump($data_get); exit();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranIDWP($data_get['t_idwp']);
        if ($data['t_kecamatan'] == 0) {
            $kecamatan = $data['kecamatanluarwp'];
            $kelurahan = $data['kelurahanluarwp'];
        } else {
            $kecamatan = $data['s_namakec'];
            $kelurahan = $data['s_namakel'];
        }
        $dataobjek = $this->Tools()->getService('ObjekTable')->getDataObjekIdObjek($data_get['jenisobjek']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);

        // var_dump($dataobjek); exit();

        if ($data_get['formatcetak'] == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'kecamatan' => $kecamatan,
                'kelurahan' => $kelurahan,
                'dataobjek' => $dataobjek,
                'ar_pemda' => $ar_pemda,
                'ar_mengetahui' => $ar_mengetahui,
                'formatcetak' => $data_get['formatcetak']
            ));
            $pdf->setOption("paperSize", "A4");
            return $pdf;
        } elseif ($data_get['formatcetak'] == 'word') {
            $view = new ViewModel(array(
                'data' => $data,
                'kecamatan' => $kecamatan,
                'kelurahan' => $kelurahan,
                'ar_pemda' => $ar_pemda,
                'ar_mengetahui' => $ar_mengetahui,
                'formatcetak' => $data_get['formatcetak']
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    /**
     *  tambahanku
     *  hapus / hidden jika tidak dibutuhkan
     */

    public function cetaksuratfiskalAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // var_dump($data_get); exit();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranIDWP($data_get['t_idwp']);
        if ($data['t_kecamatan'] == 0) {
            $kecamatan = $data['kecamatanluarwp'];
            $kelurahan = $data['kelurahanluarwp'];
        } else {
            $kecamatan = $data['s_namakec'];
            $kelurahan = $data['s_namakel'];
        }
        $dataobjek = $this->Tools()->getService('ObjekTable')->getDataObjekIdObjek($data_get['jenisobjek']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);

        // var_dump($dataobjek); exit();

        if ($data_get['formatcetak'] == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'kelurahan' => $kelurahan,
                'kecamatan' => $kecamatan,
                'dataobjek' => $dataobjek,
                'ar_pemda' => $ar_pemda,
                'ar_mengetahui' => $ar_mengetahui,
                'tglawal' => $data_get['tglawal'],
                'tglakhir' => $data_get['tglakhir'],
                'formatcetak' => $data_get['formatcetak']
            ));
            $pdf->setOption("paperSize", "A4");
            // var_dump($pdf);die;
            return $pdf;
        } elseif ($data_get['formatcetak'] == 'word') {
            $view = new ViewModel(array(
                'data' => $data,
                'kelurahan' => $kelurahan,
                'kecamatan' => $kecamatan,
                'ar_pemda' => $ar_pemda,
                'ar_mengetahui' => $ar_mengetahui,
                'formatcetak' => $data_get['formatcetak']
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function carirekeningAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        $datakorek = $this->Tools()->getService('RekeningTable')->getdataRekeningByIdJenisObjek($data_get['t_jenisobjek']);

        $opsi = "";
        $opsi .= "<option value=''>Silahkan Pilih</option>";
        if ($data_get['t_jenisobjek'] == 1 || $data_get['t_jenisobjek'] == 2 || $data_get['t_jenisobjek'] == 3 || $data_get['t_jenisobjek'] == 4 || $data_get['t_jenisobjek'] == 5 || $data_get['t_jenisobjek'] == 6 || $data_get['t_jenisobjek'] == 7 || $data_get['t_jenisobjek'] == 8 || $data_get['t_jenisobjek'] == 9) {
            foreach ($datakorek as $r) {
                $opsi .= "<option value='" . $r['s_idkorek'] . "'>" . $r['korek'] . " || " . $r['s_namakorek'] . "</option>";
            }
        } else {
            foreach ($datakorek as $r) {
                $opsi .= "<option value='" . $r['s_idkorek'] . "'>" . $r['korek'] . " || " . $r['s_namakorek'] . "</option>";
            }
        }
        $data_render = array(
            'res' => $opsi
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cekurl()
    {
        $basePath = $this->getRequest()->getBasePath();
        $uri = new \Zend\Uri\Uri($this->getRequest()->getUri());
        $uri->setPath($basePath);
        $uri->setQuery(array());
        $uri->setFragment('');

        return $uri->getScheme() . '://' . $uri->getHost() . ':' . $_SERVER['SERVER_PORT'] . '' . $uri->getPath();
    }


    public function cetakpendaftaranwpopAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('ObjekTable')->getviewwpobjek($data_get->tgldaftar1wpop, $data_get->tgldaftarwpop, $data_get->t_jenispajakwpop, $data_get->t_status_objekwpop);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        if (!empty($data_get->t_jenispajakop)) {
            $ar_jenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get->t_jenispajakwpop);
        }
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksawpop);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahuiwpop);
        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'arr_data' => $records,
                'tgldaftar0' => $data_get->tgldaftar1wpop,
                'tgldaftar1' => $data_get->tgldaftarwpop,
                'tglcetak' => $data_get->tglcetakwpop,
                'ar_pemda' => $ar_pemda,
                'ar_jenis' => $ar_jenis,
                'statusobjek' => $data_get->t_status_objekwpop,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'formatcetak' => $data_get->formatcetak
            ));
            // var_dump($pdf);exit();
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'arr_data' => $records,
                'tgldaftar0' => $data_get->tgldaftar1wpop,
                'tgldaftar1' => $data_get->tgldaftarwpop,
                'tglcetak' => $data_get->tglcetakwpop,
                'ar_pemda' => $ar_pemda,
                'ar_jenis' => $ar_jenis,
                'statusobjek' => $data_get->t_status_objekwpop,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);

            return $view;
        }
    }
}
