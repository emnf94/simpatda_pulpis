<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class KekayaandaerahTable extends AbstractTableGateway {

    protected $table = 's_kekayaan_tarif';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new KekayaandaerahBase());
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

    public function checkId(KekayaandaerahBase $kc) {
        $rowset = $this->select(array('s_idtarif' => $kc->s_idtarif));
        $row = $rowset->current();
        return $row;
    }

    public function getDataId($id) {
        $rowset = $this->select(array('s_idtarif' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function getcomboIdKlasifikasi() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->order('s_idklasifikasi asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idklasifikasi']] = $row['s_idklasifikasi'] . " || " . $row['s_klasifikasi']." ";
        }
        return $selectData;
    }

    public function getDataKlasifikasi($klasifikasi) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        $where->equalTo('s_idklasifikasi', $klasifikasi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function hapusData($id) {
        $this->delete(array('s_idtarif' => $id));
    }

}
