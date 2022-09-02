<?php

namespace Pajak\Model\Pendaftaran;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class ObjekBase implements InputFilterAwareInterface {

    public $t_idobjek, $t_idwp, $t_noobjek, $t_korekobjek, $t_tgldaftarobjek, $t_namaobjek, $t_alamatobjek, $t_rtobjek, $t_rwobjek, $t_kelurahanobjek, $t_kecamatanobjek, $t_kabupatenobjek;
    public $t_notelpobjek, $t_jenisobjek, $t_kodeposobjek, $t_latitudeobjek, $t_longitudeobjek, $t_namaobjekpj, $t_alamatobjekpj, $t_gambarobjek, $t_tipeusaha;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idobjek = (isset($data['t_idobjek'])) ? $data['t_idobjek'] : null;
        $this->t_idwp = (isset($data['t_idwp'])) ? $data['t_idwp'] : null;
        $this->t_noobjek = (isset($data['t_noobjek'])) ? $data['t_noobjek'] : null;
        $this->t_korekobjek = (isset($data['t_korekobjek'])) ? $data['t_korekobjek'] : null;
        $this->t_tgldaftarobjek = (isset($data['t_tgldaftarobjek'])) ? $data['t_tgldaftarobjek'] : null;
        $this->t_namaobjek = (isset($data['t_namaobjek'])) ? $data['t_namaobjek'] : null;
        $this->t_alamatobjek = (isset($data['t_alamatobjek'])) ? $data['t_alamatobjek'] : null;
        $this->t_rtobjek = (isset($data['t_rtobjek'])) ? $data['t_rtobjek'] : null;
        $this->t_rwobjek = (isset($data['t_rwobjek'])) ? $data['t_rwobjek'] : null;
        $this->t_kelurahanobjek = (isset($data['t_kelurahanobjek'])) ? $data['t_kelurahanobjek'] : null;
        $this->t_kecamatanobjek = (isset($data['t_kecamatanobjek'])) ? $data['t_kecamatanobjek'] : null;
        $this->t_kabupatenobjek = (isset($data['t_kabupatenobjek'])) ? $data['t_kabupatenobjek'] : null;
        $this->t_notelpobjek = (isset($data['t_notelpobjek'])) ? $data['t_notelpobjek'] : null;
        $this->t_jenisobjek = (isset($data['t_jenisobjek'])) ? $data['t_jenisobjek'] : null;
        $this->t_kodeposobjek = (isset($data['t_kodeposobjek'])) ? $data['t_kodeposobjek'] : null;
        $this->t_latitudeobjek = (isset($data['t_latitudeobjek'])) ? $data['t_latitudeobjek'] : null;
        $this->t_longitudeobjek = (isset($data['t_longitudeobjek'])) ? $data['t_longitudeobjek'] : null;
        $this->t_gambarobjek = (isset($data['t_gambarobjek'])) ? $data['t_gambarobjek'] : null;
        $this->t_namaobjekpj = (isset($data['t_namaobjekpj'])) ? $data['t_namaobjekpj'] : null;
        $this->t_alamatobjekpj = (isset($data['t_alamatobjekpj'])) ? $data['t_alamatobjekpj'] : null;
        $this->t_tipeusaha = (isset($data['t_tipeusaha'])) ? $data['t_tipeusaha'] : null;

        $this->page = (isset($data['page'])) ? $data['page'] : null;
        $this->direction = (isset($data['direction'])) ? $data['direction'] : null;
        $this->combocari = (isset($data['combocari'])) ? $data['combocari'] : null;
        $this->kolomcari = (isset($data['kolomcari'])) ? $data['kolomcari'] : null;
        $this->combosorting = (isset($data['combosorting'])) ? $data['combosorting'] : null;
        $this->sortasc = (isset($data['sortasc'])) ? $data['sortasc'] : null;
        $this->sortdesc = (isset($data['sortdesc'])) ? $data['sortdesc'] : null;
        $this->combooperator = (isset($data['combooperator'])) ? $data['combooperator'] : null;

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
                        'name' => 't_namaobjek',
                        'required' => true
            )));

            $inputFilter->add($factory->createInput(array(
                        'name' => 't_korekobjek',
                        'required' => false
            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }

}
