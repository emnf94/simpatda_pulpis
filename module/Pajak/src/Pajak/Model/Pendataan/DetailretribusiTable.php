<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailretribusiTable extends AbstractTableGateway {

    protected $table = 't_detailretribusi';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetailretribusi($datapost, $dataparent) {
        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));
        for ($i = 0; $i < count($datapost['t_iddetailret']); $i++) {
            if (!empty($datapost['t_iddetailret'][$i])) {
                $data = array(
                    't_idtransaksi' => $dataparent['t_idtransaksi'],
                    't_uraianretribusi' => $datapost['t_uraianretribusi'][$i],
                    't_jumlah' => str_ireplace(".", "", $datapost['t_jumlah'][$i]),
                );
                $this->insert($data);
            } else {
                $this->update($data, array('t_iddetailret' => $t_iddetailret));
            }
        }
    }

    public function simpandetailkesehatan($post, $dataparent) {
        $t_uraianretribusi = (!empty($post['t_uraianretribusi'])) ? $post['t_uraianretribusi'] : 0;
        $t_jumlah = (!empty($post['t_jumlah'])) ? $post['t_jumlah'] : 0;
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_uraianretribusi' => $post['t_uraianretribusi'],
            't_jumlah' => str_ireplace(".", "", $t_jumlah),
        );
        $t_iddetailret = $post['t_iddetailret'];
        if (empty($t_iddetailret)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_iddetailret' => $t_iddetailret));
        }
        return $data;
    }
    

    public function getDetailKesehatanByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailretribusi"
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        // echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
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

    public function getdataTarifParkir() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifparkirtepi');
        $where = new Where();
        $select->where($where);
        $select->order(['s_idtarif' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataIdParkirtepi($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifparkirtepi');
        $where = new Where();
        $where->equalTo('s_idtarif', $id);
        $select->where($where);
        $select->order(['s_idtarif' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }


}
