<?php

namespace Pajak\Model\Secure;

use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Complysight\Service\UserAuthAdapter;
use Zend\Session\Container;
use Complysight\Service\UserPassword;
use Zend\Db\Sql\Update;
use Zend\Validator\Explode;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\ResultSet\ResultSet;

class Role extends AbstractTableGateway {

    public $table = 'role';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(ResultSet::TYPE_ARRAY);
        $this->initialize();
    }

//    public function getUserRoles($where = array(), $columns = array()) {
//        try {
//            $sql = new Sql($this->getAdapter());
//            $select = $sql->select()->from(array(
//                'role' => $this->table
//            ));
//            $select->columns(array(
//                'rid',
//                'role_name',
//                'status',
//            ));
//            $select->where("rid::varchar != 'Active'");
//            if (count($where) > 0) {
//                $select->where($where);
//            }
//
//            if (count($columns) > 0) {
//                $select->columns($columns);
//            }
//            $statement = $sql->prepareStatementForSqlObject($select);
//            $roles = $this->resultSetPrototype->initialize($statement->execute())
//                    ->toArray();
//            return $roles;
//        } catch (\Exception $e) {
//            throw new \Exception($e->getPrevious()->getMessage());
//        }
//    }

//    public function getRole($id) {
//        $rowset = $this->select(array('rid' => $id));
//        $row = $rowset->current();
//        return $row;
//    }

    public function getUserRoles() {
        $sql = "SELECT s_iduser as rid, s_username as role_name, 'Active' as Status FROM s_users";
        $statement = $this->adapter->query($sql);
        $res = $this->resultSetPrototype->initialize($statement->execute())->toArray();
        return $res;
    }

}
