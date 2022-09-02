<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class SatkerTable extends AbstractTableGateway {

    protected $table = 's_satker';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SatkerBase());
        $this->initialize();
    }

    public function getGridCount(SatkerBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from([
            'a' => $this->table
        ]);
        $where = new Where();
        if ($parametercari->s_kodesatker != '')
            $where->literal("s_kodesatker LIKE '%$parametercari->s_kodesatker%'");
        if ($parametercari->s_namasatker != '')
            $where->literal("s_namasatker LIKE '%$parametercari->s_namasatker%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(SatkerBase $base, $offset, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from([
            'a' => $this->table
        ]);
        $where = new Where();
        if ($parametercari->s_kodesatker != '')
            $where->literal("s_kodesatker LIKE '%$parametercari->s_kodesatker%'");
        if ($parametercari->s_namasatker != '')
            $where->literal("s_namasatker LIKE '%$parametercari->s_namasatker%'");
        $select->where($where);

        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    function getdataSatkerId($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_satker');
        $where = new Where();
        $where->equalTo('s_idsatker', (int) $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

}
