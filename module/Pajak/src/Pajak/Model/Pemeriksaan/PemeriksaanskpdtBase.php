<?php

namespace Pajak\Model\Pemeriksaan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PemeriksaanskpdtBase implements InputFilterAwareInterface {

    public $t_idpemeriksaan, $t_idtransaksi, $t_tarifpajak, $t_nopemeriksaan, $t_periodepemeriksaan, $t_tglpemeriksaan, $t_dasarrevisi, $t_selisihdasar, $t_jmlhbln, $t_tarifpersen;
    public $t_jmlhdendapemeriksaan, $t_jmlhpajakseharusnya, $t_jmlhpajakpemeriksaan, $t_totalpemeriksaan, $t_jeniskenaikan, $t_tarifkenaikan, $t_jmlhkenaikan;
    public $t_jenispajak;
    
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idpemeriksaan = (isset($data['t_idpemeriksaan'])) ? $data['t_idpemeriksaan'] : null;
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_tarifpajak = (isset($data['t_tarifpajak'])) ? $data['t_tarifpajak'] : null;
        $this->t_nopemeriksaan = (isset($data['t_nopemeriksaan'])) ? $data['t_nopemeriksaan'] : null;
        $this->t_periodepemeriksaan = (isset($data['t_periodepemeriksaan'])) ? $data['t_periodepemeriksaan'] : null;
        $this->t_tglpemeriksaan = (isset($data['t_tglpemeriksaan'])) ? $data['t_tglpemeriksaan'] : null;
        $this->t_dasarrevisi = (isset($data['t_dasarrevisi'])) ? $data['t_dasarrevisi'] : null;
        $this->t_selisihdasar = (isset($data['t_selisihdasar'])) ? $data['t_selisihdasar'] : null;
        $this->t_jmlhbln = (isset($data['t_jmlhbln'])) ? $data['t_jmlhbln'] : null;
        $this->t_tarifpersen = (isset($data['t_tarifpersen'])) ? $data['t_tarifpersen'] : null;
        $this->t_jeniskenaikan = (isset($data['t_jeniskenaikan'])) ? $data['t_jeniskenaikan'] : null;
        $this->t_tarifkenaikan = (isset($data['t_tarifkenaikan'])) ? $data['t_tarifkenaikan'] : null;
        $this->t_jmlhkenaikan = (isset($data['t_jmlhkenaikan'])) ? $data['t_jmlhkenaikan'] : null;
        $this->t_jmlhdendapemeriksaan = (isset($data['t_jmlhdendapemeriksaan'])) ? $data['t_jmlhdendapemeriksaan'] : null;
        $this->t_jmlhpajakseharusnya = (isset($data['t_jmlhpajakseharusnya'])) ? $data['t_jmlhpajakseharusnya'] : null;
        $this->t_jmlhpajakpemeriksaan = (isset($data['t_jmlhpajakpemeriksaan'])) ? $data['t_jmlhpajakpemeriksaan'] : null;
        $this->t_totalpemeriksaan = (isset($data['t_totalpemeriksaan'])) ? $data['t_totalpemeriksaan'] : null;
        $this->t_jenispajak = (isset($data['t_jenispajak'])) ? $data['t_jenispajak'] : null;

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
