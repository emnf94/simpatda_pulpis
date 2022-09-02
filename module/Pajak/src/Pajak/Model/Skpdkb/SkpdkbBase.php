<?php

namespace Pajak\Model\Skpdkb;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SkpdkbBase implements InputFilterAwareInterface {

    public $t_idskpdkb, $t_idtransaksi, $t_tarifpajak, $t_noskpdkb, $t_periodeskpdkb, $t_tglskpdkb, $t_dasarrevisi, $t_selisihdasar, $t_jmlhbln, $t_tarifpersen;
    public $t_jmlhdendaskpdkb, $t_jmlhpajakseharusnya, $t_jmlhpajakskpdkb, $t_totalskpdkb;
    
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idskpdkb = (isset($data['t_idskpdkb'])) ? $data['t_idskpdkb'] : null;
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_tarifpajak = (isset($data['t_tarifpajak'])) ? $data['t_tarifpajak'] : null;
        $this->t_noskpdkb = (isset($data['t_noskpdkb'])) ? $data['t_noskpdkb'] : null;
        $this->t_periodeskpdkb = (isset($data['t_periodeskpdkb'])) ? $data['t_periodeskpdkb'] : null;
        $this->t_tglskpdkb = (isset($data['t_tglskpdkb'])) ? $data['t_tglskpdkb'] : null;
        $this->t_dasarrevisi = (isset($data['t_dasarrevisi'])) ? $data['t_dasarrevisi'] : null;
        $this->t_selisihdasar = (isset($data['t_selisihdasar'])) ? $data['t_selisihdasar'] : null;
        $this->t_jmlhbln = (isset($data['t_jmlhbln'])) ? $data['t_jmlhbln'] : null;
        $this->t_tarifpersen = (isset($data['t_tarifpersen'])) ? $data['t_tarifpersen'] : null;
        $this->t_jmlhdendaskpdkb = (isset($data['t_jmlhdendaskpdkb'])) ? $data['t_jmlhdendaskpdkb'] : null;
        $this->t_jmlhpajakseharusnya = (isset($data['t_jmlhpajakseharusnya'])) ? $data['t_jmlhpajakseharusnya'] : null;
        $this->t_jmlhpajakskpdkb = (isset($data['t_jmlhpajakskpdkb'])) ? $data['t_jmlhpajakskpdkb'] : null;
        $this->t_totalskpdkb = (isset($data['t_totalskpdkb'])) ? $data['t_totalskpdkb'] : null;

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
