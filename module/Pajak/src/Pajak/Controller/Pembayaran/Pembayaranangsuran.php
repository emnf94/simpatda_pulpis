<?php

namespace Pajak\Controller\Pembayaran;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Pembayaran\PembayaranangsuranFrm;
use Pajak\Model\Pembayaran\PembayaranangsuranBase;

class Pembayaranangsuran extends AbstractActionController {

    public function indexAction() {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getdata();
        $records = array();
        foreach ($ar_ttd0 as $ar_ttd0) {
            $records[] = $ar_ttd0;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'ar_ttd0' => $records
        ));
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        
        $belumditetapkan = $this->Tools()->getService('PenetapanTable')->getBelumDitetapkan();
        $data = array(
            'belumditetapkan' => $belumditetapkan,
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridPembayaranAngsuranBelumAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Pendataan\PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembayaranangsuranTable')->getGridCountPembayaranAngsuranBelum($base);
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
        $data = $this->Tools()->getService('PembayaranangsuranTable')->getGridDataPembayaranAngsuranBelum($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . $row['t_noangsuran'] . "</center></td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td>" . $row['t_nama'] . "</td>";
            $s .= "<td>" . $row['s_namajenis'] . "</td>";
            $s .= "<td><center>" . $row['t_angsuranke'] . "</center></td>";
            $s .= "<td style='text-align:right'>" . number_format($row['t_nominalangsuran'], 0, ',', '.') . "</td>";
            $s .= "<td><center><b style='color:blue;'>" . $row['t_kodebayarangsuran'] . "</b></center></td>";
            $s .= "<td>
                    <a href='pembayaranangsuran/form_pembayaranangsuran?t_idangsuran=$row[t_idangsuran]' class='btn btn-warning btn-sm' title='Bayarkan'><i class='glyph-icon icon-money'></i> Bayarkan</a>
                    </td>";
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

    public function dataGridPembayaranAngsuranSudahAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Pendataan\PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembayaranangsuranTable')->getGridCountPembayaranAngsuranSudah($base);
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
        $data = $this->Tools()->getService('PembayaranangsuranTable')->getGridDataPembayaranAngsuranSudah($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . $row['t_noangsuran'] . "</center></td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td>" . $row['t_nama'] . "</td>";
            $s .= "<td>" . $row['s_namajenis'] . "</td>";
            $s .= "<td><center>" . $row['t_angsuranke'] . "</center></td>";
            $s .= "<td style='text-align:center'><b style='color:green;'>LUNAS / Rp. " . number_format($row['t_totalpembayaranangsuran'], 0, ',', '.') . "<BR>
                    ".date('d-m-Y', strtotime($row['t_tglpembayaranangsuran']))."</b></td>";
            $s .= "<td><center>" . $row['t_kodebayarangsuran'] . "</center></td>";
            if ($row['t_angsuranke'] == 1) {
                $suratangsuran = "<button onclick='bukaCetakangsuran($row[t_idangsuran],$row[t_jenisketetapan])' target='_blank' class='btn btn-danger btn-xs' title='Cetak Surat Angsuran'><i class='glyph-icon icon-print'></i></button>";
            } else {
                $suratangsuran = "";
            }
            $s .= "<td>
                    <a href='angsuran/cetakkodebayar?&t_idangsuran=$row[t_idangsuran]&t_jenisketetapan=$row[t_jenisketetapan]' target='_blank' class='btn btn-primary btn-xs' title='Cetak Kode Bayar'><i class='glyph-icon icon-print'></i></a>
                    $suratangsuran
                    </td>";
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

    public function FormPembayaranangsuranAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PembayaranangsuranFrm();
		if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idangsuran');
			$data_angsuran = $this->Tools()->getService('AngsuranTable')->getAngsuranId($id);
			
			if ($data_angsuran->t_jenisketetapan == 2) { // SKPD
				$data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpd($id, $data_angsuran->t_jenisketetapan);
			} elseif ($data_angsuran->t_jenisketetapan == 4) { // SKPD Jabatan
				$data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdjab($id, $data_angsuran->t_jenisketetapan);
			} elseif ($data_angsuran->t_jenisketetapan == 5) { // SKPDKB
				$data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdkb($id, $data_angsuran->t_jenisketetapan);
			} elseif ($data_angsuran->t_jenisketetapan == 6) { // SKPDKBT
				$data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdkbt($id, $data_angsuran->t_jenisketetapan);
			} elseif ($data_angsuran->t_jenisketetapan == 10) { // SKPDT
				$data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdt($id, $data_angsuran->t_jenisketetapan);
			}
			
			// var_dump($data['t_npwpdwp']); exit();
            // $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
            // $data->t_idtransaksi = $id;
            // denda

            $jatuhtempo = $data['t_tgljatuhtempo'];
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
                $jmldenda = $jmlbulan * 2 / 100 * ($data['t_nominalangsuran']);
            } elseif ($jmlbulan <= 0) {
                $jmlbulan = 0;
                $jmldenda = $jmlbulan * 2 / 100 * ($data['t_nominalangsuran']);
            } else {
                $jmldenda = $jmlbulan * 2 / 100 * ($data['t_nominalangsuran']);
            }

            $data_angsuran->t_idangsuran = $id;
            $data_angsuran->t_bungaangsuran = number_format($jmldenda, 0, ',', '.');
            $data_angsuran->t_nominalangsuran = number_format($data['t_nominalangsuran'], 0, ',', '.');
            $data_angsuran->t_jmlhpembayaranangsuran = number_format($data['t_nominalangsuran']+$jmldenda, 0, ',', '.');
            $form->bind($data_angsuran);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PembayaranangsuranBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('PembayaranangsuranTable')->simpanpembayaranangsuran($base, $session, $post);
                return $this->redirect()->toRoute('pembayaranangsuran');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
			'data' => $data
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        
        $belumditetapkan = $this->Tools()->getService('PenetapanTable')->getBelumDitetapkan();
        $data = array(
            'belumditetapkan' => $belumditetapkan,
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function CariJumlahKaliAngsuranAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $rincianangsuran = "";
        $rincianangsuran .= "       <table class='table table-bordered table-striped table-condensed cf' style='font-size : 11px; color:black'>
                                        <thead class='cf' style='background-color:blue'>
                                            <tr>
                                                <th colspan='6' style='background-color: #00BCA4; color: red; text-align:center'><b>Rincian Angsuran</b></th>
                                            </tr
                                            <tr>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Angsuran Ke-</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Rencana Tgl. Pembayaran Angsuran</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Jumlah Angsuran (Rp.)</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Jumlah Bulan<br>Terlambat</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Bunga (Rp.)</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Total (Rp.)</th>
                                            </tr>
                                        </thead>
                                        <tbody>";
        $k = 1;
        for ($i = 0; $data_get->t_jumlahkaliangsuran > $i; $i++) {
            $tgl = date('d-m-Y', strtotime($data_get->t_tglketetapanangsuran . "+$i months"));
            $jadwalbayar = strtotime($tgl);
            $tgl1 = date('d-m-Y', strtotime($data_get->t_tgljatuhtempo));
            $jatuhtempo = strtotime($tgl1);

            $year1 = date('Y', $jatuhtempo);
            $year2 = date('Y', $jadwalbayar);

            $month1 = date('m', $jatuhtempo);
            $month2 = date('m', $jadwalbayar);

            $day1 = date('d', $jatuhtempo);
            $day2 = date('d', $jadwalbayar);
            if ($day1 < $day2) {
                $tambahanbulan = 1;
            } else {
                $tambahanbulan = 0;
            }

            $jmlbulan = (($year2 - $year1) * 12) + ($month2 - $month1 + $tambahanbulan);
            if ($jmlbulan > 24) {
                $jmlbulan = 24;
            } elseif ($jmlbulan <= 0) {
                $jmlbulan = 0;
            }
            $rincianangsuran .= "   <tr>
                                        <td style='text-align:center'>
                                            <label>" . $k . "</label>
                                            <input type='hidden' class='form-control' name='t_idangsuran[]' id='t_idangsuran" . $k . "'>
                                            <input type='hidden' class='form-control' name='t_angsuranke[]' id='t_angsuranke" . $k . "' value='" . $k . "' style='text-align:center' readonly='true'>
                                        </td>
                                        <td><input type='text' class='form-control input-mask' data-inputmask=\"'mask':'99-99-9999'\" name='t_tgljadwalangsuran[]' id='t_tgljadwalangsuran$i' value='" . $tgl . "' style='text-align:center'></td>
                                        <td><input type='text' class='form-control' name='t_nominalangsuran[]' id='t_nominalangsuran" . $k . "' style='text-align:right' onchange='this.value = formatCurrency(this.value);HitungRincianAngsuran(this.value)' onblur='this.value = formatCurrency(this.value);HitungRincianAngsuran(this.value)' onKeyPress='return numbersonly(this, event);' onkeyup='this.value = formatCurrency(this.value);' value='0'></td>
                                        <td><input type='text' class='form-control' name='t_jmlhbln[]' id='t_jmlhbln" . $k . "' readonly='true' style='text-align:right' value='$jmlbulan' onblur='HitungRincianAngsuran()'></td>
                                        <td><input type='text' class='form-control' name='t_bunga[]' id='t_bunga" . $k . "' readonly='true' style='text-align:right' onblur='HitungRincianAngsuran()'></td>
                                        <td><input type='text' class='form-control' name='t_total[]' id='t_total" . $k . "' readonly='true' style='text-align:right' onblur='HitungRincianAngsuran()'></td>
                                    </tr>";
            $k++;
        }
        $rincianangsuran .= "<script type='text/javascript'>
                                $(function () {
                                    'use strict';
                                    $('.input-mask').inputmask();
                                });
                                function HitungRincianAngsuran() {
                                    $.post('HitungRincianAngsuran', {t_jmlhpajak: $('#t_jmlhpajak').val(), t_jumlahkaliangsuran: $data_get->t_jumlahkaliangsuran";
        $jmlhangsuran = $data_get->t_jumlahkaliangsuran;
        $j = 1;
        for ($j; $data_get->t_jumlahkaliangsuran >= $j; $j++) {
            $rincianangsuran .= ", t_jmlhbln$j: $('#t_jmlhbln$j').val(), t_nominalangsuran$j: $('#t_nominalangsuran$j').val()";
        }
        $rincianangsuran .= "        }, function (data) {
                                        var aa = JSON.parse(data);
                                        $('#t_jmlhangsuran').val(aa.t_jmlhangsuran);
                                        $('#t_jmlhbunga').val(aa.t_jmlhbunga);
                                        $('#t_jmlhtotal').val(aa.t_jmlhtotal);
                                        $('#t_nominalangsuran$jmlhangsuran').val(aa.t_kurangangsuran);";
        $l = 1;
        for ($l; $data_get->t_jumlahkaliangsuran >= $l; $l++) {
            $rincianangsuran .= "$('#t_bunga$l').val(aa.t_bunga$l);";
            $rincianangsuran .= "$('#t_total$l').val(aa.t_total$l);";
        }
        $rincianangsuran .= "      });
                                }
                            </script>";

        $rincianangsuran .= "           <tr>
                                            <td style='text-align:center' colspan='2'>Jumlah</td>
                                            <td><input type='text' class='form-control' name='t_jmlhangsuran' id='t_jmlhangsuran' style='text-align:right; background:green; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'></td>
                                            <td></td>
                                            <td><input type='text' class='form-control' name='t_jmlhbunga' id='t_jmlhbunga' style='text-align:right; background:green; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'></td>
                                            <td><input type='text' class='form-control' name='t_jmlhtotal' id='t_jmlhtotal' style='text-align:right; background:green; color: white; padding: 7px 10px; height:40px; font-size: 16px; font-weight:bolder'></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                ";
        $data_render = array(
            "rincianangsuran" => $rincianangsuran
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function HitungRincianAngsuranAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        $pajak = (int) str_ireplace(".", "", $data_get->t_jmlhpajak);
        $t_jmlhpajak = $pajak;
        // carane elekan sitik
        $cicilan1 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran1);
        $cicilan2 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran2);
        $cicilan3 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran3);
        $cicilan4 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran4);
        $cicilan5 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran5);
        $cicilan6 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran6);
        $cicilan7 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran7);
        $cicilan8 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran8);
        $cicilan9 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran9);
        $cicilan10 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran10);
        $cicilan11 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran11);
        $cicilan12 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran12);
        $cicilan13 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran13);
        $cicilan14 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran14);
        $cicilan15 = (int) str_ireplace(".", "", $data_get->t_nominalangsuran15);

        $t_bunga1 = 0;
        $t_total1 = 0;
        if ($data_get->t_jmlhbln1 != null) {
            $t_bunga1 = ($data_get->t_jmlhbln1 * 2 / 100) * $t_jmlhpajak;
            $t_total1 = $t_bunga1 + $cicilan1;
            if ($cicilan1 == 0) {
                $t_bunga1 = 0;
                $t_total1 = 0;
            }
        }

        $t_bunga2 = 0;
        $t_total2 = 0;
        if ($data_get->t_jmlhbln2 != null) {
            $t_bunga2 = ($data_get->t_jmlhbln2 * 2 / 100) * ($t_jmlhpajak - $cicilan1);
            $t_total2 = $t_bunga2 + $t_jmlhpajak - $cicilan1 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan14 - $cicilan15;
            if ($cicilan2 == 0) {
                $t_bunga2 = 0;
                $t_total2 = 0;
            }
        }

        $t_bunga3 = 0;
        $t_total3 = 0;
        if ($data_get->t_jmlhbln3 != null) {
            $t_bunga3 = ($data_get->t_jmlhbln3 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2);
            $t_total3 = $t_bunga3 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan14 - $cicilan15;
            if ($cicilan3 == 0) {
                $t_bunga3 = 0;
                $t_total3 = 0;
            }
        }

        $t_bunga4 = 0;
        $t_total4 = 0;
        if ($data_get->t_jmlhbln4 != null) {
            $t_bunga4 = ($data_get->t_jmlhbln4 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3);
            $t_total4 = $t_bunga4 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan14 - $cicilan15;
            if ($cicilan4 == 0) {
                $t_bunga4 = 0;
                $t_total4 = 0;
            }
        }

        $t_bunga5 = 0;
        $t_total5 = 0;
        if ($data_get->t_jmlhbln5 != null) {
            $t_bunga5 = ($data_get->t_jmlhbln5 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4);
            $t_total5 = $t_bunga5 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan14 - $cicilan15;
            if ($cicilan5 == 0) {
                $t_bunga5 = 0;
                $t_total5 = 0;
            }
        }

        $t_bunga6 = 0;
        $t_total6 = 0;
        if ($data_get->t_jmlhbln6 != null) {
            $t_bunga6 = ($data_get->t_jmlhbln6 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5);
            $t_total6 = $t_bunga6 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan14 - $cicilan15;
            if ($cicilan6 == 0) {
                $t_bunga6 = 0;
                $t_total6 = 0;
            }
        }

        $t_bunga7 = 0;
        $t_total7 = 0;
        if ($data_get->t_jmlhbln7 != null) {
            $t_bunga7 = ($data_get->t_jmlhbln7 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6);
            $t_total7 = $t_bunga7 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan14 - $cicilan15;
            if ($cicilan7 == 0) {
                $t_bunga7 = 0;
                $t_total7 = 0;
            }
        }

        $t_bunga8 = 0;
        $t_total8 = 0;
        if ($data_get->t_jmlhbln8 != null) {
            $t_bunga8 = ($data_get->t_jmlhbln8 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7);
            $t_total8 = $t_bunga8 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan14 - $cicilan15;
            if ($cicilan8 == 0) {
                $t_bunga8 = 0;
                $t_total8 = 0;
            }
        }

        $t_bunga9 = 0;
        $t_total9 = 0;
        if ($data_get->t_jmlhbln9 != null) {
            $t_bunga9 = ($data_get->t_jmlhbln9 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8);
            $t_total9 = $t_bunga9 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan14 - $cicilan15;
            if ($cicilan9 == 0) {
                $t_bunga9 = 0;
                $t_total9 = 0;
            }
        }

        $t_bunga10 = 0;
        $t_total10 = 0;
        if ($data_get->t_jmlhbln10 != null) {
            $t_bunga10 = ($data_get->t_jmlhbln10 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9);
            $t_total10 = $t_bunga10 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan14 - $cicilan15;
            if ($cicilan10 == 0) {
                $t_bunga10 = 0;
                $t_total10 = 0;
            }
        }

        $t_bunga11 = 0;
        $t_total11 = 0;
        if ($data_get->t_jmlhbln11 != null) {
            $t_bunga11 = ($data_get->t_jmlhbln11 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10);
            $t_total11 = $t_bunga11 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan12 - $cicilan13 - $cicilan14 - $cicilan15;
            if ($cicilan11 == 0) {
                $t_bunga11 = 0;
                $t_total11 = 0;
            }
        }

        $t_bunga12 = 0;
        $t_total12 = 0;
        if ($data_get->t_jmlhbln12 != null) {
            $t_bunga12 = ($data_get->t_jmlhbln12 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11);
            $t_total12 = $t_bunga12 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan13 - $cicilan14 - $cicilan15;
            if ($cicilan12 == 0) {
                $t_bunga12 = 0;
                $t_total12 = 0;
            }
        }

        $t_bunga13 = 0;
        $t_total13 = 0;
        if ($data_get->t_jmlhbln13 != null) {
            $t_bunga13 = ($data_get->t_jmlhbln13 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12);
            $t_total13 = $t_bunga13 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan14 - $cicilan15;
            if ($cicilan13 == 0) {
                $t_bunga13 = 0;
                $t_total13 = 0;
            }
        }

        $t_bunga14 = 0;
        $t_total14 = 0;
        if ($data_get->t_jmlhbln14 != null) {
            $t_bunga14 = ($data_get->t_jmlhbln14 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13);
            $t_total14 = $t_bunga14 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan15;
            if ($cicilan4 == 0) {
                $t_bunga4 = 0;
                $t_total4 = 0;
            }
        }

        $t_bunga15 = 0;
        $t_total15 = 0;
        if ($data_get->t_jmlhbln15 != null) {
            $t_bunga15 = ($data_get->t_jmlhbln15 * 2 / 100) * ($t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan14);
            $t_total15 = $t_bunga15 + $t_jmlhpajak - $cicilan1 - $cicilan2 - $cicilan3 - $cicilan4 - $cicilan5 - $cicilan6 - $cicilan7 - $cicilan8 - $cicilan9 - $cicilan10 - $cicilan11 - $cicilan12 - $cicilan13 - $cicilan14;
            if ($cicilan15 == 0) {
                $t_bunga15 = 0;
                $t_total15 = 0;
            }
        }

        $t_jmlhangsuransementara = 0;
        for ($j = 1; $data_get->t_jumlahkaliangsuran > $j; $j++) {
            $t_nominal = "t_nominalangsuran" . $j;
            $t_nominal1 = (int) str_ireplace(".", "", $data_get->$t_nominal);
            $t_jmlhangsuransementara += $t_nominal1;
        }

        $t_jmlhbunga = $t_bunga1 + $t_bunga2 + $t_bunga3 + $t_bunga4 + $t_bunga5 + $t_bunga6 + $t_bunga7 + $t_bunga8 + $t_bunga9 + $t_bunga10 + $t_bunga11 + $t_bunga12 + $t_bunga13 + $t_bunga14 + $t_bunga15;
        $t_jmlhtotal = $t_jmlhbunga + $t_jmlhpajak;
        $t_kurangangsuran = $t_jmlhpajak - $t_jmlhangsuransementara;
        $data_render = array(
            "t_jmlhangsuran" => $data_get->t_jmlhpajak,
            "t_jmlhbunga" => number_format($t_jmlhbunga, 0, ",", "."),
            "t_jmlhtotal" => number_format($t_jmlhtotal, 0, ",", "."),
            "t_kurangangsuran" => number_format($t_kurangangsuran, 0, ",", "."),
            "t_bunga1" => number_format($t_bunga1, 0, ',', '.'),
            "t_bunga2" => number_format($t_bunga2, 0, ',', '.'),
            "t_bunga3" => number_format($t_bunga3, 0, ',', '.'),
            "t_bunga4" => number_format($t_bunga4, 0, ',', '.'),
            "t_bunga5" => number_format($t_bunga5, 0, ',', '.'),
            "t_bunga6" => number_format($t_bunga6, 0, ',', '.'),
            "t_bunga7" => number_format($t_bunga7, 0, ',', '.'),
            "t_bunga8" => number_format($t_bunga8, 0, ',', '.'),
            "t_bunga9" => number_format($t_bunga9, 0, ',', '.'),
            "t_bunga10" => number_format($t_bunga10, 0, ',', '.'),
            "t_bunga11" => number_format($t_bunga11, 0, ',', '.'),
            "t_bunga12" => number_format($t_bunga12, 0, ',', '.'),
            "t_bunga13" => number_format($t_bunga13, 0, ',', '.'),
            "t_bunga14" => number_format($t_bunga14, 0, ',', '.'),
            "t_bunga15" => number_format($t_bunga15, 0, ',', '.'),
            "t_total1" => number_format($t_total1, 0, ',', '.'),
            "t_total2" => number_format($t_total2, 0, ',', '.'),
            "t_total3" => number_format($t_total3, 0, ',', '.'),
            "t_total4" => number_format($t_total4, 0, ',', '.'),
            "t_total5" => number_format($t_total5, 0, ',', '.'),
            "t_total6" => number_format($t_total6, 0, ',', '.'),
            "t_total7" => number_format($t_total7, 0, ',', '.'),
            "t_total8" => number_format($t_total8, 0, ',', '.'),
            "t_total9" => number_format($t_total9, 0, ',', '.'),
            "t_total10" => number_format($t_total10, 0, ',', '.'),
            "t_total11" => number_format($t_total11, 0, ',', '.'),
            "t_total12" => number_format($t_total12, 0, ',', '.'),
            "t_total13" => number_format($t_total13, 0, ',', '.'),
            "t_total14" => number_format($t_total14, 0, ',', '.'),
            "t_total15" => number_format($t_total15, 0, ',', '.'),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function dataGridKetetapanAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $req->isGet();
        $parametercari = $req->getQuery();
        $base = new \Pajak\Model\Angsuran\AngsuranBase();
        $base->exchangeArray($allParams);
        if ($base->direction == 2)
            $base->page = $base->page + 1;
        if ($base->direction == 1)
            $base->page = $base->page - 1;
        if ($base->page <= 0)
            $base->page = 1;
        $page = $base->page;
        $limit = $base->rows;
        if ($parametercari->t_jenisketetapan == '2') {
            $count = $this->Tools()->getService('AngsuranTable')->getGridCountSkpd($base, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '5') {
            $count = $this->Tools()->getService('AngsuranTable')->getGridCountSkpdkb($base, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '6') {
            $count = $this->Tools()->getService('AngsuranTable')->getGridCountSkpdkbt($base, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '10') {
            $count = $this->Tools()->getService('AngsuranTable')->getGridCountSkpdt($base, $parametercari);
        }

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
        $s = "";
        if ($parametercari->t_jenisketetapan == '2') {
            $namaketetapan = 'SKPD';
            $data = $this->Tools()->getService('AngsuranTable')->getGridDataSkpd($base, $start, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '5') {
            $namaketetapan = 'SKPDKB';
            $data = $this->Tools()->getService('AngsuranTable')->getGridDataSkpdkb($base, $start, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '6') {
            $namaketetapan = 'SKPDKBT';
            $data = $this->Tools()->getService('AngsuranTable')->getGridDataSkpdkbt($base, $start, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '10') {
            $namaketetapan = 'SKPDT';
            $data = $this->Tools()->getService('AngsuranTable')->getGridDataSkpdt($base, $start, $parametercari);
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td style='text-align:center'>" . $row['t_nop'] . "</td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td style='text-align:center'>" . $row['t_npwpdwp'] . "</td>";
            $s .= "<td>" . $row['t_namawp'] . "</td>";
            $s .= "<td style='text-align:center'>" . $row['t_nopenetapan'] . "</td>";
            $s .= "<td>" . date('d-m-Y', strtotime($row['t_tglpenetapan'])) . "</td>";
            $s .= "<td style='text-align:right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            $s .= "<td><a href='#' onclick='pilihKetetapan(" . $row['t_idtransaksi'] . "," . $parametercari->t_jenisketetapan . ");return false;' class='btn btn-xs btn-primary'><span class='glyph-icon icon-hand-o-up'> Pilih </a></td>";
            $s .= "</tr>";
        }
        $data_render = array(
            "grid" => $s,
            "rows" => 10,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages,
            "judulketetapan" => "Data Ketetapan " . $namaketetapan,
            "namaketetapan" => $namaketetapan
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function pilihKetetapanAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataKetetapan = $this->Tools()->getService('AngsuranTable')->getDataKetetapanForAngsuran($data_get->t_idketetapan, $data_get->t_jenisketetapan);
        if ($data_get->t_jenisketetapan == 2) {
            $id_ketetapan = $data_get->t_idketetapan;
            $t_namaketetapan = 'SKPD';
        } elseif ($data_get->t_jenisketetapan == 5) {
            $id_ketetapan = $dataKetetapan['t_idskpdkb'];
            $t_namaketetapan = 'SKPDKB';
        } elseif ($data_get->t_jenisketetapan == 6) {
            $t_namaketetapan = 'SKPDKBT';
        } elseif ($data_get->t_jenisketetapan == 10) {
            $t_namaketetapan = 'SKPDT';
        }
        $data = array(
            't_namawp' => $dataKetetapan['t_namawp'],
            't_npwpdwp' => $dataKetetapan['t_npwpdwp'],
            't_alamat_lengkap' => $dataKetetapan['t_alamat_lengkapwp'],
            't_namaobjek' => $dataKetetapan['t_namaobjek'],
            't_nop' => $dataKetetapan['t_nop'],
            't_alamatlengkapobjek' => $dataKetetapan['t_alamatlengkapobjek'],
            't_namaketetapan' => $t_namaketetapan,
            't_jenispajak' => $dataKetetapan['t_jenispajak'],
            't_idketetapan' => $id_ketetapan,
            't_nopenetapan' => $dataKetetapan['t_nopenetapan'],
            't_tgljatuhtempo' => date('d-m-Y', strtotime($dataKetetapan['t_tgljatuhtempo'])),
            't_tglpenetapan' => date('d-m-Y', strtotime($dataKetetapan['t_tglpenetapan'])),
            't_jmlhpajak' => number_format($dataKetetapan['t_jmlhpajak'], 0, ',', '.')
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function dataAngsuranAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        if ($data_get['t_jenisketetapan'] == 2) { // SKPD
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpd($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 4) { // SKPD Jabatan
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdjab($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 5) { // SKPDKB
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdkb($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 6) { // SKPDKBT
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdkbt($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 10) { // SKPDT
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdt($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        }
        $data_render = array(
            "idtransaksi" => $data['t_idtransaksi'],
            "namawp" => $data['t_namawp'],
            "alamatwp" => $data['t_alamat_lengkapwp']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetakangsuranAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();

        if ($data_get['t_jenisketetapan'] == 2) { // SKPD
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpd($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 4) { // SKPD Jabatan
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdjab($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 5) { // SKPDKB
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdkb($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 6) { // SKPDKBT
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdkbt($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 10) { // SKPDT
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdt($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        }

        $data_detail0 = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuran($data['t_idketetapan']);
        $data_detail = array();
        foreach ($data_detail0 as $data_detail0) {
            $data_detail[] = $data_detail0;
        }

        $dasarbunga = 0;
        foreach ($data_detail as $row) {
            $dasarbunga += $row['t_nominalangsuran'];
        }

        $html = "";
        $html .= "  <tr>
                        <td style='padding-left: 10px'></td>
                        <td style='width:35%'></td>
                        <td style='width:20%'>Angsuran Pokok</td>
                        <td style='width:20%'>Biaya Adm./Bunga</td>
                        <td style='width:20%'>Jumlah Angsuran</td>
                    </tr>";
        $t_nominalangsuran = 0;
        $t_bunga = 0;
        $t_total = 0;
        $pengurangansebelumnya = 0;
        $dasarbunga1 = 0;
        foreach ($data_detail as $row) {
            $dasarbunga1 = $dasarbunga - $pengurangansebelumnya;
            $pengurangansebelumnya += $row['t_nominalangsuran'];
            $jatuhtempo = strtotime($data['t_tgljatuhtempo']);
            $jadwalbayar = strtotime($row['t_tgljadwalangsuran']);
            $year1 = date('Y', $jatuhtempo);
            $year2 = date('Y', $jadwalbayar);

            $month1 = date('m', $jatuhtempo);
            $month2 = date('m', $jadwalbayar);

            $day1 = date('d', $jatuhtempo);
            $day2 = date('d', $jadwalbayar);
            if ($day1 < $day2) {
                $tambahanbulan = 1;
            } else {
                $tambahanbulan = 0;
            }

            $jmlbulan = (($year2 - $year1) * 12) + ($month2 - $month1 + $tambahanbulan);
            if ($jmlbulan > 24) {
                $jmlbulan = 24;
                $jmlbunga = $jmlbulan * 2 / 100 * $dasarbunga1;
            } elseif ($jmlbulan <= 0) {
                $jmlbulan = 0;
                $jmlbunga = $jmlbulan * 2 / 100 * $dasarbunga1;
            } else {
                $jmlbunga = $jmlbulan * 2 / 100 * $dasarbunga1;
            }

            $html .= "<tr>
                        <td style='padding-left: 10px'></td>
                        <td>Tgl. " . date('d-m-Y', strtotime($row['t_tgljadwalangsuran'])) . " Angsuran ke " . $row['t_angsuranke'] . "</td>
                        <td>Rp.<span style='padding-right:5px; text-align:right'> " . number_format($row['t_nominalangsuran'], 0, ',', '.') . "</span></td>
                        <td>Rp.<span style='padding-right:5px; text-align:right'> " . number_format($jmlbunga, 0, ',', '.') . "</span></td>
                        <td>Rp.<span style='padding-right:5px; text-align:right'> " . number_format($row['t_nominalangsuran'] + $jmlbunga, 0, ',', '.') . "</span></td>
                    </tr>";
            $t_nominalangsuran += $row['t_nominalangsuran'];
            $t_bunga += $jmlbunga;
            $t_total += $row['t_nominalangsuran'] + $jmlbunga;
        }
        $html .= "   <tr>
                        <td style='padding-left: 10px'></td>
                        <td></td>
                        <td class='border_bawah'></td>
                        <td class='border_bawah'></td>
                        <td class='border_bawah'></td>
                    </tr>";
        $html .= "   <tr>
                        <td style='padding-left: 10px'></td>
                        <td></td>
                        <td>Rp. " . number_format($t_nominalangsuran, 0, ',', '.') . "</td>
                        <td>Rp. " . number_format($t_bunga, 0, ',', '.') . "</td>
                        <td>Rp. " . number_format($t_total, 0, ',', '.') . "</td>
                    </tr>";
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
            'detail_angsuran' => $html
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetakkodebayarAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        if ($data_get['t_jenisketetapan'] == 2) { // SKPD
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpd($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 4) { // SKPD Jabatan
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdjab($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 5) { // SKPDKB
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdkb($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 6) { // SKPDKBT
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdkbt($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 10) { // SKPDT
            $data = $this->Tools()->getService('AngsuranTable')->getDatabyIDAngsuranSkpdt($data_get['t_idangsuran'], $data_get['t_jenisketetapan']);
        }

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'data' => $data,
            'ar_pemda' => $ar_pemda,
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

}
