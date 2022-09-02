<?php

namespace Pajak\Form\Pendataan;

use Zend\Form\Form;

class PendataanSkpdFrm extends Form {

    public function __construct($t_nourut = null) {

        parent::__construct();
        
        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_idskpd',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 's_idskpd',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 's_namaskpd',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_namaskpd',                
                'class'=>'form-control',
                //'readonly'=>true,
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 'namawp',
            'type' => 'text',
            'attributes' => array(
                'id' => 'namawp',                
                'class'=>'form-control',
                //'readonly'=>true,
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 'npwpd',
            'type' => 'text',
            'attributes' => array(
                'id' => 'npwpd',                
                'class'=>'form-control',
                'readonly'=>true
            )
        ));

        $this->add(array(
            'name' => 't_idwp',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idwp',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_idobjek',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idobjek',
                'class' => 'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 't_idtransaksi',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idtransaksi',
            )
        ));
        
        $this->add(array(
            'name' => 't_idkorek',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idkorek',
            )
        ));

        $this->add(array(
            'name' => 't_jenispajak',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_jenispajak',
            )
        ));
        
        $this->add(array(
            'name' => 't_nourut',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nourut',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
                'value' => $t_nourut
            )
        ));
        
        $this->add(array(
            'name' => 't_periodepajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_periodepajak',
                'class' => 'form-control',
                'value' => date('Y'),
                'onchange' => 'CariPendataanByObjek();',
                'onblur' => 'CariPendataanByObjek();'
            )
        ));

        $this->add(array(
            'name' => 't_tglpendataan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpendataan',
                'class' => 'form-control',
                'required' => true
            )
        ));

                
        $this->add(array(
            'name' => 't_masaawal',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaawal',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_masaakhir',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaakhir',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_korek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_korek',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_namakorek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namakorek',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_dasarpengenaan_skpd',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_dasarpengenaan_skpd',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajak();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajak();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajak();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));
        
        $this->add(array(
            'name' => 't_dasarpengenaan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_dasarpengenaan',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right',
                //'onchange' => 'hitungpajak();this.value = formatCurrency(this.value);',
                //'onblur' => 'hitungpajak();this.value = formatCurrency(this.value);',
                //'onkeyup' => 'hitungpajak();this.value = formatCurrency(this.value);',
                //'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_tarifpajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifpajak',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_jmlhpajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpajak',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right; background:#000099; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
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