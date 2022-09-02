<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailperikananTable extends AbstractTableGateway {

    protected $table = 't_detailperikanan';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }
    
    public function simpandetailperikanan($post, $dataparent) {
        if($post['t_jeniskapal'] == '' || $post['t_jenisbudidaya'] == '' || $post['t_jmlhgt'] == ''){
            $jmlhgt = 0;
            $jeniskapal = 0;
            $jenisbudidaya = 0;
        }else{
            $jmlhgt = $post['t_jmlhgt'];
            $jeniskapal = $post['t_jeniskapal'];
            $jenisbudidaya = $post['t_jenisbudidaya'];
        }
        
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_jeniskapal' => $jeniskapal,
            't_jenisbudidaya' => $jenisbudidaya,
            't_jmlhgt' => str_ireplace(".", "", $jmlhgt),
            't_hargadasar' => str_ireplace(".", "", $post['t_tarifdasar']),
            't_jumlah' => str_ireplace(".", "", $post['t_jmlhpajak']),
        );
        $t_idret = $post['t_idperikanan'];
        if (empty($t_idret)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idperikanan' => $t_idret));
        }
        return $data;
    }

    public function getcomboIdKapal() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifkapal');
        $select->order("s_idtarif asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idtarif']] = $row['s_idtarif'] . " || " . $row['s_namatarif'];
        }
        return $selectData;
    }

    public function getcomboIdBudidaya() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifbudidaya');
        $select->order("s_idtarif asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idtarif']] = $row['s_idtarif'] . " || " . $row['s_namatarif'];
        }
        return $selectData;
    }
    
    public function getcomboIdBudidayaMutiara() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifbudidayamutiara');
        $select->order("s_idtarif asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idtarif']] = $row['s_idtarif'] . " || " . $row['s_namatarif'];
        }
        return $selectData;
    }
    
    public function getDataIdKapal($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifkapal');
        $where = new Where();
        $where->equalTo('s_idtarif', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getDataIdBudidaya($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifbudidaya');
        $where = new Where();
        $where->equalTo('s_idtarif', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getDataIdBudidayaMutiara($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifbudidayamutiara');
        $where = new Where();
        $where->equalTo('s_idtarif', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getPendataanPerikananByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "t_detailperikanan"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idperikanan","t_jeniskapal","t_jenisbudidaya", "t_jmlhgt","t_hargadasar","t_jumlah"
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

    public function getPerikanan($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_detailperikanan'
        ));
//        $select->join(array(
//            "b" => "s_tarifperikanan"
//                ), "a.t_jenisparkir=b.s_idtarif", array(
//            "s_idtarif","s_namatarif", "s_tarif", "s_satuan"
//                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    
}
