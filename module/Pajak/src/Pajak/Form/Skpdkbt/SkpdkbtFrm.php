<?php

namespace Pajak\Form\Skpdkbt;

use Zend\Form\Form;

class SkpdkbtFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idskpdkbt',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idskpdkbt',
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
            'name' => 't_noskpdkbt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_noskpdkbt',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_periodeskpdkbt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_periodeskpdkbt',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('Y')
            )
        ));

        $this->add(array(
            'name' => 't_tglskpdkbt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglskpdkbt',
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
                'onchange' => 'hitungskpdkbt();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungskpdkbt();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungskpdkbt();this.value = formatCurrency(this.value);',
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
            'name' => 't_jmlhdendaskpdkbt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhdendaskpdkbt',
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
            'name' => 't_jmlhpajakskpdkbt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpajakskpdkbt',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_totalskpdkbt',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalskpdkbt',
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
