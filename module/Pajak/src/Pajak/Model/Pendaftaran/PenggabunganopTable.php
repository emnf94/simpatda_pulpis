<?php

namespace Pajak\Model\Pendaftaran;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PenggabunganopTable extends AbstractTableGateway {

    protected $table = 't_wpobjek';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PenggabunganopBase());
        $this->initialize();
    }

    public function getGridDataObjekPajak(PenggabunganopBase $base, $post, $t_idobjek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_wpobjek');
        $where = new Where();
        if ($post->t_nop != '')
            $where->literal("t_nop ILIKE '%$post->t_nop%'");
        if ($post->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_alamatlengkapobjek != '')
            $where->literal("t_alamatlengkapobjek ILIKE '%$post->t_alamatlengkapobjek%'");
        $where->literal('t_idobjek not in (' . $t_idobjek . ')');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function simpanPenggabunganOP($t_idobjek, $t_idwp) {
        $data = array(
            't_idwp' => $t_idwp
        );
        $table_wpobjek = new \Zend\Db\TableGateway\TableGateway('t_wpobjek', $this->adapter);
        $table_wpobjek->update($data, array('t_idobjek' => $t_idobjek));
    }

}
