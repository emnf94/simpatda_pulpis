<?php

namespace Pajak\Model\CustomLayout;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class CustomLayoutTable extends AbstractTableGateway {
    protected $table = 'fr_background';
    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new \Pajak\Model\CustomLayout\CustomLayoutBase());
        $this->initialize();
    }
    
    public function lastinputbg() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("fr_background");
        $select->order("id_bg DESC");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function savedata($path, $session, $datapost, $id_bg=null) {
        $data = array(
            "s_iduser" => $session['s_iduser'],
            "status_bg" => $datapost['status_bg']
        );
        if (!empty($path)) {
            $file = str_replace('\\', '/', $path);
            $data["file_bg"] = '/'.$file;
        }
        $id = (int) $datapost['id_bg'];
        if ($id == 0) {
            if($datapost['status_bg'] == 1){
                $this->insert($data);
                
                $datalast = $this->lastinputbg();
                $data2 = array(
                    "status_bg" => 2
                );
                
                $sql = new Sql($this->adapter);
                $update = $sql->update();
                $update->table('fr_background');
                $update->set($data2);
                $update->where('id_bg != '.$datalast['id_bg'].'');

                $statement = $sql->prepareStatementForSqlObject($update);
                $result = $statement->execute();
            }else{
                $this->insert($data);
            }
            
        } else {
            if($datapost['status_bg'] == 1){
                $this->update($data, array("id_bg" => $id));
                
                $data2 = array(
                    "status_bg" => 2
                );
                
                
                $sql = new Sql($this->adapter);
                $update = $sql->update();
                $update->table('fr_background');
                $update->set($data2);
                $update->where('id_bg != '.$id.'');

                $statement = $sql->prepareStatementForSqlObject($update);
                $result = $statement->execute();
                
            }else{
                $this->update($data, array("id_bg" => $id));
            }
            
            
        }
        
        
    }
    
    public function hapusData($id) {
        $this->delete(array('id_bg' => $id));
    }
    
    public function getDataId($kb) {
        $rowset = $this->select(array('id_bg' => $kb));
        $row = $rowset->current();
        return $row;
    }

    public function get_bg(){
        $sql = "SELECT * FROM fr_background where status_bg = 1";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->current();
        
        return $res;
    }
    
    public function get_layout(){
        $sql = "SELECT * FROM fr_layout a left join fr_ref_layout b on a.warna_layout = b.id_ref_layout";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->current();
        
        return $res;
    }
    
    //================= datagrid pembayaran
    public function getjumlahdata($sTable, $count, $sWhere) {
        $sql = "SELECT ".$count." FROM " . $sTable . "" . $sWhere;
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->count();
        return $res;
    }
    
    public function semuadataackground($sTable, $count, $input, $order_default, $aColumns, $session, $cekurl) {
        
        $aOrderingRules = array();
        $sLimit = "";
        if ($input->getPost('iDisplayStart') && $input->getPost('iDisplayLength') != '-1') {
            $sLimit = " LIMIT " . intval($input->getPost('iDisplayLength')) . " OFFSET " . intval($input->getPost('iDisplayStart'));
            //var_dump($sLimit);
            //exit();
            $no = 1 + intval($input->getPost('iDisplayStart'));
        } else {
            if (intval($input->getPost('iDisplayLength')) >= 1) {
                $sLimit = " LIMIT " . intval($input->getPost('iDisplayLength')) . " OFFSET " . intval($input->getPost('iDisplayStart'));
                $no = 1 + intval($input->getPost('iDisplayStart'));
            } else {
                $sLimit = " LIMIT 10 OFFSET 0";
                $no = 1;
            }
        }

      
        $aOrderingRules = array();
        if ($input->getPost('iSortCol_0')) {
            $iSortingCols = intval($input->getPost('iSortingCols'));
            for ($i = 0; $i < $iSortingCols; $i++) {
                if ($input->getPost('bSortable_' . intval($input->getPost('iSortCol_' . $i))) == 'true') {
                    $aOrderingRules[] = " " . $aColumns[intval($input->getPost('iSortCol_' . $i))] . "  "
                            . ($input->getPost('sSortDir_' . $i) === 'asc' ? 'asc' : 'desc');
                }
            }
        }
    
        if (!empty($aOrderingRules)) {
            $sOrder = " ORDER BY " . implode(", ", $aOrderingRules);
        } else {
            $sOrder = " ORDER BY ".$order_default."";
        }

        $iColumnCount = count($aColumns);
        
        if ($input->getPost('sSearch') && $input->getPost('sSearch') != "") {
            $aFilteringRules = array();
            for ($i = 0; $i < $iColumnCount; $i++) {
                if ($input->getPost('bSearchable_' . $i) && $input->getPost('bSearchable_' . $i) == 'true') {
                    $tanggal = explode('-', $input->getPost('sSearch'));
                    if (count($tanggal) > 1) {
                        if (count($tanggal) > 2) {
                            $tanggalcari = "" . $tanggal[2] . "-" . $tanggal[1] . "-" . $tanggal[0] . "";
                            $aFilteringRules[] = " " . $aColumns[$i] . "::text  ILIKE '%" . $tanggalcari . "%'";
                        }else{
                            $tanggalcari = "" .$tanggal[1] . "-" . $tanggal[0] . "";
                            $aFilteringRules[] = " " . $aColumns[$i] . "::text  ILIKE '%" . $tanggalcari . "%'";
                        }
                    }else {
                        $aFilteringRules[] = " " . $aColumns[$i] . "::text  ILIKE '%" . $input->getPost('sSearch') . "%'";
                    }
                }
            }
            if (!empty($aFilteringRules)) {
                $aFilteringRules = array('(' . implode(" OR ", $aFilteringRules) . ')');
            }
        }

       
        for ($i = 0; $i < $iColumnCount; $i++) {
            if ($input->getPost('bSearchable_' . $i) && $input->getPost('bSearchable_' . $i) == 'true' && $input->getPost('sSearch_' . $i) != '') {
                $tanggal = explode('-', $input->getPost('sSearch_' . $i));
                
                if (count($tanggal) > 1) {
                    if (count($tanggal) > 2) {
                        $tanggalcari = "" . $tanggal[2] . "-" . $tanggal[1] . "-" . $tanggal[0] . "";
                        $aFilteringRules[] = " " . $aColumns[$i] . "::text  ILIKE '%" . $tanggalcari . "%'";
                    }else{
                        $tanggalcari = "" .$tanggal[1] . "-" . $tanggal[0] . "";
                        $aFilteringRules[] = " " . $aColumns[$i] . "::text  ILIKE '%" . $tanggalcari . "%'";
                    }
                }else {
                    if($aColumns[$i] == 's_idjenistransaksi'){
                        $aFilteringRules[] = " " . $aColumns[$i] . "::text  = '" . $input->getPost('sSearch_' . $i) . "'";
                    }elseif($aColumns[$i] == 't_idnotarisspt'){
                        $aFilteringRules[] = " " . $aColumns[$i] . "::text  = '" . $input->getPost('sSearch_' . $i) . "'";
                    }elseif($aColumns[$i] == 't_statusbayarspt'){
                        $aFilteringRules[] = " " . $aColumns[$i] . "::text  = '" . $input->getPost('sSearch_' . $i) . "'";
                    }elseif($aColumns[$i] == 'status_validasi'){
                        $aFilteringRules[] = " " . $aColumns[$i] . "::text  = '" . $input->getPost('sSearch_' . $i) . "'";
                    }else{
                        $aFilteringRules[] = " " . $aColumns[$i] . "::text  ILIKE '%" . $input->getPost('sSearch_' . $i) . "%'";
                    }
                    
                    //$aFilteringRules[] = " " . $aColumns[$i] . "::text  ILIKE '%" . $input->getPost('sSearch_' . $i) . "%'";
                }

                $datacariall = $input->getPost('sSearch_' . $i);
            }
        }

        

        if (!empty($aFilteringRules)) {
            $sWhere = " WHERE " . implode(" AND ", $aFilteringRules)." ";
        } else {
            $sWhere = " ";
        }

        $aQueryColumns = array();
        foreach ($aColumns as $col) {
            if ($col != ' ') {
                $aQueryColumns[] = $col;
            }
        }
        $sql = "SELECT " . implode(", ", $aQueryColumns) . "
                        FROM " . $sTable . " " . $sWhere . $sOrder . $sLimit; //count(*) OVER() AS SQL_CALC_FOUND_ROWS, 
        
        //var_dump($sql);
        //exit();
        
        $statement = $this->adapter->query($sql);
        $rResult = $statement->execute();
        
        
        
        $totaldata = $this->getjumlahdata($sTable, $count, $sWhere);
        $iTotal = $totaldata; //$totaldata['COUNT('.$count.')'];
        
        
        
        $output = array(
            "sEcho" => intval($input->getPost('sEcho')),
            "iTotalRecords" => $iTotal,
            "iTotalDisplayRecords" => $iTotal, 
            "aaData" => array(),
        );
        
        

        foreach ($rResult as $aRow) {
            $row = array();
            $btn = '<a href="background/edit?id_bg='.$aRow['id_bg'].'" class="btn btn-warning btn-xs btn-flat"><i class="fa fa-pencil"></i> Edit</a> <a href="#" onclick="hapus('.$aRow['id_bg'].');return false;" class="btn btn-danger btn-xs btn-flat"><i class="fa fa-trash"></i> Hapus</a>';
            
            for ($i = 0; $i < $iColumnCount; $i++) {
                $row[] = $aRow[$aColumns[$i]];
            }

            //id_bg', 's_tarifbphtb', 's_dasarhukumtarifbphtb','s_tanggaltarifbphtb','s_statustarifbphtb
            if($aRow['status_bg'] == 1){
                $status = 'Aktif';
            }else{
                $status = 'Tidak Aktif';
            }
            $row = array($no, $aRow['id_bg'], "<img src='".$cekurl.'/'.$aRow['file_bg']."' style='width: 90px;' />", $aRow['s_iduser'],$status , $btn);
            $output['aaData'][] = $row;
            $no++;
        }
        
        return $output;
    }
    
    public function ambilsatudata($query) {
        $sql = $query;
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->current();
        return $res;
    }
    
    public function simpandata($query) {
        $sql = $query;
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }
    //=========================== datagrid tarif bphtb

}
