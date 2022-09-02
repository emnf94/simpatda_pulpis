<?php

namespace Pajak\Model\Angsuran;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class AngsuranBase implements InputFilterAwareInterface {

    public $t_idwpobjek, $t_idketetapan, $t_jenisketetapan, $t_tglketetapanangsuran, $t_jumlahkaliangsuran, $t_jenispajak;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idwpobjek = (isset($data['t_idwpobjek'])) ? $data['t_idwpobjek'] : null;
        $this->t_idketetapan = (isset($data['t_idketetapan'])) ? $data['t_idketetapan'] : null;
        $this->t_jenisketetapan = (isset($data['t_jenisketetapan'])) ? $data['t_jenisketetapan'] : null;
        $this->t_tglketetapanangsuran = (isset($data['t_tglketetapanangsuran'])) ? $data['t_tglketetapanangsuran'] : null;
        $this->t_jumlahkaliangsuran = (isset($data['t_jumlahkaliangsuran'])) ? $data['t_jumlahkaliangsuran'] : null;
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
