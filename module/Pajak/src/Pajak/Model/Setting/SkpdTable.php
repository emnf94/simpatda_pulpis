<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class SkpdTable extends AbstractTableGateway {

    protected $table = 's_skpd';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SkpdBase());
        $this->initialize();
    }

    public function getdata() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function savedata(SkpdBase $kb, $session) {
        $data = array(
            's_namaskpd' => $kb->s_namaskpd,
            'jalan_skpd' => $kb->jalan_skpd,
            's_idkec' => $kb->s_idkec,
            's_idkel' => $kb->s_idkel
        );
        $id = (int) $kb->s_idskpd;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idskpd' => $kb->s_idskpd));
        }
    }

    

    public function getSkpdId($s_idskpd) {
        /*$rowset = $this->select(array('s_idskpd' => $s_idskpd));
        $row = $rowset->current();
        return $row;*/
        
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_skpd");
        $where = new \Zend\Db\Sql\Where();
        $where->literal('s_idskpd = '.$s_idskpd.'');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getdaftarskpd() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_skpd");
        $select->join("s_kecamatan", "s_kecamatan.s_idkec = s_skpd.s_idkec", ["s_kodekec", "s_namakec"], "left");
        $select->join("s_kelurahan", "s_kelurahan.s_idkel = s_skpd.s_idkel", ["s_kodekel", "s_namakel"], "left");
        $where = new \Zend\Db\Sql\Where();
        //$where->literal('s_idskpd = '.$s_idskpd.'');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function hapusData($id) {
        $this->delete(array('s_idskpd' => $id));
    }
    
    //========================================== datagrid skpd
    public function getjumlahdata($select) {
        
        $sql = new Sql($this->adapter);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }
    
   
    
    public function semuadata_skpd($input, $aColumns, $session, $cekurl, $allParams) {
        $aOrderingRules = array();
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_skpd");
        $select->join("s_kecamatan", "s_kecamatan.s_idkec = s_skpd.s_idkec", ["s_kodekec", "s_namakec"], "left");
        $select->join("s_kelurahan", "s_kelurahan.s_idkel = s_skpd.s_idkel", ["s_kodekel", "s_namakel"], "left");
        
        $where = new \Zend\Db\Sql\Where();
        
        if(($input->getPost('sSearch_1')) || ($input->getPost('sSearch_1') == '0')){
              $where->literal("s_skpd.s_namaskpd ILIKE '%".$input->getPost('sSearch_1')."%'");
        }
        if(($input->getPost('sSearch_2')) || ($input->getPost('sSearch_2') == '0')){
              $where->literal("s_skpd.jalan_skpd ILIKE '%".$input->getPost('sSearch_2')."%'");
        }
        if(($input->getPost('sSearch_3')) || ($input->getPost('sSearch_3') == '0')){
              $where->literal("s_kecamatan.s_namakec ILIKE '%".$input->getPost('sSearch_3')."%'");
        }
        if(($input->getPost('sSearch_4')) || ($input->getPost('sSearch_4') == '0')){
              $where->literal("s_kelurahan.s_namakel ILIKE '%".$input->getPost('sSearch_4')."%'");
        }
        
        $select->where($where);
        
        //================ menghitung jumlah datane coy
        $totaldata = $this->getjumlahdata($select);
        $iTotal = $totaldata; 
        //================ end menghitung jumlah datane coy
        
        //================ ordernya coy
        $aOrderingRules = array();
        if ($input->getPost('iSortCol_0')) {
            $iSortingCols = intval($input->getPost('iSortingCols'));
            for ($i = 0; $i < $iSortingCols; $i++) {
                if ($input->getPost('bSortable_' . intval($input->getPost('iSortCol_' . $i))) == 'true') {
                        $aOrderingRules[] = $aColumns[intval($input->getPost('iSortCol_' . $i))]." ".($input->getPost('sSortDir_' . $i) === 'asc' ? 'asc' : 'desc');
                    
                }
            }
        }
        
        
        if (!empty($aOrderingRules)) {
            $select->order(implode(", ", $aOrderingRules));
        } else {
            $select->order("s_idskpd DESC");
        }
        //================ end ordernya coy
        
        //================ pagination e coy
        if ($input->getPost('iDisplayStart') && $input->getPost('iDisplayLength') != '-1') {
            $select->limit(intval($input->getPost('iDisplayLength'))); $select->offset(intval($input->getPost('iDisplayStart')));
            $no = 1 + intval($input->getPost('iDisplayStart'));
        }else{
            if (intval($input->getPost('iDisplayLength')) >= 1) {
                $select->limit(intval($input->getPost('iDisplayLength'))); $select->offset(intval($input->getPost('iDisplayStart'))); 
                $no = 1 + intval($input->getPost('iDisplayStart'));
            } else {
                $select->limit(10); $select->offset(0); 
                $no = 1;
            }
        }
        //================ end pagination e coy
        
        $statement = $sql->prepareStatementForSqlObject($select);
        $rResult = $statement->execute();
        
        
        $output = array(
            "sEcho" => intval($input->getPost('sEcho')),
            "iTotalRecords" => $iTotal,
            "iTotalDisplayRecords" => $iTotal, 
            "aaData" => array(),
        );
        
        //var_dump($rResult); exit();

        foreach ($rResult as $aRow) {
            $row = array();
           
            $btn = '<a href="setting_skpd/edit?s_idskpd='.$aRow['s_idskpd'].'" class="btn btn-warning btn-xs btn-flat"><i class="fa fa-pencil"></i> Edit</a> <a href="#" onclick="hapus('.$aRow['s_idskpd'].');return false;" class="btn btn-danger btn-xs btn-flat"><i class="fa fa-trash"></i> Hapus</a>';
            $row = array("<center>".$no."</center>",  
                               $aRow['s_namaskpd'],$aRow['jalan_skpd'],$aRow['s_namakec'],$aRow['s_namakel'],
                         "<center>".$btn."</center>"
                        );
            
            $output['aaData'][] = $row;
            $no++;
        }
        
        return $output;
    }    
    //========================================== end datagrid skpd
    
    public function getByKecamatan($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kelurahan');
        $where = new Where();
        $where->literal("s_idkeckel = ".$id."");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function cekid_kecamatan($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kecamatan');
        $where = new Where();
        $where->literal("s_idkec = ".$id."");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        
        return $res;
    }
    
    public function getcomboIdKecamatan() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kecamatan');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idkec']] = str_pad($row['s_kodekec'], 2, "0", STR_PAD_LEFT) . " || " . $row['s_namakec'];
        }
        return $selectData;
    }
    
    
   

}
