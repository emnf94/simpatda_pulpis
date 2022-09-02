<?php

namespace Pajak\Form\Skpdt;

use Zend\Form\Form;

class SkpdtPembayaranFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idskpdt',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idskpdt',
            )
        ));

        $this->add(array(
            'name' => 't_tglbayarskpdt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglbayarskpdt',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('d-m-Y')
            )
        ));

        $this->add(array(
            'name' => 't_viabayarskpdt',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_viabayarskpdt',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => array(
                    '1' => '1 || Bendahara Penerima',
                    '2' => '2 || Bank'
                ),
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_jmlhbayarskpdt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhbayarskpdt',
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
