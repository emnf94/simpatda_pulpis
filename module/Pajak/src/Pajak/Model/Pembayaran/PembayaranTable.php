<?php

namespace Pajak\Model\Pembayaran;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PembayaranTable extends AbstractTableGateway
{

    protected $table = 't_transaksi';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PembayaranBase());
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
        if ($t_jenispungutan == 'P') {
            $where->EqualTo('s_objekkorek', 12);
            if ($s_rinciankorek == '14') {
                $where->EqualTo('s_sub1korek', '00');
            } else {
                // $where->EqualTo('s_sub1korek', '000');
                $where->EqualTo('s_sub1korek', $s_sub1korek);  //jika sudah ditulis denda 
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

    public function simpanpembayaran(PembayaranBase $base, $session, $post)
    {
        $no = $this->nopembayaran();
        $t_nopembayaran = (int) $no['t_nopembayaran'] + 1;
        $no1 = $this->nostpd();
        $t_nostpd = (int) $no1['t_nostpd'] + 1;


        if ((int)$base->t_jmlhbulandendapembayaran > 0) {
            $datatransaksi = $this->getdatatransaksi($post['t_idtransaksi']);
            if ($post['t_jenispungutan'] == 'P') {

                $korekdenda = $this->getrekeningdendatransaksi($datatransaksi['s_jenisobjek'], $datatransaksi['s_objekkorek'], $datatransaksi['s_rinciankorek'], $post['t_jenispungutan']);

                $idkorekdenda = $korekdenda['s_idkorek'];
            } else {
                $korekdenda = $this->getrekeningdendatransaksi($datatransaksi['s_jenisobjek'], $datatransaksi['s_objekkorek'], $datatransaksi['s_rinciankorek'], $post['t_jenispungutan']);
                $idkorekdenda = $korekdenda['s_idkorek'];
            }
        } else {
            $t_idkorekdenda = 0;
        }
        // var_dump($idkorekdenda);exit();
        // $idkorekdenda = ($base->t_jmlhbulandendapembayaran > 0) ? (int) $this->getidkorekDenda($base->t_idtransaksi, $post['t_jenispungutan'])['s_idkorek'] : NULL;
        // var_dump($post);exit();
        if ($base->t_jenisketetapandenda == 1) { // Tidak Ditetapkan Denda
            $data = array(
                't_viapembayaran' => $base->t_viapembayaran,
                't_nopembayaran' => $t_nopembayaran,
                't_jmlhpembayaran' => str_ireplace('.', '', $base->t_jmlhpajak),
                't_tglpembayaran' => date('Y-m-d', strtotime($base->t_tglpembayaran)),
                't_operatorpembayaran' => $session['s_iduser']
            );
        } else if ($base->t_jenisketetapandenda == 2) { // Tetapkan Denda dan Tanpa Bayarkan Denda
            $data = array(
                't_viapembayaran' => $base->t_viapembayaran,
                't_nopembayaran' => $t_nopembayaran,
                't_jmlhpembayaran' => str_ireplace('.', '', $base->t_jmlhpajak),
                't_tglpembayaran' => date('Y-m-d', strtotime($base->t_tglpembayaran)),
                't_operatorpembayaran' => $session['s_iduser'],
                't_nostpd' => $t_nostpd,
                't_jmlhdendapembayaran' => str_ireplace('.', '', $base->t_jmlhdendapembayaran),
                't_jmlhbulandendapembayaran' => $base->t_jmlhbulandendapembayaran,
                't_tgldendapembayaran' => date('Y-m-d', strtotime($base->t_tglpembayaran)),
                't_operatordendapembayaran' => $session['s_iduser'],
                't_idkorekdenda' => ($idkorekdenda == 0) ? NULL : $idkorekdenda,
            );
        } elseif ($base->t_jenisketetapandenda == 3) { // Tetapkan Denda dan Bayarkan Denda
            $data = array(
                't_viapembayaran' => $base->t_viapembayaran,
                't_nopembayaran' => $t_nopembayaran,
                't_jmlhpembayaran' => str_ireplace('.', '', $base->t_jmlhpajak),
                't_tglpembayaran' => date('Y-m-d', strtotime($base->t_tglpembayaran)),
                't_operatorpembayaran' => $session['s_iduser'],
                't_nostpd' => $t_nostpd,
                't_viapembayarandenda' => $base->t_viapembayaran,
                't_jmlhdendapembayaran' => str_ireplace('.', '', $base->t_jmlhdendapembayaran),
                't_jmlhbulandendapembayaran' => $base->t_jmlhbulandendapembayaran,
                't_tgldendapembayaran' => date('Y-m-d', strtotime($base->t_tglpembayaran)),
                't_operatordendapembayaran' => $session['s_iduser'],
                't_jmlhbayardenda' => str_ireplace('.', '', $base->t_jmlhdendapembayaran),
                't_tglbayardenda' => date('Y-m-d', strtotime($base->t_tglpembayaran)),
                't_idkorekdenda' => ($idkorekdenda == 0) ? NULL : $idkorekdenda,
            );
        }
        $this->update($data, array('t_idtransaksi' => $base->t_idtransaksi));
        return $data;
    }

    public function nopembayaran()
    {
        $sql = "select max(t_nopembayaran) as t_nopembayaran from t_transaksi where extract(year from t_tglpembayaran)='" . date('Y') . "' ";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function nostpd()
    {
        $sql = "select max(t_nostpd) as t_nostpd from t_transaksi where extract(year from t_tglpembayaran)='" . date('Y') . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getidkorekDenda($idtransaksi, $jnspungut)
    {
        if ($jnspungut == 'P') {
            $sql = "select s_idkorek from s_rekening where s_jeniskorek::text='4' and s_objekkorek::text='08' and s_jenisobjek::text=(select s_jenisobjek::text from s_rekening where s_idkorek=(select t_idkorek from t_transaksi where t_idtransaksi=" . $idtransaksi . "))";
        } else {
            $sql = "select s_idkorek from s_rekening where s_jeniskorek::text='4' and s_objekkorek::text='09' and s_jenisobjek::text=(select s_jenisobjek::text from s_rekening where s_idkorek=(select t_idkorek from t_transaksi where t_idtransaksi=" . $idtransaksi . "))";
        }
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

    public function getGridCountSptpd(PembayaranBase $base, $post)
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
        $where->literal("((b.t_jenisobjek not in (4,8) and c.t_tglpendataan is not null) or (b.t_jenisobjek in (4,8) and c.t_tglpenetapan is not null)) and c.t_tglpembatalanskpd is null");

        if ($post->t_npwpd != '')
            $where->literal("a.t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("a.t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_niop != '')
            $where->literal("b.t_nop ILIKE '%$post->t_niop%'");
        if ($post->t_namaobjek != '')
            $where->literal("b.t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_kodebayar != '')
            $where->literal("c.t_kodebayar like '%$post->t_kodebayar%'");
        if ($post->t_nourut != '')
            $where->literal("c.t_nourut::text like '%$post->t_nourut%' or c.t_noskpdjab::text like '%$post->t_nourut%' ");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("c.t_tglpembayaran");
            } else {
                $where->isNull("c.t_tglpembayaran");
            }
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSptpd(PembayaranBase $base, $offset, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_jenispungutan", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_tgljatuhtempo", "t_tglpembayaran", "t_jmlhpembayaran", "t_noskpdjab", "t_jmlhkenaikan", "t_jmlhdendapembayaran", "t_kodebayar", "t_masaawal", "t_masaakhir", "t_tgldendapembayaran", "t_tglbayardenda", "t_idkorek"
        ), $select::JOIN_LEFT);
        // $select->join(array(
        //     "d" => "s_users"
        //         ), "d.s_iduser = c.t_operatorpembayaran", array(
        //     "s_namapembayar" => "s_nama"
        //         ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("((b.t_jenisobjek not in (4,8) and c.t_tglpendataan is not null) or (b.t_jenisobjek in (4,8) and c.t_tglpenetapan is not null )) and c.t_tglpembatalanskpd is null");

        if ($post->t_masapajak != '') {
            $t_tgl1 = explode(' - ', $post->t_masapajak);
            $where->literal("c.t_masaawal >= '" . date('Y-m-d', strtotime($t_tgl1[0])) . "' and c.t_masaakhir <= '" . date('Y-m-d', strtotime($t_tgl1[1])) . "'");
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
        if ($post->t_kodebayar != '')
            $where->literal("c.t_kodebayar like '%$post->t_kodebayar%'");
        if ($post->t_jmlhpajak != '')
            $where->literal("c.t_jmlhpajak::text like '$post->t_jmlhpajak%'");

        if ($post->t_nourut != '')
            $where->literal("c.t_nourut::text like '%$post->t_nourut%' or c.t_noskpdjab::text like '%$post->t_nourut%' ");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("c.t_tglpembayaran");
            } else {
                $where->isNull("c.t_tglpembayaran");
            }
        }
        $select->where($where);
        $select->order("c.t_nourut desc");
        $select->order("c.t_tglpendataan desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        // echo $select->getSqlString();exit();
        return $res;
    }

    public function getGridCountSkpdkb(\Pajak\Model\Skpdkb\SkpdkbBase $base, $post)
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
            "d" => "t_skpdkb"
        ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdkb"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_kodebayarskpdkb');

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
        if ($post->t_kodebayar != '')
            $where->literal("d.t_kodebayarskpdkb like '%$post->t_kodebayar%'");
        if ($post->t_nourut != '')
            $where->literal("d.t_noskpdkb::text like '%$post->t_nourut%'");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("d.t_tglbayarskpdkb");
            } else {
                $where->isNull("d.t_tglbayarskpdkb");
            }
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpdkb(\Pajak\Model\Skpdkb\SkpdkbBase $base, $offset, $post)
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
            "t_idtransaksi", "t_nourut", "t_tglpembayaran", "t_jmlhpembayaran", "t_nopembayaran", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdkb"
        ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdkb", "t_tglskpdkb", "t_jmlhbayarskpdkb", "t_tglbayarskpdkb", "t_noskpdkb", "t_jmlhdendaskpdkb", "t_jmlhpajakskpdkb", "t_kodebayarskpdkb"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_kodebayarskpdkb');

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
        if ($post->t_kodebayar != '')
            $where->literal("d.t_kodebayarskpdkb like '%$post->t_kodebayar%'");
        if ($post->t_nourut != '')
            $where->literal("d.t_noskpdkb::text like '%$post->t_nourut%'");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("d.t_tglbayarskpdkb");
            } else {
                $where->isNull("d.t_tglbayarskpdkb");
            }
        }
        $select->where($where);
        $select->order("d.t_noskpdkb desc");
        $select->order("d.t_tglskpdkb desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSkpdkbt(\Pajak\Model\Skpdkbt\SkpdkbtBase $base, $post)
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
            "d" => "t_skpdkbt"
        ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdkbt"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_kodebayarskpdkbt');
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
        if ($post->t_kodebayar != '')
            $where->literal("d.t_kodebayarskpdkbt like '%$post->t_kodebayar%'");
        if ($post->t_nourut != '')
            $where->literal("d.t_noskpdkbt::text like '%$post->t_nourut%'");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("d.t_tglbayarskpdkbt");
            } else {
                $where->isNull("d.t_tglbayarskpdkbt");
            }
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpdkbt(\Pajak\Model\Skpdkbt\SkpdkbtBase $base, $offset, $post)
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
            "t_idtransaksi", "t_nourut", "t_tglpembayaran", "t_jmlhpembayaran", "t_nopembayaran", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdkbt"
        ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdkbt", "t_tglskpdkbt", "t_jmlhbayarskpdkbt", "t_tglbayarskpdkbt", "t_noskpdkbt", "t_jmlhdendaskpdkbt", "t_jmlhpajakskpdkbt", "t_kodebayarskpdkbt"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_kodebayarskpdkbt');
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
        if ($post->t_kodebayar != '')
            $where->literal("d.t_kodebayarskpdkbt like '%$post->t_kodebayar%'");
        if ($post->t_nourut != '')
            $where->literal("d.t_noskpdkbt::text like '%$post->t_nourut%'");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("d.t_tglbayarskpdkbt");
            } else {
                $where->isNull("d.t_tglbayarskpdkbt");
            }
        }
        $select->where($where);
        $select->order("d.t_noskpdkbt desc");
        $select->order("d.t_tglskpdkbt desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSkpdlb(\Pajak\Model\Skpdlb\SkpdlbBase $base, $post)
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
            "d" => "t_skpdlb"
        ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdlb"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_kodebayarskpdlb');

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
        if ($post->t_kodebayar != '')
            $where->literal("d.t_kodebayarskpdlb like '%$post->t_kodebayar%'");
        if ($post->t_nourut != '')
            $where->literal("d.t_noskpdlb::text like '%$post->t_nourut%'");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("d.t_tglbayarskpdlb");
            } else {
                $where->isNull("d.t_tglbayarskpdlb");
            }
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpdlb(\Pajak\Model\Skpdlb\SkpdlbBase $base, $offset, $post)
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
            "t_idtransaksi", "t_nourut", "t_tglpembayaran", "t_jmlhpembayaran", "t_nopembayaran", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdlb"
        ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdlb", "t_tglskpdlb", "t_jmlhpengembalianskpdlb", "t_tglpengembalianskpdlb", "t_noskpdlb"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_kodebayarskpdlb');

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
        if ($post->t_kodebayar != '')
            $where->literal("d.t_kodebayarskpdlb like '%$post->t_kodebayar%'");
        if ($post->t_nourut != '')
            $where->literal("d.t_noskpdlb::text like '%$post->t_nourut%'");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("d.t_tglbayarskpdlb");
            } else {
                $where->isNull("d.t_tglbayarskpdlb");
            }
        }
        $select->where($where);
        $select->order("t_tglskpdlb desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSkpdt(\Pajak\Model\Skpdt\SkpdtBase $base, $post)
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
            "d" => "t_skpdt"
        ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdt"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_kodebayarskpdt');
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
        if ($post->t_kodebayar != '')
            $where->literal("d.t_kodebayarskpdt like '%$post->t_kodebayar%'");
        if ($post->t_nourut != '')
            $where->literal("d.t_noskpdt::text like '%$post->t_nourut%'");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("d.t_tglbayarskpdt");
            } else {
                $where->isNull("d.t_tglbayarskpdt");
            }
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpdt(\Pajak\Model\Skpdt\SkpdtBase $base, $offset, $post)
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
            "t_idtransaksi", "t_nourut", "t_tglpembayaran", "t_jmlhpembayaran", "t_nopembayaran", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_skpdt"
        ), "c.t_idtransaksi = d.t_idtransaksi", array(
            "t_totalskpdt", "t_tglskpdt", "t_jmlhbayarskpdt", "t_tglbayarskpdt", "t_noskpdt", "t_jmlhpajakskpdt", "t_jmlhdendaskpdt", "t_kodebayarskpdt"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNotNull('d.t_kodebayarskpdt');

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
        if ($post->t_kodebayar != '')
            $where->literal("d.t_kodebayarskpdt like '%$post->t_kodebayar%'");
        if ($post->t_nourut != '')
            $where->literal("d.t_noskpdt::text like '%$post->t_nourut%'");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("d.t_tglbayarskpdt");
            } else {
                $where->isNull("d.t_tglbayarskpdt");
            }
        }
        $select->where($where);
        $select->order("t_tglskpdt desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        // var_dump($state);exit();
        $res = $state->execute();

        return $res;
    }

    public function getGridCountSudah(PembayaranBase $base)
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
        $where->notEqualTo('c.t_jmlhpembayaran', 0);
        $where->isNotNull('c.t_tglpembayaran');
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

    public function getGridDataSudah(PembayaranBase $base, $offset)
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
            "t_idtransaksi", "t_nourut", "t_tglpembayaran", "t_jmlhpembayaran", "t_nopembayaran", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_users"
        ), "c.t_operatorpembayaran = d.s_iduser", array(
            "s_nama"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->notEqualTo('c.t_jmlhpembayaran', 0);
        $where->isNotNull('c.t_tglpembayaran');
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

    public function hapusPembayaran($id, $session)
    {
        $data = array(
            't_viapembayaran' => null,
            't_nopembayaran' => null,
            't_jmlhpembayaran' => null,
            't_tglpembayaran' => null,
            't_operatorpembayaran' => null,
            't_jmlhbulandendapembayaran' => null,
            't_jmlhdendapembayaran' => null,
            't_tgldendapembayaran' => null,
            't_jmlhbayardenda' => null,
            't_tglbayardenda' => null
        );
        // var_dump($id);exit()
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function gePembayaranByTgl($tglbayar0, $tglbayar1, $t_jenispajak, $kecamatan, $kelurahan)
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
            "t_tglpembayaran", "t_jmlhpembayaran", "t_jmlhbayardenda", "t_jmlhkenaikan", "t_jenispajak", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->isNull('c.is_deluserpembayaran');
        $where->between("c.t_tglpembayaran", date('Y-m-d', strtotime($tglbayar0)), date('Y-m-d', strtotime($tglbayar1)));
        $where->isNotNull('c.t_tglpembayaran');
        if (!empty($t_jenispajak)) {
            $where->equalTo("c.t_jenispajak", $t_jenispajak);
        }
        if (!empty($kecamatan)) {
            $where->equalTo("b.t_kecamatanobjek", $kecamatan);
        }
        if (!empty($kelurahan)) {
            $where->equalTo("b.t_kelurahanobjek", $kelurahan);
        }
        $select->where($where);
        $select->order("c.t_jenispajak asc");
        $select->order("c.t_tglpembayaran asc");
        $select->order("d.s_objekkorek asc");
        $select->order("d.s_rinciankorek asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function gePembayaranByTglSKPDKB($tglbayar0, $tglbayar1, $t_jenispajak, $kecamatan, $kelurahan)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdkb"
        ));
        $select->columns(array(
            "t_tglpembayaran" => "t_tglbayarskpdkb", "t_jmlhpembayaran" => "t_jmlhbayarskpdkb", "t_jmlhbayardenda" => "t_jmlhdendaskpdkb"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "b.t_idtransaksi = a.t_idtransaksi", array(
            "t_idtransaksi", "t_jmlhkenaikan", "t_jenispajak", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek_v2"
        ), "c.t_idobjek = b.t_idwpobjek", array(
            "t_nama" => "t_namawp", "t_npwpd" => "t_npwpdwp", "t_namaobjek", "t_nop", "t_idwp", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "b.t_idkorek = d.s_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->between("a.t_tglbayarskpdkb", date('Y-m-d', strtotime($tglbayar0)), date('Y-m-d', strtotime($tglbayar1)));
        $where->isNotNull('a.t_tglbayarskpdkb');
        if (!empty($t_jenispajak)) {
            $where->equalTo("b.t_jenispajak", $t_jenispajak);
        }
        if (!empty($kecamatan)) {
            $where->equalTo("c.t_kecamatanobjek", $kecamatan);
        }
        if (!empty($kelurahan)) {
            $where->equalTo("c.t_kelurahanobjek", $kelurahan);
        }
        $select->where($where);
        $select->order("b.t_jenispajak asc");
        $select->order("a.t_tglbayarskpdkb asc");
        $select->order("d.s_objekkorek asc");
        $select->order("d.s_rinciankorek asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function gePembayaranByTglSKPDKBT($tglbayar0, $tglbayar1, $t_jenispajak, $kecamatan, $kelurahan)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdkbt"
        ));
        $select->columns(array(
            "t_tglpembayaran" => "t_tglbayarskpdkbt", "t_jmlhpembayaran" => "t_jmlhbayarskpdkbt", "t_jmlhbayardenda" => "t_jmlhdendaskpdkbt"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "b.t_idtransaksi = a.t_idtransaksi", array(
            "t_idtransaksi", "t_jmlhkenaikan", "t_jenispajak", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek_v2"
        ), "c.t_idobjek = b.t_idwpobjek", array(
            "t_nama" => "t_namawp", "t_npwpd" => "t_npwpdwp", "t_namaobjek", "t_nop", "t_idwp", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "b.t_idkorek = d.s_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->between("a.t_tglbayarskpdkbt", date('Y-m-d', strtotime($tglbayar0)), date('Y-m-d', strtotime($tglbayar1)));
        $where->isNotNull('a.t_tglbayarskpdkbt');
        if (!empty($t_jenispajak)) {
            $where->equalTo("b.t_jenispajak", $t_jenispajak);
        }
        if (!empty($kecamatan)) {
            $where->equalTo("c.t_kecamatanobjek", $kecamatan);
        }
        if (!empty($kelurahan)) {
            $where->equalTo("c.t_kelurahanobjek", $kelurahan);
        }
        $select->where($where);
        $select->order("b.t_jenispajak asc");
        $select->order("a.t_tglbayarskpdkbt asc");
        $select->order("d.s_objekkorek asc");
        $select->order("d.s_rinciankorek asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function gePembayaranByTglSKPDT($tglbayar0, $tglbayar1, $t_jenispajak, $kecamatan, $kelurahan)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_skpdt"
        ));
        $select->columns(array(
            "t_tglpembayaran" => "t_tglbayarskpdt", "t_jmlhpembayaran" => "t_jmlhbayarskpdt", "t_jmlhbayardenda" => "t_jmlhdendaskpdt"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "b.t_idtransaksi = a.t_idtransaksi", array(
            "t_idtransaksi", "t_jmlhkenaikan", "t_jenispajak", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek_v2"
        ), "c.t_idobjek = b.t_idwpobjek", array(
            "t_nama" => "t_namawp", "t_npwpd" => "t_npwpdwp", "t_namaobjek", "t_nop", "t_idwp", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "b.t_idkorek = d.s_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->between("a.t_tglbayarskpdt", date('Y-m-d', strtotime($tglbayar0)), date('Y-m-d', strtotime($tglbayar1)));
        $where->isNotNull('a.t_tglbayarskpdt');
        if (!empty($t_jenispajak)) {
            $where->equalTo("b.t_jenispajak", $t_jenispajak);
        }
        if (!empty($kecamatan)) {
            $where->equalTo("c.t_kecamatanobjek", $kecamatan);
        }
        if (!empty($kelurahan)) {
            $where->equalTo("c.t_kelurahanobjek", $kelurahan);
        }
        $select->where($where);
        $select->order("b.t_jenispajak asc");
        $select->order("a.t_tglbayarskpdt asc");
        $select->order("d.s_objekkorek asc");
        $select->order("d.s_rinciankorek asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function gePembayaranByTglALL($tglbayar0, $tglbayar1, $t_jenispajak, $kecamatan, $kelurahan)
    {
        if (!empty($t_jenispajak)) {
            $jenispajak = "and t_jenispajak = " . $t_jenispajak . "";
        } else {
            $jenispajak = "";
        }
        if (!empty($kecamatan)) {
            $t_kecamatan = "and view_wpobjek_v2.t_kecamatanobjek = " . $kecamatan . "";
        } else {
            $t_kecamatan = "";
        }
        if (!empty($kelurahan)) {
            $t_kelurahan = "and view_wpobjek_v2.t_kelurahanobjek = " . $kelurahan . "";
        } else {
            $t_kelurahan = "";
        }
        $sql = "(SELECT t_npwpdwp as t_npwpd, t_namawp as t_nama, t_namaobjek, t_tglpembayaran, t_jmlhpembayaran, t_jmlhbayardenda, 
				t_idtransaksi, t_jenispajak, t_jmlhkenaikan, t_masaawal, t_masaakhir, view_wpobjek_v2.s_namajenis, 
				view_rekening.s_namakorek, view_rekening.korek, view_rekening.s_objekkorek, view_rekening.s_rinciankorek
					FROM t_transaksi 
						LEFT JOIN view_wpobjek_v2 ON view_wpobjek_v2.t_idobjek=t_transaksi.t_idwpobjek
						LEFT JOIN view_rekening ON view_rekening.s_idkorek=t_transaksi.t_idkorek
						WHERE t_tglpembayaran BETWEEN '" . date('Y-m-d', strtotime($tglbayar0)) . "' AND '" . date('Y-m-d', strtotime($tglbayar1)) . "' 
						" . $jenispajak . " " . $t_kecamatan . " " . $t_kelurahan . ")
				UNION
				(SELECT t_npwpdwp as t_npwpd, t_namawp as t_nama, t_namaobjek, t_skpdkb.t_tglbayarskpdkb as t_tglpembayaran, 
				t_jmlhbayarskpdkb as t_jmlhpembayaran, t_jmlhdendaskpdkb as t_jmlhbayardenda,
				t_skpdkb.t_idtransaksi, t_transaksi.t_jenispajak, 0 as t_jmlhkenaikan, t_transaksi.t_masaawal, t_transaksi.t_masaakhir, 
				view_wpobjek_v2.s_namajenis, view_rekening.s_namakorek, view_rekening.korek, view_rekening.s_objekkorek, view_rekening.s_rinciankorek
					FROM t_skpdkb 
						LEFT JOIN t_transaksi ON t_transaksi.t_idtransaksi=t_skpdkb.t_idtransaksi
						LEFT JOIN view_wpobjek_v2 ON view_wpobjek_v2.t_idobjek=t_transaksi.t_idwpobjek
						LEFT JOIN view_rekening ON view_rekening.s_idkorek=t_transaksi.t_idkorek
						WHERE t_tglbayarskpdkb BETWEEN '" . date('Y-m-d', strtotime($tglbayar0)) . "' AND '" . date('Y-m-d', strtotime($tglbayar1)) . "' 
						" . $jenispajak . " " . $t_kecamatan . " " . $t_kelurahan . ")
				UNION
				(SELECT t_npwpdwp as t_npwpd, t_namawp as t_nama, t_namaobjek, t_skpdkbt.t_tglbayarskpdkbt as t_tglpembayaran, 
				t_jmlhbayarskpdkbt as t_jmlhpembayaran, t_jmlhdendaskpdkbt as t_jmlhbayardenda,
				t_skpdkbt.t_idtransaksi, t_transaksi.t_jenispajak, 0 as t_jmlhkenaikan, t_transaksi.t_masaawal, t_transaksi.t_masaakhir, 
				view_wpobjek_v2.s_namajenis, view_rekening.s_namakorek, view_rekening.korek, view_rekening.s_objekkorek, view_rekening.s_rinciankorek
					FROM t_skpdkbt 
						LEFT JOIN t_transaksi ON t_transaksi.t_idtransaksi=t_skpdkbt.t_idtransaksi
						LEFT JOIN view_wpobjek_v2 ON view_wpobjek_v2.t_idobjek=t_transaksi.t_idwpobjek
						LEFT JOIN view_rekening ON view_rekening.s_idkorek=t_transaksi.t_idkorek
						WHERE t_tglbayarskpdkbt BETWEEN '" . date('Y-m-d', strtotime($tglbayar0)) . "' AND '" . date('Y-m-d', strtotime($tglbayar1)) . "' 
						" . $jenispajak . " " . $t_kecamatan . " " . $t_kelurahan . ")
				UNION
				(SELECT t_npwpdwp as t_npwpd, t_namawp as t_nama, t_namaobjek, t_skpdt.t_tglbayarskpdt as t_tglpembayaran, 
				t_jmlhbayarskpdt as t_jmlhpembayaran, t_jmlhdendaskpdt as t_jmlhbayardenda,
				t_skpdt.t_idtransaksi, t_transaksi.t_jenispajak, 0 as t_jmlhkenaikan, t_transaksi.t_masaawal, t_transaksi.t_masaakhir, 
				view_wpobjek_v2.s_namajenis, view_rekening.s_namakorek, view_rekening.korek, view_rekening.s_objekkorek, view_rekening.s_rinciankorek
					FROM t_skpdt 
						LEFT JOIN t_transaksi ON t_transaksi.t_idtransaksi=t_skpdt.t_idtransaksi
						LEFT JOIN view_wpobjek_v2 ON view_wpobjek_v2.t_idobjek=t_transaksi.t_idwpobjek
						LEFT JOIN view_rekening ON view_rekening.s_idkorek=t_transaksi.t_idkorek
						WHERE t_tglbayarskpdt BETWEEN '" . date('Y-m-d', strtotime($tglbayar0)) . "' AND '" . date('Y-m-d', strtotime($tglbayar1)) . "' 
						" . $jenispajak . " " . $t_kecamatan . " " . $t_kelurahan . ") 
				ORDER BY 
				t_jenispajak, t_tglpembayaran, s_objekkorek, s_rinciankorek ASC";
        // echo ($sql); exit();
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
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
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_jenispungutan", "s_namajenispajak" => "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_tglpembayaran", "t_jmlhpembayaran", "t_nourut", "t_nopembayaran", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_jmlhpajak", "t_kodebayar", "t_masaawal", "t_masaakhir", "t_jenispajak", "t_tgljatuhtempo", "t_jmlhbayardenda", "t_viapembayaran", "t_nourut", "t_nopenetapan", "t_jmlhbulandendapembayaran", "t_idkorek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis", "s_jenisobjek"
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

    public function getDataPembayaranIDSKPDKB($t_idtransaksi)
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
            "t_idtransaksi", "t_tglpembayaran", "t_jmlhpembayaran", "t_nourut", "t_nopembayaran", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_jmlhpajak", "t_kodebayar", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_skpdkb"
        ), "e.t_idtransaksi = c.t_idtransaksi", array(
            "t_totalskpdkb", "t_jmlhbayarskpdkb", "t_tglbayarskpdkb"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataPembayaranIDSKPDKBT($t_idtransaksi)
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
            "t_idtransaksi", "t_tglpembayaran", "t_jmlhpembayaran", "t_nourut", "t_nopembayaran", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_jmlhpajak", "t_kodebayar", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_skpdkbt"
        ), "e.t_idtransaksi = c.t_idtransaksi", array(
            "t_totalskpdkbt", "t_jmlhbayarskpdkbt", "t_tglbayarskpdkbt"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataPembayaranIDSKPDT($t_idtransaksi)
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
            "t_idtransaksi", "t_tglpembayaran", "t_jmlhpembayaran", "t_nourut", "t_nopembayaran", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_jmlhpajak", "t_kodebayar", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_skpdt"
        ), "e.t_idtransaksi = c.t_idtransaksi", array(
            "t_totalskpdt", "t_jmlhbayarskpdt", "t_tglbayarskpdt"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
}
