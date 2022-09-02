<?php

namespace Pajak\Form\Pendataan;

use Zend\Form\Form;

class PendataanppjFrm extends Form
{

    public function __construct($comboKlasifikasi)
    {
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
            'name' => 't_tglpendataan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpendataan',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'readonly' => true,
            )
        ));

        $this->add(array(
            'name' => 't_masaawal',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaawal',
                'class' => 'form-control', //bootstrap-datepicker 
                // 'onchange' => 'tentukanMasa();',
                'required' => true,
                'readonly' => true,
                'onKeyPress' => "return numbersonly(this, event);",
                'maxlength' => '6',
            )
        ));

        $this->add(array(
            'name' => 't_masaakhir',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaakhir',
                'class' => 'form-control', //bootstrap-datepicker 
                // 'onchange' => 'tentukanMasa();',
                'required' => true,
                'readonly' => true,
                'placeholder' => 'ddmmyy',
                'onKeyPress' => "return numbersonly(this, event);",
                'maxlength' => '6',
            )
        ));

        $this->add(array(
            'name' => 't_asallistrik',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_asallistrik',
                'class' => 'form-control',
                'required' => true,
                // 'onChange' => 'caritariftanahreklame()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    1 => 'Pajak Penerangan Jalan PLN',
                    2 => 'Pajak Penerangan Jalan Non-PLN'
                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));


        $this->add(array(
            'name' => 't_tarifdasar',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifdasar',
                'class' => 'form-control',
                'value' => 1.5,
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
                'value' => 0,
                'readonly' => true,
                'style' => 'text-align:right; background:#000099; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));

        $this->add(array(
            'name' => 't_jmlhpajaknonpln',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpajaknonpln',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'value' => 0,

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
            'name' => 't_dasarpengenaan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_dasarpengenaan',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'value' => 0,

                'onchange' => 'hitungpajakppj()();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakppj()();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakppj()();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_dasarpengenaannonpln',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_dasarpengenaannonpln',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'value' => 0,

                'onchange' => 'hitungpajakppj()();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakppj()();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakppj()();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
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
                'value' => 0,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_tarifpajaknonpln',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifpajaknonpln',
                'class' => 'form-control',
                'required' => true,
                'value' => 0,
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));



        $this->add(array(
            'name' => 't_klasifikasi',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_klasifikasi',
                'class' => 'form-control',
                'required' => true,
                'onChange' => 'formperhitungan()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'disable_inarray_validator' => true, // <-- disable
                'value_options' => $comboKlasifikasi,

            )
        ));
    }
}
