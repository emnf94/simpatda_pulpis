<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;

class SettingReklameKelompokjalan extends AbstractActionController {

    public function indexAction() {

        $req = $this->getRequest();
        if ($req->isGet()) {
            $data = $this->Tools()->getService('ReklameTable')->getDataKelompokjalanId();
        }
        if ($req->isPost()) {
            $post = $req->getPost();
            $i = 0;
            $model = new \stdClass();
            foreach ($post->s_idkelompokjalan as $col => $row):
                $model->s_idkelompokjalan = $post->s_idkelompokjalan[$i];
                $model->s_hargadasarlokasi = $post->s_hargadasarlokasi[$i];
                $model->s_skorlokasi = $post->s_skorlokasi[$i];
                $this->Tools()->getService('ReklameTable')->savedatakelompokjalan($model);
                $i++;
            endforeach;
            return $this->redirect()->toRoute('setting_reklame_kelompokjalan');
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'data' => $data,
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
