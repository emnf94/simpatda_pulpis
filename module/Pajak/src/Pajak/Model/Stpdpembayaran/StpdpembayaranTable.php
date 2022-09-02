<?php

namespace Pajak\Model\Stpdpembayaran;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class StpdpembayaranTable extends AbstractTableGateway {

    protected $table = 't_transaksi';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new StpdpembayaranBase());
        $this->initialize();
    }

    public function getStpdPembayaranId($t_idtransaksi) {
        $rowset = $this->select(array('t_idtransaksi' => $t_idtransaksi));
        $row = $rowset->current();
        return $row;
    }

    public function simpanpenetapandenda(StpdpembayaranBase $base, $session) {
        $data = array(
            't_jmlhbulandendapembayaran' => $base->t_jmlhbulandendapembayaran,
            't_jmlhdendapembayaran' => str_ireplace('.', '', $base->t_jmlhdendapembayaran),
            't_tgldendapembayaran' => date('Y-m-d', strtotime($base->t_tgldendapembayaran)),
            't_operatordendapembayaran' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $base->t_idtransaksi));
        return $data;
    }

    public function simpanpembayarandenda(StpdpembayaranBase $base, $session) {
        $data = array(
            't_jmlhbayardenda' => str_ireplace('.', '', $base->t_jmlhbayardenda),
            't_tglbayardenda' => date('Y-m-d', strtotime($base->t_tglbayardenda)),
            't_operatorbayardenda' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $base->t_idtransaksi));
        return $data;
    }

    public function temukanPembayaran($t_idwp) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_wp"
        ));
        $where = new Where();
        $where->equalTo('a.t_idwp', $t_idwp);
        $select->where($where);
        $select->order("a.t_tgldaftar DESC");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountBelum(StpdpembayaranBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_wp"
        ));
        $select->join(array(
            "b" => "s_kecamatan"
                ), "a.t_kecamatan = b.s_idkec", array(
            "s_namakec" => "s_namakec"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_kelurahan"
                ), "a.t_kelurahan = c.s_idkel", array(
            "s_namakel" => "s_namakel"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_transaksi"
                ), "a.t_idwp = d.t_idwp", array(
            "t_jmlhpembayaran" => "t_jmlhpembayaran"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_rekening"
                ), "a.t_idkorek = e.s_idkorek", array(
            "s_namakorek" => "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('d.is_deluserpembayaran');
        $where->isNotNull('d.t_tglpembayaran');
        $where->isNull('d.t_tgldendapembayaran');
        // Setelah 30 hari penetapan maka pembayaran mendapatkan denda
        $where->literal('DATEDIFF(d.t_tglpembayaran, d.t_tglpenetapan) > 30');
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

    public function getGridDataBelum(StpdpembayaranBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_wp"
        ));
        $select->join(array(
            "b" => "s_kecamatan"
                ), "a.t_kecamatan = b.s_idkec", array(
            "s_namakec" => "s_namakec"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_kelurahan"
                ), "a.t_kelurahan = c.s_idkel", array(
            "s_namakel" => "s_namakel"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_transaksi"
                ), "a.t_idwp = d.t_idwp", array(
            "t_idtransaksi" => "t_idtransaksi", "t_nourut" => "t_nourut",  "t_tglpenetapan" => "t_tglpenetapan",  "t_tglpembayaran" => "t_tglpembayaran", "t_jmlhpembayaran" => "t_jmlhpembayaran", "t_tglpembayaran" => "t_tglpembayaran"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_rekening"
                ), "a.t_idkorek = e.s_idkorek", array(
            "s_namakorek" => "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('d.is_deluserpembayaran');
        $where->isNotNull('d.t_tglpembayaran');
        $where->isNull('d.t_tgldendapembayaran');
        // Setelah 30 hari penetapan maka pembayaran mendapatkan denda
        $where->literal('DATEDIFF(d.t_tglpembayaran, d.t_tglpenetapan) > 30');
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
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSudah(StpdpembayaranBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_wp"
        ));
        $select->join(array(
            "b" => "s_kecamatan"
                ), "a.t_kecamatan = b.s_idkec", array(
            "s_namakec" => "s_namakec"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_kelurahan"
                ), "a.t_kelurahan = c.s_idkel", array(
            "s_namakel" => "s_namakel"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_transaksi"
                ), "a.t_idwp = d.t_idwp", array(
            "t_idtransaksi" => "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_rekening"
                ), "a.t_idkorek = e.s_idkorek", array(
            "s_namakorek" => "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('is_deluserdendapembayaran');
        $where->notEqualTo('t_jmlhbulandendapembayaran', 0);
        $where->notEqualTo('t_jmlhdendapembayaran', 0);
        $where->isNotNull('t_tgldendapembayaran');
        $where->isNull('t_tglbayardenda');
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

    public function getGridDataSudah(StpdpembayaranBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_wp"
        ));
        $select->join(array(
            "b" => "s_kecamatan"
                ), "a.t_kecamatan = b.s_idkec", array(
            "s_namakec" => "s_namakec"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_kelurahan"
                ), "a.t_kelurahan = c.s_idkel", array(
            "s_namakel" => "s_namakel"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_transaksi"
                ), "a.t_idwp = d.t_idwp", array(
            "t_idtransaksi" => "t_idtransaksi", "t_nourut" => "t_nourut", "t_tgldendapembayaran" => "t_tgldendapembayaran", "t_jmlhbulandendapembayaran" => "t_jmlhbulandendapembayaran", "t_jmlhdendapembayaran" => "t_jmlhdendapembayaran"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_rekening"
                ), "a.t_idkorek = e.s_idkorek", array(
            "s_namakorek" => "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('is_deluserdendapembayaran');
        $where->notEqualTo('t_jmlhbulandendapembayaran', 0);
        $where->notEqualTo('t_jmlhdendapembayaran', 0);
        $where->isNotNull('t_tgldendapembayaran');
        $where->isNull('t_tglbayardenda');
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
                $select->order("t_tgldaftar desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_tgldaftar desc");
            }
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }


    public function getGridCountSudahDibayarkan(StpdpembayaranBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_wp"
        ));
        $select->join(array(
            "b" => "s_kecamatan"
                ), "a.t_kecamatan = b.s_idkec", array(
            "s_namakec" => "s_namakec"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_kelurahan"
                ), "a.t_kelurahan = c.s_idkel", array(
            "s_namakel" => "s_namakel"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_transaksi"
                ), "a.t_idwp = d.t_idwp", array(
            "t_idtransaksi" => "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_rekening"
                ), "a.t_idkorek = e.s_idkorek", array(
            "s_namakorek" => "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('is_deluserbayardenda');
        $where->notEqualTo('t_jmlhbayardenda', 0);
        $where->isNotNull('t_tglbayardenda');
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

    public function getGridDataSudahDibayarkan(StpdpembayaranBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_wp"
        ));
        $select->join(array(
            "b" => "s_kecamatan"
                ), "a.t_kecamatan = b.s_idkec", array(
            "s_namakec" => "s_namakec"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_kelurahan"
                ), "a.t_kelurahan = c.s_idkel", array(
            "s_namakel" => "s_namakel"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_transaksi"
                ), "a.t_idwp = d.t_idwp", array(
            "t_idtransaksi" => "t_idtransaksi", "t_nourut" => "t_nourut", "t_tglbayardenda" => "t_tglbayardenda", "t_jmlhbayardenda" => "t_jmlhbayardenda"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_rekening"
                ), "a.t_idkorek = e.s_idkorek", array(
            "s_namakorek" => "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('is_deluserbayardenda');
        $where->notEqualTo('t_jmlhbayardenda', 0);
        $where->isNotNull('t_tglbayardenda');
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
                $select->order("t_tgldaftar desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_tgldaftar desc");
            }
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function hapusPenetapanDenda($id, $session) {
        $data = array(
            'is_deluserdendapembayaran' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function hapusPembayaranDenda($id, $session) {
        $data = array(
            'is_deluserbayardenda' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function getDataPembayaran($tglbayar0, $tglbayar1, $t_kecamatan, $t_kelurahan, $t_idkorek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_wp'
        ));
        $select->join(array(
            "b" => "s_kecamatan"
                ), "a.t_kecamatan = b.s_idkec", array(
            "s_namakec" => "s_namakec"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_kelurahan"
                ), "a.t_kelurahan = c.s_idkel", array(
            "s_namakel" => "s_namakel"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_rekening"
                ), "a.t_idkorek = d.s_idkorek", array(
            "s_namakorek" => "s_namakorek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_transaksi"
                ), "a.t_idwp = e.t_idwp", array(
            "t_tglpembayaran" => "t_tglpembayaran", "t_jmlhpembayaran" => "t_jmlhpembayaran"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('d.is_deluserpembayaran');
        $where->between("e.t_tglpembayaran", date('Y-m-d', strtotime($tglbayar0)), date('Y-m-d', strtotime($tglbayar1)));
        $where->isNotNull('e.t_tglpembayaran');
        if (!empty($t_kecamatan)) {
            $where->equalTo("a.t_kecamatan", $t_kecamatan);
        }
        if (!empty($t_kelurahan)) {
            $where->equalTo("a.t_kelurahan", $t_kelurahan);
        }
        if (!empty($t_idkorek)) {
            $where->equalTo("a.t_idkorek", $t_idkorek);
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataStpdPembayaranID($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "s_kecamatan"
                ), "a.t_kecamatan = b.s_idkec", array(
            "s_namakec" => "s_namakec"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_kelurahan"
                ), "a.t_kelurahan = c.s_idkel", array(
            "s_namakel" => "s_namakel"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_rekening"
                ), "a.t_idkorek = d.s_idkorek", array(
            "s_namakorek" => "s_namakorek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_transaksi"
                ), "a.t_idwp = e.t_idwp", array(
            "t_idtransaksi" => "t_idtransaksi", "t_nourut" => "t_nourut", "t_jmlhpembayaran" => "t_jmlhpembayaran", " t_jmlhbulandendapembayaran" => "t_jmlhbulandendapembayaran", "t_tglbayardenda" => "t_tglbayardenda", "t_jmlhbayardenda" => "t_jmlhbayardenda"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('e.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPenetapanDenda($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_wp'
        ));
        $select->join(array(
            "b" => "s_kecamatan"
                ), "a.t_kecamatan = b.s_idkec", array(
            "s_namakec" => "s_namakec"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_kelurahan"
                ), "a.t_kelurahan = c.s_idkel", array(
            "s_namakel" => "s_namakel"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_rekening"
                ), "a.t_idkorek = d.s_idkorek", array(
            "s_namakorek" => "s_namakorek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_transaksi"
                ), "a.t_idwp = e.t_idwp", array(
            "t_jmlhpenetapan" => "t_jmlhpenetapan", "t_tglpenetapan" => "t_tglpenetapan",
            "t_jmlhpembayaran" => "t_jmlhpembayaran", "t_tglpembayaran" => "t_tglpembayaran",
            "t_jmlhdendapembayaran" => "t_jmlhdendapembayaran"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('e.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

}
