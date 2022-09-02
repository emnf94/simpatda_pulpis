<?php

namespace Pajak\Controller\Setoranlain;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Setoranlain\SetoranlainFrm;
use Pajak\Model\Setoranlain\SetoranlainBase;

class Setoranlain extends AbstractActionController {

    public function cekurl()
     {
        $basePath = $this->getRequest()->getBasePath();
            $uri = new \Zend\Uri\Uri($this->getRequest()->getUri());
            $uri->setPath($basePath);
            $uri->setQuery(array());
            $uri->setFragment('');
            
        //return $uri->getScheme() . '://' . $uri->getHost() . ':'.$_SERVER['SERVER_PORT'].'' . $uri->getPath();
		return $uri->getScheme() . '://' . $uri->getHost() . $uri->getPath();
    
     }
    
    public function indexAction() {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        //$form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_ttd0 as $ar_ttd0) {
            $recordspejabat[] = $ar_ttd0;
        }
        
        $view = new ViewModel(array(
            
            'ar_ttd0' => $recordspejabat,
            
        ));
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            
            'setoranlainaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    public function dataGridSetoranlainAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        
        $input = $this->getRequest();
        $aColumns = array('t_setoran_lain.s_idsetoranlain','t_setoran_lain.nokohir_sl','s_namadinas','t_setoran_lain.tgl_setoranlain','t_setoran_lain.t_viapembayaran','total_setoran');
        
