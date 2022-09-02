<?php

namespace Pajak\Form\Setoranlain;

use Zend\Form\Form;

class SetoranlaindetailFrm extends Form {

    public function __construct() {

        parent::__construct();
        
        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idsldetail',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idsldetail'
            )
        ));

        $this->add(array(
            'name' => 's_idsetoranlain',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_idsetoranlain',                
                'class'=>'form-control'
            )
        ));
        
        $this->add(array(
            'name' => 's_idkorek',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idkorek',                
                'class'=>'form-control'
            )
        ));
        
        $this->add(array(
            'name' => 's_namakorek',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namakorek',                
                'class'=>'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 'nama_penyetor',
            'type' => 'text',
            'attributes' => array(
                'id' => 'nama_penyetor',                
                'class'=>'form-control',
                //'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 'jml_setorandetail',
            'type' => 'text',
            'attributes' => array(
                'id' => 'jml_setorandetail',                
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
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary btn-sm'
            ),
        ));
    }
}