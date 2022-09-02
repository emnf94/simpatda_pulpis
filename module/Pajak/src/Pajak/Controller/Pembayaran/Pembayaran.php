<?php

namespace Pajak\Controller\Pembayaran;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Pembayaran\PembayaranFrm;
use Pajak\Model\Pembayaran\PembayaranBase;

class Pembayaran extends AbstractActionController
{

    public function indexAction()
    {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();

        if ($session['s_akses'] != 2 && $session['s_akses'] != 6) {
            return $this->redirect()->toRoute('main');;
        } else {


            $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
            $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
            $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getdata();
            $recordspejabat = array();
            foreach ($ar_ttd0 as $ar_ttd0) {
                $recordspejabat[] = $ar_ttd0;
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
                'ar_ttd0' => $recordspejabat,
                'ar_kecamatan' => $recordskecamatan,
                'dataobjek' => $recordspajak
            ));
            $data = array(
                'data_pemda' => $ar_pemda,
                'datauser' => $session,
                'dataobjek' => $recordspajak
            );
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function dataGridSptpdAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new PembayaranBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembayaranTable')->getGridCountSptpd($base, $post);
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
        $data = $this->Tools()->getService('PembayaranTable')->getGridDataSptpd($base, $start, $post);
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

            // var_dump($tambahanbulan);exit;

            $jmlbulan = (($year2 - $year1) * 12) + ($month2 - $month1 + $tambahanbulan);
            if ($jmlbulan > 24) {
                $jmlbulan = 24;
                $jmldenda = $jmlbulan * 2 / 100 * ($row['t_jmlhpajak'] - $row['t_jmlhkenaikan']);
            } elseif ($jmlbulan <= 0) {
                $jmlbulan = 0;
                $jmldenda = $jmlbulan * 2 / 100 * ($row['t_jmlhpajak'] - $row['t_jmlhkenaikan']);
            } else {
                $jmldenda = $jmlbulan * 2 / 100 * ($row['t_jmlhpajak'] - $row['t_jmlhkenaikan']);
            }
            // katering
            if ((int)$row['t_idkorek'] == 34 || (int)$row['t_idkorek'] == 33) {
                $jmldenda = 0;
                $jmlbulan = 0;
            }

            $no_sptpd = (!empty($row['t_nourut'])) ? $row['t_nourut'] : $row['t_noskpdjab'] . ' [Jab] ';
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SPTPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $no_sptpd . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Jenis Pajak'>" . $row['s_namajenis'] . "</td>";
            $s .= "<td data-title='Masa Pajak'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>";

            $s .= "<td data-title='Kode Bayar'><center><b style='color:blue;'>" . $row['t_kodebayar'] . "</b></center></td>";

            if (empty($row['t_tglpembayaran'])) {
                $s .= "<td data-title='Pajak' style='text-align: center'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            } else {
                $s .= "<td data-title='Pajak' style='text-align: center'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "<button style='width: 100%' class='btn btn-success btn-xs'>Lunas<br><p style='color:green'>" . $row['t_tglpembayaran'] . "</button>" . "</td>";
                "<td data-title='Pajak' style='text-align: center'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            }

            if ($jmldenda == 0) {
                $s .= "<td data-title='Denda'><center>" . $jmlbulan . " bulan / " . number_format($jmldenda, 0, ',', '.') . "</center></td>";
                if (empty($row['t_tglpembayaran'])) {
                    $s .= "<td data-title='Tunggakan' style='text-align: right'>"
                        . number_format($row['t_jmlhpajak'] + $jmldenda, 0, ',', '.') .
                        "</td>";
                } else {
                    $s .= "<td data-title='Tunggakan' style='text-align: right'>0</td>";
                }
            } else {
                if (empty($row['t_tglbayardenda'])) {
                    $s .= "<td data-title='Denda'><center>" . $jmlbulan . " bulan / " . number_format($jmldenda, 0, ',', '.') . "</center></td>";
                    if (empty($row['t_tglpembayaran'])) {
                        $s .= "<td data-title='Tunggakan' style='text-align: right'>"
                            . number_format($row['t_jmlhpajak'] + $jmldenda, 0, ',', '.') .
                            "</td>";
                    } else {
                        if (empty($row['t_nostpd'])) {
                            $s .= "<td data-title='Tunggakan' style='text-align: right'>0</td>";
                        } else {
                            $s .= "<td data-title='Tunggakan' style='text-align: right'>"
                                . number_format($jmldenda, 0, ',', '.') .
                                "</td>";
                        }
                    }
                } else {
                    $s .= "<td data-title='Denda'><center>" . $jmlbulan . " bulan / " . number_format($jmldenda, 0, ',', '.') . " <button style='width: 100%' class='btn btn-success btn-xs'>Lunas</button><br><p style='color:green'>" . $row['t_tgldendapembayaran'] . "</center></td>";
                    if (empty($row['t_tglpembayaran'])) {
                        $s .= "<td data-title='Tunggakan' style='text-align: right'>"
                            . number_format($row['t_jmlhpajak'], 0, ',', '.') .
                            "</td>";
                    } else {
                        $s .= "<td data-title='Tunggakan' style='text-align: right'>0</td>";
                    }
                }
            }


            if (empty($row['t_tglpembayaran'])) {
                // $s .= "<td data-title='Denda'><center>" . $jmlbulan . " bulan / " . number_format($jmldenda, 0, ',', '.') . "</center></td>";
                // $s .= "<td data-title='Tunggakan' style='text-align: right'>" . number_format($row['t_jmlhpajak'] + $jmldenda, 0, ',', '.') . "</td>";
                $s .= "<td data-title='#'><center><a href='pembayaran/form_pembayaran?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-dollar'></i> Bayar</a></center></td>";
            } else {
                $hapus = "";
                $operator = "";
                if ($session['s_akses'] == 2) {
                    if ($session['s_iduser'] == 1) {
                        $hapus = "<a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyph-icon icon-trash'></i> Hapus</a>";
                    } else {
                        $hapus = "<a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyph-icon icon-trash'></i> Hapus</a>";
                    }
                    $operator = $row['s_namapembayar'];
                }
                // $s .= "<td colspan='2' data-title='Pembayaran'><center><b style='color:green'>Lunas / " . number_format($row['t_jmlhpembayaran'] + $row['t_jmlhdendapembayaran'], 0, ',', '.') . "<br> " . date('d-m-Y', strtotime($row['t_tglpembayaran'])) . "</b></center></td>";
                if ($row['s_jenispungutan'] == 'Pajak') {
                    $s .= "<td data-title='#'><center> <button onclick='bukaCetakSSPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SSPD'><i class='glyph-icon icon-print'></i> SSPD </button> $hapus <br>$operator</center></td>";
                } elseif ($row['s_jenispungutan'] == 'Retribusi') {
                    $s .= "<td data-title='#'><center> <button onclick='bukaCetakSSRD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SSPD'><i class='glyph-icon icon-print'></i> SSRD </button> $hapus <br>$operator</center></td>";
                }
            }
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "grid" => $s,
            "rows" => $base->rows,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages,
            "paginatore" => $datapaging['paginatore'],
            "akhirdata" => $datapaging['akhirdata'],
            "awaldata" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function FormPembayaranAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        if ($session['s_akses'] != 2 && $session['s_akses'] != 6) {
            return $this->redirect()->toRoute('main');;
        } else {
            $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
            $req = $this->getRequest();
            $form = new PembayaranFrm();
            if ($req->isGet()) {
                $id = (int) $req->getQuery()->get('t_idtransaksi');
                $datapenetapan = $this->Tools()->getService('PenetapanTable')->getPenetapan($id);
                $datapenetapan['t_tgldaftar'] = date('d-m-Y', strtotime($datapenetapan['t_tgldaftar']));
                $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
                $data->t_idtransaksi = $id;

                // var_dump($datapenetapan);exit();
                // pokok
                $data->t_jmlhpajak = number_format($datapenetapan['t_jmlhpajak'], 0, ',', '.');
                $data->t_tglpembayaran = date('d-m-Y');

                // denda
                $jatuhtempo = $datapenetapan['t_tgljatuhtempo'];
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
                    $jmldenda = $jmlbulan * 2 / 100 * ($datapenetapan['t_jmlhpajak'] - $datapenetapan['t_jmlhkenaikan']);
                } elseif ($jmlbulan <= 0) {
                    $jmlbulan = 0;
                    $jmldenda = $jmlbulan * 2 / 100 * ($datapenetapan['t_jmlhpajak'] - $datapenetapan['t_jmlhkenaikan']);
                } else {
                    $jmldenda = $jmlbulan * 2 / 100 * ($datapenetapan['t_jmlhpajak'] - $datapenetapan['t_jmlhkenaikan']);
                }
                $data->t_jmlhdendapembayaran = number_format($jmldenda, 0, ',', '.');
                $data->t_jmlhbulandendapembayaran = $jmlbulan;

                //katering
                $cekkatering = $this->Tools()->getService('PendataanTable')->getdatabyidtransakasi($id);
                if ((int)$cekkatering['t_idkorek'] == 34) {
                    $jmldenda = 0;
                    $data->t_jmlhdendapembayaran = 0;
                    $data->t_jmlhbulandendapembayaran = 0;
                    $datapenetapan['t_tgljatuhtempo'] = date("Y-m-d", strtotime($datapenetapan['t_masaakhir'] . '+30 days'));
                }
                // var_dump($datapenetapan);exit();
                // tunggakan
                $data->t_jmlhpembayaran = number_format($datapenetapan['t_jmlhpajak'] + $jmldenda, 0, ',', '.');
                $form->bind($data);
            }
            if ($this->getRequest()->isPost()) {
                $base = new PembayaranBase();
                $form->setInputFilter($base->getInputFilter());
                $post = $req->getPost()->toArray();

                $form->setData($post);
                if ($form->isValid()) {
                    $base->exchangeArray($form->getData());
                    $this->Tools()->getService('PembayaranTable')->simpanpembayaran($base, $session, $post);
                    return $this->redirect()->toRoute('pembayaran');
                }
            }
            // var_dump($form);exit();
            $view = new ViewModel(array(
                'form' => $form,
                'datapenetapan' => $datapenetapan
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
    }

    public function dataGridSkpdkbAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new \Pajak\Model\Skpdkb\SkpdkbBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembayaranTable')->getGridCountSkpdkb($base, $post);
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
        $data = $this->Tools()->getService('PembayaranTable')->getGridDataSkpdkb($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SKPDKB'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_noskpdkb'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Jenis Pajak'>" . $row['s_namajenis'] . "</td>";
            $s .= "<td data-title='Masa Pajak'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>";
            $s .= "<td data-title='Kode Bayar'><center><b style='color:blue;'>" . $row['t_kodebayarskpdkb'] . "</b></center></td>";
            $s .= "<td data-title='Pajak' style='text-align: right'>" . number_format($row['t_jmlhpajakskpdkb'], 0, ',', '.') . "</td>";
            if (empty($row['t_tglbayarskpdkb'])) {
                $s .= "<td data-title='Denda' style='text-align: right'>" . number_format($row['t_jmlhdendaskpdkb'], 0, ',', '.') . "</td>";
                $s .= "<td data-title='Tunggakan' style='text-align: right'>" . number_format($row['t_totalskpdkb'], 0, ',', '.') . "</td>";
                $s .= "<td data-title='#'><center><a href='pembayaran/form_pembayaranskpdkb?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-dollar'></i> Bayar</a></center></td>";
            } else {
                $hapus = "";
                $operator = "";
                if ($session['s_akses'] == 2) {
                    if ($session['s_iduser'] == 1) {
                        $hapus = "";
                    } else {
                        $hapus = "<a href='#' onclick='hapusskpdkb(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyph-icon icon-trash'></i> Hapus</a>";
                    }
                    $operator = $row['s_nama'];
                }
                $s .= "<td colspan='2' data-title='Pembayaran'><center><b style='color:green'>Lunas / " . number_format($row['t_jmlhbayarskpdkb'], 0, ',', '.') . "<br>" . date('d-m-Y', strtotime($row['t_tglbayarskpdkb'])) . "</b></center></td>";
                $s .= "<td data-title='#'><center> <button onclick='bukaCetakSSPDSKPDKB($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SSPD'><i class='glyph-icon icon-print'></i> SSPD </button> $hapus <br>$operator</center></td>";
            }
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator1($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "grid" => $s,
            "rows" => $base->rows,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages,
            "paginatore" => $datapaging['paginatore'],
            "akhirdata" => $datapaging['akhirdata'],
            "awaldata" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function FormPembayaranskpdkbAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Skpdkb\SkpdkbPembayaranFrm();
        // masuk form
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datatransaksi = $this->Tools()->getService('SkpdkbTable')->getTransaksiSKPDKBByIdTransaksi($id);
            $datatransaksi['t_tgldaftar'] = date('d-m-Y', strtotime($datatransaksi['t_tgldaftar']));
            $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
            $data->t_idskpdkb = $datatransaksi['t_idskpdkb'];
            $data->t_jmlhbayarskpdkb = number_format($datatransaksi['t_totalskpdkb'], 0, ',', '.');
            $form->bind($data);
        }
        // simpan data
        if ($this->getRequest()->isPost()) {
            $base = new \Pajak\Model\Skpdkb\SkpdkbPembayaranBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('SkpdkbTable')->simpanpembayaranskpdkb($base, $session);
                return $this->redirect()->toRoute('pembayaran');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datatransaksi' => $datatransaksi
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

    public function dataGridSkpdkbtAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new \Pajak\Model\Skpdkbt\SkpdkbtBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembayaranTable')->getGridCountSkpdkbt($base, $post);
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
        $data = $this->Tools()->getService('PembayaranTable')->getGridDataSkpdkbt($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SKPDKBT'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_noskpdkbt'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Jenis Pajak'>" . $row['s_namajenis'] . "</td>";
            $s .= "<td data-title='Masa Pajak'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>";
            $s .= "<td data-title='Kode Bayar'><center><b style='color:blue;'>" . $row['t_kodebayarskpdkbt'] . "</b></center></td>";
            $s .= "<td data-title='Pajak' style='text-align: right'>" . number_format($row['t_jmlhpajakskpdkbt'], 0, ',', '.') . "</td>";
            if (empty($row['t_tglbayarskpdkbt'])) {
                $s .= "<td data-title='Denda' style='text-align: right'>" . number_format($row['t_jmlhdendaskpdkbt'], 0, ',', '.') . "</td>";
                $s .= "<td data-title='Tunggakan' style='text-align: right'>" . number_format($row['t_totalskpdkbt'], 0, ',', '.') . "</td>";
                $s .= "<td data-title='#'><center><a href='pembayaran/form_pembayaranskpdkbt?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-dollar'></i> Bayar</a></center></td>";
            } else {
                $hapus = "";
                $operator = "";
                if ($session['s_akses'] == 2) {
                    $hapus = "<a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyph-icon icon-trash'></i> Hapus</a>";
                    $operator = $row['s_nama'];
                }
                $s .= "<td colspan='2' data-title='Pembayaran'><center><b style='color:green'>Lunas / " . number_format($row['t_jmlhbayarskpdkbt'], 0, ',', '.') . "<br>" . date('d-m-Y', strtotime($row['t_tglbayarskpdkbt'])) . "</b></center></td>";
                $s .= "<td data-title='#'><center> <button onclick='bukaCetakSSPDSKPDKBT($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SSPD'><i class='glyph-icon icon-print'></i> SSPD </button> $hapus <br>$operator</center></td>";
            }
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator2($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "grid" => $s,
            "rows" => $base->rows,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages,
            "paginatore" => $datapaging['paginatore'],
            "akhirdata" => $datapaging['akhirdata'],
            "awaldata" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function FormPembayaranskpdkbtAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Skpdkbt\SkpdkbtPembayaranFrm();
        // masuk form
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datatransaksi = $this->Tools()->getService('SkpdkbtTable')->getTransaksiSKPDKBTByIdTransaksi($id);
            $datatransaksi['t_tgldaftar'] = date('d-m-Y', strtotime($datatransaksi['t_tgldaftar']));
            $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
            $data->t_idskpdkbt = $datatransaksi['t_idskpdkbt'];
            $data->t_jmlhbayarskpdkbt = number_format($datatransaksi['t_totalskpdkbt'], 0, ',', '.');
            $form->bind($data);
        }
        // simpan data
        if ($this->getRequest()->isPost()) {
            $base = new \Pajak\Model\Skpdkbt\SkpdkbtPembayaranBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('SkpdkbtTable')->simpanpembayaranskpdkbt($base, $session);
                return $this->redirect()->toRoute('pembayaran');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datatransaksi' => $datatransaksi
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

    public function dataGridSkpdlbAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new \Pajak\Model\Skpdlb\SkpdlbBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembayaranTable')->getGridCountSkpdlb($base, $post);
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
        $data = $this->Tools()->getService('PembayaranTable')->getGridDataSkpdlb($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SKPDLB'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_noskpdlb'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Jenis Pajak'>" . $row['s_namajenis'] . "</td>";
            $s .= "<td data-title='Masa Pajak'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>";
            $s .= "<td data-title='Kode Bayar'><center><b style='color:blue;'>" . $row['t_kodebayarskpdlb'] . "</b></center></td>";
            $s .= "<td data-title='Pajak' style='text-align: right'>" . number_format($row['t_totalskpdlb'], 0, ',', '.') . "</td>";
            if (empty($row['t_tglpengembalianskpdlb'])) {
                $s .= "<td data-title='Denda' style='text-align: right'>0</td>";
                $s .= "<td data-title='Tunggakan' style='text-align: right'>" . number_format($row['t_totalskpdlb'], 0, ',', '.') . "</td>";
                $s .= "<td data-title='#'><center><a href='pembayaran/form_pengembalianskpdlb?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-dollar'></i> Bayar</a></center></td>";
            } else {
                $hapus = "";
                $operator = "";
                if ($session['s_akses'] == 2) {
                    $hapus = "<a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyph-icon icon-trash'></i> Hapus</a>";
                    $operator = $row['s_nama'];
                }
                $s .= "<td colspan='2' data-title='Pengembalian'><center><b style='color:green'>Lunas / " . number_format($row['t_jmlhpengembalianskpdlb'], 0, ',', '.') . "<br>" . date('d-m-Y', strtotime($row['t_tglbayarskpdlb'])) . "</b></center></td>";
                $s .= "<td data-title='#'><center> <button onclick='bukaCetakSSPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SSPD'><i class='glyph-icon icon-print'></i> SSPD </button> $hapus <br>$operator</center></td>";
            }
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator3($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "grid" => $s,
            "rows" => $base->rows,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages,
            "paginatore" => $datapaging['paginatore'],
            "akhirdata" => $datapaging['akhirdata'],
            "awaldata" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function FormPengembalianskpdlbAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Skpdlb\SkpdlbPengembalianFrm();
        // masuk form
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datatransaksi = $this->Tools()->getService('SkpdlbTable')->getTransaksiSKPDLBByIdTransaksi($id);
            $datatransaksi['t_tgldaftar'] = date('d-m-Y', strtotime($datatransaksi['t_tgldaftar']));
            $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
            $data->t_idskpdlb = $datatransaksi['t_idskpdlb'];
            $data->t_jmlhpengembalianskpdlb = number_format($datatransaksi['t_totalskpdlb'], 0, ',', '.');
            $form->bind($data);
        }
        // simpan data
        if ($this->getRequest()->isPost()) {
            $base = new \Pajak\Model\Skpdlb\SkpdlbPengembalianBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('SkpdlbTable')->simpanpembayaranskpdlb($base, $session);
                return $this->redirect()->toRoute('pembayaran');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datatransaksi' => $datatransaksi
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

    public function dataGridSkpdtAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new \Pajak\Model\Skpdt\SkpdtBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PembayaranTable')->getGridCountSkpdt($base, $post);
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
        $data = $this->Tools()->getService('PembayaranTable')->getGridDataSkpdt($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            // var_dump($row['t_kodebayarskpdt']);
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SKPDT'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_noskpdt'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Jenis Pajak'>" . $row['s_namajenis'] . "</td>";
            $s .= "<td data-title='Masa Pajak'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>";
            $s .= "<td data-title='Kode Bayar'><center><b style='color:blue;'>" . $row['t_kodebayarskpdt'] . "</b></center></td>";
            $s .= "<td data-title='Pajak' style='text-align: right'>" . number_format($row['t_jmlhpajakskpdt'], 0, ',', '.') . "</td>";
            if (empty($row['t_tglbayarskpdt'])) {
                $s .= "<td data-title='Denda' style='text-align: right'>" . number_format($row['t_jmlhdendaskpdt'], 0, ',', '.') . "</td>";
                $s .= "<td data-title='Tunggakan' style='text-align: right'>" . number_format($row['t_totalskpdt'], 0, ',', '.') . "</td>";
                $s .= "<td data-title='#'><center><a href='pembayaran/form_pembayaranskpdt?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-dollar'></i> Bayar</a></center></td>";
            } else {
                $hapus = "";
                $operator = "";
                if ($session['s_akses'] == 2) {
                    $hapus = "<a href='#' onclick='hapusskpdt(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyph-icon icon-trash'></i> Hapus</a>";
                    $operator = $row['s_nama'];
                }
                $s .= "<td colspan='2' data-title='Pembayaran'><center><b style='color:green'>Lunas / " . number_format($row['t_jmlhbayarskpdt'], 0, ',', '.') . "<br>" . date('d-m-Y', strtotime($row['t_tglbayarskpdt'])) . "</b></center></td>";
                $s .= "<td data-title='#'><center> <button onclick='bukaCetakSSPDSKPDT($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SSPD'><i class='glyph-icon icon-print'></i> SSPD </button> $hapus <br>$operator</center></td>";
            }
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator4($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "grid" => $s,
            "rows" => $base->rows,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages,
            "paginatore" => $datapaging['paginatore'],
            "akhirdata" => $datapaging['akhirdata'],
            "awaldata" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function FormPembayaranskpdtAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Skpdt\SkpdtPembayaranFrm();
        // masuk form
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datatransaksi = $this->Tools()->getService('SkpdtTable')->getTransaksiSKPDTByIdTransaksi($id);
            $datatransaksi['t_tgldaftar'] = date('d-m-Y', strtotime($datatransaksi['t_tgldaftar']));
            $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
            $data->t_idskpdt = $datatransaksi['t_idskpdt'];
            $data->t_jmlhbayarskpdt = number_format($datatransaksi['t_totalskpdt'], 0, ',', '.');
            $form->bind($data);
        }
        // simpan data
        if ($this->getRequest()->isPost()) {
            $base = new \Pajak\Model\Skpdt\SkpdtPembayaranBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('SkpdtTable')->simpanpembayaranskpdt($base, $session);
                return $this->redirect()->toRoute('pembayaran');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datatransaksi' => $datatransaksi
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

    public function hitungpembayaranAction()
    {
        /** Mendapatkan Data Pembayaran
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $id = (int) $data_get['t_idtransaksi'];
        $datapenetapan = $this->Tools()->getService('PenetapanTable')->getPenetapan($id);

        if ($data_get['t_jenisketetapandenda'] == 1) {
            $t_jmlhpembayaran = number_format(str_ireplace(".", "", $data_get['t_jmlhpajak']), 0, ',', '.');
            $t_jmlhbulandendapembayaran = 0;
            $t_jmlhdendapembayaran = 0;
        } elseif ($data_get['t_jenisketetapandenda'] == 2) {
            // denda
            $jatuhtempo = date('Y-m-d', strtotime($data_get['t_tgljatuhtempo']));
            $tglbayar = date('Y-m-d', strtotime($data_get['t_tglpembayaran']));

            $ts1 = strtotime($jatuhtempo);
            $ts2 = strtotime($tglbayar);

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
                $jmldenda = $jmlbulan * 2 / 100 * (str_ireplace(".", "", $data_get['t_jmlhpajak']) - $datapenetapan['t_jmlhkenaikan']);
            } elseif ($jmlbulan <= 0) {
                $jmlbulan = 0;
                $jmldenda = $jmlbulan * 2 / 100 * (str_ireplace(".", "", $data_get['t_jmlhpajak']) - $datapenetapan['t_jmlhkenaikan']);
            } else {
                $jmldenda = $jmlbulan * 2 / 100 * (str_ireplace(".", "", $data_get['t_jmlhpajak']) - $datapenetapan['t_jmlhkenaikan']);
            }
            $t_jmlhdendapembayaran = number_format($jmldenda, 0, ',', '.');
            $t_jmlhbulandendapembayaran = $jmlbulan;
            // tunggakan
            $t_jmlhpembayaran = number_format(str_ireplace(".", "", $data_get['t_jmlhpajak']), 0, ',', '.');
        } elseif ($data_get['t_jenisketetapandenda'] == 3) {
            // denda
            $jatuhtempo = date('Y-m-d', strtotime($data_get['t_tgljatuhtempo']));
            $tglbayar = date('Y-m-d', strtotime($data_get['t_tglpembayaran']));

            $ts1 = strtotime($jatuhtempo);
            $ts2 = strtotime($tglbayar);

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
                $jmldenda = $jmlbulan * 2 / 100 * (str_ireplace(".", "", $data_get['t_jmlhpajak']) - $datapenetapan['t_jmlhkenaikan']);
            } elseif ($jmlbulan <= 0) {
                $jmlbulan = 0;
                $jmldenda = $jmlbulan * 2 / 100 * (str_ireplace(".", "", $data_get['t_jmlhpajak']) - $datapenetapan['t_jmlhkenaikan']);
            } else {
                $jmldenda = $jmlbulan * 2 / 100 * (str_ireplace(".", "", $data_get['t_jmlhpajak']) - $datapenetapan['t_jmlhkenaikan']);
            }
            $t_jmlhdendapembayaran = number_format($jmldenda, 0, ',', '.');
            $t_jmlhbulandendapembayaran = $jmlbulan;
            // tunggakan

            if ($data_get['t_jmlhdendapembayaran'] == 0) {
                $t_jmlhpembayaran = number_format(str_ireplace(".", "", $data_get['t_jmlhpajak']), 0, ',', '.');
            } else {
                $t_jmlhpembayaran = number_format(str_ireplace(".", "", $data_get['t_jmlhpajak']) + $jmldenda, 0, ',', '.');
            }
        }

        $data_render = array(
            "t_jmlhpembayaran" => $t_jmlhpembayaran,
            "t_jmlhbulandendapembayaran" => $t_jmlhbulandendapembayaran,
            "t_jmlhdendapembayaran" => $t_jmlhdendapembayaran
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hapusAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('PembayaranTable')->hapusPembayaran($this->params('page'), $session);
        return $this->getResponse();
    }

    public function hapusSkpdkbAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('SkpdkbTable')->hapuspembayaranSkpdkb($this->params('page'), $session);
        return $this->getResponse();
    }

    public function dataPembayaranAction()
    {
        /** Mendapatkan Data Pembayaran
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PembayaranTable')->getDataPembayaranID($data_get['idtransaksi']);
        $data_render = array(
            "idtransaksi" => $data['t_idtransaksi'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat_lengkap'],
            "tglpembayaran" => date('d-m-Y', strtotime($data['t_tglpembayaran'])),
            "jenispajaksptpd" => $data['s_namajenispajak'],
            "idjenispajaksptpd" => $data['t_jenispajak'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetaksspdAction()
    {

        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PembayaranTable')->getDataPembayaranID($data_get['idtransaksi']);
        if ($data['s_jenisobjek'] == 4) {
            $datareklame = $this->Tools()->getService('PenetapanTable')->getDataPenetapanReklame($data_get['idtransaksi']);
            $dataukuran = $this->Tools()->getService('DetailreklameTable')->getketeranganukuran($datareklame['t_ukuranmedia']);
            $ar_jenisreklame = $this->Tools()->getService('ReklameTable')->getDataTarifReklame($datareklame['t_jenisreklame']);
        } elseif ($data['s_jenisobjek'] == 8) {
            $detailair = $this->Tools()->getService('PenetapanTable')->getDataPenetapanABT($data_get['idtransaksi']);
        } elseif ($data['s_jenisobjek'] == 9) {
            $datawalet = $this->Tools()->getService('PendataanTable')->getPendataanWalet($data_get['idtransaksi']);
        }


        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
            'detailair' => $detailair,
            'datareklame' => $datareklame,
            'dataukuran' => $dataukuran,
            'ar_jenisreklame' => $ar_jenisreklame,
            'peruntukan_air' => $peruntukan_air,
            'datawalet' => $datawalet
        ));

        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetaksspdminerbaAction()
    {
        /** Cetak SSPD
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PembayaranTable')->getDataPembayaranID($data_get['idtransaksi']);
        $datadetail = $this->Tools()->getService('PendataanTable')->getDataDetailMinerba($data_get['idtransaksi']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
            'datadetail' => $datadetail
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetakssrdAction()
    {
        /** Cetak SSRD
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PembayaranTable')->getDataPembayaranID($data_get['idtransaksi']);

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetaksspdskpdkbAction()
    {
        /** Cetak SSPD SKPDKB
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PembayaranTable')->getDataPembayaranIDSKPDKB($data_get['idtransaksi']);

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetaksspdskpdkbtAction()
    {
        /** Cetak SSPD SKPDKB
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PembayaranTable')->getDataPembayaranIDSKPDKBT($data_get['idtransaksi']);

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetaksspdskpdtAction()
    {
        /** Cetak SSPD SKPDKB
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PembayaranTable')->getDataPembayaranIDSKPDT($data_get['idtransaksi']);

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetakpembayaranAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // var_dump($data_get->tglbayar1); exit();
        if ($data_get->jenisketetapan == 'SPTPD/SKPD') { // SPTPD/SKPD
            $data = $this->Tools()->getService('PembayaranTable')->gePembayaranByTgl($data_get->tglbayar0, $data_get->tglbayar1, $data_get->jenispajak, $data_get->kecamatan, $data_get->kelurahan);
        } elseif ($data_get->jenisketetapan == 'SKPDKB') { // SKPDKB
            $data = $this->Tools()->getService('PembayaranTable')->gePembayaranByTglSKPDKB($data_get->tglbayar0, $data_get->tglbayar1, $data_get->jenispajak, $data_get->kecamatan, $data_get->kelurahan);
        } elseif ($data_get->jenisketetapan == 'SKPDKBT') { // SKPDKBT
            $data = $this->Tools()->getService('PembayaranTable')->gePembayaranByTglSKPDKBT($data_get->tglbayar0, $data_get->tglbayar1, $data_get->jenispajak, $data_get->kecamatan, $data_get->kelurahan);
        } elseif ($data_get->jenisketetapan == 'SKPDT') { // SKPDT
            $data = $this->Tools()->getService('PembayaranTable')->gePembayaranByTglSKPDT($data_get->tglbayar0, $data_get->tglbayar1, $data_get->jenispajak, $data_get->kecamatan, $data_get->kelurahan);
        } else { // SEMUA
            $data = $this->Tools()->getService('PembayaranTable')->gePembayaranByTglALL($data_get->tglbayar0, $data_get->tglbayar1, $data_get->jenispajak, $data_get->kecamatan, $data_get->kelurahan);
        }

        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'tglbayar0' => $data_get->tglbayar0,
                'tglbayar1' => $data_get->tglbayar1,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'jenisketetapan' => $data_get->jenisketetapan,
                'formatcetak' => $data_get->formatcetak
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'tglbayar0' => $data_get->tglbayar0,
                'tglbayar1' => $data_get->tglbayar1,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
                'jenisketetapan' => $data_get->jenisketetapan,
                'formatcetak' => $data_get->formatcetak
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetakpembayaranexcelAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PembayaranTable')->gePembayaranByTgl($data_get->tglbayar0, $data_get->tglbayar1, $data_get->jenispajak);
        $object = new \PHPExcel();
        // Add some data
        $object->getActiveSheet()->getStyle('A1:D5')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('A6:H6')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
        $object->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $object->getActiveSheet()->getStyle('H')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(20);
        $object->getActiveSheet()->mergeCells('A1:J2');
        $object->getActiveSheet()->mergeCells('A4:D4');
        $object->getActiveSheet()->mergeCells('A5:D5');
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
            ->setCellValue('A1', 'Data Pembayaran')
            // judul atas
            ->setCellValue('A4', 'Tanggal Cetak  : ' . date('d-m-Y', strtotime($data_get->tglcetak)))
            ->setCellValue('A5', 'Tanggal Bayar  : ' . date('d-m-Y', strtotime($data_get->tglbayar0)) . ' s/d ' . date('d-m-Y', strtotime($data_get->tglbayar1)))
            ->setCellValue('A6', 'No.')
            ->setCellValue('B6', 'Nama')
            ->setCellValue('C6', 'NPWPD')
            ->setCellValue('D6', 'Nama Objek')
            ->setCellValue('E6', 'NIOP')
            ->setCellValue('F6', 'Jenis Pajak')
            ->setCellValue('G6', 'Tgl. Pembayaran')
            ->setCellValue('H6', 'Jumlah Pembayaran');
        $counter = 7;
        $no = 1;
        $total_pembayaran = 0;
        $ex = $object->setActiveSheetIndex(0);
        foreach ($data as $v) {
            $ex->setCellValue("A" . $counter, $no);
            $ex->setCellValue("B" . $counter, $v['t_nama']);
            $ex->setCellValue("C" . $counter, $v['t_npwpd']);
            $ex->setCellValue("D" . $counter, $v['t_namaobjek']);
            $ex->setCellValue("E" . $counter, $v['t_nop']);
            $ex->setCellValue("F" . $counter, $v['s_namajenis']);
            $ex->setCellValue("G" . $counter, date('d-m-Y', strtotime($v['t_tglpembayaran'])));
            $ex->setCellValue("H" . $counter, $v['t_jmlhpembayaran']);
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
            $no++;
            $total_pembayaran += $v['t_jmlhpembayaran'];
        }
        $ex->setCellValue("H" . $counter, $total_pembayaran);
        $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('A' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('B' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('C' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('D' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('E' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('F' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('G' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $object->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN)
            ->getActiveSheet()->getStyle('H' . $counter)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $objWriter = \PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        //        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="cetakpembayaran.xlsx"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
        exit;
    }

    public function comboKelurahanCamatAction()
    {
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
                $opsi .= "<option value=''>--- PILIH KELURAHAN ---</option>";
                foreach ($data as $r) {
                    $opsi .= "<option value='" . $r['s_idkel'] . "'>" . str_pad($r['s_kodekel'], 2, "0", STR_PAD_LEFT) . " || " . $r['s_namakel'] . "</option>";
                }
                $res->setContent($opsi);
            }
        }
        return $res;
    }
    public function cekkorekAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PendataanTable')->getdatabyidtransakasi($data_get->t_idtransaksi);
        // var_dump($data);exit();
        if ((int)$data['t_idkorek'] == 34) {
            $opsi = "<option value=''>Silahkan Pilih</option>
                         <option value='1'>Tidak Ditetapkan Denda</option>";
        }
        $data_render = array(
            'opsi' => $opsi,
            't_idkorek' => $data['t_idkorek']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }
}
