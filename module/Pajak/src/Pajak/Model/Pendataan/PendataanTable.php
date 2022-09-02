<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PendataanTable extends AbstractTableGateway
{

    protected $table = 't_transaksi';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PendataanBase());
        $this->initialize();
    }

    public function getPendataanId($t_idtransaksi)
    {
        $rowset = $this->select(array('t_idtransaksi' => $t_idtransaksi));
        $row = $rowset->current();
        return $row;
    }

    // Pendataan SPTPD Self Assesment
    public function simpanpendataanself(PendataanBase $base, $session, $post)
    {


        // // Kode Provinsi dan Kab/Kota
        // $kdProvkabkota = '7141'; // kode ini untuk kode awal 4 digit di idBilling 
        $kdProvkabkota = '6211';

        // Jika Inputan Berupa SKPD Jabatan
        if (!empty($post['t_tarifkenaikan'])) {
            $t_tarifkenaikan = $post['t_tarifkenaikan'];
            $t_jmlhkenaikan = str_ireplace(".", "", $post['t_jmlhkenaikan']);
        } else {
            $t_tarifkenaikan = 0;
            $t_jmlhkenaikan = 0;
        }

        // Pajak Minerba = 6


        //ppj

        if ($post['t_jenisobjekpajak'] == 5) {
            $jmlhpajak = $post['t_jmlhpajak'];
            if ($post['t_klasifikasi'] == 1) {
                $tarifpajak = 7;
                $tarifpersen = $tarifpajak / 100;
                $dasarpengenaan = round((float) str_ireplace(".", "", $post['jumlahbagihasil']) / $tarifpersen);
            } elseif ($post['t_klasifikasi'] == 2 || $post['t_klasifikasi'] == 3) {
                if ($post['t_klasifikasi'] == 2) {
                    $tarifpajak = 1.5;
                } elseif ($post['t_klasifikasi'] == 3) {
                    $tarifpajak = 1;
                }
                $dasarpengenaan = $post['njtl'];
            } elseif ($post['t_klasifikasi'] == 4) {
                $dasarpengenaan = (float) str_ireplace(".", "", $post['njtlutama']) + str_ireplace(".", "", $post['njtlcadangan']) + str_ireplace(".", "", $post['njtldarurat']);
                $tarifpajak = 1;
            }
        } else if ($post['t_jenisobjekpajak'] == 6) {
            $base->t_idkorek = 85;
            $tarifpajak = 20;
            $dasarpengenaan = $base->t_dasarpengenaan;
            $jmlhpajak = $base->t_jmlhpajak;
        } else {
            $jmlhpajak = $base->t_jmlhpajak;
            $dasarpengenaan = $base->t_dasarpengenaan;
            $tarifpajak = $base->t_tarifpajak;
        }

        

        $delay = \Zend\Math\Rand::getString(1, '12345', true);
        sleep($delay);
        // Jatuh Tempo Self Assesment
        $t_tgljatuhtempo = $this->geTglJatuhTempo($post['t_jenisobjekpajak']);
        $t_tgljatuhtempos = date('Y-m-' . $t_tgljatuhtempo['t_akhirbayar'], strtotime("+1 month" . $base->t_masaawal));
        $cekbulan = substr($t_tgljatuhtempos, 5, 2);
        if ($cekbulan == "02") {
            $t_tgljatuhtempofix = date('Y-m-t', strtotime("+1 month" . $base->t_masaawal));
        } else {
            $t_tgljatuhtempofix = date('Y-m-' . $t_tgljatuhtempo['t_akhirbayar'], strtotime("+1 month" . $base->t_masaawal));
        }
        // $t_tgljatuhtempofix = date('Y-m-t', strtotime($base->t_tglpendataan));
        if ((int)$base->t_idkorek == 34 || (int)$base->t_idkorek == 33) {
            $t_tgljatuhtempofix = null;
        }

        $data = array(
            't_idwpobjek' => $base->t_idobjek,
            't_idkorek' => $base->t_idkorek,
            't_jenispajak' => (float) $base->t_jenispajak,
            't_periodepajak' => $base->t_periodepajak,
            't_tglpendataan' => date('Y-m-d', strtotime($base->t_tglpendataan)),
            't_masaawal' => date('Y-m-d', strtotime($base->t_masaawal)),
            't_masaakhir' => date('Y-m-d', strtotime($base->t_masaakhir)),
            't_dasarpengenaan' => (float) str_ireplace(".", "", $dasarpengenaan),
            't_tarifpajak' => (float) $tarifpajak,
            't_jmlhpajak' => (float) $jmlhpajak,
            't_namakegiatan' => $base->t_namakegiatan,
            't_operatorpendataan' => $session['s_iduser'],
            't_tgljatuhtempo' => $t_tgljatuhtempofix,
            't_tarifkenaikan' => (float) $t_tarifkenaikan,
            't_jmlhkenaikan' => (float) $t_jmlhkenaikan,

        );

        

        //katering
        if ($base->t_idkorek == '34' || $base->t_idkorek = 34) {
            $data['t_opdkatering'] = $base->t_opdkatering;
            $data['t_keterangankatering'] = $base->t_keterangankatering;
        }
        // var_dump( $base->t_idtransaksi);
        // die();
        $t_idtransaksi = $base->t_idtransaksi;


        ////////////////////////////////////////////////
        //////   kodebayar awal dengan xml      ////////
        ////////////////////////////////////////////////
        //// 10       = kode dati2(KAB)             //// 41
        //// 10       = kode jenis pajak bphtb      //// JENIS PAJAK
        //// 01       = jenis surat ketetapan SPTPD //// 01
        //// 18       = thn verifikasi kabid        //// 20
        //// 000001   = no ketetapanspt             //// 
        ////////////////////////////////////////////////

        // $ar_pemda->s_kodekabkot . '1001' . date('y') . str_pad($datamax['t_kohirketetapanspt'], 6, "0", STR_PAD_LEFT)
        // 41100120000015 bphtb
        // 4101012000013 tidak
        // 41010120000013 tidak
        // 410101200000013 jadi
        // 821513092000004

        if (empty($t_idtransaksi)) {
            if (!empty($post['t_tarifkenaikan'])) {
                // Kode Bayar 4-SKPD JABATAN
                $jenissurat = $this->getjenissurat(4);
                // No. SKPD Jabatan
                $no = $this->getSkpdjabMax();
                $t_noskpdjab = (int) $no['t_noskpdjab'] + 1;
                $data['t_noskpdjab'] = $t_noskpdjab;
                // $data['t_kodebayar'] = $base->t_periodepajak . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . str_pad($t_noskpdjab, 6, "0", STR_PAD_LEFT); // // // Awal

                // $data['t_kodebayar'] = $kdProvkabkota."".str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT)."".str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak,2) . "" . str_pad($t_noskpdjab, 7, "0", STR_PAD_LEFT); // // // data kodbar XML 

                // $data['t_kodebayar'] = $kdProvkabkota."".str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT)."".str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak,2) . "" . str_pad($t_noskpdjab, 5, "0", STR_PAD_LEFT);

                $data['t_kodebayar'] = $kdProvkabkota . "" . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak, 2) . "" . str_pad($t_noskpdjab, 5, "0", STR_PAD_LEFT); // // // data kodbar JSON

            } else {
                // Kode Bayar Self => 1-SPTPD
                $jenissurat = $this->getjenissurat(1);
                // No. SPTPD
                $no = $this->getPendataanPeriodeMax($base->t_periodepajak);
                $t_nourut = (int) $no['t_nourut'] + 1;
                $data['t_nourut'] = $t_nourut;
                // $data['t_kodebayar'] = $base->t_periodepajak . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . str_pad($t_nourut, 6, "0", STR_PAD_LEFT); // // // Awal

                // $data['t_kodebayar'] = $kdProvkabkota."".str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT)."".str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak,2) . "" . str_pad($t_nourut, 7, "0", STR_PAD_LEFT); // // // data kodbar XML 

                $data['t_kodebayar'] = $kdProvkabkota . "" . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak, 2) . "" . str_pad($t_nourut, 5, "0", STR_PAD_LEFT); // // // data kodbar JSON
                // 82 0902012000002
            }
            $this->insert($data);
        } else {

            $this->update($data, array('t_idtransaksi' => $t_idtransaksi));
        }


        if ($post['t_jenisobjekpajak'] == 6 || $post['t_jenisobjekpajak'] == 5) {
            $sql = new Sql($this->adapter);
            $select = $sql->select();
            $select->from("t_transaksi");
            $select->columns(array(
                "t_idtransaksi"
            ));
            $where = new Where();
            if (!empty($post['t_tarifkenaikan'])) {
                $where->equalTo('t_noskpdjab', $t_noskpdjab);
            }
            $where->equalTo('t_tglpendataan', date('Y-m-d', strtotime($base->t_tglpendataan)));
            $where->equalTo('t_masaawal', date('Y-m-d', strtotime($base->t_masaawal)));
            $where->equalTo('t_masaakhir', date('Y-m-d', strtotime($base->t_masaakhir)));
            if (empty($t_idtransaksi)) {
                $where->equalTo('t_kodebayar', $data['t_kodebayar']);
            } else {
                $where->equalTo('t_idtransaksi', $t_idtransaksi);
            }


            $select->where($where);
            $state = $sql->prepareStatementForSqlObject($select);

            $res = $state->execute()->current();
            return $res;
        }
    }


    public function simpandetailwalet(PendataanBase $base, $session, $post, $data)
    {

        if (empty($data['t_idtransaksi']) || (int)($data['t_idtransaksi']) == 0) {
            $id = $base->t_idtransaksi;
        } else {
            $id = $data['t_idtransaksi'];
        }

        $data = array(
            't_idtransaksi' => (int)$id,
            't_hargapasar' => (int)$post['t_hargapasar'],
            't_volume' => (int)$post['t_volume'],
        );
        if (empty($post['t_iddetailwalet']) || (int)$post['t_iddetailwalet'] == 0) {
            $t_detailwalet = new \Zend\Db\TableGateway\TableGateway('t_detailwalet', $this->adapter);
            $t_detailwalet->insert($data);
        } else {
            $t_detailwalet = new \Zend\Db\TableGateway\TableGateway('t_detailwalet', $this->adapter);
            $t_detailwalet->update($data, array('t_iddetailwalet' => $post['t_iddetailwalet']));
        }
    }

    public function simpanpendataanwalet(PendataanBase $base, $session, $post)
    {


        // Kode Provinsi dan Kab/Kota
        $kdProvkabkota = '6211';

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
        // $t_tgljatuhtempofix = date('Y-m-' . $t_tgljatuhtempo['t_akhirbayar'], strtotime("+1 month" . $base->t_masaawal));
        $t_tgljatuhtempos = date('Y-m-' . $t_tgljatuhtempo['t_akhirbayar'], strtotime("+1 month" . $base->t_masaawal));
        $cekbulan = substr($t_tgljatuhtempos, 5, 2);
        if ($cekbulan == "02") {
            $t_tgljatuhtempofix = date('Y-m-t', strtotime("+1 month" . $base->t_masaawal));
        } else {
            $t_tgljatuhtempofix = date('Y-m-' . $t_tgljatuhtempo['t_akhirbayar'], strtotime("+1 month" . $base->t_masaawal));
        }


        $data = array(
            't_idwpobjek' => $base->t_idobjek,
            't_idkorek' => $base->t_idkorek,
            't_jenispajak' => (float) $base->t_jenispajak,
            't_periodepajak' => (string) $base->t_periodepajak,
            't_tglpendataan' => date('Y-m-d', strtotime($base->t_tglpendataan)),
            't_masaawal' => date('Y-m-d', strtotime($base->t_masaawal)),
            't_masaakhir' => date('Y-m-d', strtotime($base->t_masaakhir)),
            't_tarifdasarkorek' => (float)str_ireplace(".", "", $base->t_tarifdasarkorek),
            't_dasarpengenaan' => (float) str_ireplace(".", "", $base->t_dasarpengenaan),
            't_tarifpajak' => (float) $base->t_tarifpajak,
            't_jmlhpajak' => (float) str_ireplace(".", "", $base->t_jmlhpajak),
            't_operatorpendataan' => $session['s_iduser'],
            't_tgljatuhtempo' => $t_tgljatuhtempofix,
            't_tarifkenaikan' => (float) $t_tarifkenaikan,
            't_jmlhkenaikan' => (float) $t_jmlhkenaikan



        );
        $t_idtransaksi = $base->t_idtransaksi;
        if (empty($t_idtransaksi)) {
            if (!empty($post['t_tarifkenaikan'])) {
                // Kode Bayar 4-SKPD JABATAN
                $jenissurat = $this->getjenissurat(4);
                // No. SKPD Jabatan
                $no = $this->getSkpdjabMax();
                $t_noskpdjab = (int) $no['t_noskpdjab'] + 1;
                $data['t_noskpdjab'] = $t_noskpdjab;
                $data['t_kodebayar'] = $kdProvkabkota . "" . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak, 2) . "" . str_pad($t_noskpdjab, 5, "0", STR_PAD_LEFT); // // // data kodbar JSON

            } else {
                // Kode Bayar Self => 1-SPTPD
                $jenissurat = $this->getjenissurat(1);
                // No. SPTPD
                $no = $this->getPendataanPeriodeMax($base->t_periodepajak);
                $t_nourut = (int) $no['t_nourut'] + 1;
                $data['t_nourut'] = $t_nourut;
                $data['t_kodebayar'] = $kdProvkabkota . "" . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak, 2) . "" . str_pad($t_nourut, 5, "0", STR_PAD_LEFT); // // // data kodbar JSON
                // 82 0902012000002
            }
            $this->insert($data);
        } else {

            $this->update($data, array('t_idtransaksi' => $t_idtransaksi));
        }

        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $select->columns(array(
            "t_idtransaksi"
        ));
        $where = new Where();
        $where->equalTo('t_kodebayar', $data['t_kodebayar']);
        $where->equalTo('t_tglpendataan', date('Y-m-d', strtotime($base->t_tglpendataan)));
        $where->equalTo('t_masaawal', date('Y-m-d', strtotime($base->t_masaawal)));
        $where->equalTo('t_masaakhir', date('Y-m-d', strtotime($base->t_masaakhir)));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    // Pendataan SPTPD Official Assesment
    public function simpanpendataanofficial(PendataanBase $base, $session, $post)
    {

        // Kode Provinsi dan Kab/Kota
        $kdProvkabkota = '6211';

        if (!empty($post['t_tarifkenaikan'])) {
            $t_tarifkenaikan = $post['t_tarifkenaikan'];
            $t_jmlhkenaikan = str_ireplace(".", "", $post['t_jmlhkenaikan']);
        } else {
            $t_tarifkenaikan = 0;
            $t_jmlhkenaikan = 0;
        }
        $delay = \Zend\Math\Rand::getString(1, '12345', true);
        sleep($delay);

        // Jatuh Tempo official Assesment
        $t_tgljatuhtempo = $this->geTglJatuhTempoofficial($post['t_jenisobjekpajak']);
        $t_tgljatuhtempofix = date('Y-m-d', strtotime("+" . $t_tgljatuhtempo['t_jmlharitempo'] . " days" . $base->t_tglpenetapan));

        if (!empty($base->t_dasarpengenaan)) {
            $dasar_pengenaan = str_ireplace(".", "", $base->t_dasarpengenaan);
        } else {
            $dasar_pengenaan = 0;
        }

        // Kode Bayar Official => 2-SKPD
        $jenissurat = $this->getjenissurat(2);
        $data = array(
            't_idwpobjek' => $base->t_idobjek,
            't_idkorek' => $base->t_idkorek,
            't_jenispajak' => $base->t_jenispajak,
            't_periodepajak' => $base->t_periodepajak,
            't_tglpendataan' => date('Y-m-d', strtotime($base->t_tglpendataan)),
            't_masaawal' => date('Y-m-d', strtotime($base->t_masaawal)),
            't_masaakhir' => date('Y-m-d', strtotime($base->t_masaakhir)),
            't_dasarpengenaan' => $dasar_pengenaan, //str_ireplace(".", "", $base->t_dasarpengenaan),
            't_tarifpajak' => $base->t_tarifpajak,
            't_jmlhpajak' => (float)(str_ireplace(".", "", $base->t_jmlhpajak)),
            't_operatorpendataan' => $session['s_iduser'],
            't_tglpenetapan' => date('Y-m-d', strtotime($base->t_tglpenetapan)),
            't_operatorpenetapan' => $session['s_iduser'],
            't_tgljatuhtempo' => $t_tgljatuhtempofix,
            't_tarifkenaikan' => $t_tarifkenaikan,
            't_jmlhkenaikan' => $t_jmlhkenaikan,
            'is_deluserpendataan' => 0
        );

        if ((int)$base->t_jenispajak == 8) {
            $data['t_dasarpengenaan'] = (float)(str_ireplace(".", "", $post['t_npa']));
            // $data['t_lamawaktu']=(int)($post['t_lamawaktu']);
        }
        // var_dump($data);exit();
        if ((int)$base->t_jenispajak == 4 || (int)$base->t_jenispajak == 8) {
            $data['t_kompensasi'] = (float)(str_ireplace(".", "", $post['t_kompensasi']));
            $data['t_jmlhpajakasli'] = (float)(str_ireplace(".", "", $post['t_jmlhpajakasli']));

            //update keberatan tabel
            if (!empty($post['t_idkeberatan'])) {
                $datakeberatan = array(
                    't_statuskompensasi' => 1
                );
                $t_keberatan = new \Zend\Db\TableGateway\TableGateway('t_keberatan', $this->adapter);
                $t_keberatan->update($datakeberatan, array('t_idkeberatan' =>  $post['t_idkeberatan']));
            }
        }

        $t_idtransaksi = $base->t_idtransaksi;
        if (empty($t_idtransaksi)) {
            if (!empty($post['t_tarifkenaikan'])) {
                // Kode Bayar 4-SKPD JABATAN
                $jenissurat = $this->getjenissurat(4);
                // No. SKPD Jabatan
                $no = $this->getSkpdjabMax();
                $t_noskpdjab = (int) $no['t_noskpdjab'] + 1;
                $data['t_noskpdjab'] = $t_noskpdjab;

                $data['t_kodebayar'] = $base->t_periodepajak . "" . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . str_pad($t_noskpdjab, 6, "0", STR_PAD_LEFT);
            } else {
                // Kode Bayar Official => 1-SPTPD
                $jenissurat = $this->getjenissurat(2);
                // No. SKPD

                $t_jenispenetapan = $this->getJenisPenetapan($post['t_jenisobjekpajak']);
                $t_nopenetapan = $this->getNoPenetapan($t_jenispenetapan['s_jenispungutan'], date('Y', strtotime($base->t_tglpenetapan)));
                $data['t_nopenetapan'] = (int) $t_nopenetapan['t_nopenetapan'] + 1;

                // No. SPTPD
                $no = $this->getPendataanPeriodeMax($base->t_periodepajak);
                $t_nourut = (int) $no['t_nourut'] + 1;

                $data['t_nourut'] = $t_nourut;
                //                $data['t_kodebayar'] = $base->t_periodepajak . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . str_pad($t_nourut, 6, "0", STR_PAD_LEFT);
                $data['t_kodebayar'] = $kdProvkabkota . "" . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak, 2) . "" . str_pad($t_nourut, 5, "0", STR_PAD_LEFT);
            }
            $this->insert($data);
        } else {
            if (!empty($post['t_tarifkenaikan'])) {
                // Kode Bayar 4-SKPD JABATAN
                $jenissurat = $this->getjenissurat(4);
                $data['t_noskpdjab'] = $base->t_noskpdjab;
                //                $data['t_kodebayar'] = $base->t_periodepajak . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . str_pad($base->t_noskpdjab, 6, "0", STR_PAD_LEFT);
                $data['t_kodebayar'] = $kdProvkabkota . "" . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak, 2) . "" . str_pad($base->t_noskpdjab, 5, "0", STR_PAD_LEFT);
            } else {
                // Kode Bayar Official => 2-SKPD
                $jenissurat = $this->getjenissurat(2);
                $data['t_nourut'] = $base->t_nourut;
                //                $data['t_kodebayar'] = $base->t_periodepajak . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . str_pad($base->t_nourut, 6, "0", STR_PAD_LEFT);
                $data['t_kodebayar'] = $kdProvkabkota . "" . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak, 2) . "" . str_pad($base->t_nourut, 5, "0", STR_PAD_LEFT);
            }
            $this->update($data, array('t_idtransaksi' => $t_idtransaksi));
        }

        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $select->columns(array(
            "t_idtransaksi"
        ));
        $where = new Where();
        $where->equalTo('t_kodebayar', $data['t_kodebayar']);
        $where->equalTo('t_tglpendataan', date('Y-m-d', strtotime($base->t_tglpendataan)));
        $where->equalTo('t_masaawal', date('Y-m-d', strtotime($base->t_masaawal)));
        $where->equalTo('t_masaakhir', date('Y-m-d', strtotime($base->t_masaakhir)));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function simpanpendataanretribusi(PendataanBase $base, $session, $post)
    {
        // Kode Prov & Kab/Kota
        $kdProvkabkota = '6211';

        $delay = \Zend\Math\Rand::getString(1, '12345', true);
        sleep($delay);

        // Jatuh Tempo Retribusi
        $t_tgljatuhtempo = $this->geTglJatuhTempoRetribusi($post['t_jenisobjekpajak']);
        $t_tgljatuhtempofix = date('Y-m-d', strtotime("+" . $t_tgljatuhtempo['t_jmlharitempo'] . " days" . $base->t_tglpenetapan));

        $t_jenispenetapan = $this->getJenisPenetapan($post['t_jenisobjekpajak']);
        $t_nopenetapan = $this->getNoPenetapan($t_jenispenetapan['s_jenispungutan'], date('Y', strtotime($base->t_tglpenetapan)));
        $t_nopenetapanfix = (int) $t_nopenetapan['t_nopenetapan'] + 1;

        if ($base->t_jenispajak == 25) {
            $dasarpengenaan = str_ireplace(".", "", $base->t_dasarpengenaan);
            $tarifpajak = $base->t_tarifpajak;
        } else {
            $dasarpengenaan = 0;
            $tarifpajak = 0;
        }
        $data = array(
            't_idwpobjek' => $base->t_idobjek,
            't_idkorek' => $base->t_idkorek,
            't_jenispajak' => $base->t_jenispajak,
            't_periodepajak' => $base->t_periodepajak,
            't_tglpendataan' => date('Y-m-d', strtotime($base->t_tglpenetapan)),
            't_tglpenetapan' => date('Y-m-d', strtotime($base->t_tglpenetapan)),
            't_masaawal' => date('Y-m-d', strtotime($base->t_masaawal)),
            't_masaakhir' => date('Y-m-d', strtotime($base->t_masaakhir)),
            't_dasarpengenaan' => $dasarpengenaan,
            't_tarifpajak' => $tarifpajak,
            't_namakegiatan' => $base->t_namakegiatan,
            't_jmlhpajak' => str_ireplace(".", "", $base->t_jmlhpajak),
            't_operatorpendataan' => $session['s_iduser'],
            't_tgljatuhtempo' => $t_tgljatuhtempofix,
            't_tarifkenaikan' => $t_tarifkenaikan,
            't_jmlhkenaikan' => $t_jmlhkenaikan,
            // 't_nopenetapan' => $t_nopenetapanfix
        );


        $t_idtransaksi = $base->t_idtransaksi;
        if (empty($t_idtransaksi)) {
            // Kode Bayar Self => 9-SKRD
            $jenissurat = $this->getjenissurat(9);
            // No. SPTPD
            $no = $this->getPendataanMax($base->t_periodepajak, $base->t_idobjek);
            $t_nourut = (int) $no['t_nourut'] + 1;
            $data['t_nourut'] = $t_nourut;
            $data['t_nopenetapan'] = $t_nopenetapanfix;

            ////////////////////////////////////////////////
            //////   kodebayar awal dengan xml      ////////
            ////////////////////////////////////////////////
            //// 41       = kode kabup                  ////
            //// 10       = kode dati2                  ////
            //// 10       = kode jenis pajak bphtb      ////
            //// 01       = jenis surat ketetapan SPTPD ////
            //// 18       = tgl verifikasi kabid        ////
            //// 000001   = no ketetapanspt             ////
            ////////////////////////////////////////////////

            $data['t_kodebayar'] = $kdProvkabkota . "" . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak, 2) . "" . str_pad($t_nourut, 5, "0", STR_PAD_LEFT); // // // // kodebayar JSON
            $this->insert($data);
        } else {
            // Kode Bayar Self => 9-SKRD
            $jenissurat = $this->getjenissurat(9);
            $t_nourut = $base->t_nourut;
            $data['t_nourut'] = $t_nourut;
            $data['t_kodebayar'] = $kdProvkabkota . "" . str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT) . "" . str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepajak, 2) . "" . str_pad($base->t_nourut, 5, "0", STR_PAD_LEFT);

            $this->update($data, array('t_idtransaksi' => $t_idtransaksi));
        }

        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $select->columns(array(
            "t_idtransaksi"
        ));
        $where = new Where();
        $where->equalTo('t_nourut', $t_nourut);
        $where->equalTo('t_tglpenetapan', date('Y-m-d', strtotime($base->t_tglpenetapan)));
        $where->equalTo('t_masaawal', date('Y-m-d', strtotime($base->t_masaawal)));
        $where->equalTo('t_masaakhir', date('Y-m-d', strtotime($base->t_masaakhir)));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function temukanPendataan($t_idwp)
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

    public function getGridCountSudah(PendataanBase $base, $s_idjenis, $post)
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
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "f" => "view_rekening"
        ), "c.t_idkorek = f.s_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek = ' . $s_idjenis . ' and c.t_tglpendataan is not null');
        $where->notEqualTo("t_nourut", 0);
        if ($post->t_nourut != '')
            $where->literal("c.t_nourut::text LIKE '%$post->t_nourut%'");
        if ($post->t_tglpendataan != '') {
            $t_tgl = explode(' - ', $post->t_tglpendataan);
            $where->literal("c.t_tglpendataan between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
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
        if ($post->t_lokasipemasangan != '')
            $where->literal("e.t_lokasi ILIKE '%$post->t_lokasipemasangan%'");
        if ($post->t_kodebayar != '')
            $where->literal("c.t_kodebayar like '%$post->t_kodebayar%'");
        if ($post->t_rekening != '')
            $where->literal("f.korek ilike '%$post->t_rekening%' OR f.s_namakorek ilike '%$post->t_rekening%'");
        if ($post->t_jmlhpajak != '')
            $where->literal("c.t_jmlhpajak::text like '$post->t_jmlhpajak%'");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("c.t_tglpembayaran");
            } else {
                $where->isNull("c.t_tglpembayaran");
            }
        }
        if ($post->t_pelaporan != '') {
            if ($post->t_pelaporan == 1) {
                $where->equalTo("c.is_esptpd", 1);
            } else {
                $where->equalTo("c.is_esptpd", 0);
            }
        }
        $select->where($where);

        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSudah(PendataanBase $base, $offset, $s_idjenis, $post)
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
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_jenispungutan"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jenispajak", "t_masaawal", "t_masaakhir", "is_esptpd", "t_kodebayar"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_users"
        ), "c.t_operatorpendataan = d.s_iduser", array(
            "s_nama"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "f" => "view_rekening"
        ), "c.t_idkorek = f.s_idkorek", array(
            "korek", "s_namakorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek = ' . $s_idjenis . ' and c.t_tglpendataan is not null');
        $where->notEqualTo("t_nourut", 0);
        if ($post->t_nourut != '')
            $where->literal("c.t_nourut::text LIKE '%$post->t_nourut%'");
        if ($post->t_tglpendataan != '') {
            $t_tgl = explode(' - ', $post->t_tglpendataan);
            $where->literal("c.t_tglpendataan between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
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
        if ($post->t_lokasipemasangan != '')
            $where->literal("e.t_lokasi ILIKE '%$post->t_lokasipemasangan%'");
        if ($post->t_kodebayar != '')
            $where->literal("c.t_kodebayar like '%$post->t_kodebayar%'");
        if ($post->t_jmlhpajak != '')
            $where->literal("c.t_jmlhpajak::text like '$post->t_jmlhpajak%'");
        if ($post->t_rekening != '')
            $where->literal("f.korek ilike '%$post->t_rekening%' OR f.s_namakorek ilike '%$post->t_rekening%'");
        if ($post->t_statusbayar != '') {
            if ($post->t_statusbayar == 1) {
                $where->isNotNull("c.t_tglpembayaran");
            } else {
                $where->isNull("c.t_tglpembayaran");
            }
        }
        if ($post->t_pelaporan != '') {
            if ($post->t_pelaporan == 1) {
                $where->equalTo("c.is_esptpd", 1);
            } else {
                $where->equalTo("c.is_esptpd", 0);
            }
        }
        $select->where($where);
        $select->order('c.t_tglpendataan desc');
        $select->order('c.t_nourut desc');
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        // echo $select->getSqlstring();
        // exit();
        return $res;
    }

    public function getGridCountMasahabis(PendataanBase $base, $s_idjenis, $post)
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
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak"
        ), $select::JOIN_LEFT);
        $where = new Where();
        //        $where->literal("b.t_jenisobjek = " . $s_idjenis . " and c.t_tglpendataan is not null and c.t_masaakhir < '" . date('Y-m-d') . "' ");
        $where->literal("b.t_jenisobjek = " . $s_idjenis . " and c.t_tglpendataan is not null and c.t_masaakhir between now() and (now() + interval '20 day')");
        if ($post->t_nourut != '')
            $where->literal("c.t_nourut::text LIKE '%$post->t_nourut%'");
        if ($post->t_tglpendataan != '') {
            $t_tgl = explode(' - ', $post->t_tglpendataan);
            $where->literal("c.t_tglpendataan between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
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
        if ($post->t_jmlhpajak != '')
            $where->literal("c.t_jmlhpajak::text like '$post->t_jmlhpajak%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataMasahabis(PendataanBase $base, $offset, $s_idjenis, $post)
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
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir"
        ), $select::JOIN_LEFT);
        $where = new Where();
        //        $where->literal("b.t_jenisobjek = " . $s_idjenis . " and c.t_tglpendataan is not null and c.t_masaakhir < '" . date('Y-m-d') . "' ");
        $where->literal("b.t_jenisobjek = " . $s_idjenis . " and c.t_tglpendataan is not null and c.t_masaakhir between now() and (now() + interval '20 day')");
        if ($post->t_nourut != '')
            $where->literal("c.t_nourut::text LIKE '%$post->t_nourut%'");
        if ($post->t_tglpendataan != '') {
            $t_tgl = explode(' - ', $post->t_tglpendataan);
            $where->literal("c.t_tglpendataan between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
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
        if ($post->t_jmlhpajak != '')
            $where->literal("c.t_jmlhpajak::text like '$post->t_jmlhpajak%'");
        $select->where($where);
        $select->order("c.t_nourut asc");
        $select->order("c.t_tglpendataan asc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getGridDataBelumLapor(PendataanBase $base, $s_idjenis, $bln, $thn)
    {
        $tgl = $thn . "-" . $bln . "-01";
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "s_jenisobjek"
        ), "a.t_jenisobjek = b.s_idjenis", array(
            "s_namajenis"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("t_idobjek not in ((
                                        SELECT a.t_idobjek from t_wpobjek a
                                            left join t_transaksi b on b.t_idwpobjek=a.t_idobjek
                                            WHERE a.t_jenisobjek=$s_idjenis  
                                            and EXTRACT(MONTH from b.t_masaawal) = '" . $bln . "' and EXTRACT(YEAR FROM b.t_masaawal) = '" . $thn . "'
                                        ))");
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari LIKE '%$base->kolomcari%'");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $where->notEqualTo('a.t_korekobjek', (int) 33);
        $where->equalTo('a.t_jenisobjek', (int) $s_idjenis);
        $where->equalTo('a.t_statusobjek', true);
        $where->literal("EXTRACT(YEAR FROM a.t_tgldaftarobjek) <= '" . $thn . "'");
        // $where->literal("EXTRACT(MONTH from t_tgldaftarobjek) <= '". $bln ."' and EXTRACT(YEAR FROM t_tgldaftarobjek) <= '". $thn ."'");
        $select->where($where);
        $select->order("a.t_idobjek");
        // echo $select->getSqlstring();
        // exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        //var_dump($state);exit();
        return $res;
    }

    public function getPendataan($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
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
            "*"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPendataanAirByIdTransaksi($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "t_rtobjek", "t_rwobjek", "t_latitudeobjek", "t_longitudeobjek", "t_jenisobjek"
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

    public function getPendataanReklameByIdTransaksi($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "t_rtobjek", "t_rwobjek", "t_latitudeobjek", "t_longitudeobjek", "t_jenisobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_tarifpajak", "t_jmlhpajakasli", "t_kompensasi",
            "t_jmlhpajak"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "t_detailreklame"
        ), "c.t_idtransaksi = d.t_idtransaksi", array('*'), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "s_reklamejenis"
        ), "e.s_idreklamejenis = d.t_jenisreklame", array(
            "s_namareklamejenis"
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

    public function hapusPendataanwalet($id)
    {
        $t_detailwalet = new \Zend\Db\TableGateway\TableGateway('t_detailwalet', $this->adapter);
        $t_detailwalet->delete(array('t_iddetailwalet' => $id));
    }

    public function hapusPendataan($id)
    {

        $this->delete(array('t_idtransaksi' => $id));
    }

    public function hapusSkpdkbJabaran($id)
    {
        $this->delete(array('t_idtransaksi' => $id));
    }

    public function getPendataanSeMasa(PendataanBase $base, $t_idtransaksi)
    {

        // var_dump($t_idtransaksi);exit();
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wpobjek_v2'
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
        //var_dump($state);exit();
        $res = $state->execute()->current();
        return $res;
    }

    public function getPendataanMasapajakAwal(PendataanBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wpobjek_v2'
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "b.t_idwpobjek = a.t_idobjek", array(
            "t_idwpobjek" => "t_idwpobjek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("extract(month from b.t_masaawal) = '" . date('m', strtotime($base->t_masaawal)) . "' and extract(year from b.t_masaawal) = '" . date('Y', strtotime($base->t_masaawal)) . "' and b.t_idwpobjek= " . $base->t_idobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataPendataan($tglpendataan0, $tglpendataan1, $t_kecamatan, $t_kelurahan, $t_idkorek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "t_rtobjek", "t_rwobjek", "t_latitudeobjek", "t_longitudeobjek"
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

    public function getPendataanPembayaran($t_idwp, $month, $tahun)
    {
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

    public function getDataPendataanID($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idkorek", "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_tglpenetapan", "t_dasarpengenaan", "t_tarifpajak", "t_kodebayar", "t_operatorpendataan", "t_namakegiatan", "t_jenissarang", "t_umurbangunan", "t_keterangankatering", "t_opdkatering"
        ), $select::JOIN_LEFT);

        $select->join(array(
            "c" => "view_wp_v3"
        ), "a.t_idwp = c.t_idwp", array(
            "t_nama", "t_alamat", "t_alamat_lengkap", "t_npwpd", "t_kabupaten", "t_rt", "t_rw", "t_alamat"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "b.t_idkorek = d.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek", "s_rinciankorek", "s_sub1korek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_detailppj"
        ), "b.t_idtransaksi = e.t_idtransaksi", array(
            "t_iddetailppj", "t_klasifikasi", "t_hargasatuanlistrik", "t_jumlahbagihasil", "t_jumlahtagihan", "t_biayapemakaian", "t_jumlahkwh", "t_jumlahkvautama", "t_jumlahkvacadangan", "t_jumlahkvadarurat", "t_jamnyalautama", "t_jamnyalacadangan", "t_jamnyaladarurat", "t_faktordaya", "t_tarif",

        ), $select::JOIN_LEFT);

        $where = new Where();
        $where->equalTo('b.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataWPObjek($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idkorek", "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_dasarpengenaan", "t_tarifpajak", "t_kodebayar", "t_operatorpendataan"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp_v3"
        ), "a.t_idwp = c.t_idwp", array(
            "t_nama", "t_alamat", "t_alamat_lengkap", "t_npwpd", "t_kabupaten", "t_rt", "t_rw", "t_alamat"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "b.t_idkorek = d.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek", "s_rinciankorek", "s_sub1korek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idobjek', (int) $t_idobjek);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataDetailMinerba($t_idtransaksi)
    {
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
        $select->join(array(
            "c" => "s_minerba_jenis"
        ), "a.t_idjenis = c.s_idjenisminerba", array(
            "s_namajenisminerba"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);

        $res = $state->execute();
        return $res;
    }

    public function getDataDetailPPJ($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailppj"
        ));
        $select->join(array(
            "b" => "view_rekening"
        ), "a.t_idkorek = b.s_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataDetailParkir($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailparkir"
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

    public function getDataPendataanSebelumnya($t_jenisobjek, $t_idwpobjek, $t_masaawal)
    {
        $date = explode("-", date("Y-m-d", strtotime($t_masaawal . "-1 month")));
        $tgl = $date[2];
        $bln = $date[1];
        $thn = $date[0];
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_dasarpengenaan", "t_tarifpajak", "t_keterangankatering", "t_opdkatering"
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

    public function getPendataanMax($t_idwpobjek)
    {
        $sql = "select max(t_nourut) as t_nourut from t_transaksi where t_idwpobjek='" . $t_idwpobjek . "'";
        $statement = $this->adapter->query($sql);
        // die($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getPendataanPeriodeMax($t_periodepajak)
    {
        $sql = "select max(t_nourut) as t_nourut from t_transaksi where t_periodepajak='" . $t_periodepajak . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getSkpdjabMax()
    {
        $sql = "select max(t_noskpdjab) as t_noskpdjab from t_transaksi";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getPenetapanMax()
    {
        $sql = "select max(t_nopenetapan) as t_nopenetapan from t_transaksi";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function geTglJatuhTempo($t_jenisobjekpajak)
    {
        $sql = "select t_akhirbayar from s_jenisobjek where s_idjenis='" . $t_jenisobjekpajak . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function geTglJatuhTempoofficial($t_jenisobjekpajak)
    {
        $sql = "select t_jmlharitempo from s_jenisobjek where s_idjenis='" . $t_jenisobjekpajak . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function geTglJatuhTempoRetribusi($t_jenisobjekpajak)
    {
        $sql = "select t_jmlharitempo from s_jenisobjek where s_idjenis='" . $t_jenisobjekpajak . "'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
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

    public function getjmlpendataantahun()
    {
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

    public function getjmlpendataan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    //count retribusi
    public function getjmlpendataanRetkesehatan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 12);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetkebersihan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 13);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetcapil()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 14);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetpemakaman()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 15);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetparkir()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 16);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetpasar()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 17);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetkendaraan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 18);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetpemadam()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 19);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetpeta()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 20);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetkakus()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 21);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetlimbahcair()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 22);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetteraulang()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 23);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetpendidikan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 24);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetmenara()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 25);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetkekayaan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 26);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetpasargrosir()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 27);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetpelelangan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 28);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetterminal()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 29);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetkhususparkir()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 30);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetvilla()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 31);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetrmhhewan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 32);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetkepelabuhan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 33);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetrekreasi()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 34);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetnyebrangair()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 35);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetusaha()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 36);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetimb()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 37);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetalkohol()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 38);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetgangguan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 39);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRettrayek()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 40);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRetperikanan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 41);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanHotel()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 1);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanRestoran()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 2);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }
    public function getjmlpendataanHiburan()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 3);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }
    public function getjmlpendataanReklame()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 4);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }
    public function getjmlpendataanPpj()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 5);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanMinerba()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 6);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanParkir()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 7);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanAir()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 8);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getjmlpendataanWalet()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $where = new Where();
        $where->equalTo('is_deluserpendataan', 0);
        $where->equalTo('t_jenispajak', 9);
        $where->literal('t_tglpendataan is not null');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getPendataanSebelumnya($t_idwpobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_keterangankatering", "t_opdkatering"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_rekening"
        ), "b.t_idkorek = c.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek", "t_berdasarmasa"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idobjek', (int) $t_idwpobjek);
        $select->where($where);
        $select->order("t_idtransaksi desc");
        $select->limit(1);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPendataanSebelumnyaABT($t_idwpobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_tglpenetapan"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_detailair"
        ), "c.t_idtransaksi = b.t_idtransaksi", array(
            't_volume',
            't_kodekelompok',
            't_fna',
            't_tarifdasarkorek',
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "b.t_idkorek = d.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idobjek', (int) $t_idwpobjek);
        $select->where($where);
        $select->order("t_idtransaksi desc");
        $select->limit(1);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataPokokPajak($t_idtransaksi)
    {
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
            "t_jmlhpajak" => "t_jmlhpajak",
            "t_tgljatuhtempo" => "t_tgljatuhtempo",
            "t_jenispajak" => "t_jenispajak"
        ));
        $select->join(array(
            "b" => "t_detailminerba"
        ), "b.t_idtransaksi = b.t_idtransaksi", array(
            "tarif_persenminerba" => "t_tarifpersen",
        ), $select::JOIN_LEFT);
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

    public function getDataNppdObjek($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_nourut"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp_v3"
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

    public function getDataNppdSelf($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_dasarpengenaan", "t_tarifpajak", "t_kodebayar", "t_jmlhpembayaran", "t_jmlhdendapembayaran", "t_jmlhbayardenda"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp_v3"
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

    public function getDataNppdOfficial($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_dasarpengenaan", "t_tarifpajak", "t_kodebayar", "t_jmlhpembayaran", "t_jmlhdendapembayaran", "t_jmlhbayardenda"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp_v3"
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

    public function getGridCountSkpdJabatan(PendataanBase $base)
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

    public function getGridDataSkpdJabatan(PendataanBase $base, $offset)
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

    public function getDataPendataanSKPDJab($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $select->join(array(
            "b" => "t_transaksi"
        ), "a.t_idobjek = b.t_idwpobjek", array(
            "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan", "t_tgljatuhtempo", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_jmlhdendapembayaran", "t_dasarpengenaan", "t_tarifpajak", "t_kodebayar", "t_noskpdjab", "t_tarifkenaikan", "t_jmlhkenaikan"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "view_wp_v3"
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

    public function getPendataanRetribusi($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => 'view_wp_v3'
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek",
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_namajenis"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_tglpenetapan", "t_tgljatuhtempo", "t_masaawal", "t_masaakhir", "t_kodebayar", "t_periodepajak", "t_nopenetapan", "t_jenispajak"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "korek", "s_namakorek", "s_rinciankorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getSewaDinas($t_idtransaksi)
    {
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

    public function getPanggungReklame($t_idtransaksi)
    {
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

    public function getTanahReklame($t_idtransaksi)
    {
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

    public function getTanahLain($t_idtransaksi)
    {
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

    public function getGedungOlahraga($t_idtransaksi)
    {
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

    public function getJenisPenetapan($t_jenispajak)
    {
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

    public function getNoPenetapan($t_jenispungutan, $periode)
    {
        if ($t_jenispungutan == 'Pajak') {
            $sql = "select max(t_nopenetapan) as t_nopenetapan from t_transaksi where t_jenispajak in (4,8) and t_periodepajak='" . $periode . "'";
        } elseif ($t_jenispungutan == 'Retribusi') {
            $sql = "select max(t_nopenetapan) as t_nopenetapan from t_transaksi where t_jenispajak not in (4,8) and t_periodepajak='" . $periode . "'";
        }
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getGridCountReklame(PendataanBase $base)
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
        $where->literal('b.t_jenisobjek=4 and c.t_tglpendataan is not null');
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

    public function getGridDataReklame(PendataanBase $base, $offset)
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
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_jenispungutan"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nopenetapan", "t_tglpenetapan", "t_jmlhpajak", "t_tglpembayaran", "t_jenispajak", "t_masaawal", "t_masaakhir", "t_tgljatuhtempo", "t_tglpembayaran"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek=4 and c.t_tglpendataan is not null');
        $where->notEqualTo("t_nourut", 0);
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
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataReklame($t_kecamatan, $awal, $akhir)
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
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_jenispungutan", "t_alamatlengkapobjek"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nopenetapan", "t_tglpenetapan", "t_jmlhpajak", "t_tglpembayaran", "t_jenispajak", "t_masaawal", "t_masaakhir", "t_tgljatuhtempo", "t_tglpembayaran"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek=4 and c.t_tglpendataan is not null');
        $where->notEqualTo("t_nourut", 0);
        if (!empty($t_kecamatan)) {
            $where->equalTo('b.t_kecamatanobjek', $t_kecamatan);
        }
        if (!empty($awal)) {
            $where->between('c.t_masaakhir', $awal, $akhir);
        }
        $select->where($where);

        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataPendataanIDTrans($t_idtransaksi)
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
            "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_dasarpengenaan", "t_tarifpajak", "t_kodebayar", "t_tglpenetapan", "t_tglpembayaran"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek", "s_rinciankorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);

        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getGridCountAllPajak(PendataanBase $base)
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
        $where->literal('c.t_tglpendataan is not null');
        $where->notEqualTo("t_nourut", 0);
        $where->equalTo("b.s_jenispungutan", 'Pajak');
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

    public function getGridDataAllPajak(PendataanBase $base, $offset)
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
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_jenispungutan"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jenispajak", "t_masaawal", "t_masaakhir", "t_tgljatuhtempo", "t_tglpembayaran"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('c.t_tglpendataan is not null');
        $where->notEqualTo("t_nourut", 0);
        $where->equalTo("b.s_jenispungutan", 'Pajak');
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

    public function getDataAllPajak($t_kecamatan, $jenispajak)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp_v3"
        ));
        $select->columns(array(
            "t_npwpd", "t_nama"
        ));
        $select->join(array(
            "b" => "view_wpobjek_v2"
        ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatlengkapobjek", "s_namajenissingkat"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_jmlhpajak", "t_tglpembayaran", "t_masaawal", "t_masaakhir", "t_tgljatuhtempo", "t_tglpembayaran"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('c.t_tglpendataan is not null');
        if (!empty($t_kecamatan)) {
            $where->equalTo('b.t_kecamatanobjek', $t_kecamatan);
        }
        if (!empty($jenispajak)) {
            $where->literal("b.t_jenisobjek in (" . $jenispajak . ")");
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataPendataanIDTransAll($t_idtransaksi)
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
            "t_idkorek", "t_idtransaksi", "t_idwpobjek", "t_nourut", "t_tglpendataan", "t_jmlhpajak", "t_masaawal", "t_masaakhir", "t_periodepajak", "t_dasarpengenaan", "t_tarifpajak", "t_kodebayar", "t_tglpenetapan"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
        ), "c.t_idkorek = d.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek", "s_rinciankorek"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDaftarReklame(PendataanBase $base)
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
            "s_namakecobjek" => "s_namakecobjek", "s_namakelobjek" => "s_namakelobjek", "t_kabupatenobjek", "s_jenispungutan"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
        ), "b.t_idobjek = c.t_idwpobjek", array(
            "*"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "s_users"
        ), "c.t_operatorpendataan = d.s_iduser", array(
            "s_nama"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "e" => "t_detailreklame"
        ), "e.t_idtransaksi = c.t_idtransaksi", array(
            "*"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal('b.t_jenisobjek = 4 and c.t_tglpendataan is not null');
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
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDaftarRegisterPajak($tglawal, $tglakhir, $jenispajak, $statubayar)
    {
        if (!empty($statubayar)) {
            if ($statubayar == 1) {
                $where = 'and a.t_tglpembayaran is null ';
            } elseif ($statubayar == 2) {
                $where = 'and a.t_tglpembayaran is not null ';
            }
        } else {
            $where = '';
        }

        if (!empty($jenispajak)) {
            $where_jenis = "and a.t_jenispajak=" . $jenispajak . " ";
            if ($jenispajak == 4 || $jenispajak == 8) {
                $orderby = 'order by a.t_tglpenetapan,a.t_nopenetapan asc';
            } else {
                $orderby = 'order by a.t_tglpendataan,a.t_nourut asc';
            }
        } else {
            $where_jenis = "";
            $orderby = 'order by a.t_tglpendataan,a.t_nourut asc';
        }


        $sql = "select a.t_periodepajak, a.t_nourut,a.t_jenispajak, b.t_npwpdwp, b.t_namawp,b.t_namaobjek,
            a.t_tglpendataan,a.t_tglpenetapan,a.t_nopenetapan,a.t_masaawal,a.t_masaakhir,a.t_jmlhpajak,
            a.t_tglpembayaran,a.t_tgljatuhtempo,a.is_esptpd,c.s_namakorek,a.t_dasarpengenaan,a.t_noskpdjab
				from t_transaksi a
				left join view_wpobjek_v2 b on b.t_idobjek=a.t_idwpobjek
                                left join view_rekening c on c.s_idkorek=a.t_idkorek
				where a.t_tglpendataan between '" . date('Y-m-d', strtotime($tglawal)) . "' and '" . date('Y-m-d', strtotime($tglakhir)) . "'
				" . $where_jenis . " " . $where . "
				" . $orderby . " ";
        $statement = $this->adapter->query($sql);
        // var_dump($sql);exit();
        return $statement->execute();
    }

    public function getDataTransaksiByPerMasaAkhirpajak($tglcetak, $periode, $jenispajak)
    {
        $tglcetak_thn = date('Y', strtotime($tglcetak));
        $sql = "SELECT c.t_tglpendataan,c.t_nourut,a.t_npwpd,a.t_nama,b.t_namaobjek, a.t_alamat, c.t_jmlhpajak, c.t_nopembayaran, c.t_tglpembayaran, c.t_jmlhpembayaran, c.t_jenispajak, c.t_masaawal, c.t_masaakhir, extract(MONTH FROM c.t_masaawal) as masapajak, extract(YEAR FROM c.t_masaawal) as periodepajak, d.s_namakorek 
                FROM view_wp a
                    LEFT JOIN view_wpobjek_v2 b ON a.t_idwp = b.t_idwp
                    LEFT JOIN t_transaksi c ON b.t_idobjek = c.t_idwpobjek
                    LEFT JOIN view_rekening d ON c.t_idkorek = d.s_idkorek
                WHERE c.t_periodepajak='" . $periode . "' and extract(year from c.t_masaakhir)='" . $tglcetak_thn . "' and b.t_jenisobjek=$jenispajak ORDER BY d.s_idkorek asc";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getdaftarbelumlapor($t_idobjek)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek_v2"
        ));
        $where = new Where();
        $where->literal('a.t_idobjek in(' . $t_idobjek . ')');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getJenisPajak($s_idjenis)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "s_jenisobjek"
        ));
        $where = new Where();
        $where->equalTo('a.s_idjenis', $s_idjenis);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
    public function getrekeningbyidobjek($t_idobjek)
    {
        $sql = "SELECT * FROM view_wpobjek_v2 WHERE t_idobjek='$t_idobjek'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->current();
        return $res;
    }

    public function getdatabyidtransakasi($t_idtransaksi)
    {
        $sql = "SELECT * FROM t_transaksi WHERE t_idtransaksi='$t_idtransaksi'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getKompensasi($t_idwpobjek, $t_jenispajak)
    {
        $sql = "SELECT * from t_keberatan where t_idwpobjek='$t_idwpobjek' and t_jenispajak='$t_jenispajak' and t_statusverifikasi='1' and t_idkeberatan=(
        select max(t_idkeberatan) from t_keberatan where t_idwpobjek='$t_idwpobjek' and t_jenispajak='$t_jenispajak' and t_statusverifikasi='1' and t_statuskompensasi IS NULL LIMIT 1
    ) and t_statuskompensasi IS NULL";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

    public function getPendataanWalet($t_idtransaksi)
    {
        $sql = "SELECT * FROM t_detailwalet WHERE t_idtransaksi='$t_idtransaksi'";
        // die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->current();
        return $res;
    }

    public function getdataupload($t_idtransaksi)
    {
        $sql = "SELECT * FROM t_berkas WHERE t_idtransaksi='$t_idtransaksi'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }
}
