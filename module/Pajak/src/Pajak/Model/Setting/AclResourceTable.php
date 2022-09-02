<?php

namespace Pajak\Model\Setting;

use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Where;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\ResultSet\ResultSet;

/**
 * Description of AclResourceTable
 *
 * @author farhan
 */
class AclResourceTable extends AbstractTableGateway {

    protected $table = 'resource', $t_permission = 'permission';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(ResultSet::TYPE_ARRAY);
        $this->initialize();
    }
    
    public function save($r){
        $this->insert(['resource_name'=>$r]);
        return $this->select(['resource_name'=>$r])->current();
    }

    public function getDatas($resourceName,$permissionName,$options) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array('a' => $this->table));
        $select->join(
                array('b' => $this->t_permission), 'a.id = b.resource_id', array('*'), 'left'
        );
        $where = new Where();
        $where->equalTo('a.resource_name', $resourceName);
        $where->equalTo('b.permission_name', $permissionName);
        $select->where($where);
        $statement = $sql->prepareStatementForSqlObject($select);
        if($options=='array'){
            $resources = $statement->execute()->current();
        }elseif($options=='count'){
            $resources = $statement->execute()->count();
        }
        return $resources;
    }
    
    public function checkResources($rName){
        return $this->select(['resource_name'=>$rName])->current();
    }

}
