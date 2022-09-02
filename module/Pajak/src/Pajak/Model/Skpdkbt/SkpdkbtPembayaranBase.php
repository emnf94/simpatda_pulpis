<?php

namespace Pajak\Model\Skpdkbt;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SkpdkbtPembayaranBase implements InputFilterAwareInterface {

    public $t_idskpdkbt, $t_tglbayarskpdkbt, $t_viabayarskpdkbt, $t_jmlhbayarskpdkbt;
    
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idskpdkbt = (isset($data['t_idskpdkbt'])) ? $data['t_idskpdkbt'] : null;
        $this->t_tglbayarskpdkbt = (isset($data['t_tglbayarskpdkbt'])) ? $data['t_tglbayarskpdkbt'] : null;
        $this->t_viabayarskpdkbt = (isset($data['t_viabayarskpdkbt'])) ? $data['t_viabayarskpdkbt'] : null;
        $this->t_jmlhbayarskpdkbt = (isset($data['t_jmlhbayarskpdkbt'])) ? $data['t_jmlhbayarskpdkbt'] : null;

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
