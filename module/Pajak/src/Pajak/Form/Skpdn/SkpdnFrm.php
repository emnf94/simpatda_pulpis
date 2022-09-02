<?php

namespace Pajak\Form\Skpdn;

use Zend\Form\Form;

class SkpdnFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idskpdn',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idskpdn',
            )
        ));

        $this->add(array(
            'name' => 't_korekskpdn',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_korekskpdn',
            )
        ));

        $this->add(array(
            'name' => 't_tarifpajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifpajak',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
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
            'name' => 't_noskpdn',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_noskpdn',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_periodeskpdn',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_periodeskpdn',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('Y')
            )
        ));

        $this->add(array(
            'name' => 't_tglskpdn',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglskpdn',
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
                'readonly' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungskpdn();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungskpdn();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungskpdn();this.value = formatCurrency(this.value);',
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
            'name' => 't_totalskpdn',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalskpdn',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right; background:#000099; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));
        
        $this->add(array(
            'name' => 'Pemeriksaansubmit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Pembayaransubmit',
                'class' => "btn btn-warning btn-block"
            )
        ));
    }
}
