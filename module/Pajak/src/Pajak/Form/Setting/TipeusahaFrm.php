<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class TipeusahaFrm extends Form {

    public function __construct() {

        parent::__construct();
        
        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idusaha',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idusaha'
            )
        ));

        $this->add(array(
            'name' => 's_kodeusaha',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_kodeusaha',                
                'class'=>'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namausaha',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namausaha',                
                'class'=>'form-control'
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