<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class ReklameBase implements InputFilterAwareInterface
{

    public $s_idreklamejenis, $s_namareklamejenis, $s_idrekening, $s_permanen, $s_njop, $s_urut;
    //    public $s_idreklame, $s_namareklame, $s_ukuranreklame, $s_satuanreklame, $s_lokminggu1, $s_lokbulan1, $s_loktahun1, $s_lokminggu2, $s_lokbulan2, $s_loktahun2;
    //    public $s_sewaminggu, $s_sewabulan, $s_sewatahun;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data)
    {
        $this->s_idreklamejenis = (isset($data['s_idreklamejenis'])) ? $data['s_idreklamejenis'] : null;
        $this->s_namareklamejenis = (isset($data['s_namareklamejenis'])) ? $data['s_namareklamejenis'] : null;
        $this->s_idrekening = (isset($data['s_idrekening'])) ? $data['s_idrekening'] : null;
        $this->s_permanen = (isset($data['s_permanen'])) ? $data['s_permanen'] : null;
        $this->s_njop = (isset($data['s_njop'])) ? $data['s_njop'] : null;
        $this->s_urut = (isset($data['s_urut'])) ? $data['s_urut'] : null;

        $this->kawasan1 = (isset($data['kawasan1'])) ? $data['kawasan1'] : null;
        $this->kawasan2 = (isset($data['kawasan2'])) ? $data['kawasan2'] : null;
        $this->kawasan3 = (isset($data['kawasan3'])) ? $data['kawasan3'] : null;
        $this->kawasan4 = (isset($data['kawasan4'])) ? $data['kawasan4'] : null;


        //        $this->s_idreklame = (isset($data['s_idreklame'])) ? $data['s_idreklame'] : null;
        //        $this->s_namareklame = (isset($data['s_namareklame'])) ? $data['s_namareklame'] : null;
        //        $this->s_ukuranreklame = (isset($data['s_ukuranreklame'])) ? $data['s_ukuranreklame'] : null;
        //        $this->s_satuanreklame = (isset($data['s_satuanreklame'])) ? $data['s_satuanreklame'] : null;
        //        $this->s_lokminggu1 = (isset($data['s_lokminggu1'])) ? $data['s_lokminggu1'] : null;
        //        $this->s_lokbulan1 = (isset($data['s_lokbulan1'])) ? $data['s_lokbulan1'] : null;
        //        $this->s_loktahun1 = (isset($data['s_loktahun1'])) ? $data['s_loktahun1'] : null;
        //        $this->s_lokminggu2 = (isset($data['s_lokminggu2'])) ? $data['s_lokminggu2'] : null;
        //        $this->s_lokbulan2 = (isset($data['s_lokbulan2'])) ? $data['s_lokbulan2'] : null;
        //        $this->s_loktahun2 = (isset($data['s_loktahun2'])) ? $data['s_loktahun2'] : null;
        //        $this->s_sewaminggu = (isset($data['s_sewaminggu'])) ? $data['s_sewaminggu'] : null;
        //        $this->s_sewabulan = (isset($data['s_sewabulan'])) ? $data['s_sewabulan'] : null;
        //        $this->s_sewatahun = (isset($data['s_sewatahun'])) ? $data['s_sewatahun'] : null;

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

    public function getArrayCopy()
    {
        return get_object_vars($this);
    }

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }

    public function getInputFilter()
    {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            //            $inputFilter->add(array(
            //                'name' => 's_namareklame',
            //                'required' => true,
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
            //            ));
            //            
            //            $inputFilter->add(array(
            //                'name' => 's_ukuranreklame',
            //                'required' => true
            //            ));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }
}
