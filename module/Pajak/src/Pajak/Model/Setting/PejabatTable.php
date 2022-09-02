<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PejabatTable extends AbstractTableGateway {

    protected $table = 's_pejabat';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PejabatBase());
        $this->initialize();
    }

    public function getdata() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->order('s_idpej asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function savedata(PejabatBase $kb, $session) {
        $data = array(
            's_namapej' => $kb->s_namapej,
            's_jabatanpej' => $kb->s_jabatanpej,
            's_pangkatpej' => $kb->s_pangkatpej,
            's_nippej' => $kb->s_nippej
        );
        $id = (int) $kb->s_idpej;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idpej' => $kb->s_idpej));
        }
    }

    public function getGridCount(PejabatBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
//        $select->join(array(
//            "b" => "s_kecamatan"
//                ), "b.s_idkec = a.s_namapej", array(
//            "s_kodekec" => "s_kodekec", "s_namakec" => "s_namakec"
//                ), $select::JOIN_LEFT);
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

    public function getGridData(PejabatBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
//        $select->join(array(
//            "b" => "s_kecamatan"
//                ), "b.s_idkec = a.s_namapej", array(
//            "s_kodekec" => "s_kodekec", "s_namakec" => "s_namakec"
//                ), $select::JOIN_LEFT);
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

    public function getPejabatId($s_idpej) {
        $rowset = $this->select(array('s_idpej' => $s_idpej));
        $row = $rowset->current();
        return $row;
    }

    public function getdaftarpejabat() {
        $sql = "select * from s_pejabat order by s_idpej asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function hapusData($id) {
        $this->delete(array('s_idpej' => $id));
    }

}
