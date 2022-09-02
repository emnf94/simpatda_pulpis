<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class AclManager extends AbstractActionController {

    public $tbl_pemda;

    public function indexAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $view = new ViewModel(array(
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

    public function tambahAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->getPemda()->getdata();
        $resources = array_flip($this->Tools()->getResources());
        $frm = new \Pajak\Form\Setting\AclManagerFrm($resources);
        if ($this->getRequest()->isPost()) {
            $post = $this->getRequest()->getPost();
            $ar_permissions = array();
            foreach ($post->permission_name as $k => $v) {
                $tv = (int) ($v);
                if ($tv == 0) {
                    /**
                     * Insert ke table resource
                     */
                    $r = $this->Tools()->getService('AclResourceTable')->checkResources($resources[$post->cmbResources]);

                    if (!is_array($r)) {
                        $saved_resource = $this->Tools()->getService('AclResourceTable')->save($resources[$post->cmbResources]);
                    } else if (is_array($r)) {
                        $saved_resource['id'] = $r['id'];
                    }
                    /**
                     * Insert ke tabel permission
                     */
                    $pc = $this->Tools()->getService('AclResourceTable')->getDatas($resources[$post->cmbResources], $post->permission_name[$k], 'count');
                    if ($pc == 0) {
                        $data_permissions['resource_id'] = $saved_resource['id'];
                        $data_permissions['permission_name'] = $post->permission_name[$k];
                        $data_permissions['alias'] = $post->alias[$k];
                        $this->Tools()->getService('AclPermissionTable')->save($data_permissions);
                    }
                }
            }
        }
        $view = new ViewModel(array(
            "frm" => $frm,
            "resources" => $resources
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

    public function loadPermissionsAction() {
        $return = null;
        if ($this->getRequest()->isPost()) {
            $post = $this->getRequest()->getPost();
            if ($post->res) {
                $class = '\\' . $post->res;
                $resName = $post->resName;

                $permissionsClass = $this->Tools()->getPermissions(new $class());

                $html = '';
                $html .= '<div class="form-group">';
                foreach ($permissionsClass as $k => $v) {
                    $c = $this->Tools()->getService('AclResourceTable')->getDatas($resName, $v, 'count');
                    if ($c > 0) {
                        $checked = 'checked="checked"';
                        $permissionDb = $this->Tools()->getService('AclResourceTable')->getDatas($resName, $v, 'array');
                        $text = $permissionDb['permission_name'];
                        $value = $permissionDb['id'];
                        $inputValue = $permissionDb['alias'];
                    } else {
                        $checked = '';
                        $text = $v;
                        $value = $v;
                        $inputValue = '';
                    }
                    $html .= '<div class="col-sm-12">';
                    $html .= '<div class="col-sm-3">';
                    $html .= '<div class="checkbox">';
                    $html .= '<label><input type="checkbox" name="permission_name[]" ' . $checked . ' value="' . $value . '" />' . $text . '</label>';
                    $html .= '</div>';
                    $html .= '</div>';
                    $html .= '<div class="col-sm-4">';
                    $html .= '<input class="form-control" type="text" name="alias[]" value="' . $inputValue . '" placeholder="alias"/>';
                    $html .= '</div>';
                    $html .= '</div>';
                }
                $html .= '</div>';
            } else {
                $html = '<span><br/></span>';
            }
            $return = $html;
        }
        return $this->getResponse()->setContent($return);
    }

    public function getPemda() {
        if (!$this->tbl_pemda) {
            $sm = $this->getServiceLocator();
            $this->tbl_pemda = $sm->get("PemdaTable");
        }
        return $this->tbl_pemda;
    }

}
