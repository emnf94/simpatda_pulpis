<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class AirFrm extends Form {
    
    public function __construct() {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idair',
            'type' => 'hidden',
            'attributes' => array(             
                'id'=>'s_idair'
            )
        ));
        
        $this->add(array(
            'name' => 's_peruntukan',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_peruntukan',
                'class'=>'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_nilai1',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_nilai1',
                'class'=>'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_nilai2',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_nilai2',
                'class'=>'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_nilai3',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_nilai3',
                'class'=>'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_nilai4',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_nilai4',
                'class'=>'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_nilai5',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_nilai5',
                'class'=>'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_nilai6',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_nilai6',
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