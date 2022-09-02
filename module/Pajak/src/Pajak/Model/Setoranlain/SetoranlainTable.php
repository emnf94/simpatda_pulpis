<?php

namespace Pajak\Model\Setoranlain;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class SetoranlainTable extends AbstractTableGateway {

    protected $table = 't_setoran_lain';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SetoranlainBase());
        $this->initialize();
    }
    
    //========================================== datagrid pembayaran jenis ketetapan SPTPD
    public function getjumlahdata($select) {
        
        $sql = new Sql($this->adapter);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }
    
    
    public function semuadata_setoranlain($input, $aColumns, $session, $cekurl, $allParams) {
        $aOrderingRules = array();
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_setoran_lain");
        $select->columns(["s_idsetoranlain","tgl_setoranlain","nokohir_sl","s_iddinas","t_viapembayaran","no_sts","s_namadinas"]);
        $select->join("s_dinas", "s_dinas.s_iddinas = t_setoran_lain.s_iddinas", [], "left");
        $select->join("s_via_pembayaran", "s_via_pembayaran.s_idviapembayaran = t_setoran_lain.t_viapembayaran", ["s_namapembayaran"], "left");
        $select->join("t_setoran_laindetail", "t_setoran_laindetail.s_idsetoranlain = t_setoran_lain.s_idsetoranlain", ["total_setoran" => new \Zend\Db\Sql\Expression("coalesce(sum(jml_setorandetail), 0)")], "left");
        
        
        $where = new \Zend\Db\Sql\Where();
        
        if(($input->getPost('sSearch_1')) || ($input->getPost('sSearch_1') == '0')){
              $where->literal("t_setoran_lain.nokohir_sl::text ILIKE '%".$input->getPost('sSearch_1')."%'");
        }
        if(($input->getPost('sSearch_2')) || ($input->getPost('sSearch_2') == '0')){
              $where->literal("s_dinas.s_namadinas ILIKE '%".$input->getPost('sSearch_2')."%'");
        }
        if(($input->getPost('sSearch_3')) || ($input->getPost('sSearch_3') == '0')){
              $where->literal("t_setoran_lain.tgl_setoranlain ILIKE '%".$input->getPost('sSearch_3')."%'");
        }
        if(($input->getPost('sSearch_4')) || ($input->getPost('sSearch_4') == '0')){
              $where->literal("t_setoran_lain.t_viapembayaran = ".$input->getPost('sSearch_4')."");
        }
        
        
        $select->where($where);
        $select->group(["t_setoran_lain.s_idsetoranlain","tgl_setoranlain","nokohir_sl","t_setoran_lain.s_iddinas","t_viapembayaran","no_sts","t_setoran_lain.s_namadinas","s_via_pembayaran.s_namapembayaran"]);
        
        if(($input->getPost('sSearch_5')) || ($input->getPost('sSearch_5') == '0')){
              $jmldicari = $input->getPost('sSearch_5');
            
                $having = new \Zend\Db\Sql\Having();
                $having->expression('coalesce(sum(jml_setorandetail), 0) = ?', $jmldicari);
                $select->having($having);
        }
        
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
            $select->order("t_setoran_lain.s_idsetoranlain DESC");
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
           
            if($session['s_akses'] == 2){
                $hapus = '<a href="#" onclick="hapus('.$aRow['s_idsetoranlain'].');return false;" class="btn btn-danger btn-xs btn-flat"><i class="fa fa-trash"></i> Hapus</a>';
            }else{
                $hapus = '';
            }
            
            $btn = '<a href="'.$cekurl.'/setoranlain/edit/'.$aRow['s_idsetoranlain'].'" class="btn btn-success btn-xs btn-flat"><i class="fa fa-pencil"></i> Edit</a> <a href="setoranlain/tambahdetail/'.$aRow['s_idsetoranlain'].'" class="btn btn-warning btn-xs btn-flat"><i class="fa fa-plus"></i> Tambah Detail</a> '.$hapus.' ';
            $row = array("<center>".$no."</center>",  
                               "<center>".$aRow['nokohir_sl']."</center>",
                                $aRow['s_namadinas'],$aRow['tgl_setoranlain'],$aRow['s_namapembayaran'],"<div style='float: right;'>".number_format($aRow['total_setoran'], 0, ',', '.')."</div>",
                         "<center>".$btn."</center>"
                        );
            
            $output['aaData'][] = $row;
            $no++;
        }
        
        return $output;
    }    
    
    //================== data dinas
    
    public function semuadata_dinas($input, $aColumns, $session, $cekurl, $allParams) {
        $aOrderingRules = array();
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_dinas");
        $select->join("s_kecamatan", "s_kecamatan.s_idkec = s_dinas.s_idkec", ["s_kodekec", "s_namakec"], "left");
        $select->join("s_kelurahan", "s_kelurahan.s_idkel = s_dinas.s_idkel", ["s_kodekel", "s_namakel"], "left");
        
        $where = new \Zend\Db\Sql\Where();
        
        if(($input->getPost('sSearch_1')) || ($input->getPost('sSearch_1') == '0')){
              $where->literal("s_dinas.s_kodedinas ILIKE '%".$input->getPost('sSearch_1')."%'");
        }
        if(($input->getPost('sSearch_2')) || ($input->getPost('sSearch_2') == '0')){
              $where->literal("s_dinas.s_namadinas ILIKE '%".$input->getPost('sSearch_2')."%'");
        }
        if(($input->getPost('sSearch_3')) || ($input->getPost('sSearch_3') == '0')){
              $where->literal("s_dinas.jalan_dinas ILIKE '%".$input->getPost('sSearch_3')."%'");
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
            $select->order("s_iddinas DESC");
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
           
            $btn = '<a href="#" onclick="pilihDinas('.$aRow['s_iddinas'].');return false;" class="btn btn-danger btn-xs btn-flat"><i class="fa fa-hand-o-up"></i> PILIH</a>';
            $row = array("<center>".$no."</center>",  
                               $aRow['s_kodedinas'],$aRow['s_namadinas'],$aRow['jalan_dinas'],$aRow['s_namakec'],$aRow['s_namakel'],
                         "<center>".$btn."</center>"
                        );
            
            $output['aaData'][] = $row;
            $no++;
        }
        
        return $output;
    }    
    //========================================== end datagrid dinas
    
    //================================= datagrid rekening pajak
    
     public function semuadata_rekeningpajak($input, $aColumns, $session, $cekurl, $allParams) {
        $aOrderingRules = array();
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_rekening");
        $select->columns(["*","koderek" => new \Zend\Db\Sql\Expression("(s_tipekorek||'.'||s_kelompokkorek||'.'||s_jeniskorek||'.'||s_objekkorek||'.'||s_rinciankorek||'.'||s_sub1korek||'.'||s_sub2korek||'.'||s_sub3korek)")]);
        
        $where = new \Zend\Db\Sql\Where();
        
        if(($input->getPost('sSearch_1')) || ($input->getPost('sSearch_1') == '0')){
              $where->literal("(s_tipekorek||'.'||s_kelompokkorek||'.'||s_jeniskorek||'.'||s_objekkorek||'.'||s_rinciankorek||'.'||s_sub1korek||'.'||s_sub2korek||'.'||s_sub3korek) ILIKE '%".$input->getPost('sSearch_1')."%'");
        }
        if(($input->getPost('sSearch_2')) || ($input->getPost('sSearch_2') == '0')){
              $where->literal("s_namakorek ILIKE '%".$input->getPost('sSearch_2')."%'");
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
            $select->order("s_tipekorek ASC");
            $select->order("s_kelompokkorek ASC");
            $select->order("s_jeniskorek ASC");
            $select->order("s_objekkorek ASC");
            $select->order("s_rinciankorek ASC");
            $select->order("s_sub1korek ASC");
            $select->order("s_sub2korek ASC");
            $select->order("s_sub3korek ASC");
                                
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
           
            $btn = '<a href="#" onclick="pilihRekeningPajak('.$aRow['s_idkorek'].');" class="btn btn-danger btn-xs btn-flat"><i class="fa fa-hand-o-up"></i> PILIH</a>';
            $row = array("<center>".$no."</center>",  
                               $aRow['koderek'],$aRow['s_namakorek'],
                         "<center>".$btn."</center>"
                        );
            
            $output['aaData'][] = $row;
            $no++;
        }
        
        return $output;
    }
    
    //================================= end datagrid rekening pajak
    
    
    //================================== datagrid setoran lain detail
    
    public function semuadata_setoranlaindetail($input, $aColumns, $session, $cekurl, $allParams) {
        $aOrderingRules = array();
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_setoran_laindetail");
        $select->columns(["*","koderek" => new \Zend\Db\Sql\Expression("(s_tipekorek||'.'||s_kelompokkorek||'.'||s_jeniskorek||'.'||s_objekkorek||'.'||s_rinciankorek||'.'||s_sub1korek||'.'||s_sub2korek||'.'||s_sub3korek)")]);
        
        $where = new \Zend\Db\Sql\Where();
        
        $where->literal("s_idsetoranlain = ".$allParams['page']."");
        
        if(($input->getPost('sSearch_1')) || ($input->getPost('sSearch_1') == '0')){
              $where->literal("nama_penyetor ILIKE '%".$input->getPost('sSearch_1')."%'");
        }
        if(($input->getPost('sSearch_2')) || ($input->getPost('sSearch_2') == '0')){
              $where->literal("(s_tipekorek||'.'||s_kelompokkorek||'.'||s_jeniskorek||'.'||s_objekkorek||'.'||s_rinciankorek||'.'||s_sub1korek||'.'||s_sub2korek||'.'||s_sub3korek) ILIKE '%".$input->getPost('sSearch_2')."%'");
        }
        if(($input->getPost('sSearch_3')) || ($input->getPost('sSearch_3') == '0')){
              $where->literal("s_namakorek ILIKE '%".$input->getPost('sSearch_3')."%'");
        }
        if(($input->getPost('sSearch_4')) || ($input->getPost('sSearch_4') == '0')){
              $where->literal("jml_setorandetail::text ILIKE '%".$input->getPost('sSearch_4')."%'");
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
            $select->order("s_idsldetail DESC");
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
           
            $btn = '<a href="#" onclick="editsetorandetailpajak('.$aRow['s_idsldetail'].');return false;" class="btn btn-success btn-xs btn-flat"><i class="fa fa-edit"></i> EDIT</a> <a href="#" onclick="hapusSetorandetail('.$aRow['s_idsldetail'].');return false;" class="btn btn-danger btn-xs btn-flat"><i class="fa fa-bucket"></i> HAPUS</a>';
            $row = array("<center>".$no."</center>",  
                               $aRow['nama_penyetor'],$aRow['koderek'],$aRow['s_namakorek'],number_format($aRow['jml_setorandetail'], 0, ',', '.'),
                         "<center>".$btn."</center>"
                        );
            
            $output['aaData'][] = $row;
            $no++;
        }
        
        return $output;
    }
    
    //================================= end datagrid setoran lain detail
   
    public function savedata(SetoranlainBase $kb, $session) {
        
        $sql = "select max(nokohir_sl) as nokohir_sl from t_setoran_lain where extract(year from tgl_setoranlain) = ".date('Y', strtotime($kb->tgl_setoranlain))." ";
        $statement = $this->adapter->query($sql);
        $nokohir = $statement->execute()->current();
        
        $nokohir_sl = $nokohir['nokohir_sl']+1;
        
        $sql2 = new Sql($this->adapter);
        $select = $sql2->select();
        $select->from('s_dinas');
        $where = new Where();
        $where->literal("s_iddinas = ".$kb->s_iddinas." ");
        $select->where($where);
        //echo $select->getSqlString(); exit();
        $state = $sql2->prepareStatementForSqlObject($select);
        $datadinas = $state->execute()->current();
        
        
        $data = array(
            'tgl_setoranlain' => date('Y-m-d', strtotime($kb->tgl_setoranlain)),
            'nokohir_sl' => $nokohir_sl,
            's_iddinas' => $kb->s_iddinas,
            't_viapembayaran' => $kb->t_viapembayaran,
            'no_sts' => $kb->no_sts,
            's_namadinas' => $datadinas['s_namadinas']
        );
        $id = (int) $kb->s_idsetoranlain;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idsetoranlain' => $kb->s_idsetoranlain));
        }
        
        $slepacak = rand(1,4);
        
        sleep($slepacak);
        
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('t_setoran_lain');
        $where = new Where();
        $where->literal("t_setoran_lain.tgl_setoranlain = '".date('Y-m-d', strtotime($kb->tgl_setoranlain))."' and no_sts = '".$kb->no_sts."' and s_iddinas = ".$kb->s_iddinas." and nokohir_sl = ".$nokohir_sl." ");
        $select->where($where);
        //echo $select->getSqlString(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res['s_idsetoranlain'];
        
    }
    
    //======================= function insert update
    
    public function insertketabelnumber($data, $namafield){
        $isian = array();
        if(!empty($data)){
            $isian['namafield'] = ''.$namafield.',';
            $isian['valuefield'] = $data.',';
            
            $isian['namafieldupdate'] = ''.$namafield.'';
            $isian['samadengan'] = '=';
        }else{
            $isian['namafield'] = '';
            $isian['valuefield'] = '';
            
            $isian['namafieldupdate'] = '';
            $isian['samadengan'] = '';
        }
        
        return $isian;
    }
    
    public function insertketabeltext($data, $namafield){
        $isian = array();
        if(!empty($data)){
            $isian['namafield'] = ''.$namafield.',';
            $isian['valuefield'] = "'".$data."',";
            
            $isian['namafieldupdate'] = ''.$namafield.'';
            $isian['samadengan'] = '=';
        }else{
            $isian['namafield'] = '';
            $isian['valuefield'] = '';
            
            $isian['namafieldupdate'] = '';
            $isian['samadengan'] = '';
        }
        
        return $isian;
    }
    
    public function insertketabeldate($data, $namafield){
        $isian = array();
        if(!empty($data)){
            $isian['namafield'] = ''.$namafield.',';
            $isian['valuefield'] = " '".date('Y-m-d', strtotime($data))."',";
            
            $isian['namafieldupdate'] = ''.$namafield.'';
            $isian['samadengan'] = '=';
        }else{
            $isian['namafield'] = '';
            $isian['valuefield'] = '';
            
            $isian['namafieldupdate'] = '';
            $isian['samadengan'] = '';
        }
        
        return $isian;
    }
    
    //======================== end function insert update
    
    public function savedatadetailsetoranlain($session, $data_get) {
        
        $datarekening = $this->cekdatarekening($data_get->s_idkorek);
        
        $s_idsetoranlain = $this->insertketabelnumber($data_get->s_idsetoranlain, 's_idsetoranlain');
        $s_idkorek = $this->insertketabelnumber($data_get->s_idkorek, 's_idkorek');
        $jml_setorandetail = $this->insertketabelnumber(str_ireplace(".", "", $data_get['jml_setorandetail']), 'jml_setorandetail');
        $nama_penyetor = $this->insertketabeltext($data_get->nama_penyetor, 'nama_penyetor');
       
        
        if (!empty($data_get->s_idsldetail)) {
             $sqlupdate = "UPDATE t_setoran_laindetail set
                                ".$s_idsetoranlain['namafieldupdate']." ".$s_idsetoranlain['samadengan']." ".$s_idsetoranlain['valuefield']."
                                ".$s_idkorek['namafieldupdate']." ".$s_idkorek['samadengan']." ".$s_idkorek['valuefield']."    
                                ".$jml_setorandetail['namafieldupdate']." ".$jml_setorandetail['samadengan']." ".$jml_setorandetail['valuefield']."  
                                ".$nama_penyetor['namafieldupdate']." ".$nama_penyetor['samadengan']." ".$nama_penyetor['valuefield']."      
                                s_tipekorek = '".$datarekening['s_tipekorek']."', 
                                s_kelompokkorek = '".$datarekening['s_kelompokkorek']."', 
                                s_jeniskorek = '".$datarekening['s_jeniskorek']."', 
                                s_objekkorek = '".$datarekening['s_objekkorek']."', 
                                s_rinciankorek = '".$datarekening['s_rinciankorek']."',  
                                s_sub1korek = '".$datarekening['s_sub1korek']."', 
                                s_sub2korek = '".$datarekening['s_sub2korek']."', 
                                s_sub3korek = '".$datarekening['s_sub3korek']."', 
                                s_namakorek = '".$datarekening['s_namakorek']."'
                                where s_idsldetail = ".$data_get->s_idsldetail."  ";
            
            $result = $this->adapter->query($sqlupdate)->execute();
        } else {
            $sqlinsert = "INSERT INTO t_setoran_laindetail (
                                
                                ".$s_idsetoranlain['namafield']."
                                ".$s_idkorek['namafield']."
                                ".$jml_setorandetail['namafield']."
                                ".$nama_penyetor['namafield']."
                                s_tipekorek, 
                                s_kelompokkorek, 
                                s_jeniskorek, 
                                s_objekkorek, 
                                s_rinciankorek,  
                                s_sub1korek, 
                                s_sub2korek, 
                                s_sub3korek, 
                                s_namakorek
                        ) 
                    
                        VALUES (
                                
                                ".$s_idsetoranlain['valuefield']."
                                ".$s_idkorek['valuefield']."
                                ".$jml_setorandetail['valuefield']."
                                ".$nama_penyetor['valuefield']."
                                '".$datarekening['s_tipekorek']."',
                                '".$datarekening['s_kelompokkorek']."',
                                '".$datarekening['s_jeniskorek']."',
                                '".$datarekening['s_objekkorek']."',
                                '".$datarekening['s_rinciankorek']."',
                                '".$datarekening['s_sub1korek']."',
                                '".$datarekening['s_sub2korek']."',   
                                '".$datarekening['s_sub3korek']."', 
                                '".$datarekening['s_namakorek']."'    
                    )";
        
        //var_dump($sqlinsert); exit();
        
            $result = $this->adapter->query($sqlinsert)->execute();
        }
        $returnval = array(
            'result' => $result
        );
        return $returnval;
    }
    
    public function cekdatasetoranlain($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('t_setoran_lain');
        $select->columns(["s_idsetoranlain","tgl_setoranlain","nokohir_sl","s_iddinas","t_viapembayaran","no_sts","s_namadinas"]);
        //$select->join("s_dinas", "s_dinas.s_iddinas = t_setoran_lain.s_iddinas", ["s_namadinas"], "left");
        $select->join("s_via_pembayaran", "s_via_pembayaran.s_idviapembayaran = t_setoran_lain.t_viapembayaran", ["s_namapembayaran"], "left");
        $select->join("t_setoran_laindetail", "t_setoran_laindetail.s_idsetoranlain = t_setoran_lain.s_idsetoranlain", ["total_setoran" => new \Zend\Db\Sql\Expression("sum(jml_setorandetail)")], "left");
        $where = new Where();
        $where->literal("t_setoran_lain.s_idsetoranlain = ".$id."");
        $select->where($where);
        $select->group(["t_setoran_lain.s_idsetoranlain","tgl_setoranlain","nokohir_sl","s_iddinas","t_viapembayaran","no_sts","s_namadinas","s_via_pembayaran.s_namapembayaran"]);
        //echo $select->getSqlString(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function cekdatadinas($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_dinas');
        $where = new Where();
        $where->literal("s_iddinas = ".$id."");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    
    public function cekdatarekening($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_rekening');
        //$select->columns(["*","koderek" => new \Zend\Db\Sql\Expression("(s_tipekorek||'.'||s_kelompokkorek||'.'||s_jeniskorek||'.'||s_objekkorek||'.'||s_rinciankorek||'.'||s_sub1korek||'.'||s_sub2korek||'.'||s_sub3korek)")]);
        
        $where = new Where();
        $where->literal("s_idkorek = ".$id."");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function cekdatasetorandetail($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('t_setoran_laindetail');
        //$select->columns(["*","koderek" => new \Zend\Db\Sql\Expression("(s_tipekorek||'.'||s_kelompokkorek||'.'||s_jeniskorek||'.'||s_objekkorek||'.'||s_rinciankorek||'.'||s_sub1korek||'.'||s_sub2korek||'.'||s_sub3korek)")]);
        
        $where = new Where();
        $where->literal("s_idsldetail = ".$id."");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function hapusSemuasetoran($id) {
        $sqlhapus1 = "DELETE FROM t_setoran_lain where s_idsetoranlain= ".$id." ";
        $result2 = $this->adapter->query($sqlhapus1)->execute();
        
        $sqlhapus = "DELETE FROM t_setoran_laindetail where s_idsetoranlain= ".$id." ";
        $result = $this->adapter->query($sqlhapus)->execute();
        
        return $result;
    }
    
    public function hapusSetorandetail($id) {
        $sqlhapus = "DELETE FROM t_setoran_laindetail where s_idsldetail= ".$id." ";
        $result = $this->adapter->query($sqlhapus)->execute();
        
        return $result;
    }
    
    public function hapusSetoranlain($id) {
        $sqlhapus = "DELETE FROM t_setoran_lain where s_idsetoranlain= ".$id." ";
        $result = $this->adapter->query($sqlhapus)->execute();
        
        $sqlhapus1 = "DELETE FROM t_setoran_laindetail where s_idsetoranlain= ".$id." ";
        $result = $this->adapter->query($sqlhapus1)->execute();
        
        return $result;
    }
    
    //========================================== end datagrid pembayaran jenis ketetapan SPTPD
    
    public function cetakdatasetoranlain($data_get) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('t_setoran_lain');
        $select->columns(["s_idsetoranlain","tgl_setoranlain","nokohir_sl","s_iddinas","t_viapembayaran","no_sts"]);
        $select->join("s_dinas", "s_dinas.s_iddinas = t_setoran_lain.s_iddinas", ["s_namadinas"], "left");
        $select->join("s_via_pembayaran", "s_via_pembayaran.s_idviapembayaran = t_setoran_lain.t_viapembayaran", ["s_namapembayaran"], "left");
        $select->join("t_setoran_laindetail", "t_setoran_laindetail.s_idsetoranlain = t_setoran_lain.s_idsetoranlain", ["s_idsldetail","s_idkorek","jml_setorandetail" => new \Zend\Db\Sql\Expression("COALESCE(jml_setorandetail, 0)"),"s_tipekorek","s_kelompokkorek","s_jeniskorek","s_objekkorek","s_rinciankorek","s_sub1korek","s_sub2korek","s_sub3korek","s_namakorek"], "left");
        $where = new Where();
        $where->literal("t_setoran_lain.tgl_setoranlain >= '".date('Y-m-d', strtotime($data_get['tglbayar0']))."' and t_setoran_lain.tgl_setoranlain <= '".date('Y-m-d', strtotime($data_get['tglbayar1']))."'  ");
        $select->where($where);
        $select->order("t_setoran_laindetail.s_idsetoranlain ASC");
        //$select->group(["t_setoran_lain.s_idsetoranlain","tgl_setoranlain","nokohir_sl","s_iddinas","t_viapembayaran","no_sts","s_namadinas","s_via_pembayaran.s_namapembayaran"]);
        //echo $select->getSqlString(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    
}
