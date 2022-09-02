<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailtanahreklameTable extends AbstractTableGateway {

    protected $table = 't_detailtanahreklame';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetailtanahreklame($post, $dataparent) {
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_panjang' => $post['t_panjang'],
            't_lebar' => $post['t_lebar'],
            't_luas' => $post['t_luas'],
            't_tarifdasar' => str_ireplace(".", "", $post['t_tarifdasar']),
            't_jmlhblnhari' => $post['t_jmlhblnhari'],
            't_lokasitanah' => $post['t_lokasitanah'],
            't_potongan' => str_ireplace(".", "", $post['t_potongan']),
        );
        $t_idrpangrek = $post['t_idrpangrek'];
        if (empty($t_idrpangrek)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idrpangrek' => $t_idrpangrek));
        }
        return $data;
    }

    public function getcomboIdTanahReklame() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tariftanahreklame');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idtarif']] = $row['s_idtarif'] . " || " . $row['s_namatarif'];
        }
        return $selectData;
    }

    public function getDataId($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tariftanahreklame');
        $where = new Where();
        $where->equalTo('s_idtarif', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPendataanTanahReklameByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "t_detailtanahreklame"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idrpangrek", "t_luas", "t_tarifdasar", "t_jmlhblnhari", "t_lokasitanah", "t_potongan", "t_lebar", "t_panjang"
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
