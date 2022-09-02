<?php

namespace Pajak\Form\Rekambank;

use Zend\Form\Form;

class RekambankFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idsbh',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idsbh',
            )
        ));
        
        $this->add(array(
            'name' => 't_operatorpembayaran',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_operatorpembayaran',
            )
        ));

        $this->add(array(
            'name' => 't_tglsbh',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglsbh',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('d-m-Y'),
                'readonly' => true,
            )
        ));

        $this->add(array(
            'name' => 't_nosbh',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nosbh',
                'class' => 'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 'Rekambanksubmit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Rekambanksubmit',
                'class' => "btn btn-warning btn-block"
            )
        ));
    }
}
