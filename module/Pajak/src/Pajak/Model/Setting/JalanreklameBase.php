<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class JalanreklameBase implements InputFilterAwareInterface {

    public $id_jlnreklame;
    public $kd_jlnreklame;
    public $nama_jlnreklame;
    public $id_zona_reklame, $s_idkec, $s_idkel;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->id_jlnreklame = (isset($data['id_jlnreklame'])) ? $data['id_jlnreklame'] : null;
        $this->kd_jlnreklame = (isset($data['kd_jlnreklame'])) ? $data['kd_jlnreklame'] : null;
        $this->nama_jlnreklame = (isset($data['nama_jlnreklame'])) ? $data['nama_jlnreklame'] : null;
        $this->id_zona_reklame = (isset($data['id_zona_reklame'])) ? $data['id_zona_reklame'] : null;
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
                        'name' => 'kd_jlnreklame',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 'nama_jlnreklame',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 'id_zona_reklame',
                        'required' => true
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
