<?php

namespace Pajak\Form\Pemeriksaan;

use Zend\Form\Form;

class PemeriksaanFrm extends Form {

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
            'name' => 't_jenispemeriksaan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenispemeriksaan',
                'class' => 'form-control',
                'required' => true,
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => array(
                    '1' => '01 || Pemeriksaan Kantor',
                    '2' => '02 || Pemeriksaan Lapangan'
                ),
                'disable_inarray_validator' => true, // <-- disable
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
            'name' => 't_dasarrevisi',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_dasarrevisi',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpemeriksaan();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpemeriksaan();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpemeriksaan();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_selisihdasar',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_selisihdasar',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
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
            'name' => 't_jenisketetapandenda',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenisketetapandenda',
                'class' => 'form-control',
                'required' => true,
                'onChange' => 'hitungpemeriksaan()'
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
                'readonly' => true,
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
