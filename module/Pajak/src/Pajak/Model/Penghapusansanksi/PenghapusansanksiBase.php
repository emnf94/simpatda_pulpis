<?php

namespace Pajak\Model\Penghapusansanksi;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PenghapusansanksiBase implements InputFilterAwareInterface {

    public $t_idhapussanksi, $t_idwpobjek, $t_idketetapan, $t_jenisketetapan, $t_tglhapussanksi, 
            $t_alasanhapussanksi, $t_jenispajak, $t_jmlhpajak, $t_statusverifikasi, $t_tglverifikasi,
            $t_psj_penghapusan, $t_nomorsk, $t_jmlhdendaseharusnya, $t_jmlhdendaditetapkan;
    public $page, $direction, $combocari, $kolomcari, $combosorting, $sortasc, $sortdesc, $combooperator, $s_idkorek;
    public $rows;
    public $sidx;
    public $sord;
    protected $inputFilter;

    public function exchangeArray($data) {
        $this->t_idhapussanksi = (isset($data['t_idhapussanksi'])) ? $data['t_idhapussanksi'] : null;
        $this->t_idwpobjek = (isset($data['t_idwpobjek'])) ? $data['t_idwpobjek'] : null;
        $this->t_idketetapan = (isset($data['t_idketetapan'])) ? $data['t_idketetapan'] : null;
        $this->t_jenisketetapan = (isset($data['t_jenisketetapan'])) ? $data['t_jenisketetapan'] : null;
        $this->t_tglhapussanksi = (isset($data['t_tglhapussanksi'])) ? $data['t_tglhapussanksi'] : null;
        $this->t_alasanhapussanksi = (isset($data['t_alasanhapussanksi'])) ? $data['t_alasanhapussanksi'] : null;
        $this->t_jenispajak = (isset($data['t_jenispajak'])) ? $data['t_jenispajak'] : null;
        $this->t_jmlhpajak = (isset($data['t_jmlhpajak'])) ? $data['t_jmlhpajak'] : null;
        $this->t_statusverifikasi = (isset($data['t_statusverifikasi'])) ? $data['t_statusverifikasi'] : null;
        $this->t_tglverifikasi = (isset($data['t_tglverifikasi'])) ? $data['t_tglverifikasi'] : null;
        $this->t_psj_penghapusan = (isset($data['t_psj_penghapusan'])) ? $data['t_psj_penghapusan'] : null;
        $this->t_jmlhdendaseharusnya = (isset($data['t_jmlhdendaseharusnya'])) ? $data['t_jmlhdendaseharusnya'] : null;
        $this->t_jmlhdendaditetapkan = (isset($data['t_jmlhdendaditetapkan'])) ? $data['t_jmlhdendaditetapkan'] : null;
        $this->t_nomorsk = (isset($data['t_nomorsk'])) ? $data['t_nomorsk'] : null;

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
