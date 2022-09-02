<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class TeguranTable extends AbstractTableGateway {

    protected $table = 't_teguranlaporpajak';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new TeguranBase());
        $this->initialize();
    }

//     public function simpansuratteguran(TeguranBase $base, $post, $session, $i) {
//         $data = array( 
//             't_noteguran' => $post['t_noteguran'][$i],
//             't_idobjekteguran' => $post['t_idobjekteguran'][$i],
//             't_tglteguran' => date('Y-m-d', strtotime($base->t_tglteguran)),
//             't_bulanpajak' => $base->t_bulanpajak,
//             't_tahunpajak' => $base->t_tahunpajak,
//             't_operatorinputteguran' => $session['s_iduser'],
//         );
// //        $t_idair = $base->t_idair;
// //        if (empty($t_idair)) {
//         $this->insert($data);
// //        } else {
// //            $this->update($data, array('t_idair' => $t_idair));
// //        }
// //        return $data;
//     }

    public function simpansuratteguran(TeguranBase $base, $post, $session, $i) {
        $id = (int) $base->t_idteguran;
        // echo ($id);die;
        $data = array(
                    't_noteguran' => $post['t_noteguran'][$i],
                    't_idobjekteguran' => $post['t_idobjekteguran'][$i],
                    't_tglteguran' => date('Y-m-d', strtotime($base->t_tglteguran)),
                    't_bulanpajak' => $base->t_bulanpajak,
                    't_tahunpajak' => $base->t_tahunpajak,
                    't_operatorinputteguran' => $session['s_iduser'],
                );
        if ($id == 0) {
                
                $this->insert($data);
            } else {
                // echo "gagal";die;

                $this->update($data, array('t_idteguran' => $id));
                
                
            } 
    }

    public function getGridCountSuratTeguran(TeguranBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_teguranlaporpajak"
        ));
        $select->columns(array(
            "t_noteguran"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "b.t_idobjek = a.t_idobjekteguran", array(
            't_npwpdwp'
                ), $select::JOIN_LEFT);
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari LIKE '%$base->kolomcari%'");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSuratTeguran(TeguranBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_teguranlaporpajak"
        ));
        $select->columns(array(
            "t_noteguran", "t_tglteguran", "t_bulanpajak", "t_tahunpajak", "t_idteguran"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "b.t_idobjek = a.t_idobjekteguran", array(
            't_npwpdwp', 't_namawp', "t_idobjek", "t_nop", "t_namaobjek", "t_alamatlengkapobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari LIKE '%$base->kolomcari%'");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $select->where($where);
        if ($base->sortasc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortasc");
            } else {
                $select->order("a.t_idteguran desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("a.t_idteguran desc");
            }
        } else {
            $select->order("a.t_idteguran desc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataSuratTeguran($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_teguranlaporpajak"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idobjekteguran = b.t_idobjek", 
                array(
                    "t_idobjek", "t_jenisobjek", "t_nop", "t_namaobjek", "t_rtobjek", "t_rwobjek", "t_alamatobjek","s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek", "s_namajenis", "t_latitudeobjek", "t_longitudeobjek", "t_alamatlengkapobjek", "s_namajenissingkat"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp"
                ), "b.t_idwp = c.t_idwp",
                array(
                    "t_nama", "t_npwpd"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idteguran', (int) $id);
        $select->where($where);
        // echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function checkIdTeguran($id) {
        $rowset = $this->select(array('t_idteguran' => $id));
        $row = $rowset->current();
        return $row;
    }

}
