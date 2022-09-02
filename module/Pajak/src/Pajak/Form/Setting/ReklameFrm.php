<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;
use Zend\Form\Element;

class ReklameFrm extends Form
{

    // public function __construct($cmb_rekening = null, $combo_kawasan = null)
    public function __construct($cmb_rekening = null, $combo_kawasan = null)
    {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idreklamejenis',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_idreklamejenis'
            )
        ));

        $this->add(array(
            'name' => 's_namareklamejenis',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namareklamejenis',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 's_idrekening',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_idrekening',
                'class' => 'form-control'
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options' => $cmb_rekening,
            )
        ));

        $this->add(array(
            'name' => 's_kodekawasan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_kodekawasan',
                'class' => 'form-control'
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options' => [
                    1 => 'Strategis',
                    2 => 'Sedang',
                    3 => 'Lainya',
                ],
            )
        ));

        $this->add(array(
            'name' => 's_masa',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_masa',
                'class' => 'form-control',
                'onchange' => 'hitungpajakreklame();',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    1 => 'Harian',
                    2 => 'Mingguan',
                    3 => 'Bulanan',
                    4 => 'Tahunan',

                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 's_permanen',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_permanen',
                'class' => 'form-control',
                'onchange' => 'hitungpajakreklame();',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    1 => 'Permanen',
                    2 => 'Insidentil',

                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));


        $this->add(array(
            'name' => 's_njop',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_njop',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onkeyup' => 'this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 'kawasan1',
            'type' => 'text',
            'attributes' => array(
                'id' => 'kawasan1',
                'class' => 'form-control',
                'required' => true,
                'placeholder' => "Utama",
                'style' => 'text-align:right',
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onkeyup' => 'this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 'kawasan2',
            'type' => 'text',
            'attributes' => array(
                'id' => 'kawasan2',
                'class' => 'form-control',
                'placeholder' => "A",
                'style' => 'text-align:right',
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onkeyup' => 'this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 'kawasan3',
            'type' => 'text',
            'attributes' => array(
                'id' => 'kawasan3',
                'class' => 'form-control',
                'placeholder' => "B",
                'style' => 'text-align:right',
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onkeyup' => 'this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 'kawasan4',
            'type' => 'text',
            'attributes' => array(
                'id' => 'kawasan4',
                'class' => 'form-control',
                'placeholder' => "C",
                'style' => 'text-align:right',
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onkeyup' => 'this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));




        $this->add(array(
            'name' => 's_ket',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'id' => 's_ket',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary btn-sm',
            ),
        ));
    }
}
