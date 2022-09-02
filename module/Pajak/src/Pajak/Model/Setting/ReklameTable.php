<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\Sql\Insert;

class ReklameTable extends AbstractTableGateway
{

    protected $table = 's_reklamejenis';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new ReklameBase());
        $this->initialize();
    }

    public function getdata()
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function checkExist(ReklameBase $kc)
    {
        $rowset = $this->select(array('s_kodekec' => $kc->s_kodekec));
        $row = $rowset->current();
        return $row;
    }

    public function checkId(ReklameBase $kc)
    {
        $rowset = $this->select(array('s_idreklame' => $kc->s_idreklame));
        $row = $rowset->current();
        return $row;
    }

    public function urutanreklame()
    {
        $sql = "select max(s_idreklamejenis) as s_idreklamejenis from s_reklamejenis";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function savedata(ReklameBase $kc, $session)
    {
        $a = $this->urutanreklame();
        $s_urut = $a['s_idreklamejenis'] + 1;
        $data = array(
            's_namareklamejenis' => $kc->s_namareklamejenis,
            's_idrekening' => $kc->s_idrekening,
            's_permanen' => str_ireplace(".", "", $kc->s_permanen),
            's_njop' => str_ireplace(".", "", $kc->s_njop),
            's_urut' => $s_urut,
        );
        $id = (int) $kc->s_idreklamejenis;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $this->update($data, array('s_idreklamejenis' => $kc->s_idreklamejenis));
        }

        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_reklamejenis");
        $select->columns(array(
            "s_idreklamejenis"
        ));
        $where = new Where();
        $where->equalTo('s_urut', $data['s_urut']);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function savestrategis(ReklameBase $kc, $idreklamejenis, $session)
    {
        $kawasan1 = 1;
        $kawasan2 = 2;
        $kawasan3 = 3;
        $kawasan4 = 4;

        if (!empty($kc->s_idreklamejenis)) {
            $id = intval($kc->s_idreklamejenis);
        } else {
            $id = intval($idreklamejenis['s_idreklamejenis']);
        }

        if (!empty($kc->kawasan1) || $kc->kawasan1 != 0) {
            $nilaistrategis1 = $kc->kawasan1;
        } else {
            $nilaistrategis1 = 0;
        }
        if (!empty($kc->kawasan2) || $kc->kawasan2 != 0) {
            $va2 = ",
        (" . $id . ",
        " . $kawasan2 . ",
        " . str_ireplace(".", "", $kc->kawasan2) . ")";
        }
        if (!empty($kc->kawasan3) || $kc->kawasan3 != 0) {
            $va3 = ",
        (" . $id . ",
        " . $kawasan3 . ",
        " . str_ireplace(".", "", $kc->kawasan3) . ")";
        }
        if (!empty($kc->kawasan4) || $kc->kawasan4 != 0) {
            $va4 = ",
        (" . $id . ",
        " . $kawasan4 . ",
        " .   str_ireplace(".", "", $kc->kawasan4) . ")";
        }

        if (!empty($kc->s_idreklamejenis)) {
            $a = "DELETE FROM s_nilaistrategis WHERE s_idreklamejenis = $kc->s_idreklamejenis ;";
            $b = $this->adapter->query($a);
            $c = $b->execute();

            $sql = "insert into 
            s_nilaistrategis
            (
                s_idreklamejenis,
                s_idreklamelokasi,
                s_harga
            ) values (" . $id . ",
        " . $kawasan1 . ",
        " . str_ireplace(".", "", $nilaistrategis1) . ") $va2 $va3 $va4 ";
        } else {
            $sql = "insert into 
            s_nilaistrategis
            (
                s_idreklamejenis,
                s_idreklamelokasi,
                s_harga
            ) values (" . $id . ",
        " . $kawasan1 . ",
        " . str_ireplace(".", "", $nilaistrategis1) . ") $va2 $va3 $va4 ";
        }
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getJenisRekalame($s_idkorek)
    {
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from('s_reklame_jenis');
        $where = new Where();
        $where->equalTo('s_idkorek', $s_idkorek);
        $select->where($where);
        $prep = $sql->prepareStatementForSqlObject($select)->execute();
        return $prep->current();
    }
    public function savedatatarifsupiori(ReklameBase $kc, $session, $s_idjenisreklame)
    {
        $data = array(
            's_idjenisreklame' => intval($s_idjenisreklame),
            // 's_njopr' =>intval(str_ireplace(".", "", $kc->s_njopr)),
            // 's_nspr' => intval(str_ireplace(".", "", $kc->s_nspr)),
            // 's_nsr' => intval(str_ireplace(".", "", $kc->s_nsr)),
            // 's_kodejangkawaktu' => intval($kc->s_kodejangkawaktu),
            // 's_keterangan' => $kc->s_keterangan,
            // 's_satuan'=>2
        );

        $sql = "insert into s_reklame_tarif_supiori(s_idjenisreklame,s_njopr,s_nspr,s_nsr,s_kodejangkawaktu,s_keterangan,s_satuan) values(" . intval($s_idjenisreklame) . "," . intval(str_ireplace(".", "", $kc->s_njopr)) . "," . intval(str_ireplace(".", "", $kc->s_nspr)) . "," . intval(str_ireplace(".", "", $kc->s_nsr)) . "," . intval($kc->s_kodejangkawaktu) . ",'$kc->s_keterangan','m2')";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        //  var_dump($sql);exit();
        return $res->current(); //exit();
        //   $id = (int) $kc->s_idtarifsupiori;
        //   if ($id == 0) {
        //      print_r($data);
        //       $tabelInsert = new TableGateway('s_reklame_tarif_supiori', $this->adapter);
        //       $tabelInsert->insert($data);


        //   } else {
        //     $tabelInsert = new TableGateway('s_reklame_tarif_supiori', $this->adapter);
        //     $tabelInsert->update($data, array('s_idtarifsupiori' => $kc->s_idtarifsupiori));
        // }

    }

    public function savedatasticker($post)
    {
        $sql = new Sql($this->getAdapter());
        $update = $sql->update();
        $update->table('s_reklame_stiker');

        $data = array(
            's_nsrstiker' => $post->s_nsrstiker,
        );
        $update->set($data);
        $id = (int) $post->s_idstiker;
        $where = new Where();
        $where->equalTo('s_idstiker', $id);
        $update->where($where);
        return $sql->prepareStatementForSqlObject($update)->execute();
    }

    public function savedataselebaran($post)
    {
        $sql = new Sql($this->getAdapter());
        $update = $sql->update();
        $update->table('s_reklame_selebaran');

        $data = array(
            's_nsrselebaran' => $post->s_nsrselebaran,
        );
        $update->set($data);
        $id = (int) $post->s_idselebaran;
        $where = new Where();
        $where->equalTo('s_idselebaran', $id);
        $update->where($where);
        return $sql->prepareStatementForSqlObject($update)->execute();
    }

    public function savedataberjalan($post)
    {
        $sql = new Sql($this->getAdapter());
        $update = $sql->update();
        $update->table('s_reklame_berjalan');

        $data = array(
            's_nsrberjalan' => $post->s_nsrberjalan,
        );
        $update->set($data);
        $id = (int) $post->s_idberjalan;
        $where = new Where();
        $where->equalTo('s_idberjalan', $id);
        $update->where($where);
        return $sql->prepareStatementForSqlObject($update)->execute();
    }

    public function savedatabiayapemasangan($post)
    {
        $sql = new Sql($this->getAdapter());
        $update = $sql->update();
        $update->table('s_reklame_biayapemasangan');

        $data = array(
            's_biayapemasangan' => $post->s_biayapemasangan,
        );
        $update->set($data);
        $id = (int) $post->s_jenisreklame;
        $where = new Where();
        $where->equalTo('s_jenisreklame', $id);
        $update->where($where);
        return $sql->prepareStatementForSqlObject($update)->execute();
    }

    public function savedatakelompokjalan($post)
    {
        $sql = new Sql($this->getAdapter());
        $update = $sql->update();
        $update->table('s_reklame_kelompokjalan');

        $data = array(
            's_hargadasarlokasi' => $post->s_hargadasarlokasi,
            's_skorlokasi' => $post->s_skorlokasi,
        );
        $update->set($data);
        $id = (int) $post->s_idkelompokjalan;
        $where = new Where();
        $where->equalTo('s_idkelompokjalan', $id);
        $update->where($where);
        return $sql->prepareStatementForSqlObject($update)->execute();
    }

    public function savedataskorukuran($post)
    {
        $sql = new Sql($this->getAdapter());
        $update = $sql->update();
        $update->table('s_reklame_skorukuran');

        $data = array(
            's_skor' => $post->s_skor,
        );
        $update->set($data);
        $id = (int) $post->s_idskorukuran;
        $where = new Where();
        $where->equalTo('s_idskorukuran', $id);
        $update->where($where);
        return $sql->prepareStatementForSqlObject($update)->execute();
    }

    public function savedatasudutpandang($post)
    {
        $sql = new Sql($this->getAdapter());
        $update = $sql->update();
        $update->table('s_reklame_sudutpandang');

        $data = array(
            's_skorsudutpandang' => $post->s_skorsudutpandang,
        );
        $update->set($data);
        $id = (int) $post->s_idsudutpandang;
        $where = new Where();
        $where->equalTo('s_idsudutpandang', $id);
        $update->where($where);
        return $sql->prepareStatementForSqlObject($update)->execute();
    }

    public function checkEmpty()
    {
        $resultSet = $this->select();
        return $resultSet->count();
    }

    public function getGridCount(ReklameBase $base, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();

        // $select->from(array(
        //     "a" => "s_reklamejenis"
        // ));
        // $select->join(array(
        //     "b" => "view_rekening"
        // ), "a.s_idrekening = b.s_idkorek", array(
        //     "korek", "s_namakorek"
        // ), $select::JOIN_LEFT);

        $select->from(array(
            "a" => "s_reklamejenis"
        ));
        $select->join(array(
            "b" => "view_rekening"
        ), "a.s_idrekening = b.s_idkorek", array(
            "s_namakorek"
        ), $select::JOIN_LEFT);
        $select->order("a.s_idreklamejenis");





        $where = new Where();
        if ($post->t_jenisreklame != '')
            $where->literal("a.s_namajenis ILIKE '%$post->t_jenisreklame%'");
        if ($post->t_namarekening != '')
            $where->literal("b.s_namakorek ILIKE '%$post->t_namarekening%'");
        // if ($post->t_satuan != '')
        //     $where->literal("a.s_ket ILIKE '%$post->t_satuan%'");
        if ($post->t_tarif != '')
            $where->literal("a.s_njop::text like '$post->t_tarif%'");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(ReklameBase $base, $offset, $post)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "s_reklamejenis"
        ));
        $select->join(array(
            "b" => "view_rekening"
        ), "a.s_idrekening = b.s_idkorek", array(
            "s_namakorek"
        ), $select::JOIN_LEFT);
        $select->order("a.s_idreklamejenis");
        $where = new Where();
        if ($post->t_jenisreklame != '')
            $where->literal("a.s_namareklamejenis ILIKE '%$post->t_jenisreklame%'");
        if ($post->t_namarekening != '')
            $where->literal("b.s_namakorek ILIKE '%$post->t_namarekening%'");
        // if ($post->t_satuan != '')
        //     $where->literal("a.s_ket ILIKE '%$post->t_satuan%'");
        if ($post->t_tarif != '')
            $where->literal("a.s_njop::text like '$post->t_tarif%'");
        $select->where($where);
        $select->order("a.s_idreklamejenis asc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridStickerCount(ReklameBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_stiker');
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
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

    public function getGridStickerData(ReklameBase $base, $offset)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_stiker');
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $select->where($where);
        if ($base->sortasc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortasc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            }
        } else {
            $select->order("s_idstiker asc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridSelebaranCount(ReklameBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_selebaran');
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
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

    public function getGridSelebaranData(ReklameBase $base, $offset)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_selebaran');
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $select->where($where);
        if ($base->sortasc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortasc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            }
        } else {
            $select->order("s_idselebaran asc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridBerjalanCount(ReklameBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_berjalan');
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
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

    public function getGridBerjalanData(ReklameBase $base, $offset)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_berjalan');
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $select->where($where);
        if ($base->sortasc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortasc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            }
        } else {
            $select->order("s_idberjalan asc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridBiayapemasanganCount(ReklameBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_biayapemasangan');
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
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

    public function getGridBiayapemasanganData(ReklameBase $base, $offset)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_biayapemasangan');
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("LOWER($base->combocari::text) LIKE LOWER('%$base->kolomcari%')");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $select->where($where);
        if ($base->sortasc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortasc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            }
        } else {
            $select->order("s_jenisreklame asc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }


    public function getDataId($id)
    {
        $rowset = $this->select(array('s_idreklamejenis' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function getDataStrategis($id)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 's_nilaistrategis'
        ));
        $select->join(array(
            "b" => "s_reklamejenis"
        ), "a.s_idreklamejenis = b.s_idreklamejenis", array(
            "s_njop"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.s_idreklamejenis', $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $resultSet = new ResultSet();
        $resultSet->initialize($res);
        return $resultSet->toArray();
    }

    public function getDataIdReklame($id)
    {
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from('s_reklame_jenis');
        $where = new Where();
        $where->equalTo('s_idjenis', (int) $id);
        $select->where($where);
        $prep = $sql->prepareStatementForSqlObject($select)->execute();
        return $prep->current();
    }

    public function getDataStickerId($id)
    {
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from('s_reklame_stiker');
        $where = new Where();
        $where->equalTo('s_idstiker', $id);
        $select->where($where);
        $prep = $sql->prepareStatementForSqlObject($select)->execute();
        //        $resultset = new ResultSet();
        //        $resultset->initialize($prep);
        return $prep->current();
    }

    public function getDataSelebaranId($id)
    {
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from('s_reklame_selebaran');
        $where = new Where();
        $where->equalTo('s_idselebaran', $id);
        $select->where($where);
        $prep = $sql->prepareStatementForSqlObject($select)->execute();
        //        $resultset = new ResultSet();
        //        $resultset->initialize($prep);
        return $prep->current();
    }

    public function getDataBerjalanId($id)
    {
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from('s_reklame_berjalan');
        $where = new Where();
        $where->equalTo('s_idberjalan', $id);
        $select->where($where);
        $prep = $sql->prepareStatementForSqlObject($select)->execute();
        //        $resultset = new ResultSet();
        //        $resultset->initialize($prep);
        return $prep->current();
    }

    public function getDataBiayapemasanganId($id)
    {
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from('s_reklame_biayapemasangan');
        $where = new Where();
        $where->equalTo('s_jenisreklame', $id);
        $select->where($where);
        $prep = $sql->prepareStatementForSqlObject($select)->execute();
        //        $resultset = new ResultSet();
        //        $resultset->initialize($prep);
        return $prep->current();
    }

    public function getDataKelompokjalanId($id)
    {
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from('s_reklame_kelompokjalan');
        $where = new Where();
        $prep = $sql->prepareStatementForSqlObject($select)->execute();
        //        $resultset = new ResultSet();
        //        $resultset->initialize($prep);
        return $prep;
    }

    public function getDataSkorukuran($id)
    {
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from('s_reklame_skorukuran');
        $where = new Where();
        $prep = $sql->prepareStatementForSqlObject($select)->execute();
        //        $resultset = new ResultSet();
        //        $resultset->initialize($prep);
        return $prep;
    }

    public function getDataSudutpandang($id)
    {
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from('s_reklame_sudutpandang');
        $where = new Where();
        $prep = $sql->prepareStatementForSqlObject($select)->execute();
        //        $resultset = new ResultSet();
        //        $resultset->initialize($prep);
        return $prep;
    }

    public function getDataKode($kode)
    {
        $rowset = $this->select(array('s_kodekec' => $kode));
        $row = $rowset->current();
        return $row;
    }

    public function hapusData($id)
    {
        $this->delete(array('s_idreklamejenis' => $id));
        $a = "DELETE FROM s_nilaistrategis WHERE s_idreklamejenis = $id ;";
        $b = $this->adapter->query($a);
        $c = $b->execute();
    }

    public function comboBox()
    {
        $resultSet = $this->select();
        return $resultSet;
    }

    public function getIdReklame($kd)
    {
        $resultSet = $this->select(array('s_kodekec' => $kd));
        return $resultSet->current();
    }

    public function getdaftarkecamatan()
    {
        $sql = "select * from s_kecamatan order by s_kodekec asc";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getDataReklameByIdRekening($s_idrekening)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame');
        $select->columns(array(
            's_idreklame', 's_namareklame'
        ));
        $where = new Where();
        $where->equalTo('s_idrekeningreklame', (int) $s_idrekening);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataTarifReklame($t_jenisreklame)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklamejenis');
        $where = new Where();
        $where->equalTo('s_idreklamejenis', (int) $t_jenisreklame);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDetailJenisReklame($idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailreklame"
        ));
        $select->join(array(
            "b" => "s_reklamejenis"
        ), "a.t_jenisreklame = b.s_idreklamejenis", array(
            "s_namareklamejenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_rekening"
        ), "b.s_idrekening = c.s_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('t_idtransaksi', (int) $idtransaksi);
        $select->where($where);
        $select->order('a.t_iddetailreklame');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataIdKorek($id)
    {
        $sql = new Sql($this->getAdapter());
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        $where->equalTo('s_idrekening', (int) $id);
        $select->where($where);
        $select->order("s_idreklamejenis asc");
        $res = $sql->prepareStatementForSqlObject($select)->execute();
        return $res;
    }

    public function getNilaiStrategis($t_jenisreklame, $t_kelasjalan)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_nilaistrategis');
        $where = new Where();
        $where->equalTo('s_idreklamejenis', (int) $t_jenisreklame);
        $where->equalTo('s_idreklamelokasi', (int) $t_kelasjalan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataTarifSupiori($s_idjenisreklame, $s_kodejangkawaktu)
    {
        // var_dump($s_idjenisreklame);var_dump($s_kodejangkawaktu);exit();

        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_tarif_supiori');
        $where = new Where();
        $where->equalTo('s_idjenisreklame', (int) $s_idjenisreklame);
        $where->equalTo('s_kodejangkawaktu', (int) $s_kodejangkawaktu);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        // var_dump($res);exit();
        return $res;
    }

    public function comboidSudutpandang()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_sudutpandang');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $combo = [];
        foreach ($res as $col => $row) :
            $combo[$row['s_idsudutpandang']] = $row['s_idsudutpandang'] . ' || ' . $row['s_namasudutpandang'];
        endforeach;
        return $combo;
    }

    public function comboidWilayah()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_wilayah');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $combo = [];
        foreach ($res as $col => $row) :
            $combo[$row['s_idwilayah']] = $row['s_nama'];
        endforeach;
        return $combo;
    }

    public function comboidZona()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_index_zona');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $combo = [];
        foreach ($res as $col => $row) :
            $combo[$row['s_idindex']] = $row['s_keterangan'];
        endforeach;
        return $combo;
    }

    public function combojalan($s_klasifikasilokasi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklamelokasi');
        $where = new Where();
        $where->equalTo('s_klasifikasilokasi', (int) $s_klasifikasilokasi);
        $select->where($where);
        $select->order('s_namareklamelokasi asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $combo = [];
        foreach ($res as $col => $row) :
            $combo[$row['s_idreklamelokasi']] = $row['s_namareklamelokasi'];
        endforeach;
        return $combo;
    }

    // public function comboidJenisReklame()
    // {
    //     $sql = new Sql($this->adapter);
    //     $select = $sql->select();
    //     $select->from('s_reklamejenis');
    //     $select->order('s_idreklamejenis asc');
    //     $state = $sql->prepareStatementForSqlObject($select);
    //     $res = $state->execute();
    //     $combo = [];
    //     foreach ($res as $col => $row) :
    //         $combo[$row['s_idreklamejenis']] = str_pad($row['s_idreklamejenis'], 2, "0", STR_PAD_LEFT) . ' || ' . $row['s_namareklamejenis'];
    //     endforeach;
    //     return $combo;
    // }

    public function comboidJenisReklame($a)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklamejenis');
        $where = new Where();
        $where->equalTo('s_idrekening', (int) $a);
        $select->where($where);
        $select->order('s_idreklamejenis asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $combo = [];
        foreach ($res as $col => $row) :
            $combo[$row['s_idreklamejenis']] =  $row['s_namareklamejenis'];
        endforeach;
        return $combo;
    }

    public function getComboJenisReklame($kode_kawasan)
    {

        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_jenis');
        $where = new Where();
        $where->equalTo('s_kodekawasan', (int) $kode_kawasan);
        $select->where($where);
        $select->order('s_idjenis asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
    public function comboKawasan($kode_kawasan)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_kawasan');
        $where = new Where();
        $where->equalTo('s_kodekawasan', (int) $kode_kawasan);
        $select->where($where);
        $select->order('s_idkawasan asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $combo = [];
        foreach ($res as $col => $row) :
            $combo[$row['s_idkawasan']] = $row['s_kawasan'] . ' || ' . $row['s_lokasi'];
        endforeach;

        return $combo;
    }
    public function comboLokasi($kode_kawasan)
    {
        //var_dump($kode_kawasan);exit();

        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_kawasan');
        $where = new Where();
        $where->equalTo('s_kodekawasan', (int) $kode_kawasan);
        $select->where($where);
        $select->order('s_idkawasan asc');
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
    public function comboidKlasifikasijalan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_klarifikasi_jalan');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $combo = [];
        foreach ($res as $col => $row) :
            $combo[$row['s_idklj']] = $row['s_idklj'] . ' || ' . $row['s_nama'];
        endforeach;
        return $combo;
    }

    public function getTarifTinggi($tinggi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_tarif_tinggi');
        $where = new Where();
        $where->literal('s_tinggi_min <= ' . $tinggi . ' and s_tinggi_max > ' . $tinggi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }


    public function getIndexZona($id)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_index_zona');
        $where = new Where();
        $where->equalTo('s_idindex', (int) $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getIndexMuka($id)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_sudutpandang');
        $where = new Where();
        $where->equalTo('s_idsudutpandang', (int) $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getIndexTinggi($tinggi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_index_tinggi');
        $where = new Where();
        if ($tinggi == 3) {
            $where->literal('s_tinggi_min <= ' . $tinggi . ' and s_tinggi_max <= ' . $tinggi);
        } else {
            $where->literal('s_tinggi_min <= ' . $tinggi . ' and s_tinggi_max >= ' . $tinggi);
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }


    public function getTarifNJOPR($s_idkorek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_njopr');
        $where = new Where();
        $where->equalTo('s_idkorek', (int) $s_idkorek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }


    public function getTarifReklame($idreklame)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_tarif');
        $where = new Where();
        $where->equalTo('s_idtarif', (int)$idreklame);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataZonaWIlayah($id)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_zonawilayah');
        $where = new Where();
        $where->equalTo('s_zona', (int) $id);
        $select->where($where);
        $select->order('s_nourut asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getTarifNSPR($idnspr)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_tarif_klarifikasi');
        $where = new Where();
        $where->equalTo('s_idtarif', (int)$idnspr);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getTarifKawasan($idkawasan)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_tarif_kawasan');
        $where = new Where();
        $where->equalTo('s_idtarif', (int)$idkawasan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataZona($idkawasan)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_index_zona');
        $where = new Where();
        $where->equalTo('s_idindex', (int) $idkawasan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getTarifSticker($luas)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_stiker');
        $where = new Where();
        $where->literal('s_luasstiker_min <= ' . $luas . ' and s_luasstiker_max >= ' . $luas);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getTarifSelebaran($luas)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_selebaran');
        $where = new Where();
        $where->literal('s_luasselebaran_min <= ' . $luas . ' and s_luasselebaran_max >= ' . $luas);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getTarifBerjalan($jeniskendaraan, $tipewaktu)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_berjalan');
        $where = new Where();
        $where->equalTo('s_jeniskendaraan', $jeniskendaraan);
        $where->equalTo('s_masareklame', $tipewaktu);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getKoefisienJalan($kelompokjalan)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_kelompokjalan');
        $where = new Where();
        $where->equalTo('s_idkelompokjalan', $kelompokjalan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getKoefisienJenis($jenisreklame, $jenisreklameusaha, $luas)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_koefisienjenis');
        $where = new Where();
        $where->equalTo('s_jenisreklame', $jenisreklame);
        $where->equalTo('s_tipereklame', $jenisreklameusaha);
        $where->literal("s_luasreklame_min < " . $luas . " and s_luasreklame_max >= $luas");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getKoefisienSudutpandang($sudutpandang)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_sudutpandang');
        $where = new Where();
        $where->equalTo('s_idsudutpandang', $sudutpandang);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getBiayaPemasangan($jenisreklame)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_biayapemasangan');
        $where = new Where();
        $where->equalTo('s_jenisreklame', $jenisreklame);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getKoefisienLamapemasangan($masareklame)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_koefisienpemasangan');
        $where = new Where();
        $where->literal("s_lamapemasangan_min <=" . $masareklame . " and s_lamapemasangan_max >=" . $masareklame);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getKoefisienUkuran($luas)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklame_skorukuran');
        $where = new Where();
        $where->literal("s_ukuran_min <=" . $luas . " and s_ukuran_max >=" . $luas);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function comboid_rangeukuran($t_jenisreklame)
    {
        $sql = "SELECT * FROM s_reklamenilaiukuran WHERE s_idjenisreklame='$t_jenisreklame'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        $no = 1;
        $combo = [];
        foreach ($res as $col => $row) :
            $combo[$row['s_idukurannilaireklame']] = $no++ . ' || ' . $row['s_keteranganukuran'];
        endforeach;
        return $combo;
    }
}
