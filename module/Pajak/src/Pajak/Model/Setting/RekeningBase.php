<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class RekeningBase implements InputFilterAwareInterface {

    public $s_idkorek, $s_jenisobjek, $s_tipekorek, $s_kelompokkorek, $s_jeniskorek, $s_objekkorek, $s_rinciankorek, $s_sub1korek, $s_sub2korek, $s_sub3korek;
    public $s_namakorek, $s_persentarifkorek, $s_tarifdasarkorek, $s_voldasarkorek, $s_tariftambahkorek, $s_tglawalkorek, $s_tglakhirkorek;
    // public $s_idzona, $s_namazona;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idkorek = (isset($data['s_idkorek'])) ? $data['s_idkorek'] : null;
        $this->s_jenisobjek = (isset($data['s_jenisobjek'])) ? $data['s_jenisobjek'] : null;
        $this->s_tipekorek = (isset($data['s_tipekorek'])) ? $data['s_tipekorek'] : null;
        $this->s_kelompokkorek = (isset($data['s_kelompokkorek'])) ? $data['s_kelompokkorek'] : null;
        $this->s_jeniskorek = (isset($data['s_jeniskorek'])) ? $data['s_jeniskorek'] : null;
        $this->s_objekkorek = (isset($data['s_objekkorek'])) ? $data['s_objekkorek'] : null;
        $this->s_rinciankorek = (isset($data['s_rinciankorek'])) ? $data['s_rinciankorek'] : null;
        $this->s_sub1korek = (isset($data['s_sub1korek'])) ? $data['s_sub1korek'] : null;
        $this->s_sub2korek = (isset($data['s_sub2korek'])) ? $data['s_sub2korek'] : null;
        $this->s_sub3korek = (isset($data['s_sub3korek'])) ? $data['s_sub3korek'] : null;
        $this->s_namakorek = (isset($data['s_namakorek'])) ? $data['s_namakorek'] : null;
        $this->s_persentarifkorek = ($data['s_persentarifkorek']!=NULL) ? $data['s_persentarifkorek'] : null;
        $this->s_tarifdasarkorek = ($data['s_tarifdasarkorek']!=NULL) ? $data['s_tarifdasarkorek'] : null;
        $this->s_voldasarkorek = ($data['s_voldasarkorek']!=NULL) ? $data['s_voldasarkorek'] : null;
        $this->s_tariftambahkorek = ($data['s_tariftambahkorek']!=NULL) ? $data['s_tariftambahkorek'] : null;
        $this->s_tglawalkorek = (isset($data['s_tglawalkorek'])) ? $data['s_tglawalkorek'] : null;
        $this->s_tglakhirkorek = (isset($data['s_tglakhirkorek'])) ? $data['s_tglakhirkorek'] : null;
        // $this->s_idzona = (isset($data['s_idzona'])) ? $data['t_idzona'] : null;
        // $this->s_namazona = (isset($data['s_namazona'])) ? $data['s_namazona'] : null;
        
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
                'name' => 's_namakorek',
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
                'name' => 's_tipekorek',
                'required' => true
            ));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
