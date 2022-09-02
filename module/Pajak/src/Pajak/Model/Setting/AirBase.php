<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class AirBase implements InputFilterAwareInterface {

    public $s_idtarif, $s_idzona, $s_idkelompok, $s_kodejenis, $s_nilai1, $s_nilai2, $s_nilai3, $s_nilai4, $s_nilai5, $s_nilai6, $s_nilai7;

    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idtarif = (isset($data['s_idtarif'])) ? $data['s_idtarif'] : null;
        $this->s_idzona = (isset($data['s_idzona'])) ? $data['s_idzona'] : null;
        $this->s_idkelompok = (isset($data['s_idkelompok'])) ? $data['s_idkelompok'] : null;
        $this->s_kodejenis = (isset($data['s_kodejenis'])) ? $data['s_kodejenis'] : null;
        $this->s_nilai1 = (isset($data['s_nilai1'])) ? $data['s_nilai1'] : null;
        $this->s_nilai2 = (isset($data['s_nilai2'])) ? $data['s_nilai2'] : null;
        $this->s_nilai3 = (isset($data['s_nilai3'])) ? $data['s_nilai3'] : null;
        $this->s_nilai4 = (isset($data['s_nilai4'])) ? $data['s_nilai4'] : null;
        $this->s_nilai5 = (isset($data['s_nilai5'])) ? $data['s_nilai5'] : null;
        $this->s_nilai6 = (isset($data['s_nilai6'])) ? $data['s_nilai6'] : null;
        $this->s_nilai7 = (isset($data['s_nilai7'])) ? $data['s_nilai7'] : null;
        
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

//            $inputFilter->add(array(
//                'name' => 's_peruntukan',
//                'required' => true,
////                'filters' => array(
////                    array('name' => 'StripTags'),
////                    array('name' => 'StringTrim'),
////                ),
////                'validators' => array(
////                    new \Zend\Validator\StringLength(
////                            array(
////                        'encoding' => 'UTF-8',
////                        'min' => 3,
////                        'max' => 3
////                            )
////                    ),
////                ),
//            ));
//            
//            $inputFilter->add(array(
//                'name' => 's_nilai1',
//                'required' => true
//            ));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
