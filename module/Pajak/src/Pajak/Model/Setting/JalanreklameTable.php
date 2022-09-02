<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class JalanreklameTable extends AbstractTableGateway {

    protected $table = 'byms_reklame_lokasijln';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new JalanreklameBase());
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

    public function checkExist(JalanreklameBase $kb) {
        $rowset = $this->select(array('s_kodekel' => $kb->s_kodekel));
        $row = $rowset->current();
        return $row;
    }

    public function checkId(JalanreklameBase $kb) {
        $rowset = $this->select(array('s_idkel' => $kb->s_idkel));
        $row = $rowset->current();
        return $row;
    }

    public function savedata($kb, $session) {
        $data = array(
            'kd_jlnreklame' => $kb->kd_jlnreklame,
            'nama_jlnreklame' => $kb->nama_jlnreklame,
            'id_zona_reklame' => $kb->id_zona_reklame,
            's_idkec' => $kb->s_idkec,
            's_idkel' => $kb->s_idkel
        );
        $id = (int) $kb->id_jlnreklame;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('id_jlnreklame' => $kb->id_jlnreklame));
        }
    }
    
    public function savedatazona($post){
        $sql = new Sql($this->adapter);
        
        $newData = array(
            'nama_zona_reklame'=> $post->nama_zona_reklame,
            'nilai_zona_reklame'=> $post->nilai_zona_reklame,
            'tglawal_zona'=> date('Y-m-d', strtotime($post->tglawal_zona)),
            'tglakhir_zona'=> date('Y-m-d', strtotime($post->tglakhir_zona))
            );
        
        $id = (int) $post->id_zona_reklame;
        if ($id == 0) {
            $insert = $sql->insert('byms_reklame_zona');
            
            $insert->values($newData);
            $selectString = $sql->prepareStatementForSqlObject($insert)->execute();
        }else{
            
             $sql = new Sql($this->adapter);
             $update = $sql->update();
             $update->table('byms_reklame_zona');
             
             $update->set($newData);
             $update->where('id_zona_reklame = '.$id.'');

             $statement = $sql->prepareStatementForSqlObject($update);
             $result = $statement->execute();
        }
        
        //$results = $this->adapter->query($selectString, Adapter::QUERY_MODE_EXECUTE);
    }
    
    public function hapusDatazona($id){
        $sql = new Sql($this->adapter);
        $delete = $sql->delete();
        $delete->from('byms_reklame_zona');
        $delete->where(array('id_zona_reklame' => $id));
        // get sql string
        $deleteQuery = $sql->prepareStatementForSqlObject($delete)->execute();
        
        //$result = $this->adapter->query($deleteQuery, 'execute');
    }

    public function getGridCount(JalanreklameBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
        $select->join(array(
            "b" => "s_kecamatan"
                ), "b.s_idkec = a.s_idkeckel", array(
            "s_kodekec" => "s_kodekec", "s_namakec" => "s_namakec"
                ), $select::JOIN_LEFT);
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(JalanreklameBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
        $select->join(array(
            "b" => "s_kecamatan"
                ), "b.s_idkec = a.s_idkeckel", array(
            "s_kodekec" => "s_kodekec", "s_namakec" => "s_namakec"
                ), $select::JOIN_LEFT);
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $select->where($where);
        if ($base->sortasc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortasc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            }
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataId($kb) {
        $rowset = $this->select(array('id_jlnreklame' => $kb));
        $row = $rowset->current();
        return $row;
    }

    public function hapusData($id) {
        $this->delete(array('id_jlnreklame' => $id));
    }

    public function comboBox() {
        $resultSet = $this->select();
        return $resultSet;
    }

    public function getByKecamatan(JalanreklameBase $kb) {
        $resultSet = $this->select(array('s_idkeckel' => $kb->s_idkeckel));
        return $resultSet;
    }

    public function getByKecamatan2($s_idkeckel) {
        $resultSet = $this->select(array('s_idkeckel' => $s_idkeckel));
        return $resultSet;
    }

    public function getdaftarjalanreklame() {
         $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("byms_reklame_lokasijln");
        $select->join("s_kecamatan", "s_kecamatan.s_idkec = byms_reklame_lokasijln.s_idkec", ["*"], "left");
        $select->join("s_kelurahan", "s_kelurahan.s_idkel = byms_reklame_lokasijln.s_idkel", ["*"], "left");
        $select->join("byms_reklame_zona", "byms_reklame_zona.id_zona_reklame = byms_reklame_lokasijln.id_zona_reklame", ["*"], "left");
        
        
        $where = new \Zend\Db\Sql\Where();
        //$where->literal("byms_reklame_lokasijln.kd_jlnreklame::text ILIKE '%".$input->getPost('sSearch_1')."%'");
        $select->where($where);
        $select->order("byms_reklame_lokasijln.s_idkec asc");
        $select->order("byms_reklame_lokasijln.s_idkel asc");
        $statement = $sql->prepareStatementForSqlObject($select);
        $rResult = $statement->execute();
        
        return $rResult;
    }

    public function getidkelurahanbyname($namakel) {
        $sql = "select s_idkel from s_kelurahan where s_namakel='" . $namakel . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }
    
    //========================================== datagrid kelurahan
    public function getjumlahdata($select) {
        
        $sql = new Sql($this->adapter);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }
    
   public function semuadata_kelurahankec($idkec) {
        
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_kelurahan");
        $select->join("s_kecamatan", "s_kecamatan.s_idkec = s_kelurahan.s_idkeckel", ["*"], "left");
        $where = new \Zend\Db\Sql\Where();
        $where->literal("s_kelurahan.s_idkeckel = ".$idkec." ");
        $select->where($where);
        $statement = $sql->prepareStatementForSqlObject($select);
        $rResult = $statement->execute();
        return $rResult;
        
   }    
   
   public function semuadata_zona() {
        
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("byms_reklame_zona");
        
        $where = new \Zend\Db\Sql\Where();
        //$where->literal("s_kelurahan.s_idkeckel = ".$idkec." ");
        $select->where($where);
        $statement = $sql->prepareStatementForSqlObject($select);
        $rResult = $statement->execute();
        return $rResult;
        
   }    
    
    public function semuadata_jalanreklame($input, $aColumns, $session, $cekurl, $allParams) {
        
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("byms_reklame_lokasijln");
        $select->join("s_kecamatan", "s_kecamatan.s_idkec = byms_reklame_lokasijln.s_idkec", ["*"], "left");
        $select->join("s_kelurahan", "s_kelurahan.s_idkel = byms_reklame_lokasijln.s_idkel", ["*"], "left");
        $select->join("byms_reklame_zona", "byms_reklame_zona.id_zona_reklame = byms_reklame_lokasijln.id_zona_reklame", ["*"], "left");
        
        
        $where = new \Zend\Db\Sql\Where();
        
        if(($input->getPost('sSearch_1')) || ($input->getPost('sSearch_1') == '0')){
              $where->literal("byms_reklame_lokasijln.kd_jlnreklame::text ILIKE '%".$input->getPost('sSearch_1')."%'");
        }
        if(($input->getPost('sSearch_2')) || ($input->getPost('sSearch_2') == '0')){
              $where->literal("byms_reklame_lokasijln.nama_jlnreklame ILIKE '%".$input->getPost('sSearch_2')."%'");
        }
        if(($input->getPost('sSearch_3')) || ($input->getPost('sSearch_3') == '0')){
              $where->literal("byms_reklame_zona.nama_zona_reklame::text ILIKE '%".$input->getPost('sSearch_3')."%'");
        }
        if(($input->getPost('sSearch_4')) || ($input->getPost('sSearch_4') == '0')){
              $where->literal("s_kecamatan.s_namakec ILIKE '%".$input->getPost('sSearch_4')."%'");
        }
        if(($input->getPost('sSearch_5')) || ($input->getPost('sSearch_5') == '0')){
              $where->literal("s_kelurahan.s_namakel ILIKE '%".$input->getPost('sSearch_5')."%'");
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
            $select->order("byms_reklame_lokasijln.id_jlnreklame ASC");
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
           
            $btn = '<a href="setting_jalanreklame/edit?id_jlnreklame='.$aRow['id_jlnreklame'].'" class="btn btn-warning btn-xs btn-flat"><i class="fa fa-pencil"></i> Edit</a> <a href="#" onclick="hapus('.$aRow['id_jlnreklame'].');return false;" class="btn btn-danger btn-xs btn-flat"><i class="fa fa-trash"></i> Hapus</a>';
            $row = array("<center>".$no."</center>",  
                               $aRow['kd_jlnreklame'],$aRow['nama_jlnreklame'],$aRow['nama_zona_reklame'],$aRow['s_namakec'],$aRow['s_namakel'],
                         "<center>".$btn."</center>"
                        );
            
            $output['aaData'][] = $row;
            $no++;
        }
        
        return $output;
    }    
    //========================================== end datagrid kelurahan
    
    public function getDataIdzona($id) {
        
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("byms_reklame_zona");
        
        
        $where = new \Zend\Db\Sql\Where();
        $where->literal("id_zona_reklame = ".$id."");
        $select->where($where);
        //echo $select->getSqlString(); exit();
        $statement = $sql->prepareStatementForSqlObject($select);
        $rResult = $statement->execute()->current();
        
        return $rResult;
    }    
    
    
    //========================= datagridzona
    public function datagrid_zona($input, $aColumns, $session, $cekurl, $allParams) {
        
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("byms_reklame_zona");
        
        
        $where = new \Zend\Db\Sql\Where();
        
        if(($input->getPost('sSearch_1')) || ($input->getPost('sSearch_1') == '0')){
              $where->literal("nama_zona_reklame::text ILIKE '%".$input->getPost('sSearch_1')."%'");
        }
        if(($input->getPost('sSearch_2')) || ($input->getPost('sSearch_2') == '0')){
              $where->literal("nilai_zona_reklame::text ILIKE '%".$input->getPost('sSearch_2')."%'");
        }
        if(($input->getPost('sSearch_3')) || ($input->getPost('sSearch_3') == '0')){
            $tanggal = explode('-', $input->getPost('sSearch_3'));
            if (count($tanggal) > 1) {    
                if (count($tanggal) > 2) {
                    $tanggalcari = "" . $tanggal[2] . "-" . $tanggal[1] . "-" . $tanggal[0] . "";
                    $where->literal("tglawal_zona::text ILIKE '%".$tanggalcari."%'");
                }else{
                    $tanggalcari = "" .$tanggal[1] . "-" . $tanggal[0] . "";
                    $where->literal("tglawal_zona::text ILIKE '%".$tanggalcari."%'");
                }
            }else{
                $where->literal("tglawal_zona::text ILIKE '%".$input->getPost('sSearch_3')."%'");
            }    
            
        }
        if(($input->getPost('sSearch_4')) || ($input->getPost('sSearch_4') == '0')){
            $tanggal = explode('-', $input->getPost('sSearch_4'));
            if (count($tanggal) > 1) {    
                if (count($tanggal) > 2) {
                    $tanggalcari = "" . $tanggal[2] . "-" . $tanggal[1] . "-" . $tanggal[0] . "";
                    $where->literal("tglakhir_zona::text ILIKE '%".$tanggalcari."%'");
                }else{
                    $tanggalcari = "" .$tanggal[1] . "-" . $tanggal[0] . "";
                    $where->literal("tglakhir_zona::text ILIKE '%".$tanggalcari."%'");
                }
            }else{
                $where->literal("tglakhir_zona::text ILIKE '%".$input->getPost('sSearch_4')."%'");
            } 
              
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
            $select->order("id_zona_reklame ASC");
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
           
            $btn = '<a href="'.$cekurl.'/setting_jalanreklame/editzona?id_zona_reklame='.$aRow['id_zona_reklame'].'" class="btn btn-warning btn-xs btn-flat"><i class="fa fa-pencil"></i> Edit</a> <a href="#" onclick="hapus('.$aRow['id_zona_reklame'].');return false;" class="btn btn-danger btn-xs btn-flat"><i class="fa fa-trash"></i> Hapus</a>';
            $row = array("<center>".$no."</center>",  
                               $aRow['nama_zona_reklame'],$aRow['nilai_zona_reklame'],date('d-m-Y',  strtotime($aRow['tglawal_zona'])),date('d-m-Y',  strtotime($aRow['tglakhir_zona'])),
                         "<center>".$btn."</center>"
                        );
            
            $output['aaData'][] = $row;
            $no++;
        }
        
        return $output;
    }    
    //========================= end datagridzona

    //====================== ambil satu data kelurahan
    public function getOneKelurahan($id) {
        $resultSet = $this->select(array('s_idkel' => $id));
        return $resultSet->current();
    }
    //====================== end ambil satu data kelurahan
    
}
