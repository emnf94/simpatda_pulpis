<?php

namespace Pajak\Controller\Setting;

use Zend\View\Model\ViewModel;
use Pajak\Form\Setting\BackgroundFrm;
use Pajak\Model\CustomLayout\CustomLayoutBase;


class LayoutBackground extends \Zend\Mvc\Controller\AbstractActionController {

    protected $table_pemda;
    
    public function cekurl()
     {
        $basePath = $this->getRequest()->getBasePath();
            $uri = new \Zend\Uri\Uri($this->getRequest()->getUri());
            $uri->setPath($basePath);
            $uri->setQuery(array());
            $uri->setFragment('');
            
        return $uri->getScheme() . '://' . $uri->getHost() . '' . $uri->getPath(); //:'.$_SERVER['SERVER_PORT'].'
    
     }
     
    
     
     public function indexAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        
        $view = new ViewModel(array(null));
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $datane = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak,
            'settingbackround' => 1
        );
        $this->layout()->setVariables($datane);
        return $view;
    }
     
     public function dataGridAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $s_iduser = $session['s_iduser']; 
        
        
        $sTable = 'fr_background';
        $count = 'id_bg';
        
        $input = $this->getRequest();
        $order_default = " id_bg DESC";
        $aColumns = array('id_bg','id_bg', 'file_bg', 's_iduser','status_bg');
        
        $panggildata = $this->getServiceLocator()->get("CustomLayoutTable");
        $rResult = $panggildata->semuadataackground($sTable, $count, $input, $order_default, $aColumns, $session, $this->cekurl());    
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($rResult));
    }
    
    public function tambahAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $frm = new \Pajak\Form\Setting\BackgroundFrm();
        $req = $this->getRequest();
        $datapost = $req->getPost();
        $newFile = "";
        if ($req->isPost()) {
            $base = new CustomLayoutBase();
            $post = array_merge_recursive($req->getPost()->toArray(), $req->getFiles()->toArray());
            $frm->setData($post);
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $httpadapter = new \Zend\File\Transfer\Adapter\Http();
                $httpadapter->setDestination('public/upload/file_bg/');
                if ($httpadapter->receive($post["t_file_bg"]["name"])) {
                    $newFile = $httpadapter->getFileName();
                }
                
                $this->Tools()->getService('CustomLayoutTable')->savedata($newFile, $session, $datapost);
                return $this->redirect()->toRoute('background');
            }
        }
        $view = new ViewModel(array("frm" => $frm));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak,
            'settingbackround' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    public function editAction() {
        $session = $this->getServiceLocator()->get('PajakServiceBanyumas')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $frm = new \Pajak\Form\Setting\BackgroundFrm();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('id_bg');
            $data = $this->Tools()->getService('CustomLayoutTable')->getDataId($id);
            
            $frm->bind($data);
        }
        $view = new ViewModel(array(
            'frm' => $frm,
            'data' => $data
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
            'settingbackround' => 1
        );
        $this->layout()->setVariables($data);
        return $view;
    }
    
    public function hapusAction() {
        $this->Tools()->getService('CustomLayoutTable')->hapusData($this->params('page'));
        return $this->getResponse();
    }
    
    

    

}
