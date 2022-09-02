<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class KerusakanBase implements InputFilterAwareInterface {

    public $s_idkerusakan, $s_kriteria, $s_nilai;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idkerusakan = (isset($data['s_idkerusakan'])) ? $data['s_idkerusakan'] : null;
        $this->s_kriteria = (isset($data['s_kriteria'])) ? $data['s_kriteria'] : null;
        $this->s_nilai = (isset($data['s_nilai'])) ? $data['s_nilai'] : null;
       
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
            $inputFilter->add(array(
                'name' => 's_kriteria',
                'required' => true
            ));
            $inputFilter->add(array(
                'name' => 's_nilai',
                'required' => true
            ));
            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
