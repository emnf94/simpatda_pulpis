<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Sql\Insert;

class MinerbaTable extends AbstractTableGateway {

    protected $table = 's_minerba_jenis';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new MinerbaBase());
        $this->initialize();
    }

    public function getdata() {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    // public function checkExist(MinerbaBase $kc) {
    //     $rowset = $this->select(array('s_kodekec' => $kc->s_kodekec));
    //     $row = $rowset->current();
    //     return $row;
    // }

    public function checkId(MinerbaBase $kc) {
        $rowset = $this->select(array('s_idjenisminerba' => $kc->s_idjenis));
        $row = $rowset->current();
        return $row;
    }

    // public function savedata(MinerbaBase $kc, $session) {
    //     $data = array(
    //         's_namajenisminerba' => $kc->s_namajenisminerba,
    //         's_idkorek' => $kc->s_idkorek,
    //         's_idzona'=> $kc->s_idzona,
    //         's_keterangan' => $kc->s_keterangan,
    //         's_harga' => str_ireplace(".", "", $kc->s_harga),
    //         // 's_masa'=>$kc->s_masa
    //     );
    //   // var_dump($data);exit();
    //     $id = (int) $kc->s_idjenisminerba;
    //     if ($id == 0) {
    //         $this->insert($data);
    //     } else {
    //         $this->update($data, array('s_idjenisminerba' => $kc->s_idjenisminerba));
    //     }
    // }

    public function savedata(MinerbaBase $kc, $session) {
        // var_dump($kc);exit();
        $data = array(
            // 's_idjenis' => $kc->s_idjenis,
            's_namajenisminerba' => $kc->s_nama,
            's_idkorek' => $kc->s_idkorek,
            's_idzona'=> $kc->s_kodekawasan,
            's_keterangan' => $kc->s_ket,
            's_harga' => str_ireplace(".", "", $kc->s_tarif),
            // 's_masa'=>$kc->s_masa
        );
        $id = (int) $kc->s_idjenis;
      // var_dump($id);exit();
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idjenisminerba' => $kc->s_idjenis));
        }
    }

    public function getJenisMinerba($s_idkorek){
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from('s_minerba_jenis');
        $where = new Where();
        $where->equalTo('s_idkorek', $s_idkorek);
        $select->where($where);
        $prep = $sql->prepareStatementForSqlObject($select)->execute();
        return $prep->current();
    }

    // public function savedatatarifsupiori(ReklameBase $kc, $session, $s_idjenisreklame) {
    //     $data = array(
    //         's_idjenisreklame' => intval($s_idjenisreklame),
    //         // 's_njopr' =>intval(str_ireplace(".", "", $kc->s_njopr)),
    //         // 's_nspr' => intval(str_ireplace(".", "", $kc->s_nspr)),
    //         // 's_nsr' => intval(str_ireplace(".", "", $kc->s_nsr)),
    //         // 's_kodejangkawaktu' => intval($kc->s_kodejangkawaktu),
    //         // 's_keterangan' => $kc->s_keterangan,
    //         // 's_satuan'=>2
    //     );

    //     $sql="insert into s_reklame_tarif_supiori(s_idjenisreklame,s_njopr,s_nspr,s_nsr,s_kodejangkawaktu,s_keterangan,s_satuan) values(".intval($s_idjenisreklame).",".intval(str_ireplace(".", "", $kc->s_njopr)).",".intval(str_ireplace(".", "", $kc->s_nspr)).",".intval(str_ireplace(".", "", $kc->s_nsr)).",".intval($kc->s_kodejangkawaktu).",'$kc->s_keterangan','m2')";
    //     $statement = $this->adapter->query($sql);
    //      $res = $statement->execute();
    //      //  var_dump($sql);exit();
    //      return $res->current(); //exit();
    //   //   $id = (int) $kc->s_idtarifsupiori;
    //   //   if ($id == 0) {
    //   //      print_r($data);
    //   //       $tabelInsert = new TableGateway('s_reklame_tarif_supiori', $this->adapter);
    //   //       $tabelInsert->insert($data);

           
    //   //   } else {
    //   //     $tabelInsert = new TableGateway('s_reklame_tarif_supiori', $this->adapter);
    //   //     $tabelInsert->update($data, array('s_idtarifsupiori' => $kc->s_idtarifsupiori));
    //   // }
       
    // }

    // public function savedatasticker($post) {
    //     $sql = new Sql($this->getAdapter());
    //     $update = $sql->update();
    //     $update->table('s_reklame_stiker');

    //     $data = array(
    //         's_nsrstiker' => $post->s_nsrstiker,
    //     );
    //     $update->set($data);
    //     $id = (int) $post->s_idstiker;
    //     $where = new Where();
    //     $where->equalTo('s_idstiker', $id);
    //     $update->where($where);
    //     return $sql->prepareStatementForSqlObject($update)->execute();
    // }

    // public function savedataselebaran($post) {
    //     $sql = new Sql($this->getAdapter());
    //     $update = $sql->update();
    //     $update->table('s_reklame_selebaran');

    //     $data = array(
    //         's_nsrselebaran' => $post->s_nsrselebaran,
    //     );
    //     $update->set($data);
    //     $id = (int) $post->s_idselebaran;
    //     $where = new Where();
    //     $where->equalTo('s_idselebaran', $id);
    //     $update->where($where);
    //     return $sql->prepareStatementForSqlObject($update)->execute();
    // }

    // public function savedataberjalan($post) {
    //     $sql = new Sql($this->getAdapter());
    //     $update = $sql->update();
    //     $update->table('s_reklame_berjalan');

    //     $data = array(
    //         's_nsrberjalan' => $post->s_nsrberjalan,
    //     );
    //     $update->set($data);
    //     $id = (int) $post->s_idberjalan;
    //     $where = new Where();
    //     $where->equalTo('s_idberjalan', $id);
    //     $update->where($where);
    //     return $sql->prepareStatementForSqlObject($update)->execute();
    // }

    // public function savedatabiayapemasangan($post) {
    //     $sql = new Sql($this->getAdapter());
    //     $update = $sql->update();
    //     $update->table('s_reklame_biayapemasangan');

    //     $data = array(
    //         's_biayapemasangan' => $post->s_biayapemasangan,
    //     );
    //     $update->set($data);
    //     $id = (int) $post->s_jenisreklame;
    //     $where = new Where();
    //     $where->equalTo('s_jenisreklame', $id);
    //     $update->where($where);
    //     return $sql->prepareStatementForSqlObject($update)->execute();
    // }

    // public function savedatakelompokjalan($post) {
    //     $sql = new Sql($this->getAdapter());
    //     $update = $sql->update();
    //     $update->table('s_reklame_kelompokjalan');

    //     $data = array(
    //         's_hargadasarlokasi' => $post->s_hargadasarlokasi,
    //         's_skorlokasi' => $post->s_skorlokasi,
    //     );
    //     $update->set($data);
    //     $id = (int) $post->s_idkelompokjalan;
    //     $where = new Where();
    //     $where->equalTo('s_idkelompokjalan', $id);
    //     $update->where($where);
    //     return $sql->prepareStatementForSqlObject($update)->execute();
    // }

    // public function savedataskorukuran($post) {
    //     $sql = new Sql($this->getAdapter());
    //     $update = $sql->update();
    //     $update->table('s_reklame_skorukuran');

    //     $data = array(
    //         's_skor' => $post->s_skor,
    //     );
    //     $update->set($data);
    //     $id = (int) $post->s_idskorukuran;
    //     $where = new Where();
    //     $where->equalTo('s_idskorukuran', $id);
    //     $update->where($where);
    //     return $sql->prepareStatementForSqlObject($update)->execute();
    // }

    // public function savedatasudutpandang($post) {
    //     $sql = new Sql($this->getAdapter());
    //     $update = $sql->update();
    //     $update->table('s_reklame_sudutpandang');

    //     $data = array(
    //         's_skorsudutpandang' => $post->s_skorsudutpandang,
    //     );
    //     $update->set($data);
    //     $id = (int) $post->s_idsudutpandang;
    //     $where = new Where();
    //     $where->equalTo('s_idsudutpandang', $id);
    //     $update->where($where);
    //     return $sql->prepareStatementForSqlObject($update)->execute();
    // }

    public function checkEmpty() {
        $resultSet = $this->select();
        return $resultSet->count();
    }

    public function getGridCount(MinerbaBase $base, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "s_minerba_jenis"
        ));
        $select->join(array(
            "b" => "view_rekening"
                ), "a.s_idkorek = b.s_idkorek", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        if ($post->s_jenisminerba != '')
            $where->literal("a.s_namajenisminerba ILIKE '%$post->s_jenisminerba%'");
        if ($post->s_namarekening != '')
            $where->literal("b.s_namakorek ILIKE '%$post->s_namarekening%'");
        if ($post->s_kawasan != '')
            $where->literal("a.s_idzona::text like '%$post->s_kawasan%'");
        if ($post->s_harga != '')
            $where->literal("a.s_harga ILIKE '%$post->s_harga%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();

        return $res->count();
    }

//             s_namajenisminerba: $('#s_jenisminerba_cari_0').val(),
//             s_namarekening: $('#s_namarekening_cari_0').val(),
//             s_kawasan: $('#s_kawasan_cari_0').val(),
//             s_harga: $('#s_harga_cari_0').val(),
//             s_keterangan: $('#s_keterangan_cari_0').val()

    public function getGridData(MinerbaBase $base, $offset, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "s_minerba_jenis"
        ));
        $select->join(array(
            "b" => "view_rekening"
                ), "a.s_idkorek = b.s_idkorek", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        if ($post->s_namajenisminerba != '')
            $where->literal("a.s_namajenisminerba ILIKE '%$post->s_namajenisminerba%'");
        if ($post->s_namarekening != '')
            $where->literal("b.s_namakorek ILIKE '%$post->s_namarekening%'");
        if ($post->s_kawasan != '')
            $where->literal("a.s_idzona::text like '%$post->s_kawasan%'");
        if ($post->s_harga != '')
            $where->literal("a.s_harga LIKE '%$post->s_harga%'");
        if ($post->s_keterangan != '')
            $where->literal("a.s_keterangan ILIKE '%$post->s_keterangan%'");
        $select->where($where);
        $select->order("a.s_idjenisminerba asc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        // var_dump($state);exit();
        $res = $state->execute();
        return $res;
    }

    // public function getGridStickerCount(ReklameBase $base) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_stiker');
    //     $where = new Where();
    //     if ($base->kolomcari != 'undefined') {
    //         if ($base->combocari != "undefined") {
    //             if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
    //                 $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
    //             } elseif ($base->combooperator == "carisama") {
    //                 $where->equalTo($base->combocari, $base->kolomcari);
    //             }
    //         }
    //     }
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     return $res->count();
    // }

    // public function getGridStickerData(ReklameBase $base, $offset) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_stiker');
    //     $where = new Where();
    //     if ($base->kolomcari != 'undefined') {
    //         if ($base->combocari != "undefined") {
    //             if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
    //                 $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
    //             } elseif ($base->combooperator == "carisama") {
    //                 $where->equalTo($base->combocari, $base->kolomcari);
    //             }
    //         }
    //     }
    //     $select->where($where);
    //     if ($base->sortasc != 'undefined') {
    //         if ($base->combosorting != "undefined") {
    //             $select->order("$base->combosorting $base->sortasc");
    //         }
    //     } elseif ($base->sortdesc != 'undefined') {
    //         if ($base->combosorting != "undefined") {
    //             $select->order("$base->combosorting $base->sortdesc");
    //         }
    //     } else {
    //         $select->order("s_idstiker asc");
    //     }
    //     $select->limit($base->rows = (int) $base->rows);
    //     $select->offset($offset = (int) $offset);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     return $res;
    // }

    // public function getGridSelebaranCount(ReklameBase $base) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_selebaran');
    //     $where = new Where();
    //     if ($base->kolomcari != 'undefined') {
    //         if ($base->combocari != "undefined") {
    //             if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
    //                 $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
    //             } elseif ($base->combooperator == "carisama") {
    //                 $where->equalTo($base->combocari, $base->kolomcari);
    //             }
    //         }
    //     }
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     return $res->count();
    // }

    // public function getGridSelebaranData(ReklameBase $base, $offset) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_selebaran');
    //     $where = new Where();
    //     if ($base->kolomcari != 'undefined') {
    //         if ($base->combocari != "undefined") {
    //             if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
    //                 $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
    //             } elseif ($base->combooperator == "carisama") {
    //                 $where->equalTo($base->combocari, $base->kolomcari);
    //             }
    //         }
    //     }
    //     $select->where($where);
    //     if ($base->sortasc != 'undefined') {
    //         if ($base->combosorting != "undefined") {
    //             $select->order("$base->combosorting $base->sortasc");
    //         }
    //     } elseif ($base->sortdesc != 'undefined') {
    //         if ($base->combosorting != "undefined") {
    //             $select->order("$base->combosorting $base->sortdesc");
    //         }
    //     } else {
    //         $select->order("s_idselebaran asc");
    //     }
    //     $select->limit($base->rows = (int) $base->rows);
    //     $select->offset($offset = (int) $offset);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     return $res;
    // }

    // public function getGridBerjalanCount(ReklameBase $base) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_berjalan');
    //     $where = new Where();
    //     if ($base->kolomcari != 'undefined') {
    //         if ($base->combocari != "undefined") {
    //             if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
    //                 $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
    //             } elseif ($base->combooperator == "carisama") {
    //                 $where->equalTo($base->combocari, $base->kolomcari);
    //             }
    //         }
    //     }
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     return $res->count();
    // }

    // public function getGridBerjalanData(ReklameBase $base, $offset) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_berjalan');
    //     $where = new Where();
    //     if ($base->kolomcari != 'undefined') {
    //         if ($base->combocari != "undefined") {
    //             if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
    //                 $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
    //             } elseif ($base->combooperator == "carisama") {
    //                 $where->equalTo($base->combocari, $base->kolomcari);
    //             }
    //         }
    //     }
    //     $select->where($where);
    //     if ($base->sortasc != 'undefined') {
    //         if ($base->combosorting != "undefined") {
    //             $select->order("$base->combosorting $base->sortasc");
    //         }
    //     } elseif ($base->sortdesc != 'undefined') {
    //         if ($base->combosorting != "undefined") {
    //             $select->order("$base->combosorting $base->sortdesc");
    //         }
    //     } else {
    //         $select->order("s_idberjalan asc");
    //     }
    //     $select->limit($base->rows = (int) $base->rows);
    //     $select->offset($offset = (int) $offset);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     return $res;
    // }

    // public function getGridBiayapemasanganCount(ReklameBase $base) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_biayapemasangan');
    //     $where = new Where();
    //     if ($base->kolomcari != 'undefined') {
    //         if ($base->combocari != "undefined") {
    //             if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
    //                 $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
    //             } elseif ($base->combooperator == "carisama") {
    //                 $where->equalTo($base->combocari, $base->kolomcari);
    //             }
    //         }
    //     }
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     return $res->count();
    // }

    // public function getGridBiayapemasanganData(ReklameBase $base, $offset) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_biayapemasangan');
    //     $where = new Where();
    //     if ($base->kolomcari != 'undefined') {
    //         if ($base->combocari != "undefined") {
    //             if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
    //                 $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
    //             } elseif ($base->combooperator == "carisama") {
    //                 $where->equalTo($base->combocari, $base->kolomcari);
    //             }
    //         }
    //     }
    //     $select->where($where);
    //     if ($base->sortasc != 'undefined') {
    //         if ($base->combosorting != "undefined") {
    //             $select->order("$base->combosorting $base->sortasc");
    //         }
    //     } elseif ($base->sortdesc != 'undefined') {
    //         if ($base->combosorting != "undefined") {
    //             $select->order("$base->combosorting $base->sortdesc");
    //         }
    //     } else {
    //         $select->order("s_jenisreklame asc");
    //     }
    //     $select->limit($base->rows = (int) $base->rows);
    //     $select->offset($offset = (int) $offset);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     return $res;
    // }

    public function getDataId($id) {
        $rowset = $this->select(array('s_idjenisminerba' => $id));
        // var_dump($rowset);exit();
        $row = $rowset->current();
        return $row;
    }

    public function getDataIdMinerba($id) {
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from('s_minerba_jenis');
        $where = new Where();
        $where->equalTo('s_idjenisminerba', (int) $id);
        $select->where($where);
        $prep = $sql->prepareStatementForSqlObject($select)->execute();
        // var_dump($prep);exit();
        return $prep->current();
    }
    
//     public function getDataStickerId($id) {
//         $sql = new Sql($this->getAdapter());
//         $select = $sql->select();
//         $select->from('s_reklame_stiker');
//         $where = new Where();
//         $where->equalTo('s_idstiker', $id);
//         $select->where($where);
//         $prep = $sql->prepareStatementForSqlObject($select)->execute();
// //        $resultset = new ResultSet();
// //        $resultset->initialize($prep);
//         return $prep->current();
//     }

//     public function getDataSelebaranId($id) {
//         $sql = new Sql($this->getAdapter());
//         $select = $sql->select();
//         $select->from('s_reklame_selebaran');
//         $where = new Where();
//         $where->equalTo('s_idselebaran', $id);
//         $select->where($where);
//         $prep = $sql->prepareStatementForSqlObject($select)->execute();
// //        $resultset = new ResultSet();
// //        $resultset->initialize($prep);
//         return $prep->current();
//     }

//     public function getDataBerjalanId($id) {
//         $sql = new Sql($this->getAdapter());
//         $select = $sql->select();
//         $select->from('s_reklame_berjalan');
//         $where = new Where();
//         $where->equalTo('s_idberjalan', $id);
//         $select->where($where);
//         $prep = $sql->prepareStatementForSqlObject($select)->execute();
// //        $resultset = new ResultSet();
// //        $resultset->initialize($prep);
//         return $prep->current();
//     }

//     public function getDataBiayapemasanganId($id) {
//         $sql = new Sql($this->getAdapter());
//         $select = $sql->select();
//         $select->from('s_reklame_biayapemasangan');
//         $where = new Where();
//         $where->equalTo('s_jenisreklame', $id);
//         $select->where($where);
//         $prep = $sql->prepareStatementForSqlObject($select)->execute();
// //        $resultset = new ResultSet();
// //        $resultset->initialize($prep);
//         return $prep->current();
//     }

//     public function getDataKelompokjalanId($id) {
//         $sql = new Sql($this->getAdapter());
//         $select = $sql->select();
//         $select->from('s_reklame_kelompokjalan');
//         $where = new Where();
//         $prep = $sql->prepareStatementForSqlObject($select)->execute();
// //        $resultset = new ResultSet();
// //        $resultset->initialize($prep);
//         return $prep;
//     }

//     public function getDataSkorukuran($id) {
//         $sql = new Sql($this->getAdapter());
//         $select = $sql->select();
//         $select->from('s_reklame_skorukuran');
//         $where = new Where();
//         $prep = $sql->prepareStatementForSqlObject($select)->execute();
// //        $resultset = new ResultSet();
// //        $resultset->initialize($prep);
//         return $prep;
//     }

//     public function getDataSudutpandang($id) {
//         $sql = new Sql($this->getAdapter());
//         $select = $sql->select();
//         $select->from('s_reklame_sudutpandang');
//         $where = new Where();
//         $prep = $sql->prepareStatementForSqlObject($select)->execute();
// //        $resultset = new ResultSet();
// //        $resultset->initialize($prep);
//         return $prep;
//     }

    // public function getDataKode($kode) {
    //     $rowset = $this->select(array('s_kodekec' => $kode));
    //     $row = $rowset->current();
    //     return $row;
    // }

    public function hapusData($id) {
        $this->delete(array('s_idjenisminerba' => $id));
    }

    public function comboBox() {
        $resultSet = $this->select();
        return $resultSet;
    }

    // public function getIdReklame($kd) {
    //     $resultSet = $this->select(array('s_kodekec' => $kd));
    //     return $resultSet->current();
    // }

    // public function getdaftarkecamatan() {
    //     $sql = "select * from s_kecamatan order by s_kodekec asc";
    //     $statement = $this->adapter->query($sql);
    //     return $statement->execute();
    // }

    // public function getDataReklameByIdRekening($s_idrekening) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame');
    //     $select->columns(array(
    //         's_idreklame', 's_namareklame'
    //     ));
    //     $where = new Where();
    //     $where->equalTo('s_idrekeningreklame', (int) $s_idrekening);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     return $res;
    // }

    public function getDataTarifMinerba($t_jenisminerba) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_minerba_jenis');
        $where = new Where();
        $where->equalTo('s_idjenisminerba', (int) $t_jenisminerba);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    // public function getDataTarifSupiori($s_idjenisreklame, $s_kodejangkawaktu) {
    //    // var_dump($s_idjenisreklame);var_dump($s_kodejangkawaktu);exit();

    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_tarif_supiori');
    //     $where = new Where();
    //     $where->equalTo('s_idjenisreklame', (int) $s_idjenisreklame);
    //     $where->equalTo('s_kodejangkawaktu', (int) $s_kodejangkawaktu);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //    // var_dump($res);exit();
    //     return $res;
    // }

    // public function comboidSudutpandang() {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_sudutpandang');
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     $combo = [];
    //     foreach ($res as $col => $row):
    //         $combo[$row['s_idsudutpandang']] = $row['s_idsudutpandang'] .' || '.$row['s_namasudutpandang'];
    //     endforeach;
    //     return $combo;
    // }

    // public function comboidWilayah() {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_wilayah');
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     $combo = [];
    //     foreach ($res as $col => $row):
    //         $combo[$row['s_idwilayah']] = $row['s_nama'];
    //     endforeach;
    //     return $combo;
    // }

    // public function comboidZona() {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_index_zona');
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     $combo = [];
    //     foreach ($res as $col => $row):
    //         $combo[$row['s_idindex']] = $row['s_idindex'] .' || '.$row['s_keterangan'];
    //     endforeach;
    //     return $combo;
    // }

    public function comboidJenisMinerba() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_minerba_jenis');
        $select->order('s_idjenisminerba asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $combo = [];
        foreach ($res as $col => $row):
            $combo[$row['s_idjenisminerba']] = str_pad($row['s_idjenisminerba'], 2, "0", STR_PAD_LEFT) .' || '.$row['s_namajenisminerba'];
        endforeach;
        return $combo;
    }

      public function getComboJenisMinerba($combo_kawasan) {
        
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_minerba_jenis');
        $where = new Where();
        $where->equalTo('s_idzona',(int) $combo_kawasan);
        $select->where($where);
        $select->order('s_idjenisminerba asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    public function comboKawasan($combo_kawasan){
        // var_dump($idzona);exit();
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekmin');
        $where = new Where();
        $where->equalTo('s_idzona',(int) $combo_kawasan);
        $select->where($where);
        $select->order('s_idzona asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        // var_dump($state);exit();
        $combo = [];
        foreach ($res as $col => $row):
            $combo[$row['s_idzona']] = $row['korek'].' || '.$row['s_namakorek'];
        endforeach;
    
        return $combo;

    }
    public function comboLokasi($combo_kawasan){
       // var_dump($s_idzona);exit();
     
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_rekmin');
        $where = new Where();
        $where->equalTo('s_idzona',(int) $combo_kawasan);
        $select->where($where);
        $select->order('s_idzona asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        // $combo = [];
        // $no=1;
        // foreach ($res as $col => $row):

        //     $combo[$row['s_idkawasan']] = $row['s_kawasan'].' || '.$row['s_lokasi'];
        // endforeach;
        //var_dump($combo);exit();
        return $res;
    }
    // public function comboidKlasifikasijalan() {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_klarifikasi_jalan');
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     $combo = [];
    //     foreach ($res as $col => $row):
    //         $combo[$row['s_idklj']] = $row['s_idklj'] .' || '.$row['s_nama'];
    //     endforeach;
    //     return $combo;
    // }
    
    // public function getTarifTinggi($tinggi) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_tarif_tinggi');
    //     $where = new Where();
    //     $where->literal('s_tinggi_min <= ' . $tinggi . ' and s_tinggi_max > ' . $tinggi);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }
    

    // public function getIndexZona($id) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_index_zona');
    //     $where = new Where();
    //     $where->equalTo('s_idindex', (int) $id);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }

    // public function getIndexMuka($id) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_sudutpandang');
    //     $where = new Where();
    //     $where->equalTo('s_idsudutpandang', (int) $id);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }

    // public function getIndexTinggi($tinggi) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_index_tinggi');
    //     $where = new Where();
    //     if($tinggi == 3){
    //         $where->literal('s_tinggi_min <= ' . $tinggi . ' and s_tinggi_max <= ' . $tinggi);
    //     }else{
    //         $where->literal('s_tinggi_min <= ' . $tinggi . ' and s_tinggi_max >= ' . $tinggi);
    //     }
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }


    // public function getTarifNJOPR($s_idkorek) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_njopr');
    //     $where = new Where();
    //     $where->equalTo('s_idkorek', (int) $s_idkorek);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }


    // public function getTarifReklame($idreklame) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_tarif');
    //     $where = new Where();
    //     $where->equalTo('s_idtarif', (int)$idreklame);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }
    
    // public function getDataZonaWIlayah($id) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_zonawilayah');
    //     $where = new Where();
    //     $where->equalTo('s_zona', (int) $id);
    //     $select->where($where);
    //     $select->order('s_nourut asc');
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     return $res;
    // }
    
    // public function getTarifNSPR($idnspr) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_tarif_klarifikasi');
    //     $where = new Where();
    //     $where->equalTo('s_idtarif', (int)$idnspr);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }
    
    public function getTarifKawasan($idkawasan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_tarif_kawasan');
        $where = new Where();
        $where->equalTo('s_idtarif',(int)$idkawasan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    public function getDataZona($idkawasan) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_index_zona');
        $where = new Where();
        $where->equalTo('s_idindex',(int) $idkawasan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    
    // public function getTarifSticker($luas) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_stiker');
    //     $where = new Where();
    //     $where->literal('s_luasstiker_min <= ' . $luas . ' and s_luasstiker_max >= ' . $luas);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }

    // public function getTarifSelebaran($luas) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_selebaran');
    //     $where = new Where();
    //     $where->literal('s_luasselebaran_min <= ' . $luas . ' and s_luasselebaran_max >= ' . $luas);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }

    // public function getTarifBerjalan($jeniskendaraan, $tipewaktu) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_berjalan');
    //     $where = new Where();
    //     $where->equalTo('s_jeniskendaraan', $jeniskendaraan);
    //     $where->equalTo('s_masareklame', $tipewaktu);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }

    // public function getKoefisienJalan($kelompokjalan) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_kelompokjalan');
    //     $where = new Where();
    //     $where->equalTo('s_idkelompokjalan', $kelompokjalan);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }

    // public function getKoefisienJenis($jenisreklame, $jenisreklameusaha, $luas) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_koefisienjenis');
    //     $where = new Where();
    //     $where->equalTo('s_jenisreklame', $jenisreklame);
    //     $where->equalTo('s_tipereklame', $jenisreklameusaha);
    //     $where->literal("s_luasreklame_min < " . $luas . " and s_luasreklame_max >= $luas");
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }

    // public function getKoefisienSudutpandang($sudutpandang) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_sudutpandang');
    //     $where = new Where();
    //     $where->equalTo('s_idsudutpandang', $sudutpandang);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }

    // public function getBiayaPemasangan($jenisreklame) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_biayapemasangan');
    //     $where = new Where();
    //     $where->equalTo('s_jenisreklame', $jenisreklame);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }

    // public function getKoefisienLamapemasangan($masareklame) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_koefisienpemasangan');
    //     $where = new Where();
    //     $where->literal("s_lamapemasangan_min <=" . $masareklame . " and s_lamapemasangan_max >=" . $masareklame);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }

    // public function getKoefisienUkuran($luas) {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklame_skorukuran');
    //     $where = new Where();
    //     $where->literal("s_ukuran_min <=" . $luas . " and s_ukuran_max >=" . $luas);
    //     $select->where($where);
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute()->current();
    //     return $res;
    // }

    
}
