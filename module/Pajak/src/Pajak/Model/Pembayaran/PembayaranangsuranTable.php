<?php

namespace Pajak\Model\Pembayaran;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PembayaranangsuranTable extends AbstractTableGateway {

    protected $table = 't_angsuran';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PembayaranangsuranBase());
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

    public function maxNoAngsuran() {
        $sql = "select max(t_noangsuran) as t_noangsuran from t_angsuran";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function simpanpembayaranangsuran(PembayaranangsuranBase $base, $session, $post) {
        // var_dump($base->t_idangsuran); exit();
        $data = array(
            't_pokokpembayaranangsuran' => str_ireplace('.', '', $post['t_nominalangsuran']),
            't_bungapembayaranangsuran' => str_ireplace('.', '', $post['t_bungaangsuran']),
            't_totalpembayaranangsuran' => str_ireplace('.', '', $post['t_jmlhpembayaranangsuran']),
            't_tglpembayaranangsuran' => date('Y-m-d', strtotime($post['t_tglbayarangsuran'])),
            't_inputpembayaranangsuran' => $session['s_iduser']
        );
        $t_angsuran = new \Zend\Db\TableGateway\TableGateway('t_angsuran', $this->adapter);
        $t_angsuran->update($data, array('t_idangsuran' => $post['t_idangsuran']));
        return $data;
    }

    public function getGridCountPembayaranAngsuranBelum(\Pajak\Model\Pendataan\PendataanBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
		$select->from(array(
            "a" => "t_angsuran"
        ));
		$select->columns(array(
            "t_idangsuran", "t_nominalangsuran", "t_noangsuran", "t_angsuranke", "t_tglpembayaranangsuran", "t_jenisketetapan", "t_kodebayarangsuran"
        ));
		$select->join(array(
            "b" => "t_transaksi"
                ), "b.t_idtransaksi = a.t_idketetapan", array(
            "t_idtransaksi", "t_nourut", "t_nopembayaran", "t_tglpembayaran", "t_jmlhpembayaran", "t_dasarpengenaan", "t_jenispajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "c.t_idobjek = a.t_idwpobjek", array(
            "t_nop", "t_namaobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_wp"
                ), "d.t_idwp = c.t_idwp", array(
            "t_nama", "t_npwpd"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglketetapanangsuran is not null and a.t_tglpembayaranangsuran is null");
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

    public function getGridDataPembayaranAngsuranBelum(\Pajak\Model\Pendataan\PendataanBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
		$select->from(array(
            "a" => "t_angsuran"
        ));
		$select->columns(array(
            "t_idangsuran", "t_nominalangsuran", "t_noangsuran", "t_angsuranke", "t_tglpembayaranangsuran", "t_jenisketetapan", "t_kodebayarangsuran"
        ));
		$select->join(array(
            "b" => "t_transaksi"
                ), "b.t_idtransaksi = a.t_idketetapan", array(
            "t_idtransaksi", "t_nourut", "t_nopembayaran", "t_tglpembayaran", "t_jmlhpembayaran", "t_dasarpengenaan", "t_jenispajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "c.t_idobjek = a.t_idwpobjek", array(
            "t_nop", "t_namaobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_wp"
                ), "d.t_idwp = c.t_idwp", array(
            "t_nama", "t_npwpd"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglketetapanangsuran is not null and a.t_tglpembayaranangsuran is null");
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
                $select->order("t_idangsuran desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_idangsuran desc");
            }
        } else {
            $select->order("t_idangsuran desc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountPembayaranAngsuranSudah(\Pajak\Model\Pendataan\PendataanBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
		$select->from(array(
            "a" => "t_angsuran"
        ));
		$select->columns(array(
            "t_idangsuran", "t_nominalangsuran", "t_noangsuran", "t_angsuranke", "t_tglpembayaranangsuran", "t_jenisketetapan", "t_kodebayarangsuran"
        ));
		$select->join(array(
            "b" => "t_transaksi"
                ), "b.t_idtransaksi = a.t_idketetapan", array(
            "t_idtransaksi", "t_nourut", "t_nopembayaran", "t_tglpembayaran", "t_jmlhpembayaran", "t_dasarpengenaan", "t_jenispajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "c.t_idobjek = a.t_idwpobjek", array(
            "t_nop", "t_namaobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_wp"
                ), "d.t_idwp = c.t_idwp", array(
            "t_nama", "t_npwpd"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglketetapanangsuran is not null and a.t_tglpembayaranangsuran is not null");
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

    public function getGridDataPembayaranAngsuranSudah(\Pajak\Model\Pendataan\PendataanBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
		$select->from(array(
            "a" => "t_angsuran"
        ));
		$select->columns(array(
            "t_idangsuran", "t_nominalangsuran", "t_noangsuran", "t_angsuranke", "t_tglpembayaranangsuran", "t_jenisketetapan", "t_kodebayarangsuran", "t_totalpembayaranangsuran"
        ));
		$select->join(array(
            "b" => "t_transaksi"
                ), "b.t_idtransaksi = a.t_idketetapan", array(
            "t_idtransaksi", "t_nourut", "t_nopembayaran", "t_tglpembayaran", "t_jmlhpembayaran", "t_dasarpengenaan", "t_jenispajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "c.t_idobjek = a.t_idwpobjek", array(
            "t_nop", "t_namaobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_wp"
                ), "d.t_idwp = c.t_idwp", array(
            "t_nama", "t_npwpd"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglketetapanangsuran is not null and a.t_tglpembayaranangsuran is not null");
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
        } else {
            $select->order("t_nourut desc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function hapusAngsuran($id, $session) {
        $data = array(
            
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function getGridCountSkpd(AngsuranBase $base, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->columns(array(
            't_idtransaksi'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwpobjek = b.t_idobjek", array(
            "t_idobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_angsuran"
                ), "c.t_idketetapan = a.t_idtransaksi", array(
            "t_nominalangsuran"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglpembayaran is null and a.t_jenispajak in (4,8) and c.t_idangsuran is null");
        if ($parametercari->t_nop != '')
            $where->literal("t_nop LIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek LIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpdwp != '')
            $where->literal("t_npwpdwp LIKE '%$parametercari->t_npwpdwp%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp LIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_nopenetapan LIKE '%$parametercari->t_nopenetapan%'");

        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpd(AngsuranBase $base, $offset, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->columns(array(
            "t_idtransaksi", "t_nopenetapan", "t_jmlhpajak", 't_tglpenetapan'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "b.t_idobjek = a.t_idwpobjek", array(
            "t_nop", "t_namaobjek", "s_namajenis", 't_namawp', 't_npwpdwp'
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_angsuran"
                ), "c.t_idketetapan = a.t_idtransaksi", array(
            "t_nominalangsuran"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglpembayaran is null and a.t_jenispajak in (4,8) and c.t_idangsuran is null");
        if ($parametercari->t_nop != '')
            $where->literal("t_nop LIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek LIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpdwp != '')
            $where->literal("t_npwpdwp LIKE '%$parametercari->t_npwpdwp%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp LIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_nopenetapan LIKE '%$parametercari->t_nopenetapan%'");

        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSkpdkb(AngsuranBase $base, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdkb"
        ));
        $select->columns(array(
            't_idskpdkb'
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "b.t_idwpobjek = c.t_idobjek", array(
            "t_idobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_angsuran"
                ), "d.t_idketetapan = a.t_idskpdkb", array(
            "t_idangsuran"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkb is null and d.t_idangsuran is null");
        if ($parametercari->t_nop != '')
            $where->literal("t_nop LIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek LIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd LIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp LIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdkb LIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpdkb(AngsuranBase $base, $offset, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdkb"
        ));
        $select->columns(array(
            't_idtransaksi' => 't_idskpdkb', "t_nopenetapan" => "t_noskpdkb", "t_jmlhpajak" => "t_jmlhpajakskpdkb", "t_tglpenetapan" => "t_tglskpdkb"
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "b.t_idwpobjek = c.t_idobjek", array(
            't_namawp', 't_npwpdwp', "t_nop", "t_namaobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_angsuran"
                ), "d.t_idketetapan = a.t_idskpdkb", array(
            "t_idangsuran"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkb is null and d.t_idangsuran is null");

        if ($parametercari->t_nop != '')
            $where->literal("t_nop LIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek LIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd LIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp LIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdkb LIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSkpdkbt(AngsuranBase $base, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdkbt"
        ));
        $select->columns(array(
            't_idskpdkbt'
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "b.t_idwpobjek = c.t_idobjek", array(
            "t_idobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_angsuran"
                ), "d.t_idketetapan = a.t_idskpdkbt", array(
            "t_idangsuran"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkbt = null and d.t_idangsuran is null");
        if ($parametercari->t_nop != '')
            $where->literal("t_nop LIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek LIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd LIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp LIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdkbt LIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpdkbt(AngsuranBase $base, $offset, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdkbt"
        ));
        $select->columns(array(
            't_idtransaksi' => 't_idskpdkbt', "t_nopenetapan" => "t_noskpdkbt", "t_jmlhpajak" => "t_jmlhpajakskpdkbt"
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "b.t_idwpobjek = c.t_idobjek", array(
            't_namawp', 't_npwpdwp', "t_nop", "t_namaobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_angsuran"
                ), "d.t_idketetapan = a.t_idskpdkbt", array(
            "t_idangsuran"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkbt = null and d.t_idangsuran is null");

        if ($parametercari->t_nop != '')
            $where->literal("t_nop LIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek LIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd LIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp LIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdkbt LIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSkpdt(AngsuranBase $base, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdt"
        ));
        $select->columns(array(
            't_idskpdt'
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "b.t_idwpobjek = c.t_idobjek", array(
            "t_idobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_angsuran"
                ), "d.t_idketetapan = a.t_idskpdt", array(
            "t_idangsuran"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdt = null and d.t_idangsuran is null");
        if ($parametercari->t_nop != '')
            $where->literal("t_nop LIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek LIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd LIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp LIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdt LIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpdt(AngsuranBase $base, $offset, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdt"
        ));
        $select->columns(array(
            't_idtransaksi' => 't_idskpdt', "t_nopenetapan" => "t_noskpdt", "t_jmlhpajak" => "t_jmlhpajakskpdt"
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idtransaksi = b.t_idtransaksi", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "b.t_idwpobjek = c.t_idobjek", array(
            't_namawp', 't_npwpdwp', "t_nop", "t_namaobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_angsuran"
                ), "d.t_idketetapan = a.t_idskpdt", array(
            "t_idangsuran"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdt = null and d.t_idangsuran is null");

        if ($parametercari->t_nop != '')
            $where->literal("t_nop LIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek LIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd LIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp LIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdt LIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataKetetapanForAngsuran($t_idketetapan, $t_jenisketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $where = new Where();
        if ($t_jenisketetapan == 2) {
            $select->from(array(
                "a" => "t_transaksi"
            ));
            $select->columns(array(
                "t_idtransaksi", "t_nopenetapan", "t_jmlhpajak", 't_tglpenetapan', "t_tgljatuhtempo", "t_jenispajak"
            ));
            $select->join(array(
                "b" => "view_wpobjek"
                    ), "b.t_idobjek = a.t_idwpobjek", array(
                "t_nop", "t_namaobjek", "s_namajenis", 't_namawp', 't_npwpdwp', "t_alamatlengkapobjek", "t_alamat_lengkapwp"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "c" => "t_angsuran"
                    ), "c.t_idketetapan = a.t_idtransaksi", array(
                "t_nominalangsuran"
                    ), $select::JOIN_LEFT);
            $where->equalTo("a.t_idtransaksi", $t_idketetapan);
        } elseif ($t_jenisketetapan == 5) {
            $select->from(array(
                "a" => "t_skpdkb"
            ));
            $select->columns(array(
                't_idtransaksi' => 't_idskpdkb', "t_nopenetapan" => "t_noskpdkb", "t_jmlhpajak" => "t_jmlhpajakskpdkb", "t_tglpenetapan" => "t_tglskpdkb", "t_tgljatuhtempo" => "t_tgljatuhtemposkpdkb", "t_idskpdkb"
            ));
            $select->join(array(
                "b" => "t_transaksi"
                    ), "a.t_idtransaksi = b.t_idtransaksi", array(
                "t_idtransaksi", "t_jenispajak"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "c" => "view_wpobjek"
                    ), "b.t_idwpobjek = c.t_idobjek", array(
                't_namawp', 't_npwpdwp', "t_nop", "t_namaobjek", "t_alamat_lengkapwp", "t_alamatlengkapobjek"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "d" => "t_angsuran"
                    ), "d.t_idketetapan = a.t_idskpdkb", array(
                "t_idangsuran"
                    ), $select::JOIN_LEFT);
            $where->literal("b.t_idtransaksi=$t_idketetapan");
        } elseif ($t_jenisketetapan == 6) {
            $select->from(array(
                "a" => "t_skpdkbt"
            ));
            $select->columns(array(
                't_idtransaksi' => 't_idskpdkbt', "t_nopenetapan" => "t_noskpdkbt", "t_jmlhpajak" => "t_jmlhpajakskpdkbt", "t_tglpenetapan" => "t_tglskpdkbt", "t_tgljatuhtempo" => "t_tgljatuhtemposkpdkbt"
            ));
            $select->join(array(
                "b" => "t_transaksi"
                    ), "a.t_idtransaksi = b.t_idtransaksi", array(
                "t_idtransaksi"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "c" => "view_wpobjek"
                    ), "b.t_idwpobjek = c.t_idobjek", array(
                't_namawp', 't_npwpdwp', "t_nop", "t_namaobjek", "t_alamat_lengkapwp", "t_alamatlengkapobjek"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "d" => "t_angsuran"
                    ), "d.t_idketetapan = a.t_idskpdkbt", array(
                "t_idangsuran"
                    ), $select::JOIN_LEFT);
            $where->literal("a.t_tglbayarskpdkbt = null and d.t_idangsuran is null and a.t_idskpdkb=$t_idketetapan");
        } elseif ($t_jenisketetapan == 10) {
            $select->from(array(
                "a" => "t_skpdt"
            ));
            $select->columns(array(
                't_idtransaksi' => 't_idskpdt', "t_nopenetapan" => "t_noskpdt", "t_jmlhpajak" => "t_jmlhpajakskpdt", "t_tglpenetapan" => "t_tglskpdt", "t_tgljatuhtempo" => "t_tgljatuhtemposkpdt"
            ));
            $select->join(array(
                "b" => "t_transaksi"
                    ), "a.t_idtransaksi = b.t_idtransaksi", array(
                "t_idtransaksi", "t_tgljatuhtempo"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "c" => "view_wpobjek"
                    ), "b.t_idwpobjek = c.t_idobjek", array(
                't_namawp', 't_npwpdwp', "t_nop", "t_namaobjek", "t_alamat_lengkapwp", "t_alamatlengkapobjek"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "d" => "t_angsuran"
                    ), "d.t_idketetapan = a.t_idskpdt", array(
                "t_idangsuran"
                    ), $select::JOIN_LEFT);
            $where->literal("a.t_tglbayarskpdt = null and d.t_idangsuran is null and a.t_idskpdkb=$t_idketetapan");
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDatabyIDAngsuranSkpd($t_idangsuran, $t_jenisketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_angsuran"
        ));
        $select->columns(array(
            "t_nominalangsuran", "t_kodebayarangsuran", "t_jumlahkaliangsuran", "t_tglketetapanangsuran", "t_idketetapan", "t_angsuranke", "t_tgljadwalangsuran"
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idketetapan = b.t_idtransaksi", array(
            "t_idtransaksi", "t_jmlhpajak", "t_nopenetapan", "t_tglpenetapan", "t_tgljatuhtempo"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "b.t_idwpobjek = c.t_idobjek", array(
            "t_nop", "t_namaobjek", "t_alamatlengkapobjek",
            "t_npwpdwp", "t_namawp", "t_alamat_lengkapwp"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
                ), "d.s_idkorek = b.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_jenissurat"
                ), "e.s_idsurat = a.t_jenisketetapan", array(
            "s_namasingkatsurat"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idangsuran', $t_idangsuran);
        $where->equalTo('a.t_jenisketetapan', $t_jenisketetapan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDatabyIDAngsuranSkpdkb($t_idangsuran, $t_jenisketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        
        $select->from(array(
            "a" => "t_angsuran"
        ));
        $select->columns(array(
            "t_nominalangsuran", "t_kodebayarangsuran", "t_jumlahkaliangsuran", "t_tglketetapanangsuran", "t_idketetapan", "t_angsuranke"
        ));
        $select->join(array(
            "b" => "t_skpdkb"
                ), "b.t_idskpdkb = a.t_idketetapan", array(
            't_idtransaksi' => 't_idskpdkb', "t_nopenetapan" => "t_noskpdkb", "t_jmlhpajak" => "t_jmlhpajakskpdkb", "t_tglpenetapan" => "t_tglskpdkb", "t_tgljatuhtempo" => "t_tgljatuhtemposkpdkb", "t_idskpdkb"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "c.t_idtransaksi = b.t_idtransaksi", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_wpobjek"
                ), "c.t_idwpobjek = d.t_idobjek", array(
            "t_nop", "t_namaobjek", "t_alamatlengkapobjek",
            "t_npwpdwp", "t_namawp", "t_alamat_lengkapwp"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "view_rekening"
                ), "e.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "f" => "s_jenissurat"
                ), "f.s_idsurat = a.t_jenisketetapan", array(
            "s_namasingkatsurat"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idangsuran', $t_idangsuran);
        $where->equalTo('a.t_jenisketetapan', $t_jenisketetapan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDatabyIDAngsuran($t_idketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_angsuran"
        ));
        $select->columns(array(
            "t_idangsuran", "t_nominalangsuran", "t_kodebayarangsuran", "t_jumlahkaliangsuran", "t_tglketetapanangsuran", "t_idketetapan", "t_pokokpembayaranangsuran", "t_tgljadwalangsuran", "t_angsuranke"
        ));
        $select->order('t_idangsuran asc');
        $where = new Where();
        $where->equalTo('a.t_idketetapan', $t_idketetapan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

}
