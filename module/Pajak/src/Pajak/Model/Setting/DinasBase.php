<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class DinasBase implements InputFilterAwareInterface {

    public $s_iddinas, $s_kodedinas, $s_namadinas, $jalan_dinas, $s_idkec, $s_idkel;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_iddinas = (isset($data['s_iddinas'])) ? $data['s_iddinas'] : null;
        $this->s_kodedinas = (isset($data['s_kodedinas'])) ? $data['s_kodedinas'] : null;
        $this->s_namadinas = (isset($data['s_namadinas'])) ? $data['s_namadinas'] : null;
        $this->jalan_dinas = (isset($data['jalan_dinas'])) ? $data['jalan_dinas'] : null;
        $this->s_idkec = (isset($data['s_idkec'])) ? $data['s_idkec'] : null;
        $this->s_idkel = (isset($data['s_idkel'])) ? $data['s_idkel'] : null;

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
                        'name' => 's_kodedinas',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_namadinas',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 'jalan_dinas',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_idkec',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_idkel',
                        'required' => true
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
