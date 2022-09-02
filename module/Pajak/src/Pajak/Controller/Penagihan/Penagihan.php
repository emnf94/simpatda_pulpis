<?php

namespace Pajak\Controller\Penagihan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Penagihan\PenagihanFrm;
use Pajak\Model\Penagihan\PenagihanBase;

class Penagihan extends AbstractActionController {

    public function indexAction() {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }

        $ar_kecamatan = $this->Tools()->getService('KecamatanTable')->getdata();
        $recordskecamatan = array();
        foreach ($ar_kecamatan as $ar_kecamatan) {
            $recordskecamatan[] = $ar_kecamatan;
        }

        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'dataobjek' => $recordspajak,
            'ar_kecamatan' => $recordskecamatan,
            'ar_pejabat' => $recordspejabat
        ));
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridBelumAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Pendataan\PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PenagihanTable')->getGridCountBelum($base);
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
        $data = $this->Tools()->getService('PenagihanTable')->getGridDataBelum($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. Urut'><center>" . $row['t_nourut'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Tanggal Pendataan'><center>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</center></td>";
            $s .= "<td data-title='Masa Pajak'><center>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Pajak' style='text-align: right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            $s .= "<td data-title='Tgl. Jatuh Tempo'><center>" . date('d-m-Y', strtotime($row['t_tgljatuhtempo'])) . "</center></td>";
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
       // var_dump($data_render['gridbelum']);exit();
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridSudahAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new PenagihanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PenagihanTable')->getGridCountSudah($base);
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
        $data = $this->Tools()->getService('PenagihanTable')->getGridDataSudah($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $jatuhtempo = $row['t_tgljatuhtempo'];
            $tglsekarang = date('Y-m-d');

            $ts1 = strtotime($jatuhtempo);
            $ts2 = strtotime($tglsekarang);

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
                $jmldenda = $jmlbulan * 2 / 100 * $row['t_jmlhpajak'];
            } else {
                $jmldenda = $jmlbulan * 2 / 100 * $row['t_jmlhpajak'];
            }

            $pajakterhutang = $row['t_jmlhpajak'] - $row['t_jmlhpembayaran'];
            $denda = (!empty($row['t_tglpembayaran'])) ? $row['t_jmlhbayardenda'] : $jmldenda;
            $dendaterhutang = $denda - $row['t_jmlhbayardenda'];
            $jmlhbulandenda = (!empty($row['t_tglpembayaran'])) ? $row['t_jmlhbulandendapembayaran'] : $jmlbulan; 
//            $dendaterhutang = $row['t_jmlhdendapembayaran'] - $row['t_jmlhbayardenda'];
            $harusdibayar = $pajakterhutang + $dendaterhutang;
            if($harusdibayar>0){
                $harusdibayar = number_format($harusdibayar,0,',','.');
            }else{
                $harusdibayar = '<label style="color:green">Sudah Lunas</label>';
            }
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. Urut'><center>" . $row['t_nourut'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Tanggal Pendataan'><center>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</center></td>";
            $s .= "<td data-title='Masa Pajak'><center>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</center></td>";
            $s .= "<td data-title='Pajak' style='text-align: right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            $s .= "<td data-title='Tgl. Jatuh Tempo'><center>" . date('d-m-Y', strtotime($row['t_tgljatuhtempo'])) . "</center></td>";
            $s .= "<td data-title='Denda'><center>" . $jmlhbulandenda . " bulan / " . number_format($denda, 0, ',', '.') . "</center></td>";
            $s .= "<td data-title='Tunggakan' style='text-align: right'>" . $harusdibayar . "</td>";
            if (!empty($row['t_tglpembayaran']) && empty($row['t_tglbayardenda'])) {
                $s .= "<td data-title='#'><center><button onclick='bukaCetakSTPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak STPD'><i class='glyph-icon icon-print'></i> STPD</button></center></td>";
            } else {
                $s .= "<td data-title='#'><center><button onclick='bukaCetakSTPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak STPD'><i class='glyph-icon icon-print'></i> STPD</button></center></td>";
            }
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator1($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridsudah" => $s,
            "rowssudah" => $base->rows,
            "countsudah" => $count,
            "pagesudah" => $page,
            "startsudah" => $start,
            "total_halamansudah" => $total_pages,
            "paginatoresudah" => $datapaging['paginatore'],
            "akhirdatasudah" => $datapaging['akhirdata'],
            "awaldatasudah" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridSuratTeguranAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new PenagihanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PenagihanTable')->getGridCountSuratTeguran($base);
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
        $data = $this->Tools()->getService('PenagihanTable')->getGridDataSuratTeguran($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $jatuhtempo = $row['t_tgljatuhtempo'];
            $tglsekarang = date('Y-m-d');

            $ts1 = strtotime($jatuhtempo);
            $ts2 = strtotime($tglsekarang);

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

            /* $jmlbulan = (($year2 - $year1) * 12) + ($month2 - $month1 + $tambahanbulan);
              if ($jmlbulan > 24) {
              $jmlbulan = 24;
              $jmldenda = $jmlbulan * 2 / 100 * $row['t_jmlhpajak'];
              } else {
              $jmldenda = $jmlbulan * 2 / 100 * $row['t_jmlhpajak'];
              } */
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. Urut'><center>" . $row['t_nourut'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Tanggal Pendataan'><center>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</center></td>";
            $s .= "<td data-title='Masa Pajak'><center>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</center></td>";
            $s .= "<td data-title='Pajak' style='text-align: right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            $s .= "<td data-title='Tgl. Jatuh Tempo'><center>" . date('d-m-Y', strtotime($row['t_tgljatuhtempo'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Hari Telat'><center>" . $row['hari_lebih_tempo'] . "</center></td>";
            //$s .= "<td data-title='Denda'><center>" . $jmlbulan . " bulan / " . number_format($jmldenda, 0, ',', '.') . "</center></td>";
            //$s .= "<td data-title='Tunggakan' style='text-align: right'>" . number_format($row['t_jmlhpajak'] + $jmldenda, 0, ',', '.') . "</td>";

            if ($row['hari_lebih_tempo'] >= 30) {
                $cetaksuratpaksa = "<button onclick='bukaCetakSuratPaksa($row[t_idtransaksi])' target='_blank' class='btn btn-danger btn-xs' title='Cetak Surat Teguran'><i class='glyph-icon icon-print'></i> Surat Paksa</button>";
            } else {
                $cetaksuratpaksa = '';
            }


            $s .= "<td data-title='#'><center> <button onclick='bukaCetakSuratTeguran($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak Surat Teguran'><i class='glyph-icon icon-print'></i> Surat Teguran</button> " . $cetaksuratpaksa . "</center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginatore3($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridsudah" => $s,
            "rowssudah" => $base->rows,
            "countsudah" => $count,
            "pagesudah" => $page,
            "startsudah" => $start,
            "total_halamansudah" => $total_pages,
            "paginatoresudah" => $datapaging['paginatore'],
            "akhirdatasudah" => $datapaging['akhirdata'],
            "awaldatasudah" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataPendataanAction() {
        /** Mendapatkan Data Pendataan
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // Mengambil Data WP, OP dan Transaksi
        $data = $this->Tools()->getService('PenagihanTable')->getDataPenagihanID($data_get['idtransaksi']);
        $data_render = array(
            "idtransaksi" => $data['t_idtransaksi'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat'],
            "tglketetapan" => date('d-m-Y', strtotime($data['t_tglpendataan'])),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetakstpdAction() {
        /** Cetak STPD
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PenagihanTable')->getDataPenagihanID($data_get['idtransaksi']);
        $ar_rekening = $this->Tools()->getService('RekeningTable')->getRekeningDendaByJenis($data['t_jenispajak']);
        // var_dump($ar_rekening['s_jeniskorek']); exit();
        if($data['t_jenispajak'] == 4){
            $data_reklame = $this->Tools()->getService('PenetapanTable')->getDataPenetapanReklame($data_get['idtransaksi']);   
        }
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'data_reklame' => $data_reklame,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
			'data_rekening' => $ar_rekening
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    //====================== cetak surat teguran
    public function cetaksuratteguranAction() {
        /** Cetak SKRD
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PenagihanTable')->getDataPenagihanID($data_get['idtransaksi']);
		// var_dump($data);exit();
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

    public function cetaksuratpaksaAction() {
        /** Cetak SKRD
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PenagihanTable')->getDataPenagihanID($data_get['idtransaksi']);

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

    //====================== end cetak surat teguran

    public function comboKelurahanCamatAction() {
        $frm = new \Pajak\Form\Pendaftaran\PendaftaranFrm();
        $req = $this->getRequest();
        $res = $this->getResponse();
        if ($req->isPost()) {
            $ex = new \Pajak\Model\Pendaftaran\PendaftaranBase();
            $frm->setData($req->getPost());
            if (!$frm->isValid()) {
                $ex->exchangeArray($frm->getData());
                $data = $this->Tools()->getService('PendaftaranTable')->getByKecamatan($ex);
                $opsi = "";
                $opsi .= "<option value=''>Silahkan Pilih</option>";
                foreach ($data as $r) {
                    $opsi .= "<option value='" . $r['s_idkel'] . "'>" . str_pad($r['s_kodekel'], 2, "0", STR_PAD_LEFT) . " || " . $r['s_namakel'] . "</option>";
                }
                $res->setContent($opsi);
            }
        }
        return $res;
    }

    public function cetakpiutangAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataPiutang($data_get->periodepiutang, $data_get->t_kecamatanpiutang, $data_get->t_kelurahanpiutang, $data_get->jenisobjpiutang);
        $datakelurahan = (!empty($data_get->t_kelurahanpiutang)) ? $this->Tools()->getService('KelurahanTable')->getDataId($data_get->t_kelurahanpiutang) : null;
        $datakecamatan = (!empty($data_get->t_kecamatanpiutang)) ? $this->Tools()->getService('KecamatanTable')->getDataId($data_get->t_kecamatanpiutang) : null;
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksa']);
        
        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'periodepiutang' => $data_get->periodepiutang,
                'tglcetak' => $data_get->tglcetakpiutang,
                'kelurahan' => $datakelurahan,
                'kecamatan' => $datakecamatan,
                'ar_pemda' => $ar_pemda,
                'ar_mengetahui' => $ar_mengetahui,
                'ar_diperiksa' => $ar_diperiksa,
                'formatcetak' => $data_get->formatcetak
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'periodepiutang' => $data_get->periodepiutang,
                'tglcetak' => $data_get->tglcetakpiutang,
                'kelurahan' => $datakelurahan,
                'kecamatan' => $datakecamatan,
                'ar_pemda' => $ar_pemda,
                'ar_mengetahui' => $ar_mengetahui,
                'ar_diperiksa' => $ar_diperiksa,
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }
    
    public function cetakpiutangformatAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataPiutangFormat($data_get->periode, $data_get->masaawal, $data_get->masaakhir, $data_get->t_kecamatanpiutang, $data_get->t_kelurahanpiutang, $data_get->jenisobjpiutang, $data_get->korekobjek);
        $datakelurahan = (!empty($data_get->t_kelurahanpiutang)) ? $this->Tools()->getService('KelurahanTable')->getDataId($data_get->t_kelurahanpiutang) : null;
        $datakecamatan = (!empty($data_get->t_kecamatanpiutang)) ? $this->Tools()->getService('KecamatanTable')->getDataId($data_get->t_kecamatanpiutang) : null;
        $datajenispajak = (!empty($data_get->jenisobjpiutang)) ? $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get->jenisobjpiutang) : null;
        $datarekening = (!empty($data_get->korekobjek)) ? $this->Tools()->getService('RekeningTable')->getDataByIdrekening($data_get->jenisobjpiutang, $data_get->korekobjek) : null;
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksa']);
        
        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'tglcetak' => $data_get->tglcetakpiutang,
                'kelurahan' => $datakelurahan,
                'kecamatan' => $datakecamatan,
                'jenispajak' => $datajenispajak,
                'rekening' => $datarekening,
                'ar_pemda' => $ar_pemda,
                'data_get' => $data_get,
                'ar_mengetahui' => $ar_mengetahui,
                'ar_diperiksa' => $ar_diperiksa,
                'formatcetak' => $data_get->formatcetak

            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'tglcetak' => $data_get->tglcetakpiutang,
                'kelurahan' => $datakelurahan,
                'kecamatan' => $datakecamatan,
                'jenispajak' => $datajenispajak,
                'rekening' => $datarekening,
                'ar_pemda' => $ar_pemda,
                'data_get' => $data_get,
                'ar_mengetahui' => $ar_mengetahui,
                'ar_diperiksa' => $ar_diperiksa,
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
        
    }
    
    public function cetakpiutangexcelAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataPiutang($data_get->periodepiutang, $data_get->t_kecamatanpiutang, $data_get->t_kelurahanpiutang, $data_get->jenisobjpiutang);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:F6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getStyle('H')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(18);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(20);
        $object->getActiveSheet()->mergeCells('A1:F2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->getStyle('A6:H6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('A6:H6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('A6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->setActiveSheetIndex(0)
                ->setCellValue('A1', 'DATA PIUTANG')
                // judul atas
                ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetakpiutang)))
                ->setCellValue('A6', 'No.')
                ->setCellValue('B6', 'Nama')
                ->setCellValue('C6', 'NPWPD')
                ->setCellValue('D6', 'NIOP')
                ->setCellValue('E6', 'Tanggal Pendataan')
                ->setCellValue('F6', 'Masa Pajak')
                ->setCellValue('G6', 'Jenis Pajak')
                ->setCellValue('H6', 'Tunggakan');
        $counter = 7;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        $total_piutang = 0;
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $v['t_nama']);
            $ex->setCellValue("C" . $counter, $v['t_npwpd']);
            $ex->setCellValue("D" . $counter, $v['t_nop']);
            $ex->setCellValue("E" . $counter, date('d-m-Y', strtotime($v['t_tglpendataan'])));
            $ex->setCellValue("F" . $counter, date('d-m-Y', strtotime($v['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($v['t_masaakhir'])));
            $ex->setCellValue("G" . $counter, $v['s_namajenis']);
            $piutang = (float) $v['t_jmlhpajak'] - (float) $v['t_jmlhpembayaran'];
////            var_dump($v['t_jmlhpajak']);
//            var_dump($piutang);
            $ex->setCellValue("H" . $counter, $piutang);
            $object->getActiveSheet()->getStyle('H' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $counter = $counter + 1;
            $total_piutang += $piutang;
            $no++;
        }
//        die();
//        $ex->setCellValue("C" . $counter, number_format($total_penetapan, 0, ',', '.'));
//        $ex->setCellValue("D" . $counter, number_format($total_realisasi, 0, ',', '.'));
        $ex->setCellValue("H" . $counter, $total_piutang);
        $object->getActiveSheet()->getStyle('H' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('A' . $counter . ':H' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter . ':H' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
//        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="datapiutang.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function cetaktunggakanAction() {
        /** Cetak Penagihan
         * @param string $tglcetak Tanggal Mencetak Dokumen
         * @param date('d-m-Y') $tgljatuhtempo0 Tanggal Minimal Piutang
         * @param date('d-m-Y') $tgljatuhtempo1 Tanggal Maximal Piutang
         * @param int $t_kecamatan 
         * @param int $t_kelurahan  
         * @param int $t_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataTunggakan($data_get->tgljatuhtempo0tunggakan, $data_get->tgljatuhtempo1tunggakan, $data_get->t_kecamatantunggakan, $data_get->t_kelurahantunggakan, $data_get->jenisobjtunggakan);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        
        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'tgljatuhtempo0' => $data_get->tgljatuhtempo0tunggakan,
                'tgljatuhtempo1' => $data_get->tgljatuhtempo1tunggakan,
                'tglcetak' => $data_get->tglcetaktunggakan,
                'ar_pemda' => $ar_pemda,
                'formatcetak' => $data_get->formatcetak
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'tgljatuhtempo0' => $data_get->tgljatuhtempo0tunggakan,
                'tgljatuhtempo1' => $data_get->tgljatuhtempo1tunggakan,
                'tglcetak' => $data_get->tglcetaktunggakan,
                'ar_pemda' => $ar_pemda,
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }
    
    public function cetaktunggakanexcelAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataTunggakan($data_get->tgljatuhtempo0tunggakan, $data_get->tgljatuhtempo1tunggakan, $data_get->t_kecamatantunggakan, $data_get->t_kelurahantunggakan, $data_get->jenisobjtunggakan);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:F6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('H')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(18);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(30);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('J')->setWidth(20);
        $object->getActiveSheet()->mergeCells('A1:F2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->getStyle('A6:J6')->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('A6:J6')->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('A6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('B6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('C6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('D6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('E6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('F6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('J6')->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->setActiveSheetIndex(0)
                ->setCellValue('A1', 'DATA PIUTANG')
                // judul atas
                ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetaktunggakan)))
                ->setCellValue('A6', 'No.')
                ->setCellValue('B6', 'Nama')
                ->setCellValue('C6', 'NPWPD')
                ->setCellValue('D6', 'NIOP')
                ->setCellValue('E6', 'Tanggal Pendataan')
                ->setCellValue('F6', 'Jumlah Pajak')
                ->setCellValue('G6', 'Tgl. Pembayaran')
                ->setCellValue('H6', 'Jumlah Pembayaran')
                ->setCellValue('I6', 'Tgl. Jatuh Tempo')
                ->setCellValue('J6', 'Jumlah Tunggakan');
        $counter = 7;
        $no = 1;
        $ex = $object->setActiveSheetIndex(0);
        $total_tunggakan = 0;
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $v['t_nama']);
            $ex->setCellValue("C" . $counter, $v['t_npwpd']);
            $ex->setCellValue("D" . $counter, $v['t_nop']);
            $ex->setCellValue("E" . $counter, date('d-m-Y', strtotime($v['t_tglpendataan'])));
            $ex->setCellValue("F" . $counter, number_format($v['t_jmlhpajak'], 0, ',', '.'));
            $ex->setCellValue("G" . $counter, '-');
            $ex->setCellValue("H" . $counter, 0);
            $ex->setCellValue("I" . $counter, date('d-m-Y', strtotime($v['t_tgljatuhtempo'])));
            $tunggakan = $v['t_jmlhpajak'] - $v['t_jmlhpembayaran'];
            $ex->setCellValue("J" . $counter, $tunggakan);
            $object->getActiveSheet()->getStyle('J' . $counter)->getNumberFormat()->setFormatCode('#,##0');
            $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                    ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $counter = $counter + 1;
            $no++;
            $total_tunggakan += $tunggakan;
        }
//        $ex->setCellValue("C" . $counter, number_format($total_penetapan, 0, ',', '.'));
//        $ex->setCellValue("D" . $counter, number_format($total_realisasi, 0, ',', '.'));
        $ex->setCellValue("J" . $counter, $total_tunggakan);
        $object->getActiveSheet()->getStyle('J' . $counter)->getNumberFormat()->setFormatCode('#,##0');
        $object->getActiveSheet()->getStyle('A' . $counter . ':J' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter . ':J' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('I' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('J' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
                ->getActiveSheet()->getStyle('K' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
//        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="datatunggakan.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }


    public function cetakmutasipiutangAction() {
        /** Cetak cetakmutasipiutang
         * @author Roni Mustapa <ronimustapa@gmail.com>
         * @date 01/03/2019
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // $data = $this->Tools()->getService('PenagihanTable')->getDataMutasiPiutang($data_get->jenispajakmutasi, $data_get->tglcetakmutasi);
        $data = $this->Tools()->getService('PenagihanTable')->getDataMutasiPiutang($data_get['jenispajakmutasi'],$data_get['tglcetakmutasi']);
        // var_dump($data); exti();
        $ar_jenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get['jenispajakmutasi']);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksa']);
        $ar_bendahara = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['bendahara']);
        $ar_ppk = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ppk']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglcetak' => $data_get['tglcetakmutasi'],
            'ar_jenis' => $ar_jenis,
            'ar_pemda' => $ar_pemda,
            'ar_mengetahui' =>  $ar_mengetahui,
            'ar_diperiksa' =>  $ar_diperiksa,
            'ar_bendahara' =>  $ar_bendahara,
            'ar_ppk' =>  $ar_ppk,
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakrekapitulasipiutangAction() {
        /** Cetak cetakrekapitulasipiutang
         * @author Roni Mustapa <ronimustapa@gmail.com>
         * @date 01/03/2019
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataRekapMutasiPiutang($data_get['tglcetakmutasi']);
        
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglcetak' => $data_get['tglcetakmutasi'],
            'ar_pemda' => $ar_pemda,
            'ar_mengetahui' =>  $ar_mengetahui,
        ));
        $pdf->setOption("paperSize", "legal");
        return $pdf;
    }

    public function cetakdaftarsaldoawalpiutangAction() {
        /** Cetak cetakdaftarsaldoawalpiutang
         * @author Roni Mustapa <ronimustapa@gmail.com>
         * @date 01/03/2019
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataDaftarSaldoawalPiutang($data_get['jenispajakmutasi'],$data_get['tglcetakmutasi']);
        $ar_jenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get['jenispajakmutasi']);        
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksa']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglcetak' => $data_get['tglcetakmutasi'],
            'ar_jenis' => $ar_jenis,
            'ar_pemda' => $ar_pemda,
            'ar_mengetahui' =>  $ar_mengetahui,
            'ar_diperiksa' => $ar_diperiksa
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakdaftarsaldoakhirpiutangAction() {
        /** Cetak cetakdaftarsaldoakhirpiutang
         * @author Roni Mustapa <ronimustapa@gmail.com>
         * @date 01/03/2019
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataDaftarSaldoakhirPiutang($data_get['jenispajakmutasi'],$data_get['tglcetakmutasi']);
        $ar_jenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get['jenispajakmutasi']);        
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksa']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglcetak' => $data_get['tglcetakmutasi'],
            'ar_jenis' => $ar_jenis,
            'ar_pemda' => $ar_pemda,
            'ar_mengetahui' =>  $ar_mengetahui,
            'ar_diperiksa' => $ar_diperiksa
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakdaftarketetapanpiutangAction() {
        /** Cetak cetakdaftarketetapanpiutang
         * @author Roni Mustapa <ronimustapa@gmail.com>
         * @date 01/03/2019
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataDaftarKetetapanPiutang($data_get['jenispajakmutasi'],$data_get['tglcetakmutasi']);
        $ar_jenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get['jenispajakmutasi']);        
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahui']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksa']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglcetak' => $data_get['tglcetakmutasi'],
            'ar_jenis' => $ar_jenis,
            'ar_pemda' => $ar_pemda,
            'ar_mengetahui' =>  $ar_mengetahui,
            'ar_diperiksa' => $ar_diperiksa
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakregistertagihanAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataRegisterPiutang($data_get->jenispajakregister, $data_get->perioderegister, $data_get->masaawalregister, $data_get->cetakan);
        
        $ar_jenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get->jenispajakregister);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'periodepajak' => $data_get->perioderegister,
            'masapajak' => $data_get->masaawalregister,
            'tglcetak' => $data_get->tglcetak,
            'ar_mengetahui' => $ar_mengetahui,
            'ar_pemda' => $ar_pemda,
            'ar_jenis' => $ar_jenis
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakrekaptagihanAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenagihanTable')->getDataRegisterPiutang($data_get->jenispajakregister, $data_get->perioderegister, $data_get->masaawalregister, $data_get->cetakan);
        
        $ar_jenis = $this->Tools()->getService('ObjekTable')->getJenisObjek($data_get->jenispajakregister);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'periodepajak' => $data_get->perioderegister,
            'masapajak' => $data_get->masaawalregister,
            'tglcetak' => $data_get->tglcetak,
            'ar_mengetahui' => $ar_mengetahui,
            'ar_pemda' => $ar_pemda,
            'ar_jenis' => $ar_jenis
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function carirekeningAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $datakorek = $this->Tools()->getService('RekeningTable')->getdataRekeningByIdJenisObjek($data_get['t_jenisobjek']);
        $opsi = "";
        $opsi .= "<option value=''>--- SILAHKAN PILIH ---</option>";
        foreach ($datakorek as $r) {
            $opsi .= "<option value='" . $r['s_idkorek'] . "'>" . $r['korek'] . " || " . $r['s_namakorek'] . "</option>";
        }
        $data_render = array(
            'res' => $opsi
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }
    

}
