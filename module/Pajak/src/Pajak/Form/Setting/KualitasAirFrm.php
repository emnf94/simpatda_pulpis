<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class KualitasAirFrm extends Form {
    
    public function __construct() {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idfaktorkualitas',
            'type' => 'hidden',
            'attributes' => array(             
                'id'=>'s_idfaktorkualitas'
            )
        ));
        
        $this->add(array(
            'name' => 's_namafaktorkualitas',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_namafaktorkualitas',
                'class'=>'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_nilai',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_nilai',
                'class'=>'form-control',
                'required' => true
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