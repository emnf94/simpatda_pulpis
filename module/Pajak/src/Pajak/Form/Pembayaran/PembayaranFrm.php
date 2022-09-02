<?php

namespace Pajak\Form\Pembayaran;

use Zend\Form\Form;

class PembayaranFrm extends Form {

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
            'name' => 't_viapembayaran',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_viapembayaran',
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
            'name' => 't_jenisketetapandenda',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenisketetapandenda',
                'class' => 'form-control',
                'required' => true,
                'onChange' => 'hitungpembayaran()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => array(
                    '1' => 'Tidak Ditetapkan Denda',
                    '2' => 'Tetapkan Denda dan Tanpa Bayarkan Denda',
                    '3' => 'Tetapkan Denda dan Bayarkan Denda'
                ),
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_jmlhpajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpajak',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_jmlhbulandendapembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhbulandendapembayaran',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_jmlhdendapembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhdendapembayaran',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_jmlhpembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpembayaran',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right; background:#000099; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));

        $this->add(array(
            'name' => 't_tglpembayaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpembayaran',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'onchange' => 'hitungpembayaran()',
                'onblur' => 'hitungpembayaran()'
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
