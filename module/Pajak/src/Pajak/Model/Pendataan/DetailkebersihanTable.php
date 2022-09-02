<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailkebersihanTable extends AbstractTableGateway {

    protected $table = 't_detailkebersihan', $table_tarif = 's_tarifkebersihan', $table_klasifikasi = 't_klasifikasi_kebersihan';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
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
        $t_idtransaksi = $post['t_idtransaksi'];
        if (empty($t_idtransaksi)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idtransaksi' => $t_idtransaksi));
        }
        return $data;
    }

    public function getPendataanKebersihanByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "t_detailkebersihan"
                ), "a.t_idtransaksi = b.t_idtransaksi", 
                array("*"), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_rekening"
                ), "a.t_idkorek = c.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_klasifikasi_kebersihan"
                ), "d.t_idklasifikasi = b.t_idklasifikasi", 
                array("t_namaklasifikasi"=>"t_keterangan"), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_tarifkebersihan"
                ), "e.s_idtarif= b.t_idtarif", 
                array("t_namakategori"=>"s_keterangan"), $select::JOIN_LEFT);
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
    
    public function getPendataanSampahByDatapasar($t_idwp,$data) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel"
            , "t_kabupatenobjek", "t_rtobjek", "t_rwobjek", "t_latitudeobjek", "t_longitudeobjek", "t_jenisobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_tarifpajak",
            "t_jmlhpajak", "t_tglpembayaran"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_detailkebersihan"
                ), "c.t_idtransaksi = d.t_idtransaksi", array('*'), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_tarifkebersihan"
                ), "e.s_idtarif = d.t_idtarif", array('*'), $select::JOIN_LEFT);
        $select->join(array(
            "f" => "view_rekening"
                ), "c.t_idkorek = f.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idwp', (int) $t_idwp);
        $where->equalTo('c.t_jenispajak', 13);
        $where->equalTo('c.t_periodepajak', $data['t_periodepajak']);
        $where->equalTo('c.t_masaawal', $data['t_masaawal']);
        $where->equalTo('c.t_masaakhir', $data['t_masaakhir']);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getPembayaranSampahByDatapasar($data) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel"
            , "t_kabupatenobjek", "t_rtobjek", "t_rwobjek", "t_latitudeobjek", "t_longitudeobjek", "t_jenisobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_tarifpajak",
            "t_jmlhpajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_detailkebersihan"
                ), "c.t_idtransaksi = d.t_idtransaksi", array('*'), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_tarifkebersihan"
                ), "e.s_idtarif = d.t_idtarif", array('*'), $select::JOIN_LEFT);
        $select->join(array(
            "f" => "view_rekening"
                ), "c.t_idkorek = f.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idwp', (int) $data['t_idwp']);
        $where->equalTo('c.t_jenispajak', 13);
        $where->equalTo('c.t_periodepajak', $data['t_periodepajak']);
        $where->equalTo('c.t_masaawal', $data['t_masaawal']);
        $where->equalTo('c.t_masaakhir', $data['t_masaakhir']);
        $where->isNotNull('c.t_tglpembayaran');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    
}

