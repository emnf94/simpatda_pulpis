<?php

namespace Pajak\Model\Skpdn;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SkpdnBase implements InputFilterAwareInterface {

    public $t_idskpdn, $t_idtransaksi, $t_korekskpdn, $t_tarifpajak, $t_noskpdn, $t_periodeskpdn, $t_tglskpdn, $t_dasarrevisi, $t_selisihdasar;
    public $t_jmlhpajakseharusnya, $t_totalskpdn;
    
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idskpdn = (isset($data['t_idskpdn'])) ? $data['t_idskpdn'] : null;
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_korekskpdn = (isset($data['t_korekskpdn'])) ? $data['t_korekskpdn'] : null;
        $this->t_tarifpajak = (isset($data['t_tarifpajak'])) ? $data['t_tarifpajak'] : null;
        $this->t_noskpdn = (isset($data['t_noskpdn'])) ? $data['t_noskpdn'] : null;
        $this->t_periodeskpdn = (isset($data['t_periodeskpdn'])) ? $data['t_periodeskpdn'] : null;
        $this->t_tglskpdn = (isset($data['t_tglskpdn'])) ? $data['t_tglskpdn'] : null;
        $this->t_dasarrevisi = (isset($data['t_dasarrevisi'])) ? $data['t_dasarrevisi'] : null;
        $this->t_selisihdasar = (isset($data['t_selisihdasar'])) ? $data['t_selisihdasar'] : null;
        $this->t_jmlhpajakseharusnya = (isset($data['t_jmlhpajakseharusnya'])) ? $data['t_jmlhpajakseharusnya'] : null;
        $this->t_totalskpdn = (isset($data['t_totalskpdn'])) ? $data['t_totalskpdn'] : null;

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
