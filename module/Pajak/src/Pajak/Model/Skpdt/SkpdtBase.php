<?php

namespace Pajak\Model\Skpdt;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SkpdtBase implements InputFilterAwareInterface {

    public $t_idskpdt, $t_idtransaksi, $t_tarifpajak, $t_noskpdt, $t_periodeskpdt, $t_tglskpdt, $t_dasarrevisi, $t_selisihdasar, $t_jmlhbln, $t_tarifpersen;
    public $t_jmlhdendaskpdt, $t_jmlhpajakseharusnya, $t_jmlhpajakskpdt, $t_totalskpdt;
    
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idskpdt = (isset($data['t_idskpdt'])) ? $data['t_idskpdt'] : null;
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_tarifpajak = (isset($data['t_tarifpajak'])) ? $data['t_tarifpajak'] : null;
        $this->t_noskpdt = (isset($data['t_noskpdt'])) ? $data['t_noskpdt'] : null;
        $this->t_periodeskpdt = (isset($data['t_periodeskpdt'])) ? $data['t_periodeskpdt'] : null;
        $this->t_tglskpdt = (isset($data['t_tglskpdt'])) ? $data['t_tglskpdt'] : null;
        $this->t_dasarrevisi = (isset($data['t_dasarrevisi'])) ? $data['t_dasarrevisi'] : null;
        $this->t_selisihdasar = (isset($data['t_selisihdasar'])) ? $data['t_selisihdasar'] : null;
        $this->t_jmlhbln = (isset($data['t_jmlhbln'])) ? $data['t_jmlhbln'] : null;
        $this->t_tarifpersen = (isset($data['t_tarifpersen'])) ? $data['t_tarifpersen'] : null;
        $this->t_jmlhdendaskpdt = (isset($data['t_jmlhdendaskpdt'])) ? $data['t_jmlhdendaskpdt'] : null;
        $this->t_jmlhpajakseharusnya = (isset($data['t_jmlhpajakseharusnya'])) ? $data['t_jmlhpajakseharusnya'] : null;
        $this->t_jmlhpajakskpdt = (isset($data['t_jmlhpajakskpdt'])) ? $data['t_jmlhpajakskpdt'] : null;
        $this->t_totalskpdt = (isset($data['t_totalskpdt'])) ? $data['t_totalskpdt'] : null;

        $this->page = (isset($data['page'])) ? $data['page'] : null;
        $this->direction = (isset($data['direction'])) ? $data['direction'] : null;
        $this->combocari = (isset($data['combocari'])) ? $data['combocari'] : null;
        $this->kolomcari = (isset($data['kolomcari'])) ? $data['kolomcari'] : null;
        $this->combosorting = (isset($data['combosorting'])) ? $data['combosorting'] : null;
        $this->sortasc = (isset($data['sortasc'])) ? $data['sortasc'] : null;
        $this->sortdesc = (isset($data['sortdesc'])) ? $data['sortdesc'] : null;
        $this->combooperator = (isset($data['combooperator'])) ? $data['combooperator'] : null;
        $this->s_idkorek = (isset($data['s_idkorek'])) ? $data['s_idkorek'] : null;

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

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
