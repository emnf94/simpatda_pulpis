<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PemdaTable extends AbstractTableGateway {

    protected $table = "s_pemda";

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new \Pajak\Model\Setting\PemdaBase());
        $this->initialize();
    }

    public function getdata() {
        $rowset = $this->select();
        $row = $rowset->current();
        return $row;
    }

    public function savedata(\Pajak\Model\Setting\PemdaBase $db, $path, $session) {
        $data = array(
            "s_namaprov" => $db->s_namaprov,
            "s_namakabkota" => $db->s_namakabkota,
            "s_namaibukotakabkota" => $db->s_namaibukotakabkota,
            "s_kodeprovinsi" => $db->s_kodeprovinsi,
            "s_kodekabkot" => $db->s_kodekabkot,
            "s_namainstansi" => $db->s_namainstansi,
            "s_namasingkatinstansi" => $db->s_namasingkatinstansi,
            "s_alamatinstansi" => $db->s_alamatinstansi,
            "s_notelinstansi" => $db->s_notelinstansi,
            "s_namabank" => $db->s_namabank,
            "s_norekbank" => $db->s_norekbank,
            "s_kodepos" => $db->s_kodepos,
        );
        if (!empty($path)) {
            $data["s_logo"] = $path;
        }
        $id = (int) $db->s_idpemda;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array("s_idpemda" => $db->s_idpemda));
        }
    }

}
