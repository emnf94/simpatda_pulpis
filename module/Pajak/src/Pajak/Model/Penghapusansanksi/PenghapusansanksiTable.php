<?php

namespace Pajak\Model\Penghapusansanksi;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PenghapusansanksiTable extends AbstractTableGateway {

    protected $table = 't_penghapusansanksi';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PenghapusansanksiBase());
        $this->initialize();
    }

    public function getPenghapusanId($t_idhapussanksi) {
        $rowset = $this->select(array('t_idhapussanksi' => $t_idhapussanksi));
        $row = $rowset->current();
        return $row;
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

    public function maxNoHapussanksi() {
        $sql = "select max(t_nohapussanksi) as t_nohapussanksi from t_penghapusansanksi ";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function simpanhapussanksi(PenghapusansanksiBase $base, $session, $post) {
        $no = $this->maxNoHapussanksi();
        $t_nohapussanksi = (int) $no['t_nohapussanksi'] + 1;
        $data = array(
            't_idwpobjek' => $base->t_idwpobjek,
            't_idketetapan' => $base->t_idketetapan,
            't_jenisketetapan' => $base->t_jenisketetapan,
            't_jenispajak' => $base->t_jenispajak,
            't_tglhapussanksi' => date('Y-m-d', strtotime($base->t_tglhapussanksi)),
            't_alasanhapussanksi' => $base->t_alasanhapussanksi,
            't_jmlhketetapanseharusnya' => (float) str_ireplace('.', '', $base->t_jmlhpajak),
            't_inputhapussanksi' => $session['s_iduser'],
            't_jmlhdendaseharusnya' => (float) str_ireplace('.', '', $base->t_jmlhdendaseharusnya),
            't_jmlhdendaditetapkan' => 0
        );
        $t_hapusanksi = new \Zend\Db\TableGateway\TableGateway('t_penghapusansanksi', $this->adapter);
        if(empty($base->t_idhapussanksi)){
            $data['t_nohapussanksi'] = $t_nohapussanksi;
            $t_hapusanksi->insert($data);
        }else{
            $t_hapusanksi->update($data, array('t_idhapussanksi' => $base->t_idhapussanksi));
        }
        
    }

    public function simpanPersetujuan(PenghapusansanksiBase $base, $session, $post) {
        if($post['submit'] == 1){
           $status = 1;
           $jmlhdenda_ditetapkan = 0;
           $tgljatuhtempo = date('Y-m-d', strtotime("+5 year" . $post['t_tgljatuhtempo']));
        }else{
           $status = 2;
           $jmlhdenda_ditetapkan = $base->t_jmlhdendaseharusnya;
           $tgljatuhtempo = date('Y-m-d', strtotime($post['t_tgljatuhtempo']));
        }
        $data = array(
            't_tglverifikasi' => date('Y-m-d', strtotime($base->t_tglverifikasi)),
            't_jmlhdendaditetapkan' => str_ireplace('.', '', $jmlhdenda_ditetapkan),
            't_pejabatverifikasi' => $session['s_iduser'],
            't_statusverifikasi' => $status,
            't_nomorsk' => $base->t_nomorsk
        );
        $t_hapusanksipsj = new \Zend\Db\TableGateway\TableGateway('t_penghapusansanksi', $this->adapter);
        $t_hapusanksipsj->update($data, array('t_idhapussanksi' => $base->t_idhapussanksi));
        
        if($base->t_jenisketetapan == 2){
            $datatransaksi = array(
                't_tgljatuhtempo' => $tgljatuhtempo
            );
            $t_transaksi = new \Zend\Db\TableGateway\TableGateway('t_transaksi', $this->adapter);
            $t_transaksi->update($datatransaksi, array('t_idtransaksi' => $base->t_idketetapan));
        }elseif($base->t_jenisketetapan == 5){
            $datatransaksi = array(
                't_tgljatuhtemposkpdkb' => $tgljatuhtempo
            );
            $t_skpdkb = new \Zend\Db\TableGateway\TableGateway('t_skpdkb', $this->adapter);
            $t_skpdkb->update($datatransaksi, array('t_idskpdkb' => $base->t_idketetapan));
        }elseif($base->t_jenisketetapan == 6){
            $datatransaksi = array(
                't_tgljatuhtemposkpdkbt' => $tgljatuhtempo
            );
            $t_skpdkbt = new \Zend\Db\TableGateway\TableGateway('t_skpdkbt', $this->adapter);
            $t_skpdkbt->update($datatransaksi, array('t_idskpdkbt' => $base->t_idketetapan));
        }
        
    }
    
//    public function hapusKeberatan($id) {
//        $this->delete(array('t_idkeberatan' => $id));
//    }
    
    public function getGridCount(PenghapusansanksiBase $base, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_penghapusansanksi"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwpobjek = b.t_idobjek", array(
            "*"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("t_statusverifikasi is null");
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("a.t_tglhapussanksi between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpdwp ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_namawp ILIKE '%$post->t_nama%'");
        if ($post->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_jmlhpajak != '')
            $where->literal("t_jmlhketetapanseharusnya::text LIKE '$post->t_jmlhpajak'");
        if ($post->t_status != '')
            if($post->t_status == 1 || $post->t_status == 2){
                $where->literal("t_statusverifikasi = $post->t_status ");
            }else{
                $where->literal("t_statusverifikasi is null ");
            }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(PenghapusansanksiBase $base, $offset, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_penghapusansanksi"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwpobjek = b.t_idobjek", array(
            "*"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("t_statusverifikasi is null");
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("a.t_tglhapussanksi between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpdwp ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_namawp ILIKE '%$post->t_nama%'");
        if ($post->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_jmlhpajak != '')
            $where->literal("t_jmlhketetapanseharusnya::text LIKE '$post->t_jmlhpajak'");
        if ($post->t_status != '')
            if($post->t_status == 1 || $post->t_status == 2){
                $where->literal("t_statusverifikasi = $post->t_status ");
            }else{
                $where->literal("t_statusverifikasi is null ");
            }
        $select->where($where);
        $select->order("a.t_idhapussanksi desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getGridCountsudah(PenghapusansanksiBase $base, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_penghapusansanksi"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwpobjek = b.t_idobjek", array(
            "*"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("t_statusverifikasi is not null");
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("a.t_tglhapussanksi between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpdwp ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_namawp ILIKE '%$post->t_nama%'");
        if ($post->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_jmlhpajak != '')
            $where->literal("t_jmlhketetapanseharusnya::text ILIKE '%$post->t_jmlhpajak%'");
        if ($post->t_status != '')
            if($post->t_status == 1 || $post->t_status == 2){
                $where->literal("t_statusverifikasi = $post->t_status ");
            }else{
                $where->literal("t_statusverifikasi is null ");
            }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDatasudah(PenghapusansanksiBase $base, $offset, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_penghapusansanksi"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwpobjek = b.t_idobjek", array(
            "*"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("t_statusverifikasi is not null");
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("a.t_tglhapussanksi between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpdwp ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_namawp ILIKE '%$post->t_nama%'");
        if ($post->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_jmlhpajak != '')
            $where->literal("t_jmlhketetapanseharusnya::text ILIKE '%$post->t_jmlhpajak%'");
        if ($post->t_status != '')
            if($post->t_status == 1 || $post->t_status == 2){
                $where->literal("t_statusverifikasi = $post->t_status ");
            }else{
                $where->literal("t_statusverifikasi is null ");
            }
        $select->where($where);
        $select->order("a.t_idhapussanksi desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
    public function getGridCountKetetapanKeberatanSkpd(\Pajak\Model\Pendataan\PendataanBase $base) {
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
            "d" => "t_keberatan"
                ), "d.t_idketetapan = c.t_idtransaksi", array(
            "t_nominalkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("d.t_tglketetapankeberatan is not null and d.t_jenisketetapan=2");
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari ILIKE '%$base->kolomcari%'");
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

    public function getGridDataKetetapanKeberatanSkpd(\Pajak\Model\Pendataan\PendataanBase $base, $offset) {
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
            "t_idtransaksi", "t_nourut", "t_nopembayaran", "t_tglpembayaran", "t_jmlhpembayaran", "t_dasarpengenaan", "t_jenispajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_keberatan"
                ), "d.t_idketetapan = c.t_idtransaksi", array(
            "t_idkeberatan", "t_nominalkeberatan", "t_nokeberatan", "t_keberatanke", "t_tglpembayarankeberatan", "t_jenisketetapan", "t_kodebayarkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("d.t_tglketetapankeberatan is not null and d.t_jenisketetapan=2");
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari ILIKE '%$base->kolomcari%'");
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
                $select->order("t_idkeberatan desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_idkeberatan desc");
            }
        } else {
            $select->order("t_idkeberatan desc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountKetetapanKeberatanSkpdkb(\Pajak\Model\Pendataan\PendataanBase $base) {
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
            "e" => "t_keberatan"
                ), "e.t_idketetapan = d.t_idskpdkb", array(
            "t_nominalkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglketetapankeberatan is not null and e.t_jenisketetapan=5");
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari ILIKE '%$base->kolomcari%'");
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

    public function getGridDataKetetapanKeberatanSkpdkb(\Pajak\Model\Pendataan\PendataanBase $base, $offset) {
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
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_keberatan"
                ), "e.t_idketetapan = d.t_idskpdkb", array(
            "t_idkeberatan", "t_nominalkeberatan", "t_nokeberatan", "t_keberatanke", "t_tglpembayarankeberatan", "t_jenisketetapan", "t_kodebayarkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglketetapankeberatan is not null and e.t_jenisketetapan=5");
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari ILIKE '%$base->kolomcari%'");
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

    public function getGridCountKetetapanKeberatanSkpdkbt(\Pajak\Model\Pendataan\PendataanBase $base) {
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
            "e" => "t_keberatan"
                ), "e.t_idketetapan = d.t_idskpdkbt", array(
            "t_nominalkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglketetapankeberatan is not null ");
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari ILIKE '%$base->kolomcari%'");
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

    public function getGridDataKetetapanKeberatanSkpdkbt(\Pajak\Model\Pendataan\PendataanBase $base, $offset) {
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
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_keberatan"
                ), "e.t_idketetapan = d.t_idskpdkbt", array(
            "t_nominalkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglketetapankeberatan is not null ");
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari ILIKE '%$base->kolomcari%'");
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

    public function getGridCountKetetapanKeberatanSkpdt(\Pajak\Model\Pendataan\PendataanBase $base) {
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
            "e" => "t_keberatan"
                ), "e.t_idketetapan = d.t_idskpdt", array(
            "t_nominalkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglketetapankeberatan is not null ");
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari ILIKE '%$base->kolomcari%'");
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

    public function getGridDataKetetapanKeberatanSkpdt(\Pajak\Model\Pendataan\PendataanBase $base, $offset) {
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
            "t_idtransaksi"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_keberatan"
                ), "e.t_idketetapan = d.t_idskpdt", array(
            "t_nominalkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("e.t_tglketetapankeberatan is not null ");
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari ILIKE '%$base->kolomcari%'");
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

    public function hapusKeberatan($id, $session) {
        $data = array(
            
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function getGridCountSkpd(PenghapusansanksiBase $base, $parametercari) {
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
            "c" => "t_penghapusansanksi"
                ), "c.t_idketetapan = a.t_idtransaksi", array(
            "*"
                ), $select::JOIN_LEFT);
        $where = new Where();
//      $where->literal("a.t_tglpembayaran is null and a.t_jenispajak in (4,8) and c.t_idkeberatan is null");
//        $where->literal("a.t_tglpembayaran is null and a.t_jenispajak not in (1,2,3,5,6,7,9) and c.t_idkeberatan is null");
        $where->literal("a.t_tgljatuhtempo < '" . date('Y-m-d') . "'");
        $where->literal("a.t_tglpembayaran is null");
        if ($parametercari->t_nop != '')
            $where->literal("t_nop ILIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpdwp != '')
            $where->literal("t_npwpdwp ILIKE '%$parametercari->t_npwpdwp%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp ILIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_nopenetapan ILIKE '%$parametercari->t_nopenetapan%'");

        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpd(PenghapusansanksiBase $base, $offset, $parametercari) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->columns(array(
            "t_idtransaksi", "t_nourut", "t_jmlhpajak", 't_tglpendataan'
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "b.t_idobjek = a.t_idwpobjek", array(
            "t_nop", "t_namaobjek", "s_namajenis", 't_namawp', 't_npwpdwp'
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_penghapusansanksi"
                ), "c.t_idketetapan = a.t_idtransaksi", array(
            "*"
                ), $select::JOIN_LEFT);
        $where = new Where();
//        $where->literal("a.t_tglpembayaran is null and a.t_jenispajak in (4,8) and c.t_idkeberatan is null");
//        $where->literal("a.t_tglpembayaran is null and a.t_jenispajak not in (1,2,3,5,6,7,9) and c.t_idkeberatan is null");
        $where->literal("a.t_tgljatuhtempo < '" . date('Y-m-d') . "'");
        $where->literal("a.t_tglpembayaran is null");
        if ($parametercari->t_nop != '')
            $where->literal("t_nop ILIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpdwp != '')
            $where->literal("t_npwpdwp ILIKE '%$parametercari->t_npwpdwp%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp ILIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_nopenetapan ILIKE '%$parametercari->t_nopenetapan%'");

        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSkpdkb(KeberatanBase $base, $parametercari) {
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
            "d" => "t_keberatan"
                ), "d.t_idketetapan = a.t_idskpdkb", array(
            "t_idkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkb is null and d.t_idkeberatan is null");
        if ($parametercari->t_nop != '')
            $where->literal("t_nop ILIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp ILIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdkb ILIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpdkb(KeberatanBase $base, $offset, $parametercari) {
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
            "d" => "t_keberatan"
                ), "d.t_idketetapan = a.t_idskpdkb", array(
            "t_idkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkb is null and d.t_idkeberatan is null");

        if ($parametercari->t_nop != '')
            $where->literal("t_nop ILIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp ILIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdkb ILIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSkpdkbt(KeberatanBase $base, $parametercari) {
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
            "d" => "t_keberatan"
                ), "d.t_idketetapan = a.t_idskpdkbt", array(
            "t_idkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkbt = null and d.t_idkeberatan is null");
        if ($parametercari->t_nop != '')
            $where->literal("t_nop ILIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp ILIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdkbt ILIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpdkbt(KeberatanBase $base, $offset, $parametercari) {
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
            "d" => "t_keberatan"
                ), "d.t_idketetapan = a.t_idskpdkbt", array(
            "t_idkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdkbt = null and d.t_idkeberatan is null");

        if ($parametercari->t_nop != '')
            $where->literal("t_nop ILIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp ILIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdkbt ILIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridCountSkpdt(KeberatanBase $base, $parametercari) {
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
            "d" => "t_keberatan"
                ), "d.t_idketetapan = a.t_idskpdt", array(
            "t_idkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdt = null and d.t_idkeberatan is null");
        if ($parametercari->t_nop != '')
            $where->literal("t_nop ILIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp ILIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdt ILIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSkpdt(KeberatanBase $base, $offset, $parametercari) {
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
            "d" => "t_keberatan"
                ), "d.t_idketetapan = a.t_idskpdt", array(
            "t_idkeberatan"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("a.t_tglbayarskpdt = null and d.t_idkeberatan is null");

        if ($parametercari->t_nop != '')
            $where->literal("t_nop ILIKE '%$parametercari->t_nop%'");
        if ($parametercari->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$parametercari->t_namaobjek%'");
        if ($parametercari->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$parametercari->t_npwpd%'");
        if ($parametercari->t_namawp != '')
            $where->literal("t_namawp ILIKE '%$parametercari->t_namawp%'");
        if ($parametercari->t_nopenetapan != '')
            $where->literal("t_noskpdt ILIKE '%$parametercari->t_nopenetapan%'");
        $select->where($where);
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataKetetapanForPenghapusan($t_idketetapan, $t_jenisketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $where = new Where();
        if ($t_jenisketetapan == 2) {
            $select->from(array(
                "a" => "t_transaksi"
            ));
            $select->columns(array(
                "t_idwpobjek", "t_idtransaksi", "t_nopenetapan" => "t_nourut", "t_jmlhpajak", 't_tglpenetapan'=>'t_tglpendataan', "t_tgljatuhtempo", "t_jenispajak"
            ));
            $select->join(array(
                "b" => "view_wpobjek"
                    ), "b.t_idobjek = a.t_idwpobjek", array(
                "t_nop", "t_namaobjek", "s_namajenis", 't_namawp', 't_npwpdwp', "t_alamatlengkapobjek", "t_alamat_lengkapwp"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "c" => "t_keberatan"
                    ), "c.t_idketetapan = a.t_idtransaksi", array(
                "t_idkeberatan"
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
                't_idwpobjek' => 't_idobjek', 't_namawp', 't_npwpdwp', "t_nop", "t_namaobjek", "t_alamat_lengkapwp", "t_alamatlengkapobjek"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "d" => "t_keberatan"
                    ), "d.t_idketetapan = a.t_idskpdkb", array(
                "t_idkeberatan"
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
                't_idwpobjek' => 't_idobjek', 't_namawp', 't_npwpdwp', "t_nop", "t_namaobjek", "t_alamat_lengkapwp", "t_alamatlengkapobjek"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "d" => "t_keberatan"
                    ), "d.t_idketetapan = a.t_idskpdkbt", array(
                "t_idkeberatan"
                    ), $select::JOIN_LEFT);
            $where->literal("a.t_tglbayarskpdkbt = null and d.t_idkeberatan is null and a.t_idskpdkb=$t_idketetapan");
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
                't_idwpobjek' => 't_idobjek', 't_namawp', 't_npwpdwp', "t_nop", "t_namaobjek", "t_alamat_lengkapwp", "t_alamatlengkapobjek"
                    ), $select::JOIN_LEFT);
            $select->join(array(
                "d" => "t_keberatan"
                    ), "d.t_idketetapan = a.t_idskpdt", array(
                "t_idkeberatan"
                    ), $select::JOIN_LEFT);
            $where->literal("a.t_tglbayarskpdt = null and d.t_idkeberatan is null and a.t_idskpdkb=$t_idketetapan");
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataPenghapusanID($t_idhapussanksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_penghapusansanksi"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwpobjek = b.t_idobjek", array(
            "t_nop", "t_namaobjek", "t_alamatlengkapobjek",
            "t_npwpdwp", "t_namawp", "t_alamat_lengkapwp", "s_namajenis"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idhapussanksi', $t_idhapussanksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    
    public function getDatabyIDPenghapusanSkpd($t_idhapussanksi, $t_jenisketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_penghapusansanksi"
        ));
        $select->join(array(
            "b" => "t_transaksi"
                ), "a.t_idketetapan = b.t_idtransaksi", array(
            "t_idtransaksi", "t_jmlhpajak", "t_nopenetapan"=>"t_nourut", "t_tglpenetapan", "t_tgljatuhtempo", "t_periodepajak", "t_kodebayar"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wpobjek"
                ), "b.t_idwpobjek = c.t_idobjek", array(
            "t_nop", "t_namaobjek", "t_alamatlengkapobjek",
            "t_npwpdwp", "t_namawp", "t_alamat_lengkapwp", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_jenissurat"
                ), "e.s_idsurat = a.t_jenisketetapan", array(
            "s_namasingkatsurat"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idhapussanksi', $t_idhapussanksi);
        $where->equalTo('a.t_jenisketetapan', $t_jenisketetapan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDatabyIDPenghapusanSkpdkb($t_idhapussanksi, $t_jenisketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        
        $select->from(array(
            "a" => "t_penghapusansanksi"
        ));
        $select->join(array(
            "b" => "t_skpdkb"
                ), "b.t_idskpdkb = a.t_idketetapan", array(
            't_idtransaksi' => 't_idskpdkb', "t_nopenetapan" => "t_noskpdkb", "t_jmlhpajak" => "t_jmlhpajakskpdkb", "t_tglpenetapan" => "t_tglskpdkb", "t_tgljatuhtempo" => "t_tgljatuhtemposkpdkb", "t_idskpdkb", "t_periodepajak"=>"t_periodeskpdkb"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_wpobjek"
                ), "a.t_idwpobjek = d.t_idobjek", array(
            "t_nop", "t_namaobjek", "t_alamatlengkapobjek",
            "t_npwpdwp", "t_namawp", "t_alamat_lengkapwp"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "f" => "s_jenissurat"
                ), "f.s_idsurat = a.t_jenisketetapan", array(
            "s_namasingkatsurat"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idhapussanksi', $t_idhapussanksi);
        $where->equalTo('a.t_jenisketetapan', $t_jenisketetapan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataIdPenghapusan($t_idhapussanksi, $t_jenisketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_penghapusansanksi"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwpobjek = b.t_idobjek", array(
            "*"
                ), $select::JOIN_LEFT);
        if($t_jenisketetapan == 2){
            $select->join(array(
            "c" => "t_transaksi"
                ), "a.t_idketetapan = c.t_idtransaksi", array(
            "t_nopenetapan"=>"t_nourut", "t_tglpenetapan"=>"t_tglpendataan", "t_tgljatuhtempo", "t_jmlhpajak", "t_jenispajak"
                ), $select::JOIN_LEFT);
        }elseif($t_jenisketetapan == 5){
            $select->join(array(
            "c" => "t_skpdkb"
                ), "a.t_idketetapan = c.t_idskpdkb", array(
            "t_nopenetapan" => "t_noskpdkb", "t_tglpenetapan" => "t_tglskpdkb", "t_tgljatuhtempo" => "t_tgljatuhtemposkpdkb", "t_jmlhpajak" => "t_jmlhpajakskpdkb"
                ), $select::JOIN_LEFT);
        }
        
        $where = new Where();
        $where->equalTo('a.t_idhapussanksi', (int) $t_idhapussanksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDatabyIDKeberatan($t_idketetapan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_keberatan"
        ));
        $select->order('t_idkeberatan asc');
        $where = new Where();
        $where->equalTo('a.t_idketetapan', $t_idketetapan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    
}
