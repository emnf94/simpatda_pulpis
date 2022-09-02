<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class ReklameSelebaranFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idselebaran',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idselebaran'
            )
        ));

        $this->add([
            'name' => 's_ukuran',
            'type' => \Zend\Form\Element\Select::class,
            'options' => [
                'value_options' => [
                    1 => 'Sampai dengan 0,25 m2',
                    2 => '0,25 m2 s/d 0,50 m2',
                    3 => 'Lebih dari 0,51 m2',
                ],
            ],
            'attributes' => [
                'id' => 's_ukuran',
                'class' => 'form-control',
                'disabled' => 'disabled',
            ],
        ]);

        $this->add(array(
            'name' => 's_nsrselebaran',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_nsrselebaran',
                'class' => 'form-control',
                'required' => true,
                'onkeypress' => 'return numbersonly(this,event);'
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
