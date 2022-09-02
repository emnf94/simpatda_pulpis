<?php

namespace Pajak\Form\Penetapan;

use Zend\Form\Form;

class PenetapanFrm extends Form {

    public function __construct() {
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
            'name' => 't_operatorpenetapan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_operatorpenetapan',
            )
        ));

        $this->add(array(
            'name' => 't_tglpenetapan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpenetapan',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 'Penetapansubmit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Penetapansubmit',
                'class' => "btn btn-warning btn-block"
            )
        ));
    }
}
