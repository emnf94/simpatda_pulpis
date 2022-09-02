<?php

namespace Pajak\Model\Skpdlb;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SkpdlbBase implements InputFilterAwareInterface {

    public $t_idskpdlb, $t_idtransaksi, $t_korekskpdlb, $t_tarifpajak, $t_noskpdlb, $t_periodeskpdlb, $t_tglskpdlb, $t_dasarrevisi, $t_selisihdasar;
    public $t_jmlhpajakseharusnya, $t_totalskpdlb;
    
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idskpdlb = (isset($data['t_idskpdlb'])) ? $data['t_idskpdlb'] : null;
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_korekskpdlb = (isset($data['t_korekskpdlb'])) ? $data['t_korekskpdlb'] : null;
        $this->t_tarifpajak = (isset($data['t_tarifpajak'])) ? $data['t_tarifpajak'] : null;
        $this->t_noskpdlb = (isset($data['t_noskpdlb'])) ? $data['t_noskpdlb'] : null;
        $this->t_periodeskpdlb = (isset($data['t_periodeskpdlb'])) ? $data['t_periodeskpdlb'] : null;
        $this->t_tglskpdlb = (isset($data['t_tglskpdlb'])) ? $data['t_tglskpdlb'] : null;
        $this->t_dasarrevisi = (isset($data['t_dasarrevisi'])) ? $data['t_dasarrevisi'] : null;
        $this->t_selisihdasar = (isset($data['t_selisihdasar'])) ? $data['t_selisihdasar'] : null;
        $this->t_jmlhpajakseharusnya = (isset($data['t_jmlhpajakseharusnya'])) ? $data['t_jmlhpajakseharusnya'] : null;
        $this->t_totalskpdlb = (isset($data['t_totalskpdlb'])) ? $data['t_totalskpdlb'] : null;

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
