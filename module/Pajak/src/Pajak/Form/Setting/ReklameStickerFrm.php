<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class ReklameStickerFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idstiker',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idstiker'
            )
        ));

        $this->add([
            'name' => 's_ukuran',
            'type' => \Zend\Form\Element\Select::class,
            'options' => [
                'value_options' => [
                    1 => 'Sampai dengan 0,25 m2',
                    2 => '0,25 m2 s/d 0,50 m2',
                    3 => '0,51 m2 s/d 1 m2',
                    4 => 'Lebih dari 1 m2',
                ],
            ],
            'attributes' => [
                'id' => 's_ukuran',
                'class' => 'form-control',
                'disabled' => 'disabled',
            ],
        ]);

        $this->add(array(
            'name' => 's_nsrstiker',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_nsrstiker',
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
