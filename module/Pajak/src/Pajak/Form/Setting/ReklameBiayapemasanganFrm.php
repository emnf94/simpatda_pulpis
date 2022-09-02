<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class ReklameBiayapemasanganFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");
        $this->add(array(
            'name' => 's_jenisreklame',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_jenisreklame',
                'required' => true,
                
            )
        ));
        $this->add(array(
            'name' => 's_jenisreklame_text',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_jenisreklame_text',
                'class' => 'form-control',
                'readonly' => true,
            )
        ));
        $this->add(array(
            'name' => 's_biayapemasangan',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_biayapemasangan',
                'class' => 'form-control',
                'required' => true,
                'onkeypress' => 'return numbersonly(this,event);'
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
