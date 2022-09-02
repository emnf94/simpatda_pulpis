<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class KelurahanFrm extends Form {

    public function __construct($cmb_camat = null) {

        parent::__construct();
        
        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idkel',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idkel'
            )
        ));

        $this->add(array(
            'name' => 's_idkeckel',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_idkeckel',                
                'class'=>'form-control'
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options'=>$cmb_camat,
            )
        ));

        $this->add(array(
            'name' => 's_kodekel',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_kodekel',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namakel',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namakel',
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