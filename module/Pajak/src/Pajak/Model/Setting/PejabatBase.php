<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PejabatBase implements InputFilterAwareInterface {

    public $s_idpej, $s_namapej, $s_jabatanpej, $s_pangkatpej, $s_nippej;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idpej = (isset($data['s_idpej'])) ? $data['s_idpej'] : null;
        $this->s_namapej = (isset($data['s_namapej'])) ? $data['s_namapej'] : null;
        $this->s_jabatanpej = (isset($data['s_jabatanpej'])) ? $data['s_jabatanpej'] : null;
        $this->s_pangkatpej = (isset($data['s_pangkatpej'])) ? $data['s_pangkatpej'] : null;
        $this->s_nippej = (isset($data['s_nippej'])) ? $data['s_nippej'] : null;

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
                        'name' => 's_namapej',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_jabatanpej',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_pangkatpej',
                        'required' => true
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
