<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class TargetTable extends AbstractTableGateway {

    protected $table = 's_target';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new TargetBase());
        $this->initialize();
    }

    public function getTargetId($s_idtarget) {
        $rowset = $this->select(array('s_idtarget' => $s_idtarget));
        $row = $rowset->current();
        return $row;
    }

    public function getdata() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function savedata(TargetBase $kc, $session) {
        $data = array(
            's_tahuntarget' => $kc->s_tahuntarget,
            's_statustarget' => $kc->s_statustarget,
            's_keterangantarget' => $kc->s_keterangantarget
        );
        $id = (int) $kc->s_idtarget;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idtarget' => $kc->s_idtarget));
        }
    }

    public function getdataTarget() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->order('s_tahuntarget desc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCount(TargetBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => $this->table
        ));
        $select->join(array(
            "b" => "s_targetjenis"
                ), "a.s_statustarget = b.s_idtargetjenis", array(
            "s_namatargetjenis"
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

    public function getGridData(TargetBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => $this->table
        ));
        $select->join(array(
            "b" => "s_targetjenis"
                ), "a.s_statustarget = b.s_idtargetjenis", array(
            "s_namatargetjenis"
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

    public function getDataId($id) {
        $rowset = $this->select(array('s_idtarget' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function combojenistarget() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_targetjenis');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idtargetjenis']] = $row['s_namatargetjenis'];
        }
        return $selectData;
    }

    public function hapusData($id) {
        $this->delete(array('s_idtarget' => $id));
    }
    
    public function getdaftartarget($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => $this->table
        ));
        $select->join(array(
            "b" => "s_targetdetail"
                ), "a.s_idtarget = b.s_idtargetheader ", array(
            "s_targetjumlah"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_rekening"
                ), "b.s_targetrekening = c.s_idkorek ", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo("a.s_idtarget", $id);
        $select->where($where);
        $select->order('korek asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

}
