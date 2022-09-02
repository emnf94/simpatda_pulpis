<?php

namespace Pajak\Model\Pendataan;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class DetailPpjBase implements InputFilterAwareInterface
{

    public $t_iddetailppj, $t_idtransaksi;
    public $t_nilailistrik, $t_idkorek, $t_subtotalpajak;
    protected $inputFilter;

    public function exchangeArray($data)
    {
        $this->t_iddetailppj = (isset($data['t_iddetailppj'])) ? $data['t_iddetailppj'] : null;
        $this->t_idtransaksi = (isset($data['t_idtransaksi'])) ? $data['t_idtransaksi'] : null;
        $this->t_nilailistrik = (isset($data['t_nilailistrik'])) ? $data['t_nilailistrik'] : null;
        $this->t_idkorek = (isset($data['t_idkorek'])) ? $data['t_idkorek'] : null;
        $this->t_subtotalpajak = (isset($data['t_subtotalpajak'])) ? $data['t_subtotalpajak'] : null;
        $this->t_pajak = (isset($data['t_pajak'])) ? $data['t_pajak'] : null;
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
