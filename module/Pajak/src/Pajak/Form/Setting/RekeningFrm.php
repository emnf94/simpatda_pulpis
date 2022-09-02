<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class RekeningFrm extends Form {
    
    public function __construct($comboid_jenis = null) {
        parent::__construct();
        
        $this->setAttribute("method", "post");
        
        $this->add(array(
            'name' => 's_idkorek',
            'type' => 'hidden',
            'attributes' => array(             
                'id'=>'s_idkorek'
            )
        ));

        $this->add(array(
            'name' => 's_jenisobjek',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_jenisobjek',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_jenis,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));
        
        $this->add(array(
            'name' => 's_tipekorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_tipekorek',
                'class'=>'form-control input-mask',
                'required' => true,
                'data-inputmask' => "'mask':'9'"
            )
        ));
        
        $this->add(array(
            'name' => 's_kelompokkorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_kelompokkorek',
                'class'=>'form-control input-mask',
                'required' => true,
                'data-inputmask' => "'mask':'9'"
            )
        ));
        
        $this->add(array(
            'name' => 's_jeniskorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_jeniskorek',
                'class'=>'form-control input-mask',
                'required' => true,
                'data-inputmask' => "'mask':'99'"
            )
        ));
        
        $this->add(array(
            'name' => 's_objekkorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_objekkorek',
                'class'=>'form-control input-mask',
                'data-inputmask' => "'mask':'99'",
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_rinciankorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_rinciankorek',
                'class'=>'form-control',
                'class'=>'form-control input-mask',
                'required' => true,
                'data-inputmask' => "'mask':'99'"
            )
        ));
        
        $this->add(array(
            'name' => 's_sub1korek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_sub1korek',
                'class'=>'form-control',
                'maxlength' => 3,
                
            )
        ));
        
        $this->add(array(
            'name' => 's_sub2korek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_sub2korek',
                'class'=>'form-control input-mask',
                'data-inputmask' => "'mask':'99'",
            )
        ));
        
        $this->add(array(
            'name' => 's_sub3korek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_sub3korek',
                'class'=>'form-control input-mask',
                'data-inputmask' => "'mask':'99'",
            )
        ));
        
        $this->add(array(
            'name' => 's_namakorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_namakorek',
                'class'=>'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_persentarifkorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_persentarifkorek',
                'class'=>'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_tarifdasarkorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_tarifdasarkorek',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'name' => 's_voldasarkorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_voldasarkorek',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'name' => 's_tariftambahkorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_tariftambahkorek',
                'class'=>'form-control',
            )
        ));
        
        $this->add(array(
            'name' => 's_tglawalkorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_tglawalkorek',
                'class'=>'form-control bootstrap-datepicker',
                'value' => date('01-01-Y'),
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 's_tglakhirkorek',
            'type' => 'text',
            'attributes' => array(             
                'id'=>'s_tglakhirkorek',
                'class'=>'form-control bootstrap-datepicker',
                'value' => date('31-12-Y'),
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