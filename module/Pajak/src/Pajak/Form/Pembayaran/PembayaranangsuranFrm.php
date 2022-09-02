<?php

namespace Pajak\Form\Pembayaran;

use Zend\Form\Form;

class PembayaranangsuranFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idangsuran',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idangsuran',
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
            'name' => 't_idketetapan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idketetapan',
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
                    '2' => 'SKPD',
                    '5' => 'SKPDKB',
                    '6' => 'SKPDKBT',
                    '10' => 'SKPDT'
                ),
                'disable_inarray_validator' => true, 
            )
        ));

        $this->add(array(
            'name' => 't_tglbayarangsuran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglbayarangsuran',
                'class' => 'form-control input-mask',
                'required' => true,
				'readonly' => true,
                'value' => date('d-m-Y'),
                'data-inputmask' => "'mask':'99-99-9999'"
            )
        ));
		
		$this->add(array(
            'name' => 't_viapembayaranangsuran',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_viapembayaranangsuran',
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
            'name' => 't_nominalangsuran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nominalangsuran',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
				'style' => 'text-align:right;'
            )
        ));

		$this->add(array(
            'name' => 't_bungaangsuran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_bungaangsuran',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
				'style' => 'text-align:right;'
            )
        ));
		
		$this->add(array(
            'name' => 't_jmlhpembayaranangsuran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpembayaranangsuran',
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
