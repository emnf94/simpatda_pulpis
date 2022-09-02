<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;

class SettingReklameSelebaran extends AbstractActionController {

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
        $count = $this->Tools()->getService('ReklameTable')->getGridSelebaranCount($base);
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
        $data = $this->Tools()->getService('ReklameTable')->getGridSelebaranData($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        $ukuran = ['', 'Sampai dengan 0,25 m<sup>2</sup>', '0,26 m<sup>2</sup> s/d 0,50 m<sup>2</sup>', 'Lebih dari 0,51 m<sup>2</sup>'];
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td>" . $ukuran[$row['s_idselebaran']] . "</td>";
            $s .= "<td><center>" . number_format($row['s_nsrselebaran'], 0, ',', '.') . "</center></td>";
            $s .= "<td><center><a href='setting_reklame_selebaran/edit?s_idselebaran=$row[s_idselebaran]' class='btn btn-warning btn-xs btn-flat'><i class='glyphicon glyphicon-pencil'></i> Edit</a> </center></td>";
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
        $frm = new \Pajak\Form\Setting\ReklameSelebaranFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idselebaran');
            $data = $this->Tools()->getService('ReklameTable')->getDataSelebaranId($id);
            $frm->get('s_idselebaran')->setValue($data['s_idselebaran']);
            $frm->get('s_ukuran')->setValue($data['s_idselebaran']);
            $frm->get('s_nsrselebaran')->setValue($data['s_nsrselebaran']);
        }
        if ($req->isPost()) {
            $this->Tools()->getService('ReklameTable')->savedataselebaran($req->getPost());
            return $this->redirect()->toRoute('setting_reklame_selebaran');
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm,
            'idselebaran' => $req->getQuery()->get('s_idselebaran'),
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
