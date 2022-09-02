<?php

namespace Pajak\Model\Pendataan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class DetailreklameBase implements InputFilterAwareInterface
{

    public $t_iddetailreklame, $t_idtransaksi, $t_jenisreklame,
        $t_naskah, $t_lokasi, $t_panjang, $t_lebar, $t_tinggi, $t_tarifreklame;
    public $t_jumlah, $t_jangkawaktu, $t_tipewaktu, $t_jenisreklameusaha, $t_kelasjalan, $t_ukuranmedia, $t_satuanukuranmedia, $t_parameter, $t_jenistarif, $t_idlokasi, $t_tarifpajak, $t_jmlhpajakasli;

    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data)
    {
        $this->t_iddetailreklame = (isset($data['t_iddetailreklame'])) ? $data['t_iddetailreklame'] : null;
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_jenisreklame = ($data['t_jenisreklame'] != NULL) ? $data['t_jenisreklame'] : null;
        $this->t_naskah = (isset($data['t_naskah'])) ? $data['t_naskah'] : null;
        $this->t_lokasi = (isset($data['t_lokasi'])) ? $data['t_lokasi'] : null;
        $this->t_panjang = ($data['t_panjang'] != NULL) ? $data['t_panjang'] : null;
        $this->t_lebar = ($data['t_lebar'] != NULL) ? $data['t_lebar'] : null;
        $this->t_luas = ($data['t_luas'] != NULL) ? $data['t_luas'] : null;
        $this->t_tinggi = (isset($data['t_tinggi'])) ? $data['t_tinggi'] : null;
        $this->t_tarifreklame = (isset($data['t_tarifreklame'])) ? $data['t_tarifreklame'] : null;
        $this->t_jumlah = (isset($data['t_jumlah'])) ? $data['t_jumlah'] : null;
        $this->t_jangkawaktu = ($data['t_jangkawaktu'] != NULL) ? $data['t_jangkawaktu'] : null;
        $this->t_tipewaktu = ($data['t_tipewaktu'] != NULL) ? $data['t_tipewaktu'] : null;
        $this->t_jenisreklameusaha = ($data['t_jenisreklameusaha'] != NULL) ? $data['t_jenisreklameusaha'] : null;
        $this->t_sudutpandang = ($data['t_sudutpandang'] != NULL) ? $data['t_sudutpandang'] : null;
        $this->t_nsr = ($data['t_nsr'] != NULL) ? $data['t_nsr'] : NULL;
        $this->t_jmlhpajakasli = ($data['t_jmlhpajakasli'] != NULL) ? $data['t_jmlhpajakasli'] : NULL;
        $this->t_kompensasi = ($data['t_kompensasi'] != NULL) ? $data['t_kompensasi'] : NULL;

        $this->t_satuanukuranmedia = (isset($data['t_satuanukuranmedia'])) ? $data['t_satuanukuranmedia'] : null;
        $this->t_kelasjalan = (isset($data['t_kelasjalan'])) ? $data['t_kelasjalan'] : null;
        $this->t_ukuranmedia = (isset($data['t_ukuranmedia'])) ? $data['t_ukuranmedia'] : null;
        $this->t_parameter = (isset($data['t_parameter'])) ? $data['t_parameter'] : null;
        $this->t_idlokasi = (isset($data['t_idlokasi'])) ? $data['t_idlokasi'] : null;
        $this->t_tarifpajak = (isset($data['t_tarifpajak'])) ? $data['t_tarifpajak'] : null;


        $this->rows = (isset($data['rows'])) ? $data['rows'] : null;
        $this->sidx = (isset($data['sidx'])) ? $data['sidx'] : null;
        $this->sord = (isset($data['sord'])) ? $data['sord'] : null;
        $this->s_masa = (isset($data['s_masa'])) ? $data['s_masa'] : null;
        $this->page = (isset($data['page'])) ? $data['page'] : null;
        $this->direction = (isset($data['direction'])) ? $data['direction'] : null;
        $this->combocari = (isset($data['combocari'])) ? $data['combocari'] : null;
        $this->kolomcari = (isset($data['kolomcari'])) ? $data['kolomcari'] : null;
        $this->combosorting = (isset($data['combosorting'])) ? $data['combosorting'] : null;
        $this->sortasc = (isset($data['sortasc'])) ? $data['sortasc'] : null;
        $this->sortdesc = (isset($data['sortdesc'])) ? $data['sortdesc'] : null;
        $this->combooperator = (isset($data['combooperator'])) ? $data['combooperator'] : null;
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

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }
}
