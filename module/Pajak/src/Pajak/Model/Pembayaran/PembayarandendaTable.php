<?php

namespace Pajak\Model\Pembayaran;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PembayarandendaTable extends AbstractTableGateway
{

    protected $table = 't_transaksi';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PembayarandendaBase());
        $this->initialize();
    }

    public function getPembayaranId($t_idtransaksi)
    {
        $rowset = $this->select(array('t_idtransaksi' => $t_idtransaksi));
        $row = $rowset->current();
        return $row;
    }

    public function getdatatransaksi($t_idtransaksi)
    {
        $sql = "select * from t_transaksi a left join view_rekening b on a.t_idkorek=b.s_idkorek where t_idtransaksi = '$t_idtransaksi'";
        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }
    public function getrekeningdendatransaksi($s_jenisobjek, $s_objekkorek, $s_rinciankorek, $t_jenispungutan)
    {
        $s_sub1korek = '0' . $s_rinciankorek;
        // var_dump($t_jenispungutan);exit();
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("view_rekening");
        $where = new Where();
        $where->EqualTo('s_jenisobjek', (int)$s_jenisobjek);
        $where->EqualTo('s_rinciankorek', $s_objekkorek);

        if ($t_jenispungutan == '01') {
            $where->EqualTo('s_objekkorek', 12);
            if ($s_rinciankorek == '14') {
                $where->EqualTo('s_sub1korek', '000');
            } else {
                $where->EqualTo('s_sub1korek', $s_sub1korek); //jika sudah ditulis rek denda 
                // $where->EqualTo('s_sub1korek', '000'); 
            }
        } else {
            $where->EqualTo('s_objekkorek', 13);
            $where->EqualTo('s_sub1korek', $s_sub1korek);
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        // echo $select->getSqlString();exit();
        $res = $state->execute()->current();
        return $res;
    }

    public function simpanpembayarandenda(PembayarandendaBase $base, $session)
    {


        $datatransaksi = $this->getdatatransaksi($base->t_idtransaksi);

        if ($datatransaksi['s_jeniskorek'] == '01') {

            $korekdenda = $this->getrekeningdendatransaksi($datatransaksi['s_jenisobjek'], $datatransaksi['s_objekkorek'], $datatransaksi['s_rinciankorek'], $datatransaksi['s_jeniskorek']);

            $idkorekdenda = $korekdenda['s_idkorek'];
        } else {
            $korekdenda = $this->getrekeningdendatransaksi($datatransaksi['s_jenisobjek'], $datatransaksi['s_objekkorek'], $datatransaksi['s_rinciankorek'], $datatransaksi['s_jeniskorek']);
            $idkorekdenda = $korekdenda['s_idkorek'];
        }
        // var_dump($idkorekdenda);exit();
        $data = array(
            't_viapembayarandenda' => $base->t_viapembayarandenda,
            't_jmlhbayardenda' => str_ireplace('.', '', $base->t_jmlhbayardenda),
            't_tglbayardenda' => date('Y-m-d', strtotime($base->t_tglbayardenda)),
            't_operatorbayardenda' => $session['s_iduser'],
            't_idkorekdenda' => ($idkorekdenda == 0) ? NULL : $idkorekdenda,
        );
        $this->update($data, array('t_idtransaksi' => $base->t_idtransaksi));
        return $data;
    }

    public function getidkorekDenda($idtransaksi)
    {
        $sql = "select s_idkorek from s_rekening where s_jeniskorek::text='4' and s_objekkorek::text='07' and s_jenisobjek::text=(select s_jenisobjek::text from s_rekening where s_idkorek=(select t_idkorek from t_transaksi where t_idtransaksi=" . $idtransaksi . "))";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function temukanPembayaran($t_idwp)
    {
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
        $where->isNotNull('c.t_tglpembayaran');
        $where->isNotNull('c.t_tgldendapembayaran');
        $where->isNull('c.t_tglbayardenda');
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
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_tgljatuhtempo", "t_jmlhdendapembayaran", "t_nostpd"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('c.t_tglpembayaran');
        $where->isNotNull('c.t_tgldendapembayaran');
        $where->isNull('c.t_tglbayardenda');
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
        // echo $select->getSqlString();exit();
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSudah(PembayarandendaBase $base)
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
        $select->join(array(
            "d" => "s_users"
        ), "c.t_operatorbayardenda = d.s_iduser", array(
            "s_nama"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->notEqualTo('c.t_jmlhbayardenda', 0);
        $where->isNotNull('c.t_tglbayardenda');
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

    public function getGridDataSudah(PembayarandendaBase $base, $offset)
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
            "t_idtransaksi", "t_nourut", "t_tglbayardenda", "t_jmlhbayardenda", "t_nostpd"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->notEqualTo('c.t_jmlhbayardenda', 0);
        $where->isNotNull('c.t_tglbayardenda');
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
            $select->order("t_tglpembayaran desc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getjmlpembayarantahun()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->isNull('is_deluserpembayaran');
        $where->literal("extract(year from t_tglpembayaran) = " . date('Y'));
        $where->notEqualTo('t_jmlhpembayaran', 0);
        $where->isNotNull('t_tglpembayaran');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpembayaran()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->isNull('is_deluserpembayaran');
        $where->notEqualTo('t_jmlhpembayaran', 0);
        $where->isNotNull('t_tglpembayaran');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function hapusPembayaranDenda($id, $session)
    {
        $data = array(
            't_viapembayarandenda' => NULL,
            't_jmlhbayardenda' => NULL,
            't_tglbayardenda' => NULL,
            't_operatorbayardenda' => NULL,
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function getDataPembayaran($tglbayar0, $tglbayar1, $t_kecamatan, $t_kelurahan, $t_idkorek)
    {
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
        $where->isNull('e.is_deluserpembayaran');
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

    public function getDataPembayaranID($t_idtransaksi)
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
            "t_idtransaksi", "t_tglpembayaran", "t_jmlhpembayaran", "t_nourut", "t_jmlhbayardenda", "t_tglbayardenda", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_nopenetapan", "t_kompensasi"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "view_rekening"
        ), "e.s_idkorek = c.t_idkorekdenda", array(
            "korek_denda" => "korek", "namakorek_denda" => "s_namakorek", "persentarif_denda" => "s_persentarifkorek", "namajenis_denda" => "s_namajenis", "jenisobjek_denda" => "s_jenisobjek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPembayaran($t_idtransaksi)
    {
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
            "e" => "s_rekening"
        ), "a.t_idkorek = e.s_idkorek", array(
            "s_namakorek" => "s_namakorek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_transaksi"
        ), "a.t_idwp = e.t_idwp", array(
            "t_jmlhpenetapan" => "t_jmlhpenetapan", "t_tglpenetapan" => "t_tglpenetapan",
            "t_jmlhpembayaran" => "t_jmlhpembayaran", "t_tglpembayaran" => "t_tglpembayaran"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('e.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPembayaranByTgl($tglbayar0, $tglbayar1, $t_jenispajak)
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
            "t_tglbayardenda", "t_jmlhbayardenda"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('c.t_nostpd');
        $where->isNull('c.is_deluserbayardenda');
        $where->notEqualTo('c.t_jmlhbayardenda', 0);
        $where->between("c.t_tglbayardenda", date('Y-m-d', strtotime($tglbayar0)), date('Y-m-d', strtotime($tglbayar1)));
        $where->isNotNull('c.t_tglbayardenda');
        if (!empty($t_jenispajak)) {
            $where->equalTo("c.t_jenispajak", $t_jenispajak);
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
}
