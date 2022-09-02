<?php

namespace Pajak\Form\Keberatan;

use Zend\Form\Form;

class KeberatanFrm extends Form {

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
            'name' => 't_nilaipengurangan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_nilaipengurangan',
                'class' => 'form-control',
//                'onchange' => 'hitungketetapan()'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => array(
                    '0' => '0%',
                    '15' => '15%',
                    '20' => '20%',
                    '25' => '25%',
                    '30' => '30%'
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
            'name' => 't_alasankeberatan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_alasankeberatan',
                'class' => 'form-control',
                'required' => true
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
                'value' => 0,
                // 'readonly'=>true,
                'onchange' => 'hitungpajakreklame();'
            )
        ));
         $this->add(array(
            'name' => 't_ukuranmedia',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_ukuranmedia',
                'class' => 'form-control',
                'onchange' => 'hitungpajakreklame();',
                //'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_rangeukuran,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));
         $this->add(array(
            'name' => 't_satuanukuranmedia',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_satuanukuranmedia',
                'class' => 'form-control',
                //'required' => true
            ),
            'options' => array(
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

           $this->add(array(
            'name' => 't_jumlah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlah',
                'class' => 'form-control',
               // 'required' => true,
                'value' => 1,
                'onchange' => 'hitungpajakreklame();'
            )
        ));

              $this->add(array(
            'name' => 't_tarifpajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifpajak',
                'class' => 'form-control',
                'readonly'=>true,
               // 'required' => true,
                'value' => 1,
                'onchange' => 'hitungpajakreklame();'
            )
        ));

           
           $this->add(array(
            'name' => 't_jenisreklameusaha',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenisreklameusaha',
                'class' => 'form-control',
                'onchange' => 'gettarifreklame();'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    '1' => '1 || Produk Usaha (Rokok)',
                    '2' => '2 || Lainya',
                ],
                'disable_inarray_validator' => true, // <-- disable
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
                //'required' => true,
                'value' => 0,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakair();',
                'onblur' => 'hitungpajakair();',
                'onkeyup' => 'hitungpajakair();',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_lamawaktu',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_lamawaktu',
                'class' => 'form-control',
                // 'required' => true,
                // 'readonly'=> true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakair();',
                'onblur' => 'hitungpajakair();',
                'onkeyup' => 'hitungpajakair();',
                'onKeyPress' => "return numbersonly(this, event);",
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
                //'required' => true,
                'value' => 0,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakair();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakair();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakair();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_kualitasair',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_kualitasair',
                'class' => 'form-control',
                'onchange' => 'hitungpajakair();',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    1 => '01 || KUALITAS JELEK',
                    4 => '02 || KUALITAS BAIK TIDAK ADA ALTERNATIF',
                    9 => '03 || KUALITAS BAIK ADA ALTERNATIF'
                    
                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        
         $this->add(array(
            'name' => 't_peruntukan',
           'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_peruntukan',
                'class' => 'form-control',
                'onchange' => 'hitungpajakair();',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    1 => '01 || NON NIAGA',
                    2 => '02 || NIAGA KECIL',
                    3 => '03 || NIAGA BESAR',
                    4 => '04 || INDUSTRI KECIL',
                    5 => '05 || INDUSTRI BESAR'
                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));
         $this->add(array(
            'name' => 't_volume',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volume',
                'class' => 'form-control',
               // 'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakair();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakair();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakair();this.value = formatCurrency(this.value);'

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
