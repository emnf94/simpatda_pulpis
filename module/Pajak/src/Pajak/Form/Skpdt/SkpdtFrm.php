<?php

namespace Pajak\Form\Skpdt;

use Zend\Form\Form;

class SkpdtFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idskpdt',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idskpdt',
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
            'name' => 't_noskpdt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_noskpdt',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_periodeskpdt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_periodeskpdt',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('Y')
            )
        ));

        $this->add(array(
            'name' => 't_tglskpdt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglskpdt',
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
                'onchange' => 'hitungskpdt();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungskpdt();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungskpdt();this.value = formatCurrency(this.value);',
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
            'name' => 't_jmlhdendaskpdt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhdendaskpdt',
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
            'name' => 't_jmlhpajakskpdt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpajakskpdt',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_totalskpdt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalskpdt',
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
