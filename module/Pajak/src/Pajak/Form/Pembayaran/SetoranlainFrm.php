<?php

namespace Pajak\Form\Pembayaran;

use Zend\Form\Form;
use Zend\Form\Element\Textarea;

class SetoranlainFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idsetoranlain',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idsetoranlain',
            )
        ));

        $this->add(array(
            'name' => 't_idrekening',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idrekening',
            )
        ));
        $this->add(array(
            'name' => 't_idsatker',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idsatker',
            )
        ));

        $this->add(array(
            'name' => 't_viasetor',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_viasetor',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                'value_options' => array(
                    '1' => '1 || Bendahara Penerima',
                    '2' => '2 || Bank'
                ),
                'disable_inarray_validator' => true, // <-- disable
            )
        ));
        $this->add(array(
            'name' => 't_kodebukti',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_kodebukti',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                'value_options' => array(
                    1 => '1 || SKPD',
                    2 => '2 || SKR',
                    3 => '3 || Surat Setoran',
                    4 => '4 || Lain-lain',
                ),
                'disable_inarray_validator' => true, // <-- disable
            )
        ));



        $this->add(array(
            'name' => 't_jumlahsetor',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlahsetor',
                'class' => 'form-control',
                'required' => true,
                // 'onkeypress' => 'return numbersonly(this,event);',
                // 'onkeyup' => 'this.value=formatCurrency(this.value);',
            )
        ));

        $this->add(array(
            'name' => 't_tglsetor',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglsetor',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'readonly' => true,
                'value' => date('d-m-Y'),
            )
        ));


            $this->add(array(
            'type' => Textarea::class,
            'name' => 't_keterangan',
            // 'type' => 'text',
            'attributes' => array(
                'id' => 't_keterangan',                
                'class'=>'form-control',
                'required'=>true,
            )
        ));

        $this->add(array(
            'name' => 't_tahunpajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tahunpajak',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'value' => date('Y'),
            )
        ));

        $this->add(array(
            'name' => 'SubmitBtn',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'SubmitBtn',
                'class' => "btn btn-primary btn-sm"
            )
        ));
    }

}
