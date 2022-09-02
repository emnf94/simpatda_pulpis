<?php

namespace Pajak\Model\Laporanbendahara;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class LaporanbendaharaTable extends AbstractTableGateway {

    protected $table = 't_transaksi';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new LaporanbendaharaBase());
        $this->initialize();
    }

    public function getLaporanbendaharaId($t_idtransaksi) {
        $rowset = $this->select(array('t_idtransaksi' => $t_idtransaksi));
        $row = $rowset->current();
        return $row;
    }

    // Laporanbendahara SPTPD Self Assesment
    public function simpankatering(LaporanbendaharaBase $base, $session, $post) {
        $delay = \Zend\Math\Rand::getString(1, '12345', true);
        sleep($delay);
        // Jatuh Tempo Self Assesment
        $t_tgljatuhtempo = $this->geTglJatuhTempo($post['t_jenisobjekpajak']);
        $t_tgljatuhtempofix = date('Y-m-' . $t_tgljatuhtempo['t_akhirbayar'], strtotime("+1 month" . $base->t_masaawal));

        $data = array(
            't_idwpobjek' => $base->t_idobjek,
            't_idkorek' => $base->t_idkorek,
            't_jenispajak' => 2,
            't_periodepajak' => date('Y'),
            't_tglpendataan' => date('Y-m-d'),
            't_masaawal' => date('Y-m-d', strtotime($base->t_masaawal)),
            't_masaakhir' => date('Y-m-d', strtotime($base->t_masaakhir)),
            't_dasarpengenaan' => str_ireplace(".", "", $base->t_dasarpengenaan),
            't_tarifpajak' => $base->t_tarifpajak,
            't_jmlhpajak' => str_ireplace(".", "", $base->t_jmlhpajak),
            't_operatorpendataan' => $session['s_iduser'],
            't_tgljatuhtempo' => $t_tgljatuhtempofix,
            't_tarifkenaikan' => null,
            't_jmlhkenaikan' => null,
            't_namakegiatan' => $base->t_namakegiatan
        );
        $t_idtransaksi = $base->t_idtransaksi;
        if (empty($t_idtransaksi)) {
            $jenissurat = $this->getjenissurat(1);
            $no = $this->getLaporanbendaharaMax();
            $t_nourut = (int) $no['t_nourut'] + 1;
            $data['t_nourut'] = $t_nourut;
            $data['t_kodebayar'] = date('Y') . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . str_pad($t_nourut, 6, "0", STR_PAD_LEFT);
            $this->insert($data);
        } else {
            $jenissurat = $this->getjenissurat(1);
            $data['t_nourut'] = $base->t_nourut;
            $data['t_kodebayar'] = date('Y') . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . str_pad($base->t_nourut, 6, "0", STR_PAD_LEFT);
            $this->update($data, array('t_idtransaksi' => $t_idtransaksi));
        }
    }

    public function getGridCount(LaporanbendaharaBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek =2 and c.t_tglpendataan is not null');
        $where->notEqualTo("t_nourut", 0);
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
        $select->order('t_nourut desc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(LaporanbendaharaBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek", "s_jenispungutan"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jenispajak", "t_jmlhpembayaran", "t_tglpembayaran"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_users"
                ), "c.t_operatorpendataan = d.s_iduser", array(
            "s_nama"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek =2 and c.t_tglpendataan is not null');
        $where->notEqualTo("t_nourut", 0);
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
                $select->order("t_nourut desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_nourut desc");
            }
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function hapusLaporanbendahara($id, $session) {
        $data = array(
            'is_deluserpendataan' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function getLaporanbendaharaMax() {
        $sql = "select max(t_nourut) as t_nourut from t_transaksi";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function geTglJatuhTempo($t_jenisobjekpajak) {
        $sql = "select t_akhirbayar from s_jenisobjek where s_idjenis='" . $t_jenisobjekpajak . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getjenissurat($s_idsurat) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_jenissurat");
        $where = new Where();
        $where->equalTo("s_idsurat", $s_idsurat);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

}
