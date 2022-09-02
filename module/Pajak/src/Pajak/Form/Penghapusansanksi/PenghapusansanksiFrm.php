<?php

namespace Pajak\Form\Penghapusansanksi;

use Zend\Form\Form;

class PenghapusansanksiFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idhapussanksi',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idhapussanksi',
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
                    '2' => 'SPTPD / SKPD / SKRD',
                    '5' => 'SKPDKB',
                    '6' => 'SKPDKBT',
                    '10' => 'SKPDT'
                ),
                'disable_inarray_validator' => true, 
            )
        ));

        $this->add(array(
            'name' => 't_tglhapussanksi',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglhapussanksi',
                'class' => 'form-control input-mask bootstrap-datepicker',
                'required' => true,
                'readonly' => true,
                'value' => date('d-m-Y'),
                'data-inputmask' => "'mask':'99-99-9999'"
            )
        ));

        $this->add(array(
            'name' => 't_tglverifikasi',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglverifikasi',
                'class' => 'form-control bootstrap-datepicker',
                'readonly' => true,
                'value' => date('d-m-Y'),
            )
        ));
        
        $this->add(array(
            'name' => 't_nomorsk',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nomorsk',
                'class' => 'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 't_alasanhapussanksi',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_alasanhapussanksi',
                'class' => 'form-control',
                'required' => true
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
                'style' => 'text-align:right; background:blue; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));

        $this->add(array(
            'name' => 't_jmlhdendaseharusnya',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhdendaseharusnya',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right; background:#cc0033; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));
        
        $this->add(array(
            'name' => 't_jmlhditetapkan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhditetapkan',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right; background:green; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
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
