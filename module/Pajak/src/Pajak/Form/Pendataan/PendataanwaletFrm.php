<?php

namespace Pajak\Form\Pendataan;

use Zend\Form\Form;
use Zend\Form\Element\Select;

class PendataanwaletFrm extends Form
{

    public function __construct()
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
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_masaawal',
            'type' => 'text',

            'attributes' => array(
                'id' => 't_masaawal',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:left',

            )
        ));

        $this->add(array(
            'name' => 't_masaakhir',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaakhir',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
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
            'name' => 't_tarifdasarkorek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifdasarkorek',
                'class' => 'form-control',
                // 'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_tarifdasar',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifdasar',
                'class' => 'form-control',
                // 'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
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
                'readonly' => true,
                'onchange' => 'return this.value = formatCurrency(this.value);',

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
                // 'readonly' => true,
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
            'name' => 't_jenissarang1',
            'type' => Select::class,
            'attributes' => array(
                'id' => 't_jenissarang1',
                'class' => 'form-control',
                'onchange' => 'gethargadasarwalet1();hitungpajakwalet();',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    1 => '01 || Mangkok',
                    2 => '02 || Sudut',
                    3 => '03 || Jenis Lainya'

                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_jenissarang2',
            'type' => Select::class,
            'attributes' => array(
                'id' => 't_jenissarang2',
                'class' => 'form-control',
                'onchange' => 'gethargadasarwalet2();hitungpajakwalet();',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    1 => '01 || Mangkok',
                    2 => '02 || Sudut',
                    3 => '03 || Jenis Lainya'

                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_jenissarang3',
            'type' => Select::class,
            'attributes' => array(
                'id' => 't_jenissarang3',
                'class' => 'form-control',
                'onchange' => 'gethargadasarwalet3();hitungpajakwalet();',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    1 => '01 || Mangkok',
                    2 => '02 || Sudut',
                    3 => '03 || Jenis Lainya'

                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_umurbangunan',
            'type' => Select::class,
            'attributes' => array(
                'id' => 't_umurbangunan',
                'class' => 'form-control',
                'onchange' => 'gettarifpajakwalet();hitungpajakwalet();',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    1 => '01 || s/d 3 Tahun',
                    2 => '02 || 3 s/d 6 Tahun',
                    3 => '03 || > 6 Tahun'

                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_hargadasar1',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hargadasar1',
                'class' => 'form-control',
                // 'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_hargadasar2',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hargadasar2',
                'class' => 'form-control',
                //'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));
        $this->add(array(
            'name' => 't_hargadasar3',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hargadasar3',
                'class' => 'form-control',
                //'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakwalet();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_iddetailwalet',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_iddetailwalet',
            )
        ));

        $this->add(array(
            'name' => 't_hargapasar',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hargapasar',

                'class' => 'form-control',
                'style' => 'text-align:right',
                'onblur' => 'dasarpengenaanwalet();hitungpajakwalet()',
                'onkeypress' => 'return hanyaAngka(event)',
                'onkeyup' => 'dasarpengenaanwalet();hitungpajakwalet()',
                'onchange' => "return numbersonly(this, event);dasarpengenaanwalet();hitungpajakwalet()",


            )
        ));

        $this->add(array(
            'name' => 't_volume',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volume',
                'class' => 'form-control',
                'placeholder' => 'Kg',
                'style' => 'text-align:right',
                'onblur' => 'dasarpengenaanwalet();hitungpajakwalet()',
                'onkeyup' => 'dasarpengenaanwalet();hitungpajakwalet()',
                'onchange' => "return hanyaAngka(this, event);dasarpengenaanwalet();hitungpajakwalet()",
                'onkeypress' => 'return hanyaAngka(event)'

            )
        ));
    }
}
