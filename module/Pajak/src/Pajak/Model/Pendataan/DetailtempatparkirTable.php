<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailtempatparkirTable extends AbstractTableGateway {

    protected $table = 't_detailtempatparkir', $table_tarif = 's_tariftempatparkir';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetailtempatparkir($post, $dataparent) {
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_jeniskendaraan' => $post['t_jeniskendaraan'],
            't_jumlah' => $post['t_jmlhkendaraan'],
            't_tarifdasar' => str_ireplace(".", "", $post['t_tarifdasar']),
            't_keterangan' => $post['t_keterangan'],
            // 't_jmlhbln' => $post['t_jmlhbln']
            // 't_potongan' => str_ireplace(".", "", $post['t_potongan'])
        );
        $t_idtempatparkir = $post['t_idtempatparkir'];
        if (empty($t_idtempatparkir)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idtempatparkir' => $t_idtempatparkir));
        }
        return $data;
    }

    public function getPendataanTempatparkirByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "t_detailtempatparkir"
                ), "a.t_idtransaksi = b.t_idtransaksi", 
                array("*"), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_rekening"
                ), "a.t_idkorek = c.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_tariftempatparkir"
                ), "b.t_jeniskendaraan = d.s_idtarif", array(
			"*"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('b.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getcomboIdJeniskendaraan() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table_tarif);
        $select->order('s_idtarif asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idtarif']] = $row['s_idtarif'] . " || " . $row['s_jeniskendaraan']." ";
        }
        return $selectData;
    }

    public function getDataJeniskendaraan($t_idkorek) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table_tarif);
        $where = new Where();
        $where->equalTo('s_idkorek', $t_idkorek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getDataTarif($s_idtarif) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table_tarif);
        $where = new Where();
        $where->equalTo('s_idtarif', $s_idtarif);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
}
