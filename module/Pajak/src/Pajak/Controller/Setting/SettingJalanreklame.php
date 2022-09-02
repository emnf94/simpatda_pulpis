<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class SettingJalanreklame extends AbstractActionController {
    public function cekurl()
     {
        $basePath = $this->getRequest()->getBasePath();
            $uri = new \Zend\Uri\Uri($this->getRequest()->getUri());
            $uri->setPath($basePath);
            $uri->setQuery(array());
            $uri->setFragment('');
            
        return $uri->getScheme() . '://' . $uri->getHost() . ':'.$_SERVER['SERVER_PORT'].'' . $uri->getPath();
    
     }
     
    public function indexAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        
        $view = new ViewModel(array());
        
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'settingjalanreklameaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    public function settingzonaAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        
        $view = new ViewModel(array());
        
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            
            'settingzonaaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    public function dataGridzonaAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        
        $input = $this->getRequest();
        $aColumns = array('id_zona_reklame','nama_zona_reklame','nilai_zona_reklame','tglawal_zona','tglakhir_zona','id_zona_reklame');
        
        $rResult = $this->Tools()->getService('JalanreklameTable')->datagrid_zona($input, $aColumns, $session, $this->cekurl(), $allParams);    
        
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($rResult));
    }
    
    public function tambahzonaAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        
        $req = $this->getRequest();

        if ($req->isPost()) {
            
                $this->Tools()->getService('JalanreklameTable')->savedatazona($req->getPost(), $session);
                //return $this->redirect()->toRoute('setting_jalanreklame').'/settingzona';
                return $this->redirect()->toRoute("setting_jalanreklame", array(
                                "controllers" => "SettingJalanreklame",
                                "action" => "settingzona"
                                
                    ));
        }
        $view = new ViewModel(array());
        
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'settingzonaaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    public function editzonaAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $data_kecamatan = $this->populateComboKecamatan();
        
        $req = $this->getRequest();
        
        
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('id_zona_reklame');
            $data = $this->Tools()->getService('JalanreklameTable')->getDataIdzona($id);
            //var_dump($data); exit();
            
        }
        
        
        $view = new ViewModel(array(
            'data' => $data
        ));
        
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'settingzonaaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    public function dataGridAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        
        $input = $this->getRequest();
        $aColumns = array('id_jlnreklame','kd_jlnreklame','nama_jlnreklame','byms_reklame_zona.nama_zona_reklame','s_kecamatan.s_namakec','s_kelurahan.s_namakel');
        
        $rResult = $this->Tools()->getService('JalanreklameTable')->semuadata_jalanreklame($input, $aColumns, $session, $this->cekurl(), $allParams);    
        
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($rResult));
    }

    
    public function tambahAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $frm = new \Pajak\Form\Setting\JalanreklameFrm($this->populateComboKecamatan(), null, $this->populateComboZona());
        $req = $this->getRequest();

        if ($req->isPost()) {
            //$kb = new \Pajak\Model\Setting\JalanreklameBase();
            //$frm->setInputFilter($kb->getInputFilter());
            //$frm->setData($req->getPost());
            //if ($frm->isValid()) {
            //    $kb->exchangeArray($frm->getData());
                //var_dump($kb); exit();
                $this->Tools()->getService('JalanreklameTable')->savedata($req->getPost(), $session);
                return $this->redirect()->toRoute('setting_jalanreklame');
            //}
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
            'dataobjek' => $recordspajak,
            'settingjalanreklameaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function editAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $data_kecamatan = $this->populateComboKecamatan();
        
        $req = $this->getRequest();
        
        
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('id_jlnreklame');
            $data = $this->Tools()->getService('JalanreklameTable')->getDataId($id);
            
            $frm = new \Pajak\Form\Setting\JalanreklameFrm($data_kecamatan, $this->populateComboKelurahan($data->s_idkec), $this->populateComboZona());
            
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
            'dataobjek' => $recordspajak,
            'settingjalanreklameaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function hapusAction() {
        $this->Tools()->getService('JalanreklameTable')->hapusData($this->params('page'));
        return $this->getResponse();
    }
    
    public function hapuszonaAction() {
        $this->Tools()->getService('JalanreklameTable')->hapusDatazona($this->params('page'));
        return $this->getResponse();
    }

    public function cetakdaftarjalanAction() {
        $datajalanreklame = $this->Tools()->getService('JalanreklameTable')->getdaftarjalanreklame();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        
         $view = new \Zend\View\Model\ViewModel(array(
            'datajalanreklame' => $datajalanreklame,
            'ar_pemda' => $ar_pemda
        ));
        $data = array(
            'nilai' => '3' //no layout
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    public function populateComboZona() {
        $data = $this->Tools()->getService('JalanreklameTable')->semuadata_zona();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['id_zona_reklame']] = $row['nama_zona_reklame'];
        }
        return $selectData;
    }

    public function populateComboKecamatan() {
        $data = $this->Tools()->getService('KecamatanTable')->comboBox();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row->s_idkec] = $row->s_kodekec . " || " . $row->s_namakec;
        }
        return $selectData;
    }
    
    public function populateComboKelurahan($idkec) {
        $data = $this->Tools()->getService('JalanreklameTable')->semuadata_kelurahankec($idkec);
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['s_idkel']] = $row['s_kodekel'] . " || " . $row['s_namakel'];
        }
        return $selectData;
    }

    private function getIdKecamatan($kd) {
        return $this->Tools()->getService('KecamatanTable')->getIdKecamatan($kd);
    }

}
