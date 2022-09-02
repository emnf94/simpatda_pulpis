<?php

namespace Pajak\Model\Pendaftaran;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class ObjekTable extends AbstractTableGateway
{

    protected $table = 't_wpobjek';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new ObjekBase());
        $this->initialize();
    }

    public function getDataObjekById($t_idobjek)
    {
        $rowset = $this->select(array('t_idobjek' => $t_idobjek));
        $row = $rowset->current();
        return $row;
    }

    public function simpanobjek(ObjekBase $base, $session, $fileUpload)
    {
        $no = $this->noobjek($base->t_jenisobjek);
        $t_noobjek = (int) $no['t_noobjek'] + 1;
        $data = array(
            't_idwp' => $base->t_idwp,
            't_noobjek' => $t_noobjek,
            't_tgldaftarobjek' => date('Y-m-d', strtotime($base->t_tgldaftarobjek)),
            't_namaobjek' => $base->t_namaobjek,
            't_alamatobjek' => $base->t_alamatobjek,
            't_rtobjek' => $base->t_rtobjek,
            't_rwobjek' => $base->t_rwobjek,
            't_kelurahanobjek' => $base->t_kelurahanobjek,
            't_kecamatanobjek' => $base->t_kecamatanobjek,
            't_kabupatenobjek' => $base->t_kabupatenobjek,
            't_notelpobjek' => $base->t_notelpobjek,
            't_jenisobjek' => $base->t_jenisobjek,
            't_kodeposobjek' => $base->t_kodeposobjek,
            't_latitudeobjek' => $base->t_latitudeobjek,
            't_longitudeobjek' => $base->t_longitudeobjek,
            't_namaobjekpj' => $base->t_namaobjekpj,
            't_alamatobjekpj' => $base->t_alamatobjekpj,
            't_gambarobjek' => $fileUpload,
            't_operatorid' => $session['s_iduser'],
            't_tipeusaha' => $base->t_tipeusaha
        );
        // var_dump($data); die;
        if (!empty($base->t_korekobjek)) {
            $data['t_korekobjek'] = $base->t_korekobjek;
        }
        if (!empty($base->t_idobjek)) {
            $data['t_idobjek'] = $base->t_idobjek;
            $data['t_noobjek'] = $base->t_noobjek;
            $result = $this->update($data, array('t_idobjek' => $base->t_idobjek));
        } else {
            $result = $this->insert($data);
        }
        $returnval = array(
            'result' => $result
        );
        return $returnval;
    }

    public function SaveDataKorek($post)
    {
        for ($i = 0; $i < count($post->t_idobjek); $i++) {
            $data['t_korekobjek'] = $post->t_idkorek[$i];
            $this->update($data, array('t_idobjek' => $post->t_idobjek[$i]));
        }
    }

    public function getGridCountOp(ObjekBase $base, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "view_rekening"
        ), "a.t_korekobjek = b.s_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $select->columns(array('t_idwp'));
        $where = new Where();
        if ($post->t_tgldaftarobjek != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftarobjek);
            $where->literal("t_tgldaftarobjek between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpdwp != '') {
            $where->literal("(t_npwpdwp ILIKE '%$post->t_npwpdwp%' or t_namawp ILIKE '%$post->t_npwpdwp%')");
        }
        if ($post->t_nop != '') {
            $where->literal("(t_nop ILIKE '%$post->t_nop%' or t_namaobjek ILIKE '%$post->t_nop%')");
        }
        if ($post->t_alamatobjek != '')
            $where->literal("t_alamatlengkapobjek ILIKE '%$post->t_alamatobjek%'");
        if ($post->t_kecamatanobjek != '')
            $where->literal("a.s_namakecobjek ILIKE '%$post->t_kecamatanobjek%'");
        if ($post->t_kelurahanobjek != '')
            $where->literal("a.s_namakelobjek ILIKE '%$post->t_kelurahanobjek%'");
        if ($post->t_jenisobjek != '')
            $where->literal("a.s_namajenis ILIKE '%$post->t_jenisobjek%'");
        if ($post->t_tipeusaha != '') {
            $where->literal("(t_tipeusaha::text LIKE '%$post->t_tipeusaha%' or s_namausaha ILIKE '%$post->t_tipeusaha%')");
        }
        if ($post->t_rekening != '') {
            $where->literal("(korek ILIKE '%$post->t_rekening%' or s_namakorek ILIKE '%$post->t_rekening%')");
        }
        $select->where($where);

        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataOp(ObjekBase $base, $offset, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "view_rekening"
        ), "a.t_korekobjek = b.s_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        if ($post->t_tgldaftarobjek != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftarobjek);
            $where->literal("t_tgldaftarobjek between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpdwp != '') {
            $where->literal("(t_npwpdwp ILIKE '%$post->t_npwpdwp%' or t_namawp ILIKE '%$post->t_npwpdwp%')");
        }
        if ($post->t_nop != '') {
            $where->literal("(t_nop ILIKE '%$post->t_nop%' or t_namaobjek ILIKE '%$post->t_nop%')");
        }
        if ($post->t_alamatobjek != '')
            $where->literal("t_alamatlengkapobjek ILIKE '%$post->t_alamatobjek%'");
        if ($post->t_kecamatanobjek != '')
            $where->literal("a.s_namakecobjek ILIKE '%$post->t_kecamatanobjek%'");
        if ($post->t_kelurahanobjek != '')
            $where->literal("a.s_namakelobjek ILIKE '%$post->t_kelurahanobjek%'");
        if ($post->t_jenisobjek != '')
            $where->literal("a.s_namajenis ILIKE '%$post->t_jenisobjek%'");
        if ($post->t_tipeusaha != '') {
            $where->literal("(t_tipeusaha::text LIKE '%$post->t_tipeusaha%' or s_namausaha ILIKE '%$post->t_tipeusaha%')");
        }
        if ($post->t_rekening != '') {
            $where->literal("(korek ILIKE '%$post->t_rekening%' or s_namakorek ILIKE '%$post->t_rekening%')");
        }
        $select->where($where);
        $select->order("t_tgldaftarobjek desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getcomboIdJenis($t_jenispendaftaran)
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_jenisobjek');
        $where = new Where();
        if ($t_jenispendaftaran == 'P') {
            $where->equalTo('s_jenispungutan', 'Pajak');
            $where->literal('s_idjenis not in (10,11)');
        } elseif ($t_jenispendaftaran == 'R') {
            $where->equalTo('s_jenispungutan', 'Retribusi');
        }
        $select->where($where);
        $select->order('s_idjenis asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idjenis']] = str_pad($row['s_idjenis'], 2, "0", STR_PAD_LEFT) . " || " . $row['s_namajenis'];
        }
        return $selectData;
    }

    public function getcomboIdJenisRek()
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_jenisobjek');
        $select->order('s_idjenis asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idjenis']] = str_pad($row['s_idjenis'], 2, "0", STR_PAD_LEFT) . " || " . $row['s_namajenis'];
        }
        return $selectData;
    }

    public function noobjek($t_jenisobjek)
    {
        $sql = "select max(t_noobjek) as t_noobjek from t_wpobjek where t_jenisobjek=" . $t_jenisobjek;
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getDataObjek($t_idwp)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => 'view_wpobjek_v2'
        ));
        $select->join(array(
            "b" => "view_rekening"
        ), "b.s_idkorek = a.t_korekobjek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('t_idwp', (int) $t_idwp);
        $select->where($where);
        $select->order('t_jenisobjek asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataObjekSelf($t_idwp)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_wpobjek_v2');
        $where = new Where();
        $where->equalTo('t_idwp', (int) $t_idwp);
        $where->literal('t_jenisobjek in (1,2,3,5,6,7,9)');
        $select->where($where);
        $select->order('t_jenisobjek asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataObjekKorek($t_idwp)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => 'view_wpobjek_v2'
        ));
        $select->join(array(
            "b" => "view_rekening"
        ), "b.s_idkorek = a.t_korekobjek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('t_idwp', (int) $t_idwp);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataObjekId($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wpobjek_v2'
        ));
        $where = new Where();
        //        $where->isNull('a.is_deluser');
        $where->equalTo('a.t_idobjek', (int) $t_idobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataObjekIdObjek($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => 'view_wpobjek_v2'
        ));
        $select->join(array(
            "b" => "view_rekening"
        ), "b.s_idkorek = a.t_korekobjek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idobjek', (int) $t_idobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getJmlOP($t_idwp)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('t_wpobjek');
        $where = new Where();
        //        $where->isNull('a.is_deluser');
        $where->equalTo('t_idwp', (int) $t_idwp);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->count();
        return $res;
    }

    public function getAllDataObjek()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_jenisobjek');
        $where = new Where();
        // $where->literal('s_idjenis not in (10,11)');
        $where->between('s_idjenis', '1', '9');
        $select->where($where);
        $select->order('s_idjenis asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getObjekPajakbyNPWPD($npwpd)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek",
            "t_kabupatenobjek", "s_idjenis", "s_namajenis"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_npwpd', $npwpd);
        $select->where($where);
        $select->order("b.t_idobjek asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getObjekPajakbyIdObjek($idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "t_jenisobjek", "t_alamatlengkapobjek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $where = new Where();
        if (!empty($idobjek)) {
            $where->equalTo('b.t_idobjek', $idobjek);
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getTransaksibyIdObjek($idobjek, $periodeobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_tglpendataan", "t_jmlhpajak", "t_tglpenetapan", "t_tglpembayaran", "t_jmlhpembayaran", "t_masaawal", "t_masaakhir", "t_jmlhdendapembayaran", "t_tgldendapembayaran", "t_jmlhbayardenda", "t_tglbayardenda", "t_periodepajak"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        if (!empty($periodeobjek)) {
            $where->equalTo('c.t_periodepajak', $periodeobjek);
        }
        $where->equalTo('c.t_idwpobjek', $idobjek);
        $select->where($where);
        $select->order("c.t_masaawal asc");

        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getPendataanAwalbyIdObjek($idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_masaawal", "t_idkorek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "s_jenisobjek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idwpobjek', $idobjek);
        $select->where($where);
        $select->order("c.t_masaawal asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPendataanbyMasa($month, $periodepajak, $idobjek)
    {

        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_tglpenetapan", "t_tglpembayaran", "t_jmlhpembayaran"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idwpobjek', $idobjek);
        $where->literal("extract(month from c.t_masaawal) ='" . str_pad($month, 2, '0', STR_PAD_LEFT) . "' and extract(year from c.t_masaawal) ='" . $periodepajak . "'");
        $select->where($where);
        $select->order("c.t_masaawal asc");

        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPendataanKatering($periodepajak, $idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_tglpenetapan", "t_tglpembayaran", "t_jmlhpembayaran"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idwpobjek', $idobjek);
        $where->literal("extract(year from c.t_masaawal) ='" . $periodepajak . "'");
        $select->where($where);
        $select->order("c.t_tglpendataan asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getviewobjek($tgldaftar0, $tgldaftar1, $t_kecamatan, $t_kelurahan, $t_jenispajakop, $idkorek, $statusobjek, $tipeusaha)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wpobjek_v2'
        ));
        $select->join(array(
            "b" => "view_rekening"
        ), "a.t_korekobjek = b.s_idkorek", array(
            "korek", "s_idkorek", "s_jenisobjek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->between("a.t_tgldaftarobjek", date('Y-m-d', strtotime($tgldaftar0)), date('Y-m-d', strtotime($tgldaftar1)));
        if (!empty($t_jenispajakop)) {
            $where->equalTo("a.t_jenisobjek", $t_jenispajakop);
        }
        if (!empty($idkorek)) {
            $where->equalTo("a.t_korekobjek", $idkorek);
        }
        if (!empty($t_kecamatan)) {
            $where->equalTo("a.t_kecamatanobjek", $t_kecamatan);
        }
        if (!empty($t_kelurahan)) {
            $where->equalTo("a.t_kelurahanobjek", $t_kelurahan);
        }
        if (!empty($tipeusaha)) {
            $where->literal("a.t_tipeusaha = '" . $tipeusaha . "' ");
        }
        if (!empty($statusobjek)) {
            $where->literal("a.t_statusobjek = '" . $statusobjek . "' ");
        }
        $select->where($where);
        $select->order(["a.t_tgldaftarobjek asc", "a.t_idwp asc"]);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getHistoryReklame($idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_tglpenetapan", "t_tglpembayaran", "t_jmlhpembayaran"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_detailreklame"
        ), "e.t_idtransaksi = c.t_idtransaksi", array(
            "t_suratrekomendasi", "t_namafilerekomendasi"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idwpobjek', $idobjek);
        $select->where($where);
        $select->order("c.t_masaawal desc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        //var_dump($state);exit();
        return $res;
    }

    public function getDataObjekLeftMenu($t_idwp)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_wpobjek_v2');
        $select->columns(array(
            "t_jenisobjek", "t_namaobjek", "t_idobjek"
        ));
        $where = new Where();
        $where->equalTo('t_idwp', (int) $t_idwp);
        $where->literal('t_jenisobjek not in(4,8)');
        $select->where($where);
        $select->order('t_jenisobjek ASC');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function hapusPendaftaranObjek($id)
    {
        $this->delete(array('t_idobjek' => $id));
    }

    public function getJenisObjek($jenisobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_jenisobjek');
        $where = new Where();
        if (!empty($jenisobjek)) {
            $where->equalTo('s_idjenis', $jenisobjek);
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getJenisObjekbyidobjek($t_idwpobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('t_wpobjek');
        $where = new Where();

        $where->equalTo('t_idobjek', $t_idwpobjek);

        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getObjekPajakbyIdTeguranArray($array_idteguran)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_teguranlaporpajak"
        ));
        $select->columns(array(
            "t_noteguran", "t_tglteguran", "t_bulanpajak", "t_tahunpajak", "t_idteguran"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "b.t_idobjek = a.t_idobjekteguran", array(
            't_npwpdwp', 't_namawp', "t_idobjek", "t_nop", "t_namaobjek", "t_alamatlengkapobjek", "t_alamat_lengkapwp", "s_namajenis", "t_jenisobjek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('a.t_idteguran in (' . $array_idteguran . ')');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getTransaksiReklamebyIdObjek($idjenis, $idobjek)
    {
        $periode = date() - 5;
        $sql = "SELECT aa.t_periodepajak,
                (SELECT ab.t_masaawal FROM t_transaksi ab WHERE ab.t_jenispajak=$idjenis AND ab.t_idwpobjek=$idobjek AND ab.t_periodepajak>='$periode' order by ab.t_masaawal desc limit 1) as masaawal,
                (SELECT bb.t_namaobjek FROM view_wpobjek bb WHERE bb.t_idobjek=$idobjek limit 1) as namaobjek,
                (SELECT bb.t_alamatlengkapobjek FROM view_wpobjek bb WHERE bb.t_idobjek=$idobjek limit 1) as alamatobjek,
                'Januari s/d Desember' as masapajak

                FROM t_transaksi aa 
                WHERE aa.t_jenispajak=$idjenis AND aa.t_idwpobjek=$idobjek AND aa.t_periodepajak>='$periode'
                GROUP BY aa.t_periodepajak
                ORDER BY aa.t_periodepajak desc";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getTransaksiSelfbyIdObjek($idjenis, $idobjek)
    {
        $periode = date() - 5;
        $sql = "SELECT aa.t_periodepajak,
                (SELECT ab.t_masaawal FROM t_transaksi ab WHERE ab.t_jenispajak=$idjenis AND ab.t_idwpobjek=$idobjek AND ab.t_periodepajak>='$periode' order by ab.t_masaawal desc limit 1) as masaawal,
                (SELECT bb.t_namaobjek FROM view_wpobjek bb WHERE bb.t_idobjek=$idobjek limit 1) as namaobjek,
                (SELECT bb.t_alamatlengkapobjek FROM view_wpobjek bb WHERE bb.t_idobjek=$idobjek limit 1) as alamatobjek,
                'Januari s/d Desember' as masapajak

                FROM t_transaksi aa 
                WHERE aa.t_jenispajak=$idjenis AND aa.t_idwpobjek=$idobjek AND aa.t_periodepajak>='$periode'
                GROUP BY aa.t_periodepajak
                ORDER BY aa.t_periodepajak desc";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getviewwpobjek($tgldaftar0, $tgldaftar1, $t_jenispajakop, $statusobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wpobjek_v2'
        ));
        $select->join(array(
            "b" => "view_rekening"
        ), "a.t_korekobjek = b.s_idkorek", array(
            "korek", "s_idkorek", "s_jenisobjek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp_v3"
        ), "a.t_idwp = c.t_idwp", array(
            "t_alamat_lengkap", "t_npwpd", "t_nama", "t_notelp",
            "t_alamat",
            "t_kecamatan",
            "s_namakec",
            "s_namakel",
            "kecamatanluarwp",
            "kelurahanluarwp",
            "t_rt",
            "t_rw",
            "t_kabupaten"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->between("a.t_tgldaftarobjek", date('Y-m-d', strtotime($tgldaftar0)), date('Y-m-d', strtotime($tgldaftar1)));
        if (!empty($t_jenispajakop)) {
            $where->equalTo("a.t_jenisobjek", $t_jenispajakop);
        }
        if (!empty($statusobjek)) {
            $where->literal("a.t_statusobjek = '" . $statusobjek . "' ");
        }
        $select->where($where);
        $select->order(["a.t_tgldaftarobjek asc", "a.t_idwp asc"]);
        // echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
}
