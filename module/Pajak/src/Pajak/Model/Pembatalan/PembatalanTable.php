<?php

namespace Pajak\Model\Pembatalan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PembatalanTable extends AbstractTableGateway {

    protected $table = 't_pembatalan';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PembatalanBase());
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

    public function maxNoPembatalan() {
        $sql = "select max(t_nopembatalan) as t_nopembatalan from t_pembatalan";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function simpanpembatalan(PembatalanBase $base, $session) {
        $no = $this->maxNoPembatalan();
        $t_nopembatalan = (int) $no['t_nopembatalan'] + 1;
        $data = array(
            't_nopembatalan' => $t_nopembatalan,
            't_idketetapan' => $base->t_idketetapan,
            't_jenispajak' => $base->t_jenispajak,
            't_jenisketetapan' => $base->t_jenisketetapan,
            't_tglpembatalan' => date('Y-m-d h:i:s', strtotime($base->t_tglpembatalan . $base->t_jampembatalan)),
            't_disposisi' => $base->t_disposisi,
            't_petugaslapangan' => $base->t_petugaslapangan,
            't_alasan' => $base->t_alasan,
            't_operatorpembatalan' => $session['s_iduser'],
            't_tglinputpembatalan' => date('Y-m-d')
        );
        $t_pembatalan = new \Zend\Db\TableGateway\TableGateway('t_pembatalan', $this->adapter);
        $t_pembatalan->insert($data);
        return $data;
    }

    public function getGridCountKetetapanPembatalanSkpd(\Pajak\Model\Pendataan\PendataanBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array(
            't_nama'
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
            "d" => "t_pembatalan"
                ), "d.t_idketetapan = c.t_idtransaksi", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("d.t_jenisketetapan=2");
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

    public function getGridDataKetetapanPembatalanSkpd(\Pajak\Model\Pendataan\PendataanBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array(
            't_nama', 't_npwpd'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_nopembayaran", "t_tglpembayaran", "t_jmlhpembayaran", "t_dasarpengenaan", "t_jenispajak", "t_kodebayar"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_pembatalan"
                ), "d.t_idketetapan = c.t_idtransaksi", array(
            "t_idpembatalan", "t_nopembatalan", "t_jenisketetapan", "t_disposisi", "t_tglpembatalan", "t_petugaslapangan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("d.t_jenisketetapan=2");
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
                $select->order("t_idpembatalan desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_idpembatalan desc");
            }
        } else {
            $select->order("t_idpembatalan desc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountKetetapanPembatalanSkpdkb(\Pajak\Model\Pendataan\PendataanBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array(
            't_nama'
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
                ), "d.t_idtransaksi = c.t_idtransaksi", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_pembatalan"
                ), "e.t_idketetapan = d.t_idskpdkb", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglinputpembatalan is not null and e.t_jenisketetapan=5");
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

    public function getGridDataKetetapanPembatalanSkpdkb(\Pajak\Model\Pendataan\PendataanBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array(
            't_nama', 't_npwpd'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_masaawal", "t_masaakhir", "t_nourut", "t_nopembayaran", "t_tglpembayaran", "t_jmlhpembayaran", "t_dasarpengenaan", "t_jenispajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdkb"
                ), "d.t_idtransaksi = c.t_idtransaksi", array(
            "t_idtransaksi", "t_kodebayarskpdkb"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_pembatalan"
                ), "e.t_idketetapan = d.t_idskpdkb", array(
            "t_idpembatalan", "t_nopembatalan", "t_jenisketetapan", "t_disposisi", "t_tglpembatalan", "t_petugaslapangan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglinputpembatalan is not null and e.t_jenisketetapan=5");
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

    public function getGridCountKetetapanPembatalanSkpdkbt(\Pajak\Model\Pendataan\PendataanBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array(
            't_nama'
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
                ), "d.t_idtransaksi = c.t_idtransaksi", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_pembatalan"
                ), "e.t_idketetapan = d.t_idskpdkbt", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglinputpembatalan is not null");
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

    public function getGridDataKetetapanPembatalanSkpdkbt(\Pajak\Model\Pendataan\PendataanBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array(
            't_nama', 't_npwpd'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_masaawal", "t_masaakhir", "t_nourut", "t_nopembayaran", "t_tglpembayaran", "t_jmlhpembayaran", "t_dasarpengenaan", "t_jenispajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdkbt"
                ), "d.t_idtransaksi = c.t_idtransaksi", array(
            "t_idtransaksi", "t_kodebayarskpdkbt"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_pembatalan"
                ), "e.t_idketetapan = d.t_idskpdkbt", array(
            "t_idpembatalan", "t_nopembatalan", "t_jenisketetapan", "t_disposisi", "t_tglpembatalan", "t_petugaslapangan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglinputpembatalan is not null");
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

    public function getGridCountKetetapanPembatalanSkpdt(\Pajak\Model\Pendataan\PendataanBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array(
            't_nama'
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
            "d" => "t_skpdt"
                ), "d.t_idtransaksi = c.t_idtransaksi", array(
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_pembatalan"
                ), "e.t_idketetapan = d.t_idskpdt", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglinputpembatalan is not null");
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

    public function getGridDataKetetapanPembatalanSkpdt(\Pajak\Model\Pendataan\PendataanBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array(
            't_nama', 't_npwpd'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_masaawal", "t_masaakhir", "t_nourut", "t_nopembayaran", "t_tglpembayaran", "t_jmlhpembayaran", "t_dasarpengenaan", "t_jenispajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdt"
                ), "d.t_idtransaksi = c.t_idtransaksi", array(
            "t_idtransaksi", "t_kodebayarskpdt"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_pembatalan"
                ), "e.t_idketetapan = d.t_idskpdt", array(
            "t_idpembatalan", "t_nopembatalan", "t_jenisketetapan", "t_disposisi", "t_tglpembatalan", "t_petugaslapangan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglinputpembatalan is not null");
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

    public function hapusPembatalan($id, $session) {
        $data = array(
            
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function getGridCountSkpd(PembatalanBase $base, $parametercari) {
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
            "c" => "t_pembatalan"
                ), "c.t_idketetapan = a.t_idtransaksi", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglpembayaran is null and a.t_jenispajak in (4,8) and c.t_idpembatalan is null");
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

    public function getGridDataSkpd(PembatalanBase $base, $offset, $parametercari) {
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
            "c" => "t_pembatalan"
                ), "c.t_idketetapan = a.t_idtransaksi", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglpembayaran is null and a.t_jenispajak in (4,8) and c.t_idpembatalan is null");
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

    public function getGridCountSkpdkb(PembatalanBase $base, $parametercari) {
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
            "d" => "t_pembatalan"
                ), "d.t_idketetapan = a.t_idskpdkb", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkb is null and d.t_idpembatalan is null");
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

    public function getGridDataSkpdkb(PembatalanBase $base, $offset, $parametercari) {
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
            "d" => "t_pembatalan"
                ), "d.t_idketetapan = a.t_idskpdkb", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkb is null and d.t_idpembatalan is null");

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

    public function getGridCountSkpdkbt(PembatalanBase $base, $parametercari) {
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
            "d" => "t_pembatalan"
                ), "d.t_idketetapan = a.t_idskpdkbt", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkbt = null and d.t_idpembatalan is null");
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

    public function getGridDataSkpdkbt(PembatalanBase $base, $offset, $parametercari) {
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
            "d" => "t_pembatalan"
                ), "d.t_idketetapan = a.t_idskpdkbt", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkbt = null and d.t_idpembatalan is null");

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

    public function getGridCountSkpdt(PembatalanBase $base, $parametercari) {
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
            "d" => "t_pembatalan"
                ), "d.t_idketetapan = a.t_idskpdt", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdt = null and d.t_idpembatalan is null");
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

    public function getGridDataSkpdt(PembatalanBase $base, $offset, $parametercari) {
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
            "d" => "t_pembatalan"
                ), "d.t_idketetapan = a.t_idskpdt", array(
            "t_idpembatalan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdt = null and d.t_idpembatalan is null");

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

    public function getDataKetetapanForPembatalan($t_kodebayar) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $where = new Where();
        $t_jenisketetapan = substr($t_kodebayar, 4, 2);
        if ($t_jenisketetapan == '02') {
            $select->from(array(
                "a" => "t_transaksi"
            ));
            $select->columns(array(
                "t_idtransaksi", "t_nopenetapan", "t_jmlhpajak", 't_tglpenetapan', "t_tgljatuhtempo", "t_jenispajak", "t_tglpembayaran"
            ));
            $select->join(array(
                "b" => "view_wpobjek"
                    ), "b.t_idobjek = a.t_idwpobjek", array(
                "t_nop", "t_namaobjek", "s_namajenis", 't_namawp', 't_npwpdwp', "t_alamatlengkapobjek", "t_alamat_lengkapwp"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "c" => "t_pembatalan"
                    ), "c.t_idketetapan = a.t_idtransaksi", array(
                "t_idpembatalan"
                    ), $select::JOIN_LEFT);
            $where->literal("a.t_kodebayar='" . $t_kodebayar . "' and a.t_jenispajak in (4,8)");
        } elseif ($t_jenisketetapan == '05') {
            $select->from(array(
                "a" => "t_skpdkb"
            ));
            $select->columns(array(
                't_idtransaksi' => 't_idskpdkb', "t_nopenetapan" => "t_noskpdkb", "t_jmlhpajak" => "t_jmlhpajakskpdkb", "t_tglpenetapan" => "t_tglskpdkb", "t_tgljatuhtempo" => "t_tgljatuhtemposkpdkb", "t_idskpdkb", "t_tglpembayaran" => "t_tglbayarskpdkb"
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
                "d" => "t_pembatalan"
                    ), "d.t_idketetapan = a.t_idskpdkb", array(
                "t_idpembatalan"
                    ), $select::JOIN_LEFT);
            $where->literal("a.t_kodebayarskpdkb='" . $t_kodebayar . "'");
        } elseif ($t_jenisketetapan == '06') {
            $select->from(array(
                "a" => "t_skpdkbt"
            ));
            $select->columns(array(
                't_idtransaksi' => 't_idskpdkbt', "t_nopenetapan" => "t_noskpdkbt", "t_jmlhpajak" => "t_jmlhpajakskpdkbt", "t_tglpenetapan" => "t_tglskpdkbt", "t_tgljatuhtempo" => "t_tgljatuhtemposkpdkbt", "t_tglpembayaran" => "t_tglbayarskpdkbt"
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
                "d" => "t_pembatalan"
                    ), "d.t_idketetapan = a.t_idskpdkbt", array(
                "t_idpembatalan"
                    ), $select::JOIN_LEFT);
            $where->literal("a.t_kodebayarskpdkbt='" . $t_kodebayar . "'");
        } elseif ($t_jenisketetapan == '10') {
            $select->from(array(
                "a" => "t_skpdt"
            ));
            $select->columns(array(
                't_idtransaksi' => 't_idskpdt', "t_nopenetapan" => "t_noskpdt", "t_jmlhpajak" => "t_jmlhpajakskpdt", "t_tglpenetapan" => "t_tglskpdt", "t_tgljatuhtempo" => "t_tgljatuhtemposkpdt", "t_tglpembayaran" => "t_tglbayarskpdt"
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
                "d" => "t_pembatalan"
                    ), "d.t_idketetapan = a.t_idskpdt", array(
                "t_idpembatalan"
                    ), $select::JOIN_LEFT);
            $where->literal("a.t_kodebayarskpdt='" . $t_kodebayar . "'");
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDatabyIDPembatalanSkpd($t_idpembatalan, $t_jenisketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_pembatalan"
        ));
        $select->columns(array(
            "t_idpembatalan", "t_kodebayarpembatalan", "t_jumlahkalipembatalan", "t_tglinputpembatalan", "t_idketetapan"
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
        $where->equalTo('a.t_idpembatalan', $t_idpembatalan);
        $where->equalTo('a.t_jenisketetapan', $t_jenisketetapan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDatabyIDPembatalanSkpdkb($t_idpembatalan, $t_jenisketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();

        $select->from(array(
            "a" => "t_pembatalan"
        ));
        $select->columns(array(
            "t_idpembatalan", "t_kodebayarpembatalan", "t_jumlahkalipembatalan", "t_tglinputpembatalan", "t_idketetapan"
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
        $where->equalTo('a.t_idpembatalan', $t_idpembatalan);
        $where->equalTo('a.t_jenisketetapan', $t_jenisketetapan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDatabyIDPembatalan($t_idketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_pembatalan"
        ));
        $select->columns(array(
            "t_idpembatalan", "t_idpembatalan", "t_kodebayarpembatalan", "t_jumlahkalipembatalan", "t_tglinputpembatalan", "t_idketetapan", "t_pokokpembayaranpembatalan", "t_tgljadwalpembatalan", "t_pembatalanke"
        ));
        $select->order('t_idpembatalan asc');
        $where = new Where();
        $where->equalTo('a.t_idketetapan', $t_idketetapan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getcomboDisposisi() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_pejabat');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_namapej'] . " || " . $row['s_jabatanpej']] = $row['s_namapej'] . " || " . $row['s_jabatanpej'];
        }
        return $selectData;
    }

    public function getcomboLapangan() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_pejabat');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_namapej'] . " || " . $row['s_jabatanpej']] = $row['s_namapej'] . " || " . $row['s_jabatanpej'];
        }
        return $selectData;
    }

}
