<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailtrayekTable extends AbstractTableGateway {

    protected $table = 't_detailtrayek';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetailtrayek($post, $dataparent) {
        // echo ($dataparent);exit();
        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));
        for ($i = 0; $i < count($post['t_idrettrayek']); $i++) {
            if (!empty($post['t_idrettrayek'][$i])) {
                $data = array(
                    't_idtransaksi' => $dataparent['t_idtransaksi'],
                    't_idtarif' => $post['t_idtarif'][$i],
                    't_jmlhkendaraan' => str_ireplace(".", "", $post['t_jmlhkendaraan'][$i]),
					't_jmlhperjalanan' => str_ireplace(".", "", $post['t_jmlhperjalanan'][$i]),
					't_hargadasar' => str_ireplace(".", "", $post['t_hargadasar'][$i]),
					't_jumlah' => str_ireplace(".", "", $post['t_jumlah'][$i]),
                );
                // echo $data->getSqlstring(); exit();
                $this->insert($data);

            } else {
                echo "error";
            }
        }
    }

    public function simpandetailretribusi($datapost, $dataparent) {
        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));
        for ($i = 0; $i < count($datapost['t_idrettrayek']); $i++) {
            if (!empty($datapost['t_idrettrayek'][$i])) {
                $data = array(
                    't_idtransaksi' => $dataparent['t_idtransaksi'],
                    't_idtarif' => $datapost['t_idtarif'][$i],
                    't_jmlhkendaraan' => $datapost['t_jmlhkendaraan'][$i],
                    't_jmlhperjalanan' => $datapost['t_jmlhperjalanan'][$i],
                    't_hargadasar' => str_ireplace(".", "", $datapost['t_hargadasar'][$i]),
                    't_jumlah' => str_ireplace(".", "", $datapost['t_jumlah'][$i]),
                    't_satuan' => $datapost['t_satuan'][$i],
                );
                $this->insert($data);
            } else {
                $this->update($data, array('t_idrettrayek' => $t_idrettrayek));
            } 
        }
    }

    public function simpandetailretribusitrayek($post, $dataparent) {
        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));
        for ($i = 0; $i < count($post['t_idrettrayek']); $i++) {
            if (!empty(post['t_idrettrayek'][$i])) {
                $data = array(
                    't_idtransaksi' => $dataparent['t_idtransaksi'],
                    't_idtarif' => $post['t_idtarif'][$i],
                    't_jmlhkendaraan' => str_ireplace(".", "", $post['t_jmlhkendaraan'][$i]),
                    't_jmlhperjalanan' => str_ireplace(".", "", $post['t_jmlhperjalanan'][$i]),
                    't_hargadasar' => str_ireplace(".", "", $post['t_hargadasar'][$i]),
                    't_jumlah' => str_ireplace(".", "", $post['t_jumlah'][$i]),
                );
                $this->insert($data);
            } else {
                // echo "erorrr";
                $this->update($data, array('t_idrettrayek' => $t_idrettrayek));
            }
        }
    }

    public function simpandetailtrayek2($post, $dataparent) {
        // echo ($dataparent);exit();
        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));
        for ($i = 0; $i < count($post['t_idrettrayek']); $i++) {
            if (!empty($post['t_idrettrayek'][$i])) {
                $data = array(
                    't_idtransaksi' => $dataparent['t_idtransaksi'],
                    't_idtarif' => $post['t_idtarif'][$i],
                    't_jmlhkendaraan' => str_ireplace(".", "", $post['t_jmlhkendaraan'][$i]),
                    't_jmlhperjalanan' => str_ireplace(".", "", $post['t_jmlhperjalanan'][$i]),
                    't_hargadasar' => str_ireplace(".", "", $post['t_hargadasar'][$i]),
                    't_jumlah' => str_ireplace(".", "", $post['t_jumlah'][$i]),
                );
                // echo $data->getSqlstring(); exit();
                $this->insert($data);

            }
        }
    }


    public function getPendataanTrayekByIdTransaksi($t_idtransaksi) {
        
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailtrayek"
        ));
        $select->join(array(
            "b" => "s_tariftrayek"
                ), "a.t_idtarif = b.s_idtarif", 
                array("t_namatarif" => "s_keterangan"), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        // echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    

    public function getDetailParkirByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailparkirtepi"
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataTarif() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tariftrayek');
        $where = new Where();
        $select->where($where);
        $select->order(['s_idtarif' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

	public function getDataId($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tariftrayek');
        $where = new Where();
        $where->equalTo('s_idtarif', $id);
        $select->where($where);
        $select->order(['s_idtarif' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
	
}
