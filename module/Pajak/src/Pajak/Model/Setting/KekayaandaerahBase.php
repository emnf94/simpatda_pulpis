<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class KekayaandaerahBase implements InputFilterAwareInterface {

    public $s_idtarif, $s_idklasifikasi, $s_klasifikasi, $s_namajalan, $s_luastanah, $s_luasbangunan, $s_satuan;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idtarif = (isset($data['s_idtarif'])) ? $data['s_idtarif'] : null;
        $this->s_idklasifikasi = (isset($data['s_idklasifikasi'])) ? $data['s_idklasifikasi'] : null;
        $this->s_klasifikasi = (isset($data['s_klasifikasi'])) ? $data['s_klasifikasi'] : null;
        $this->s_namajalan = (isset($data['s_namajalan'])) ? $data['s_namajalan'] : null;
        $this->s_luastanah = (isset($data['s_luastanah'])) ? $data['s_luastanah'] : null;
        $this->s_luasbangunan = (isset($data['s_luasbangunan'])) ? $data['s_luasbangunan'] : null;
        $this->s_satuan = (isset($data['s_satuan'])) ? $data['s_satuan'] : null;
        
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

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
