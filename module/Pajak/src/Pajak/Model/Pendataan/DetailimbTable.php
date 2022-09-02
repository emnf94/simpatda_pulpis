<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailimbTable extends AbstractTableGateway {

    protected $table = 't_detailimb';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }
    
    public function simpandetailimb($post, $dataparent) {
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_jmlhbangunan' => str_ireplace(".", "", $post['t_jmlhbangunan']),
            't_panjang' => $post['t_panjang'],
            't_lebar' => $post['t_lebar'],
            't_luas' => $post['t_luas'],
            't_imbluas' => $post['t_imbluas'],
            't_imblantai' => $post['t_imblantai'],
            't_imbgunabgn' => $post['t_imbgunabgn'],
            't_imblokasi' => $post['t_imblokasi'],
            't_imbkondisi' => $post['t_imbkondisi'],
            't_tarifdasar' => str_ireplace(".", "", $post['t_tarifdasar']),
            't_jmlhpajak' => str_ireplace(".", "", $post['t_jmlhpajak']),
            't_peruntukan' => $post['t_peruntukan'],
        );
        $t_idretimb = $post['t_idretimb'];
        if (empty($t_idretimb)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idretimb' => $t_idretimb));
        }
        return $data;
    }

    public function getcomboIdImbluas() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_imb_luas');
        $select->order("s_idluas asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idluas']] = $row['s_idluas'] . " || " . $row['s_namaluas'] ." (". $row['s_koefisien'].")";
        }
        return $selectData;
    }

    public function getcomboIdImblantai() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_imb_lantai');
        $select->order("s_idlantai asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idlantai']] = $row['s_idlantai'] . " || " . $row['s_namalantai'] ." (". $row['s_koefisien'].")";
        }
        return $selectData;
    }
    
    public function getcomboIdImbgunabgn() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_imb_gunabgn');
        $select->order("s_idgunabgn asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idgunabgn']] = $row['s_idgunabgn'] . " || " . $row['s_namagunabgn'] ." (". $row['s_koefisien'].")";
        }
        return $selectData;
    }
    
    public function getcomboIdImblokasi() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_imb_lokasi');
        $select->order("s_idlokasi asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idlokasi']] = $row['s_idlokasi'] . " || " . $row['s_namalokasi'] ." (". $row['s_koefisien'].")";
        }
        return $selectData;
    }
    
    public function getcomboIdImbkondisi() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_imb_kondisi');
        $select->order("s_idkondisi asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idkondisi']] = $row['s_idkondisi'] . " || " . $row['s_namakondisi'] ." (". $row['s_koefisien'].")";
        }
        return $selectData;
    }
    
    
    public function getDataIdTarif($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_imb_tarif');
        $where = new Where();
        $where->equalTo('s_idtarif', $id);
        $select->where($where);
        $select->order("s_idtarif asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataIdKoefisienluas($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_imb_luas');
        $where = new Where();
        $where->equalTo('s_idluas', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getDataIdKoefisienlantai($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_imb_lantai');
        $where = new Where();
        $where->equalTo('s_idlantai', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getDataIdKoefisiengunabgn($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_imb_gunabgn');
        $where = new Where();
        $where->equalTo('s_idgunabgn', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getDataIdKoefisienlokasi($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_imb_lokasi');
        $where = new Where();
        $where->equalTo('s_idlokasi', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getDataIdKoefisienkondisi($id) {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_imb_kondisi');
        $where = new Where();
        $where->equalTo('s_idkondisi', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getPendataanImbByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "t_detailimb"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idretimb","t_jmlhbangunan","t_panjang", "t_lebar","t_luas","t_imbluas","t_imblantai","t_imbgunabgn","t_imblokasi","t_imbkondisi","t_tarifdasar","t_jmlhpajak","t_peruntukan"
                ), $select::JOIN_LEFT);
       
        $select->join(array(
            "c" => "s_imb_lantai"
                ), "c.s_idlantai = b.t_imblantai", array(
            "s_idlantai","s_namalantai","s_koeflantai"=> "s_koefisien"
                ), $select::JOIN_LEFT);

        $select->join(array(
            "d" => "s_imb_luas"
                ), "d.s_idluas = b.t_imbluas", array(
            "s_idluas","s_namaluas","s_koefluas"=> "s_koefisien"
                ), $select::JOIN_LEFT);

        $select->join(array(
            "e" => "s_imb_gunabgn"
                ), "e.s_idgunabgn = b.t_imbgunabgn", array(
            "s_idgunabgn","s_namagunabgn","s_koefgunabgn"=> "s_koefisien"
                ), $select::JOIN_LEFT);

        $select->join(array(
            "f" => "s_imb_lokasi"
                ), "f.s_idlokasi = b.t_imblokasi", array(
            "s_idlokasi","s_namalokasi","s_koeflokasi"=> "s_koefisien"
                ), $select::JOIN_LEFT);

        $select->join(array(
            "g" => "s_imb_kondisi"
                ), "g.s_idkondisi = b.t_imbkondisi", array(
            "s_idkondisi","s_namakondisi","s_koefkondisi"=> "s_koefisien"
                ), $select::JOIN_LEFT);

         $select->join(array(
            "j" => "view_rekening"
                ), "a.t_idkorek = j.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('b.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        // echo ($select);exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getImb($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_detailimb'
        ));
        $select->join(array(
            "b" => "s_imb_luas"
                ), "a.t_imbluas=b.s_idluas", array(
            "s_namaluas", "s_koefluas"=>"s_koefisien"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_imb_lantai"
                ), "a.t_imblantai=c.s_idlantai", array(
            "s_namalantai", "s_koeflantai"=>"s_koefisien"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_imb_gunabgn"
                ), "a.t_imbgunabgn=d.s_idgunabgn", array(
            "s_namagunabgn", "s_koefgunabgn"=>"s_koefisien"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_imb_lokasi"
                ), "a.t_imblokasi=e.s_idlokasi", array(
            "s_namalokasi", "s_koeflokasi"=> "s_koefisien"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "f" => "s_imb_kondisi"
                ), "a.t_imbkondisi=f.s_idkondisi", array(
            "s_namakondisi", "s_koefkondisi" => "s_koefisien"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    
}
