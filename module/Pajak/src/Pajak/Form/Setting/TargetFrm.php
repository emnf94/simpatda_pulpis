<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class TargetFrm extends Form {
    
    public function __construct($comboid_jenistarget = null) {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idtarget',
            'type' => 'hidden',
            'attributes' => array(             
                'id'=>'s_idtarget'
            )
        ));
        
        $this->add(array(
            'name' => 's_tahuntarget',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_tahuntarget',
                'class'=>'form-control',
            )
        ));

        $this->add(array(
            'name' => 's_statustarget',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_statustarget',
                'class' => 'form-control',
                'required' => true,
            ),
            'options' => array(
                'value_options' => $comboid_jenistarget,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 's_keterangantarget',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_keterangantarget',
                'class' => 'form-control',
                'required' => true,
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