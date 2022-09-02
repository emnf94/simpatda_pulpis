<?php

namespace Pajak\Model\Pendaftaran;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PendaftaranTable extends AbstractTableGateway
{

    protected $table = 't_wp';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PendaftaranBase());
        $this->initialize();
    }

    public function getPendaftaranId($t_idwp)
    {
        $rowset = $this->select(array('t_idwp' => $t_idwp));
        $row = $rowset->current();
        return $row;
    }



    public function simpanpendaftaran(PendaftaranBase $base, $session, $post, $postbadan, $fileUpload)
    {
        if (empty($post['t_kecamatanluar'])) {
            $t_kecamatanluar = "";
        } else {
            $t_kecamatanluar = $post['t_kecamatanluar'];
        }
        if (empty($post['t_kelurahanluar'])) {
            $t_kelurahanluar = "";
        } else {
            $t_kelurahanluar = $post['t_kelurahanluar'];
        }


        $no = $this->nopendaftaran($base->t_jenispendaftaran);
        $t_nopendaftaran = (int) $no['t_nopendaftaran'] + 1;
        $data = array(
            't_tgldaftar' => date('Y-m-d', strtotime($base->t_tgldaftar)),
            't_jenispendaftaran' => $base->t_jenispendaftaran,
            't_bidangusaha' => $base->t_bidangusaha,
            't_nopendaftaran' => $t_nopendaftaran,
            't_nik' => $base->t_nik,
            't_nama' => $base->t_nama,
            't_alamat' => $base->t_alamat,
            't_rt' => $base->t_rt,
            't_rw' => $base->t_rw,
            't_kelurahan' => $base->t_kelurahan,
            't_kecamatan' => $base->t_kecamatan,
            't_kelurahanluar' => $t_kelurahanluar,
            't_kecamatanluar' => $t_kecamatanluar,
            't_kabupaten' => $base->t_kabupaten,
            't_notelp' => $base->t_notelp,
            't_email' => $base->t_email,
            't_kodepos' => $base->t_kodepos,
            't_operatorid' => $session['s_iduser'],
            't_photowp' => $fileUpload,
        );
        // var_dump($data); die;
        if (!empty($postbadan['t_nama_badan'])) {
            $data['t_nama_badan'] = $postbadan['t_nama_badan'];
        } else {
            $data['t_nama_badan'] = null;
        }

        if (!empty($postbadan['t_jalan_badan'])) {
            $data['t_jalan_badan'] = $postbadan['t_jalan_badan'];
        } else {
            $data['t_jalan_badan'] = null;
        }

        if (!empty($postbadan['t_rt_badan'])) {
            $data['t_rt_badan'] = $postbadan['t_rt_badan'];
        } else {
            $data['t_rt_badan'] = null;
        }

        if (!empty($postbadan['t_rw_badan'])) {
            $data['t_rw_badan'] = $postbadan['t_rw_badan'];
        } else {
            $data['t_rw_badan'] = null;
        }

        if (!empty($postbadan['t_kecamatan_badan'])) {
            $data['t_kecamatan_badan'] = $postbadan['t_kecamatan_badan'];
        } else {
            $data['t_kecamatan_badan'] = 0;
        }

        if (!empty($postbadan['t_kelurahan_badan'])) {
            $data['t_kelurahan_badan'] = $postbadan['t_kelurahan_badan'];
        } else {
            $data['t_kelurahan_badan'] = 0;
        }

        if (!empty($postbadan['t_kabupaten_badan'])) {
            $data['t_kabupaten_badan'] = $postbadan['t_kabupaten_badan'];
        } else {
            $data['t_kabupaten_badan'] = null;
        }

        if (!empty($base->t_idwp)) {
            $data['t_idwp'] = $base->t_idwp;
            $data['t_nopendaftaran'] = $base->t_nopendaftaran;
            $result = $this->update($data, array('t_idwp' => $base->t_idwp));
        } else {
            $result = $this->insert($data);
        }
        $returnval = array(
            'data' => $data,
            'result' => $result
        );
        return $returnval;
    }

    public function simpantutupwp(PendaftaranBase $base, $session)
    {
        $data = array(
            't_tgl_tutup' => date('Y-m-d', strtotime($base->t_tgl_tutup)),
            't_status_wp' => $base->t_status_wp,
            't_ket_tutup' => $base->t_ket_tutup,
            't_noberita' => $base->t_noberita,
            't_operatorid_tutup' => $session['s_iduser']
        );
        $this->update($data, array('t_idwp' => $base->t_idwp));
        return $data;
    }

    public function simpanbukawp(PendaftaranBase $base, $session)
    {
        $data = array(
            't_tgl_buka' => date('Y-m-d', strtotime($base->t_tgl_buka)),
            't_status_wp' => $base->t_status_wp,
            't_ket_buka' => $base->t_ket_buka,
            't_noberita_buka' => $base->t_noberita_buka,
            't_operatorid_buka' => $session['s_iduser']
        );
        $this->update($data, array('t_idwp' => $base->t_idwp));
        return $data;
    }

    public function temukanPendaftaran($t_idwp)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $where = new Where();
        $where->equalTo('a.t_idwp', $t_idwp);
        $select->where($where);
        $select->order("a.t_tgldaftar DESC");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCount(PendaftaranBase $base, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $where = new Where();
        $where->equalTo('a.t_status_wp', true);
        $where->isNull('a.is_deluser');
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("t_tgldaftar between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_alamat != '')
            $where->literal("t_alamat ILIKE '%$post->t_alamat%'");
        if ($post->t_kelurahan != '')
            $where->literal("s_namakel ILIKE '%$post->t_kelurahan%'");
        if ($post->t_kecamatan != '')
            $where->literal("s_namakec ILIKE '%$post->t_kecamatan%'");
        if ($post->t_kabupaten != '')
            $where->literal("t_kabupaten ILIKE '%$post->t_kabupaten%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(PendaftaranBase $base, $offset, $post)
    {
        //        var_dump($base);
        //        var_dump($offset);
        //        die();
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $where = new Where();
        $where->equalTo('a.t_status_wp', true);
        $where->isNull('a.is_deluser');
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("t_tgldaftar between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_alamat != '')
            $where->literal("t_alamat ILIKE '%$post->t_alamat%'");
        if ($post->t_kelurahan != '')
            $where->literal("s_namakel ILIKE '%$post->t_kelurahan%'");
        if ($post->t_kecamatan != '')
            $where->literal("s_namakec ILIKE '%$post->t_kecamatan%'");
        if ($post->t_kabupaten != '')
            $where->literal("t_kabupaten ILIKE '%$post->t_kabupaten%'");
        $select->where($where);
        $select->order("t_tgldaftar desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountTutup(PendaftaranBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $where = new Where();
        //$where->equalTo('a.t_status_wp', false);
        $where->literal("a.t_status_wp = 'false' ");
        $where->isNotNull('a.t_tgl_tutup');
        $where->isNull('a.is_deluser');
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

    public function getGridDataTutup(PendaftaranBase $base, $offset)
    {
        //        var_dump($base);
        //        var_dump($offset);
        //        die();
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $where = new Where();
        //$where->equalTo('a.t_status_wp', false);
        $where->literal("a.t_status_wp = 'false' ");
        $where->isNotNull('a.t_tgl_tutup');
        $where->isNull('a.is_deluser');
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("lower($base->combocari) LIKE lower('%$base->kolomcari%')");
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

    public function getGridPenggabunganCount(PendaftaranBase $base, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->columns(array('t_idwp'));
        $where = new Where();
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("t_tgldaftar between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_alamat_lengkap != '')
            $where->literal("t_alamat_lengkap ILIKE '%$post->t_alamat_lengkap%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridPenggabunganData(PendaftaranBase $base, $offset, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->columns(array('t_idwp', 't_npwpd', 't_nama', 't_alamat_lengkap', 't_tgldaftar', 's_nama'));
        $where = new Where();
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("t_tgldaftar between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_alamat_lengkap != '')
            $where->literal("t_alamat_lengkap ILIKE '%$post->t_alamat_lengkap%'");
        $select->where($where);
        $select->order("t_tgldaftar desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getcomboIdKecamatan()
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kecamatan');
        $select->order('s_kodekec asc');
        // $select->order('s_idkec asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idkec']] = str_pad($row['s_kodekec'], 2, "0", STR_PAD_LEFT) . " || " . $row['s_namakec'];
            // $selectData[$row['s_idkec']] = str_pad($row['s_idkec'], 2, "0", STR_PAD_LEFT) . " || " . $row['s_namakec'];
        }
        return $selectData;
    }

    public function getcomboIdKecamatanObjek()
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kecamatan');
        $where = new Where();
        $where->NotEqualTo('s_idkec', 0);
        $select->where($where);
        $select->order('s_kodekec asc');
        // $select->order('s_idkec asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idkec']] = str_pad($row['s_kodekec'], 2, "0", STR_PAD_LEFT) . " || " . $row['s_namakec'];
            // $selectData[$row['s_idkec']] = str_pad($row['s_kodekec'], 2, "0", STR_PAD_LEFT) . " || " . $row['s_namakec'];
        }
        return $selectData;
    }

    public function getByKecamatan(PendaftaranBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kelurahan');
        $select->columns(array(
            's_idkel', 's_kodekel', 's_namakel'
        ));
        $where = new Where();
        $where->equalTo('s_idkeckel', (int) $base->t_kecamatan);
        $select->where($where);
        $select->order('s_kodekel asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getByKecamatancombo($idkec)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_kelurahan');
        $select->columns(array(
            's_idkel', 's_kodekel', 's_namakel'
        ));
        $where = new Where();
        $where->equalTo('s_idkel', (int) $idkec);
        $select->where($where);
        // echo ($select);exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function hapusPendaftaran($id)
    {

        $this->delete(array('t_idwp' => $id));
    }

    public function getPendaftaranbyIdObjekArray($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_jenisobjek", "t_nop", "t_namaobjek", "t_rtobjek", "t_rwobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_namajenis", "t_latitudeobjek", "t_longitudeobjek", "t_alamatlengkapobjek", "s_namajenissingkat"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("b.t_idobjek in (" . $t_idobjek . ")");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getNoteguran()
    {
        $sql = "select max(t_noteguran) as t_noteguran from t_teguranlaporpajak";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function JenisPajak($s_idjenis)
    {
        $sql = "select s_namajenis from s_jenisobjek where s_idjenis=$s_idjenis";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getPendaftaranbyIdObjek($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_jenisobjek", "t_nop", "t_namaobjek", "t_rtobjek", "t_rwobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_namajenis", "t_latitudeobjek", "t_longitudeobjek", "t_korekobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_rekening"
        ), "b.t_korekobjek = c.s_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_idkorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('b.t_idobjek', (int) $t_idobjek);
        $select->where($where);

        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPendaftaranbyIdTransaksi($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_jenisobjek", "t_nop", "t_namaobjek", "t_rtobjek", "t_rwobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_namajenis", "t_latitudeobjek", "t_longitudeobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jmlhpembayaran"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('a.is_deluser');
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);

        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPendaftaranReklamebyIdTransaksi($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_jenisobjek", "t_nop", "t_namaobjek", "t_rtobjek", "t_rwobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_namajenis", "t_latitudeobjek", "t_longitudeobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jmlhpembayaran"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_detailreklame"
        ), "d.t_idtransaksi = c.t_idtransaksi", array(
            "t_tipewaktu", "t_naskah", "t_lokasi", "t_jenisreklameusaha", "t_suratrekomendasi", "t_namafilerekomendasi"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('a.is_deluser');
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);

        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getjmlpendaftarantahun()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
        $where = new Where();
        $where->isNull('is_deluser');
        $where->literal("extract(year from t_tgldaftar) = " . date('Y'));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendaftaran()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
        $where = new Where();
        $where->isNull('a.is_deluser');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getDataPendaftaran($tgldaftar0, $tgldaftar1, $t_kecamatan, $t_kelurahan, $t_jenisobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('a.is_deluser');
        $where->between("a.t_tgldaftar", date('Y-m-d', strtotime($tgldaftar0)), date('Y-m-d', strtotime($tgldaftar1)));
        if (!empty($t_kecamatan)) {
            $where->equalTo("a.t_kecamatan", $t_kecamatan);
        }
        if (!empty($t_kelurahan)) {
            $where->equalTo("a.t_kelurahan", $t_kelurahan);
        }
        if (!empty($t_jenisobjek)) {
            $where->equalTo("b.t_jenisobjek", $t_jenisobjek);
        }
        $select->where($where);
        $select->order("a.t_idwp asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getviewwp($tgldaftar0, $tgldaftar1, $t_kecamatan, $t_kelurahan, $t_jenispendaftaran, $t_status_wp)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $where = new Where();
        $where->isNull('a.is_deluser');
        $where->between("a.t_tgldaftar", date('Y-m-d', strtotime($tgldaftar0)), date('Y-m-d', strtotime($tgldaftar1)));
        if (!empty($t_kecamatan)) {
            $where->equalTo("a.t_kecamatan", $t_kecamatan);
        }
        if (!empty($t_kelurahan)) {
            $where->equalTo("a.t_kelurahan", $t_kelurahan);
        }
        if (!empty($t_jenispendaftaran)) {
            $where->equalTo("a.t_jenispendaftaran", $t_jenispendaftaran);
        }
        if (!empty($t_status_wp)) {
            $where->equalTo("a.t_status_wp", $t_status_wp);
        }
        $select->where($where);
        $select->order(["a.t_tgldaftar asc", "a.t_nopendaftaran asc"]);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }


    public function getPendaftaranIDWP($t_idwp)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $where = new Where();
        $where->isNull('a.is_deluser');
        $where->equalTo("a.t_idwp", $t_idwp);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    // public function getPendaftaranIDWP($t_idwp) {
    //         $sql = new Sql($this->adapter);
    //         $select = $sql->select();
    //         $select->from(array(
    //             "a" => 'view_wp_v3'
    //         ));
    //         $select->join(array(
    //             "b" => "t_wp"
    //                 ), "a.t_idwp = b.t_idwp", array(
    //             "t_pemilik" => "t_nama"
    //                 ), $select::JOIN_LEFT);
    //         $where = new Where();
    //         $where->isNull('a.is_deluser');
    //         $where->equalTo("a.t_idwp", $t_idwp);
    //         $select->where($where);
    //         $state = $sql->prepareStatementForSqlObject($select);
    //         $res = $state->execute()->current();
    //         return $res;
    //     }

    public function getPendaftaranIDObjek($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop" => "t_nop", "t_namaobjek" => "t_namaobjek", "t_alamatobjek" => "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek" => "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('a.is_deluser');
        $where->equalTo("b.t_idobjek", $t_idobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function nopendaftaran($jenispendaftaran)
    {
        $sql = "select max(t_nopendaftaran) as t_nopendaftaran from t_wp where t_jenispendaftaran='$jenispendaftaran'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getPendaftaranbyNoDaftar($data)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('t_wp');
        $where = new Where();
        $where->literal("t_jenispendaftaran='" . $data['t_jenispendaftaran'] . "' ");
        $where->equalTo('t_nopendaftaran', $data['t_nopendaftaran']);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getGridCountWp(PendaftaranBase $base, $idjenis, $post)
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
        $where = new Where();
        $where->isNull('a.is_deluser');
        $where->equalTo('b.t_jenisobjek', (int) $idjenis);
        $where->equalTo('b.t_statusobjek', true);
        if ($post->t_npwpd != '')
            $where->literal("a.t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("a.t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_niop != '')
            $where->literal("b.t_nop ILIKE '%$post->t_niop%'");
        if ($post->t_namaobjek != '')
            $where->literal("b.t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_alamatobjek != '')
            $where->literal("b.t_alamatobjek ILIKE '%$post->t_alamatobjek%'");
        if ($post->t_kelurahanobjek != '')
            $where->literal("b.s_namakel ILIKE '%$post->t_kelurahanobjek%'");
        if ($post->t_kecamatanobjek != '')
            $where->literal("b.s_namakec ILIKE '%$post->t_kecamatanobjek%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataWp(PendaftaranBase $base, $offset, $idjenis, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek" => "t_idobjek",
            "t_nop" => "t_nop",
            "t_namaobjek" => "t_namaobjek",
            "t_alamatobjek" => "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek",
            "s_namakelobjek" => "s_namakelobjek",
            "t_kabupatenobjek" => "t_kabupatenobjek",
            "t_korekobjek" => "t_korekobjek",
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_rekening"
        ), "b.t_korekobjek = c.s_idkorek", array(
            "s_namakorek",
        ), $select::JOIN_LEFT);
        $where = new Where();
        //        $where->isNull('a.is_deluser');
        $where->equalTo('b.t_jenisobjek', (int) $idjenis);
        $where->equalTo('b.t_statusobjek', true);
        if ($post->t_npwpd != '')
            $where->literal("a.t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("a.t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_niop != '')
            $where->literal("b.t_nop ILIKE '%$post->t_niop%'");
        if ($post->t_namaobjek != '')
            $where->literal("b.t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_alamatobjek != '')
            $where->literal("b.t_alamatobjek ILIKE '%$post->t_alamatobjek%'");
        if ($post->t_kelurahanobjek != '')
            $where->literal("b.s_namakel ILIKE '%$post->t_kelurahanobjek%'");
        if ($post->t_kecamatanobjek != '')
            $where->literal("b.s_namakec ILIKE '%$post->t_kecamatanobjek%'");
        $select->where($where);
        $select->order("b.t_tgldaftarobjek desc");
        $select->order("a.t_npwpd desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountKatering(PendaftaranBase $base, $parametercari)
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
        $where = new Where();
        $where->equalTo('b.t_jenisobjek', (int) $parametercari['t_jenisobjekpajak']);
        if ($parametercari->npwpd != '')
            $where->literal("t_npwpd LIKE '%$parametercari->npwpd%'");
        if ($parametercari->nama != '')
            $where->literal("t_nama LIKE '%$parametercari->nama%'");
        if ($parametercari->nop != '')
            $where->literal("t_nop LIKE '%$parametercari->nop%'");
        if ($parametercari->namaobjek != '')
            $where->literal("t_namaobjek LIKE '%$parametercari->namaobjek%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataKatering(PendaftaranBase $base, $start, $parametercari)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_idobjek", "t_alamatlengkapobjek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('b.t_jenisobjek', (int) $parametercari->t_jenisobjekpajak);
        if ($parametercari->npwpd != '')
            $where->literal("t_npwpd LIKE '%$parametercari->npwpd%'");
        if ($parametercari->nama != '')
            $where->literal("t_nama LIKE '%$parametercari->nama%'");
        if ($parametercari->nop != '')
            $where->literal("t_nop LIKE '%$parametercari->nop%'");
        if ($parametercari->namaobjek != '')
            $where->literal("t_namaobjek LIKE '%$parametercari->namaobjek%'");
        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataJenisPajak($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_wpobjek_v2");
        $where = new Where();
        $where->equalTo("t_idobjek", $t_idobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getTransaksi($month, $tahun, $t_idobjek)
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
            "t_idtransaksi", "t_tglpendataan", "t_jmlhpajak", "t_jmlhbayardenda", "t_tglpembayaran", "t_jmlhpembayaran"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_detailair"
        ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_volume"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo("b.t_idobjek", $t_idobjek);
        $where->literal("extract(month from c.t_masaawal) ='" . str_pad($month, 2, '0', STR_PAD_LEFT) . "' and extract(year from c.t_masaawal) ='" . $tahun . "'");
        // $where->literal("extract(month from c.t_tglpendataan) ='" . str_pad($month, 2, '0', STR_PAD_LEFT) . "' and extract(year from c.t_tglpendataan) ='" . $tahun . "'");
        $select->where($where);
        // echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getTransaksiRetribusi($tahun, $t_idobjek)
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
            "t_idtransaksi", "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jmlhpembayaran", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo("b.t_idobjek", $t_idobjek);
        $where->literal("extract(year from c.t_masaawal) ='" . $tahun . "'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getTransaksireklame($tahun, $t_idobjek)
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
        ), "b.t_idobjek = c.t_idwpobjek", array("*"), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_detailreklame"
        ), "e.t_idtransaksi = c.t_idtransaksi", array("*"), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo("b.t_idobjek", $t_idobjek);
        $where->literal("c.t_periodepajak ='" . $tahun . "'");
        // $where->literal("extract(year from c.t_tglpendataan) ='" . $tahun . "'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getTransaksiRekapdata($tahun, $t_idwp)
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
            "*"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo("a.t_idwp", $t_idwp);
        $where->isNotNull("c.t_idtransaksi");
        $where->isNull("c.t_tglpembayaran");
        $where->literal("c.t_periodepajak = '" . $tahun . "' ");
        // $where->literal("extract(year from c.t_tglpendataan) ='" . $tahun . "'");
        $select->where($where);
        $select->order("b.s_idjenis asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDescTablePendaftaran()
    {
        $sql = "SELECT attname as Field
			FROM   pg_attribute
			WHERE  attrelid = 'public.view_wp'::regclass
			AND    attnum > 0
			AND    NOT attisdropped
			ORDER  BY attnum;";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getDescTablePendaftaranop()
    {
        $sql = "SELECT attname as Field
FROM   pg_attribute
WHERE  attrelid = 'public.view_wpobjek'::regclass
AND    attnum > 0
AND    NOT attisdropped
ORDER  BY attnum";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function ceknik($t_jenispendaftaran, $t_nik)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_wp_v3");
        $where = new Where();
        $where->equalTo("t_jenispendaftaran", $t_jenispendaftaran);
        $where->equalTo("t_nik", $t_nik);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getAllWp()
    {
        $sql = "SELECT * FROM view_wp";
        $st = $this->adapter->query($sql);
        $rs = $st->execute();
        foreach ($rs as $key => $value) {
            $ar_role[$value['t_idwp']] = $value['t_npwpd'] . " || " . $value['t_nama'];
        }
        return $ar_role;
    }

    public function getcomboIdJenisReklame($s_idrekeningreklame)
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame');
        $where = new Where();
        $where->equalTo("s_idrekeningreklame", $s_idrekeningreklame);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $selectData = array();
        foreach ($res as $row) {
            $selectData[$row['s_idreklame']] = $row['s_namareklame'];
        }
        return $selectData;
    }

    public function getGridRealisasi($tahun)
    {
        ////// PAJAK DOANG
        $sql = "select s_namajenissingkat,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '01' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapjan,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '01' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapjan,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '01' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayarjan,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '01' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayarjan,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) as jmlh
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '01' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangjan,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '02' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapfeb,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '02' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapfeb,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '02' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayarfeb,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '02' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayarfeb,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '02' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangfeb,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '03' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapmar,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '03' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapmar,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '03' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayarmar,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '03' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayarmar,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '03' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangmar,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '04' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapapr,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '04' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapapr,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '04' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayarapr,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '04' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayarapr,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '04' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangapr,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '05' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapmei,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '05' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapmei,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '05' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayarmei,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '05' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayarmei,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '05' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangmei,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '06' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapjun,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '06' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapjun,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '06' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayarjun,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '06' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayarjun,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '06' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangjun,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '07' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapjul,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '07' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapjul,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '07' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayarjul,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '07' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayarjul,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '07' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangjul,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '08' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapagus,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '08' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapagus,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '08' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayaragus,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '08' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayaragus,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '08' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangagus,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '09' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapsep,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '09' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapsep,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '09' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayarsep,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '09' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayarsep,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '09' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangsep,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '10' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapokt,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '10' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapokt,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '10' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayarokt,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '10' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayarokt,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '10' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangokt,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '11' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapnov,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '11' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapnov,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '11' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayarnov,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '11' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayarnov,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '11' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangnov,
                    (select sum(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '12' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as tetapdes,
                    (select count(t_jmlhpajak) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '12' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhtetapdes,
                    (select sum(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '12' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as bayardes,
                    (select count(t_jmlhpembayaran) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '12' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as jmlhbayardes,
                    (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
                            from t_transaksi b
                            where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '12' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
                    ) as piutangdes
            from s_jenisobjek a where s_idjenis not in (10,11) and s_jenispungutan='Pajak' order by s_idjenis asc";


        //// PAJAK DAN RETRIBUSI 
        // $sql = "select s_namajenissingkat,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '01' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapjan,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '01' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapjan,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '01' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayarjan,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '01' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayarjan,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) as jmlh
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '01' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangjan,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '02' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapfeb,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '02' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapfeb,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '02' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayarfeb,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '02' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayarfeb,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '02' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangfeb,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '03' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapmar,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '03' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapmar,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '03' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayarmar,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '03' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayarmar,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '03' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangmar,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '04' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapapr,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '04' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapapr,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '04' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayarapr,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '04' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayarapr,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '04' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangapr,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '05' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapmei,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '05' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapmei,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '05' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayarmei,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '05' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayarmei,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '05' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangmei,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '06' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapjun,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '06' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapjun,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '06' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayarjun,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '06' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayarjun,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '06' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangjun,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '07' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapjul,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '07' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapjul,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '07' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayarjul,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '07' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayarjul,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '07' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangjul,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '08' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapagus,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '08' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapagus,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '08' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayaragus,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '08' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayaragus,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '08' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangagus,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '09' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapsep,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '09' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapsep,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '09' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayarsep,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '09' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayarsep,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '09' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangsep,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '10' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapokt,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '10' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapokt,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '10' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayarokt,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '10' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayarokt,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '10' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangokt,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '11' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapnov,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '11' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapnov,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '11' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayarnov,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '11' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayarnov,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '11' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangnov,
        //             (select sum(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '12' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as tetapdes,
        //             (select count(t_jmlhpajak) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '12' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhtetapdes,
        //             (select sum(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '12' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as bayardes,
        //             (select count(t_jmlhpembayaran) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and b.t_tglpembayaran is not null and extract(month from b.t_tglpendataan) = '12' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as jmlhbayardes,
        //             (select sum(coalesce(t_jmlhpajak,0)-coalesce(t_jmlhpembayaran,0)) 
        //                     from t_transaksi b
        //                     where b.t_jenispajak = a.s_idjenis and extract(month from b.t_tglpendataan) = '12' and extract(year from b.t_tglpendataan) = '" . $tahun . "'
        //             ) as piutangdes
        //     from s_jenisobjek a where s_idjenis not in (10,11) and s_idjenis <=42 order by s_idjenis asc";
        $statement = $this->adapter->query($sql);
        // var_dump($statement);exit();
        return $statement->execute();
    }

    public function getDataWp($t_idwp)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop" => "t_nop", "t_namaobjek" => "t_namaobjek", "t_alamatlengkapobjek", "t_latitudeobjek", "t_longitudeobjek", "s_namajenis", "t_npwpdwp", "t_gambarobjek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('a.is_deluser');
        $where->equalTo("a.t_idwp", $t_idwp);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataOp($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wpobjek_v2'
        ));
        $where = new Where();
        $where->equalTo("a.t_idobjek", $t_idobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataWpObjekID($t_idwp, $t_jenisobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wpobjek_v2'
        ));
        $where = new Where();
        $where->equalTo("a.t_idwp", $t_idwp);
        $where->equalTo("a.t_jenisobjek", $t_jenisobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getGridCountKetetapan(PendaftaranBase $base, $parametercari)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_ketetapan');
        $where = new Where();
        if ($parametercari->t_npwpdwp != '')
            $where->literal("t_npwpdwp LIKE '%$parametercari->t_npwpdwp%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp LIKE '%$parametercari->t_namawp%'");

        // $where->notEqualTo('s_rinciankorek', '00');
        // $where->notEqualTo('s_sub1korek', '');
        // $where->notEqualTo('s_jeniskorek', '4');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataKetetapan(PendaftaranBase $base, $start, $parametercari)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_ketetapan');
        $where = new Where();
        if ($parametercari->npwpdwp != '') {
            $where->literal("t_npwpdwp LIKE '%$parametercari->npwpdwp%'");
        }
        if ($parametercari->namawp != '') {
            $where->literal("t_namawp LIKE '%$parametercari->namawp%'");
        }

        // $where->notEqualTo('s_rinciankorek', '00');
        // $where->notEqualTo('s_sub1korek', '');
        // $where->notEqualTo('s_jeniskorek', '4');
        $select->where($where);
        $select->order('t_idtransaksi asc');
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($start);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    //cek jumlah WP yang sudah ada transaksi
    public function getDataJmlhWp($idwp)
    {
        $sql = "SELECT count(B.t_idwp) as jmlh_wp from t_transaksi A 
                left join t_wpobjek B ON B.t_idobjek=A.t_idwpobjek
                    WHERE B.t_idwp=" . $idwp . " ";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    //cek jumlah Objek yang sudah ada transaksi
    public function getDataJmlhObjek($idobjek)
    {
        $sql = "SELECT count(t_idwpobjek) as jmlh_objek FROM t_transaksi
                    WHERE t_idwpobjek=" . $idobjek . " ";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    //cek Objek Pajak Self
    public function getDataObjekSelf($idwp)
    {
        $sql = "SELECT count(t_idobjek) as jmlh_objekpajak FROM view_wpobjek
                    WHERE t_idwp=" . $idwp . " and t_jenisobjek in (1,2,3,5,6,7,9) ";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getByidPeruntukan($t_idperuntukan)
    {
        $sql = "SELECT * FROM s_air WHERE s_idperuntukan='$t_idperuntukan'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getTransaksikatering($tahun, $t_idobjek)
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
        ), "b.t_idobjek = c.t_idwpobjek", array("*"), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo("b.t_idobjek", $t_idobjek);
        $where->literal("c.t_periodepajak ='" . $tahun . "'");
        // $where->literal("extract(year from c.t_tglpendataan) ='" . $tahun . "'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        // echo $select->getSqlstring(); exit();
        $res = $state->execute();
        return $res;
    }
}
