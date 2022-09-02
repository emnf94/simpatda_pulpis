<?php

namespace Pajak\Model\Laporan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class LaporanBase implements InputFilterAwareInterface {

    public $t_idtransaksi, $t_idobjek, $t_jenispajak, $t_periodepajak, $t_tglpendataan, $t_masapajak, $t_idkorek;
    public $t_dasarpengenaan, $t_tarifpajak, $t_jmlhpajak;
    
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_idobjek = (isset($data['t_idobjek'])) ? $data['t_idobjek'] : null;
        $this->t_jenispajak = (isset($data['t_jenispajak'])) ? $data['t_jenispajak'] : null;
        $this->t_nourut = (isset($data['t_nourut'])) ? $data['t_nourut'] : null;
        $this->t_periodepajak = (isset($data['t_periodepajak'])) ? $data['t_periodepajak'] : null;
        $this->t_tglpendataan = (isset($data['t_tglpendataan'])) ? $data['t_tglpendataan'] : null;
        $this->t_masapajak = (isset($data['t_masapajak'])) ? $data['t_masapajak'] : null;
        $this->t_idkorek = (isset($data['t_idkorek'])) ? $data['t_idkorek'] : null;
        $this->t_dasarpengenaan = (isset($data['t_dasarpengenaan'])) ? $data['t_dasarpengenaan'] : null;
        $this->t_tarifpajak = (isset($data['t_tarifpajak'])) ? $data['t_tarifpajak'] : null;
        $this->t_jmlhpajak = (isset($data['t_jmlhpajak'])) ? $data['t_jmlhpajak'] : null;

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
