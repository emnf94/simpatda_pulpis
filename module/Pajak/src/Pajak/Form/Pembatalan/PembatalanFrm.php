<?php

namespace Pajak\Form\Pembatalan;

use Zend\Form\Form;

class PembatalanFrm extends Form {

    public function __construct($combo_disposisi = null, $combo_lapangan = null) {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idpembatalan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idpembatalan',
            )
        ));

        $this->add(array(
            'name' => 't_nopembatalan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nopembatalan',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_idketetapan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idketetapan',
            )
        ));

        $this->add(array(
            'name' => 't_jenisketetapan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_jenisketetapan',
            )
        ));

        $this->add(array(
            'name' => 't_jenispajak',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_jenispajak',
            )
        ));

        $this->add(array(
            'name' => 't_tglpembatalan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpembatalan',
                'class' => 'form-control',
                'required' => true,
                'value' => date('d-m-Y'),
                'placeholder' => 'ddmmyy',
                'onKeyPress' => "return numbersonly(this, event);",
                'maxlength' => '6',
            )
        ));

        $this->add(array(
            'name' => 't_jampembatalan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jampembatalan',
                'class' => 'form-control',
                'required' => true,
                'placeholder' => 'jjmm',
                'onKeyPress' => "return numbersonly(this, event);",
                'maxlength' => '4',
            )
        ));

        $this->add(array(
            'name' => 't_disposisi',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_disposisi',
                'class' => 'form-control',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combo_disposisi,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_petugaslapangan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_petugaslapangan',
                'class' => 'form-control',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $combo_lapangan,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_alasan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_alasan',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 'submit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Pembayaransubmit',
                'class' => "btn btn-warning btn-block"
            )
        ));
    }

}
