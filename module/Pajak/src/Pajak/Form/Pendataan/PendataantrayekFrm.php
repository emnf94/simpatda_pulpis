<?php

namespace Pajak\Form\Pendataan;

use Zend\Form\Form;

class PendataantrayekFrm extends Form {

    public function __construct($comboid_trayek = null) {
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
            'name' => 't_idrettrayek',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idrettrayek',
            )
        ));

        // $this->add(array(
        //     'name' => 't_iddetailret',
        //     'type' => 'hidden',
        //     'attributes' => array(
        //         'id' => 't_iddetailret',
        //     )
        // ));

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

        // $this->add(array(
        //     'name' => 't_masaawal',
        //     'type' => 'text',
        //     'attributes' => array(
        //         'id' => 't_masaawal',
        //         'class' => 'bootstrap-datepicker form-control',
        //         'value' => date('d-m-Y'),
        //         'required' => true
        //     )
        // ));

        // $this->add(array(
        //     'name' => 't_masaakhir',
        //     'type' => 'text',
        //     'attributes' => array(
        //         'id' => 't_masaakhir',
        //         'class' => 'bootstrap-datepicker form-control',
        //         'value' => date('d-m-Y'),
        //         'required' => true
        //     )
        // ));

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
            'name' => 't_jmlhkendaraan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhkendaraan',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungrettrayek();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungrettrayek();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungrettrayek();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_jmlhperjalanan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhperjalanan',
                'class' => 'form-control',
                'value' => 1,
                'style' => 'text-align:right',
                'onchange' => 'hitungrettrayek();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungrettrayek();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungrettrayek();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));
        
        $this->add(array(
            'name' => 't_jenisretribusi',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenisretribusi',
                'class' => 'form-control',
                'required' => true,
                'onChange' => 'hitungrettrayek()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_trayek,
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
