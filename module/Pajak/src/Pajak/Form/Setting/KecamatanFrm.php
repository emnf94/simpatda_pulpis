<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class KecamatanFrm extends Form {
    
    public function __construct() {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idkec',
            'type' => 'hidden',
            'attributes' => array(             
                'id'=>'s_idkec'
            )
        ));
        
        $this->add(array(
            'name' => 's_kodekec',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_kodekec',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'name' => 's_namakec',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_namakec',
                'class'=>'form-control',
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