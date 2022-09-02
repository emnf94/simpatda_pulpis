<?php

namespace Pajak\Controller\Pendaftaran;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Pendaftaran\PendaftaranFrm;
use Pajak\Model\Pendaftaran\PendaftaranBase;

class Penutupanwp extends AbstractActionController
{

    public function indexAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        if (empty($session)) {
            return $this->redirect()->toRoute("sign_in");
        }
        $form = new PendaftaranFrm();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        $ar_objekpajak = $this->Tools()->getService('ObjekTable')->getAllDataObjek();

        $view = new ViewModel(array(
            'form' => $form,
            'ar_objekpajak' => $ar_objekpajak
        ));
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
        $count = $this->Tools()->getService('PenutupanwpTable')->getGridPenutupanCount($base, $post);
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
        $data = $this->Tools()->getService('PenutupanwpTable')->getGridPenutupanData($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . date('d-m-Y', strtotime($row['t_tgldaftar'])) . "</center></td>";
            $s .= "<td><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td>" . $row['t_nama'] . "</td>";
            $s .= "<td>" . $row['t_alamat_lengkap'] . "</td>";
            $jmlop = $this->Tools()->getService('ObjekTable')->getJmlOP($row['t_idwp']);
            $s .= "<td data-title='Jumlah OP'><center>" . $jmlop . "</center></td>";
            $s .= "<td data-title='#'><center>
			<button onclick='bukaDataPenutupanwp($row[t_idwp])' class='btn btn-danger btn-xs btn-flat' title='Penutupan WP'><i class='glyph-icon icon-minus-circle'></i> Tutup WP</button>
			<a href='penutupanwp/form_tutupobjek?t_idwp=$row[t_idwp]' class='btn btn-warning btn-xs btn-flat' title='Penutupan Objek'><i class='glyph-icon icon-minus-circle'></i> Tutup Objek</a>
			</center></td>";
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

    public function dataGridTutupAction()
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
        $count = $this->Tools()->getService('PenutupanwpTable')->getGridTidakaktifCount($base, $post);
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
        $data = $this->Tools()->getService('PenutupanwpTable')->getGridTidakaktifData($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . date('d-m-Y', strtotime($row['t_tgldaftar'])) . "</center></td>";
            $s .= "<td><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td>" . $row['t_nama'] . "</td>";
            $s .= "<td>" . $row['t_alamat_lengkap'] . "</td>";
            $jmlop = $this->Tools()->getService('ObjekTable')->getJmlOP($row['t_idwp']);
            $s .= "<td data-title='Jumlah OP'><center>" . $jmlop . "</center></td>";
            $s .= "<td data-title='#'><center>
			<button onclick='bukaDataAktifasiwp($row[t_idwp])' class='btn btn-success btn-xs' title='Aktifasi WP'><i class='glyph-icon icon-check'></i> Aktifasi WP</button>
			</center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator1($base->rows, $count, $page, $total_pages, $start);
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

    public function dataGridTutupopAction()
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
        $count = $this->Tools()->getService('PenutupanwpTable')->getGridTidakaktifOpCount($base, $post);
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
        $data = $this->Tools()->getService('PenutupanwpTable')->getGridTidakaktifOpData($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . date('d-m-Y', strtotime($row['t_tgldaftarobjek'])) . "</center></td>";
            $s .= "<td><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpdwp'] . "</center></td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td>" . $row['t_alamatlengkapobjek'] . "</td>";
            $s .= "<td>" . $row['s_namajenis'] . "</td>";
            $s .= "<td data-title='#'><center>
			<button onclick='bukaDataAktifasiop($row[t_idobjek])' class='btn btn-success btn-xs' title='Aktifasi Objek'><i class='glyph-icon icon-check'></i> Objek</button>
			</center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator2($base->rows, $count, $page, $total_pages, $start);
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

    public function FormTutupobjekAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = $this->params("page");
            if ($id == 0) {
                $id = $req->getQuery()->get('t_idwp');
            }
            $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranId($id);
            $datawpobjek = $this->Tools()->getService('PendaftaranTable')->temukanPendaftaran($id);
            $datawparray = $datawpobjek->current();
            $datawparray['t_tgldaftar'] = date('d-m-Y', strtotime($datawparray['t_tgldaftar']));
            $dataobjek = $this->Tools()->getService('ObjekTable')->getDataObjek($id);
            $form = new \Pajak\Form\Pendaftaran\PenutupanwpFrm();
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $form = new \Pajak\Form\Pendaftaran\PenutupanwpFrm();
            $base = new \Pajak\Model\Pendaftaran\PenutupanwpBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                for ($i = 0; $i < count($post['t_idobjek']); $i++) {
                    $this->Tools()->getService('PenggabunganopTable')->simpanPenggabunganOP($post['t_idobjek'][$i], $base->t_idwp);
                }
                return $this->redirect()->toRoute('penggabunganop');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'data' => $datawparray,
            'datauser' => $session,
            'dataobjek' => $dataobjek
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

    public function dataGridObjekAction()
    {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $req->isGet();
        $parametercari = $req->getQuery();
        $base = new \Pajak\Model\Pendaftaran\PenggabunganopBase();
        $base->exchangeArray($allParams);
        $s = "";
        $idobjek_1 = ($parametercari->idobjek_1 != 'undefined') ? $parametercari->idobjek_1 : '0';
        $idobjek_2 = ($parametercari->idobjek_2 != 'undefined') ? $parametercari->idobjek_2 : '0';
        $idobjek_3 = ($parametercari->idobjek_3 != 'undefined') ? $parametercari->idobjek_3 : '0';
        $idobjek_4 = ($parametercari->idobjek_4 != 'undefined') ? $parametercari->idobjek_4 : '0';
        $idobjek_5 = ($parametercari->idobjek_5 != 'undefined') ? $parametercari->idobjek_5 : '0';
        $idobjek_6 = ($parametercari->idobjek_6 != 'undefined') ? $parametercari->idobjek_6 : '0';
        $idobjek_7 = ($parametercari->idobjek_7 != 'undefined') ? $parametercari->idobjek_7 : '0';
        $idobjek_8 = ($parametercari->idobjek_8 != 'undefined') ? $parametercari->idobjek_8 : '0';
        $idobjek_9 = ($parametercari->idobjek_9 != 'undefined') ? $parametercari->idobjek_9 : '0';
        $idobjek_10 = ($parametercari->idobjek_10 != 'undefined') ? $parametercari->idobjek_10 : '0';
        $idobjek_11 = ($parametercari->idobjek_11 != 'undefined') ? $parametercari->idobjek_11 : '0';
        $idobjek_12 = ($parametercari->idobjek_12 != 'undefined') ? $parametercari->idobjek_12 : '0';
        $idobjek_13 = ($parametercari->idobjek_13 != 'undefined') ? $parametercari->idobjek_13 : '0';
        $idobjek_14 = ($parametercari->idobjek_14 != 'undefined') ? $parametercari->idobjek_14 : '0';
        $idobjek_15 = ($parametercari->idobjek_15 != 'undefined') ? $parametercari->idobjek_15 : '0';
        $idobjek_16 = ($parametercari->idobjek_16 != 'undefined') ? $parametercari->idobjek_16 : '0';
        $idobjek_17 = ($parametercari->idobjek_17 != 'undefined') ? $parametercari->idobjek_17 : '0';
        $idobjek_18 = ($parametercari->idobjek_18 != 'undefined') ? $parametercari->idobjek_18 : '0';
        $idobjek_19 = ($parametercari->idobjek_19 != 'undefined') ? $parametercari->idobjek_19 : '0';
        $idobjek_20 = ($parametercari->idobjek_20 != 'undefined') ? $parametercari->idobjek_20 : '0';
        $idobjeksudah = $idobjek_1 . "," . $idobjek_2 . "," . $idobjek_3 . "," . $idobjek_4 . "," . $idobjek_5 . "," . $idobjek_6 . "," . $idobjek_7 . "," . $idobjek_8 . "," . $idobjek_9 . "," . $idobjek_10 . "," . $idobjek_11 . "," . $idobjek_12 . "," . $idobjek_13 . "," . $idobjek_14 . "," . $idobjek_15 . "," . $idobjek_16 . "," . $idobjek_17 . "," . $idobjek_18 . "," . $idobjek_19 . "," . $idobjek_20;
        //        $rekesudah = ;
        $data = $this->Tools()->getService('PenggabunganopTable')->getGridDataObjekPajak($base, $parametercari, $idobjeksudah);
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td>" . $row['t_nop'] . "</td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td>" . $row['t_alamatlengkapobjek'] . "</td>";
            $s .= "<td><a href='#' onclick='pilihObjek(" . $row['t_idobjek'] . ");return false;' class='btn btn-xs btn-primary'><span class='glyph-icon icon-hand-o-up'> Pilih </a></td>";
            $s .= "</tr>";
        }
        $data_render = array(
            "grid" => $s
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function detailobjekAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $data_get = $req->getPost();

        $dataOP = $this->Tools()->getService('ObjekTable')->getDataObjekId($data_get['t_idobjek']);

        $html = "";
        $html .= "<tr id='detailnode" . $data_get->i . "'>
                    <td>
                        <input type='hidden' id='t_idobjek" . $data_get->i . "' name='t_idobjek[]' value='" . $dataOP['t_idobjek'] . "'>
                        <input type='text' class='form-control' id='t_nop" . $data_get->i . "' name='t_nop[]' readonly='true' value='" . $dataOP['t_nop'] . "'>
                    </td>
                    <td>
                        <input type='text' class='form-control' id='t_namaobjek" . $data_get->i . "' name='t_namaobjek[]' readonly='true' value='" . $dataOP['t_namaobjek'] . "'>
                    </td>
                    <td>
                        <input type='text' class='form-control' id='s_namajenis" . $data_get->i . "' name='s_namajenis[]' readonly='true' value='" . $dataOP['s_namajenis'] . "'>
                    </td>
                    <td>
                        <input type='text' class='form-control' id='t_alamatlengkapobjek" . $data_get->i . "' name='t_alamatlengkapobjek[]' readonly='true' value='" . $dataOP['t_alamatlengkapobjek'] . "'>
                    </td>
                    <td>
                        <span class='btn btn-xs btn-danger' onclick='removetr(" . $data_get->i . ")'><span class='glyph-icon icon-trash'></span></span>
                    </td>
                  </tr>";

        $data_render = array(
            "add_Detail" => $html
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataWPAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranIDWP($data_get['t_idwp']);
        $data_render = array(
            "idwp" => $data['t_idwp'],
            "npwpdwp" => $data['t_npwpd'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat_lengkap']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataObjekAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdObjek($data_get['t_idwpobjek']);
        $data_render = array(
            "idwp" => $data['t_idwp'],
            "idobjek" => $data['t_idobjek'],
            "npwpdwp" => $data['t_npwpd'],
            "namawp" => $data['t_nama'],
            "namaobjek" => $data['t_namaobjek'],
            "alamatobjek" => $data['t_alamatlengkapobjek'],
            "jenisobjek" => $data['s_namajenis']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function simpanpenutupanwpAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data_post = $req->getPost();
        $this->Tools()->getService('PenutupanwpTable')->simpanPenutupanWP($data_post, $session);

        return $this->redirect()->toRoute("penutupanwp");
    }

    public function simpanaktifasiwpAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $data_post = $req->getPost();
        $this->Tools()->getService('PenutupanwpTable')->simpanAktifasiWP($data_post, $session);

        return $this->redirect()->toRoute("penutupanwp");
    }

    public function simpantutupopAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $data_post = $req->getPost();
        $this->Tools()->getService('PenutupanwpTable')->simpanTutupOP($data_post, $session);

        return $this->redirect()->toRoute("penutupanwp");
    }

    public function simpanaktifasiopAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $data_post = $req->getPost();
        $this->Tools()->getService('PenutupanwpTable')->simpanAktifasiOP($data_post, $session);

        return $this->redirect()->toRoute("penutupanwp");
    }
}
