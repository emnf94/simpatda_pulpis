<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class SettingKelurahan extends AbstractActionController {

    public function indexAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $form = new \Pajak\Form\Setting\KelurahanFrm();
        $view = new ViewModel(array('form' => $form));
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

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Setting\KelurahanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('KelurahanTable')->getGridCount($base);
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
        $data = $this->Tools()->getService('KelurahanTable')->getGridData($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . str_pad($row['s_kodekel'], 2, "0", STR_PAD_LEFT) . "</center></td>";
            $s .= "<td>" . $row['s_namakel'] . "</td>";
            $s .= "<td><center>" . str_pad($row['s_kodekec'], 2, "0", STR_PAD_LEFT) . "</center></td>";
            $s .= "<td>" . $row['s_namakec'] . "</td>";
            $s .= "<td><center><a href='setting_kelurahan/edit?s_idkel=$row[s_idkel]' class='btn btn-warning btn-xs btn-flat'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_idkel'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $frm = new \Pajak\Form\Setting\KelurahanFrm($this->populateComboKecamatan());
        $req = $this->getRequest();

        if ($req->isPost()) {
            $kb = new \Pajak\Model\Setting\KelurahanBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $this->Tools()->getService('KelurahanTable')->savedata($kb, $session);
                return $this->redirect()->toRoute('setting_kelurahan');
            }
        }
        $view = new ViewModel(array("frm" => $frm));
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

    public function editAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $frm = new \Pajak\Form\Setting\KelurahanFrm($this->populateComboKecamatan());
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idkel');
            $data = $this->Tools()->getService('KelurahanTable')->getDataId($id);
            $frm->bind($data);
        }
        $view = new ViewModel(array(
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

    public function hapusAction() {
        $this->Tools()->getService('KelurahanTable')->hapusData($this->params('page'));
        return $this->getResponse();
    }

    public function cetakdaftarkelurahanAction() {
        /** Cetak Kelurahan
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $datakelurahan = $this->Tools()->getService('KelurahanTable')->getdaftarkelurahan();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'datakelurahan' => $datakelurahan,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function populateComboKecamatan() {
        $data = $this->Tools()->getService('KecamatanTable')->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idkec] = str_pad($row->s_kodekec, 2, 0, STR_PAD_LEFT) . " || " . $row->s_namakec;
        }
        return $selectData;
    }

    private function getIdKecamatan($kd) {
        return $this->Tools()->getService('KecamatanTable')->getIdKecamatan($kd);
    }

}
