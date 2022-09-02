<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class LampiranPpjTable extends AbstractTableGateway {

    protected $table = 't_lampiranppj';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new LampiranPpjBase());
        $this->initialize();
    }

    public function simpanlampiranppj(LampiranPpjBase $base, $dataparent) {

        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_goltarifpln' => $base->t_goltarifpln,
            't_batasdaya' => $base->t_batasdaya,
            't_jmlpelanggan' => $base->t_jmlpelanggan,
            't_jmlkwhterjual' => $base->t_jmlkwhterjual,
            't_tarifperkwh' => $base->t_tarifperkwh,
            't_jmllistrikterjual' => $base->t_jmllistrikterjual,
            't_jmlbiayabeban' => $base->t_jmlbiayabeban,
            't_jmlnilaijuallistrik' => $base->t_jmlnilaijuallistrik,
            't_tarif' => $base->t_tarif,
            't_jumlah' => $base->t_jumlah,
            't_row' => $base->t_row,
        );

        $t_id = $base->t_idlampiranppj;
        if ($t_id == NULL) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idlampiranppj' => $t_id));
        }
        return $data;
    }

    public function deleteById($idToDelete) {
        return $this->delete(['t_idlampiranppj' => $idToDelete]);
    }

    public function getDetailByIdTransaksi($t_idtransaksi) {
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

    public function getLampiranByIdTransaksi($t_idtransaksi, $row) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
//        $select->join(array(
//            "b" => "view_rekening"
//                ), "a.t_idkorek = b.s_idkorek", array(
//            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
//                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $where->equalTo('t_row', $row);
        $select->where($where);
//        $select->order(['s_tipekorek' => 'asc', 's_kelompokkorek' => 'asc', 's_jeniskorek' => 'asc', 's_objekkorek' => 'asc', 's_rinciankorek' => 'asc', 's_sub1korek' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

}
