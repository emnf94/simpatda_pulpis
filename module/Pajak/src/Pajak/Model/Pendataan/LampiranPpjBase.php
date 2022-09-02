<?php

namespace Pajak\Model\Pendataan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class LampiranPpjBase implements InputFilterAwareInterface {

    public $t_idlampiranppj, $t_idtransaksi;
    public $t_goltarifpln, $t_batasdaya, $t_jmlpelanggan, $t_jmlkwhterjual,
            $t_tarifperkwh, $t_jmllistrikterjual, $t_jmlbiayabeban, $t_jmlnilaijuallistrik,
            $t_tarif, $t_jumlah, $t_row;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idlampiranppj = ($data['t_idlampiranppj'] != NULL) ? $data['t_idlampiranppj'] : null;
        $this->t_idtransaksi = ($data['t_idtransaksi'] != NULL) ? $data['t_idtransaksi'] : null;
        $this->t_goltarifpln = ($data['t_goltarifpln'] != NULL) ? $data['t_goltarifpln'] : null;
        $this->t_batasdaya = ($data['t_batasdaya'] != NULL) ? $data['t_batasdaya'] : null;
        $this->t_jmlpelanggan = ($data['t_jmlpelanggan'] != NULL) ? $data['t_jmlpelanggan'] : null;
        $this->t_jmlkwhterjual = ($data['t_jmlkwhterjual'] != NULL) ? $data['t_jmlkwhterjual'] : null;
        $this->t_tarifperkwh = ($data['t_tarifperkwh'] != NULL) ? $data['t_tarifperkwh'] : null;
        $this->t_jmllistrikterjual = ($data['t_jmllistrikterjual'] != NULL) ? $data['t_jmllistrikterjual'] : null;
        $this->t_jmlbiayabeban = ($data['t_jmlbiayabeban'] != NULL) ? $data['t_jmlbiayabeban'] : null;
        $this->t_jmlnilaijuallistrik = ($data['t_jmlnilaijuallistrik'] != NULL) ? $data['t_jmlnilaijuallistrik'] : null;
        $this->t_tarif = ($data['t_tarif'] != NULL) ? $data['t_tarif'] : null;
        $this->t_jumlah = ($data['t_jumlah'] != NULL) ? $data['t_jumlah'] : null;
        $this->t_row = ($data['t_row'] != NULL) ? $data['t_row'] : null;
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
