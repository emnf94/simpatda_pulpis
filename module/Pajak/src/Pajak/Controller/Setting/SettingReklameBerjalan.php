<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;

class SettingReklameBerjalan extends AbstractActionController {

    public function indexAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $form = new \Pajak\Form\Setting\ReklameFrm();
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

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Setting\ReklameBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('ReklameTable')->getGridBerjalanCount($base);
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
        $data = $this->Tools()->getService('ReklameTable')->getGridBerjalanData($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        $jeniskendaraan = ['Kendaraan Tidak Bermotor', 'Kendaraan Bermotor'];
        $masareklame = ['Harian', 'Mingguan', 'Bulanan', 'Triwulanan', 'Semesteran', 'Tahunan'];
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td>" . $jeniskendaraan[$row['s_jeniskendaraan']] . "</td>";
            $s .= "<td>" . $masareklame[$row['s_masareklame']] . "</td>";
            $s .= "<td class='text-right'>" . number_format($row['s_nsrberjalan'], 0, ',', '.') . "</td>";
            $s .= "<td><center><a href='setting_reklame_berjalan/edit?s_idberjalan=$row[s_idberjalan]' class='btn btn-warning btn-xs btn-flat'><i class='glyphicon glyphicon-pencil'></i> Edit</a> </center></td>";
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

    public function editAction() {
        $frm = new \Pajak\Form\Setting\ReklameBerjalanFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idberjalan');
            $data = $this->Tools()->getService('ReklameTable')->getDataBerjalanId($id);
            $frm->get('s_idberjalan')->setValue($data['s_idberjalan']);
            $frm->get('s_jeniskendaraan')->setValue($data['s_jeniskendaraan']);
            $frm->get('s_masareklame')->setValue($data['s_masareklame']);
            $frm->get('s_nsrberjalan')->setValue($data['s_nsrberjalan']);
        }
        if ($req->isPost()) {
            $this->Tools()->getService('ReklameTable')->savedataberjalan($req->getPost());
            return $this->redirect()->toRoute('setting_reklame_berjalan');
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm,
            'idberjalan' => $req->getQuery()->get('s_idberjalan'),
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
