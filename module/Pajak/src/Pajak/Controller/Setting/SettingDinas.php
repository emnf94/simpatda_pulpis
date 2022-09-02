<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class SettingDinas extends AbstractActionController {
    
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
        $form = new \Pajak\Form\Setting\DinasFrm();
        $view = new ViewModel(array('form' => $form));
        
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            
            'settingdinasaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    public function dataGridAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        
        $input = $this->getRequest();
        $aColumns = array('s_dinas.s_iddinas','s_dinas.s_namadinas','s_dinas.jalan_dinas','s_kecamatan.s_namakec','s_kelurahan.s_namakel');
        
        $rResult = $this->Tools()->getService('DinasTable')->semuadata_dinas($input, $aColumns, $session, $this->cekurl(), $allParams);    
        
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($rResult));
    }

    
    public function tambahAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $datakecamatan = $this->Tools()->getService('DinasTable')->getcomboIdKecamatan();
        $frm = new \Pajak\Form\Setting\DinasFrm($datakecamatan);
        $req = $this->getRequest();

        if ($req->isPost()) {
            $kb = new \Pajak\Model\Setting\DinasBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $this->Tools()->getService('DinasTable')->savedata($kb, $session);
                return $this->redirect()->toRoute('setting_dinas');
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
            'dataobjek' => $recordspajak,
            'settingdinasaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function editAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_iddinas');
            $data = $this->Tools()->getService('DinasTable')->getDinasId($id);
            $data2 = new \Zend\Stdlib\ArrayObject;  
            $data2['s_iddinas'] = $data['s_iddinas'];
            $data2['s_kodedinas'] = $data['s_kodedinas'];
            $data2['s_namadinas'] = $data['s_namadinas'];
            $data2['jalan_dinas'] = $data['jalan_dinas'];
            $data2['s_idkec'] = $data['s_idkec'];
            $data2['s_idkel'] = $data['s_idkel'];
            
            $datakecamatan = $this->Tools()->getService('DinasTable')->getcomboIdKecamatan();
            $datakelurahan = $this->comboKelurahanCamat($data['s_idkec']);
            $frm = new \Pajak\Form\Setting\DinasFrm($datakecamatan, $datakelurahan);
            
            
            $frm->bind($data2);
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
            'settingdinasaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    public function comboKelurahanCamat($id_kecamatan) {
        $selectData = array();
        $data = $this->Tools()->getService('DinasTable')->getByKecamatan($id_kecamatan);
        foreach ($data as $row) {
            $selectData[$row['s_idkel']] = str_pad($row['s_kodekel'], 3, "0", STR_PAD_LEFT) . " || " . $row['s_namakel'];
        }
        return $selectData;
    }
    
    public function comboKelurahanCamatAction() {
        
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            
            $data_get = $req->getPost();
            
                
                $cekid_kecamatan = $this->Tools()->getService('DinasTable')->cekid_kecamatan($data_get->s_idkec);
                $s = "";
                if ($cekid_kecamatan['s_kodekec'] == '00') {
                    if(!empty($req->getPost('t_kecamatan_badan'))){
                        $s .= " <div class='col-sm-12'>
                                <label class='col-sm-2 '>Kecamatan</label>
                                <div class='col-md-4'>
                                    <input type='text' class='form-control' name='t_kecamatanluar_badan' id='t_kecamatanluar_badan'>
                                </div>
                                <label class='col-sm-1'>Kelurahan</label>
                                <div class='col-md-4'>
                                    <input type='text' class='form-control' name='t_kelurahanluar_badan' id='t_kelurahanluar_badan'>
                                </div>
                            </div>";
                    }else{
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
                }
                $data = $this->Tools()->getService('DinasTable')->getByKecamatan($data_get->s_idkec);
                $opsi = "";
                $opsi .= "<option value=''>Silahkan Pilih</option>";
                foreach ($data as $r) {
                    $opsi .= "<option value='" . $r['s_idkel'] . "'>" . str_pad($r['s_kodekel'], 3, "0", STR_PAD_LEFT) . " || " . $r['s_namakel'] . "</option>";
                }
//                $res->setContent($opsi);
            
        }
        $data_render = array(
            'res' => $opsi,
            'keckelluar' => $s,
            'keckelluar_badan' => $s
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }


    public function hapusAction() {
        $this->Tools()->getService('DinasTable')->hapusData($this->params('page'));
        return $this->getResponse();
    }

    public function cetakdaftardinasAction() {
        $datadinas = $this->Tools()->getService('DinasTable')->getdaftardinas();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'datadinas' => $datadinas,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }
}
