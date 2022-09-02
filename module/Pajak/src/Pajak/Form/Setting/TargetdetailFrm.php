<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class TargetdetailFrm extends Form {
    
    public function __construct() {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idtargetdetail',
            'type' => 'hidden',
            'attributes' => array(             
                'id'=>'s_idtargetdetail'
            )
        ));
        
        $this->add(array(
            'name' => 's_idtargetheader',
            'type' => 'hidden',
            'attributes' => array(             
                'id'=>'s_idtargetheader'
            )
        ));
        
        $this->add(array(
            'name' => 's_targetrekening',
            'type' => 'hidden',
            'attributes' => array(             
                'id'=>'s_targetrekening'
            )
        ));

        $this->add(array(
            'name' => 's_targetjumlah',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_targetjumlah',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onkeyup' => 'this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));
        
        $this->add(array(
            'type' => 'submit',
            'name' => 'submit',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary btn-sm',
            ),
        ));        
    }
    
}