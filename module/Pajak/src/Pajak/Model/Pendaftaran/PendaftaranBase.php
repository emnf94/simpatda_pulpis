<?php

namespace Pajak\Model\Pendaftaran;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PendaftaranBase implements InputFilterAwareInterface
{

    public $t_idwp, $t_tgldaftar, $t_jenispendaftaran, $t_bidangusaha, $t_nopendaftaran, $t_nik, $t_nama, $t_alamat, $t_rt, $t_rw, $t_kelurahan, $t_kecamatan, $t_kabupaten;
    public $t_notelp, $t_email, $t_kodepos, $t_photowp;

    public $t_nama_badan, $t_jalan_badan, $t_rt_badan, $t_rw_badan, $t_kelurahan_badan, $t_kecamatan_badan, $t_kabupaten_badan;

    public  $t_status_wp, $t_tgl_tutup, $t_ket_tutup, $t_noberita;
    public  $t_tgl_buka, $t_ket_buka, $t_noberita_buka;

    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data)
    {
        $this->t_idwp = (isset($data['t_idwp'])) ? $data['t_idwp'] : null;
        $this->t_tgldaftar = (isset($data['t_tgldaftar'])) ? $data['t_tgldaftar'] : null;
        $this->t_jenispendaftaran = (isset($data['t_jenispendaftaran'])) ? $data['t_jenispendaftaran'] : null;
        $this->t_bidangusaha = (isset($data['t_bidangusaha'])) ? $data['t_bidangusaha'] : null;
        $this->t_nopendaftaran = (isset($data['t_nopendaftaran'])) ? $data['t_nopendaftaran'] : null;
        $this->t_nik = (isset($data['t_nik'])) ? $data['t_nik'] : null;
        $this->t_nama = (isset($data['t_nama'])) ? $data['t_nama'] : null;
        $this->t_alamat = (isset($data['t_alamat'])) ? $data['t_alamat'] : null;
        $this->t_rt = (isset($data['t_rt'])) ? $data['t_rt'] : null;
        $this->t_rw = (isset($data['t_rw'])) ? $data['t_rw'] : null;
        $this->t_kelurahan = (isset($data['t_kelurahan'])) ? $data['t_kelurahan'] : null;
        $this->t_kecamatan = (isset($data['t_kecamatan'])) ? $data['t_kecamatan'] : null;
        $this->t_kabupaten = (isset($data['t_kabupaten'])) ? $data['t_kabupaten'] : null;
        $this->t_notelp = (isset($data['t_notelp'])) ? $data['t_notelp'] : null;
        $this->t_email = (isset($data['t_email'])) ? $data['t_email'] : null;
        $this->t_kodepos = (isset($data['t_kodepos'])) ? $data['t_kodepos'] : null;
        $this->t_photowp = (isset($data['t_photowp'])) ? $data['t_photowp'] : null;

        $this->t_nama_badan = (isset($data['t_nama_badan'])) ? $data['t_nama_badan'] : null;
        $this->t_jalan_badan = (isset($data['t_jalan_badan'])) ? $data['t_jalan_badan'] : null;
        $this->t_rt_badan = (isset($data['t_rt_badan'])) ? $data['t_rt_badan'] : null;
        $this->t_rw_badan = (isset($data['t_rw_badan'])) ? $data['t_rw_badan'] : null;
        $this->t_kelurahan_badan = (isset($data['t_kelurahan_badan'])) ? $data['t_kelurahan_badan'] : null;
        $this->t_kecamatan_badan = (isset($data['t_kecamatan_badan'])) ? $data['t_kecamatan_badan'] : null;
        $this->t_kabupaten_badan = (isset($data['t_kabupaten_badan'])) ? $data['t_kabupaten_badan'] : null;

        $this->t_status_wp = (isset($data['t_status_wp'])) ? $data['t_status_wp'] : null;
        $this->t_tgl_tutup = (isset($data['t_tgl_tutup'])) ? $data['t_tgl_tutup'] : null;
        $this->t_ket_tutup = (isset($data['t_ket_tutup'])) ? $data['t_ket_tutup'] : null;
        $this->t_noberita = (isset($data['t_noberita'])) ? $data['t_noberita'] : null;
        $this->t_tgl_buka = (isset($data['t_tgl_buka'])) ? $data['t_tgl_buka'] : null;
        $this->t_ket_buka = (isset($data['t_ket_buka'])) ? $data['t_ket_buka'] : null;
        $this->t_noberita_buka = (isset($data['t_noberita_buka'])) ? $data['t_noberita_buka'] : null;

        $this->page = (isset($data['page'])) ? $data['page'] : null;
        $this->direction = (isset($data['direction'])) ? $data['direction'] : null;
        $this->combocari = (isset($data['combocari'])) ? $data['combocari'] : null;
        $this->kolomcari = (isset($data['kolomcari'])) ? $data['kolomcari'] : null;
        $this->combosorting = (isset($data['combosorting'])) ? $data['combosorting'] : null;
        $this->sortasc = (isset($data['sortasc'])) ? $data['sortasc'] : null;
        $this->sortdesc = (isset($data['sortdesc'])) ? $data['sortdesc'] : null;
        $this->combooperator = (isset($data['combooperator'])) ? $data['combooperator'] : null;

        $this->rows = (isset($data['rows'])) ? $data['rows'] : null;
        $this->sidx = (isset($data['sidx'])) ? $data['sidx'] : null;
        $this->sord = (isset($data['sord'])) ? $data['sord'] : null;
    }

    public function getArrayCopy()
    {
        return get_object_vars($this);
    }

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }

    public function getInputFilter()
    {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            $factory = new InputFactory();

            $inputFilter->add($factory->createInput(array(
                'name' => 't_nama',
                'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                'name' => 't_nama_badan',
                'required' => FALSE
            )));

            $inputFilter->add($factory->createInput(array(
                'name' => 't_alamat_badan',
                'required' => FALSE
            )));

            $inputFilter->add($factory->createInput(array(
                'name' => 't_rt_badan',
                'required' => FALSE
            )));

            $inputFilter->add($factory->createInput(array(
                'name' => 't_rw_badan',
                'required' => FALSE
            )));

            $inputFilter->add($factory->createInput(array(
                'name' => 't_kecamatan_badan',
                'required' => FALSE
            )));

            $inputFilter->add($factory->createInput(array(
                'name' => 't_kelurahan_badan',
                'required' => FALSE
            )));

            $inputFilter->add($factory->createInput(array(
                'name' => 't_kabupaten_badan',
                'required' => FALSE
            )));



            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }
}
