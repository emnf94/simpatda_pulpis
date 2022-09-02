<?php

namespace Pajak\Form\Pendaftaran;

use Zend\Form\Form;

class PenggabunganopFrm extends Form {

    public function __construct() {
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
            'name' => 'submit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'submit',
                'class' => "btn btn-warning btn-sm"
            )
        ));
    }

}
