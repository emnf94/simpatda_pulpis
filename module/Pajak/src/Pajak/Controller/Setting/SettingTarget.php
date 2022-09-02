<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class SettingTarget extends AbstractActionController
{

    public function indexAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $form = new \Pajak\Form\Setting\TargetFrm();
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
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
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Setting\TargetBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('TargetTable')->getGridCount($base);
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
        $data = $this->Tools()->getService('TargetTable')->getGridData($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . $row['s_tahuntarget'] . "</center></td>";
            $s .= "<td>" . $row['s_namatargetjenis'] . "</td>";
            $s .= "<td>" . $row['s_keterangantarget'] . "</td>";
            $s .= "<td><center>"
                . "<a href='setting_target/cetakdaftartarget?s_idtarget=$row[s_idtarget]' class='btn btn-primary btn-xs' title='Cetak Daftar Target Per Rekening' target='_blink'><i class='glyph-icon icon-print'></i> Cetak Target</a> "
                . "<a href='setting_target/tambahtargetdetail?s_idtarget=$row[s_idtarget]' class='btn btn-success btn-xs' title='Tambah Target Per Rekening'><i class='glyph-icon icon-plus'></i> Target Per Rekening</a>"
                . "<a href='setting_target/edit?s_idtarget=$row[s_idtarget]' class='btn btn-warning btn-xs btn-flat'><i class='glyphicon glyphicon-pencil'></i> Edit</a> "
                . "<a href='#' onclick='hapus(" . $row['s_idtarget'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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

    public function tambahAction()
    {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $frm = new \Pajak\Form\Setting\TargetFrm($this->Tools()->getService('TargetTable')->combojenistarget());
        $req = $this->getRequest();
        if ($req->isPost()) {
            $kb = new \Pajak\Model\Setting\TargetBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $this->Tools()->getService('TargetTable')->savedata($kb, $session);
                return $this->redirect()->toRoute('setting_target');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array("frm" => $frm));
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

    public function editAction()
    {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $frm = new \Pajak\Form\Setting\TargetFrm($this->Tools()->getService('TargetTable')->combojenistarget());
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idtarget');
            $data = $this->Tools()->getService('TargetTable')->getDataId($id);
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm
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

    public function hapusAction()
    {
        $this->Tools()->getService('TargetTable')->hapusData($this->params('page'));
        return $this->getResponse();
    }

    public function hapustargetdetailAction()
    {
        $this->Tools()->getService('TargetdetailTable')->hapusData($this->params('page'));
        return $this->getResponse();
    }


    public function cetakdaftartargetAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('TargetTable')->getTargetId($data_get->s_idtarget);
        $datatarget = $this->Tools()->getService('TargetTable')->getdaftartarget($data_get->s_idtarget);

        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'datatarget' => $datatarget,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function cetakdaftartarget___Action()
    {
        /** Cetak Target
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $datatarget = $this->Tools()->getService('TargetTable')->getdaftartarget();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'datatarget' => $datatarget,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function tambahtargetdetailAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $this->params("page");
            if ($id == 0) {
                $id = (int) $req->getQuery()->get('s_idtarget');
            }
            $data = $this->Tools()->getService('TargetTable')->getTargetId($id);
            $data->s_idtargetheader = $data->s_idtarget;
            $datatargetdetail = $this->Tools()->getService('TargetdetailTable')->temukanTargetdetail($id);
            $form = new \Pajak\Form\Setting\TargetdetailFrm();
            $form->bind($data);
        }
        if ($req->isPost()) {
            $form = new \Pajak\Form\Setting\TargetdetailFrm();
            $kb = new \Pajak\Model\Setting\TargetdetailBase();
            $form->setInputFilter($kb->getInputFilter());
            $form->setData($req->getPost());
            if ($form->isValid()) {
                $kb->exchangeArray($form->getData());
                $this->Tools()->getService('TargetdetailTable')->simpantargetdetail($kb, $session);
                $datatargetdetail = $this->Tools()->getService('TargetdetailTable')->temukanTargetdetail($kb->s_idtargetheader);
                return $this->redirect()->toRoute("setting_target", array(
                    "controllers" => "SettingTarget",
                    "action" => "tambahtargetdetail",
                    "page" => $kb->s_idtargetheader
                ));
            }
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'form' => $form,
            'data' => $data,
            'datatargetdetail' => $datatargetdetail
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

    public function dataGridRekeningAction()
    {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $req->isGet();
        $parametercari = $req->getQuery();
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
        $count = $this->Tools()->getService('RekeningTable')->getGridCountRekeningTarget($base, $parametercari);
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
        $data = $this->Tools()->getService('RekeningTable')->getGridDataRekeningTarget($base, $start, $parametercari);
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td>" . $row['koderek'] . "</td>";
            $s .= "<td>" . $row['s_namakorek'] . "</td>";
            $s .= "<td>" . $row['s_persentarifkorek'] . "</td>";
            $s .= "<td>" . date('d-m-Y', strtotime($row['s_tglawalkorek'])) . " S/D " . date('d-m-Y', strtotime($row['s_tglakhirkorek'])) . "</td>";
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

    public function pilihRekeningAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataRekening = $this->Tools()->getService('RekeningTable')->getDataRekeningId($data_get['s_idkorek']);
        $data = array(
            't_idkorek' => $dataRekening['s_idkorek'],
            't_korek' => $dataRekening['korek'],
            't_namakorek' => $dataRekening['s_namakorek'],
            't_tarifpajak' => $dataRekening['s_persentarifkorek']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function edittargetdetailAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $datadetail = $this->Tools()->getService('TargetdetailTable')->temukanTargetdetailById($data_get['s_idtargetdetail']);
        $data = array(
            's_idtargetdetail' => $datadetail['s_idtargetdetail'],
            's_targetrekening' => $datadetail['s_targetrekening'],
            't_korek' => $datadetail['korek'],
            't_namakorek' => $datadetail['s_namakorek'],
            's_targetjumlah' => number_format($datadetail['s_targetjumlah'], 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function indexopdAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $form = new \Pajak\Form\Setting\TargetFrm();
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }

        $dataopd = $this->Tools()->getService('TargetdetailTable')->getdataOPD();
        $recordsopd = array();
        foreach ($dataopd as $dataopd) {
            $recordsopd[] = $dataopd;
        }
        $view = new ViewModel(array(
            'dataopd' => $recordsopd
        ));

        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        // var_dump($view);exit();
        $this->layout()->setVariables($data);
        return $view;
    }
    public function dataGridTargetOPDAction()
    {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Setting\TargetBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('TargetTable')->getGridCountOPD();
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
        $data = $this->Tools()->getService('TargetTable')->getGridDataOPD();
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . $row['s_tahuntarget'] . "</center></td>";
            $s .= "<td>" . $row['s_namatarget'] . "</td>";
            $s .= "<td>" . $row['s_namasatker'] . "</td>";
            $s .= "<td><center>"

                . "<a href='setting_target/tambahdetailtargetopd?s_idkelompoktarget=$row[s_idkelompoktarget]' class='btn btn-success btn-xs' title='Tambah Target Per Rekening'><i class='glyph-icon icon-plus'></i> Target Per Rekening</a>&nbsp;"
                . "<a onClick='getdatatargetopd($row[s_idkelompoktarget])' class='btn btn-warning btn-xs btn-flat'><i class='glyphicon glyphicon-pencil'></i> Edit</a> "
                . "<a onClick='hapustarget($row[s_idkelompoktarget])' class='btn btn-danger btn-xs btn-flat'><i class='glyphicon glyphicon-trash'></i> Hapus</a> ";
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

    public function tambahtargetopdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('TargetTable')->getdatakelompok($data_get->s_idkelompoktarget);
        $dataopd = $this->Tools()->getService('TargetdetailTable')->getdataOPD();

        $opsi = "";
        $opsi .= "<option value=''>Silahkan Pilih</option>";
        foreach ($dataopd as $r) {
            if ((int) ($r['s_idsatker']) == (int)($data['s_idsatker'])) {
                $selec = 'selected';
            } else {
                $selec = '';
            }

            $opsi .= "<option " . $selec . " value='" . $r['s_idsatker'] . "'>" . $r['s_kodesatker'] . " || " . $r['s_namasatker'] . "</option>";
        }
        // var_dump($opsi);exit();
        $data_render = array(
            'opsi' => $opsi,
            's_idkelompoktarget' => $data['s_idkelompoktarget'],
            's_namatarget' => $data['s_namatarget'],
            's_tahuntarget' => $data['s_tahuntarget'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function simpantargetopdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('TargetTable')->simpantargetopd($data_get);
        // var_dump($data_get->s_idkelompoktarget);exit();
        $data_render = array(
            'status' => 'ok',
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }


    public function tambahdetailtargetopdAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $form = new \Pajak\Form\Setting\TargetFrm();
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
        $req = $this->getRequest();
        $s_idkelompoktarget = (int) $req->getQuery()->get('s_idkelompoktarget');
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $korek = $this->Tools()->getService('RekeningTable')->getdataJenisObjekOPD();
        $recordskorek = array();
        foreach ($korek as $korek) {
            $recordskorek[] = $korek;
        }

        $view = new ViewModel(array(
            'korek' => $recordskorek,
            's_idkelompoktarget' => $s_idkelompoktarget,
        ));

        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        // var_dump($view);exit();
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGriddetailTargetOPDAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('TargetTable')->getGridDatadetailOPD($data_get->s_idkelompoktarget);
        $no = 1;
        foreach ($data as $row) {
            // var_dump($row);exit();
            $s .= "<tr>";
            $s .= "<td><center>" . $no++ . "</center></td>";
            $s .= "<td><center>" . $row['korek'] . "</center></td>";
            $s .= "<td>" . $row['s_namakorek'] . "</td>";
            $s .= "<td>" . number_format($row['s_target'], 0, ",", ".") . "</td>";
            $s .= "<td><center>"

                . "<a onClick='hapusdetail($row[s_idtargetsatker])' class='btn btn-danger btn-xs' title='Tambah Target Per Rekening'><i class='glyph-icon icon-trush'></i> Hapus</a>&nbsp;"
                . "<a onClick='getdatasatker($row[s_idtargetsatker])' class='btn btn-warning btn-xs btn-flat'><i class='glyphicon glyphicon-pencil'></i> Edit</a> ";
            $s .= "</tr>";
        }



        $data_render = array(
            "grid" => $s,
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function simpandetailtargetopdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('TargetTable')->simpandetailtargetopd($data_get);
        // var_dump($data_get->s_idkelompoktarget);exit();
        $data_render = array(
            'status' => 'ok',
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function editdetailtargetopdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        $data = $this->Tools()->getService('TargetTable')->getdatasatker($data_get->s_idtargetsatker);
        $korek = $this->Tools()->getService('RekeningTable')->getdataJenisObjekOPD();

        $opsi = "";
        $opsi .= "<option value=''>Silahkan Pilih</option>";
        foreach ($korek as $r) {
            if ((int) ($r['s_idkorek']) == (int)($data['s_idkorek'])) {
                $selec = 'selected';
            } else {
                $selec = '';
            }

            $opsi .= "<option " . $selec . " value='" . $r['s_idkorek'] . "'>" . $r['korek'] . " || " . $r['s_namakorek'] . "</option>";
        }

        $data_render = array(
            'opsi' => $opsi,
            's_idtargetsatker' => $data['s_idtargetsatker'],
            // 's_idkorek'=>$data['s_idkorek'],
            's_target' => $data['s_target'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function deletedetailtargetopdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('TargetTable')->deletedetailtargetopd($data_get->s_idtargetsatker);
        $data_render = 'ok';
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function deletetargetopdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // var_dump($data_get);exit();
        $data = $this->Tools()->getService('TargetTable')->deletetargetopd($data_get->s_idkelompoktarget);
        $data_render = 'ok';
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }
}
