<?php

namespace Pajak\Form\Pendataan;

use Zend\Form\Form;

class TeguranlaporanFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        // $this->add(array(
        //     'name' => 't_tglteguran',
        //     'type' => 'text',
        //     'attributes' => array(
        //         'id' => 't_tglteguran',
        //         'class' => 'form-control',
        //         'placeholder' => 'ddmmyy',
        //         'onKeyPress' => "return numbersonly(this, event);",
        //         'maxlength' => '6',
        //         'required' => true,
        //         'value' => date('d-m-Y')
        //     )
        // ));   

        $this->add(array(
            'name' => 't_tglteguran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglteguran',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('d-m-Y')
            )
        ));

        $this->add(array(
            'name' => 't_idteguran',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idteguran',
            )
        ));     
        
        $this->add(array(
            'name' => 't_masapajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masapajak',
                'class' => 'form-control',
                'readonly' => true
            )
        ));        
        
        $this->add(array(
            'name' => 't_bulanpajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_bulanpajak',
                'class' => 'form-control',
                'readonly' => true
            )
        ));
        
        $this->add(array(
            'name' => 't_tahunpajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tahunpajak',
                'class' => 'form-control',
                'readonly' => true
            )
        ));
        
        $this->add(array(
            'name' => 't_jenispajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jenispajak',
                'class' => 'form-control',
                'readonly' => true
            )
        ));
        
        $this->add(array(
            'name' => 'Teguransubmit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Teguransubmit',
                'class' => "btn btn-warning btn-block"
            )
        ));
    }

}
