<?php

namespace Pajak\Form\Pendataan;

use Zend\Form\Form;
use Zend\Form\Element\Select;

class PendataantempatparkirFrm extends Form {

    public function __construct($comboIdTariftempatparkir = null) {
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
            'name' => 't_idtempatparkir',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idtempatparkir',
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
                'class' => 'bootstrap-datepicker form-control',
                'value' => date('d-m-Y'),
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_masaawal',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaawal',
                'class' => 'bootstrap-datepicker form-control',
                'value' => date('d-m-Y'),
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_masaakhir',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaakhir',
                'class' => 'bootstrap-datepicker form-control',
                'value' => date('d-m-Y'),
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
            'name' => 't_golonganparkir',
            'type' => Select::class,
            'attributes' => array(
                'id' => 't_golonganparkir',
                'class' => 'form-control',
                'disabled' => true,
                'onchange' => 'carikategorigolonganparkir()',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    1 => '01 || Parkir Harian',
                    2 => '02 || Parkir Berlangganan',
                    3 => '03 || Parkir Insidentil'
                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));
        
        $this->add(array(
            'name' => 't_jeniskendaraan',
            'type' => Select::class,
            'attributes' => array(
                'id' => 't_jeniskendaraan',
                'class' => 'form-control',
                'onchange' => 'hitungretribusitempatparkir()',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [],
                'disable_inarray_validator' => true, // <-- disable
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
                'onkeyup' => 'hitungretribusitempatparkir()'
            )
        ));

        $this->add(array(
            'name' => 't_keterangan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_keterangan',
                'class' => 'form-control'
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
                'onchange' => 'hitungretribusitempatparkir()',
                'onblur' => 'hitungretribusitempatparkir()'
            )
        ));


        $this->add(array(
            'name' => 't_potongan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_potongan',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungretribusirumahdinas();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungretribusirumahdinas();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungretribusirumahdinas();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
                'value' => 0
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
