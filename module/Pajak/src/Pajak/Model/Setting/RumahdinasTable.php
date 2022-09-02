<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class RumahdinasTable extends AbstractTableGateway {

    protected $table = 's_tarifrumahdinas';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new RumahdinasBase());
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

    public function checkId(RumahdinasBase $kc) {
        $rowset = $this->select(array('s_idtarifret' => $kc->s_idtarifret));
        $row = $rowset->current();
        return $row;
    }

    public function savedataRumahdinas(RumahdinasBase $kc, $session) {
        $data = array(
            's_namatarif' => $kc->s_namatarif,
            's_luasawal' => str_ireplace(".", "", $kc->s_luasawal),
            's_luasakhir' => str_ireplace(".", "", $kc->s_luasakhir),
            's_satuan' => $kc->s_satuan,
            's_tarif' => str_ireplace(".", "", $kc->s_tarif)
        );
        $id = (int) $kc->s_idtarifret;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idtarifret' => $kc->s_idtarifret));
        }
    }

    public function getGridCount(RumahdinasBase $base) {
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

    public function getGridData(RumahdinasBase $base, $offset) {
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
            $select->order("s_idtarifret asc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataId($id) {
        $rowset = $this->select(array('s_idtarifret' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function getDataRange($t_luas) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->columns(array(
            "s_tarif"
        ));
        $where = new Where();
        $where->literal("s_luasawal < " . $t_luas . " AND s_luasakhir >= " . $t_luas . "");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function hapusData($id) {
        $this->delete(array('s_idtarifret' => $id));
    }

}
