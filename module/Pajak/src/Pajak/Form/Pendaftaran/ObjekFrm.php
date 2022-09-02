<?php

namespace Pajak\Form\Pendaftaran;

use Zend\Form\Form;

class ObjekFrm extends Form {

    public function __construct($comboid_kecamatan = null, $comboid_kelurahan = null, $noobjek = null, $comboid_jenis = null, $comboid_korek = null, $comboid_tipeusaha = null) {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idwp',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idwp',
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
            'name' => 't_operatorid',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_operatorid',
            )
        ));

        $this->add(array(
            'name' => 't_jenisobjek',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenisobjek',
                'class' => 'form-control',
                'required' => true,
                'onchange' => 'noobjek();carirekening();'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_jenis,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_korekobjek',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_korekobjek',
                'class' => 'form-control'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_korek,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_noobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_noobjek',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
                'value' => $noobjek
            )
        ));

        $this->add(array(
            'name' => 't_tgldaftarobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tgldaftarobjek',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('d-m-Y')
            )
        ));

        $this->add(array(
            'name' => 't_tipeusaha',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_tipeusaha',
                'class' => 'form-control',
//                'class' => 'chosen-select',
                'required' => true,
            ),
            'options' => array(
                'empty_option' => 'PILIH TIPE USAHA',
                'value_options' => $comboid_tipeusaha,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));


        $this->add(array(
            'name' => 't_namaobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namaobjek',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_alamatobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_alamatobjek',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_rtobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rtobjek',
                'class' => 'form-control',
//                'required' => true,
                'maxlength' => 3,
                "data-parsley-type" => 'digits',
                'onKeyPress' => "return numbersonly(this, event);",
                "placeholder" => "RT"
            )
        ));

        $this->add(array(
            'name' => 't_rwobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rwobjek',
                'class' => 'form-control',
//                'required' => true,
                'maxlength' => 3,
                "data-parsley-type" => 'digits',
                'onKeyPress' => "return numbersonly(this, event);",
                "placeholder" => "RW"
            )
        ));

        $this->add(array(
            'name' => 't_kecamatanobjek',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_kecamatanobjek',
                'class' => 'form-control',
                'required' => true,
                'onchange' => 'comboKelurahanCamat();'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_kecamatan,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_kelurahanobjek',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_kelurahanobjek',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_kelurahan,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_kabupatenobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kabupatenobjek',
                'class' => 'form-control',
                'required' => true,
                'value' => 'Pulang Pisau'
            )
        ));

        $this->add(array(
            'name' => 't_notelpobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_notelpobjek',
                'class' => 'form-control',
                'maxlength' => 12,
                "data-parsley-type" => 'digits',
                'onKeyPress' => "return numbersonly(this, event);"
            )
        ));

        $this->add(array(
            'name' => 't_kodeposobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kodeposobjek',
                'class' => 'form-control',
                'maxlength' => 5,
                "data-parsley-type" => 'digits',
                'onKeyPress' => "return numbersonly(this, event);"
            )
        ));

        $this->add(array(
            'name' => 't_latitudeobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_latitudeobjek',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_longitudeobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_longitudeobjek',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_namaobjekpj',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namaobjekpj',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_alamatobjekpj',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_alamatobjekpj',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_gambarobjek',
            'type' => 'file',
            'attributes' => array(
                'id' => 't_gambarobjek',
                'onChange' => 'readURL(this);'
            )
        ));

        $this->add(array(
            'name' => 'submit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'submit',
                'class' => "btn btn-primary btn-sm"
            )
        ));
    }

}
