<?php

namespace Pajak\Model\Skpdlb;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class SkpdlbTable extends AbstractTableGateway {

    protected $table = 't_skpdlb';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SkpdlbBase());
        $this->initialize();
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

    public function simpanpembayaranskpdlb(SkpdlbPengembalianBase $base, $session) {
        $data = array(
            't_tglpengembalianskpdlb' => date('Y-m-d', strtotime($base->t_tglpengembalianskpdlb)),
            't_jmlhpengembalianskpdlb' => str_ireplace('.', '', $base->t_jmlhpengembalianskpdlb),
            't_operatorpengembalianskpdlb' => $session['s_iduser']
        );
        $this->update($data, array('t_idskpdlb' => $base->t_idskpdlb));
    }

    public function getGridCountSkpdlb(SkpdlbBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdlb"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdlb"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('d.t_jmlhpengembalianskpdlb');
        $where->isNotNull('d.t_tglskpdlb');
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

    public function getGridDataSkpdlb(SkpdlbBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpembayaran", "t_jmlhpembayaran", "t_nopembayaran"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdlb"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdlb", "t_tglskpdlb"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('d.t_jmlhpengembalianskpdlb');
        $where->isNotNull('d.t_tglskpdlb');
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
                $select->order("t_tglskpdlb desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_tglskpdlb desc");
            }
        } else {
            $select->order("t_tglskpdlb desc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountPengembalianSkpdlb(SkpdlbBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdlb"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdlb"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_jmlhpengembalianskpdlb');
        $where->isNotNull('d.t_tglpengembalianskpdlb');
        $where->isNotNull('d.t_tglskpdlb');
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

    public function getGridDataPengembalianSkpdlb(SkpdlbBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_nopembayaran"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdlb"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_tglpengembalianskpdlb", "t_jmlhpengembalianskpdlb"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_jmlhpengembalianskpdlb');
        $where->isNotNull('d.t_tglpengembalianskpdlb');
        $where->isNotNull('d.t_tglskpdlb');
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
                $select->order("t_tglpembayaran desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_tglpembayaran desc");
            }
        } else {
            $select->order("t_tglpembayaran desc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function hapusSkpdlb($id, $session) {
        $data = array(
            'is_deluserpembayaran' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function getTransaksiSKPDLBByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_jenisobjek", "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_tglpendataan", "t_nourut", "t_periodepajak", "t_masaawal", "t_masaakhir", "t_tarifpajak",
            "t_dasarpengenaan", "t_jmlhpajak", "t_tglpenetapan", "t_tgljatuhtempo", "t_jmlhdendapembayaran", "t_dasarpengenaan", "t_jmlhpajak", "t_tarifpajak", "t_jmlhpembayaran"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdlb"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_idskpdlb", "t_noskpdlb", "t_periodeskpdlb", "t_tglskpdlb", "t_dasarrevisi", "t_selisihdasar", "t_jmlhpajakseharusnya", "t_kodebayarskpdlb", "t_totalskpdlb"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "view_rekening"
                ), "c.t_idkorek = e.s_idkorek", array(
            "s_idkorek", "s_namakorek", "korek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataSKPDLB($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdlb"
        ));
        $select->columns(array(
            "t_idtransaksi" => "t_idtransaksi",
            "t_tglpendataan" => "t_tglskpdlb",
            "t_dasarpengenaan" => "t_dasarrevisi",
            "t_tarifpajak" => "t_tarifpajak",
            "t_jmlhpajak" => "t_jmlhpajakseharusnya",
            "t_totalpajak" => "t_totalskpdlb",
            "t_tglpembayaran" => "t_tglpengembalianskpdlb",
            "t_jmlhpembayaran" => "t_jmlhpengembalianskpdlb",
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        if ($res == false) {
            $data = array(
                "t_idtransaksi" => null,
                "t_tglpendataan" => null,
                "t_dasarpengenaan" => null,
                "t_tarifpajak" => null,
                "t_jmlhpajak" => null,
                "t_totalpajak" => null,
                "t_tglpembayaran" => null,
                "t_jmlhpembayaran" => null,
                "t_jenisketetapan" => "SKPDLB",
                "t_idketetapan" => 7
            );
        } else {
            $tambahan = array(
                "t_jenisketetapan" => "SKPDLB",
                "t_idketetapan" => 7
            );
            $data = array_merge($res, $tambahan);
        }
        return $data;
    }

}
