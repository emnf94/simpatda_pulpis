<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class AirTable extends AbstractTableGateway {

    protected $table = 's_air_tarif';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new AirBase());
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

    public function checkId(AirBase $kc) {
        $rowset = $this->select(array('s_idtarif' => $kc->s_idtarif));
        $row = $rowset->current();
        return $row;
    }

    public function savedata(AirBase $kc, $session) {
        $data = array(
            's_idzona' => $kc->s_idzona,
            's_idkelompok' => $kc->s_idkelompok,
            's_kodejenis' => $kc->s_kodejenis,
            's_nilai1' => $kc->s_nilai1,
            's_nilai2' => $kc->s_nilai2,
            's_nilai3' => $kc->s_nilai3,
            's_nilai4' => $kc->s_nilai4,
            's_nilai5' => $kc->s_nilai5,
            's_nilai6' => $kc->s_nilai6
        );
        $id = (int) $kc->s_idtarif;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idtarif' => $kc->s_idtarif));
        }
    }

    public function getGridCount(AirBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
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

    public function getGridData(AirBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
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
        } else {
            $select->order("s_idtarif asc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataId___($idzona,$idkelompok,$kodejenis) {
        $rowset = $this->select(array('s_idzona' => $idzona,'s_idkelompok' => $idkelompok,'s_kodejenis' => $kodejenis));
//        $rowset = $this->select(array('s_idzona' => $idzona));
        $row = $rowset->current();
        return $row;
    }

    public function getDataId($idkelompok) {
        $rowset = $this->select(array('s_idkelompok' => $idkelompok));
//        $rowset = $this->select(array('s_idzona' => $idzona));
        $row = $rowset->current();
        return $row;
    }
    
    public function hapusData($id) {
        $this->delete(array('s_idtarif' => $id));
    }

    
    // public function getcomboIdPipa() {
    //     $sql = new \Zend\Db\Sql\Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_air_tarifpipa');
    //     $select->order('s_id asc');
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     $selectData = array();
    //     foreach ($res as $row) {
    //         $selectData[$row['s_id']] = str_pad($row['s_nourut'], 2, "0", STR_PAD_LEFT) . " || " . $row['s_ukuran_pipa']." ";
    //     }
    //     return $selectData;
    // }
    
    public function getcomboIdKodekelompok() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_air_kelompok');
        $select->order('s_id asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_id']] = $row['s_kode'] . " || " . $row['s_deskripsi']." ";
        }
        return $selectData;
    }
    
    public function getcomboIdKodejenis() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_air_jenis');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_id']] = $row['s_nourut'] . " [ " . $row['s_deskripsi']." ] ";
        }
        return $selectData;
    }
    
    public function getdataKodeJenisId($id) {
        $sql = "select * from s_air_jenis where s_idkelompok='$id'";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }
    
    public function getdataPeruntukanairId($id) {
        $sql = "select * from s_air_kelompok where s_id='$id'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }
    
    public function getdataTarifpipaId($idkelompok) {
        $sql = "select * from s_air_tarifpipa where s_idkelompok='$idkelompok'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }
    
    
    public function getHAB($idjaringan) {
        $sql = "select s_harga from s_hargaairbaku where s_idjaringan=$idjaringan";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

//    public function getDataIdTarifAir($idzona) {
////        $sql = "select * from s_air_tarif where s_idzona='$idzona' and s_idkelompok='$idkelompok' and s_kodejenis='$idjenis'";
//        $sql = "select * from s_air_tarif where s_idzona='$idzona'";
//        $statement = $this->adapter->query($sql);
//        return $statement->execute()->current();
//    }
    
}
