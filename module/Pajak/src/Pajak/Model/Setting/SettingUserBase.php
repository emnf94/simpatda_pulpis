<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SettingUserBase implements InputFilterAwareInterface {

    public $s_iduser, $s_username, $s_password, $s_akses, $s_nama, $s_jabatan, $s_nip, $s_noidentitas;
    
    public $s_main, $s_laporan, $s_pendaftaran, $s_pendataan, $s_penetapan, $s_skpdjabatan, $s_skpdkb, $s_skpdkbt;
    public $s_skpdlb, $s_skpdn, $s_pembayaran, $s_pembayarandenda, $s_rekambank, $s_penagihan, $s_pemeriksaan,
            $s_pembukuan, $s_stpdpembayaran, $s_monitoring, $s_pemda, $s_user, $s_kelurahan,
            $s_pejabat, $s_kecamatan, $s_rekening, $s_target, $s_reklame, $s_air, $s_skpdt, $s_wp, $s_perizinan, $s_pratama, $s_laporanbendahara, $s_setoranlain;
    
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_iduser = (isset($data['s_iduser'])) ? $data['s_iduser'] : null;
        $this->s_username = (isset($data['s_username'])) ? $data['s_username'] : null;
        $this->s_password = (isset($data['s_password'])) ? $data['s_password'] : null;
        $this->s_akses = (isset($data['s_akses'])) ? $data['s_akses'] : null;
        $this->s_nama = (isset($data['s_nama'])) ? $data['s_nama'] : null;
        $this->s_jabatan = (isset($data['s_jabatan'])) ? $data['s_jabatan'] : null;
        $this->s_nip = (isset($data['s_nip'])) ? $data['s_nip'] : null;
        $this->s_noidentitas = (isset($data['s_noidentitas'])) ? $data['s_noidentitas'] : null;

        $this->s_main = (isset($data['s_main'])) ? $data['s_main'] : null;
        $this->s_laporan = (isset($data['s_laporan'])) ? $data['s_laporan'] : null;
        $this->s_pendaftaran = (isset($data['s_pendaftaran'])) ? $data['s_pendaftaran'] : null;
        $this->s_pendataan = (isset($data['s_pendataan'])) ? $data['s_pendataan'] : null;
        $this->s_penetapan = (isset($data['s_penetapan'])) ? $data['s_penetapan'] : null;
        $this->s_skpdjabatan = (isset($data['s_skpdjabatan'])) ? $data['s_skpdjabatan'] : null;
        $this->s_skpdkb = (isset($data['s_skpdkb'])) ? $data['s_skpdkb'] : null;
        $this->s_skpdkbt = (isset($data['s_skpdkbt'])) ? $data['s_skpdkbt'] : null;
        $this->s_skpdlb = (isset($data['s_skpdlb'])) ? $data['s_skpdlb'] : null;
        $this->s_skpdn = (isset($data['s_skpdn'])) ? $data['s_skpdn'] : null;
        $this->s_pembayaran = (isset($data['s_pembayaran'])) ? $data['s_pembayaran'] : null;
        $this->s_pembayarandenda = (isset($data['s_pembayarandenda'])) ? $data['s_pembayarandenda'] : null;
        $this->s_rekambank = (isset($data['s_rekambank'])) ? $data['s_rekambank'] : null;
        $this->s_penagihan = (isset($data['s_penagihan'])) ? $data['s_penagihan'] : null;
        $this->s_pemeriksaan = (isset($data['s_pemeriksaan'])) ? $data['s_pemeriksaan'] : null;
        $this->s_pembukuan = (isset($data['s_pembukuan'])) ? $data['s_pembukuan'] : null;
        $this->s_stpdpembayaran = (isset($data['s_stpdpembayaran'])) ? $data['s_stpdpembayaran'] : null;
        $this->s_monitoring = (isset($data['s_monitoring'])) ? $data['s_monitoring'] : null;
        $this->s_pemda = (isset($data['s_pemda'])) ? $data['s_pemda'] : null;
        $this->s_user = (isset($data['s_user'])) ? $data['s_user'] : null;
        $this->s_kelurahan = (isset($data['s_kelurahan'])) ? $data['s_kelurahan'] : null;
        $this->s_pejabat = (isset($data['s_pejabat'])) ? $data['s_pejabat'] : null;
        $this->s_kecamatan = (isset($data['s_kecamatan'])) ? $data['s_kecamatan'] : null;
        $this->s_rekening = (isset($data['s_rekening'])) ? $data['s_rekening'] : null;
        $this->s_target = (isset($data['s_target'])) ? $data['s_target'] : null;
        $this->s_reklame = (isset($data['s_reklame'])) ? $data['s_reklame'] : null;
        $this->s_air = (isset($data['s_air'])) ? $data['s_air'] : null;
        $this->s_skpdt = (isset($data['s_skpdt'])) ? $data['s_skpdt'] : null;
        $this->s_wp = (isset($data['s_wp'])) ? $data['s_wp'] : null;
        $this->s_perizinan = (isset($data['s_perizinan'])) ? $data['s_perizinan'] : null;
        $this->s_pratama = (isset($data['s_pratama'])) ? $data['s_pratama'] : null;
        $this->s_laporanbendahara = (isset($data['s_laporanbendahara'])) ? $data['s_laporanbendahara'] : null;
        $this->s_setoranlain = (isset($data['s_setoranlain'])) ? $data['s_setoranlain'] : null;

        $this->combocari = (isset($data['combocari'])) ? $data['combocari'] : null;
        $this->kolomcari = (isset($data['kolomcari'])) ? $data['kolomcari'] : null;
        $this->combosorting = (isset($data['combosorting'])) ? $data['combosorting'] : null;
        $this->sortasc = (isset($data['sortasc'])) ? $data['sortasc'] : null;
        $this->sortdesc = (isset($data['sortdesc'])) ? $data['sortdesc'] : null;
        $this->combooperator = (isset($data['combooperator'])) ? $data['combooperator'] : null;
        $this->direction = (isset($data['direction'])) ? $data['direction'] : null;
        $this->page = (isset($data['page'])) ? $data['page'] : null;
        $this->rows = (isset($data['rows'])) ? $data['rows'] : null;
        $this->sidx = (isset($data['sidx'])) ? $data['sidx'] : null;
        $this->sord = (isset($data['sord'])) ? $data['sord'] : null;
    }

    public function getArrayCopy() {
        return get_object_vars($this);
    }

    public function setInputFilter(InputFilterInterface $inputFilter) {
        throw new \Exception("Not used");
    }

    public function getInputFilter() {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            $factory = new InputFactory();

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_jabatan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_nip',
                        'required' => false
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_main',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_laporan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pendaftaran',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pendataan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_penetapan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_skpdjabatan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_skpdkb',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_skpdkbt',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_skpdlb',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_skpdn',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_skpdt',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pembayaran',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pembayarandenda',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_rekambank',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_penagihan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pemeriksaan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pembukuan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_stpdpembayaran',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_monitoring',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pemda',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_user',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_kelurahan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pejabat',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_kecamatan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_rekening',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_target',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_reklame',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_air',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_wp',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_perizinan',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pratama',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_laporanbendahara',
                        'required' => false
            )));
            
            $this->inputFilter = $inputFilter;
        }

        return $this->inputFilter;
    }

}
