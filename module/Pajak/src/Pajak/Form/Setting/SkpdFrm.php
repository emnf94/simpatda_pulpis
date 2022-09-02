<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class SkpdFrm extends Form {

    public function __construct($comboid_kecamatan = null, $comboid_kelurahan = null) {

        parent::__construct();
        
        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idskpd',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idskpd'
            )
        ));

        $this->add(array(
            'name' => 's_namaskpd',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namaskpd',                
                'class'=>'form-control'
            )
        ));

        $this->add(array(
            'name' => 'jalan_skpd',
            'type' => 'text',
            'attributes' => array(
                'id' => 'jalan_skpd',
                'class' => 'form-control'
            )
        ));

        
        
        $this->add(array(
            'name' => 's_idkec',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_idkec',
                'class' => 'form-control',
                'required' => true,
                'onchange' => 'comboKelurahanCamat();'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_kecamatan,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 's_idkel',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_idkel',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_kelurahan,
                'disable_inarray_validator' => true, // <-- disable
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