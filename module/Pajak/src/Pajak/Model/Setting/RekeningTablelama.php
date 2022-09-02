<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class RekeningTable extends AbstractTableGateway {

    protected $table = 's_rekening',
                $view = 'view_rekening';
    

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new RekeningBase());
        $this->initialize();
    }

    public function getRekeningId($s_idkorek) {
        $rowset = $this->select(array('s_idkorek' => $s_idkorek));
        $row = $rowset->current();
        return $row;
    }

    public function savedata(RekeningBase $kc, $session) {
        $data = array(
            's_jenisobjek' => $kc->s_jenisobjek,
            's_tipekorek' => $kc->s_tipekorek,
            's_kelompokkorek' => $kc->s_kelompokkorek,
            's_jeniskorek' => $kc->s_jeniskorek,
            's_objekkorek' => $kc->s_objekkorek,
            's_rinciankorek' => $kc->s_rinciankorek,
            's_sub1korek' => $kc->s_sub1korek,
            's_sub2korek' => $kc->s_sub2korek,
            's_sub3korek' => $kc->s_sub3korek,
            's_namakorek' => $kc->s_namakorek,
            's_persentarifkorek' => $kc->s_persentarifkorek,
            's_tarifdasarkorek' => $kc->s_tarifdasarkorek,
            's_voldasarkorek' => $kc->s_voldasarkorek,
            's_tariftambahkorek' => $kc->s_tariftambahkorek,
            's_tglawalkorek' => date('Y-m-d', strtotime($kc->s_tglawalkorek)),
            's_tglakhirkorek' => date('Y-m-d', strtotime($kc->s_tglakhirkorek))
        );
        $id = (int) $kc->s_idkorek;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idkorek' => $kc->s_idkorek));
        }
    }

    public function getGridCount(RekeningBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->view);
        $where = new Where();
        $where->equalTo('is_deluser', 0);
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari LIKE '%$base->kolomcari%'");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        // $where->literal("s_idjenis <= 9"); //pajak doang
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(RekeningBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->view);
        $where = new Where();
        $where->equalTo('is_deluser', 0);
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari LIKE '%$base->kolomcari%'");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }

        // $where->literal("s_idjenis <= 9"); //pajak doang
        $select->where($where);
        if ($base->sortasc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortasc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            }
        } else {
            $select->order('korek asc');
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function hapusData($id) {
        $this->delete(array('s_idkorek' => $id));
    }

    public function getdaftarrekening($rekening) {
        // var_dump($rekening);exit();
        
        $sql = "select * from view_rekening where is_deluser=0 and s_idkorek $rekening order by s_tipekorek, s_kelompokkorek, s_jeniskorek, s_objekkorek, s_rinciankorek, s_sub1korek ";
        $statement = $this->adapter->query($sql);
        // var_dump($sql);exit();
        return $statement->execute();
    }

    public function getdataRekening() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_rekening');
        $where = new Where();
        $where->equalTo('s_rinciankorek', '00');
        $where->equalTo('is_deluser', 0);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getRekeningParentByJenis($jenis) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_rekening');
        $where = new Where();
        $where->equalTo('s_rinciankorek', '00');
        $where->equalTo('is_deluser', 0);
        $where->equalTo('s_jenisobjek', $jenis);
        $select->where($where);
        $select->order(['s_tipekorek', 's_kelompokkorek', 's_jeniskorek', 's_objekkorek', 's_rinciankorek']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->current();
    }
    
    public function getRekeningParentByKorek($korek) {
        $korek=$korek.'.000';
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        $where->equalTo('korek', $korek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
         // echo $select->getSqlString();exit();
        $res = $state->execute();
        return $res->current();
    }
    
    public function getRekeningByJenis($jenis) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_rekening');
        $where = new Where();
        $where->notEqualTo('s_rinciankorek', '00');
        $where->equalTo('s_jeniskorek', '01');
        $where->EqualTo('s_sub1korek', '000');
        // $where->notEqualTo('s_jeniskorek', '4');
        $where->equalTo('is_deluser', 0);
        $where->equalTo('s_jenisobjek', $jenis);
        // $where->notEqualTo('s_jeniskorek', '04')->AND->notEqualTo('s_objekkorek', '08');
        $select->where($where);
        $select->order(['s_tipekorek', 's_kelompokkorek', 's_jeniskorek', 's_objekkorek', 's_rinciankorek']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getRekeningSubByJenis($jenis) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_rekening');
        $where = new Where();
        $where->notEqualTo('s_persentarifkorek', 0);
        $where->notEqualTo('s_rinciankorek', '00');
        $where->notEqualTo('s_sub1korek', '');
        $where->equalTo('s_jenisobjek', $jenis);
        $select->where($where);
        $select->order(['s_tipekorek', 's_kelompokkorek', 's_jeniskorek', 's_objekkorek', 's_rinciankorek', 's_sub1korek']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataRekeningId($s_idkorek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        $where->equalTo('s_idkorek', (int) $s_idkorek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    

    public function getdataJenisObjek() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_jenisobjek');
        $where = new Where();
        $where->literal("s_idjenis not in (10,11)"); // pajak dan retribusi jika di butuhkan
        // $where->literal("s_idjenis <= 9"); // pajak doang
        $select->where($where);
        $select->order("s_idjenis asc");
        $state = $sql->prepareStatementForSqlObject($select);
        // var_dump($state);exit();
        $res = $state->execute();
        return $res;
    }

    public function getdataJenisObjekOff() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_jenisobjek');
        $where = new Where();
        $where->literal('s_idjenis in (4,8)');
        $select->where($where);
        $select->order("s_idjenis asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataJenisObjekOffret() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_jenisobjek');
        $where = new Where();
        $where->literal("s_jenispungutan = 'Retribusi' ");
        $select->where($where);
        $select->order("s_idjenis asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getdataRekOff() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $select->columns(array(
            's_idkorek', 'korek', 's_namakorek'
        ));
        $where = new Where();
        $where->literal('s_jenisobjek in (4,8)');
        $where->notEqualTo('s_rinciankorek', '00');
        $select->where($where);
        $select->order("s_jenisobjek asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataRekOffret() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $select->columns(array(
            's_idkorek', 'korek', 's_namakorek'
        ));
        $where = new Where();
        $where->literal('s_jenisobjek not in (1,2,3,4,5,6,7,8,9)');
        $where->notEqualTo('s_rinciankorek', '00');
        $where->notEqualTo('s_objekkorek', '0');
        $where->equalTo('s_jeniskorek', '02');
        $select->where($where);
        $select->order("s_jenisobjek asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getdataJenisObjekId($s_idjenis) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_jenisobjek');
        $where = new Where();
        $where->equalTo('s_idjenis', (int) $s_idjenis);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getGridCountRekening(RekeningBase $base, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        if ($parametercari->korek != '')
            $where->literal("korek LIKE '%$parametercari->korek%'");
        if ($parametercari->s_namakorek != '')
            $where->literal("s_namakorek LIKE '%$parametercari->s_namakorek%'");
        if ($parametercari->s_persentarifkorek != '')
            $where->literal("s_persentarifkorek LIKE '%$parametercari->s_persentarifkorek%'");
        if (!empty($parametercari->t_jenisobjek)) {
            $where->equalTo('s_jenisobjek', $parametercari->t_jenisobjek);
        }
        $where->notEqualTo('s_rinciankorek', '00');
        $where->notEqualTo('s_sub1korek', '000');
        $where->notEqualTo('s_jeniskorek', '04');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataRekening(RekeningBase $base, $start, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        if ($parametercari->korek != '')
            $where->literal("korek LIKE '%$parametercari->korek%'");
        if ($parametercari->s_namakorek != '')
            $where->literal("s_namakorek LIKE '%$parametercari->s_namakorek%'");
        if ($parametercari->s_persentarifkorek != '')
            $where->literal("s_persentarifkorek LIKE '%$parametercari->s_persentarifkorek%'");
        if (!empty($parametercari->t_jenisobjek)) {
            $where->equalTo('s_jenisobjek', $parametercari->t_jenisobjek);
        }
        $where->notEqualTo('s_rinciankorek', '00');
        $where->notEqualTo('s_sub1korek', '000');
        $where->notEqualTo('s_jeniskorek', '04');
        $select->where($where);
        $select->order('s_rinciankorek asc');
        $select->order('s_sub1korek asc');
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        // var_dump($sql->prepareStatementForSqlObject($select));exit();
        $res = $state->execute();
        return $res;
    }

	public function getGridCountRekeningSetoranlain(RekeningBase $base, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        if ($parametercari->korek != '')
            $where->literal("korek LIKE '%$parametercari->korek%'");
        if ($parametercari->s_namakorek != '')
            $where->literal("s_namakorek LIKE '%$parametercari->s_namakorek%'");
        if ($parametercari->s_persentarifkorek != '')
            $where->literal("s_persentarifkorek LIKE '%$parametercari->s_persentarifkorek%'");
        if (!empty($parametercari->t_jenisobjek)) {
            $where->equalTo('s_jenisobjek', $parametercari->t_jenisobjek);
        }
        $where->notEqualTo('s_rinciankorek', '00');
        $where->notEqualTo('s_objekkorek', '0');
//        $where->notEqualTo('s_sub1korek', '');
        // $where->notEqualTo('s_jeniskorek', '4');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataRekeningSetoranlain(RekeningBase $base, $start, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        if ($parametercari->korek != '')
            $where->literal("korek LIKE '%$parametercari->korek%'");
        if ($parametercari->s_namakorek != '')
            $where->literal("s_namakorek LIKE '%$parametercari->s_namakorek%'");
        if ($parametercari->s_persentarifkorek != '')
            $where->literal("s_persentarifkorek LIKE '%$parametercari->s_persentarifkorek%'");
        if (!empty($parametercari->t_jenisobjek)) {
            $where->equalTo('s_jenisobjek', $parametercari->t_jenisobjek);
        }
        $where->notEqualTo('s_rinciankorek', '00');
        $where->notEqualTo('s_objekkorek', '0');
//        $where->notEqualTo('s_sub1korek', '');
        // $where->notEqualTo('s_jeniskorek', '4');
        $select->where($where);
        // $select->order('s_rinciankorek asc');
        $select->order('korek asc');
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
	
    public function getGridCountRekeningTarget(RekeningBase $base, $parametercari) {
        $reksudah = $this->getdataSudah($parametercari->s_idtargetheader);

//        $data = array();
//        foreach ($reksudah as $row) {
//            $data[] = $row['s_targetrekening'];
//        }
//        $sudah = implode(",", $data);
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array('a' => 'view_rekening'));
        // $select->join(array(
            // "b" => "s_targetdetail"
                // ), "b.s_targetrekening = a.s_idkorek", array(
            // "s_idtargetdetail"
                // ), $select::JOIN_LEFT);
        $where = new Where();
        if ($parametercari->korek != '')
            $where->literal("korek LIKE '%$parametercari->korek%'");
        if ($parametercari->s_namakorek != '')
            $where->literal("s_namakorek ILIKE '%$parametercari->s_namakorek%'");
        // if ($parametercari->s_persentarifkorek != '')
        //     $where->literal("s_persentarifkorek LIKE '%$parametercari->s_persentarifkorek%'");
        // if (!empty($parametercari->tahuntarget)) {
        //     $where->literal("(extract(year from s_tglawalkorek) ='" . $parametercari->tahuntarget . "' or extract(year from s_tglakhirkorek) ='" . $parametercari->tahuntarget . "')");
        // }
//        $where->notEqualTo('s_rinciankorek', '00');
//        $where->notIn("s_targetrekening", $sudah);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        // var_dump($state);exit();
        return $res->count();
    }

    public function getGridDataRekeningTarget(RekeningBase $base, $start, $parametercari) {
        // $reksudah = $this->getdataSudah($parametercari->s_idtargetheader);
       // $data = array();
       // foreach ($reksudah as $row) {
           // $data[] = $row['s_targetrekening'];
       // }
       // $sudah = implode(",", $data);
//         $sql = new Sql($this->adapter);
//         $select = $sql->select();
//         $select->from(array('a' => 'view_rekening'));
//         // $select->join(array(
//             // "b" => "s_targetdetail"
//                 // ), "b.s_targetrekening = a.s_idkorek", array(
//             // "s_idtargetdetail"
//                 // ), $select::JOIN_LEFT);
//         $where = new Where();
//         if ($parametercari->korek != '')
//             $where->literal("korek LIKE '%$parametercari->korek%'");
//         if ($parametercari->s_namakorek != '')
//             $where->literal("s_namakorek LIKE '%$parametercari->s_namakorek%'");
//         if ($parametercari->s_persentarifkorek != '')
//             $where->literal("s_persentarifkorek LIKE '%$parametercari->s_persentarifkorek%'");
//         if (!empty($parametercari->tahuntarget)) {
//             $where->literal("(extract(year from s_tglawalkorek) ='" . $parametercari->tahuntarget . "' or extract(year from s_tglakhirkorek) ='" . $parametercari->tahuntarget . "')");
//         }
// //        $where->notEqualTo('s_rinciankorek', '00');
// //        $where->notIn("s_targetrekening", $sudah);
//         $select->where($where);
//         $select->order('korek asc');
//         $select->limit($base->rows = (int) $base->rows);
//         $select->offset($start);
//         $state = $sql->prepareStatementForSqlObject($select);
//         $res = $state->execute();
//         return $res;
//     }
        $reksudah = $this->getdataSudah($parametercari->s_idtargetheader);
//        $data = array();
//        foreach ($reksudah as $row) {
//            $data[] = $row['s_targetrekening'];
//        }
//        $sudah = implode(",", $data);
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_rekening");
        $select->join("s_targetdetail", "s_targetdetail.s_targetrekening = s_rekening.s_idkorek", ["s_idtargetdetail",
                        "koderek" => new \Zend\Db\Sql\Expression("(s_rekening.s_tipekorek||'.'||s_rekening.s_kelompokkorek||'.'||s_rekening.s_jeniskorek||'.'||s_rekening.s_objekkorek||'.'||s_rekening.s_rinciankorek||'.'||s_rekening.s_sub1korek||'.'||s_rekening.s_sub2korek||'.'||s_rekening.s_sub3korek)")
            ], "left");
        $where = new Where();
        
        if(!empty($parametercari->s_idtargetheader)){
            $where->literal("NOT EXISTS (select * from s_target left join s_targetdetail on s_targetdetail.s_idtargetheader = s_target.s_idtarget where s_idtarget = ".$parametercari->s_idtargetheader." and s_targetrekening = s_rekening.s_idkorek) ");
        }
        
        if ($parametercari->korek != '')
            $where->literal("(s_rekening.s_tipekorek||'.'||s_rekening.s_kelompokkorek||'.'||s_rekening.s_jeniskorek||'.'||s_rekening.s_objekkorek||'.'||s_rekening.s_rinciankorek||'.'||s_rekening.s_sub1korek||'.'||s_rekening.s_sub2korek||'.'||s_rekening.s_sub3korek) ILIKE '%$parametercari->korek%'");
        if ($parametercari->s_namakorek != '')
            $where->literal("s_rekening.s_namakorek ILIKE '%$parametercari->s_namakorek%'");
        if ($parametercari->s_persentarifkorek != '')
            $where->literal("s_rekening.s_persentarifkorek::text ILIKE '%$parametercari->s_persentarifkorek%'");
        if (!empty($parametercari->tahuntarget)) {
            //$where->literal("(date_part('year',s_rekening.s_tglawalkorek) >='" . $parametercari->tahuntarget . "' or date_part('year',s_rekening.s_tglakhirkorek) >='" . $parametercari->tahuntarget . "')");
        }
        //$where->notEqualTo('s_rekening.s_rinciankorek', '00');
//        $where->notIn("s_targetrekening", $sudah);
        $select->where($where);
        
       
        
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($start);
        $select->order("s_tipekorek asc");
        $select->order("s_kelompokkorek asc");
        $select->order("s_jeniskorek asc");
        $select->order("s_objekkorek asc");
        $select->order("s_rinciankorek asc");
        $select->order("s_sub1korek asc");
        $select->order("s_sub2korek asc");
        $select->order("s_sub3korek asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountRekeningUser(RekeningBase $base, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        if ($parametercari->korek != '')
            $where->literal("korek LIKE '%$parametercari->korek%'");
        if ($parametercari->s_namakorek != '')
            $where->literal("s_namakorek LIKE '%$parametercari->s_namakorek%'");
        if ($parametercari->s_persentarifkorek != '')
            $where->literal("s_persentarifkorek LIKE '%$parametercari->s_persentarifkorek%'");
        if (!empty($parametercari->t_jenisobjek)) {
            $where->equalTo('s_jenisobjek', $parametercari->t_jenisobjek);
        }
        $where->notEqualTo('s_rinciankorek', '00');
        $where->notEqualTo('s_jeniskorek', '04');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataRekeningUser(RekeningBase $base, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        if ($parametercari->korek != '')
            $where->literal("korek LIKE '%$parametercari->korek%'");
        if ($parametercari->s_namakorek != '')
            $where->literal("s_namakorek LIKE '%$parametercari->s_namakorek%'");
        if ($parametercari->s_persentarifkorek != '')
            $where->literal("s_persentarifkorek LIKE '%$parametercari->s_persentarifkorek%'");
        if (!empty($parametercari->t_jenisobjek)) {
            $where->equalTo('s_jenisobjek', $parametercari->t_jenisobjek);
        }
        $where->notEqualTo('s_rinciankorek', '00');
        $where->notEqualTo('s_jeniskorek', '04');
        $select->where($where);
//        $select->limit($base->rows = (int) $base->rows);
//        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataRekeningPPJ() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        $where->equalTo('is_deluser', 0);
        $where->equalTo('s_jenisobjek', 5);
        $where->equalTo('s_jeniskorek', '01');
        $where->notEqualTo('s_rinciankorek', '00');
        $where->literal("s_sub1korek::text !='' ");
        // $where->equalTo('s_rinciankorek', $id);
        $select->where($where);
        $select->order(['s_tipekorek' => 'asc', 's_kelompokkorek' => 'asc', 's_jeniskorek' => 'asc', 's_objekkorek' => 'asc', 's_rinciankorek' => 'asc', 's_sub1korek' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataRekeningMineral() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        $where->equalTo('is_deluser', 0);
        $where->equalTo('s_jenisobjek', 6);
        $where->equalTo('s_jeniskorek', '01');
        $where->notEqualTo('s_rinciankorek', '00');
        // $where->literal("s_sub1korek::text !='' ");
        $select->where($where);
        $select->order(['s_tipekorek' => 'asc', 's_kelompokkorek' => 'asc', 's_jeniskorek' => 'asc', 's_objekkorek' => 'asc', 's_rinciankorek' => 'asc', 's_sub1korek' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataRekeningParkir() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        $where->equalTo('is_deluser', 0);
        $where->equalTo('s_jenisobjek', 7);
        $where->equalTo('s_jeniskorek', '01');
        $where->notEqualTo('s_rinciankorek', '00');
        $where->literal("s_sub1korek::text !='' ");
        $select->where($where);
        $select->order(['s_tipekorek' => 'asc', 's_kelompokkorek' => 'asc', 's_jeniskorek' => 'asc', 's_objekkorek' => 'asc', 's_rinciankorek' => 'asc', 's_sub1korek' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getdataSudah($idheader) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_targetdetail');
        $where = new Where();
        $where->equalTo('s_idtargetheader', $idheader);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

	public function getRekeningDendaByJenis($jenis) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_rekening');
        $where = new Where();
        // $where->equalTo('s_rinciankorek', '00');
        $where->equalTo('is_deluser', 0);
        $where->equalTo('s_jenisobjek', $jenis);
        $where->equalTo('s_jeniskorek', '04');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->current();
    }

    public function getdataRekeningByIdJenisObjek($t_jenispajak) {
        // var_dump($t_jenispajak);exit();
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        $where->equalTo('s_jenisobjek', (int) $t_jenispajak);
     if ($t_jenispajak == 1 || $t_jenispajak == 2 || $t_jenispajak == 3 || $t_jenispajak == 4 || $t_jenispajak == 5 || $t_jenispajak ==6 || $t_jenispajak == 7 || $t_jenispajak == 8 || $t_jenispajak == 9) {
            $where->equalTo('s_jeniskorek', '01');
        }
            if ((int)$t_jenispajak==6) {
               $where->EqualTo('s_sub1korek', '000'); 
               $where->EqualTo('s_rinciankorek', '00');
            }else{
            $where->notEqualTo('s_rinciankorek', '00');
            $where->EqualTo('s_sub1korek', '000');
            }
        $select->where($where);
        $select->order("korek asc");
        $state = $sql->prepareStatementForSqlObject($select);
        // echo $select->getSqlString();exit();
        $res = $state->execute();
        return $res;
    }



    public function getDataByIdrekening($t_jenispajak, $t_idkorek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekening');
        $where = new Where();
        $where->equalTo('s_jenisobjek', (int) $t_jenispajak);
        if(!empty($t_idkorek)){
            $where->equalTo('s_idkorek', (int) $t_idkorek);
        }
        $where->notEqualTo('s_rinciankorek', '00');
        $where->equalTo('s_jeniskorek', '01');
        $select->where($where);
        $select->order("korek asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function comboBoxRekening() {
        $sql = "select * from s_rekening "
                . "where s_jenisobjek='4' "
                . "and s_rinciankorek != '00' "
                . "and s_jeniskorek = '01' "
                . "order by s_idkorek asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function comboBoxRekeningMinerba() {
        $sql = "select * from s_rekening "
                . "where s_jenisobjek='6' "
                . "and s_rinciankorek != '00' "
                . "and s_jeniskorek = '01' "
                . "order by s_idkorek asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getdataJenisMinerba($tarif) {
         $sql = "select * from view_rekening where s_objekkorek = '14' and s_persentarifkorek='$tarif'";
         $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getDataRekeningMinerba($t_idkorek){
        $sql = "select * from view_rekening where s_idkorek = '$t_idkorek'";
         $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

   

    
}
