<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class KecamatanTable extends AbstractTableGateway
{

    protected $table = 's_kecamatan';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new KecamatanBase());
        $this->initialize();
    }

    public function getdata()
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->order("s_idkec asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdata0()
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->order("s_idkec asc");
        $where = new Where();

        $where->notEqualTo("s_idkec", 0);

        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function checkExist(KecamatanBase $kc)
    {
        $rowset = $this->select(array('s_kodekec' => $kc->s_kodekec));
        $row = $rowset->current();
        return $row;
    }

    public function checkId(KecamatanBase $kc)
    {
        $rowset = $this->select(array('s_idkec' => $kc->s_idkec));
        $row = $rowset->current();
        return $row;
    }

    public function savedata(KecamatanBase $kc, $session)
    {
        $data = array(
            's_kodekec' => $kc->s_kodekec,
            's_namakec' => $kc->s_namakec
        );
        $id = (int) $kc->s_idkec;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idkec' => $kc->s_idkec));
        }
    }

    public function checkEmpty()
    {
        $resultSet = $this->select();
        return $resultSet->count();
    }

    public function getGridCount(KecamatanBase $base)
    {
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

    public function getGridData(KecamatanBase $base, $offset)
    {
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
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataId($id)
    {
        $rowset = $this->select(array('s_idkec' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function getDataKode($kode)
    {
        $rowset = $this->select(array('s_kodekec' => $kode));
        $row = $rowset->current();
        return $row;
    }

    // public function getDataKode($kb) {
    //     $rowset = $this->select(array('s_kodekec' => $kode));
    //     $row = $rowset->current();
    //     return $row;
    // }

    public function hapusData($id)
    {
        $this->delete(array('s_idkec' => $id));
    }

    public function comboBox()
    {
        $resultSet = $this->select();
        return $resultSet;
    }

    public function getIdKecamatan($kd)
    {
        $resultSet = $this->select(array('s_kodekec' => $kd));
        return $resultSet->current();
    }

    public function getdaftarkecamatan()
    {
        $sql = "select * from s_kecamatan order by s_kodekec asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getidkecamatanbyname($namakec)
    {
        $sql = "select s_idkec from s_kecamatan where s_namakec='" . $namakec . "'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }
}
