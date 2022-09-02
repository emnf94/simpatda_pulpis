<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class ReklameBerjalanFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idberjalan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idberjalan'
            )
        ));

        $this->add([
            'name' => 's_jeniskendaraan',
            'type' => \Zend\Form\Element\Select::class,
            'options' => [
                'value_options' => [
                    'Kendaraan Tidak Bermotor',
                    'Kendaraan Bermotor',
                ],
            ],
            'attributes' => [
                'id' => 's_jeniskendaraan',
                'class' => 'form-control',
                'disabled' => 'disabled',
            ],
        ]);
        $this->add([
            'name' => 's_masareklame',
            'type' => \Zend\Form\Element\Select::class,
            'options' => [
                'value_options' => [
                    'Harian',
                    'Mingguan',
                    'Bulanan',
                    'Triwulanan',
                    'Semesteran',
                    'Tahunan',
                ],
            ],
            'attributes' => [
                'id' => 's_masareklame',
                'class' => 'form-control',
                'disabled' => 'disabled',
            ],
        ]);

        $this->add(array(
            'name' => 's_nsrberjalan',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_nsrberjalan',
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
