<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;
use Zend\Form\Element;

class PemdaFrm extends Form
{

    public function __construct($sourceFile = null)
    {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idpemda',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_idpemda',
            )
        ));

        $this->add(array(
            'name' => 's_namaprov',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namaprov',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namakabkota',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namakabkota',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namaibukotakabkota',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namaibukotakabkota',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_kodeprovinsi',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_kodeprovinsi',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_kodekabkot',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_kodekabkot',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namainstansi',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namainstansi',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_namasingkatinstansi',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namasingkatinstansi',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_alamatinstansi',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => array(
                'id' => 's_alamatinstansi',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_notelinstansi',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_notelinstansi',
                'class' => 'form-control'
            )
        ));
        $this->add(array(
            'name' => 's_kodepos',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_kodepos',
                'class' => 'form-control',
                'maxlength' => 5,
                'size' => 5,
            )
        ));

        $this->add(array(
            'name' => 's_namabank',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namabank',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_norekbank',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_norekbank',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_logofile',
            'type' => 'Zend\Form\Element\File',
            'options' => array(
                'label' => 'Logo Kabupaten/Kota',
            ),
            'attributes' => array(
                'id' => 's_logofile'
            )
        ));
        if ($sourceFile != NULL) {
            $this->add(array(
                'name' => 's_logo',
                'type' => 'Zend\Form\Element\Image',
                'attributes' => array(
                    'id' => 's_logo',
                    'src' => $sourceFile,
                    'style' => 'width:250px; height:250px'
                )
            ));
        } else {
            $this->add(array(
                'name' => 's_logo',
                'type' => 'hidden',
                'attributes' => array(
                    'id' => 's_logo',
                )
            ));
        }
    }
}
