<?php

namespace Pajak\Form\Pendaftaran;

use Zend\Form\Form;

class PendaftaranFrm extends Form {

    public function __construct($comboid_kecamatan = null, $comboid_kelurahan = null, $nopendaftaran = null) {
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
            'name' => 't_operatorid',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_operatorid',
            )
        ));

        $this->add(array(
            'name' => 't_tgldaftar',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tgldaftar',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true,
                'value' => date('d-m-Y')
            )
        ));

        $this->add(array(
            'name' => 't_jenispendaftaran',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenispendaftaran',
                'class' => 'form-control',
                'required' => true,
            ),
            'options' => array(
                'value_options' => array(
                    'P' => 'P || Wajib Pajak',
                    'R' => 'R || Wajib Retribusi'
                ),
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_bidangusaha',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_bidangusaha',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                'value_options' => array(
                    '1' => '01 || Pribadi',
                    '2' => '02 || Badan Usaha'
                ),
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_nopendaftaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nopendaftaran',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
                'value' => $nopendaftaran
            )
        ));

        $this->add(array(
            'name' => 't_nik',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nik',
                'class' => 'form-control',
                'required' => true,
                'maxlength' => 16,
                "data-parsley-type" => 'digits',
                'onKeyPress' => "return numbersonly(this, event);",
                'onChange' => 'ceknik();',
                'onBlur' => 'ceknik();'
            )
        ));

        $this->add(array(
            'name' => 't_nama',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nama',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_alamat',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_alamat',
                'class' => 'form-control',
//                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_rt',
            'type' => 'number',
            'attributes' => array(
                'id' => 't_rt',
                'class' => 'form-control',
                'required' => true,
                'maxlength' => 3,
                "data-parsley-type" => 'digits',
                'onKeyPress' => "return numbersonly(this, event);"
            )
        ));

        $this->add(array(
            'name' => 't_rw',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_rw',
                'class' => 'form-control',
                'required' => true,
                'maxlength' => 3,
                "data-parsley-type" => 'digits',
                'onKeyPress' => "return numbersonly(this, event);"
            )
        ));

        $this->add(array(
            'name' => 't_kecamatan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_kecamatan',
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
            'name' => 't_kelurahan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_kelurahan',
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
            'name' => 't_kabupaten',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kabupaten',
                'class' => 'form-control',
                'required' => true,
                'value' => 'KOTA SEMARANG'
            )
        ));

        $this->add(array(
            'name' => 't_notelp',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_notelp',
                'class' => 'form-control',
                'maxlength' => 12,
                'required' => true,
                "data-parsley-type" => 'digits',
                'onKeyPress' => "return numbersonly(this, event);"
            )
        ));

        $this->add(array(
            'name' => 't_email',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_email',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_kodepos',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kodepos',
                'class' => 'form-control',
                'maxlength' => 5,
                "data-parsley-type" => 'digits',
                'onKeyPress' => "return numbersonly(this, event);"
            )
        ));

        $this->add(array(
            'name' => 'Pendaftaransubmit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Pendaftaransubmit',
                'class' => "btn btn-warning btn-block"
            )
        ));
    }

}
