<?php

namespace Pajak\Model\Setting;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class PemdaBase implements InputFilterAwareInterface
{

    public $s_idpemda;
    public $s_namaprov;
    public $s_namakabkota;
    public $s_namaibukotakabkota;
    public $s_kodeprovinsi;
    public $s_kodekabkot;
    public $s_namainstansi;
    public $s_namasingkatinstansi;
    public $s_alamatinstansi;
    public $s_notelinstansi;
    public $s_namabank;
    public $s_norekbank;
    public $s_logo;
    public $s_logofile, $s_namacabang, $s_kodecabang, $s_kodepos;
    protected $inputFilter;
    public function exchangeArray($data)
    {
        $this->s_idpemda = (isset($data['s_idpemda'])) ? $data['s_idpemda'] : null;
        $this->s_namaprov = (isset($data["s_namaprov"])) ? $data["s_namaprov"] : null;
        $this->s_namakabkota = (isset($data['s_namakabkota'])) ? $data['s_namakabkota'] : null;
        $this->s_namaibukotakabkota = (isset($data['s_namaibukotakabkota'])) ? $data['s_namaibukotakabkota'] : null;
        $this->s_kodeprovinsi = (isset($data['s_kodeprovinsi'])) ? $data['s_kodeprovinsi'] : null;
        $this->s_kodekabkot = (isset($data['s_kodekabkot'])) ? $data['s_kodekabkot'] : null;
        $this->s_namainstansi = (isset($data['s_namainstansi'])) ? $data['s_namainstansi'] : null;
        $this->s_namasingkatinstansi = (isset($data['s_namasingkatinstansi'])) ? $data['s_namasingkatinstansi'] : null;
        $this->s_alamatinstansi = (isset($data['s_alamatinstansi'])) ? $data['s_alamatinstansi'] : null;
        $this->s_notelinstansi = (isset($data['s_notelinstansi'])) ? $data['s_notelinstansi'] : null;
        $this->s_namabank = (isset($data['s_namabank'])) ? $data['s_namabank'] : null;
        $this->s_norekbank = (isset($data['s_norekbank'])) ? $data['s_norekbank'] : null;
        $this->s_logo = (isset($data['s_logo'])) ? $data['s_logo'] : null;
        $this->s_logofile = (isset($data['s_logofile'])) ? $data['s_logofile'] : null;
        $this->s_logofile = (isset($data['s_logofile'])) ? $data['s_logofile'] : null;
        $this->s_namacabang = (isset($data['s_namacabang'])) ? $data['s_namacabang'] : null;
        $this->s_kodecabang = (isset($data['s_kodecabang'])) ? $data['s_kodecabang'] : null;
        $this->s_kodepos = (isset($data['s_kodepos'])) ? $data['s_kodepos'] : null;
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

            $this->inputFilter = $inputFilter;
        }
        return $this->inputFilter;
    }
}
