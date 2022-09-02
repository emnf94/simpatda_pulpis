<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;

class SettingReklameSudutpandang extends AbstractActionController {

    public function indexAction() {

        $req = $this->getRequest();
        if ($req->isGet()) {
            $data = $this->Tools()->getService('ReklameTable')->getDataSudutpandang();
        }
        if ($req->isPost()) {
            $post = $req->getPost();
            $i = 0;
            $model = new \stdClass();
            foreach ($post->s_idsudutpandang as $col => $row):
                $model->s_idsudutpandang = $post->s_idsudutpandang[$i];
                $model->s_skorsudutpandang = $post->s_skorsudutpandang[$i];
                $this->Tools()->getService('ReklameTable')->savedatasudutpandang($model);
                $i++;
            endforeach;
            return $this->redirect()->toRoute('setting_reklame_sudutpandang');
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
