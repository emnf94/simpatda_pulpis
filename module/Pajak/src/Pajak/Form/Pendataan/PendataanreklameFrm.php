<?php

namespace Pajak\Form\Pendataan;

use Zend\Form\Form;

class PendataanreklameFrm extends Form
{

    public function __construct()
    {
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
            'name' => 't_iddetailreklame',
            'type' => 'hidden',
            'attributes' => array(
                'id' => 't_iddetailreklame',
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
            'name' => 't_nspr',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nspr',
                'class' => 'form-control',
                'readonly' => true,
                'onchange' => 'hitungpajakreklame();',
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_njopr',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_njopr',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakreklame();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakreklame();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakreklame();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));
        $this->add(array(
            'name' => 't_nsppr',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nsppr',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
                'onchange' => 'hitungpajakreklame();this.value = formatCurrency(this.value);',
                'onblur' => 'hitungpajakreklame();this.value = formatCurrency(this.value);',
                'onkeyup' => 'hitungpajakreklame();this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_nsr',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nsr',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right'
            )
        ));

        $this->add(array(
            'name' => 't_njopr',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_njopr',
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
                'value' => date('Y')
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
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:left',
                'onchange' => 'hitungjangkawaktu();',
            )
        ));

        $this->add(array(
            'name' => 't_masaakhir',
            'type' => 'text',

            'attributes' => array(
                'id' => 't_masaakhir',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true,
                'style' => 'text-align:left',
                'onchange' => 'hitungjangkawaktu();',
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
            'name' => 't_jenisreklame',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenisreklame',
                'class' => 'form-control',
                'onchange' => 'carirekeningreklame();cariukuranmedia();carikelasjalan();'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_jenisrek,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_kodekawasan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_kodekawasan',
                'class' => 'form-control',
                'required' => true,
                //'onchange' => 'getlokasi();'
                'onchange' => 'getCombokawasan();'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    1 => 'Strategis',
                    2 => 'Sedang',
                    3 => 'Lainya',


                ],
            )
        ));


        $this->add(array(
            'name' => 't_lokasi_kawasan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_lokasi_kawasan',
                'class' => 'form-control',
                'required' => true,
                'onchange' => 'getComboJenisReklame();'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_jalan,
                'disable_inarray_validator' => true, // <-- disable
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
                    //                    1 => 'Identitas Usaha',
                    '1' => '15% Produk Usaha (Rokok)',
                    '2' => '20% Lainya',
                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_bentukreklame',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_bentukreklame',
                'class' => 'form-control',
                'onchange' => 'hitungpajakreklame();'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    //                    1 => 'Identitas Usaha',
                    1 => '1 || Satu Muka',
                    2 => '2 || Dua Muka',
                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_naskah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_naskah',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_lokasi',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_lokasi',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_panjang',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_panjang',
                'class' => 'form-control',
                //'required' => true,
                'value' => 0,
                'onchange' => 'hitungpajakreklame();'
            )
        ));

        $this->add(array(
            'name' => 't_lebar',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_lebar',
                'class' => 'form-control',
                //'required' => true,
                'value' => 0,
                'onchange' => 'hitungpajakreklame();'
            )
        ));

        $this->add(array(
            'name' => 't_luas',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_luas',
                'class' => 'form-control',
                //'required' => true,
                'readonly' => true,
                'onchange' => 'hitungpajakreklame();'
            )
        ));

        $this->add(array(
            'name' => 't_tinggi',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tinggi',
                'class' => 'form-control',
                'required' => true,
                'onchange' => 'hitungpajakreklame();'
            )
        ));

        $this->add(array(
            'name' => 't_arah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_arah',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_sudutpandang',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_sudutpandang',
                'class' => 'form-control',
                'onchange' => 'hitungpajakreklame();'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => null,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_jumlah',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlah',
                'class' => 'form-control',
                'required' => true,
                'value' => 1,
                'onchange' => 'hitungpajakreklame();',
                'onkeypress' => 'return hanyaAngka(event)'
            )
        ));

        $this->add(array(
            'name' => 't_jangkawaktu',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jangkawaktu',
                'class' => 'form-control',
                'value' => 0,
                'readonly' => true,
                'onchange' => 'hitungpajakreklame();'
            )
        ));

        $this->add(array(
            'name' => 't_tarifreklame',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarifreklame',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));
        $this->add(array(
            'name' => 's_masa',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_masa',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'readonly' => true,
                'onKeyPress' => "hitungpajakreklame();",
                'onChange' => 'hitungpajakreklame();',
                'onBlur' => 'hitungpajakreklame();',
                'onkeyup' => 'hitungpajakreklame();'

            )
        ));


        $this->add(array(
            'name' => 't_klasifikasi_jalan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_klasifikasi_jalan',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',

                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_kelasjalan',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_kelasjalan',
                'class' => 'form-control',
                'onchange' => 'getformrekomendasi();',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    '1' => 'Utama',
                    '2' => 'A',
                    '3' => 'B',
                    '4' => 'C',
                    '5' => 'Insidentil',
                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_wilayah',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_wilayah',
                'class' => 'form-control',
                'onchange' => 'hitungpajakreklame();'
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_zona,
                'disable_inarray_validator' => true, // <-- disable
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
            'name' => 't_tglpenetapan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tglpenetapan',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_idlokasi',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_idlokasi',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_jalan,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_tipewaktu',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_tipewaktu',
                'class' => 'form-control',
                'onchange' => 'hitungjangkawaktu();hitungpajakreklame(a);',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    '1' => 'Tahun',
                    '2' => 'Bulan',
                    '3' => 'Hari',
                    '4' => 'Satu Kali',
                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_ukuranmedia',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_ukuranmedia',
                'class' => 'form-control',
                'onchange' => 'hitungpajakreklame();',
                'required' => true,
                'readonly' => true
            ),
            'options' => array(

                // 'value_options' => $comboid_rangeukuran,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_satuanukuranmedia',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_satuanukuranmedia',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                'disable_inarray_validator' => true, // <-- disable
            )
        ));


        $this->add(array(
            'name' => 't_sisi',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_sisi',
                'class' => 'form-control',
            ),
            'options' => array(
                'value_options' => [
                    '1' => 'Satu',
                    '2' => 'Dua',
                    '3' => 'Tiga',
                    '4' => 'Empat',
                ],
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 't_jenistarif',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_jenistarif',
                'onchange' => 'gettarifreklame();',
                'class' => 'form-control',
                'required' => true
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => [
                    '1' => 'Rokok',
                    '2' => 'Lainya',
                ],
                'disable_inarray_validator' => true,
            )
        ));

        $this->add(array(
            'name' => 't_parameter',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_parameter',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_totalpajak',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_totalpajak',
                'class' => 'form-control',
                'required' => true,
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
                'required' => true,
                'style' => 'text-align:right',
                // 'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_idkeberatan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_idkeberatan',
                'class' => 'form-control',
                'required' => true,
                'style' => 'text-align:right',
                'readonly' => true
            )
        ));


        $this->add(array(
            'name' => 't_kompensasi',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_kompensasi',
                'class' => 'form-control',

                'readonly' => true,
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
                'readonly' => true,
                'style' => 'text-align:right',
                'onKeyPress' => "return numbersonly(this, event);",
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
    }
}
