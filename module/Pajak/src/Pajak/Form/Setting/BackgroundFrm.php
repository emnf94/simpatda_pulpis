<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;
use Zend\Form\Element;

class BackgroundFrm extends Form {

    public function __construct($sourceFile = null) {
        parent::__construct();

        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 'id_bg',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 'id_bg'
            )
        ));

        $this->add(array(
            'name' => 't_file_bg',
            'type' => 'Zend\Form\Element\File',
            'options' => array(
                //'label' => 'Logo Kabupaten/Kota',
            ),
            'attributes' => array(
                'id' => 't_file_bg'
            )
        ));
        $this->add(array(
            'name' => 'status_bg',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 'status_bg',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                //'empty_option' => 'Silahkan Pilih',
                'value_options' => array(
                    "1" => "Aktif",
                    "2" => "Tidak Aktif"
                ),
                'disable_inarray_validator' => true, // <-- disable
            )
        ));
        
        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary btn-sm'
            ),
        ));
    }

}
