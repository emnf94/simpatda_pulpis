<?php

namespace Pajak\Form\Pemeriksaan;

use Zend\Form\Form;

class PemeriksaanskpdtFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idpemeriksaan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idpemeriksaan',
            )
        ));

        $this->add(array(
            'name' => 't_tarifpajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifpajak',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right; background:green; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));

        $this->add(array(
            'name' => 't_idtransaksi',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idtransaksi',
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
            'name' => 't_nopemeriksaan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nopemeriksaan',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_periodepemeriksaan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_periodepemeriksaan',
                'class' => 'form-control',
                'required' => true,
                'value' => date('Y')
            )
        ));

        $this->add(array(
            'name' => 't_tglpemeriksaan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpemeriksaan',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('d-m-Y')
            )
        ));

        $this->add(array(
            'name' => 't_jmlhbln',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhbln',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_tarifkenaikan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifkenaikan',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'value' => 100,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_jmlhkenaikan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhkenaikan',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_jeniskenaikan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jeniskenaikan',
                'class' => 'form-control',
                'required' => true,
                'onChange' => 'hitungpemeriksaanskpdt()'
            ),
            'options' => array(
                'value_options' => array(
                    '1' => 'Tetapkan Kenaikan',
                    '2' => 'Tidak Tetapkan Kenaikan'
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
                'onChange' => 'hitungpemeriksaanskpdt()'
            ),
            'options' => array(
                'value_options' => array(
                    '1' => 'Tetapkan Denda',
                    '2' => 'Tidak Tetapkan Denda'
                ),
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_jmlhdendapemeriksaan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhdendapemeriksaan',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_jmlhpajakseharusnya',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpajakseharusnya',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpemeriksaanskpdt();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpemeriksaanskpdt();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpemeriksaanskpdt();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_tarifpersen',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifpersen',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'value' => 2,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_jmlhpajakpemeriksaan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpajakpemeriksaan',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_totalpemeriksaan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalpemeriksaan',
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
