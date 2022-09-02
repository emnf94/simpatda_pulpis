<?php

namespace Pajak\Form\Keberatan;

use Zend\Form\Form;

class PersetujuanKeberatanFrm extends Form {

    public function __construct() {
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idkeberatan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idkeberatan',
            )
        ));        
        
        $this->add(array(
            'name' => 't_idketetapan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idketetapan',
            )
        ));        
        
        $this->add(array(
            'name' => 't_idwpobjek',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idwpobjek',
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
            'name' => 't_jenisketetapan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenisketetapan',
                'class' => 'form-control',
                'required' => true,
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => array(
                    '2' => 'SKPD / SKRD',
                    // '5' => 'SKPDKB',
                    // '6' => 'SKPDKBT',
                    // '10' => 'SKPDT'
                ),
                'disable_inarray_validator' => true, 
            )
        ));

        $this->add(array(
            'name' => 't_tglketetapankeberatan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglketetapankeberatan',
                'class' => 'form-control input-mask bootstrap-datepicker',
                'required' => true,
                'readonly' => true,
                'value' => date('d-m-Y'),
                'data-inputmask' => "'mask':'99-99-9999'"
            )
        ));

        $this->add(array(
            'name' => 't_persetujuan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_persetujuan',
                'class' => 'form-control',
               'onchange' => 'hitungketetapan()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => array(
                    '1' => 'Setuju',
                    '2' => 'Tidak Setuju',
                ),
                'disable_inarray_validator' => true, 
            )
        ));

        $this->add(array(
            'name' => 't_tglverifikasi',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglverifikasi',
                'class' => 'form-control bootstrap-datepicker',
                'readonly' => true,
                'value' => date('d-m-Y'),
            )
        ));
        
		$this->add(array(
            'name' => 't_nomorsk',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nomorsk',
                'class' => 'form-control',
                'required' => true
            )
        ));

         $this->add(array(
            'name' => 't_tipewaktu',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tipewaktu',
                'class' => 'form-control',
                // 'required' => true,
                'readonly'=>true
            )
        ));
		
        
        $this->add(array(
            'name' => 't_alasankeberatan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_alasankeberatan',
                'class' => 'form-control',
                'required' => true,
                'readonly'=>true
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
                'style' => 'text-align:right; background:blue; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));

        $this->add(array(
            'name' => 't_jmlhpengurangan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpengurangan',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right; background:orange; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));

         $this->add(array(
            'name' => 't_restitusi',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_restitusi',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right; background:black; color: red; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));
        
        $this->add(array(
            'name' => 't_jmlhditetapkan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhditetapkan',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right; background:green; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));

//Reklame keberatan
        $this->add(array(
            'name' => 't_jangkawaktu',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jangkawaktu',
                'class' => 'form-control',
                'readonly' => true,
            )
        ));
         $this->add(array(
            'name' => 't_ukuranmedia',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_ukuranmedia',
                'class' => 'form-control',
                'readonly' => true
           
            )
        ));
         $this->add(array(
            'name' => 't_satuanukuranmedia',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_satuanukuranmedia',
                'class' => 'form-control',
                'readonly' => true
           
            )
        ));

           $this->add(array(
            'name' => 't_jumlah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlah',
                'class' => 'form-control',
               'readonly' => true,
               
            )
        ));

            $this->add(array(
            'name' => 't_tarifpajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifpajak',
                'class' => 'form-control',
               'readonly' => true,
                // 'value' => 1,
               
            )
        ));

           
           $this->add(array(
            'name' => 't_jenisreklameusaha',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jenisreklameusaha',
                'class' => 'form-control',
                'readonly' => true
            )
        ));

           $this->add(array(
            'name' => 't_parameter',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_parameter',
                'class' => 'form-control',
                //'required' => true,
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));

          $this->add(array(
            'name' => 't_dasarpengenaan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_dasarpengenaan',
                'class' => 'form-control',
                //'required' => true,
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));


//air keberatan

          $this->add(array(
            'name' => 't_debitair',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_debitair',
                'class' => 'form-control',
                'readonly' => true,
                
            )
        ));

        $this->add(array(
            'name' => 't_lamawaktu',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_lamawaktu',
                'class' => 'form-control',
                // 'required' => true,
                'readonly'=> true,
                
            )
        ));

          $this->add(array(
            'name' => 't_npa',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npa',
                'class' => 'form-control',
                // 'required' => true,
                'readonly' => true,
                'style' => 'text-align:right;'
            )
        ));

        $this->add(array(
            'name' => 't_totalbiaya',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalbiaya',
                'class' => 'form-control',
                'readonly' => true,
            )
        ));

        $this->add(array(
            'name' => 't_kualitasair',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kualitasair',
                'class' => 'form-control',
                'readonly'=>true
            )
        ));

        
         $this->add(array(
            'name' => 't_peruntukan',
           'type' => 'text',
            'attributes' => array(
                'id' => 't_peruntukan',
                'class' => 'form-control',
                'readonly'=>true
            )
        ));
         $this->add(array(
            'name' => 't_volume',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volume',
                'class' => 'form-control',
                'readonly'=>true,
               // 'required' => true,
                'style' => 'text-align:right',

            )
        ));

             $this->add(array(
            'name' => 't_jmlhketetapanseharusnya',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhketetapanseharusnya',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:right; background:yellow; color: green; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'
            )
        ));




        $this->add(array(
            'name' => 'submit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Pembayaransubmit',
                'class' => "btn btn-warning btn-block"
            )
        ));




    }

}
