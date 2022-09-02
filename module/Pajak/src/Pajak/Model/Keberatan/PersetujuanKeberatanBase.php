<?php

namespace Pajak\Model\Keberatan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PersetujuanKeberatanBase implements InputFilterAwareInterface {

    public $t_idkeberatan, $t_idwpobjek, $t_idketetapan, $t_jenisketetapan, $t_tglketetapankeberatan, 
            $t_alasankeberatan, $t_jenispajak, $t_jmlhpajak, $t_statusverifikasi, $t_tglverifikasi, $t_nilaipengurangan,
            $t_jmlhpengurangan, $t_jmlhditetapkan, $t_nomorsk;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $t_jmlhketetapanseharusnya,$t_persetujuan,$t_restitusi;
    //air
     public $t_npa,$t_lamawaktu,$t_debitair,$t_kualitasair,$t_peruntukan,$t_totalbiaya,$t_volume;
     //reklame
     public $t_jumlah, $t_jangkawaktu, $t_tipewaktu,$t_jenisreklameusaha,$t_ukuranmedia,$t_satuanukuranmedia,$t_parameter,$t_nsr;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idkeberatan = (isset($data['t_idkeberatan'])) ? $data['t_idkeberatan'] : null;
        $this->t_idwpobjek = (isset($data['t_idwpobjek'])) ? $data['t_idwpobjek'] : null;
        $this->t_idketetapan = (isset($data['t_idketetapan'])) ? $data['t_idketetapan'] : null;
        $this->t_jenisketetapan = (isset($data['t_jenisketetapan'])) ? $data['t_jenisketetapan'] : null;
        $this->t_tglketetapankeberatan = (isset($data['t_tglketetapankeberatan'])) ? $data['t_tglketetapankeberatan'] : null;
        $this->t_alasankeberatan = (isset($data['t_alasankeberatan'])) ? $data['t_alasankeberatan'] : null;
        $this->t_jenispajak = (isset($data['t_jenispajak'])) ? $data['t_jenispajak'] : null;
        $this->t_jmlhpajak = (isset($data['t_jmlhpajak'])) ? $data['t_jmlhpajak'] : null;
        $this->t_statusverifikasi = (isset($data['t_statusverifikasi'])) ? $data['t_statusverifikasi'] : null;
        $this->t_tglverifikasi = (isset($data['t_tglverifikasi'])) ? $data['t_tglverifikasi'] : null;
        $this->t_nilaipengurangan = (isset($data['t_nilaipengurangan'])) ? $data['t_nilaipengurangan'] : null;
        $this->t_jmlhpengurangan = (isset($data['t_jmlhpengurangan'])) ? $data['t_jmlhpengurangan'] : null;
        $this->t_jmlhditetapkan = (isset($data['t_jmlhditetapkan'])) ? $data['t_jmlhditetapkan'] : null;
		$this->t_nomorsk = (isset($data['t_nomorsk'])) ? $data['t_nomorsk'] : null;

        //reklame

        $this->t_jumlah = (isset($data['t_jumlah'])) ? $data['t_jumlah'] : null;
        $this->t_jangkawaktu = ($data['t_jangkawaktu'] != NULL) ? $data['t_jangkawaktu'] : null;
        $this->t_tipewaktu = ($data['t_tipewaktu'] != NULL) ? $data['t_tipewaktu'] : null;
        $this->t_jenisreklameusaha = ($data['t_jenisreklameusaha'] != NULL) ? $data['t_jenisreklameusaha'] : null;
        $this->t_nsr = ($data['t_nsr'] != NULL) ? $data['t_nsr'] : NULL;
        $this->t_satuanukuranmedia = (isset($data['t_satuanukuranmedia'])) ? $data['t_satuanukuranmedia'] : null;
        $this->t_ukuranmedia = (isset($data['t_ukuranmedia'])) ? $data['t_ukuranmedia'] : null;
        $this->t_parameter = (isset($data['t_parameter'])) ? $data['t_parameter'] : null;



        //air
        $this->t_volume = (isset($data['t_volume'])) ? $data['t_volume'] : null;
        $this->t_lamawaktu = (isset($data['t_lamawaktu'])) ? $data['t_lamawaktu'] : null;
        $this->t_debitair = (isset($data['t_debitair'])) ? $data['t_debitair'] : null;
        $this->t_kualitasair = (isset($data['t_kualitasair'])) ? $data['t_kualitasair'] : null;
        $this->t_peruntukan = (isset($data['t_peruntukan'])) ? $data['t_peruntukan'] : null;
        $this->t_totalbiaya = (isset($data['t_totalbiaya'])) ? $data['t_totalbiaya'] : null;
        $this->t_npa = (isset($data['t_npa'])) ? $data['t_npa'] : null;

        $this->t_jmlhketetapanseharusnya = (isset($data['t_jmlhketetapanseharusnya'])) ? $data['t_jmlhketetapanseharusnya'] : null;
         $this->t_persetujuan = (isset($data['t_persetujuan'])) ? $data['t_persetujuan'] : null;

        $this->page = (isset($data['page'])) ? $data['page'] : null;
        $this->direction = (isset($data['direction'])) ? $data['direction'] : null;
        $this->combocari = (isset($data['combocari'])) ? $data['combocari'] : null;
        $this->kolomcari = (isset($data['kolomcari'])) ? $data['kolomcari'] : null;
        $this->combosorting = (isset($data['combosorting'])) ? $data['combosorting'] : null;
        $this->sortasc = (isset($data['sortasc'])) ? $data['sortasc'] : null;
        $this->sortdesc = (isset($data['sortdesc'])) ? $data['sortdesc'] : null;
        $this->combooperator = (isset($data['combooperator'])) ? $data['combooperator'] : null;
        $this->s_idkorek = (isset($data['s_idkorek'])) ? $data['s_idkorek'] : null;

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

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
