<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;

class SettingMinerba extends AbstractActionController {

    public function indexAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();

        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $form = new \Pajak\Form\Setting\MinerbaFrm();
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        // var_dump($dataobjek); exit();
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
        // var_dump($data);exit();
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new \Pajak\Model\Setting\MinerbaBase();
        // $base = new \Pajak\Model\Setting\ReklameBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('MinerbaTable')->getGridCount($base, $post);
        // var_dump($count);exit();
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
        $data = $this->Tools()->getService('MinerbaTable')->getGridData($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td>" . $row['s_namajenisminerba'] . "</td>";
            $s .= "<td>" . $row['s_namakorek'] . "</td>";
               if ( $row['s_idzona']=='1'|| $row['s_idzona']=="1") {
               $kawasan='Sedang';
            }elseif (  $row['s_idzona']=='2'|| $row['s_idzona']=="2") {
                $kawasan='Sulit';
            }else{
                $kawasan='Sangat Sulit';
            }  
            $s .= "<td><center>" .$kawasan . "</center></td>";
            // if ($row['s_masa']=='1'|| $row['s_masa']=="1") {
            //    $masa='Harian';
            // }elseif ( $row['s_masa']=='2'|| $row['s_masa']=="2") {
            //     $masa='Mingguan';
            // }elseif ( $row['s_masa']=='3'|| $row['s_masa']=="3") {
            //     $masa='Bulanan';
            // }elseif ( $row['s_masa']=='4'|| $row['s_masa']=="4") {
            //     $masa='Tahunan';
            // }else{
            //     $masa='';
            // }
            // $s .= "<td><center>" . $masa . "</center></td>";
            $s .= "<td style='text-align:right;'>" . number_format($row['s_harga'], 0, ',', '.') . "</td>";
            $s .= "<td><center>" .$row['s_keterangan'] . "</center></td>";
            $s .= "<td><center><a href='setting_minerba/edit?s_idminerba=$row[s_idjenisminerba]' class='btn btn-warning btn-xs btn-flat'><i class='glyphicon glyphicon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_idjenisminerba'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyphicon glyphicon-trash'></i> Hapus</a></center></td>";
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
        $frm = new \Pajak\Form\Setting\MinerbaFrm($this->populateComboRekening(), $this->comboLokasi());
        $req = $this->getRequest();
        if ($req->isPost()) {
            $kb = new \Pajak\Model\Setting\MinerbaBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
               // var_dump($kb);exit()
               $this->Tools()->getService('MinerbaTable')->savedata($kb, $session);
              // $this->Tools()->getService('ReklameTable')->savedatatarifsupiori($kb, $session);
                return $this->redirect()->toRoute('setting_minerba');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array(
            "frm" => $frm
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

    public function editAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        // $frm = new \Pajak\Form\Setting\ReklameFrm($this->populateComboRekening());
        $frm = new \Pajak\Form\Setting\MinerbaFrm($this->populateComboRekening(), $this->comboLokasi());
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idminerba');
            $data = $this->Tools()->getService('MinerbaTable')->getDataId($id);
            // var_dump($data);exit();
            $data->s_idjenis = $data->s_idjenisminerba;
            $data->s_nama = $data->s_namajenisminerba;
            $data->s_idkorek = $data->s_idkorek;
            $data->s_kodekawasan = $data->s_idzona;
            $data->s_tarif = number_format($data->s_harga, 0, ',', '.');
            $data->s_ket = $data->s_keterangan;
            $frm->bind($data);
        }
        // var_dump($data->s_idjenis);exit();
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
        $a = $this->layout()->setVariables($data);
        // var_dump($a);exit();
        
        return $view;
    }

    public function hapusAction() {
        $this->Tools()->getService('MinerbaTable')->hapusData($this->params('page'));
        return $this->getResponse();
    }

    public function populateComboRekening() {
        $data = $this->Tools()->getService('RekeningTable')->comboBoxRekeningMinerba();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['s_idkorek']] = $row['s_namakorek'];
        }
        return $selectData;
    }

    public function comboLokasi() {
         // $data= $this->Tools()->getService('MinerbaTable')->comboKawasan();
         $data= $this->Tools()->getService('MinerbaTable')->comboLokasi();
        // var_dump($data);exit();
        return $data;
    }
    
    // public function cetakdaftarkecamatanAction() {
    //     /** Cetak Reklame
    //      * @author Miftahul Huda <miftahul06@gmail.com>
    //      * @date 04/11/2016
    //      */
    //     $req = $this->getRequest();
    //     $data_get = $req->getQuery();
    //     $datakecamatan = $this->Tools()->getService('ReklameTable')->getdaftarkecamatan();
    //     $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
    //     $pdf = new \LosPdf\View\Model\PdfModel();
    //     $pdf->setVariables(array(
    //         'datakecamatan' => $datakecamatan,
    //         'ar_pemda' => $ar_pemda
    //     ));
    //     $pdf->setOption("paperSize", "potrait");
    //     return $pdf;
    // }

}
