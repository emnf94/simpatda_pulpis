<?php

namespace Pajak\Form\Pendataan;

use Zend\Form\Form;
use Zend\Form\Element\Select;

class PendataanairFrm extends Form {

    public function __construct($comboid_kodekelompok = null) { //, $comboid_ukuranpipa = null
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 't_idtransaksi',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idtransaksi',
            )
        ));
        
        $this->add(array(
            'name' => 't_idair',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idair',
            )
        ));
        $this->add(array(
            'name' => 't_tarifdasarkorek',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_tarifdasarkorek',
            )
        ));

        $this->add(array(
            'name' => 't_perhitungan',
            'type' => 'text',
            'attributes' => array(
                'id' => 'npa',
                'class' => 'form-control',
                'readonly' => true,
            )
        ));

        $this->add(array(
            'name' => 't_idobjek',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_idobjek',
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
            'name' => 't_operatorpendataan',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_operatorpendataan',
            )
        ));

        $this->add(array(
            'name' => 't_nourut',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nourut',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
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
                'class' => 'bootstrap-datepicker form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_masaawal',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaawal',
                'class' => 'form-control',
                'onchange' => 'hitungpajakair();',
               
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_masaakhir',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaakhir',
                'onchange' => 'hitungpajakair();',
                
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
            'name' => 't_hargadasarair',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hargadasarair',
                'class' => 'form-control',
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
//                'readonly' => true,
                'style' => 'text-align:right; background:#000099; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder',
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onkeyup' => 'this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));
        
        $this->add(array(
            'name' => 't_peruntukan',
            'type' => Select::class,
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
            'name' => 't_kodekelompok',
            'type' => Select::class,
            'attributes' => array(
                'id' => 't_kodekelompok',
                'class' => 'form-control',
                'onchange' => 'CariTarifpipa();',
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_kodekelompok,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));
        


        $this->add(array(
            'name' => 't_volume',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volume',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakair();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakair();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakair();this.value = formatCurrency(this.value);'

            )
        ));
        $this->add(array(
            'name' => 't_fna',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_fna',
                'class' => 'form-control',
                'value' => 0,
                'style' => 'text-align:right',
            )
        ));
        
        $this->add(array(
            'name' => 't_totalnpa',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalnpa',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));
        
        $this->add(array(
            'name' => 't_volume1',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volume1',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_fna1',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_fna1',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_hda1',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hda1',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_npa1',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npa1',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_volume2',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volume2',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_fna2',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_fna2',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_hda2',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hda2',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_npa2',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npa2',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        

        $this->add(array(
            'name' => 't_volume3',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volume3',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_fna3',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_fna3',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_hda3',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hda3',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_npa3',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npa3',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));
        $this->add(array(
            'name' => 't_volume4',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volume4',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_fna4',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_fna4',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_hda4',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hda4',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_npa4',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npa4',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));
        $this->add(array(
            'name' => 't_volume5',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volume5',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_fna5',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_fna5',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_hda5',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hda5',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

            $this->add(array(
            'name' => 't_npa5',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npa5',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_tglpenetapan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpenetapan',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 'Pendataansubmit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Pendataansubmit',
                'class' => "btn btn-warning btn-block"
            )
        ));


        $this->add(array(
            'name' => 't_npa',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npa',
                'class' => 'form-control',
                'required' => true,
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
                'required' => true,
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
            'type' => Select::class,
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
            'name' => 't_debitair',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_debitair',
                'class' => 'form-control',
                'required' => true,
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
                'required' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakair();',
                'onblur' => 'hitungpajakair();',
                'onkeyup' => 'hitungpajakair();',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_kompensasi',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kompensasi',
                'class' => 'form-control',
                'required' => true,
                'readonly'=> true,
                'style' => 'text-align:right',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_jmlhpajakasli',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jmlhpajakasli',
                'class' => 'form-control',
                'required' => true,
                'readonly'=> true,
                'style' => 'text-align:right',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

         $this->add(array(
            'name' => 't_idkeberatan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_idkeberatan',
                'class' => 'form-control',
               
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));

    }

}
