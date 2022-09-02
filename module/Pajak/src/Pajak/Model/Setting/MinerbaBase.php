<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class MinerbaBase implements InputFilterAwareInterface {

    // public $s_idjenisminerba, $s_namajenisminerba, $s_idkorek, $s_keterangan, $s_harga, $s_idzona;
    public $s_idjenis, $s_nama, $s_idkorek, $s_masa, $s_ket, $s_tarif, $s_kodekawasan, $s_idjenisminerba, $s_namajenisminerba, $s_keterangan, $s_harga, $s_idzona;
   
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idjenis = (isset($data['s_idjenis'])) ? $data['s_idjenis'] : null;
        $this->s_nama = (isset($data['s_nama'])) ? $data['s_nama'] : null;
        $this->s_idkorek = (isset($data['s_idkorek'])) ? $data['s_idkorek'] : null;
        $this->s_ket = (isset($data['s_ket'])) ? $data['s_ket'] : null;
        // $this->s_masa = (isset($data['s_masa'])) ? $data['s_masa'] : null;
        $this->s_tarif = (isset($data['s_tarif'])) ? $data['s_tarif'] : null;
        $this->s_kodekawasan = (isset($data['s_kodekawasan'])) ? $data['s_kodekawasan'] : null;
        
        $this->s_idjenisminerba = (isset($data['s_idjenisminerba'])) ? $data['s_idjenisminerba'] : null;
        $this->s_namajenisminerba = (isset($data['s_namajenisminerba'])) ? $data['s_namajenisminerba'] : null;
        $this->s_idkorek = (isset($data['s_idkorek'])) ? $data['s_idkorek'] : null;
        $this->s_keterangan = (isset($data['s_keterangan'])) ? $data['s_keterangan'] : null;
        // $this->s_masa = (isset($data['s_masa'])) ? $data['s_masa'] : null;
        $this->s_harga = (isset($data['s_harga'])) ? $data['s_harga'] : null;
        $this->s_idzona = (isset($data['s_idzona'])) ? $data['s_idzona'] : null;


        
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
