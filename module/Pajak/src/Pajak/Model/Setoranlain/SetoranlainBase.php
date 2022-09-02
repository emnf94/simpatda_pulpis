<?php

namespace Pajak\Model\Setoranlain;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class SetoranlainBase implements InputFilterAwareInterface {

    public $s_idsetoranlain, $tgl_setoranlain, $nokohir_sl, $s_iddinas, $t_viapembayaran, $no_sts, $s_namadinas, $nama_penyetor;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->s_idsetoranlain = (isset($data['s_idsetoranlain'])) ? $data['s_idsetoranlain'] : null;
        $this->tgl_setoranlain = (isset($data['tgl_setoranlain'])) ? $data['tgl_setoranlain'] : null;
        $this->nokohir_sl = (isset($data['nokohir_sl'])) ? $data['nokohir_sl'] : null;
        $this->s_iddinas = (isset($data['s_iddinas'])) ? $data['s_iddinas'] : null;
        $this->t_viapembayaran = (isset($data['t_viapembayaran'])) ? $data['t_viapembayaran'] : null;
        $this->no_sts = (isset($data['no_sts'])) ? $data['no_sts'] : null;
        $this->s_namadinas = (isset($data['s_namadinas'])) ? $data['s_namadinas'] : null;
        $this->nama_penyetor = (isset($data['nama_penyetor'])) ? $data['nama_penyetor'] : null;

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

            $factory = new InputFactory();
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 's_namadinas',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 'tgl_setoranlain',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 'nokohir_sl',
                        'required' => false
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 's_iddinas',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 't_viapembayaran',
                        'required' => true
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 'nama_penyetor',
                        'required' => false
            )));
            
            $inputFilter->add($factory->createInput(array(
                        'name' => 'no_sts',
                        'required' => false
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
