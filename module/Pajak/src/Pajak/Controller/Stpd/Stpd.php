<?php

namespace Pajak\Controller\Stpd;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Model\Penagihan\PenagihanBase;

class Stpd extends AbstractActionController {

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

    public function dataGridAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new PenagihanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PenagihanTable')->getGridCountStpd($base);
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
        $data = $this->Tools()->getService('PenagihanTable')->getGridDataStpd($base, $start);
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
            $s .= "<td data-title='Denda'><center>" . $jmlbulan . " bulan / " . number_format($jmldenda, 0, ',', '.') . "</center></td>";
            $s .= "<td data-title='Tunggakan' style='text-align: right'>" . number_format($pajakterhutang + $jmldenda, 0, ',', '.') . "</td>";
            $s .= "<td data-title='#'><center> <button onclick='bukaCetakSTPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak STPD'><i class='glyph-icon icon-print'></i> STPD</button></center></td>";
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
         * @author Abdul Aziz Nur Farhana <abaz.nurfarhana@gmail.com>
         * @date 06/06/2017
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
        $pdf->setOption("paperSize", "portrait");
        return $pdf;
    }

}
