<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class KelurahanTable extends AbstractTableGateway {

    protected $table = 's_kelurahan';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new KelurahanBase());
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

    public function checkExist(KelurahanBase $kb) {
        $rowset = $this->select(array('s_kodekel' => $kb->s_kodekel));
        $row = $rowset->current();
        return $row;
    }

    public function checkId(KelurahanBase $kb) {
        $rowset = $this->select(array('s_idkel' => $kb->s_idkel));
        $row = $rowset->current();
        return $row;
    }

    public function savedata(KelurahanBase $kb, $session) {
        $data = array(
            's_idkeckel' => $kb->s_idkeckel,
            's_kodekel' => $kb->s_kodekel,
            's_namakel' => $kb->s_namakel
        );
        $id = (int) $kb->s_idkel;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idkel' => $kb->s_idkel));
        }
    }

    public function getGridCount(KelurahanBase $base) {
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

    public function getGridData(KelurahanBase $base, $offset) {
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
        $rowset = $this->select(array('s_idkel' => $kb));
        $row = $rowset->current();
        return $row;
    }

    public function getDataKode($kb) {
        // $sql = "select s_kodekel from s_kelurahan where s_idkeckel = " . $idkec . "' and s_idkel='" . $idkel . "'";
        // $statement = $this->adapter->query($sql);
        // return $statement->execute()->current();

        // $rowset = $this->select(array('s_kodekel' => $kb));
        // $row = $rowset->current();
        // return $row;

        $sql = "select s_kodekel from s_kelurahan where s_idkel='" . $kb . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function hapusData($id) {
        $this->delete(array('s_idkel' => $id));
    }

    public function comboBox() {
        $resultSet = $this->select();
        return $resultSet;
    }

    public function getByKecamatan(KelurahanBase $kb) {
        $resultSet = $this->select(array('s_idkeckel' => $kb->s_idkeckel));
        return $resultSet;
    }

    public function getByKecamatan2($s_idkeckel) {
        $resultSet = $this->select(array('s_idkeckel' => $s_idkeckel));
        return $resultSet;
    }

    public function getdaftarkelurahan() {
        $sql = "select * from s_kelurahan a "
                . "left join s_kecamatan b on a.s_idkeckel=b.s_idkec "
                . "order by s_kodekel,s_idkeckel asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getidkelurahanbyname($namakel) {
        $sql = "select s_idkel from s_kelurahan where s_namakel='" . $namakel . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }
}