        $rResult = $this->Tools()->getService('SetoranlainTable')->semuadata_setoranlain($input, $aColumns, $session, $this->cekurl(), $allParams);    
        
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($rResult));
    }
    
    
    public function dataGridPilihdinasAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        
        $input = $this->getRequest();
        $aColumns = array('s_dinas.s_iddinas','s_dinas.s_namadinas','s_dinas.jalan_dinas','s_kecamatan.s_namakec','s_kelurahan.s_namakel');
        
        $rResult = $this->Tools()->getService('SetoranlainTable')->semuadata_dinas($input, $aColumns, $session, $this->cekurl(), $allParams);    
        
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($rResult));
    }
    
    public function pilihDinasAction() {
        
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
                $data_get = $req->getPost();
                //var_dump($data_get['s_idskpd']); exit();
                $data = $this->Tools()->getService('SetoranlainTable')->cekdatadinas($data_get['s_iddinas']);
                
                //$data2 = new \Zend\Stdlib\ArrayObject;  
                $data2['s_iddinas'] = $data['s_iddinas'];
                $data2['s_namadinas'] = $data['s_namadinas'];
                $data2['jalan_dinas'] = $data['jalan_dinas'];
                $data2['s_idkec'] = $data['s_idkec'];
                $data2['s_idkel'] = $data['s_idkel'];
                $data2['s_kodedinas'] = $data['s_kodedinas'];
                
                $res->setContent(\Zend\Json\Json::encode($data2));
            
        }
        return $res;
    }
    
    public function tambahAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        
        $frm = new \Pajak\Form\Setoranlain\SetoranlainFrm();
        $req = $this->getRequest();

        if ($req->isPost()) {
            $kb = new \Pajak\Model\Setoranlain\SetoranlainBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $data = $this->Tools()->getService('SetoranlainTable')->savedata($kb, $session);
                //return $this->redirect()->toRoute('setoranlain');
                return $this->redirect()->toRoute("setoranlain", array(
                            "controllers" => "Setoranlain",
                            "action" => "tambahdetail",
                            "page" => $data
                )); 
            }
        }
        $view = new ViewModel(array("frm" => $frm));
       
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            
            'setoranlainaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    public function tambahdetailAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $this->params("page");
            
            $data = $this->Tools()->getService('SetoranlainTable')->cekdatasetoranlain($id);
            
            
            $form = new \Pajak\Form\Setoranlain\SetoranlaindetailFrm();
            //$form->bind($data);
        }
        if ($req->isPost()) {
            
            
            $data_get = $req->getPost();
            
                $id = $data_get->s_idsetoranlain;
                $data = $this->Tools()->getService('SetoranlainTable')->cekdatasetoranlain($id);
               
                $returnval = $this->Tools()->getService('SetoranlainTable')->savedatadetailsetoranlain($session, $data_get);
                if ($returnval['result'] == 1) {
                    $this->flashMessenger()->addMessage('Data Telah Tersimpan');
                }
                return $this->redirect()->toRoute("setoranlain", array(
                            "controllers" => "Setoranlain",
                            "action" => "tambahdetail",
                            "page" => $id
                )); 
            
        }
        $view = new ViewModel(array(
            'form' => $form,
            'data' => $data,
            'datauser' => $session,
            's_idsetoranlain' => $id,
            //'dataobjek' => $dataobjek
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            
            'setoranlainaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    
    public function dataGridSetoranlaindetailAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();

        $input = $this->getRequest();
        $aColumns = array('s_idkorek', 'nama_penyetor', 'koderek', 's_namakorek','jml_setorandetail');

        $rResult = $this->Tools()->getService('SetoranlainTable')->semuadata_setoranlaindetail($input, $aColumns, $session, $this->cekurl(), $allParams);

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($rResult));
    }
    
    public function dataGridPilihrekeningAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();

        $input = $this->getRequest();
        $aColumns = array('s_idkorek', 'koderek', 's_namakorek');

        $rResult = $this->Tools()->getService('SetoranlainTable')->semuadata_rekeningpajak($input, $aColumns, $session, $this->cekurl(), $allParams);

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($rResult));
    }
    
    public function pilihRekeningPajakAction() {
        
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
                $data_get = $req->getPost();
                //var_dump($data_get['s_idskpd']); exit();
                $data = $this->Tools()->getService('SetoranlainTable')->cekdatarekening($data_get['s_idkorek']);
                
                //$data2 = new \Zend\Stdlib\ArrayObject;  
                $data2['s_idkorek'] = $data['s_idkorek'];
                $data2['koderek'] = $data['s_tipekorek'].".".$data['s_kelompokkorek'].".".$data['s_jeniskorek'].".".$data['s_objekkorek'].".".$data['s_rinciankorek'].".".$data['s_sub1korek'].".".$data['s_sub2korek'].".".$data['s_sub3korek']."";
                $data2['s_namakorek'] = $data['s_namakorek'];
                
                $res->setContent(\Zend\Json\Json::encode($data2));
                
            
        }
        return $res;
    }
    
    public function editAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $form = new \Pajak\Form\Setoranlain\SetoranlainFrm();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        
        $req = $this->getRequest();
        $res = $this->getResponse();
        
                $data_get = $req->getPost();
                //var_dump($data_get['s_idskpd']); exit();
                $data = $this->Tools()->getService('SetoranlainTable')->cekdatasetoranlain($allParams['page']);
                
                $data2 = new \Zend\Stdlib\ArrayObject;  
                $data2['s_idsetoranlain'] = $data['s_idsetoranlain'];
                $data2['tgl_setoranlain'] = $data['tgl_setoranlain'];
                $data2['nokohir_sl'] = $data['nokohir_sl'];
                $data2['s_iddinas'] = $data['s_iddinas'];
                $data2['t_viapembayaran'] = $data['t_viapembayaran'];
                $data2['no_sts'] = $data['no_sts'];
                $data2['s_namadinas'] = $data['s_namadinas'];
                
                $form->bind($data2);
            
        
        $view = new ViewModel(array(
            'frm' => $form,
            'data' => $data,
            'datauser' => $session,
            's_idsetoranlain' => $allParams['page'],
            //'dataobjek' => $dataobjek
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            
            'setoranlainaktif' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    
    public function editsetorandetailpajakAction() {
        
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
                $data_get = $req->getPost();
                //var_dump($data_get['s_idskpd']); exit();
                $data = $this->Tools()->getService('SetoranlainTable')->cekdatasetorandetail($data_get['s_idsldetail']);
                
                //$data2 = new \Zend\Stdlib\ArrayObject;  
                
                $data2['s_idsldetail'] = $data['s_idsldetail'];
                $data2['s_idsetoranlain'] = $data['s_idsetoranlain'];
                $data2['s_idkorek'] = $data['s_idkorek'];
                $data2['jml_setorandetail'] = number_format($data['jml_setorandetail'], 0, ',', '.');
                $data2['s_namakorek'] = $data['s_namakorek'];
                $data2['nama_penyetor'] = $data['nama_penyetor'];
                
                $res->setContent(\Zend\Json\Json::encode($data2));
            
        }
        return $res;
    }
    
    public function hapusSetoranAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        
        $this->Tools()->getService('SetoranlainTable')->hapusSemuasetoran($allParams['page']);
        return $this->getResponse();
    }
    
    public function hapusSetorandetailAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        
        $this->Tools()->getService('SetoranlainTable')->hapusSetorandetail($allParams['page']);
        return $this->getResponse();
    }
    
    
    public function cetakdatasetoranlainAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('SetoranlainTable')->cetakdatasetoranlain($data_get);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        
        $view = new ViewModel(array(
            'data' => $data,
            'tglbayar0' => $data_get->tglbayar0,
            'tglbayar1' => $data_get->tglbayar1,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda,
            'jniscetak' => $data_get->jniscetak
        ));
        $data = array(
            'nilai' => '3' //no layout
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    

}
