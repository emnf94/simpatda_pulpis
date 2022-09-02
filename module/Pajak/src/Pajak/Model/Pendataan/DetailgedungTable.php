<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailgedungTable extends AbstractTableGateway {

    protected $table = 't_detailgedung';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetailgedung($datapost, $dataparent) {
        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));
        for ($i = 0; $i < count($datapost['t_idtarifgedung']); $i++) {
            if (!empty($datapost['t_idtarifgedung'][$i])) {
                $data = array(
                    't_idtransaksi' => $dataparent['t_idtransaksi'],
                    't_tarifdasar' => str_ireplace(".", "", $datapost['t_tarif'][$i]),
                    't_jenis' => $datapost['t_idtarifgedung'][$i],
                    't_jumlah' => str_ireplace(".", "", $datapost['t_jumlah'][$i]),
                    't_total' => str_ireplace(".", "", $datapost['t_total'][$i]),
                );
                $this->insert($data);
            }
        }
    }

    public function gettarifgedung() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifgedung');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function gettarifgedungId($s_idtarif) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifgedung');
        $where = new Where();
        $where->equalTo('s_idtarif', $s_idtarif);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPendataanGedungByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "view_rekening"
                ), "a.t_idkorek = b.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDetailGedungByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailgedung"
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

}
