<?php

namespace Pajak\Form\Pendataan;

use Zend\Form\Form;

class PendataanairprogresivFrm extends Form {

    public function __construct($comboid_peruntukan = null) {
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
            'name' => 't_peruntukanair',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 't_peruntukanair',
                'class' => 'form-control',
                'required' => true,
            ),
            'options' => array(
                'empty_option' => 'Silahkan Pilih',
                'value_options' => $comboid_peruntukan,
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
                'onchange' => 'this.value = formatCurrency(this.value);',
                'onblur' => 'this.value = formatCurrency(this.value);',
                'onkeyup' => 'this.value = formatCurrency(this.value);',
                'onKeyPress' => "return numbersonly(this, event);",
            )
        ));

        $this->add(array(
            'name' => 't_volumeair0',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volumeair0',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_hargadasar0',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hargadasar0',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_tarif0',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarif0',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_jumlah0',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlah0',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_volumeair1',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volumeair1',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_hargadasar1',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hargadasar1',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_tarif1',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarif1',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_jumlah1',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlah1',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_volumeair2',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volumeair2',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_hargadasar2',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hargadasar2',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_tarif2',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarif2',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_jumlah2',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlah2',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_volumeair3',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volumeair3',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_hargadasar3',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hargadasar3',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_tarif3',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarif3',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_jumlah3',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlah3',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_volumeair4',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volumeair4',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_hargadasar4',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hargadasar4',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_tarif4',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarif4',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_jumlah4',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlah4',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_volumeair5',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_volumeair5',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_hargadasar5',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_hargadasar5',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_tarif5',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_tarif5',
                'class' => 'form-control',
                'readonly' => true,
                'style' => 'text-align:right',
            )
        ));

        $this->add(array(
            'name' => 't_jumlah5',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_jumlah5',
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
                'class' => 'form-control',
                'required' => true
            )
        ));
        
        $this->add(array(
            'name' => 'byms_jumlahsumurairtanah',
            'type' => 'text',
            'attributes' => array(
                'id' => 'byms_jumlahsumurairtanah',
                'class' => 'form-control',
                //'required' => true
            )
        ));

        $this->add(array(
            'name' => 'Pendataansubmit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Pendataansubmit',
                'class' => "btn btn-success btn-sm"
            )
        ));
    }

}
