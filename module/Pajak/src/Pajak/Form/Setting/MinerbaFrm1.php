<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class MinerbaFrm extends Form {

    // public function __construct($cmb_rekening = null, $idzona = null) {
    public function __construct() {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idjenisminerba',
            'type' => 'hidden',
            'attributes' => array(             
                'id'=>'s_idjenisminerba'
            )
        ));

        $this->add(array(
            'name' => 's_namajenisminerba',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_namajenisminerba',
                'class'=>'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_idkorek',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_idkorek',                
                'class'=>'form-control'
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                // 'value_options'=> $cmb_rekening,
            )
        ));

        $this->add(array(
            'name' => 's_idzona',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_idzona',                
                'class'=>'form-control'
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
               'value_options' => [
                 1 => 'Sedang', 
                 2 => 'Sulit',
                 3 => 'Sangat Sulit',
             ],
            )
        ));
        // $this->add(array(
        //     'name' => 's_idzona',
        //     'type' => 'Zend\Form\Element\Select',
        //     'attributes' => array(
        //         'id' => 's_idzona',
        //         'class' => 'form-control',
        //         'onchange' => 'hitungpajakreklame();',
        //     ),
        //     'options' => array(
        //         'empty_option' => 'Silahkan Pilih',
        //         'value_options' => [
        //          1 => 'Sedang', 
        //          2 => 'Sulit',
        //          3 => 'Sangat Sulit',

        //      ],
        //         'disable_inarray_validator' => true, // <-- disable
        //     )
        // ));

        
        $this->add(array(
            'name' => 's_harga',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_harga',
                'class'=>'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onkeyup' => 'this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));
        
    
        $this->add(array(
            'name' => 's_keterangan',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(             
                'id'=>'s_keterangan',
                'class'=>'form-control',
                'required' => true
            )
        ));        
        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary btn-sm',
            ),
        ));        
    }
    
}