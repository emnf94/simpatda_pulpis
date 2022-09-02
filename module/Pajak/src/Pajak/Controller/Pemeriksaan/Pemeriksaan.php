<?php

namespace Pajak\Controller\Pemeriksaan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Pemeriksaan\PemeriksaanFrm;
use Pajak\Model\Pemeriksaan\PemeriksaanBase;
use Pajak\Form\Pemeriksaan\PemeriksaanPembayaranFrm;
use Pajak\Model\Pemeriksaan\PemeriksaanPembayaranBase;

class Pemeriksaan extends AbstractActionController
{

    public function indexAction()
    {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getdata();
        $records = array();
        foreach ($ar_ttd0 as $ar_ttd0) {
            $records[] = $ar_ttd0;
        }
        $descPendaftaran = $this->Tools()->getService('PendaftaranTable')->getDescTablePendaftaran();
        $recordspendaftaran = array();
        foreach ($descPendaftaran as $descPendaftaran) {
            $recordspendaftaran[] = $descPendaftaran;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'ar_ttd0' => $records,
            'descPendaftaran' => $recordspendaftaran,
        ));
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }

        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak,
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridTransaksiAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Pendataan\PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PemeriksaanTable')->getGridCountTransaksiPokok($base);

        if ($count > 0 && $limit > 0) {
            $total_pages = ceil($count / $limit);
        } else {
            $total_pages = 0;
        }

        if ($page > $total_pages)
            $page = $total_pages;
        $start = $limit * $page - $limit;
        if ($start < 0)
            $start = 0;
        $data = $this->Tools()->getService('PemeriksaanTable')->getGridDataTransaksiPokok($base, $start);
        //        var_dump($base);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $no_sptpd = (!empty($row['t_nourut'])) ? $row['t_nourut'] : $row['t_noskpdjab'] . ' [Jab]';
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SPTPD/SSPD'><center style='color:red'><b>" . $no_sptpd . "/" . $row['t_nopembayaran'] . "</b></center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red'><b>" . $row['t_npwpd'] . "</b></center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            //            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Masa Pajak'><center>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</center></td>";
            $s .= "<td data-title='Tanggal Pendataan'><center>" . date('d-m-Y', strtotime($row['t_tglpembayaran'])) . "</center></td>";
            $s .= "<td data-title='Dasar Pengenaan' style='text-align: right'>" . number_format($row['t_dasarpengenaan'], 0, ',', '.') . "</td>";
            $s .= "<td data-title='Pajak' style='text-align: right'>" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "</td>";
            $s .= "<td data-title='Jenis Pajak'>" . $row['s_namajenis'] . "</td>";
            if ($row['t_jenispajak'] == 4 || $row['t_jenispajak'] == 8) {
                $s .= "<td data-title='#'><center><a href='pemeriksaan/form_pemeriksaanskpdt?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-edit'></i> Pemeriksaan</a></center></td>";
            } else {
                $s .= "<td data-title='#'><center><a href='pemeriksaan/form_pemeriksaan?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-edit'></i> Pemeriksaan</a></center></td>";
            }
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridbelum" => $s,
            "rowsbelum" => $base->rows,
            "countbelum" => $count,
            "pagebelum" => $page,
            "startbelum" => $start,
            "total_halamanbelum" => $total_pages,
            "paginatorebelum" => $datapaging['paginatore'],
            "akhirdatabelum" => $datapaging['akhirdata'],
            "awaldatabelum" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function FormPemeriksaanAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PemeriksaanFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datatransaksi = $this->Tools()->getService('PenetapanTable')->getTransaksiByIdTransaksi($id);
            $datatransaksi['t_tgldaftar'] = date('d-m-Y', strtotime($datatransaksi['t_tgldaftar']));
            $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
            $data->t_idtransaksi = $id;

            $data->t_jenispajak = $datatransaksi['t_jenisobjek'];

            $dataPokok = $this->Tools()->getService('PendataanTable')->getDataPokokPajak($id);
            if ($dataPokok['t_jenispajak'] == 6) {
                $data->t_tarifpajak = $dataPokok['tarif_persenminerba'];
            } else {
                $data->t_tarifpajak = $datatransaksi['t_tarifpajak'];
            }
            $dataPokok['t_jenisketetapan'] = 'SPTPD';
            $dataPokok['t_idketetapan'] = 1;
            $dataSKPDKB = $this->Tools()->getService('SkpdkbTable')->getDataSKPDKB($id);
            $dataSKPDKBT = $this->Tools()->getService('SkpdkbtTable')->getDataSKPDKBT($id);
            $dataSKPDN = $this->Tools()->getService('SkpdnTable')->getDataSKPDN($id);
            $dataSKPDLB = $this->Tools()->getService('SkpdlbTable')->getDataSKPDLB($id);

            $dataketetapan = array($dataPokok, $dataSKPDKB, $dataSKPDKBT, $dataSKPDN, $dataSKPDLB);

            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PemeriksaanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                if (str_ireplace(".", "", $post['t_dasarpengenaan']) < str_ireplace(".", "", $base->t_dasarrevisi)) {
                    $dataskpdkb = $this->Tools()->getService('SkpdkbTable')->cekSKPDKBByIdTransaksi($post['t_idtransaksi']);
                    if ($dataskpdkb == FALSE) {
                        // SKPDKB
                        $this->Tools()->getService('PemeriksaanTable')->simpanskpdkb($base, $session);
                    } else {
                        // SKPDKBT
                        $this->Tools()->getService('PemeriksaanTable')->simpanskpdkbt($base, $session);
                    }
                } elseif (str_ireplace(".", "", $post['t_dasarpengenaan']) == str_ireplace(".", "", $base->t_dasarrevisi)) {
                    // SKPDN
                    $this->Tools()->getService('PemeriksaanTable')->simpanskpdn($base, $session);
                } elseif (str_ireplace(".", "", $post['t_dasarpengenaan']) > str_ireplace(".", "", $base->t_dasarrevisi)) {
                    // SKPDLB
                    $this->Tools()->getService('PemeriksaanTable')->simpanskpdlb($base, $session);
                }
                return $this->redirect()->toRoute('pemeriksaan');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datatransaksi' => $datatransaksi,
            'dataketetapan' => $dataketetapan
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function FormPemeriksaanskpdtAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pemeriksaan\PemeriksaanskpdtFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datatransaksi = $this->Tools()->getService('PenetapanTable')->getTransaksiByIdTransaksi($id);
            $datatransaksi['t_tgldaftar'] = date('d-m-Y', strtotime($datatransaksi['t_tgldaftar']));
            $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
            $data->t_idtransaksi = $id;
            $data->t_tarifpajak = $datatransaksi['s_persentarifkorek'];

            $dataPokok = $this->Tools()->getService('PendataanTable')->getDataPokokPajak($id);
            $dataPokok['t_jenisketetapan'] = 'SPTPD';
            $dataPokok['t_idketetapan'] = 1;
            $dataketetapan = array($dataPokok);
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new \Pajak\Model\Pemeriksaan\PemeriksaanskpdtBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                //                var_dump($base); exit();
                $this->Tools()->getService('PemeriksaanskpdtTable')->simpanskpdt($base, $session);
                return $this->redirect()->toRoute('pemeriksaan');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datatransaksi' => $datatransaksi,
            'dataketetapan' => $dataketetapan
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function pilihketetapanAction()
    {
        /** Pilih Ketetapan
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/01/2017
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $tgljatuhtempo = null;
        switch ($data_get['t_jenisketetapan']) {
            case 1: // SPTPD
                $data = $this->Tools()->getService('PendataanTable')->getDataPokokPajak($data_get['t_idtransaksi']);
                $tgljatuhtempo = $data['t_tgljatuhtempo'];
                break;
            case 5: // SKPDKB
                $data = $this->Tools()->getService('SkpdkbTable')->getDataSKPDKB($data_get['t_idtransaksi']);
                $tgljatuhtempo = $data['t_tgljatuhtempo'];
                break;
            case 6: // SKPDKBT
                $data = $this->Tools()->getService('SkpdkbtTable')->getDataSKPDKBT($data_get['t_idtransaksi']);
                $tgljatuhtempo = $data['t_tgljatuhtempo'];
                break;
            case 7: // SKPDLB
                $data = $this->Tools()->getService('SkpdlbTable')->getDataSKPDLB($data_get['t_idtransaksi']);
                $tgljatuhtempo = NULL;
                break;
            case 8: // SKPDN
                $data = $this->Tools()->getService('SkpdnTable')->getDataSKPDN($data_get['t_idtransaksi']);
                $tgljatuhtempo = NULL;
                break;
            default:
                $data = array(
                    't_tglpendataan' => null,
                    't_dasarpengenaan' => null,
                    't_jmlhpajak' => null,
                );
                break;
        }

        $data_render = array(
            "t_tglpendataan" => date('d-m-Y', strtotime($data['t_tglpendataan'])),
            "t_dasarpengenaan" => number_format($data['t_dasarpengenaan'], 0, ",", "."),
            "t_jmlhpajak" => number_format($data['t_jmlhpajak'], 0, ",", "."),
            "t_tgljatuhtempo" => ($tgljatuhtempo != NULL) ? $tgljatuhtempo : NULL,
            //            "t_jenispajak" => $data['t_jenispajak']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungpemeriksaanAction()
    {
        /** Mendapatkan Data Pemeriksaan
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();


        $t_jmlhselisih = str_ireplace(".", "", $data_get['t_dasarrevisi']) - str_ireplace(".", "", $data_get['t_dasarpengenaan']);
        $t_jmlhpajakseharusnya = str_ireplace(".", "", $data_get['t_dasarrevisi']) * $data_get['t_tarifpajak'] / 100;
        $t_pajak = $t_jmlhselisih * $data_get['t_tarifpajak'] / 100;
        if ($data_get['t_jenisketetapandenda'] == 2) { // tidak ditetapkan denda
            $jmlbulan = 0;
            $jmldenda = 0;
            $t_totalpemeriksaan = number_format($t_pajak, 0, ",", ".");
        } elseif ($data_get['t_jenisketetapandenda'] == 1) { // ditetapkan denda
            $t_masaawal = $data_get['t_tgljatuhtempo'];
            $t_tglskpdkb = $data_get['t_tglpemeriksaan'];

            $ts1 = strtotime($t_masaawal);
            $ts2 = strtotime($t_tglskpdkb);

            $year1 = date('Y', $ts1);
            $year2 = date('Y', $ts2);

            $month1 = date('m', $ts1);
            $month2 = date('m', $ts2);

            $day1 = date('d', $ts1);
            $day2 = date('d', $ts2);
            if ($day1 < $day2) {
                $tambahanbulan = 1;
            } else {
                $tambahanbulan = 0;
            }

            $jmlbulan = (($year2 - $year1) * 12) + ($month2 - $month1 + $tambahanbulan);
            if ($jmlbulan > 24) {
                $jmlbulan = 24;
                $jmldenda = $jmlbulan * (($data_get['t_tarifpersen'] / 100) * $t_pajak);
            } elseif ($jmlbulan <= 0) {
                $jmlbulan = 0;
                $jmldenda = $jmlbulan * (($data_get['t_tarifpersen'] / 100) * $t_pajak);
            } else {
                $jmldenda = $jmlbulan * (($data_get['t_tarifpersen'] / 100) * $t_pajak);
            }
            $t_totalpemeriksaan = number_format($t_pajak + $jmldenda, 0, ",", ".");
        }

        $data_render = array(
            "t_tarifpersen" => ($data_get['t_tarifpersen'] / 100),
            "t_selisihdasar" => number_format($t_jmlhselisih, 0, ",", "."),
            "t_jmlhbln" => $jmlbulan,
            "t_jmlhdendapemeriksaan" => number_format($jmldenda, 0, ",", "."),
            "t_jmlhpajakseharusnya" => number_format($t_jmlhpajakseharusnya, 0, ",", "."),
            "t_jmlhpajakpemeriksaan" => number_format($t_pajak, 0, ",", "."),
            "t_totalpemeriksaan" => $t_totalpemeriksaan
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hitungpemeriksaanskpdtAction()
    {
        /** Mendapatkan Data Pemeriksaan
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_pajak = str_ireplace(".", "", $data_get['t_jmlhpajakseharusnya']) - str_ireplace(".", "", $data_get['t_jmlhpajak']);
        if ($data_get['t_jenisketetapandenda'] == 2) { // tidak ditetapkan denda
            $jmlbulan = 0;
            $jmldenda = 0;
            $t_totalpemeriksaan = $t_pajak;
            if ($data_get['t_jeniskenaikan'] == 1) { // Tetapkan Kenaikan
                $t_tarifkenaikan = 100;
                $t_jmlhkenaikan = $t_pajak;
                $t_totalpemeriksaan = $t_jmlhkenaikan + $t_totalpemeriksaan;
            } elseif ($data_get['t_jeniskenaikan'] == 2) { // Tidak Tetapkan Kenailkan
                $t_tarifkenaikan = 0;
                $t_jmlhkenaikan = 0;
                $t_totalpemeriksaan = $t_totalpemeriksaan;
            }
        } elseif ($data_get['t_jenisketetapandenda'] == 1) { // ditetapkan denda
            $t_masaawal = $data_get['t_masaawal'];
            $t_tglskpdkb = $data_get['t_tglpemeriksaan'];

            $ts1 = strtotime($t_masaawal);
            $ts2 = strtotime($t_tglskpdkb);

            $year1 = date('Y', $ts1);
            $year2 = date('Y', $ts2);

            $month1 = date('m', $ts1);
            $month2 = date('m', $ts2);

            $day1 = date('d', $ts1);
            $day2 = date('d', $ts2);
            if ($day1 < $day2) {
                $tambahanbulan = 1;
            } else {
                $tambahanbulan = 0;
            }

            $jmlbulan = (($year2 - $year1) * 12) + ($month2 - $month1 + $tambahanbulan);
            if ($jmlbulan > 24) {
                $jmlbulan = 24;
                $jmldenda = $jmlbulan * $data_get['t_tarifpersen'] / 100 * $t_pajak;
            } elseif ($jmlbulan <= 0) {
                $jmlbulan = 0;
                $jmldenda = $jmlbulan * $data_get['t_tarifpersen'] / 100 * $t_pajak;
            } else {
                $jmldenda = $jmlbulan * $data_get['t_tarifpersen'] / 100 * $t_pajak;
            }
            $t_totalpemeriksaan = $t_pajak + $jmldenda;
            if ($data_get['t_jeniskenaikan'] == 1) { // Tetapkan Kenaikan
                $t_tarifkenaikan = 100;
                $t_jmlhkenaikan = $t_pajak;
                $t_totalpemeriksaan = $t_jmlhkenaikan + $t_totalpemeriksaan;
            } elseif ($data_get['t_jeniskenaikan'] == 2) { // Tidak Tetapkan Kenailkan
                $t_tarifkenaikan = 0;
                $t_jmlhkenaikan = 0;
                $t_totalpemeriksaan = $t_totalpemeriksaan;
            }
        }

        $data_render = array(
            "t_tarifkenaikan" => $t_tarifkenaikan,
            "t_jmlhkenaikan" => number_format($t_jmlhkenaikan, 0, ',', '.'),
            "t_jmlhbln" => $jmlbulan,
            "t_jmlhdendapemeriksaan" => number_format($jmldenda, 0, ",", "."),
            "t_jmlhpajakpemeriksaan" => number_format($t_pajak, 0, '.', '.'),
            "t_totalpemeriksaan" => number_format($t_totalpemeriksaan, 0, '.', '.')
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }



    public function cetakpembayaranAction()
    {
        /** Cetak Pemeriksaan
         * @param string $tglcetak Tanggal Mencetak Dokumen
         * @param date('d-m-Y') $tglbayar0 Tanggal Minimal Pemeriksaan
         * @param date('d-m-Y') $tglbayar1 Tanggal Maximal Pemeriksaan
         * @param int $t_kecamatan 
         * @param int $t_kelurahan  
         * @param int $t_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PendataanTable')->getDataPemeriksaan($data_get->tglbayar0, $data_get->tglbayar1, $data_get->t_kecamatan, $data_get->t_kelurahan, $data_get->t_idkorek);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglbayar0' => $data_get->tglbayar0,
            'tglbayar1' => $data_get->tglbayar1,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function dataPemeriksaanAction()
    {
        /** Mendapatkan Data Pemeriksaan
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PemeriksaanTable')->getDataPemeriksaanID($data_get['idtransaksi']);
        $data_render = array(
            "idtransaksi" => $data['t_idtransaksi'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat'],
            "tglpembayaran" => date('d-m-Y', strtotime($data['t_tglpembayaran'])),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetaksspdAction()
    {
        /** Cetak SSRD
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PemeriksaanTable')->getDataPemeriksaanID($data_get['idtransaksi']);

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }
}
