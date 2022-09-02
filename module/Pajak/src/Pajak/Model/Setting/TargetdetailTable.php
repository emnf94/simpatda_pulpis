<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class TargetdetailTable extends AbstractTableGateway {

    protected $table = 's_targetdetail';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new TargetdetailBase());
        $this->initialize();
    }

    public function getDataId($id) {
        $rowset = $this->select(array('s_idtarget' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function getdata() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function simpantargetdetail(TargetdetailBase $kc, $session) {
        $data = array(
            's_idtargetheader' => $kc->s_idtargetheader,
            's_targetrekening' => $kc->s_targetrekening,
            's_targetjumlah' => str_ireplace(".", "", $kc->s_targetjumlah)
        );
        $id = (int) $kc->s_idtargetdetail;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idtargetdetail' => $kc->s_idtargetdetail));
        }
    }

    public function temukanTargetdetail($id_header) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => 's_targetdetail'
        ));
        $select->join(array(
            "b" => "view_rekening"
                ), "a.s_targetrekening = b.s_idkorek", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('s_idtargetheader', $id_header);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function temukanTargetdetailRekening($id_header, $rekening = NULL) {
        if ($rekening != NULL):
            $whererek = " AND rek.s_idkorek=$rekening ";
        endif;
        $sql = "SELECT rek.s_idkorek,rek.korek, rek.s_namakorek, 
(
SELECT SUM(t0.s_targetjumlah) FROM s_targetdetail t0
LEFT JOIN view_rekening t_rek ON t_rek.s_idkorek=t0.s_targetrekening
WHERE t_rek.s_tipekorek=rek.s_tipekorek
AND t_rek.s_kelompokkorek=rek.s_kelompokkorek
AND t_rek.s_jeniskorek=rek.s_jeniskorek
AND t_rek.s_objekkorek=rek.s_objekkorek
AND t0.s_idtargetheader=$id_header
) as jumlahanggaran
FROM view_rekening rek 
WHERE rek.s_rinciankorek='00' $whererek
order by korek";
        $st = $this->adapter->query($sql);
        $res = $st->execute();
        return $res->current();
    }

    public function temukanTargetdetailById($id_detail) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => 's_targetdetail'
        ));
        $select->join(array(
            "b" => "view_rekening"
                ), "a.s_targetrekening = b.s_idkorek", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('s_idtargetdetail', $id_detail);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function hapusData($id) {
        $this->delete(array('s_idtargetdetail' => $id));
    }

        public function temukanTargetdetailOpd($s_idkelompoktargetsatker) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => 's_targetdetail'
        ));
        $select->join(array(
            "b" => "view_rekening"
                ), "a.s_targetrekening = b.s_idkorek", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('s_idkelompoktargetsatker', $s_idkelompoktargetsatker);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataOPD() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from([
            'a' => 's_satker'
        ]);
        $where = new Where();
        $select->where($where);
        $select->order('s_idsatker desc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }



}
