<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class AreaPengaruhFrm extends Form {
    
    public function __construct() {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idfaktorluasarea',
            'type' => 'hidden',
            'attributes' => array(             
                'id'=>'s_idcekungan'
            )
        ));
        
        $this->add(array(
            'name' => 's_areapengaruh',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_areapengaruh',
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