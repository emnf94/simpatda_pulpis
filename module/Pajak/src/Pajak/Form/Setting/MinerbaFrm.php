<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class MinerbaFrm extends Form {

    public function __construct($cmb_rekening = null, $combo_kawasan = null) {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idjenis',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_idjenis'
            )
        ));

        $this->add(array(
            'name' => 's_nama',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_nama',
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
                'value_options'=> $cmb_rekening,
            )
        ));

        $this->add(array(
            'name' => 's_kodekawasan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_kodekawasan',                
                'class'=>'form-control'
                // 'onchange' => 'hitungpajakreklame();',
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
        $this->add(array(
            'name' => 's_masa',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_masa',
                'class' => 'form-control',
                'onchange' => 'hitungpajakreklame();',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                 1 => 'Harian', 
                 2 => 'Mingguan',
                 3 => 'Bulanan',
                 4 => 'Tahunan',

             ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        
        $this->add(array(
            'name' => 's_tarif',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_tarif',
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
            'name' => 's_ket',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(             
                'id'=>'s_ket',
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