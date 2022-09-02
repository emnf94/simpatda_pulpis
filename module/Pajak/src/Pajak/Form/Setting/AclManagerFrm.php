<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

/**
 * Description of AclManagerFrm
 *
 * @author farhan
 */
class AclManagerFrm extends Form {

    public function __construct($resources, $permissions=null) {
        parent::__construct();

        $this->add(array(
            'name' => 'cmbResources',
            'type' => 'Zend\Form\Element\Select',
            'options' => array(
                'empty_option' => 'Pilih Resources',
                'value_options' => $resources,
                'label' => 'Daftar Resource:',
                'label_attributes' => array(
                    'class' => 'col-sm-3 control-label',
                    'style' => 'text-align:left'
                ),
            ),
            'attributes' => array(
                'id' => 'cmbResources',
                'class' => 'form-control select2',
                'style' => 'width:auto;margin-left:15px;'
            ),
        ));
        
        $this->add(array(
            'name' => 'btnSimpan',
            'type' => 'submit',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-success',
                'style' => 'margin-left:15px;'
            )
        ));
    }

}
