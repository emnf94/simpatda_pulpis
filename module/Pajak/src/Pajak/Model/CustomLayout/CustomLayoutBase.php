<?php

namespace Pajak\Model\CustomLayout;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\Factory as InputFactory;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

class CustomLayoutBase implements InputFilterAwareInterface {    
    
    public $id_bg, $file_bg, $s_iduser, $status_bg;
     
    protected $inputFilter;    
    public function exchangeArray($data){        
        $this->id_bg = (isset($data['id_bg'])) ? $data['id_bg'] : null;
        $this->file_bg = (isset($data["file_bg"])) ? $data["file_bg"] : null;
        $this->s_iduser = (isset($data['s_iduser'])) ? $data['s_iduser'] : null;
        $this->status_bg = (isset($data['status_bg'])) ? $data['status_bg'] : null;
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