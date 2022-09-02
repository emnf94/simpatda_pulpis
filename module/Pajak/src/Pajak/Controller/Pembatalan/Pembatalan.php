<?php

namespace Pajak\Controller\Pembatalan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Pembatalan\PembatalanFrm;
use Pajak\Model\Pembatalan\PembatalanBase;

class Pembatalan extends AbstractActionController {

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

    public function dataGridKetetapanPembatalanSkpdAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Pendataan\PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembatalanTable')->getGridCountKetetapanPembatalanSkpd($base);
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
        $data = $this->Tools()->getService('PembatalanTable')->getGridDataKetetapanPembatalanSkpd($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . $row['t_nopembatalan'] . "</center></td>";
            $s .= "<td><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td>" . $row['t_nama'] . "</td>";
            $s .= "<td>" . $row['s_namajenis'] . "</td>";
            $s .= "<td><center>" . $row['t_disposisi'] . "</center></td>";
            $s .= "<td>" . $row['t_petugaslapangan'] . "</td>";
            $s .= "<td>" . $row['t_tglpembatalan'] . "</td>";
            $s .= "<td>" . $row['t_kodebayar'] . "</td>";
            $s .= "<td><button onclick='bukaCetakpembatalan($row[t_idpembatalan],$row[t_jenisketetapan])' target='_blank' class='btn btn-danger btn-xs' title='Cetak Surat Pembatalan'><i class='glyph-icon icon-print'></i></button></td>";
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

    public function dataGridKetetapanPembatalanSkpdkbAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Pendataan\PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembatalanTable')->getGridCountKetetapanPembatalanSkpdkb($base);
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
        $data = $this->Tools()->getService('PembatalanTable')->getGridDataKetetapanPembatalanSkpdkb($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . $row['t_nopembatalan'] . "</center></td>";
            $s .= "<td><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td>" . $row['t_nama'] . "</td>";
            $s .= "<td>" . $row['s_namajenis'] . "</td>";
            $s .= "<td><center>" . $row['t_disposisi'] . "</center></td>";
            $s .= "<td>" . $row['t_petugaslapangan'] . "</td>";
            $s .= "<td>" . $row['t_tglpembatalan'] . "</td>";
            $s .= "<td>" . $row['t_kodebayarskpdkb'] . "</td>";
            $s .= "<td><button onclick='bukaCetakpembatalan($row[t_idpembatalan],$row[t_jenisketetapan])' target='_blank' class='btn btn-danger btn-xs' title='Cetak Surat Pembatalan'><i class='glyph-icon icon-print'></i></button></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator1($base->rows, $count, $page, $total_pages, $start);
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

    public function dataGridKetetapanPembatalanSkpdkbtAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Pendataan\PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembatalanTable')->getGridCountKetetapanPembatalanSkpdkbt($base);
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
        $data = $this->Tools()->getService('PembatalanTable')->getGridDataKetetapanPembatalanSkpdkbt($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . $row['t_nopembatalan'] . "</center></td>";
            $s .= "<td><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td>" . $row['t_nama'] . "</td>";
            $s .= "<td>" . $row['s_namajenis'] . "</td>";
            $s .= "<td><center>" . $row['t_disposisi'] . "</center></td>";
            $s .= "<td>" . $row['t_petugaslapangan'] . "</td>";
            $s .= "<td>" . $row['t_tglpembatalan'] . "</td>";
            $s .= "<td>" . $row['t_kodebayarskpdkbt'] . "</td>";
            $s .= "<td><button onclick='bukaCetakpembatalan($row[t_idpembatalan],$row[t_jenisketetapan])' target='_blank' class='btn btn-danger btn-xs' title='Cetak Surat Pembatalan'><i class='glyph-icon icon-print'></i></button></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator2($base->rows, $count, $page, $total_pages, $start);
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

    public function dataGridKetetapanPembatalanSkpdtAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Pendataan\PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembatalanTable')->getGridCountKetetapanPembatalanSkpdt($base);
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
        $data = $this->Tools()->getService('PembatalanTable')->getGridDataKetetapanPembatalanSkpdt($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center>" . $row['t_nopembatalan'] . "</center></td>";
            $s .= "<td><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td>" . $row['t_nama'] . "</td>";
            $s .= "<td>" . $row['s_namajenis'] . "</td>";
            $s .= "<td><center>" . $row['t_disposisi'] . "</center></td>";
            $s .= "<td>" . $row['t_petugaslapangan'] . "</td>";
            $s .= "<td>" . $row['t_tglpembatalan'] . "</td>";
            $s .= "<td>" . $row['t_kodebayarskpdt'] . "</td>";
            $s .= "<td><button onclick='bukaCetakpembatalan($row[t_idpembatalan],$row[t_jenisketetapan])' target='_blank' class='btn btn-danger btn-xs' title='Cetak Surat Pembatalan'><i class='glyph-icon icon-print'></i></button></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator3($base->rows, $count, $page, $total_pages, $start);
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

    public function FormPembatalanAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PembatalanFrm($this->Tools()->getService('PembatalanTable')->getcomboDisposisi(), $this->Tools()->getService('PembatalanTable')->getcomboLapangan());
        if ($this->getRequest()->isPost()) {
            $base = new PembatalanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('PembatalanTable')->simpanpembatalan($base, $session);
                return $this->redirect()->toRoute('pembatalan');
            }
        }
        $view = new ViewModel(array(
            'form' => $form
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

    public function cariKetetapanAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jenisketetapan = substr($data_get->t_kodebayar, 4, 2);
        $dataKetetapan = $this->Tools()->getService('PembatalanTable')->getDataKetetapanForPembatalan($data_get->t_kodebayar);
        if ($t_jenisketetapan == 2) {
            $id_ketetapan = $dataKetetapan['t_idtransaksi'];
            if($dataKetetapan['t_tglpembayaran'] == null){
                $dataKetetapan['t_tglpembayaran'] = null;
            }
            $t_namaketetapan = 'SKPD';
        } elseif ($t_jenisketetapan == 5) {
            $id_ketetapan = $dataKetetapan['t_idskpdkb'];
            $t_namaketetapan = 'SKPDKB';
        } elseif ($t_jenisketetapan == 6) {
            $t_namaketetapan = 'SKPDKBT';
        } elseif ($t_jenisketetapan == 10) {
            $t_namaketetapan = 'SKPDT';
        }

        $status = 0; //  jika data tidak ditemukan
        
        if (!empty($dataKetetapan['t_idpembatalan'])) { // jika sudah dibatalkan
            $status = 1;
        } else {
            if ($dataKetetapan['t_tglpembayaran'] != null) { // jika sudah dibayarkan
                $status = 2;
            } elseif ($dataKetetapan['t_tglpembayaran'] == null) { // jika belum dibayarkan dan dibatalkan
                $status = 3;
            }
        }
        $data = array(
            't_idketetapan' => $id_ketetapan,
            't_jenispajak' => $dataKetetapan['t_jenispajak'],
            't_jenisketetapan' => (int) $t_jenisketetapan,
            't_namawp' => $dataKetetapan['t_namawp'],
            't_npwpdwp' => $dataKetetapan['t_npwpdwp'],
            't_alamat_lengkap' => $dataKetetapan['t_alamat_lengkapwp'],
            't_namaobjek' => $dataKetetapan['t_namaobjek'],
            't_nop' => $dataKetetapan['t_nop'],
            't_alamatlengkapobjek' => $dataKetetapan['t_alamatlengkapobjek'],
            't_namaketetapan' => $t_namaketetapan,
            't_nopenetapan' => $dataKetetapan['t_nopenetapan'],
            't_tgljatuhtempo' => date('d-m-Y', strtotime($dataKetetapan['t_tgljatuhtempo'])),
            't_tglpenetapan' => date('d-m-Y', strtotime($dataKetetapan['t_tglpenetapan'])),
            't_jmlhpajak' => number_format($dataKetetapan['t_jmlhpajak'], 0, ',', '.'),
            'status' => $status
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function dataPembatalanAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        if ($data_get['t_jenisketetapan'] == 2) { // SKPD
            $data = $this->Tools()->getService('PembatalanTable')->getDatabyIDPembatalanSkpd($data_get['t_idpembatalan'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 4) { // SKPD Jabatan
            $data = $this->Tools()->getService('PembatalanTable')->getDatabyIDPembatalanSkpdjab($data_get['t_idpembatalan'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 5) { // SKPDKB
            $data = $this->Tools()->getService('PembatalanTable')->getDatabyIDPembatalanSkpdkb($data_get['t_idpembatalan'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 6) { // SKPDKBT
            $data = $this->Tools()->getService('PembatalanTable')->getDatabyIDPembatalanSkpdkbt($data_get['t_idpembatalan'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 10) { // SKPDT
            $data = $this->Tools()->getService('PembatalanTable')->getDatabyIDPembatalanSkpdt($data_get['t_idpembatalan'], $data_get['t_jenisketetapan']);
        }
        $data_render = array(
            "idtransaksi" => $data['t_idtransaksi'],
            "namawp" => $data['t_namawp'],
            "alamatwp" => $data['t_alamat_lengkapwp']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetakpembatalanAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();

        if ($data_get['t_jenisketetapan'] == 2) { // SKPD
            $data = $this->Tools()->getService('PembatalanTable')->getDatabyIDPembatalanSkpd($data_get['t_idpembatalan'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 4) { // SKPD Jabatan
            $data = $this->Tools()->getService('PembatalanTable')->getDatabyIDPembatalanSkpdjab($data_get['t_idpembatalan'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 5) { // SKPDKB
            $data = $this->Tools()->getService('PembatalanTable')->getDatabyIDPembatalanSkpdkb($data_get['t_idpembatalan'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 6) { // SKPDKBT
            $data = $this->Tools()->getService('PembatalanTable')->getDatabyIDPembatalanSkpdkbt($data_get['t_idpembatalan'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 10) { // SKPDT
            $data = $this->Tools()->getService('PembatalanTable')->getDatabyIDPembatalanSkpdt($data_get['t_idpembatalan'], $data_get['t_jenisketetapan']);
        }

        $data_detail0 = $this->Tools()->getService('PembatalanTable')->getDatabyIDPembatalan($data['t_idketetapan']);
        $data_detail = array();
        foreach ($data_detail0 as $data_detail0) {
            $data_detail[] = $data_detail0;
        }

        $dasarbunga = 0;
        foreach ($data_detail as $row) {
            $dasarbunga += $row['t_nominalpembatalan'];
        }

        $html = "";
        $html .= "  <tr>
                        <td style='padding-left: 10px'></td>
                        <td style='width:35%'></td>
                        <td style='width:20%'>Pembatalan Pokok</td>
                        <td style='width:20%'>Biaya Adm./Bunga</td>
                        <td style='width:20%'>Jumlah Pembatalan</td>
                    </tr>";
        $t_nominalpembatalan = 0;
        $t_bunga = 0;
        $t_total = 0;
        $pengurangansebelumnya = 0;
        $dasarbunga1 = 0;
        foreach ($data_detail as $row) {
            $dasarbunga1 = $dasarbunga - $pengurangansebelumnya;
            $pengurangansebelumnya += $row['t_nominalpembatalan'];
            $jatuhtempo = strtotime($data['t_tgljatuhtempo']);
            $jadwalbayar = strtotime($row['t_tgljadwalpembatalan']);
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
                        <td>Tgl. " . date('d-m-Y', strtotime($row['t_tgljadwalpembatalan'])) . " Pembatalan ke " . $row['t_pembatalanke'] . "</td>
                        <td>Rp.<span style='padding-right:5px; text-align:right'> " . number_format($row['t_nominalpembatalan'], 0, ',', '.') . "</span></td>
                        <td>Rp.<span style='padding-right:5px; text-align:right'> " . number_format($jmlbunga, 0, ',', '.') . "</span></td>
                        <td>Rp.<span style='padding-right:5px; text-align:right'> " . number_format($row['t_nominalpembatalan'] + $jmlbunga, 0, ',', '.') . "</span></td>
                    </tr>";
            $t_nominalpembatalan += $row['t_nominalpembatalan'];
            $t_bunga += $jmlbunga;
            $t_total += $row['t_nominalpembatalan'] + $jmlbunga;
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
                        <td>Rp. " . number_format($t_nominalpembatalan, 0, ',', '.') . "</td>
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
            'detail_pembatalan' => $html
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function formattglAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $tlg = (int) substr($data_get->tgl, 0, 2);

        $jam = (int) substr($data_get->tgl, 2, 2);
        if ($jam < 1) {
            $jam = 1;
        } elseif ($jam > 12) {
            $jam = 12;
        }

        $thn = substr($data_get->tgl, 4, 5);
        $tglfix = str_pad($tlg, 2, "0", STR_PAD_LEFT) . "-" . str_pad($jam, 2, "0", STR_PAD_LEFT) . "-20" . $thn;
        if ($tlg < 1) {
            $tglfix = "01-" . str_pad($jam, 2, "0", STR_PAD_LEFT) . "-20" . $thn;
        } elseif ($tlg > 28) {
            $tglfix0 = "28-" . str_pad($jam, 2, "0", STR_PAD_LEFT) . "-20" . $thn;
            $tglfix = date('t-m-Y', strtotime($tglfix0));
        }
        $data = array(
            'tgl' => $tglfix
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function formatjamAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $jam = (int) substr($data_get->jam, 0, 2);

        $menit = (int) substr($data_get->jam, 2, 2);
        if ($jam < 0) {
            $jam = 0;
        } elseif ($jam > 23) {
            $jam = 23;
        }

        if ($menit < 0) {
            $menit = 0;
        } elseif ($menit > 60) {
            $menit = 60;
        }

        $jamfix = str_pad($jam, 2, "0", STR_PAD_LEFT) . ":" . str_pad($menit, 2, "0", STR_PAD_LEFT);
        $data = array(
            'jam' => $jamfix
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

}
