<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailPpjTable extends AbstractTableGateway
{

    protected $table = 't_detailppj';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new DetailPpjBase());
        $this->initialize();
    }

    public function simpanpendataanppj(DetailPpjBase $base, $dataparent, $post)
    {


        if ($post['t_klasifikasi'] == 1) {
            $data = array(
                't_idtransaksi' => $dataparent['t_idtransaksi'],
                't_klasifikasi' => $post['t_klasifikasi'],
                't_hargasatuanlistrik' => $post['hargasatuanlistrik'],
                't_jumlahbagihasil' => str_replace(".", "", $post['jumlahbagihasil']),
                't_tarif' => 7,
            );
        } elseif ($post['t_klasifikasi'] == 2) {
            $data = array(
                't_idtransaksi' => $dataparent['t_idtransaksi'],
                't_klasifikasi' => $post['t_klasifikasi'],
                't_biayapemakaian' => str_replace(".", "", $post['biayapemakaian']),
                't_jumlahtagihan' => str_replace(".", "", $post['jumlahtagihan']),
                't_tarif' => 1.5,
            );
        } elseif ($post['t_klasifikasi'] == 3) {
            $data = array(
                't_idtransaksi' => $dataparent['t_idtransaksi'],
                't_klasifikasi' => $post['t_klasifikasi'],
                't_hargasatuanlistrik' => $post['hargasatuanlistrik'],
                't_jumlahkwh' => (int)str_replace(".", "", $post['jumlahkwh']),
                't_faktordaya' => $post['faktordaya'],
                't_tarif' => 1,
            );
        } elseif ($post['t_klasifikasi'] == 4) {
            $data = array(
                't_idtransaksi' => $dataparent['t_idtransaksi'],
                't_klasifikasi' => $post['t_klasifikasi'],
                't_hargasatuanlistrik' => $post['hargasatuanlistrik'],
                't_jumlahkvautama' => (int)str_replace(".", "", $post['jumlahkvautama']),
                't_jumlahkvacadangan' => (int)str_replace(".", "", $post['jumlahkvacadangan']),
                't_jumlahkvadarurat' => (int)str_replace(".", "", $post['jumlahkvadarurat']),
                't_jamnyalautama' => $post['jamnyalautama'],
                't_jamnyalacadangan' => $post['jamnyalacadangan'],
                't_jamnyaladarurat' => $post['jamnyaladarurat'],
                't_faktordaya' => $post['faktordayautama'],
                't_tarif' => 1,
            );
        }


        $t_iddetailppj = $post['t_iddetailppj'];
        if ($t_iddetailppj == NULL) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_iddetailppj' => $t_iddetailppj));
        }
        return $data;
    }

    public function getDetailByIdTransaksi($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getPendataanByIdTransaksi($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
        $select->join(array(
            "b" => "view_rekening"
        ), "a.t_idkorek = b.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $select->order(['s_tipekorek' => 'asc', 's_kelompokkorek' => 'asc', 's_jeniskorek' => 'asc', 's_objekkorek' => 'asc', 's_rinciankorek' => 'asc', 's_sub1korek' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getHargaSatuanListrik()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "s_hargasatuanlistrik"
        ));
        $where = new Where();
        $select->where($where);
        $select->order(['s_idhargasatuanlistrik' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    public function getHargaSatuanListrikid($id)
    {
        $sql = "select s_hargasatuanlistrik from s_hargasatuanlistrik where s_idhargasatuanlistrik = '$id'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }

    public function getcomboIdKlasifikasi($s_idkorek)
    {
        $sql = "select * from s_klasifikasippj where s_idkorekppj = '$s_idkorek'";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getcomboIdKlasifikasiedit($s_idkorek)
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_klasifikasippj');
        $where = new Where();
        $select->where($where);
        $where->equalTo('s_idkorekppj', $s_idkorek);

        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();


        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idklasifikasippj']] =  $row['s_namaklasifikasi'];
        }
        return $selectData;
    }
}
