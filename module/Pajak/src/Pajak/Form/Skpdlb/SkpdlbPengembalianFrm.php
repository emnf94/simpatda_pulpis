<?php

namespace Pajak\Form\Skpdlb;

use Zend\Form\Form;

class SkpdlbPengembalianFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idskpdlb',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idskpdlb',
            )
        ));

        $this->add(array(
            'name' => 't_tglpengembalianskpdlb',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpengembalianskpdlb',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('d-m-Y')
            )
        ));

        $this->add(array(
            'name' => 't_jmlhpengembalianskpdlb',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpengembalianskpdlb',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right; background:#000099; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));
        
        $this->add(array(
            'name' => 'Pembayaransubmit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Pembayaransubmit',
                'class' => "btn btn-warning btn-block"
            )
        ));
    }
}
