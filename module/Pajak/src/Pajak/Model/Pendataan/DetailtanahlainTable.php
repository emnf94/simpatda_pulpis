<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailtanahlainTable extends AbstractTableGateway {

    protected $table = 't_detailtanahlain';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetailtanahlain($post, $dataparent) {
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_panjang' => $post['t_panjang'],
            't_lebar' => $post['t_lebar'],
            't_luas' => $post['t_luas'],
            't_tarifdasar' => str_ireplace(".", "", $post['t_tarifdasar']),
            't_potongan' => str_ireplace(".", "", $post['t_potongan']),
            't_jmlhbln' => $post['t_jmlhbln'],
        );
        $t_idrpangrek = $post['t_idrpangrek'];
        if (empty($t_idrpangrek)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idrpangrek' => $t_idrpangrek));
        }
        return $data;
    }

    public function getPendataanTanahLainByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "t_detailtanahlain"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idrpangrek", "t_luas", "t_tarifdasar", "t_jmlhbln", "t_panjang", "t_lebar", "t_potongan"
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

}
