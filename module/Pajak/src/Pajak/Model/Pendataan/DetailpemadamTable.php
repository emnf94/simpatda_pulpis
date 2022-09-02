<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailpemadamTable extends AbstractTableGateway {

    protected $table = 't_detailpemadam';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetailpemadam($datapost, $dataparent) {
        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));
        for ($i = 0; $i < count($datapost['t_idtarif']); $i++) {
            if (!empty($datapost['t_idtarif'][$i])) {
                $data = array(
                    't_idtransaksi' => $dataparent['t_idtransaksi'],
                    't_idtarif' => str_ireplace(".", "", $datapost['t_idtarif'][$i]),
                    't_jmltitikbuah' => str_ireplace(".", "", $datapost['t_jmltitikbuah'][$i]),
                    't_tarifdasar' => str_ireplace(".", "", $datapost['t_tarifdasar'][$i]),
                    't_satuan' => str_ireplace(".", "", $datapost['t_satuan'][$i]),
                    't_jumlah' => str_ireplace(".", "", $datapost['t_jumlah'][$i]),
                );
                $this->insert($data);
            }
        }
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
            "t_idretpemadam","t_idtarif","t_jmltitikbuah","t_tarifdasar", "t_satuan","t_jumlah"
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

    public function getDetailPemadamByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailpemadam"
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getdataTarifPemadam() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifpemadam');
        $where = new Where();
        $select->where($where);
        $select->order(['s_idtarif' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getPemadam($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_detailpemadam'
        ));
        $select->join(array(
            "b" => "s_tarifpemadam"
                ), "a.t_idtarif=b.s_idtarif", array(
            "s_idtarif","s_namatarif", "s_tarif", "s_satuan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    
}
