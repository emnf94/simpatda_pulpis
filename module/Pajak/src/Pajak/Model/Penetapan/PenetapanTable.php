<?php

namespace Pajak\Model\Penetapan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PenetapanTable extends AbstractTableGateway
{

    protected $table = 't_transaksi';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PenetapanBase());
        $this->initialize();
    }

    public function getPenetapanId($t_idtransaksi)
    {
        $rowset = $this->select(array('t_idtransaksi' => $t_idtransaksi));
        $row = $rowset->current();
        return $row;
    }

    public function simpanpenetapan(PenetapanBase $base, $session, $t_jenisobjekpajak)
    {
        $t_tgljatuhtempo = $this->geTglJatuhTempo($t_jenisobjekpajak);
        $t_tgljatuhtempofix = date('Y-m-d', strtotime("+" . $t_tgljatuhtempo['t_jmlharitempo'] . " days" . $base->t_tglpenetapan));
        $data = array(
            't_tglpenetapan' => date('Y-m-d', strtotime($base->t_tglpenetapan)),
            't_tgljatuhtempo' => $t_tgljatuhtempofix,
            't_operatorpenetapan' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $base->t_idtransaksi));
        return $data;
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
            "t_nop" => "t_nop", "t_namaobjek" => "t_namaobjek", "t_alamatobjek" => "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek" => "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi" => "t_idtransaksi"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek not in (1,2,3,5,6,7,9) and c.t_tglpendataan is not null');

        $where->isNull('c.t_tglpenetapan');
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
            "t_nop" => "t_nop", "t_namaobjek" => "t_namaobjek", "t_alamatobjek" => "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek" => "t_kabupatenobjek", "t_jenisobjek" => "t_jenisobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi" => "t_idtransaksi", "t_nourut" => "t_nourut", "t_tglpendataan" => "t_tglpendataan", "t_jmlhpajak" => "t_jmlhpajak"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek not in (1,2,3,5,6,7,9) and c.t_tglpendataan is not null');
        $where->isNull('c.t_tglpenetapan');
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

    public function getGridCountSudah(PenetapanBase $base, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop" => "t_nop", "t_namaobjek" => "t_namaobjek", "t_alamatobjek" => "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek" => "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi" => "t_idtransaksi"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek in (4,8)');
        $where->isNotNull('c.t_tglpenetapan');
        if ($post->t_tglpenetapan != '') {
            $t_tgl = explode(' - ', $post->t_tglpenetapan);
            $where->literal("c.t_tglpenetapan between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("a.t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("a.t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_niop != '')
            $where->literal("b.t_nop ILIKE '%$post->t_niop%'");
        if ($post->t_namaobjek != '')
            $where->literal("b.t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_jenispajak != '')
            $where->literal("b.s_namajenis ILIKE '%$post->t_jenispajak%'");
        if ($post->t_nopenetapan != '')
            $where->literal("c.t_nopenetapan = $post->t_nopenetapan or c.t_nourut = $post->t_nopenetapan");
        $select->where($where);
        $select->order("c.t_tglpenetapan desc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSudah(PenetapanBase $base, $offset, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "*"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_users"
        ), "c.t_operatorpenetapan = d.s_iduser", array(
            "s_nama"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek in (4,8)');
        $where->isNotNull('c.t_tglpenetapan');
        if ($post->t_tglpenetapan != '') {
            $t_tgl = explode(' - ', $post->t_tglpenetapan);
            $where->literal("c.t_tglpenetapan between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("a.t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("a.t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_niop != '')
            $where->literal("b.t_nop ILIKE '%$post->t_niop%'");
        if ($post->t_namaobjek != '')
            $where->literal("b.t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_jenispajak != '')
            $where->literal("b.s_namajenis ILIKE '%$post->t_jenispajak%'");
        if ($post->t_nopenetapan != '')
            $where->literal("c.t_nopenetapan = $post->t_nopenetapan or c.t_nourut = $post->t_nopenetapan");
        $select->where($where);
        $select->order("c.t_tglpenetapan desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSudahskrd(PenetapanBase $base, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop" => "t_nop", "t_namaobjek" => "t_namaobjek", "t_alamatobjek" => "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek" => "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi" => "t_idtransaksi"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek not in (1,2,3,4,5,6,7,8,9)');
        $where->isNotNull('c.t_tglpenetapan');
        if ($post->t_tglpenetapan != '') {
            $t_tgl = explode(' - ', $post->t_tglpenetapan);
            $where->literal("c.t_tglpenetapan between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("a.t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("a.t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_niop != '')
            $where->literal("b.t_nop ILIKE '%$post->t_niop%'");
        if ($post->t_namaobjek != '')
            $where->literal("b.t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_jenispajak != '')
            $where->literal("b.s_namajenis ILIKE '%$post->t_jenispajak%'");
        if ($post->t_nopenetapan != '')
            $where->literal("c.t_nopenetapan = $post->t_nopenetapan or c.t_nourut = $post->t_nopenetapan");
        $select->where($where);
        $select->order("c.t_tglpenetapan desc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSudahskrd(PenetapanBase $base, $offset, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "*"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_users"
        ), "c.t_operatorpenetapan = d.s_iduser", array(
            "s_nama"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek not in (1,2,3,4,5,6,7,8,9)');
        $where->isNotNull('c.t_tglpenetapan');
        if ($post->t_tglpenetapan != '') {
            $t_tgl = explode(' - ', $post->t_tglpenetapan);
            $where->literal("c.t_tglpenetapan between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("a.t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("a.t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_niop != '')
            $where->literal("b.t_nop ILIKE '%$post->t_niop%'");
        if ($post->t_namaobjek != '')
            $where->literal("b.t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_jenispajak != '')
            $where->literal("b.s_namajenis ILIKE '%$post->t_jenispajak%'");
        if ($post->t_nopenetapan != '')
            $where->literal("c.t_nopenetapan = $post->t_nopenetapan or c.t_nourut = $post->t_nopenetapan");
        $select->where($where);
        $select->order("c.t_tglpenetapan desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getTransaksiByIdTransaksi($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_jenisobjek", "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_tglpendataan", "t_nourut", "t_periodepajak", "t_masaawal", "t_masaakhir", "t_tarifpajak",
            "t_dasarpengenaan", "t_jmlhpajak", "t_tglpenetapan", "t_tgljatuhtempo", "t_jmlhdendapembayaran", "t_dasarpengenaan", "t_jmlhpajak", "t_tarifpajak"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "s_idkorek", "s_namakorek", "korek", "s_persentarifkorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPenetapan($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_jenisobjek", "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_tglpendataan", "t_nourut", "t_periodepajak", "t_masaawal", "t_masaakhir", "t_tarifpajak", "t_jmlhkenaikan", "t_noskpdjab",
            "t_dasarpengenaan", "t_jmlhpajak", "t_tglpenetapan", "t_tgljatuhtempo", "t_jmlhdendapembayaran", "t_dasarpengenaan", "t_jmlhpajak", "t_tarifpajak", "t_idkorek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "s_namakorek", "korek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_detailair"
        ), "c.t_idtransaksi = e.t_idtransaksi", array(
            "t_volume"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getjmlpenetapantahun()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        //        $where->equalTo('is_deluserpenetapan', 0);
        $where->literal("extract(year from t_tglpenetapan) = " . date('Y'));
        $where->isNotNull('t_tglpenetapan');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpenetapan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        //        $where->equalTo('is_deluserpenetapan', 0);
        $where->isNotNull('t_tglpenetapan');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function hapusPenetapan($id, $session)
    {
        $data = array(
            'is_deluserpenetapan' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }
    public function batalPenetapan($post)
    {
        $no = $this->getNoPembatalan($post->tglpembatalanskpd);
        $data = array(
            't_tglpembatalanskpd' => date('Y-m-d', strtotime($post->tglpembatalanskpd)),
            't_alasanpembatalanskpd' => $post->alasanpembatalanskpd,
            't_nopembatalanskpd' => $no['no'],
        );
        $this->update($data, array('t_idtransaksi' => $post->idtransaksi));
    }

    public function getNoPembatalan($tgl)
    {
        $bulan = date('m', strtotime($tgl));
        $tahun = date('Y', strtotime($tgl));
        $sql = "SELECT COALESCE(MAX(t_nopembatalanskpd),0) + 1 as no FROM t_transaksi WHERE extract(month from t_tglpembatalanskpd) = '$bulan' and extract(year from t_tglpembatalanskpd) = '$tahun' ";
        $st = $this->adapter->query($sql);
        return $st->execute()->current();
    }

    public function getDataPenetapanRek($tglpenetapan0, $tglpenetapan1, $t_kecamatan, $t_kelurahan, $t_idkorek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_jenisobjek", "t_nop", "t_namaobjek", "t_alamatobjek", "s_namajenis", "t_alamatlengkapobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_tglpendataan", "t_nourut", "t_periodepajak", "t_masaawal", "t_masaakhir", "t_jmlhpajak", "t_tglpenetapan", "t_tgljatuhtempo", "t_nopenetapan"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "s_namakorek", "korek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->between("c.t_tglpenetapan", date('Y-m-d', strtotime($tglpenetapan0)), date('Y-m-d', strtotime($tglpenetapan1)));
        if (!empty($t_kecamatan)) {
            $where->equalTo("b.t_kecamatanobjek", $t_kecamatan);
        }
        if (!empty($t_kelurahan)) {
            $where->equalTo("b.t_kelurahanobjek", $t_kelurahan);
        }
        if ($t_idkorek != null) {
            $where->literal("c.t_idkorek in (" . $t_idkorek . ")");
        }
        $select->where($where);
        $select->order("c.t_tglpenetapan asc");
        $select->order("c.t_nopenetapan asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataPenetapanObj($tglpenetapan0, $tglpenetapan1, $t_kecamatan, $t_kelurahan, $jenisobj)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "t_alamatlengkapobjek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_tglpendataan", "t_nourut", "t_periodepajak", "t_masaawal", "t_masaakhir", "t_jmlhpajak", "t_tglpenetapan", "t_tgljatuhtempo", "t_nopenetapan"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "s_namakorek", "korek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->between("c.t_tglpenetapan", date('Y-m-d', strtotime($tglpenetapan0)), date('Y-m-d', strtotime($tglpenetapan1)));
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
        $select->order("c.t_tglpenetapan asc");
        $select->order("c.t_nopenetapan asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataPenetapanID($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_idjenis", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_tglpenetapan", "t_jmlhpajak", "t_nourut", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_tglpendataan", "t_nopenetapan", "t_tgljatuhtempo", "t_kodebayar"
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

    public function geTglJatuhTempo($t_jenisobjekpajak)
    {
        $sql = "select t_jmlharitempo from s_jenisobjek where s_idjenis='" . $t_jenisobjekpajak . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getDescTableTransaksi()
    {
        $sql = "SELECT attname as Field
        FROM   pg_attribute
        WHERE  attrelid = 'public.t_transaksi'::regclass
        AND    attnum > 0
        AND    NOT attisdropped
        ORDER  BY attnum;";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getDataPenetapanABT($t_idtransaksi)
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
            "t_idtransaksi", "t_tglpenetapan", "t_jmlhpajak", "t_nourut", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_tglpendataan", "t_nopenetapan", "t_tgljatuhtempo", "t_kodebayar", "t_kompensasi"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis", "s_tarifdasarkorek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_detailair"
        ), "e.t_idtransaksi = c.t_idtransaksi", ['*'], $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataPenetapanReklame($t_idtransaksi)
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
            "t_idtransaksi", "t_tglpenetapan", "t_jmlhpajak", "t_nourut", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_tglpendataan", "t_nopenetapan", "t_tgljatuhtempo", "t_kodebayar", "t_tarifpajak", "t_kompensasi"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_detailreklame"
        ), "e.t_idtransaksi = c.t_idtransaksi", array(
            "*"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataMasalPenetapanABT__($t_idtransaksi)
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
            "t_idtransaksi", "t_tglpenetapan", "t_jmlhpajak", "t_nourut", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_tglpendataan", "t_nopenetapan", "t_tgljatuhtempo", "t_kodebayar"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_detailair"
        ), "e.t_idtransaksi = c.t_idtransaksi", ['*'], $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("c.t_idtransaksi in (" . $t_idtransaksi . ")");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataMasalPenetapanReklame__($t_idtransaksi)
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
            "t_idtransaksi", "t_tglpenetapan", "t_jmlhpajak", "t_nourut", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_tglpendataan", "t_nopenetapan", "t_tgljatuhtempo", "t_kodebayar"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_detailreklame"
        ), "e.t_idtransaksi = c.t_idtransaksi", array(
            "*"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("c.t_idtransaksi in (" . $t_idtransaksi . ")");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataMasalPenetapanReklame($tglawal, $tglakhir)
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
            "t_idtransaksi", "t_tglpenetapan", "t_jmlhpajak", "t_nourut", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_tglpendataan", "t_nopenetapan", "t_tgljatuhtempo", "t_kodebayar"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_detailreklame"
        ), "e.t_idtransaksi = c.t_idtransaksi", array(
            "*"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo("b.t_jenisobjek", 4);
        $where->between("c.t_tglpenetapan", date('Y-m-d', strtotime($tglawal)), date('Y-m-d', strtotime($tglakhir)));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataMasalPenetapanABT($tglawal, $tglakhir)
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
            "t_idtransaksi", "t_tglpenetapan", "t_jmlhpajak", "t_nourut", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_tglpendataan", "t_nopenetapan", "t_tgljatuhtempo", "t_kodebayar"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_detailair"
        ), "e.t_idtransaksi = c.t_idtransaksi", ['*'], $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo("b.t_jenisobjek", 8);
        $where->between("c.t_tglpenetapan", date('Y-m-d', strtotime($tglawal)), date('Y-m-d', strtotime($tglakhir)));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataMasalPenetapanRetribusi($tglawal, $tglakhir, $jenisobjek)
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
            "t_idtransaksi", "t_tglpenetapan", "t_jmlhpajak", "t_nourut", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_tglpendataan", "t_nopenetapan", "t_tgljatuhtempo", "t_kodebayar"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo("b.t_jenisobjek", $jenisobjek);
        $where->between("c.t_tglpenetapan", date('Y-m-d', strtotime($tglawal)), date('Y-m-d', strtotime($tglakhir)));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataPenetapanByTgl($bulan, $tahun, $jenispajak)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_jmlhpajak", "t_idtransaksi"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("extract(month from c.t_tglpenetapan) = '" . $bulan . "'");
        $where->literal("extract(year from c.t_tglpenetapan) = '" . $tahun . "'");
        $where->equalTo('c.t_jenispajak', (int) $jenispajak);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getBelumDitetapkan()
    {
        $sql = "select b.t_nop, b.t_namaobjek, a.t_tglpendataan from t_transaksi a left join view_wpobjek b on b.t_idobjek=a.t_idwpobjek  where a.t_jenispajak in (4,8) and a.t_tglpenetapan is null";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }
}
