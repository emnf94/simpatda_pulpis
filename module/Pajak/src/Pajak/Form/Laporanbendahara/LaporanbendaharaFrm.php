<?php

namespace Pajak\Form\Laporanbendahara;

use Zend\Form\Form;

class LaporanbendaharaFrm extends Form {

    public function __construct() {
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
            'name' => 't_npwpd',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_npwpd',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_nama',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nama',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_namakegiatan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namakegiatan',
                'class' => 'form-control'
            )
        ));

        $this->add(array(
            'name' => 't_nop',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_nop',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));

        $this->add(array(
            'name' => 't_namaobjek',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_namaobjek',
                'class' => 'form-control',
                'required' => true,
                'readonly' => true
            )
        ));
                
        $this->add(array(
            'name' => 't_masaawal',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaawal',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_masaakhir',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_masaakhir',
                'class' => 'bootstrap-datepicker form-control',
                'required' => true
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
            'name' => 't_dasarpengenaan',
            'type' => 'text',
            'attributes' => array(
                'id' => 't_dasarpengenaan',
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
            'name' => 'Laporansubmit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Simpan',
                'id' => 'Laporansubmit',
                'class' => "btn btn-warning btn-block"
            )
        ));
    }
}
