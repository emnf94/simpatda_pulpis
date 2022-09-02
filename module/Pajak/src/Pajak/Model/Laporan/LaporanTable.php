<?php

namespace Pajak\Model\Laporan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class LaporanTable extends AbstractTableGateway {

    protected $table = 't_transaksi';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new LaporanBase());
        $this->initialize();
    }

    public function getLaporanId($t_idtransaksi) {
        $rowset = $this->select(array('t_idtransaksi' => $t_idtransaksi));
        $row = $rowset->current();
        return $row;
    }

    // Laporan SPTPD Self Assesment
    public function simpanpendataanself(LaporanBase $base, $session, $post) {
        // Pajak Minerba = 6
        if ($post['t_jenisobjekpajak'] == 6) {
            $base->t_idkorek = 0;
            $base->t_tarifpajak = 0;
        }

        $delay = \Zend\Math\Rand::getString(1, '12345', true);
        sleep($delay);

        $masaawal = $base->t_periodepajak . "-" . $base->t_masapajak . "-01";
        $masaakhir = date('Y-m-t', strtotime($masaawal));

        // Jatuh Tempo Self Assesment
        $t_tgljatuhtempo = $this->geTglJatuhTempo($post['t_jenisobjekpajak']);
        $t_tgljatuhtempofix = date('Y-m-' . $t_tgljatuhtempo['t_akhirbayar'], strtotime("+1 month" . $masaawal));

        $data = array(
            't_idwpobjek' => $base->t_idobjek,
            't_idkorek' => $base->t_idkorek,
            't_jenispajak' => $base->t_jenispajak,
            't_periodepajak' => $base->t_periodepajak,
            't_tglpendataan' => date('Y-m-d'),
            't_masaawal' => $masaawal,
            't_masaakhir' => $masaakhir,
            't_dasarpengenaan' => str_ireplace(".", "", $base->t_dasarpengenaan),
            't_tarifpajak' => $base->t_tarifpajak,
            't_jmlhpajak' => str_ireplace(".", "", $base->t_jmlhpajak),
            't_operatorpendataan' => $session['s_iduser'],
            't_tgljatuhtempo' => $t_tgljatuhtempofix
        );

        // Kode Bayar Self => 1-SPTPD
        $jenissurat = $this->getjenissurat(1);
        // No. SPTPD
        $no = $this->getLaporanMax();
        $t_nourut = (int) $no['t_nourut'] + 1;
        $data['t_nourut'] = $t_nourut;
        $data['t_kodebayar'] = $base->t_periodepajak . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . str_pad($t_nourut, 6, "0", STR_PAD_LEFT);
        $this->insert($data);

        if ($post['t_jenisobjekpajak'] == 6) {
            $sql = new Sql($this->adapter);
            $select = $sql->select();
            $select->from("t_transaksi");
            $select->columns(array(
                "t_idtransaksi"
            ));
            $where = new Where();
            $where->equalTo('t_nourut', $t_nourut);
            $where->equalTo('t_tglpendataan', date('Y-m-d', strtotime($base->t_tglpendataan)));
            $where->equalTo('t_masaawal', date('Y-m-d', strtotime($base->t_masaawal)));
            $where->equalTo('t_masaakhir', date('Y-m-d', strtotime($base->t_masaakhir)));
            $select->where($where);
            $state = $sql->prepareStatementForSqlObject($select);
            $res = $state->execute()->current();
            return $res;
        }
    }

    public function simpanpendataanwalet(LaporanBase $base, $session, $post) {
        // Jika Inputan Berupa SKPD Jabatan
        if (!empty($post['t_tarifkenaikan'])) {
            $t_tarifkenaikan = $post['t_tarifkenaikan'];
            $t_jmlhkenaikan = str_ireplace(".", "", $post['t_jmlhkenaikan']);
        } else {
            $t_tarifkenaikan = 0;
            $t_jmlhkenaikan = 0;
        }
        $delay = \Zend\Math\Rand::getString(1, '12345', true);
        sleep($delay);
        // Jatuh Tempo Self Assesment
        $t_tgljatuhtempo = $this->geTglJatuhTempo($post['t_jenisobjekpajak']);
        $t_tgljatuhtempofix = date('Y-m-' . $t_tgljatuhtempo['t_akhirbayar'], strtotime("+1 month" . $base->t_masaawal));

        $data = array(
            't_idwpobjek' => $base->t_idobjek,
            't_idkorek' => $base->t_idkorek,
            't_jenispajak' => $base->t_jenispajak,
            't_periodepajak' => $base->t_periodepajak,
            't_tglpendataan' => date('Y-m-d', strtotime($base->t_tglpendataan)),
            't_masaawal' => date('Y-m-d', strtotime($base->t_masaawal)),
            't_masaakhir' => date('Y-m-d', strtotime($base->t_masaakhir)),
            't_tarifdasarkorek' => str_ireplace(".", "", $base->t_tarifdasarkorek),
            't_nilaiperolehan' => $base->t_nilaiperolehan,
            't_dasarpengenaan' => str_ireplace(".", "", $base->t_dasarpengenaan),
            't_tarifpajak' => $base->t_tarifpajak,
            't_jmlhpajak' => str_ireplace(".", "", $base->t_jmlhpajak),
            't_operatorpendataan' => $session['s_iduser'],
            't_tgljatuhtempo' => $t_tgljatuhtempofix,
            't_tarifkenaikan' => $t_tarifkenaikan,
            't_jmlhkenaikan' => $t_jmlhkenaikan
        );
        $t_idtransaksi = $base->t_idtransaksi;
        if (empty($t_idtransaksi)) {
            // Kode Bayar Self => 1-SPTPD
            $jenissurat = $this->getjenissurat(1);
            // No. SPTPD
            $no = $this->getLaporanMax();
            $t_nourut = (int) $no['t_nourut'] + 1;
            $data['t_nourut'] = $t_nourut;
            $data['t_kodebayar'] = $base->t_periodepajak . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . str_pad($t_nourut, 6, "0", STR_PAD_LEFT);
            $this->insert($data);
        } else {
            // Kode Bayar Self => 1-SPTPD
            $jenissurat = $this->getjenissurat(1);
            $data['t_nourut'] = $base->t_nourut;
            $data['t_kodebayar'] = $base->t_periodepajak . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . str_pad($base->t_nourut, 6, "0", STR_PAD_LEFT);
            $this->update($data, array('t_idtransaksi' => $t_idtransaksi));
        }
    }

    public function temukanLaporan($t_idwp) {
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

    public function getGridCount(LaporanBase $base, $s_idjenis, $t_idobjek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek = ' . $s_idjenis . ' and c.t_tglpendataan is not null');
        $where->equalTo("c.t_idwpobjek", $t_idobjek);
        $where->notEqualTo("t_nourut", 0);
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

    public function getGridData(LaporanBase $base, $offset, $s_idjenis, $t_idobjek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek", "s_jenispungutan"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jenispajak", "t_jmlhpembayaran", "t_tglpembayaran"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_users"
                ), "c.t_operatorpendataan = d.s_iduser", array(
            "s_nama"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek = ' . $s_idjenis . ' and c.t_tglpendataan is not null');
        $where->equalTo("c.t_idwpobjek", $t_idobjek);
        $where->notEqualTo("t_nourut", 0);
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
		
		//echo $select->getSqlString(); exit();
		
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getLaporan($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getLaporanAirByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek"
            , "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel"
            , "t_kabupatenobjek", "t_rtobjek", "t_rwobjek", "t_latitudeobjek", "t_longitudeobjek", "t_jenisobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_tarifpajak",
            "t_jmlhpajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_detailair"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_volume"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_air"
                ), "d.t_peruntukanair = e.s_idair", array(
            "s_peruntukan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getLaporanReklameByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel"
            , "t_kabupatenobjek", "t_rtobjek", "t_rwobjek", "t_latitudeobjek", "t_longitudeobjek", "t_jenisobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_tarifpajak",
            "t_jmlhpajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_detailreklame"
                ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_jenisreklame", "t_jenislokasi", "t_naskah", "t_lokasi", "t_panjang", "t_lebar", "t_arah", "t_jumlah", "t_jangkawaktu", "t_tipewaktu", "t_kecamatanrek", "t_kelurahanrek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_reklame"
                ), "e.s_idreklame = d.t_jenisreklame", array(
            "s_namareklame"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "f" => "view_rekening"
                ), "c.t_idkorek = f.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function hapusLaporan($id, $session) {
        $data = array(
            'is_deluserpendataan' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function getLaporanSeMasa(LaporanBase $base, $t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wpobjek'
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "b.t_idwpobjek = a.t_idobjek", array(
            "t_idwpobjek" => "t_idwpobjek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("extract(month from b.t_masaawal) = '" . date('m', strtotime($base->t_masaawal)) . "' and extract(year from b.t_masaawal) = '" . date('Y', strtotime($base->t_masaawal)) . "' and b.t_idwpobjek= " . $base->t_idobjek);
        $where->notEqualTo("b.t_idtransaksi", $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getLaporanSeMasaWp(LaporanBase $base, $t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wpobjek'
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "b.t_idwpobjek = a.t_idobjek", array(
            "t_idwpobjek" => "t_idwpobjek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("extract(month from b.t_masaawal) = '" . $base->t_masapajak . "' and extract(year from b.t_masaawal) = '" . $base->t_periodepajak . "' and b.t_idwpobjek= " . $base->t_idobjek);
        $where->notEqualTo("b.t_idtransaksi", $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataLaporan($tglpendataan0, $tglpendataan1, $t_kecamatan, $t_kelurahan, $t_idkorek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel"
            , "t_kabupatenobjek", "t_rtobjek", "t_rwobjek", "t_latitudeobjek", "t_longitudeobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_tarifpajak",
            "t_jmlhpajak", "t_volume"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('e.is_deluserpendataan');
        $where->between("e.t_tglpendataan", date('Y-m-d', strtotime($tglpendataan0)), date('Y-m-d', strtotime($tglpendataan1)));
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

    public function getLaporanPembayaran($t_idwp, $month, $tahun) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_wp'
        ));
        $select->join(array(
            "e" => "t_transaksi"
                ), "a.t_idwp = e.t_idwp", array(
            "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jmlhpembayaran"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('e.is_deluserpendataan');
        $where->isNull('e.is_deluserpembayaran');
        $where->equalTo("e.t_idwp", $t_idwp);
        $where->literal("extract(month from e.t_tglpendataan) ='" . str_pad($month, 2, '0', STR_PAD_LEFT) . "' and extract(year from e.t_tglpendataan) ='" . $tahun . "'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataLaporanID($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek"
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan"
            , "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak"
            , "t_dasarpengenaan", "t_tarifpajak", "t_kodebayar"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp"
                ), "a.t_idwp = c.t_idwp", array(
            "t_nama", "t_alamat", "t_alamat_lengkap", "t_npwpd", "t_kabupaten"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
                ), "b.t_idkorek = d.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek", "s_rinciankorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('b.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataDetailMinerba($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailminerba"
        ));
        $select->join(array(
            "b" => "view_rekening"
                ), "a.t_idkorek = b.s_idkorek", array(
            "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataLaporanSebelumnya($t_jenisobjek, $t_idwpobjek, $t_masaawal) {
        $date = explode("-", date("Y-m-d", strtotime($t_masaawal . "-1 month")));
        $tgl = $date[2];
        $bln = $date[1];
        $thn = $date[0];
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek"
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_dasarpengenaan", "t_tarifpajak"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_jenisobjek', (int) $t_jenisobjek);
        $where->equalTo('b.t_idwpobjek', (int) $t_idwpobjek);
        $where->literal("extract(month from b.t_masaawal) = '" . $bln . "' and extract(year from b.t_masaawal) = '" . $thn . "'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getLaporanMax() {
        $sql = "select max(t_nourut) as t_nourut from t_transaksi";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getSkpdjabMax() {
        $sql = "select max(t_noskpdjab) as t_noskpdjab from t_transaksi";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getPenetapanMax() {
        $sql = "select max(t_nopenetapan) as t_nopenetapan from t_transaksi";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function geTglJatuhTempo($t_jenisobjekpajak) {
        $sql = "select t_akhirbayar from s_jenisobjek where s_idjenis='" . $t_jenisobjekpajak . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function geTglJatuhTempoofficial($t_jenisobjekpajak) {
        $sql = "select t_jmlharitempo from s_jenisobjek where s_idjenis='" . $t_jenisobjekpajak . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function geTglJatuhTempoRetribusi($t_jenisobjekpajak) {
        $sql = "select t_jmlharitempo from s_jenisobjek where s_idjenis='" . $t_jenisobjekpajak . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
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

    public function getjmlpendataantahun() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->literal("extract(year from t_tglpendataan) = " . date('Y'));
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getKorekWp($t_idwpobjek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek"
        ));
        $select->join(array(
            "b" => "view_rekening"
                ), "a.t_korekobjek = b.s_idkorek", array(
            "s_idkorek", "s_persentarifkorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idobjek', (int) $t_idwpobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataPokokPajak($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi",
        ));
        $select->columns(array(
            "t_idtransaksi" => "t_idtransaksi",
            "t_tglpendataan" => "t_tglpendataan",
            "t_dasarpengenaan" => "t_dasarpengenaan",
            "t_tarifpajak" => "t_tarifpajak",
            "t_jmlhpajak" => "t_jmlhpajak"
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
                "t_jenisketetapan" => "SPTPD",
                "t_idketetapan" => 1
            );
        } else {
            $tambahan = array(
                "t_jenisketetapan" => "SPTPD",
                "t_idketetapan" => 1
            );
            $data = array_merge($res, $tambahan);
        }
        return $data;
    }

    public function getDataNppdObjek($t_idobjek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek"
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_nourut"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp"
                ), "a.t_idwp = c.t_idwp", array(
            "t_nama", "t_alamat", "t_alamat_lengkap", "t_npwpd", "t_kabupaten"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idobjek', (int) $t_idobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataNppdSelf($t_idobjek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek"
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan"
            , "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak"
            , "t_dasarpengenaan", "t_tarifpajak", "t_kodebayar", "t_jmlhpembayaran", "t_jmlhdendapembayaran", "t_jmlhbayardenda"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp"
                ), "a.t_idwp = c.t_idwp", array(
            "t_nama", "t_alamat", "t_alamat_lengkap", "t_npwpd", "t_kabupaten"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
                ), "b.t_idkorek = d.s_idkorek", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idobjek', (int) $t_idobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataNppdOfficial($t_idobjek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek"
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan"
            , "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak"
            , "t_dasarpengenaan", "t_tarifpajak", "t_kodebayar", "t_jmlhpembayaran", "t_jmlhdendapembayaran", "t_jmlhbayardenda"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp"
                ), "a.t_idwp = c.t_idwp", array(
            "t_nama", "t_alamat", "t_alamat_lengkap", "t_npwpd", "t_kabupaten"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
                ), "b.t_idkorek = d.s_idkorek", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idobjek', (int) $t_idobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSkpdJabatan(LaporanBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('c.t_tarifkenaikan != 0');
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

    public function getGridDataSkpdJabatan(LaporanBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_noskpdjab", "t_tglpendataan", "t_jmlhpajak", "t_jmlhkenaikan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('c.t_tarifkenaikan != 0');
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
                $select->order("t_noskpdjab desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_noskpdjab desc");
            }
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataLaporanSKPDJab($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek"
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan"
            , "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak"
            , "t_dasarpengenaan", "t_tarifpajak", "t_kodebayar", "t_noskpdjab", "t_tarifkenaikan", "t_jmlhkenaikan"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp"
                ), "a.t_idwp = c.t_idwp", array(
            "t_nama", "t_alamat", "t_alamat_lengkap", "t_npwpd", "t_kabupaten"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
                ), "b.t_idkorek = d.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('b.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getLaporanRetribusi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_tglpenetapan", "t_tgljatuhtempo", "t_masaawal", "t_masaakhir", "t_kodebayar"
            , "t_periodepajak", "t_nopenetapan"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
                ), "c.t_idkorek = d.s_idkorek", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getSewaDinas($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_detailrumahdinas'
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPanggungReklame($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_detailpanggungreklame'
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getTanahReklame($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_detailtanahreklame'
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getTanahLain($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_detailtanahlain'
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getGedungOlahraga($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 't_detailgedung'
        ));
        $select->join(array(
            "b" => "s_tarifgedung"
                ), "a.t_jenis = b.s_idtarif", array(
            "s_namatarif"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getJenisPenetapan($t_jenispajak) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 's_jenisobjek'
        ));
        $select->columns(array(
            "s_jenispungutan"
        ));
        $where = new Where();
        $where->equalTo('a.s_idjenis', (int) $t_jenispajak);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getNoPenetapan($t_jenispungutan) {
        if ($t_jenispungutan == 'Pajak') {
            $sql = "select max(t_nopenetapan) as t_nopenetapan from t_transaksi where t_jenispajak in (4,8)";
        } elseif ($t_jenispungutan == 'Retribusi') {
            $sql = "select max(t_nopenetapan) as t_nopenetapan from t_transaksi where t_jenispajak in (10,11,12,13,14)";
        }
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

   

}
