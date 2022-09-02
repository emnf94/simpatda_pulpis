<?php

namespace Pajak\Model\Bphtb;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class BphtbTable extends AbstractTableGateway
{

    protected $table = '';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->initialize();
    }

    public function getRealisasiBulanlalu($tglakhir)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_pembayaran_bphtb");
        $select->columns(array(
            "total" => new \Zend\Db\Sql\Expression("SUM(t_jmlhbayar_total)"),
        ));
        $where = new Where();
        $where->literal("t_tglpembayaran_pokok is not null");
        $where->literal("EXTRACT(MONTH from t_tglpembayaran_pokok) <= '" . date('m', strtotime("-1 month" . $tglakhir)) . "' AND EXTRACT(YEAR from t_tglpembayaran_pokok) = '" . date('Y', strtotime($tglakhir)) . "' ");
        $select->where($where);
        // echo $select->getSqlString();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getRealisasiBulanini($tglakhir)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_pembayaran_bphtb");
        $select->columns(array(
            "total" => new \Zend\Db\Sql\Expression("SUM(t_jmlhbayar_total)"),
        ));
        $where = new Where();
        $where->literal("t_tglpembayaran_pokok is not null");
        $where->literal("EXTRACT(MONTH from t_tglpembayaran_pokok) = '" . date('m', strtotime($tglakhir)) . "' AND EXTRACT(YEAR from t_tglpembayaran_pokok) = '" . date('Y', strtotime($tglakhir)) . "' ");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getRealisasiSdBulanini($tglakhir)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_pembayaran_bphtb");
        $select->columns(array(
            "total" => new \Zend\Db\Sql\Expression("SUM(t_jmlhbayar_total)"),
        ));
        $where = new Where();
        $where->literal("t_tglpembayaran_pokok is not null");
        $where->literal("EXTRACT('YEAR' from t_tglpembayaran_pokok) = '" . date('Y', strtotime($tglakhir)) . "' ");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
}
