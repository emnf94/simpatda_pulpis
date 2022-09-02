<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;

class SettingRekening extends AbstractActionController {

    public function indexAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $form = new \Pajak\Form\Setting\RekeningFrm();
        $view = new \Zend\View\Model\ViewModel(array(
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

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Setting\RekeningBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('RekeningTable')->getGridCount($base);
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
        $data = $this->Tools()->getService('RekeningTable')->getGridData($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='Nama Jenis' style='text-align: center;'>" . $row['s_namajenis'] . "</td>";
            $s .= "<td data-title='Kode Rekening'>" . $row['korek'] . "</td>";
            $s .= "<td data-title='Nama Rekening'>" . $row['s_namakorek'] . "</td>";
            $s .= "<td data-title='Presentase (%)' style='text-align: center;'>" . $row['s_persentarifkorek'] . "</td>";
            $s .= "<td data-title='Tgl. Awal Berlaku' style='text-align: center;'>" . date('d-m-Y', strtotime($row['s_tglawalkorek'])) . "</td>";
            $s .= "<td data-title='Tgl. Akhir Berlaku' style='text-align: center;'>" . date('d-m-Y', strtotime($row['s_tglakhirkorek'])) . "</td>";
            $s .= "<td data-title='#'><center><a href='setting_rekening/edit?s_idkorek=$row[s_idkorek]' class='btn btn-warning btn-xs btn-flat'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_idkorek'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $frm = new \Pajak\Form\Setting\RekeningFrm($this->Tools()->getService('ObjekTable')->getcomboIdJenisRek());
        $req = $this->getRequest();
        if ($req->isPost()) {
            $kb = new \Pajak\Model\Setting\RekeningBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $this->Tools()->getService('RekeningTable')->savedata($kb, $session);
                return $this->redirect()->toRoute('setting_rekening');
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

    public function editAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $frm = new \Pajak\Form\Setting\RekeningFrm($this->Tools()->getService('ObjekTable')->getcomboIdJenisRek());
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idkorek');
            $data = $this->Tools()->getService('RekeningTable')->getRekeningId($id);
            $data->s_tglawalkorek = date('d-m-Y', strtotime($data->s_tglawalkorek));
            $data->s_tglakhirkorek = date('d-m-Y', strtotime($data->s_tglakhirkorek));
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

    public function hapusAction() {
        $this->Tools()->getService('RekeningTable')->hapusData($this->params('page'));
        return $this->getResponse();
    }

    public function cetakdaftarrekeningAction() {
        /** Cetak Tampat Usaha
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        // var_dump('aaa');exit();
        $req = $this->getRequest();
       $data_get = $req->getQuery();
        if ((int)$data_get->rekening==1) {
            $rekening ='<=500';
        }else{
         $rekening = '>500';    
        }

        // var_dump($data_get);exit();
        
        $datarekening = $this->Tools()->getService('RekeningTable')->getdaftarrekening($rekening);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $recordspajak = array();
        foreach ($datarekening as $key) {
            $recordspajak[]= $key;
        }
        // var_dump($recordspajak);exit();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'datarekening' => $recordspajak,
            'ar_pemda' => $ar_pemda
        ));
       
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

}
