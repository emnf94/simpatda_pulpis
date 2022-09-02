<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailteraTable extends AbstractTableGateway {

    protected $table = 't_detailtera';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpanpendataantera($datapost, $dataparent) {
        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));
        for ($i = 0; $i < count($datapost['t_idtarif']); $i++) {
            if (!empty($datapost['t_idtarif'][$i])) {
                $data = array(
                    't_idtransaksi' => $dataparent['t_idtransaksi'],
                    't_idtarif' => $datapost['t_idtarif'][$i],
                    't_jarak' => 0,
                    't_volume' => str_ireplace(".", "", $datapost['t_volume'][$i]),
                    't_transportasi' => 0,
                    't_hargadasar' => str_ireplace(".", "", $datapost['t_hargadasar'][$i]),
                    't_jumlah' => str_ireplace(".", "", $datapost['t_jumlah'][$i]),
                    't_lokasi' => 0,
                );
                $this->insert($data);
            }
        }
    }

    public function getPendataanTeraByIdTransaksi($t_idtransaksi) {
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

    public function getDetailTeraByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailtera"
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getdataTarifTera() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tariftera');
        $where = new Where();
        $select->where($where);
        $select->order(['s_idtarif' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getdataTeraId($t_idtarif) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tariftera');
        $where = new Where();
        $where->equalTo('s_idtarif', (int) $t_idtarif);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    
}
