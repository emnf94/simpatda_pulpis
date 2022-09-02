<?php

namespace Pajak\Model\Penagihan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PenagihanTable extends AbstractTableGateway
{

    protected $table = 't_transaksi';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PenagihanBase());
        $this->initialize();
    }

    public function getGridCountBelum(\Pajak\Model\Pendataan\PendataanBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->NotEqualTo('c.t_jmlhpajak', 0);
        $where->isNull('c.t_tglpembayaran');
        //        $where->literal("c.t_tgljatuhtempo between '" . date('Y-m-15') . "' and '" . date('Y-m-19') . "'");
        $where->literal("now() between (c.t_tgljatuhtempo - interval '15 day') and (c.t_tgljatuhtempo - interval '1 day')");
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

    public function getGridDataBelum(\Pajak\Model\Pendataan\PendataanBase $base, $offset)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "*"
        ), $select::JOIN_LEFT);
        $where = new Where();
        // $where->equalTo('c.t_jmlhpembayaran', 0);
        $where->NotEqualTo('c.t_jmlhpajak', 0);
        $where->isNull('c.t_tglpembayaran');
        // $where->literal('C.t_tgljatuhtempo >= now() and  C.t_tgljatuhtempo <= C.t_tgljatuhtempo - interval 15 day)';
        $where->literal("now() between (c.t_tgljatuhtempo - interval '15 day') and (c.t_tgljatuhtempo - interval '1 day')");
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

    public function getGridCountSudah(PenagihanBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop" => "t_nop"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi"
        ), $select::JOIN_LEFT);
        $where = new Where();
        //        $where->equalTo('c.t_jmlhpembayaran', 0);
        //        $where->isNotNull('c.t_tglpembayaran');
        $where->literal("c.t_tgljatuhtempo < '" . date('Y-m-d') . "'");
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

    public function getGridDataSudah(PenagihanBase $base, $offset)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi",
            "t_nourut",
            "t_tglpendataan",
            "t_tgljatuhtempo",
            "t_masaawal",
            "t_masaakhir",
            "t_jmlhpajak",
            "t_jmlhpembayaran",
            "t_jmlhdendapembayaran",
            "t_jmlhbulandendapembayaran",
            "t_tglpembayaran",
            "t_tglbayardenda",
            "t_jmlhbayardenda",
        ), $select::JOIN_LEFT);
        $where = new Where();
        //        $where->equalTo('c.t_jmlhpembayaran', 0);
        //        $where->isNotNull('c.t_tglpembayaran');
        $where->literal("c.t_tgljatuhtempo < '" . date('Y-m-d') . "'");
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
        $select->limit((int) $base->rows);
        $select->offset((int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountStpd(PenagihanBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop" => "t_nop"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi"
        ), $select::JOIN_LEFT);
        $where = new Where();
        //        $where->equalTo('c.t_jmlhpembayaran', 0);
        $where->isNotNull('c.t_tglpembayaran');
        $where->isNull('c.t_tglbayardenda');
        $where->literal("c.t_tgljatuhtempo < '" . date('Y-m-d') . "'");
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

    public function getGridDataStpd(PenagihanBase $base, $offset)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_tgljatuhtempo", "t_masaawal", "t_masaakhir", "t_jmlhpajak", "t_jmlhpembayaran"
        ), $select::JOIN_LEFT);
        $where = new Where();
        //        $where->equalTo('c.t_jmlhpembayaran', 0);
        $where->isNotNull('c.t_tglpembayaran');
        $where->isNull('c.t_tglbayardenda');
        $where->literal("c.t_tgljatuhtempo < '" . date('Y-m-d') . "'");
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
        $select->limit((int) $base->rows);
        $select->offset((int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    //============================= surat teguran
    public function getGridCountSuratTeguran(PenagihanBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "v_surat_teguran"
        ));
        /* $select->join(array(
          "b" => "view_wpobjek_v2"
          ), "a.t_idwp = b.t_idwp", array(
          "t_nop" => "t_nop"
          ), $select::JOIN_LEFT);
          $select->join(array(
          "c" => "t_transaksi"
          ), "b.t_idobjek = c.t_idwpobjek", array(
          "t_idtransaksi"
          ), $select::JOIN_LEFT); */
        $where = new Where();
        $where->literal("hari_lebih_tempo >= 14");

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

    public function getGridDataSuratTeguran(PenagihanBase $base, $offset)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "v_surat_teguran"
        ));
        /* $select->join(array(
          "b" => "view_wpobjek_v2"
          ), "a.t_idwp = b.t_idwp", array(
          "t_nop", "t_namaobjek", "t_alamatobjek",
          "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek"
          ), $select::JOIN_LEFT);
          $select->join(array(
          "c" => "t_transaksi"
          ), "b.t_idobjek = c.t_idwpobjek", array(
          "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_tgljatuhtempo", "t_masaawal", "t_masaakhir", "t_jmlhpajak"
          ), $select::JOIN_LEFT); */
        $where = new Where();
        //$where->equalTo('c.t_jmlhpembayaran', 0);




        $where->literal("hari_lebih_tempo >= 14");

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

    //============================= end surat teguran

    public function getDataPenagihanID($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_jenispajak", "t_tglpendataan", "t_jmlhpajak", "t_nourut", "t_tgljatuhtempo", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_kodebayar", "t_jmlhdendapembayaran", "t_jmlhbulandendapembayaran", "t_jmlhpembayaran", "t_nostpd", "t_nopenetapan", "t_tglpenetapan", "t_noskpdjab"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataPiutang($periodepiutang, $t_kecamatan, $t_kelurahan, $jenisobj)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jmlhpembayaran", "t_tgljatuhtempo", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "s_namakorek", "korek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo("c.t_periodepajak", $periodepiutang);
        $where->isNull("c.t_tglpembayaran");
        $where->notEqualTo("c.t_jmlhpajak", 0);
        if (!empty($t_kecamatan)) {
            $where->equalTo("b.t_kecamatanobjek", $t_kecamatan);
        }
        if (!empty($t_kelurahan)) {
            $where->equalTo("b.t_kelurahanobjek", $t_kelurahan);
        }
        if ($jenisobj != null) {
            $where->literal("b.t_jenisobjek in (" . $jenisobj . ")");
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataPiutangFormat($periode, $masaawal, $masaakhir, $t_kecamatan, $t_kelurahan, $jenisobj, $korek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_tglpendataan", "t_tglpenetapan", "t_nourut", "t_nopenetapan", "t_jmlhpajak", "t_noskpdjab",
            "t_nopembayaran", "t_tglpembayaran", "t_jmlhpembayaran", "t_tgljatuhtempo", "t_masaawal",
            "t_masaakhir", "is_esptpd"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "s_namakorek", "korek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo("c.t_periodepajak", $periode);
        //        $where->literal("extract(month from c.t_masaawal) = '" . $masaawal . "' and extract(year from c.t_masaawal) = '" . $periode . "' ");
        $where->between("c.t_masaawal", date('Y-m-d', strtotime($masaawal)), date('Y-m-d', strtotime($masaakhir)));
        //        $where->isNull("c.t_tglpembayaran");
        $where->notEqualTo("c.t_jmlhpajak", 0);
        if (!empty($t_kecamatan)) {
            $where->equalTo("b.t_kecamatanobjek", $t_kecamatan);
        }
        if (!empty($t_kelurahan)) {
            $where->equalTo("b.t_kelurahanobjek", $t_kelurahan);
        }
        if ($jenisobj != null) {
            $where->literal("b.t_jenisobjek in (" . $jenisobj . ")");
        }
        if ($korek != null) {
            $where->literal("c.t_idkorek = " . $korek . " ");
        }
        $select->where($where);
        $select->order("t_npwpd asc");
        $select->order("t_namaobjek asc");
        $select->order("t_masaawal asc");
        $select->order("t_masaakhir asc");
        //NPWPD, Nama Objek, Masa Pajak
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataPiutangSemuaperiode($periodepiutang, $t_kecamatan, $t_kelurahan, $jenisobj)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jmlhpembayaran", "t_tgljatuhtempo", "t_masaawal", "t_masaakhir", "t_periodepajak",
            "t_jenispajak", "t_nourut", "t_idkorek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "s_namakorek", "korek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        // $where->equalTo("c.t_periodepajak", $periodepiutang);
        $where->literal("c.t_periodepajak <= '" . $periodepiutang . "'");
        $where->isNull("c.t_tglpembayaran");
        if (!empty($t_kecamatan)) {
            $where->equalTo("b.t_kecamatanobjek", $t_kecamatan);
        }
        if (!empty($t_kelurahan)) {
            $where->equalTo("b.t_kelurahanobjek", $t_kelurahan);
        }
        if ($jenisobj != null) {
            $where->literal("b.t_jenisobjek in (" . $jenisobj . ")");
        }
        $select->where($where);
        $select->order('c.t_periodepajak asc');
        $state = $sql->prepareStatementForSqlObject($select);

        $res = $state->execute();

        return $res;
    }

    public function getDataTunggakan($tgljatuhtempo0, $tgljatuhtempo1, $t_kecamatan, $t_kelurahan, $jenisobj)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "*"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jmlhpembayaran", "t_tgljatuhtempo"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "s_namakorek", "korek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->between("c.t_tgljatuhtempo", date('Y-m-d', strtotime($tgljatuhtempo0)), date('Y-m-d', strtotime($tgljatuhtempo1)));
        $where->isNull('c.t_tglpembayaran');
        if (!empty($t_kecamatan)) {
            $where->equalTo("b.t_kecamatanobjek", $t_kecamatan);
        }
        if (!empty($t_kelurahan)) {
            $where->equalTo("b.t_kelurahanobjek", $t_kelurahan);
        }
        if ($jenisobj != null) {
            $where->literal("b.t_jenisobjek in (" . $jenisobj . ")");
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataRekapMutasiPiutang($tglcetak)
    {
        $tahun = date('Y', strtotime($tglcetak));
        $sql = "SELECT 
        aa.s_namajenis,
        (
            SELECT coalesce(sum(bb.t_jmlhpajak), 0) FROM t_transaksi bb WHERE
             bb.t_jenispajak = aa.s_idjenis 
                AND bb.t_tglpembayaran IS NULL 
                AND bb.t_periodepajak < '$tahun'
        ) as saldo_awal,
        (
            SELECT coalesce(sum(bb.t_jmlhpajak), 0) FROM t_transaksi bb WHERE
             bb.t_jenispajak = aa.s_idjenis 
                AND extract(YEAR from bb.t_tglpendataan) = '$tahun'
        ) as ketetapan  ,
        (
            SELECT coalesce(sum(bb.t_jmlhpembayaran), 0) FROM t_transaksi bb WHERE
             bb.t_jenispajak = aa.s_idjenis 
                AND bb.t_tglpembayaran IS NOT NULL 
                AND extract(YEAR from bb.t_tglpembayaran) = '$tahun'
        ) as setoran
        
        FROM s_jenisobjek aa order by aa.s_idjenis ASC";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getDataMutasiPiutang($jenisobj, $tglcetak)
    {
        $tahun = date('Y', strtotime($tglcetak));
        if (!empty($jenisobj)) {
            $jenis_objek = "aa.s_jenisobjek=" . $jenisobj . " AND";
        } else {
            $jenis_objek = "";
        }
        $sql = "SELECT 
        aa.korek,
        aa.s_namakorek,
        (
            SELECT coalesce(sum(bb.t_jmlhpajak), 0) FROM t_transaksi bb WHERE
             bb.t_idkorek = aa.s_idkorek 
                AND bb.t_tglpembayaran IS NULL 
                AND bb.t_periodepajak < '$tahun'
        ) as saldo_awal,
        (
            SELECT coalesce(sum(bb.t_jmlhpajak), 0) FROM t_transaksi bb WHERE
             bb.t_idkorek = aa.s_idkorek 
                AND extract(YEAR from bb.t_tglpendataan) = '$tahun'
        ) as ketetapan  ,
        (
            SELECT coalesce(sum(bb.t_jmlhpembayaran), 0) FROM t_transaksi bb WHERE
             bb.t_idkorek = aa.s_idkorek 
                AND bb.t_tglpembayaran IS NOT NULL 
                AND extract(YEAR from bb.t_tglpembayaran) = '$tahun'
        ) as setoran
        
        FROM view_rekening aa
        
        WHERE $jenis_objek aa.s_jeniskorek='1' AND aa.s_rinciankorek != '00' AND aa.s_sub1korek != '' 
            order by aa.s_jeniskorek, aa.s_rinciankorek ASC";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getDataDaftarSaldoawalPiutang($jenispajak, $tglcetak)
    {
        $periodepajak = date('Y', strtotime($tglcetak));
        if (!empty($jenispajak)) {
            $where_pajak = "AND aa.t_jenispajak = $jenispajak";
        } else {
            $where_pajak = "";
        }
        $sql = "SELECT * FROM t_transaksi aa
            LEFT JOIN view_wpobjek bb ON aa.t_idwpobjek = bb.t_idobjek 
            LEFT JOIN view_rekening cc ON aa.t_idkorek = cc.s_idkorek
            WHERE aa.t_tglpembayaran is null AND aa.t_periodepajak < '" . $periodepajak . "' $where_pajak
            order by bb.t_idwp asc";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getDataDaftarSaldoakhirPiutang($jenispajak, $tglcetak)
    {
        $periodepajak = date('Y', strtotime($tglcetak));
        if (!empty($jenispajak)) {
            $where_pajak = "AND aa.t_jenispajak = $jenispajak";
        } else {
            $where_pajak = "";
        }
        $sql = "SELECT * FROM t_transaksi aa
            LEFT JOIN view_wpobjek bb ON aa.t_idwpobjek = bb.t_idobjek 
            LEFT JOIN view_rekening cc ON aa.t_idkorek = cc.s_idkorek
            WHERE aa.t_tglpembayaran is null AND extract(YEAR from aa.t_tglpendataan) <= '" . $periodepajak . "' $where_pajak
            order by bb.t_idwp asc";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getDataDaftarKetetapanPiutang($jenispajak, $tglcetak)
    {
        $periodepajak = date('Y', strtotime($tglcetak));
        if (!empty($jenispajak)) {
            $where_pajak = "AND aa.t_jenispajak = $jenispajak";
        } else {
            $where_pajak = "";
        }
        $sql = "SELECT * FROM t_transaksi aa
            LEFT JOIN view_wpobjek bb ON aa.t_idwpobjek = bb.t_idobjek 
            LEFT JOIN view_rekening cc ON aa.t_idkorek = cc.s_idkorek
            WHERE extract(YEAR from aa.t_tglpendataan) = '" . $periodepajak . "' $where_pajak
            order by bb.t_idwp asc";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getDataRegisterPiutang($jenispajakregister, $perioderegister, $masaawalregister, $cetakan)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjekpj", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jmlhpembayaran", "t_tgljatuhtempo", "t_masaawal", "t_masaakhir", "t_periodepajak",
            "t_jenispajak", "t_nourut", "t_jmlhdendapembayaran", "t_nopembayaran"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "s_namakorek", "korek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        if ($cetakan == 1) {
            $where->isNull("c.t_tglpembayaran");
        }
        $where->literal("extract(month from c.t_tglpendataan) = '" . $masaawalregister . "'");
        $where->literal("extract(year from c.t_tglpendataan) = '" . $perioderegister . "'");
        if ($jenispajakregister != null) {
            $where->literal("c.t_jenispajak = " . $jenispajakregister . " ");
        }
        $select->where($where);
        $select->order('c.t_tglpendataan asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataMutasiPiutang__($jenisobj, $tglcetak)
    {
        $tglawal = date('Y-11-30', strtotime($tglcetak));
        $tglakhir = date('Y-11-30', strtotime($tglcetak));
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_rekening");
        $select->columns(array(
            "s_tipekorek",
            "s_kelompokkorek",
            "s_jeniskorek",
            "s_objekkorek",
            "s_rinciankorek",
            "s_sub1korek",
            "s_sub2korek",
            "s_sub3korek",
            "korek" => new \Zend\Db\Sql\Expression("(CASE WHEN " .
                "s_kelompokkorek = '0' THEN s_tipekorek " .
                "WHEN s_jeniskorek = '0' THEN s_tipekorek || '.' || s_kelompokkorek " .
                "WHEN s_objekkorek = '0' THEN s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek " .
                "WHEN s_rinciankorek = '0' THEN s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek || '.' || s_objekkorek " .
                "WHEN s_sub1korek = '' THEN " .
                "s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek || '.' || s_objekkorek || '.' || s_rinciankorek " .
                "WHEN s_sub2korek = '' THEN " .
                "s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek || '.' || s_objekkorek || '.' || s_rinciankorek || '.' || s_sub1korek " .
                "WHEN s_sub3korek = '0' THEN " .
                "s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek || '.' || s_objekkorek || '.' || s_rinciankorek || '.' || s_sub1korek || '.' || s_sub2korek " .
                "ELSE " .
                "s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek || '.' || s_objekkorek || '.' || s_rinciankorek || '.' || s_sub1korek || '.' || s_sub2korek || '.' || s_sub3korek " .
                "END )"),
            "s_namakorek",
            "transaksi_saldoawal" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                "case when s_rekening.s_jeniskorek != '0' THEN " .
                "case when s_rekening.s_objekkorek != '0' THEN " .
                "case when s_rekening.s_rinciankorek != '00' THEN " .
                "case when s_rekening.s_sub1korek != '' THEN " .
                "case when s_rekening.s_sub2korek != '0' THEN " .
                "case when s_rekening.s_sub3korek != '0' THEN " .
                "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                "AND aa.t_jenispajak != 5 AND aa.t_jenispajak != 6 AND aa.t_jenispajak != 7 " .
                ") " .
                "ELSE " .
                "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                "AND aa.t_jenispajak != 5 AND aa.t_jenispajak != 6 AND aa.t_jenispajak != 7 " .
                ") " .
                "END " .
                "ELSE " .
                "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                "AND aa.t_jenispajak != 5 AND aa.t_jenispajak != 6 AND aa.t_jenispajak != 7 " .
                ") " .
                "END " .
                "ELSE " .
                "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                "AND aa.t_jenispajak != 5 AND aa.t_jenispajak != 6 AND aa.t_jenispajak != 7 " .
                ") " .
                "END " .
                "ELSE " .
                "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                "AND aa.t_jenispajak != 5 AND aa.t_jenispajak != 6 AND aa.t_jenispajak != 7 " .
                ") " .
                "END " .
                "ELSE " .
                "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                "AND aa.t_jenispajak != 5 AND aa.t_jenispajak != 6 AND aa.t_jenispajak != 7 " .
                ") " .
                "END " .
                "ELSE " .
                "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                "AND aa.t_jenispajak != 5 AND aa.t_jenispajak != 6 AND aa.t_jenispajak != 7 " .
                ") " .
                "END " .
                "ELSE " .
                "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                "AND aa.t_jenispajak != 5 AND aa.t_jenispajak != 6 AND aa.t_jenispajak != 7 " .
                ") " .
                "END )"),

        ));
        $where = new Where();
        $select->where($where);
        $select->order(new \Zend\Db\Sql\Expression("s_rekening.s_tipekorek, " .
            "s_rekening.s_kelompokkorek, " . "s_rekening.s_jeniskorek, " . "s_rekening.s_objekkorek, " .
            "s_rekening.s_rinciankorek, " . "s_rekening.s_sub1korek"));
        //        echo $select->getSqlString();exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
}
