<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailpasargrosirTable extends AbstractTableGateway {

    protected $table = 't_detailpasargrosir', $table_tarif = 's_tarifpasargrosir', $table_klasifikasi = 't_klasifikasi_pasargrosir';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetailpasargrosir($post, $dataparent) {
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_idklasifikasi' => $post['t_klasifikasi'],
            't_jenisbangunan' => $post['t_jenisbangunan'],
            't_panjang' => $post['t_panjang'],
            't_lebar' => $post['t_lebar'],
            't_luas' => $post['t_luas'],
            't_tarifdasar' => str_ireplace(".", "", $post['t_tarifdasar']),
            't_jmlhbln' => $post['t_jmlhbln']
            // 't_potongan' => str_ireplace(".", "", $post['t_potongan'])
        );
        $t_idpasargrosir = $post['t_idpasargrosir'];
        if (empty($t_idpasargrosir)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idpasargrosir' => $t_idpasargrosir));
        }
        return $data;
    }

    public function getPendataanPasargrosirByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "t_detailpasargrosir"
                ), "a.t_idtransaksi = b.t_idtransaksi", 
                array("*"), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_rekening"
                ), "a.t_idkorek = c.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
         // echo $select->getSqlstring(); exit();
        $res = $state->execute()->current();
        return $res;
    }

    public function getcomboIdKlasifikasi() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table_klasifikasi);
        $select->order('t_idklasifikasi asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['t_idklasifikasi']] = $row['t_idklasifikasi'] . " || " . $row['t_keterangan']." ";
        }
        return $selectData;
    }

    public function getDataKlasifikasiKategori($klasifikasi) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table_tarif);
        $where = new Where();
        $where->equalTo('s_idklasifikasi', $klasifikasi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataKlasifikasiTarif($s_idtarif) {
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

    public function getnamatarif($id){
        $sql = "SELECT * from s_tarifpasargrosir where s_idtarif='$id'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
        
    }
}
