<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class TipeusahaTable extends AbstractTableGateway {

    protected $table = 's_tipeusaha';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new TipeusahaBase());
        $this->initialize();
    }

    public function getdata() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->order('s_idusaha asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function savedata(TipeusahaBase $kb, $session) {
        $data = array(
            's_kodeusaha' => $kb->s_kodeusaha,
            's_namausaha' => $kb->s_namausaha
        );
        $id = (int) $kb->s_idusaha;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idusaha' => $kb->s_idusaha));
        }
    }

    public function getGridCount(TipeusahaBase $base, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
        $where = new Where();
        if(!empty($post->kdusaha)){
            $where->literal("s_kodeusaha::text LIKE '%$post->kdusaha%'");
        }
        if(!empty($post->namausaha)){
            $where->literal("s_namausaha ILIKE '%$post->namausaha%'");
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(TipeusahaBase $base, $offset, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
        $where = new Where();
        if(!empty($post->kdusaha)){
            $where->literal("s_kodeusaha::text LIKE '%$post->kdusaha%'");
        }
        if(!empty($post->namausaha)){
            $where->literal("s_namausaha ILIKE '%$post->namausaha%'");
        }
        $select->where($where);
        $select->order('s_idusaha asc');
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getTipeusahaId($s_idusaha) {
        $rowset = $this->select(array('s_idusaha' => $s_idusaha));
        $row = $rowset->current();
        return $row;
    }

    public function getdaftartipeusaha() {
        $sql = "select * from s_tipeusaha order by s_idusaha asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function hapusData($id) {
        $this->delete(array('s_idusaha' => $id));
    }
    
    public function getcomboIdJenis() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        $select->where($where);
        $select->order('s_idusaha asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idusaha']] = str_pad($row['s_kodeusaha'], 2, "0", STR_PAD_LEFT) . " || " . $row['s_namausaha'];
        }
        return $selectData;
    }

}
