<?php

namespace Pajak\Model\Setting;

use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Where;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\ResultSet\ResultSet;

/**
 * Description of AclPermissionTable
 *
 * @author farhan
 */
class AclPermissionTable extends AbstractTableGateway {

    protected $table = 'permission';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet(ResultSet::TYPE_ARRAY);
        $this->initialize();
    }

    public function save($data) {
        if (!empty($data['resource_id']))
            $this->insert($data);
    }

}
