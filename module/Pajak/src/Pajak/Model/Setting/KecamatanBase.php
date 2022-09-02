<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class KecamatanBase implements InputFilterAwareInterface {

    public $s_idkec;
    public $s_kodekec;
    public $s_namakec;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idkec = (isset($data['s_idkec'])) ? $data['s_idkec'] : null;
        $this->s_kodekec = (isset($data['s_kodekec'])) ? $data['s_kodekec'] : null;
        $this->s_namakec = (isset($data['s_namakec'])) ? $data['s_namakec'] : null;
        
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
                'name' => 's_kodekec',
                'required' => true,
//                'filters' => array(
//                    array('name' => 'StripTags'),
//                    array('name' => 'StringTrim'),
//                ),
//                'validators' => array(
//                    new \Zend\Validator\StringLength(
//                            array(
//                        'encoding' => 'UTF-8',
//                        'min' => 3,
//                        'max' => 3
//                            )
//                    ),
//                ),
            ));
            
            $inputFilter->add(array(
                'name' => 's_namakec',
                'required' => true
            ));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
