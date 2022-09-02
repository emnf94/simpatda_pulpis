<?php

namespace Pajak\Model\Pembayaran;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SetoranlainBase implements InputFilterAwareInterface {

    public $t_idsetoranlain,
            $t_idsatker,
            $t_idrekening,
            $t_tahunpajak,
            $t_jumlahsetor,
            $t_tglsetor,
            $t_viasetor,
            $t_kodebukti,
            $t_keterangan;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idsetoranlain = (isset($data['t_idsetoranlain'])) ? $data['t_idsetoranlain'] : null;
        $this->t_idsatker = (isset($data['t_idsatker'])) ? $data['t_idsatker'] : null;
        $this->t_idrekening = (isset($data['t_idrekening'])) ? $data['t_idrekening'] : null;
        $this->t_tahunpajak = (isset($data['t_tahunpajak'])) ? $data['t_tahunpajak'] : null;
        $this->t_jumlahsetor = (isset($data['t_jumlahsetor'])) ? $data['t_jumlahsetor'] : null;
        $this->t_tglsetor = (isset($data['t_tglsetor'])) ? $data['t_tglsetor'] : null;
        $this->t_viasetor = (isset($data['t_viasetor'])) ? $data['t_viasetor'] : null;
        $this->t_kodebukti = (isset($data['t_kodebukti'])) ? $data['t_kodebukti'] : null;

        $this->t_keterangan = (isset($data['t_keterangan'])) ? $data['t_keterangan'] : null;

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
