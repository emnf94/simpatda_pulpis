<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailpasarTable extends AbstractTableGateway {

    protected $table = 't_detailpasar', $table_tarif = 's_tarifpasar', $table_klasifikasi = 't_klasifikasi_pasar';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetailpasar($post, $dataparent) {
       
        if (empty($post['t_panjang'])) {
            $post['t_panjang']=0;
        }
        if (empty($post['t_lebar'])) {
            $post['t_lebar']=0;
        }
        if (empty($post['t_luas'])) {
            $post['t_luas']=0;
        }

        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_idklasifikasi' => $post['t_klasifikasi'],
            't_jenisbangunan' => 0,
            't_keteranganpasar' => $post['t_keteranganpasar'],
            't_nokios' => $post['t_nokios'],
            't_panjang' => (int)$post['t_panjang'],
            't_lebar' => (int)$post['t_lebar'],
            't_luas' => (int)$post['t_luas'],
            't_tarifdasar' =>(float) (str_ireplace(".", "", $post['t_tarifdasar'])),
            't_jmlhbln' =>(float) $post['t_jmlhbln']
            // 't_potongan' => str_ireplace(".", "", $post['t_potongan'])
        );
      
        $t_idtransaksi = $post['t_idtransaksi'];
        if (empty($t_idtransaksi)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idtransaksi' => $t_idtransaksi));
        }
        return $data;
    }


    public function simpandetailkebersihan($post, $dataparent) {
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_idklasifikasi' => $post['t_klasifikasi'],
            't_idtarif' => $post['t_kategori'],
            't_tarifdasar' => str_ireplace(".", "", $post['t_tarifdasar']),
            't_jmlhbln' => $post['t_jmlhbln']
            // 't_potongan' => str_ireplace(".", "", $post['t_potongan'])
        );
        $t_idkebersihan = $post['t_idkebersihan'];
        if (empty($t_idkebersihan)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idkebersihan' => $t_idkebersihan));
        }
        return $data;
    }

    public function getPendataanPasarByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "t_detailpasar"
                ), "a.t_idtransaksi = b.t_idtransaksi", 
                array("*"), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_rekening"
                ), "a.t_idkorek = c.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_klasifikasi_pasar"
                ), "d.t_idklasifikasi = b.t_idklasifikasi", 
                array("t_namaklasifikasi"=>"t_keterangan"), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_tarifpasar"
                ), "e.s_idtarif= b.t_jenisbangunan", 
                array("t_namajenisbangunan"=>"s_keterangan"), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('b.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        // echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
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

    public function getPendataanPelayananKesehatanByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailretribusi"
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
        
        
        

    }
}
