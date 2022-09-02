<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class LokasiCekunganTable extends AbstractTableGateway {

    protected $table = 's_cekungan';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new LokasiCekunganBase());
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

    public function checkId(LokasiCekunganBase $kc) {
        $rowset = $this->select(array('s_idcekungan' => $kc->s_idcekungan));
        $row = $rowset->current();
        return $row;
    }

    public function savedata(LokasiCekunganBase $kc) {
        $data = array(
            's_kriteria' => $kc->s_kriteria,
            's_nilai' => $kc->s_nilai,
        );
        $id = (int) $kc->s_idcekungan;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idcekungan' => $kc->s_idcekungan));
        }
    }

    public function getGridCount(LokasiCekunganBase $base) {
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

    public function getGridData(LokasiCekunganBase $base, $offset) {
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
            $select->order("s_idcekungan asc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataId($id) {
        $rowset = $this->select(array('s_idcekungan' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function hapusData($id) {
        $this->delete(array('s_idcekungan' => $id));
    }

    public function getcomboIdAir() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_faktorsumberair');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idcekungan']] = $row['s_kriteria'];
        }
        return $selectData;
    }

}
