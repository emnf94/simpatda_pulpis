<?php

namespace Pajak\Controller;

use Zend\View\Model\ViewModel;
use Pajak\Form\LoginAccessFrm;

class LoginAccess extends \Zend\Mvc\Controller\AbstractActionController {
    
    public function indexAction() {
        /** index login 
         * sebagai halaman awal login
         * @param string $s_username
         * @param string $s_password
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 03/11/2016
         */
        $form = new LoginAccessFrm();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $view = new ViewModel(array(
            "form" => $form,
            'data_pemda' => $ar_pemda
        ));
        if ($this->getRequest()->isPost()) {
            $form->setData($this->getRequest()->getPost());
            if ($form->isValid()) {
                $this->getServiceLocator()->get('PajakService')
                        ->getAdapter()
                        ->setIdentity($this->getRequest()->getPost('s_username'))
                        ->setCredential($this->getRequest()->getPost('s_password'));
                if (empty($this->getRequest()->getPost('s_username'))) {
                    return $this->redirect()->toRoute('sign_in');
                }
                $hasil = $this->getServiceLocator()->get('PajakService')->authenticate();
                if ($hasil->isValid()) {
                    $data_user = $this->Tools()->getService('UserTable')->getuserdata($this->getRequest()->getPost('s_username'));
                    $resultRowObject = $this->getServiceLocator()->get('PajakService')->getAdapter()->getResultRowObject();
                    $this->getServiceLocator()->get('PajakService')->getStorage()->write(
                            array(
                                's_iduser' => $resultRowObject->s_iduser,
                                's_username' => $resultRowObject->s_username,
                                's_akses' => $resultRowObject->s_akses,
                                's_namauserrole' => $data_user['role_name'],
                                's_nama' => $data_user['s_nama'],
                                's_menu' => $data_user['s_menu'],
                                's_wp' => $data_user['s_wp'],
                                's_tipeoperator' => $data_user['s_tipeoperator'],
                            )
                    );
                    return $this->redirect()->toRoute('main');
                }
            }
        }
        $data = array('nilai' => '2');
        $this->layout()->setVariables($data);
        return $view;
    }

    public function logoutAction() {
        /** logout aplikasi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 03/11/2016
         */
        $this->getServiceLocator()->get('PajakService')->clearIdentity();
        return $this->redirect()->toRoute('sign_in');
    }

}
