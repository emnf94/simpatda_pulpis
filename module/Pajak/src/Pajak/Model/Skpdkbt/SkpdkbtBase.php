<?php

namespace Pajak\Model\Skpdkbt;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SkpdkbtBase implements InputFilterAwareInterface {

    public $t_idskpdkbt, $t_idtransaksi, $t_tarifpajak, $t_noskpdkbt, $t_periodeskpdkbt, $t_tglskpdkbt, $t_dasarrevisi, $t_selisihdasar, $t_jmlhbln, $t_tarifpersen;
    public $t_jmlhdendaskpdkbt, $t_jmlhpajakseharusnya, $t_jmlhpajakskpdkbt, $t_totalskpdkbt;
    
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idskpdkbt = (isset($data['t_idskpdkbt'])) ? $data['t_idskpdkbt'] : null;
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_tarifpajak = (isset($data['t_tarifpajak'])) ? $data['t_tarifpajak'] : null;
        $this->t_noskpdkbt = (isset($data['t_noskpdkbt'])) ? $data['t_noskpdkbt'] : null;
        $this->t_periodeskpdkbt = (isset($data['t_periodeskpdkbt'])) ? $data['t_periodeskpdkbt'] : null;
        $this->t_tglskpdkbt = (isset($data['t_tglskpdkbt'])) ? $data['t_tglskpdkbt'] : null;
        $this->t_dasarrevisi = (isset($data['t_dasarrevisi'])) ? $data['t_dasarrevisi'] : null;
        $this->t_selisihdasar = (isset($data['t_selisihdasar'])) ? $data['t_selisihdasar'] : null;
        $this->t_jmlhbln = (isset($data['t_jmlhbln'])) ? $data['t_jmlhbln'] : null;
        $this->t_tarifpersen = (isset($data['t_tarifpersen'])) ? $data['t_tarifpersen'] : null;
        $this->t_jmlhdendaskpdkbt = (isset($data['t_jmlhdendaskpdkbt'])) ? $data['t_jmlhdendaskpdkbt'] : null;
        $this->t_jmlhpajakseharusnya = (isset($data['t_jmlhpajakseharusnya'])) ? $data['t_jmlhpajakseharusnya'] : null;
        $this->t_jmlhpajakskpdkbt = (isset($data['t_jmlhpajakskpdkbt'])) ? $data['t_jmlhpajakskpdkbt'] : null;
        $this->t_totalskpdkbt = (isset($data['t_totalskpdkbt'])) ? $data['t_totalskpdkbt'] : null;

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
