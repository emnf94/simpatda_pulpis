<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class JalanreklameFrm extends Form {

    public function __construct($cmb_camat = null, $cmb_kel = null, $cmb_zona = null) {

        parent::__construct();
        
        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 'id_jlnreklame',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idkel'
            )
        ));

        

        $this->add(array(
            'name' => 'kd_jlnreklame',
            'type' => 'text',
            'attributes' => array(
                'id' => 'kd_jlnreklame',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 'nama_jlnreklame',
            'type' => 'text',
            'attributes' => array(
                'id' => 'nama_jlnreklame',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary btn-sm',
                'required' => true
            ),
        ));
        
        $this->add(array(
            'name' => 'id_zona_reklame',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 'id_zona_reklame',                
                'class'=>'form-control',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options'=>$cmb_zona,
            )
        ));
        
        $this->add(array(
            'name' => 's_idkec',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_idkec',                
                'class'=>'form-control',
                'onchange' => 'combokeckelcari()',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options'=>$cmb_camat,
            )
        ));
        
        $this->add(array(
            'name' => 's_idkel',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_idkeljalan',                
                'class'=>'form-control',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options'=>$cmb_kel,
            )
        ));
        
    }
}