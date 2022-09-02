<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailkekayaanTable extends AbstractTableGateway {

    protected $table = 't_detailkekayaan';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetail($datapost, $dataparent) {
        
        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));
        for ($i = 0; $i < count($datapost['t_iddetailret']); $i++) {
            // if (!empty($datapost['t_iddetailret'][$i])) {
                $data = array(
                    
                    't_idtransaksi' => (int)($dataparent['t_idtransaksi']),
                    't_jenislayanan' => (int)($datapost['t_idjenis'][$i]),
                    't_jeniskekayaan'=> (int)($datapost['t_jeniskekayaan'][$i]),
                    't_keterangan' => $datapost['t_uraian'][$i],
                    't_jumlah' => (float)(str_ireplace(".", "", $datapost['t_jumlah'][$i])),
                    't_lamawaktu'=>(int)($datapost['t_lamawaktu'][$i]),
                    't_jumlahitem' => (float)($datapost['t_jumlahitem'][$i]),
                    't_tarifdasar'=>(float)(str_ireplace(".", "", $datapost['t_tarifdasar'][$i])),
                );
              // var_dump($data);
              $this->insert($data);
            // }
           
        }
        // exit();
         
    }
    
    public function simpandetailkekayaan($post, $dataparent) {
        $t_luastanah = (!empty($post['t_luastanah'])) ? $post['t_luastanah'] : 0;
        $t_luasbangunan = (!empty($post['t_luasbangunan'])) ? $post['t_luasbangunan'] : 0;
        $t_nilailuastanah = (!empty($post['t_nilailuastanah'])) ? $post['t_nilailuastanah'] : 0;
        $t_nilailuasbangunan = (!empty($post['t_nilailuasbangunan'])) ? $post['t_nilailuasbangunan'] : 0;
        $t_hargatanah = (!empty($post['t_hargatanah'])) ? $post['t_hargatanah'] : 0;
        $t_hargadasarsewa = (!empty($post['t_hargadasarsewa'])) ? $post['t_hargadasarsewa'] : 0;
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_idklasifikasi' => $post['t_klasifikasi'],
            't_kategorisatu' => $post['t_kategorisatu'],
            't_kategoridua' => $post['t_kategoridua'],
            't_luastanah' => $t_luastanah,
            't_luasbangunan' => $t_luasbangunan,
            't_nilailuastanah' => str_ireplace(".", "", $t_nilailuastanah),
            't_nilailuasbangunan' => str_ireplace(".", "", $t_nilailuasbangunan),
            't_jmlhbln' => $post['t_jmlhbln'],
            't_hargatanah' => str_ireplace(".", "", $t_hargatanah),
            't_hargadasarsewa' => str_ireplace(".", "", $t_hargadasarsewa),
            // 't_potongan' => str_ireplace(".", "", $post['t_potongan'])
        );
        $t_idkekayaan = $post['t_idkekayaan'];
        if (empty($t_idkekayaan)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idkekayaan' => $t_idkekayaan));
        }
        return $data;
    }

    public function getPendataanKekayaanByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "t_detailkekayaan"
                ), "a.t_idtransaksi = b.t_idtransaksi", 
                array("*"), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_rekening"
                ), "a.t_idkorek = c.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('b.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        // echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

     public function getjeniskekayaan() {
       $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kekayaankategorisatu');
        $select->order('s_idkategorisatu asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    

        
    public function getDetailKekayaanByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailkekayaan"
        ));
        // $select->join(array(
        //     "b" => "s_jeniskekayaan"
        //         ), "a.t_jenislayanan = b.t_idjeniskekayaan", 
        //         array("t_namajenislayanan" => "t_keterangan"), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        // echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getcomboIdKlasifikasi() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kekayaanpenggunaan');
        $select->order('s_idpenggunaan asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idpenggunaan']] = $row['s_idpenggunaan'] . " || " . strtoupper($row['s_keterangan'])." ";
        }
        return $selectData;
    }
    
    public function getdataKategorisatu($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kekayaankategorisatu');
        $where = new Where();
        $where->equalTo('s_idklasifikasi', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getdataKategoridua($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kekayaantarif');
        $where = new Where();
        $where->equalTo('s_idkategorisatu', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getdataTarif($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kekayaantarif');
        $where = new Where();
        $where->equalTo('s_idtarif', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getdataTarifkategori($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kekayaankategorisatu');
        $where = new Where();
        $where->equalTo('s_idkategorisatu', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
	
    public function getdataJeniskekayaan() {
        // var_dump('a');exit();
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kekayaanpenggunaan');
        $where = new Where();
        $select->where($where);
        $select->order("s_idpenggunaan asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

     public function getdatajenis($id) {
       
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kekayaankategorisatu');
        $where = new Where();
        $where->equalTo('s_idklasifikasi', $id);
        $select->where($where);
        $select->order("s_idkategorisatu asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdatatarifkekayaan($id){
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kekayaankategorisatu');
        $where = new Where();
        $where->equalTo('s_idkategorisatu', $id);
        $select->where($where);
        $select->order("s_idkategorisatu asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;

   }

    public function getDetailKekayaanById($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailkekayaan"
        ));
        $select->join(array(
            "b" => "s_kekayaanpenggunaan"
                ), "a.t_jenislayanan = b.s_idpenggunaan", 
                array("kategori" => "s_keterangan"), $select::JOIN_LEFT);
         $select->join(array(
            "c" => "s_kekayaankategorisatu"
                ), "a.t_jeniskekayaan = c.s_idkategorisatu", 
                array("layanan" => "s_keterangan"), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        // echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

	
}
