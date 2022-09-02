<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailhoTable extends AbstractTableGateway {

    protected $table = 't_detailho';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }
    
    public function simpandetailho($post, $dataparent) {
		if(!empty($post['t_indeks_luas'])){
			$t_indeks_luas = $post['t_indeks_luas'];
		}else{
			$t_indeks_luas = 0;
		}
		
		if(!empty($post['t_kwslokasi'])){
			$t_kwslokasi = $post['t_kwslokasi'];
		}else{
			$t_kwslokasi = 0;
		}
		
		if(!empty($post['t_gangguan'])){
			$t_gangguan = $post['t_gangguan'];
		}else{
			$t_gangguan = 0;
		}
		
		if(!empty($post['t_skala'])){
			$t_skala = $post['t_skala'];
		}else{
			$t_skala = 0;
		}
		
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_panjang' => str_ireplace(".", "", $post['t_panjang']),
            't_lebar' => str_ireplace(".", "", $post['t_lebar']),
            't_luas' => str_ireplace(".", "", $post['t_luas']),
            't_indeksluas' => $t_indeks_luas,
            't_kwslokasi' => $t_kwslokasi,
            't_gangguan' => $t_gangguan,
            't_skala' => $t_skala,
            't_tarifdasar' => str_ireplace(".", "", $post['t_tarifdasar']),
            't_jmlhpajak' => str_ireplace(".", "", $post['t_jmlhpajak']),
        );
        $t_idretho = $post['t_idretho'];
        if (empty($t_idretho)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idretho' => $t_idretho));
        }
        return $data;
    }

    public function getcomboIdHolokasi() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_ho_lokasi');
        $select->order("s_idlokasi asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idlokasi']] = $row['s_idlokasi'] . " || " . $row['s_namalokasi'] ." (". $row['s_indeks'].")";
        }
        return $selectData;
    }

    public function getcomboIdHogangguan() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_ho_gangguan');
        $select->order("s_idgangguan asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idgangguan']] = $row['s_idgangguan'] . " || " . $row['s_namagangguan'] ." (". $row['s_indeks'].")";
        }
        return $selectData;
    }
    
    public function getcomboIdHoskala() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_ho_skala');
        $select->order("s_idskala asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idskala']] = $row['s_idskala'] . " || " . $row['s_namaskala'];
        }
        return $selectData;
    }
    
    
    public function getDataIdTarif($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_ho_skala');
        $where = new Where();
        $where->equalTo('s_idskala', $id);
        $select->where($where);
        $select->order("s_idskala asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataIdIndekslokasi($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_ho_lokasi');
        $where = new Where();
        $where->equalTo('s_idlokasi', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getDataIdIndeksgangguan($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_ho_gangguan');
        $where = new Where();
        $where->equalTo('s_idgangguan', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getDataIdIndeksluas($luas) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_ho_luas');
        $where = new Where();
//        $where->equalTo('s_idgangguan', $id);
        $where->literal('s_luasawal < ' . $luas . ' and s_luasakhir >= ' . $luas);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    
    
    public function getPendataanHoByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "t_detailho"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idretho","t_panjang","t_lebar", "t_luas","t_kwslokasi","t_gangguan","t_skala","t_tarifdasar","t_jmlhpajak"
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

    public function getHo($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_detailho'
        ));
        $select->join(array(
            "b" => "s_ho_lokasi"
                ), "a.t_kwslokasi=b.s_idlokasi", array(
            "s_namalokasi","s_indeks_lokasi"=>"s_indeks"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_ho_gangguan"
                ), "a.t_gangguan=c.s_idgangguan", array(
            "s_namagangguan","s_indeks_gangguan"=>"s_indeks"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_ho_skala"
                ), "a.t_skala=d.s_idskala", array(
            "s_namaskala","s_satuan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    
}
