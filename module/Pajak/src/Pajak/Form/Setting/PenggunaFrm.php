<?php

namespace Pajak\Form\Setting;

use Zend\Form\Form;

class PenggunaFrm extends Form {

    public function __construct($ar_role = array(), $ar_wp = null) {
        //, $s_main = null, $s_pendaftaran = null, $s_pendataan = null, $s_penetapan = null, $s_skpdjabatan = null, $s_skpdkb = null, $s_skpdkbt = null, $s_skpdlb = null
        // , $s_skpdn = null, $s_pembayaran = null, $s_pembayarandenda = null, $s_rekambank = null, $s_penagihan = null, $s_pemeriksaan = null
        // , $s_pembukuan = null, $s_stpdpembayaran = null, $s_monitoring = null, $s_pemda = null, $s_user = null, $s_kelurahan = null, $s_pejabat = null
        // , $s_kecamatan = null, $s_rekening = null, $s_target = null, $s_reklame = null, $s_air = null, $s_skpdt = null, $s_laporan = null, $s_perizinan = null, $s_pratama = null, $s_laporanbendahara = null, $s_setoranlain
        parent::__construct();

        $this->setAttribute("method", "post");

        $this->add(array(
            'name' => 's_iduser',
            'type' => 'hidden',
        ));

        $this->add(array(
            'name' => 's_username',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_username',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 's_password',
            'type' => 'password',
            'attributes' => array(
                'class' => 'form-control',
                'id' => 's_password',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_pass2',
            'type' => 'password',
            'attributes' => array(
                'class' => 'form-control',
                'id' => 't_pass2',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 't_password_old',
            'type' => 'password',
            'attributes' => array(
                'class' => 'form-control',
                'id' => 't_password_old',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 's_nama',
            'type' => 'text',
            'attributes' => array(
                'id' => 's_nama',
                'class' => 'form-control',
                'required' => true
            )
        ));

        $this->add(array(
            'name' => 's_nip',
            'type' => 'text',
            'attributes' => array(
                'class' => 'form-control',
                'id' => 's_nip'
            )
        ));

        $this->add(array(
            'name' => 's_jabatan',
            'type' => 'text',
            'attributes' => array(
                'class' => 'form-control',
                'id' => 's_jabatan'
            )
        ));
        
        $this->add(array(
            'name' => 's_akses',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_akses',
                'class' => 'form-control',
                'required' => true,
                'onchange' => 'splitakses();'
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options' => $ar_role,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'name' => 's_wp',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => array(
                'id' => 's_wp',
                'class' => 'chosen-select',
                'onChange' => "cariobjekwp(this.value)"
            ),
            'options' => array(
                'empty_option' => 'Silahkan pilih',
                'value_options' => $ar_wp,
                'disable_inarray_validator' => true, // <-- disable
            )
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_laporan',
            'options' => array(
                'value_options' => $s_laporan,
                'label' => 'Laporan WP'
            ),
            'attributes' => array(
                'id' => 's_laporan',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_main',
            'options' => array(
                'value_options' => $s_main,
                'label' => 'Halaman Utama'
            ),
            'attributes' => array(
                'id' => 's_main',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
//            'type' => 'Zend\Form\Element\MultiCheckbox',
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_pendaftaran',
            'options' => array(
                'value_options' => $s_pendaftaran,
                'label' => 'Menu Pendaftaran',
            ),
            'attributes' => array(
                'id' => 's_pendaftaran',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_pendataan',
            'options' => array(
                'value_options' => $s_pendataan,
                'label' => 'Menu Pendataan'
            ),
            'attributes' => array(
                'id' => 's_pendataan',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_penetapan',
            'options' => array(
                'value_options' => $s_penetapan,
                'label' => 'Menu Penetapan'
            ),
            'attributes' => array(
                'id' => 's_penetapan',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_skpdjabatan',
            'options' => array(
                'value_options' => $s_skpdjabatan,
                'label' => 'Menu SKPD Jabatan'
            ),
            'attributes' => array(
                'id' => 's_skpdjabatan',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_skpdkb',
            'options' => array(
                'value_options' => $s_skpdkb,
                'label' => 'Menu SKPDKB'
            ),
            'attributes' => array(
                'id' => 's_skpdkb',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_skpdkbt',
            'options' => array(
                'value_options' => $s_skpdkbt,
                'label' => 'Menu SKPDKBT'
            ),
            'attributes' => array(
                'id' => 's_skpdkbt',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_skpdlb',
            'options' => array(
                'value_options' => $s_skpdlb,
                'label' => 'Menu SKPDLB'
            ),
            'attributes' => array(
                'id' => 's_skpdlb',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_skpdn',
            'options' => array(
                'value_options' => $s_skpdn,
                'label' => 'Menu SKPDN'
            ),
            'attributes' => array(
                'id' => 's_skpdn',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_skpdt',
            'options' => array(
                'value_options' => $s_skpdt,
                'label' => 'Menu SKPDT'
            ),
            'attributes' => array(
                'id' => 's_skpdt',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_pembayaran',
            'options' => array(
                'value_options' => $s_pembayaran,
                'label' => 'Menu Pembayaran'
            ),
            'attributes' => array(
                'id' => 's_pembayaran',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_pembayarandenda',
            'options' => array(
                'value_options' => $s_pembayarandenda,
                'label' => 'Menu Pembayaran Denda'
            ),
            'attributes' => array(
                'id' => 's_pembayarandenda',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_rekambank',
            'options' => array(
                'value_options' => $s_rekambank,
                'label' => 'Menu Rekam Bank'
            ),
            'attributes' => array(
                'id' => 's_rekambank',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));
        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_setoranlain',
            'options' => array(
                'value_options' => $s_setoranlain,
                'label' => 'Menu Entry Setoran Lain-lain'
            ),
            'attributes' => array(
                'id' => 's_setoranlain',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_penagihan',
            'options' => array(
                'value_options' => $s_penagihan,
                'label' => 'Menu Penagihan'
            ),
            'attributes' => array(
                'id' => 's_penagihan',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_pemeriksaan',
            'options' => array(
                'value_options' => $s_pemeriksaan,
                'label' => 'Menu Pemeriksaan'
            ),
            'attributes' => array(
                'id' => 's_pemeriksaan',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_pembukuan',
            'options' => array(
                'value_options' => $s_pembukuan,
                'label' => 'Menu Pembukuan Dan Pelaporan'
            ),
            'attributes' => array(
                'id' => 's_pembukuan',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_stpdpembayaran',
            'options' => array(
                'value_options' => $s_stpdpembayaran,
                'label' => 'Menu STPD Pembayaran'
            ),
            'attributes' => array(
                'id' => 's_stpdpembayaran',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_monitoring',
            'options' => array(
                'value_options' => $s_monitoring,
                'label' => 'Menu Transaction Story'
            ),
            'attributes' => array(
                'id' => 's_monitoring',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_pemda',
            'options' => array(
                'value_options' => $s_pemda,
                'label' => 'Menu Setting Pemda'
            ),
            'attributes' => array(
                'id' => 's_pemda',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_user',
            'options' => array(
                'value_options' => $s_user,
                'label' => 'Menu Setting User'
            ),
            'attributes' => array(
                'id' => 's_user',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_kelurahan',
            'options' => array(
                'value_options' => $s_kelurahan,
                'label' => 'Menu Setting Kelurahan'
            ),
            'attributes' => array(
                'id' => 's_kelurahan',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_pejabat',
            'options' => array(
                'value_options' => $s_pejabat,
                'label' => 'Menu Setting Pejabat'
            ),
            'attributes' => array(
                'id' => 's_pejabat',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_kecamatan',
            'options' => array(
                'value_options' => $s_kecamatan,
                'label' => 'Menu Setting Kecamatan'
            ),
            'attributes' => array(
                'id' => 's_kecamatan',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_rekening',
            'options' => array(
                'value_options' => $s_rekening,
                'label' => 'Menu Setting Rekening'
            ),
            'attributes' => array(
                'id' => 's_rekening',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_target',
            'options' => array(
                'value_options' => $s_target,
                'label' => 'Menu Setting Target'
            ),
            'attributes' => array(
                'id' => 's_target',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_reklame',
            'options' => array(
                'value_options' => $s_reklame,
                'label' => 'Menu Setting Reklame'
            ),
            'attributes' => array(
                'id' => 's_reklame',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_air',
            'options' => array(
                'value_options' => $s_air,
                'label' => 'Menu Setting Air Bawah Tanah'
            ),
            'attributes' => array(
                'id' => 's_air',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_perizinan',
            'options' => array(
                'value_options' => $s_perizinan,
                'label' => 'Menu Perizinan'
            ),
            'attributes' => array(
                'id' => 's_perizinan',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_pratama',
            'options' => array(
                'value_options' => $s_pratama,
                'label' => 'Menu KPP PRATAMA'
            ),
            'attributes' => array(
                'id' => 's_pratama',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 's_laporanbendahara',
            'options' => array(
                'value_options' => $s_laporanbendahara,
                'label' => 'Menu Bendahara Dinas'
            ),
            'attributes' => array(
                'id' => 's_laporanbendahara',
                'class' => 'multi-select',
                'multiple' => 'multiple'
            ),
        ));

        $this->add(array(
            'type' => 'submit',
            'name' => 'simpan',
            'attributes' => array(
                'value' => 'Simpan',
                'class' => 'btn btn-primary'
            ),
        ));
    }

}
