<?php

namespace Pajak\Model\Pendataan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PendataanBase implements InputFilterAwareInterface
{

    public $t_idtransaksi, $t_idobjek, $t_jenispajak, $t_nourut, $t_periodepajak, $t_tglpendataan, $t_masaawal, $t_masaakhir, $t_idkorek, $t_korek, $t_namakorek, $t_tarifdasarkorek;
    public $t_nilaiperolehan, $t_dasarpengenaan, $t_tarifpajak, $t_jmlhpajak, $t_tglpenetapan, $t_namakegiatan;
    public $njtl;


    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek, $t_opdkatering, $t_keterangankatering;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data)
    {
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_idobjek = (isset($data['t_idobjek'])) ? $data['t_idobjek'] : null;
        $this->t_jenispajak = (isset($data['t_jenispajak'])) ? $data['t_jenispajak'] : null;
        $this->t_nourut = (isset($data['t_nourut'])) ? $data['t_nourut'] : null;
        $this->t_periodepajak = (isset($data['t_periodepajak'])) ? $data['t_periodepajak'] : null;
        $this->t_tglpendataan = (isset($data['t_tglpendataan'])) ? $data['t_tglpendataan'] : null;
        $this->t_masaawal = (isset($data['t_masaawal'])) ? $data['t_masaawal'] : null;
        $this->t_masaakhir = (isset($data['t_masaakhir'])) ? $data['t_masaakhir'] : null;
        $this->t_idkorek = (isset($data['t_idkorek'])) ? $data['t_idkorek'] : null;
        $this->t_korek = (isset($data['t_korek'])) ? $data['t_korek'] : null;
        $this->t_namakorek = (isset($data['t_namakorek'])) ? $data['t_namakorek'] : null;
        $this->t_tarifdasarkorek = (isset($data['t_tarifdasarkorek'])) ? $data['t_tarifdasarkorek'] : null;
        $this->t_nilaiperolehan = (isset($data['t_nilaiperolehan'])) ? $data['t_nilaiperolehan'] : null;
        $this->t_dasarpengenaan = (isset($data['t_dasarpengenaan'])) ? $data['t_dasarpengenaan'] : null;
        $this->t_tarifpajak = (isset($data['t_tarifpajak'])) ? $data['t_tarifpajak'] : null;
        $this->t_jmlhpajak = (isset($data['t_jmlhpajak'])) ? $data['t_jmlhpajak'] : null;
        $this->t_tglpenetapan = (isset($data['t_tglpenetapan'])) ? $data['t_tglpenetapan'] : null;
        $this->t_namakegiatan = (isset($data['t_namakegiatan'])) ? $data['t_namakegiatan'] : null;

        $this->njtl = (isset($data['njtl'])) ? $data['njtl'] : null;


        $this->t_keterangankatering = (isset($data['t_keterangankatering'])) ? $data['t_keterangankatering'] : null;
        $this->t_opdkatering = (isset($data['t_opdkatering'])) ? $data['t_opdkatering'] : null;

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

    public function getArrayCopy()
    {
        return get_object_vars($this);
    }

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }

    public function getInputFilter()
    {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            $factory = new InputFactory();

            $inputFilter->add($factory->createInput(array(
                'name' => 'njtl',
                'required' => false
            )));

            //            $factory = new InputFactory();
            //
            //            $inputFilter->add($factory->createInput(array(
            //                        'name' => 't_kecamatanrek',
            //                        'required' => false
            //            )));
            //
            //            $inputFilter->add($factory->createInput(array(
            //                        'name' => 't_kelurahanrek',
            //                        'required' => false
            //            )));

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }
}
