<?php

namespace Pajak\Model\Pemeriksaan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PemeriksaanTable extends AbstractTableGateway
{

    protected $table = 't_skpdkb';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PemeriksaanBase());
        $this->initialize();
    }

    public function getjenissurat($s_idsurat)
    {
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

    public function simpanskpdkb(PemeriksaanBase $base, $session)
    {
        // Kode Provinsi dan Kab/Kota
        $kdProvkabkota = '6211';

        $no = $this->maxNoSKPDKB();
        $t_noskpdkb = (int) $no['t_noskpdkb'] + 1;

        // Jatuh Tempo SKPDKB
        $t_tgljatuhtempofix = date('Y-m-d', strtotime("+30 days" . $base->t_tglpemeriksaan));

        $t_nopemeriksaan = (!empty($base->t_nopemeriksaan)) ? $base->t_nopemeriksaan : '-';
        // Kode Bayar Self => 5-SKPDKB
        $jenissurat = $this->getjenissurat(5);
        $data = array(
            't_idtransaksi' => $base->t_idtransaksi,
            't_nopemeriksaan' => $t_nopemeriksaan,
            't_noskpdkb' => $t_noskpdkb,
            't_periodeskpdkb' => $base->t_periodepemeriksaan,
            't_tglskpdkb' => date('Y-m-d', strtotime($base->t_tglpemeriksaan)),
            't_tgljatuhtemposkpdkb' => $t_tgljatuhtempofix,
            't_tarifpajak' => $base->t_tarifpajak,
            't_dasarrevisi' => str_ireplace('.', '', $base->t_dasarrevisi),
            't_selisihdasar' => str_ireplace('.', '', $base->t_selisihdasar),
            't_jmlhbln' => $base->t_jmlhbln,
            't_tarifpersen' => $base->t_tarifpersen,
            't_jmlhdendaskpdkb' => str_ireplace('.', '', $base->t_jmlhdendapemeriksaan),
            't_jmlhpajakseharusnya' => str_ireplace('.', '', $base->t_jmlhpajakseharusnya),
            't_jmlhpajakskpdkb' => str_ireplace('.', '', $base->t_jmlhpajakpemeriksaan),
            't_kodebayarskpdkb' => $kdProvkabkota . '' . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . '' . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepemeriksaan, 2) . "" . str_pad($t_noskpdkb, 5, "0", STR_PAD_LEFT),
            't_totalskpdkb' => str_ireplace('.', '', $base->t_totalpemeriksaan),
            't_operatorskpdkb' => $session['s_iduser'],
            't_jenispemeriksaan' => $base->t_jenispemeriksaan
        );
        $table_skpdkb = new \Zend\Db\TableGateway\TableGateway('t_skpdkb', $this->adapter);
        $table_skpdkb->insert($data);
        return $data;
    }

    public function simpanskpdkbt(PemeriksaanBase $base, $session)
    {
        // Kode Provinsi dan Kab/Kota
        $kdProvkabkota = '6211';
        $no = $this->maxNoSKPDKBT();
        $t_noskpdkbt = (int) $no['t_noskpdkbt'] + 1;
        // Jatuh Tempo SKPDKB
        $t_tgljatuhtempofix = date('Y-m-d', strtotime("+30 days" . $base->t_tglpemeriksaan));

        $t_nopemeriksaan = (!empty($base->t_nopemeriksaan)) ? $base->t_nopemeriksaan : '-';
        // Kode Bayar Self => 6-SKPDKBT
        $jenissurat = $this->getjenissurat(6);
        $data = array(
            't_idtransaksi' => $base->t_idtransaksi,
            't_nopemeriksaan' => $t_nopemeriksaan,
            't_noskpdkbt' => $t_noskpdkbt,
            't_periodeskpdkbt' => $base->t_periodepemeriksaan,
            't_tglskpdkbt' => date('Y-m-d', strtotime($base->t_tglpemeriksaan)),
            't_tgljatuhtemposkpdkbt' => $t_tgljatuhtempofix,
            't_tarifpajak' => $base->t_tarifpajak,
            't_dasarrevisi' => str_ireplace('.', '', $base->t_dasarrevisi),
            't_selisihdasar' => str_ireplace('.', '', $base->t_selisihdasar),
            't_jmlhbln' => $base->t_jmlhbln,
            't_tarifpersen' => $base->t_tarifpersen,
            't_jmlhdendaskpdkbt' => str_ireplace('.', '', $base->t_jmlhdendapemeriksaan),
            't_jmlhpajakseharusnya' => str_ireplace('.', '', $base->t_jmlhpajakseharusnya),
            't_jmlhpajakskpdkbt' => str_ireplace('.', '', $base->t_jmlhpajakpemeriksaan),
            't_kodebayarskpdkbt' => $kdProvkabkota . '' . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . '' . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepemeriksaan, 2) . "" . str_pad($t_noskpdkbt, 5, "0", STR_PAD_LEFT),
            't_totalskpdkbt' => str_ireplace('.', '', $base->t_totalpemeriksaan),
            't_operatorskpdkbt' => $session['s_iduser'],
            't_jenispemeriksaan' => $base->t_jenispemeriksaan
        );
        $table_skpdkbt = new \Zend\Db\TableGateway\TableGateway('t_skpdkbt', $this->adapter);
        $table_skpdkbt->insert($data);
        return $data;
    }

    public function simpanskpdn(PemeriksaanBase $base, $session)
    {
        $no = $this->maxNoSKPDN();
        $t_noskpdn = (int) $no['t_noskpdn'] + 1;
        $t_nopemeriksaan = (!empty($base->t_nopemeriksaan)) ? $base->t_nopemeriksaan : '-';
        $data = array(
            't_idtransaksi' => $base->t_idtransaksi,
            't_nopemeriksaan' => $t_nopemeriksaan,
            't_noskpdn' => $t_noskpdn,
            't_periodeskpdn' => $base->t_periodepemeriksaan,
            't_tglskpdn' => date('Y-m-d', strtotime($base->t_tglpemeriksaan)),
            't_tarifpajak' => $base->t_tarifpajak,
            't_dasarrevisi' => str_ireplace('.', '', $base->t_dasarrevisi),
            't_selisihdasar' => str_ireplace('.', '', $base->t_selisihdasar),
            't_jmlhpajakseharusnya' => str_ireplace('.', '', $base->t_jmlhpajakseharusnya),
            't_totalskpdn' => str_ireplace('.', '', $base->t_totalpemeriksaan),
            't_operatorskpdn' => $session['s_iduser'],
            't_jenispemeriksaan' => $base->t_jenispemeriksaan
        );
        $table_skpdn = new \Zend\Db\TableGateway\TableGateway('t_skpdn', $this->adapter);
        $table_skpdn->insert($data);
        return $data;
    }

    public function simpanskpdlb(PemeriksaanBase $base, $session)
    {
        // Kode Provinsi dan Kab/Kota
        $kdProvkabkota = '6211';
        $no = $this->maxNoSKPDLB();
        $t_noskpdlb = (int) $no['t_noskpdlb'] + 1;

        $t_nopemeriksaan = (!empty($base->t_nopemeriksaan)) ? $base->t_nopemeriksaan : '-';
        // Kode Bayar Self => 5-SKPDLB
        $jenissurat = $this->getjenissurat(7);
        $data = array(
            't_idtransaksi' => $base->t_idtransaksi,
            't_nopemeriksaan' => $t_nopemeriksaan,
            't_noskpdlb' => $t_noskpdlb,
            't_periodeskpdlb' => $base->t_periodepemeriksaan,
            't_tglskpdlb' => date('Y-m-d', strtotime($base->t_tglpemeriksaan)),
            't_tarifpajak' => $base->t_tarifpajak,
            't_dasarrevisi' => str_ireplace('.', '', $base->t_dasarrevisi),
            't_selisihdasar' => str_ireplace('.', '', $base->t_selisihdasar),
            't_jmlhpajakseharusnya' => str_ireplace('.', '', $base->t_jmlhpajakseharusnya),
            't_kodebayarskpdlb' => $kdProvkabkota . '' . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . '' . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepemeriksaan, 2) . "" . str_pad($t_noskpdlb, 6, "0", STR_PAD_LEFT),
            't_totalskpdlb' => str_ireplace('.', '', $base->t_totalpemeriksaan),
            't_operatorskpdlb' => $session['s_iduser'],
            't_jenispemeriksaan' => $base->t_jenispemeriksaan
        );
        $table_skpdlb = new \Zend\Db\TableGateway\TableGateway('t_skpdlb', $this->adapter);
        $table_skpdlb->insert($data);
        return $data;
    }

    public function getGridCountTransaksiPokok(\Pajak\Model\Pendataan\PendataanBase $base)
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
        $where->literal("c.t_tglpembayaran is not null");
        $where->literal("c.t_jenispajak in (1,2,3,6,7,9,13)");
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

    public function getGridDataTransaksiPokok(\Pajak\Model\Pendataan\PendataanBase $base, $offset)
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
            "t_idtransaksi", "t_masaawal", "t_masaakhir", "t_nourut", "t_nopembayaran", "t_tglpembayaran", "t_jmlhpembayaran", "t_dasarpengenaan", "t_jenispajak", "t_noskpdjab"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("c.t_tglpembayaran is not null");
        $where->literal("c.t_jenispajak in (1,2,3,6,7,9,13)"); //air dan reklame tdk ikut
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
        $select->limit((int)$base->rows);
        $select->offset((int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        // echo $select->getSqlString();exit();
        $res = $state->execute();
        return $res;
    }

    public function hapusPemeriksaan($id, $session)
    {
        $data = array(
            'is_deluserpembayaran' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function maxNoSKPDKB()
    {
        $sql = "select max(t_noskpdkb) as t_noskpdkb from t_skpdkb";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function maxNoSKPDKBT()
    {
        $sql = "select max(t_noskpdkbt) as t_noskpdkbt from t_skpdkbt";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function maxNoSKPDN()
    {
        $sql = "select max(t_noskpdn) as t_noskpdn from t_skpdn";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function maxNoSKPDLB()
    {
        $sql = "select max(t_noskpdlb) as t_noskpdlb from t_skpdlb";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getTransaksiSKPDKBByIdTransaksi($t_idtransaksi)
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
            "d" => "t_skpdkb"
        ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_idskpdkb", "t_noskpdkb", "t_periodeskpdkb", "t_tglskpdkb", "t_dasarrevisi", "t_selisihdasar", "t_jmlhbln", "t_tarifpersen", "t_jmlhdendaskpdkb", "t_jmlhpajakseharusnya", "t_jmlhpajakskpdkb", "t_kodebayarskpdkb", "t_totalskpdkb"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "view_rekening"
        ), "d.t_korekskpdkb = e.s_idkorek", array(
            "s_idkorek", "s_namakorek", "korek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataSKPDKB($t_idtransaksi)
    {
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
            "t_jmlhpembayaran" => "t_jmlhbayarskpdkb"
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
    public function getDataPemeriksaan()
    {
    }
}
