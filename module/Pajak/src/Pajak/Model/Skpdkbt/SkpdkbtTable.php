<?php

namespace Pajak\Model\Skpdkbt;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class SkpdkbtTable extends AbstractTableGateway {

    protected $table = 't_skpdkbt';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SkpdkbtBase());
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

    public function simpanpembayaranskpdkbt(SkpdkbtPembayaranBase $base, $session) {
        $data = array(
            't_tglbayarskpdkbt' => date('Y-m-d', strtotime($base->t_tglbayarskpdkbt)),
            't_viabayarskpdkbt' => $base->t_viabayarskpdkbt,
            't_jmlhbayarskpdkbt' => str_ireplace('.', '', $base->t_jmlhbayarskpdkbt),
            't_operatorbayarskpdkbt' => $session['s_iduser']
        );
        $this->update($data, array('t_idskpdkbt' => $base->t_idskpdkbt));
    }

    public function getGridCountSkpdkbt(SkpdkbtBase $base) {
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
            "d" => "t_skpdkbt"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdkbt"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('d.t_jmlhbayarskpdkbt');
        $where->isNull('d.t_tglbayarskpdkbt');
        $where->isNotNull('d.t_kodebayarskpdkbt');
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

    public function getGridDataSkpdkbt(SkpdkbtBase $base, $offset) {
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
            "d" => "t_skpdkbt"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdkbt", "t_tglskpdkbt"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('d.t_jmlhbayarskpdkbt');
        $where->isNull('d.t_tglbayarskpdkbt');
        $where->isNotNull('d.t_kodebayarskpdkbt');
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
                $select->order("t_tglskpdkbt desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_tglskpdkbt desc");
            }
        } else {
            $select->order("t_tglskpdkbt desc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountPembayaranSkpdkbt(SkpdkbtBase $base) {
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
            "d" => "t_skpdkbt"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdkbt"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_jmlhbayarskpdkbt');
        $where->isNotNull('d.t_tglbayarskpdkbt');
        $where->isNotNull('d.t_kodebayarskpdkbt');
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

    public function getGridDataPembayaranSkpdkbt(SkpdkbtBase $base, $offset) {
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
            "d" => "t_skpdkbt"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_tglbayarskpdkbt", "t_jmlhbayarskpdkbt"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_jmlhbayarskpdkbt');
        $where->isNotNull('d.t_tglbayarskpdkbt');
        $where->isNotNull('d.t_kodebayarskpdkbt');
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

    public function hapusSkpdkbt($id, $session) {
        $data = array(
            'is_deluserpembayaran' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function getTransaksiSKPDKBTByIdTransaksi($t_idtransaksi) {
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
            "d" => "t_skpdkbt"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_idskpdkbt", "t_noskpdkbt", "t_periodeskpdkbt", "t_tgljatuhtemposkpdkbt", "t_tglskpdkbt", "t_dasarrevisi", "t_selisihdasar", "t_jmlhbln", "t_tarifpersen", "t_jmlhdendaskpdkbt", "t_jmlhpajakseharusnya", "t_jmlhpajakskpdkbt", "t_kodebayarskpdkbt", "t_totalskpdkbt"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_skpdkb"
                ), "c.t_idtransaksi = e.t_idtransaksi", array(
            "t_jmlhpajakseharusnyaskpdkb" => "t_jmlhpajakseharusnya", "t_dasarrevisiskpdkb" => "t_dasarrevisi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "f" => "view_rekening"
                ), "c.t_idkorek = f.s_idkorek", array(
            "s_idkorek", "s_namakorek", "korek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getSKPDKBByIdTransaksi($t_idtransaksi) {
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
            "t_tglpendataan", "t_nourut", "t_periodepajak", "t_masaawal", "t_masaakhir", "t_tarifpajak",
            "t_tglpenetapan", "t_jmlhdendapembayaran", "t_dasarpengenaan", "t_jmlhpajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
                ), "c.t_idkorek = d.s_idkorek", array(
            "s_idkorek", "s_namakorek", "korek", "s_persentarifkorek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_skpdkb"
                ), "c.t_idtransaksi = e.t_idtransaksi", array(
            "t_idskpdkb", "t_noskpdkb", "t_periodeskpdkb", "t_tglskpdkb", "t_dasarrevisi", "t_selisihdasar", "t_jmlhbln", "t_tarifpersen", "t_jmlhdendaskpdkb", "t_jmlhpajakseharusnya", "t_jmlhpajakskpdkb", "t_kodebayarskpdkb", "t_totalskpdkb"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataSKPDKBT($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdkbt"
        ));
        $select->columns(array(
            "t_idtransaksi" => "t_idtransaksi",
            "t_tglpendataan" => "t_tglskpdkbt",
            "t_dasarpengenaan" => "t_dasarrevisi",
            "t_tarifpajak" => "t_tarifpajak",
            "t_jmlhpajak" => "t_jmlhpajakseharusnya",
            "t_totalpajak" => "t_totalskpdkbt",
            "t_tglpembayaran" => "t_tglbayarskpdkbt",
            "t_jmlhpembayaran" => "t_jmlhbayarskpdkbt",
            "t_tgljatuhtempo" => "t_tgljatuhtemposkpdkbt",
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
                "t_jenisketetapan" => "SKPDKBT",
                "t_idketetapan" => 6
            );
        } else {
            $tambahan = array(
                "t_jenisketetapan" => "SKPDKBT",
                "t_idketetapan" => 6
            );
            $data = array_merge($res, $tambahan);
        }
        return $data;
    }

}
