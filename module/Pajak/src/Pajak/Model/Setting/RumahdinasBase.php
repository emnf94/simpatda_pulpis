<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class RumahdinasBase implements InputFilterAwareInterface {

    public $s_idtarifret, $s_namatarif, $s_luasawal, $s_luasakhir, $s_satuan, $s_tarif;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idtarifret = (isset($data['s_idtarifret'])) ? $data['s_idtarifret'] : null;
        $this->s_namatarif = (isset($data['s_namatarif'])) ? $data['s_namatarif'] : null;
        $this->s_luasawal = (isset($data['s_luasawal'])) ? $data['s_luasawal'] : null;
        $this->s_luasakhir = (isset($data['s_luasakhir'])) ? $data['s_luasakhir'] : null;
        $this->s_satuan = (isset($data['s_satuan'])) ? $data['s_satuan'] : null;
        $this->s_tarif = (isset($data['s_tarif'])) ? $data['s_tarif'] : null;
        
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
