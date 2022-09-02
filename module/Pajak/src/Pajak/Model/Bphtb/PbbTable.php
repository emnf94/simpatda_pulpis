<?php

namespace Pajak\Model\Bphtb;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PbbTable extends AbstractTableGateway {

    protected $table = '';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->initialize();
    }
    
    public function getRealisasiPbbTotal($tahunpajakpbb){
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'A' => 'PEMBAYARAN_SPPT'
        ));
        $select->columns(array(
                'total_tahunanpbb' => new \Zend\Db\Sql\Expression('(SUM( A.JML_SPPT_YG_DIBAYAR)-SUM( A.DENDA_SPPT))')));
        $where = new Where();
        $where->literal("TO_CHAR(A.TGL_PEMBAYARAN_SPPT, 'YYYY') = '".$tahunpajakpbb."' ");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
	
}
