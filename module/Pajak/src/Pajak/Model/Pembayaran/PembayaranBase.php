<?php

namespace Pajak\Model\Pembayaran;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PembayaranBase implements InputFilterAwareInterface {

    public $t_idtransaksi, $t_viapembayaran, $t_jmlhpajak, $t_tglpembayaran, $t_jmlhpembayaran, $t_jmlhdendapembayaran, $t_jmlhbulandendapembayaran, $t_jenisketetapandenda;
    
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_viapembayaran = (isset($data['t_viapembayaran'])) ? $data['t_viapembayaran'] : null;
        $this->t_jmlhpajak = (isset($data['t_jmlhpajak'])) ? $data['t_jmlhpajak'] : null;
        $this->t_tglpembayaran = (isset($data['t_tglpembayaran'])) ? $data['t_tglpembayaran'] : null;
        $this->t_jmlhpembayaran = (isset($data['t_jmlhpembayaran'])) ? $data['t_jmlhpembayaran'] : null;
        $this->t_jmlhdendapembayaran = (isset($data['t_jmlhdendapembayaran'])) ? $data['t_jmlhdendapembayaran'] : null;
        $this->t_jmlhbulandendapembayaran = (isset($data['t_jmlhbulandendapembayaran'])) ? $data['t_jmlhbulandendapembayaran'] : null;
        $this->t_jenisketetapandenda = (isset($data['t_jenisketetapandenda'])) ? $data['t_jenisketetapandenda'] : null;

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
