<?php

namespace Pajak\Form\Pendataan;

use Zend\Form\Form;

class PendataanperikananFrm extends Form {

    public function __construct($comboid_kapal = null, $comboid_budidaya = null, $comboid_budidayamutiara = null) {
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
            'name' => 't_idperikanan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idperikanan',
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

        $this->add(array(
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
            'name' => 't_jmlhgt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhgt',
                'class' => 'form-control',
//                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungretkapal();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungretkapal();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungretkapal();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));
        
        $this->add(array(
            'name' => 't_jeniskapal',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jeniskapal',
                'class' => 'form-control',
//                'required' => true,
                'onChange' => 'hitungretkapal()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_kapal,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));
        
        $this->add(array(
            'name' => 't_jenisbudidaya',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenisbudidaya',
                'class' => 'form-control',
//                'required' => true,
                'onChange' => 'hitungretbudidaya()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_budidaya,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));
        
        
        $this->add(array(
            'name' => 't_jenisbudidayamutiara',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenisbudidayamutiara',
                'class' => 'form-control',
//                'required' => true,
                'onChange' => 'hitungretbudidayamutiara()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_budidayamutiara,
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
                'style' => 'text-align:right',
                'onchange' => 'hitungretkapal();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungretkapal();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungretkapal();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
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
                'style' => 'text-align:right; background:#000099; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onkeyup' => 'this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
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
