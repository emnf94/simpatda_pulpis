<?php

namespace Pajak\Model\Pembatalan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PembatalanBase implements InputFilterAwareInterface {

    public $t_idpembatalan, $t_nopembatalan ,$t_idketetapan, $t_jenispajak, $t_jenisketetapan, $t_tglpembatalan, $t_jampembatalan, $t_disposisi, $t_petugaslapangan, $t_alasan;
    public $t_operatorpembatalan, $t_tglinputpembatalan;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idpembatalan = (isset($data['t_idpembatalan'])) ? $data['t_idpembatalan'] : null;
        $this->t_nopembatalan = (isset($data['t_nopembatalan'])) ? $data['t_nopembatalan'] : null;
        $this->t_idketetapan = (isset($data['t_idketetapan'])) ? $data['t_idketetapan'] : null;
        $this->t_jenispajak = (isset($data['t_jenispajak'])) ? $data['t_jenispajak'] : null;
        $this->t_jenisketetapan = (isset($data['t_jenisketetapan'])) ? $data['t_jenisketetapan'] : null;
        $this->t_tglpembatalan = (isset($data['t_tglpembatalan'])) ? $data['t_tglpembatalan'] : null;
        $this->t_jampembatalan = (isset($data['t_jampembatalan'])) ? $data['t_jampembatalan'] : null;
        $this->t_disposisi = (isset($data['t_disposisi'])) ? $data['t_disposisi'] : null;
        $this->t_petugaslapangan = (isset($data['t_petugaslapangan'])) ? $data['t_petugaslapangan'] : null;
        $this->t_alasan = (isset($data['t_alasan'])) ? $data['t_alasan'] : null;
        $this->t_operatorpembatalan = (isset($data['t_operatorpembatalan'])) ? $data['t_operatorpembatalan'] : null;
        $this->t_tglinputpembatalan = (isset($data['t_tglinputpembatalan'])) ? $data['t_tglinputpembatalan'] : null;

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
