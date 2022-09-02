<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;

class SettingReklameSkorukuran extends AbstractActionController {

    public function indexAction() {

        $req = $this->getRequest();
        if ($req->isGet()) {
            $data = $this->Tools()->getService('ReklameTable')->getDataSkorukuran();
        }
        if ($req->isPost()) {
            $post = $req->getPost();
            $i = 0;
            $model = new \stdClass();
            foreach ($post->s_idskorukuran as $col => $row):
                $model->s_idskorukuran = $post->s_idskorukuran[$i];
                $model->s_skor = $post->s_skor[$i];
                $this->Tools()->getService('ReklameTable')->savedataskorukuran($model);
                $i++;
            endforeach;
            return $this->redirect()->toRoute('setting_reklame_skorukuran');
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
