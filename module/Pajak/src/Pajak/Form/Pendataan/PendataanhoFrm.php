<?php

namespace Pajak\Form\Pendataan;

use Zend\Form\Form;

class PendataanhoFrm extends Form {

    public function __construct($comboid_holokasi = null, $comboid_hogangguan = null, $comboid_hoskala = null, $comboid_imblokasi = null, $comboid_imbkondisi = null) {
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
            'name' => 't_idretho',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idretho',
            )
        ));

        $this->add(array(
            'name' => 't_idobjek',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idobjek',
            )
        ));

        $this->add(array(
            'name' => 't_idkorek',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idkorek',
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
            'name' => 't_operatorpendataan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_operatorpendataan',
            )
        ));

        $this->add(array(
            'name' => 't_nourut',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nourut',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_periodepajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_periodepajak',
                'class' => 'form-control',
                'value' => date('Y'),
                'onchange' => 'CariPendataanByObjek();',
                'onblur' => 'CariPendataanByObjek();'
            )
        ));

        $this->add(array(
            'name' => 't_tglpenetapan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpenetapan',
                'class' => 'form-control bootstrap-datepicker',
                'required' => true, 
				'readonly' => true,
                'value' => date('d-m-Y')
            )
        ));

        $$this->add(array(
            'name' => 't_masaawal',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaawal',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true
            )
        ));


        $this->add(array(
            'name' => 't_masaakhir',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaakhir',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_korek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_korek',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_namakorek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namakorek',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));
        
        $this->add(array(
            'name' => 't_panjang',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_panjang',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungretholuas();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungretholuas();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungretholuas();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));
        
        $this->add(array(
            'name' => 't_lebar',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_lebar',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungretholuas();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungretholuas();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungretholuas();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));
        
        $this->add(array(
            'name' => 't_luas',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_luas',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));
        
        $this->add(array(
            'name' => 't_indeks_luas',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_indeks_luas',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));
        
        $this->add(array(
            'name' => 't_kwslokasi',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_kwslokasi',
                'class' => 'form-control',
                'required' => true,
                'onChange' => 'hitungtotalretho()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_holokasi,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_gangguan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_gangguan',
                'class' => 'form-control',
                'required' => true,
                'onChange' => 'hitungtotalretho()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_hogangguan,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_skala',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_skala',
                'class' => 'form-control',
                'required' => true,
                'onChange' => 'hitungtotalretho()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_hoskala,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));
        
        $this->add(array(
            'name' => 't_tarifdasar',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifdasar',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right'
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
                'style' => 'text-align:right; background:#000099; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));
        
        $this->add(array(
            'name' => 'Pendataansubmit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Pendataansubmit',
                'class' => "btn btn-warning btn-block"
            )
        ));
    }
}
