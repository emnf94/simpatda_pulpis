<?php

namespace Pajak\Model\Skpdkb;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class SkpdkbTable extends AbstractTableGateway {

    protected $table = 't_skpdkb';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SkpdkbBase());
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

    public function simpanpembayaranskpdkb(SkpdkbPembayaranBase $base, $session) {
        $data = array(
            't_tglbayarskpdkb' => date('Y-m-d', strtotime($base->t_tglbayarskpdkb)),
            't_viabayarskpdkb' => $base->t_viabayarskpdkb,
            't_jmlhbayarskpdkb' => str_ireplace('.', '', $base->t_jmlhbayarskpdkb),
            't_operatorbayarskpdkb' => $session['s_iduser']
        );
        $this->update($data, array('t_idskpdkb' => $base->t_idskpdkb));
    }

    public function getGridCountSkpdkb(SkpdkbBase $base) {
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
            "d" => "t_skpdkb"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdkb"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('d.t_jmlhbayarskpdkb');
        $where->isNull('d.t_tglbayarskpdkb');
        $where->isNotNull('d.t_kodebayarskpdkb');
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

    public function getGridDataSkpdkb(SkpdkbBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpembayaran", "t_jmlhpembayaran", "t_nopembayaran"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdkb"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdkb", "t_tglskpdkb", "t_jenispemeriksaan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('d.t_jmlhbayarskpdkb');
        $where->isNull('d.t_tglbayarskpdkb');
        $where->isNotNull('d.t_kodebayarskpdkb');
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
                $select->order("t_tglskpdkb desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_tglskpdkb desc");
            }
        } else {
            $select->order("t_tglskpdkb desc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountPembayaranSkpdkb(SkpdkbBase $base) {
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
            "d" => "t_skpdkb"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdkb"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_jmlhbayarskpdkb');
        $where->isNotNull('d.t_tglbayarskpdkb');
        $where->isNotNull('d.t_kodebayarskpdkb');
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

    public function getGridDataPembayaranSkpdkb(SkpdkbBase $base, $offset) {
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
            "d" => "t_skpdkb"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_tglbayarskpdkb", "t_jmlhbayarskpdkb"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_jmlhbayarskpdkb');
        $where->isNotNull('d.t_tglbayarskpdkb');
        $where->isNotNull('d.t_kodebayarskpdkb');
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

    public function hapusSkpdkb($id, $session) {
		$this->delete(array('t_idtransaksi' => $id));
        // $data = array(
            // 'is_deluserpembayaran' => $session['s_iduser']
        // );
        // $this->update($data, array('t_idtransaksi' => $id));
    }

	public function hapuspembayaranSkpdkb($id, $session) {
        $data = array(
            't_tglbayarskpdkb' => null,
            't_viabayarskpdkb' => null,
            't_jmlhbayarskpdkb' => null,
            't_operatorbayarskpdkb' => null,
//            'is_deluserpembayaran' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }
	
    public function cekSKPDKBByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('t_skpdkb');
        $where = new Where();
        $where->equalTo('t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getTransaksiSKPDKBByIdTransaksi($t_idtransaksi) {
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
            "d" => "t_skpdkb"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_idskpdkb", "t_noskpdkb", "t_periodeskpdkb", "t_tglskpdkb", "t_dasarrevisi", "t_selisihdasar", "t_jmlhbln", "t_tarifpersen", "t_jmlhdendaskpdkb", "t_jmlhpajakseharusnya", "t_jmlhpajakskpdkb", "t_kodebayarskpdkb", "t_totalskpdkb", "t_tgljatuhtemposkpdkb"
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

    public function getDataSKPDKB($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdkb"
        ));
        $select->columns(array(
            "t_idtransaksi" => "t_idtransaksi",
            "t_tglpendataan" => "t_tglskpdkb",
            "t_dasarpengenaan" => "t_dasarrevisi",
            "t_tarifpajak" => "t_tarifpajak",
            "t_jmlhpajak" => "t_jmlhpajakseharusnya",
            "t_totalpajak" => "t_totalskpdkb",
            "t_tglpembayaran" => "t_tglbayarskpdkb",
            "t_jmlhpembayaran" => "t_jmlhbayarskpdkb",
            "t_tgljatuhtempo" => "t_tgljatuhtemposkpdkb"
            
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
                "t_jenisketetapan" => "SKPDKB",
                "t_idketetapan" => 5
            );
        } else {
            $tambahan = array(
                "t_jenisketetapan" => "SKPDKB",
                "t_idketetapan" => 5
            );
            $data = array_merge($res, $tambahan);
        }
        return $data;
    }

}
