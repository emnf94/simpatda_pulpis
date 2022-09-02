<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailmenaraTable extends AbstractTableGateway {

    protected $table = 't_detailmenara';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetailmenara($post, $dataparent) {
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_jmlhmenara' => str_ireplace(".", "", $post['t_jmlhmenara']),
            't_jmlhbulan' => str_ireplace(".", "", $post['t_jmlhbulan']),
            't_tarifdasar' => str_ireplace(".", "", $post['t_tarifdasar']),
            't_jumlah' => str_ireplace(".", "", $post['t_jmlhpajak']),
        );
        $t_idret = $post['t_idretmenara'];
        if (empty($t_idret)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idretmenara' => $t_idret));
        }
        return $data;
    }

    public function getcomboIdPemadam() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifpemadam');
        $select->order("s_idtarif asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idtarif']] = $row['s_idtarif'] . " | " . $row['s_namatarif'];
        }
        return $selectData;
    }

    public function getDataId($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifpemadam');
        $where = new Where();
        $where->equalTo('s_idtarif', $id);
        $select->where($where);
        $select->order("s_idtarif asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPendataanPemadamByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "t_detailpemadam"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idretpemadam","t_tarifdasar", "t_jenisretribusi","t_jmltitikbuah"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_rekening"
                ), "a.t_idkorek = c.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('b.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

}
