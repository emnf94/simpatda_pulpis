<?php

namespace Pajak\Model\Secure;

use Zend\Db\Sql\Sql;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\ResultSet\ResultSet;

class PermissionTable extends AbstractTableGateway {

    public $table = 'permission';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(ResultSet::TYPE_ARRAY);
        $this->initialize();
    }

    public function getResourcePermissions($roleId) {
        try {
            $sql = new Sql($this->getAdapter());
            $select = $sql->select()->from(array(
                'p' => $this->table
            ));
            $select->columns(array(
                'resid'
            ));

            $select->join(array(
                "r" => "resource"
                    ), "p.resid = r.resid", array(
                "name",
                "route"
            ));
            $select->where(array(
                'p.rid' => $roleId
            ));
            $select->order(array(
                'menu_order'
            ));

            $statement = $sql->prepareStatementForSqlObject($select);
            $resources = $this->resultSetPrototype->initialize($statement->execute())
                    ->toArray();
            return $resources;
        } catch (\Exception $err) {
            throw $err;
        }
    }

    public function AllResource(){
        $resultSet = $this->select();
        return $resultSet;
    }
    
//    public function getPegawaiResource(){
//        $sql = new Sql($this->adapter);
//        $select = $sql->select();
//        $select->from($this->table);
//        $where = new \Zend\Db\Sql\Where();
//        $where->in('resource_id', array(1,2,3,4,5,6,7,8,9,10,12,14,15,16,17,18,19,20,21,22,23));        
//        $where->notIn('id',array(57,58,64,65));        
//        $select->where($where);        
//        $state = $sql->prepareStatementForSqlObject($select);
//        $res = $state->execute();
//        return $res;
//    }
//    
//    public function getNotarisResource(){
//        $resultSet = $this->select(array('resource_id'=>array(1,2,14,18,19,23)));
//        return $resultSet;
//    }
//    
//    public function getBankResource(){
//        $resultSet = $this->select(array('resource_id'=>array(1,2,15,18,19,23)));
//        return $resultSet;
//    }


    public function getByResource($id){
        $resultSet = $this->select(array('resource_id'=>$id,
            'permission_name'=>array('index','tambah','edit','hapus')));
        return $resultSet;
    }
}
