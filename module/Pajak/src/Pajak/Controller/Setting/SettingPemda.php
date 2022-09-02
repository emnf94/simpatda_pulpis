<?php

namespace Pajak\Controller\Setting;

use Zend\View\Model\ViewModel;
use Pajak\Form\Setting\PemdaFrm;
use Pajak\Model\Setting\PemdaBase;


class SettingPemda extends \Zend\Mvc\Controller\AbstractActionController {

    protected $table_pemda;

    public function indexAction() {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $data = $this->Tools()->getService('PemdaTable')->getdata();
        $frm = new PemdaFrm($data->s_logo);
        if (!empty($data)) {
            $frm->bind($data);
        }
        $view = new ViewModel(array("frm" => $frm));
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $datane = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($datane);
        return $view;
    }

    public function tambahAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $frm = new PemdaFrm();
        $req = $this->getRequest();
        $newFile = "";
        if ($req->isPost()) {
            $base = new PemdaBase();
            $post = array_merge_recursive($req->getPost()->toArray(), $req->getFiles()->toArray());
            $frm->setData($post);
            if ($frm->isValid()) {
                $base->exchangeArray($frm->getData());
                $httpadapter = new \Zend\File\Transfer\Adapter\Http();
                $httpadapter->setDestination('public/upload/');
                if ($httpadapter->receive($post["s_logofile"]["name"])) {
                    $newFile = $httpadapter->getFileName();
                }
                $this->Tools()->getService('PemdaTable')->savedata($base, $newFile, $session);
                return $this->redirect()->toRoute('setting_pemda');
            }
        }
    }

}
