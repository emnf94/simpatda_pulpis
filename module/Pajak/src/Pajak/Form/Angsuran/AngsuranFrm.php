<?php

namespace Pajak\Form\Angsuran;

use Zend\Form\Form;

class AngsuranFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idketetapan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idketetapan',
            )
        ));        
        
        $this->add(array(
            'name' => 't_idwpobjek',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idwpobjek',
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
            'name' => 't_jenisketetapan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenisketetapan',
                'class' => 'form-control',
                'required' => true,
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => array(
                    '2' => 'SKPD / SKRD',
                    '5' => 'SKPDKB',
                    '6' => 'SKPDKBT',
                    '10' => 'SKPDT'
                ),
                'disable_inarray_validator' => true, 
            )
        ));

        $this->add(array(
            'name' => 't_tglketetapanangsuran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglketetapanangsuran',
                'class' => 'form-control input-mask',
                'required' => true,
                'value' => date('d-m-Y'),
                'data-inputmask' => "'mask':'99-99-9999'"
            )
        ));

        $this->add(array(
            'name' => 't_jumlahkaliangsuran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlahkaliangsuran',
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
