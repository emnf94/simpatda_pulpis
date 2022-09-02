<?php

namespace Pajak\Form\Setoranlain;

use Zend\Form\Form;

class SetoranlainFrm extends Form {

    public function __construct($comboid_kecamatan = null, $comboid_kelurahan = null) {

        parent::__construct();
        
        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idsetoranlain',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idsetoranlain'
            )
        ));

        $this->add(array(
            'name' => 'tgl_setoranlain',
            'type' => 'text',
            'attributes' => array(
                'id' => 'tgl_setoranlain',                
                'class'=>'form-control'
            )
        ));
        
        $this->add(array(
            'name' => 'no_sts',
            'type' => 'text',
            'attributes' => array(
                'id' => 'no_sts',                
                'class'=>'form-control'
            )
        ));
        
        $this->add(array(
            'name' => 's_namadinas',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namadinas',                
                'class'=>'form-control'
            )
        ));

        $this->add(array(
            'name' => 's_iddinas',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_iddinas',
                'class' => 'form-control'
            )
        ));

        
        
        $this->add(array(
            'name' => 't_viapembayaran',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_viapembayaran',
                'class' => 'form-control',
                'required' => true,
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => array(
                    '1' => '1 || Bendahara Penerima',
                    '2' => '2 || Bank Jateng H2H',
					'3' => '3 || Bank Jateng Rek. 100',
					'4' => '4 || BRI Ajibarang',
					'5' => '5 || BRI Purwokerto'
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