<?php

namespace Pajak\Model\Stpdpembayaran;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class StpdpembayaranBase implements InputFilterAwareInterface {

    public $t_idtransaksi, $t_jmlhdendapembayaran, $t_jmlhbulandendapembayaran, $t_tgldendapembayaran, $t_jmlhbayardenda, $t_tglbayardenda;
    
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idtempat;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_jmlhdendapembayaran = (isset($data['t_jmlhdendapembayaran'])) ? $data['t_jmlhdendapembayaran'] : null;
        $this->t_jmlhbulandendapembayaran = (isset($data['t_jmlhbulandendapembayaran'])) ? $data['t_jmlhbulandendapembayaran'] : null;
        $this->t_tgldendapembayaran = (isset($data['t_tgldendapembayaran'])) ? $data['t_tgldendapembayaran'] : null;
        $this->t_jmlhbayardenda = (isset($data['t_jmlhbayardenda'])) ? $data['t_jmlhbayardenda'] : null;
        $this->t_tglbayardenda = (isset($data['t_tglbayardenda'])) ? $data['t_tglbayardenda'] : null;

        $this->page = (isset($data['page'])) ? $data['page'] : null;
        $this->direction = (isset($data['direction'])) ? $data['direction'] : null;
        $this->combocari = (isset($data['combocari'])) ? $data['combocari'] : null;
        $this->kolomcari = (isset($data['kolomcari'])) ? $data['kolomcari'] : null;
        $this->combosorting = (isset($data['combosorting'])) ? $data['combosorting'] : null;
        $this->sortasc = (isset($data['sortasc'])) ? $data['sortasc'] : null;
        $this->sortdesc = (isset($data['sortdesc'])) ? $data['sortdesc'] : null;
        $this->combooperator = (isset($data['combooperator'])) ? $data['combooperator'] : null;
        $this->s_idtempat = (isset($data['s_idtempat'])) ? $data['s_idtempat'] : null;

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

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_jenispembayaran',
                        'required' => true
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
