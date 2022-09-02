<?php

namespace Pajak\Form\Stpdpembayaran;

use Zend\Form\Form;

class StpdpembayaranFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idtransaksi',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idtransaksi',
            )
        ));

        $this->add(array(
            'name' => 't_idwp',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idwp',
            )
        ));
        
        $this->add(array(
            'name' => 't_operatorpembayaran',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_operatorpembayaran',
            )
        ));

        $this->add(array(
            'name' => 't_jmlhdendapembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhdendapembayaran',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_jmlhbulandendapembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhbulandendapembayaran',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_tgldendapembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tgldendapembayaran',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('d-m-Y')
            )
        ));

        $this->add(array(
            'name' => 't_jmlhbayardenda',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhbayardenda',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_tglbayardenda',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglbayardenda',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('d-m-Y')
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
