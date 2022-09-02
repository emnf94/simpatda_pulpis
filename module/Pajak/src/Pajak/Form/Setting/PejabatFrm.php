<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class PejabatFrm extends Form {

    public function __construct() {

        parent::__construct();
        
        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idpej',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idpej'
            )
        ));

        $this->add(array(
            'name' => 's_namapej',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namapej',                
                'class'=>'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_jabatanpej',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_jabatanpej',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_pangkatpej',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_pangkatpej',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_nippej',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_nippej',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary btn-sm'
            ),
        ));
    }
}