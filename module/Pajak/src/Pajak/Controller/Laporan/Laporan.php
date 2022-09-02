<?php

namespace Pajak\Controller\Laporan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Laporan\LaporanFrm;
use Pajak\Model\Laporan\LaporanBase;

class Laporan extends AbstractActionController {

    public function indexAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $s_idjenis = $this->getEvent()->getRouteMatch()->getParam('s_idjenis');
        $jenisobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjekId($s_idjenis);
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $view = new ViewModel(array(
            'form' => $form,
            's_idjenis' => $s_idjenis,
            'jenisobjek' => $jenisobjek,
            'ar_ttd0' => $recordspejabat,
            'objekwp' => $allParams['t_idobjek']
        ));
        $recordspajak = $this->Tools()->getService('ObjekTable')->getDataObjekLeftMenu($session['s_wp']);
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
        $base = new LaporanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('LaporanTable')->getGridCount($base, $allParams['s_idjenis'], $allParams['t_idobjek']);
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
        $data = $this->Tools()->getService('LaporanTable')->getGridData($base, $start, $allParams['s_idjenis'], $allParams['t_idobjek']);
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
            $s .= "<td data-title='Tanggal Laporan'><center>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Pajak' style='color:black; text-align: right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            $t_tglpembayaran = (!empty($row['t_tglpembayaran']) ? date('d-m-Y', strtotime($row['t_tglpembayaran'])) : '-'); // returns true
            $t_jmlhpembayaran = ($row['t_jmlhpembayaran'] != 0 ? number_format($row['t_jmlhpembayaran'], 0, ',', '.') : 'Belum Bayar'); // returns true
            $s .= "<td data-title='Jumlah Pembayaran' style='color:black; text-align: right'>" . $t_tglpembayaran . " / " . $t_jmlhpembayaran . "</td>";
            if (empty($row['t_tglpembayaran'])) {
                if ($row['t_jenispajak'] == 1) {
                    $sptpd = "<a href='../cetaksptpdhotel?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak SPTPD'><i class='glyph-icon icon-print'></i></a>";
                } elseif ($row['t_jenispajak'] == 2) {
                    $sptpd = "<a href='../cetaksptpdrestoran?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak SPTPD'><i class='glyph-icon icon-print'></i></a>";
                } elseif ($row['t_jenispajak'] == 3) {
                    $sptpd = "<a href='../cetaksptpdhiburan?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak SPTPD'><i class='glyph-icon icon-print'></i></a>";
                } elseif ($row['t_jenispajak'] == 6) {
                    $sptpd = "<a href='../cetaksptpdminerba?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak SPTPD'><i class='glyph-icon icon-print'></i></a>";
                } elseif ($row['t_jenispajak'] == 7) {
                    $sptpd = "<a href='../cetaksptpdparkir?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak SPTPD'><i class='glyph-icon icon-print'></i></a>";
                }
                $kodebayar = "<a href='../cetakkodebayar?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak Kode Bayar'><i class='glyph-icon icon-print'></i></a>";
                $sspd = "";
            } else {
                $sptpd = "";
                $kodebayar = "";
                $sspd = "<a href='../cetaksspd?&t_idtransaksi=$row[t_idtransaksi]' target='_blank' class='btn btn-primary btn-xs' title='Cetak SSPD'><i class='glyph-icon icon-print'></i></a>";
            }
            $s .= "<td data-title='#'><center>$sptpd $kodebayar $sspd</center></td>";
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

    public function FormPagedefaultAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new LaporanFrm();
        if ($req->isGet()) {
            $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
            $id = $allParams['s_idjenis']; // ini sebenarnya id objek wp
            $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
            $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
            $data->t_idobjek = $datapendaftaran['t_idobjek'];
            $data->t_jenisobjek = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $data->t_jenispajak = $datapendaftaran['t_jenisobjek']; // jangan diubah
            $message = '';
//jika pernah melakukan pendataan sebelumnya
            $datakorekwp = $this->Tools()->getService('LaporanTable')->getKorekWp($id);
            $data->t_idkorek = $datakorekwp['s_idkorek'];
            $data->t_tarifpajak = $datakorekwp['s_persentarifkorek'];
            $datapendataan = $this->Tools()->getService('LaporanTable')->getLaporanMax($id);
            $data->t_nourut = (int) $datapendataan['t_nourut'] + 1;
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new LaporanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $sudahditetapkan = $this->Tools()->getService('LaporanTable')->getLaporanSeMasaWp($base, $post["t_idtransaksi"]);
                if (empty($sudahditetapkan)) {
                    $this->Tools()->getService('LaporanTable')->simpanpendataanself($base, $session, $post);
                    return $this->redirect()->toRoute("laporan", array(
                                "controllers" => "Laporan",
                                "action" => "index",
                                "s_idjenis" => $req->getPost()['t_jenisobjekpajak'],
                                "t_idobjek" => $post['t_idobjek']
                    ));
                } else {
                    $id = $base->t_idobjek;
                    $datapendaftaran = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjek($id);
                    $data = $this->Tools()->getService('ObjekTable')->getDataObjekById($id);
                    $datapendaftaran['t_tgldaftar'] = date('d-m-Y', strtotime($datapendaftaran['t_tgldaftar']));
                    $data->t_tglpendataan = date('d-m-Y');
                    $data->t_idwp = $datapendaftaran['t_idwp'];
                    $message = 'Data WP untuk bulan ' . date('m', strtotime($base->t_masapajak)) . ' tahun ' . date('Y', strtotime($base->t_periodepajak)) . ' sudah pernah ditetapkan';
                    $form->bind($data);
                }
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datapendaftaran' => $datapendaftaran,
            'message' => $message,
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $recordspajak = $this->Tools()->getService('ObjekTable')->getDataObjekLeftMenu($session['s_wp']);
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function hapusAction() {
        /** Hapus Laporan
         * @param int $s_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('LaporanTable')->hapusLaporan($this->params('s_idkorek'), $session);
        return $this->getResponse();
    }

    public function cetakkodebayarAction() {
        /** Cetak Kode Bayar
         * @param int $t_idwp
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 02/01/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
// Mengambil Data WP
        $data = $this->Tools()->getService('PembayaranTable')->getDataPembayaranID($data_get['t_idtransaksi']);

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

    public function dataLaporanAction() {
        /** Mendapatkan Data Laporan
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
// Mengambil Data WP, OP dan Transaksi
        $data = $this->Tools()->getService('LaporanTable')->getDataLaporanID($data_get['idtransaksi']);
        $data_render = array(
            "idtransaksi" => $data['t_idtransaksi'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat'],
            "tglketetapan" => date('d-m-Y', strtotime($data['t_tglpendataan'])),
            "jenispajak" => $data['s_namajenis'],
            "idjenispajak" => $data['t_jenisobjek'],
            "t_idobjek" => $data['t_idobjek']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetaksptpdhotelAction() {
        /** Cetak SPTPD Hotel
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
// Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('LaporanTable')->getDataLaporanID($data_get->t_idtransaksi);
// Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('LaporanTable')->getDataLaporanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
// Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "legal");
        return $pdf;
    }

    public function cetaksptpdrestoranAction() {
        /** Cetak SPTPD Restoran
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
// Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('LaporanTable')->getDataLaporanID($data_get->t_idtransaksi);
// Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('LaporanTable')->getDataLaporanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
// Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "legal");
        return $pdf;
    }

    public function cetaksptpdhiburanAction() {
        /** Cetak SPTPD Hiburan
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
// Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('LaporanTable')->getDataLaporanID($data_get->t_idtransaksi);
// Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('LaporanTable')->getDataLaporanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
// Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "legal");
        return $pdf;
    }

    public function cetaksptpdminerbaAction() {
        /** Cetak SPTPD Minerba
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
// Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('LaporanTable')->getDataLaporanID($data_get->t_idtransaksi);
// Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('LaporanTable')->getDataLaporanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
// Mengambil data Detail Minerba
        $datadetailminerba = $this->Tools()->getService('LaporanTable')->getDataDetailMinerba($data_get['idtransaksi']);

// Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            'dataminerba' => $datadetailminerba,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "legal");
        return $pdf;
    }

    public function cetaksptpdparkirAction() {
        /** Cetak SPTPD Parkir
         * @param int $idtransaksi
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
// Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('LaporanTable')->getDataLaporanID($data_get->t_idtransaksi);
// Mengambil Data Sebelumnya
        $datasebelumnya = $this->Tools()->getService('LaporanTable')->getDataLaporanSebelumnya($datasekarang['t_jenisobjek'], $datasekarang['t_idwpobjek'], $datasekarang['t_masaawal']);
// Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'datasebelumnya' => $datasebelumnya,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "legal");
        return $pdf;
    }

    public function hitungpajakAction() {
        /** Hitung Pajak Default
         * @param int $t_dasarpengenaan
         * @param int $t_tarifpajak
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 13/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        if ($data_get['t_jenispajak'] == 2) {
            if ($data_get['t_idkorek'] == 21) {
                $t_dasarpengenaan = str_ireplace(".", "", $data_get['t_dasarpengenaan']);
                $t_tarifpajak = $data_get['t_tarifpajak'];
                $t_jmlhpajak = ($t_dasarpengenaan * $t_tarifpajak / 100);
            } else {
                $t_dasarpengenaan = str_ireplace(".", "", $data_get['t_dasarpengenaan']);
                if ($t_dasarpengenaan <= 3000000) {
                    $t_tarifpajak = 0;
                    $t_jmlhpajak = ($t_dasarpengenaan * $t_tarifpajak / 100);
                } else if ($t_dasarpengenaan > 3000000 && $t_dasarpengenaan <= 5000000) {
                    $t_tarifpajak = 2;
                    $t_jmlhpajak = ($t_dasarpengenaan * $t_tarifpajak / 100);
                } else if ($t_dasarpengenaan > 5000000) {
                    $t_tarifpajak = 10;
                    $t_jmlhpajak = ($t_dasarpengenaan * $t_tarifpajak / 100);
                }
            }
        } else {
            $t_dasarpengenaan = str_ireplace(".", "", $data_get['t_dasarpengenaan']);
            $t_tarifpajak = $data_get['t_tarifpajak'];
            $t_jmlhpajak = ($t_dasarpengenaan * $t_tarifpajak / 100);
        }
        $data_render = array(
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", "."),
            "t_tarifpajak" => $t_tarifpajak
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function CariPendaftaranByObjekAction() {
        /** Cari Transaksi By Objek Pajak
         * @param int $npwpd
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 29/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
// Mengambil Data WP, OP dan Transaksi
        $op = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdObjek($data_get['idobjek']);
        $dataop = " <div class='col-sm-12' style='font-size:11px'>
                        <label class='col-sm-2'>NPWPD</label>
                        <div class='col-sm-10'>
                            : " . $op['t_npwpd'] . "
                        </div>
                    </div>
                    <div class='col-sm-12' style='font-size:11px'>
                        <label class='col-sm-2'>Nama WP</label>
                        <div class='col-sm-10'>
                            : " . $op['t_nama'] . "
                        </div>
                    </div>
                    <div class='col-sm-12' style='font-size:11px'>
                        <label class='col-sm-2'>Alamat WP</label>
                        <div class='col-sm-10'>
                            : " . $op['t_alamat'] . "
                            ,Desa/Kel. " . $op['s_namakel'] . "
                            ,Kec. " . $op['s_namakec'] . "
                            ,Kab. " . $op['t_kabupaten'] . "
                        </div>
                    </div>
                    <div class='col-sm-12' style='font-size:11px'>
                        <label class='col-sm-2'>NIOP</label>
                        <div class='col-sm-10'>
                            : " . $op['t_nop'] . "
                        </div>
                    </div>
                    <div class='col-sm-12' style='font-size:11px'>
                        <label class='col-sm-2'>Nama OP</label>
                        <div class='col-sm-10'>
                            : " . $op['t_namaobjek'] . "
                        </div>
                    </div>
                    <div class='col-sm-12' style='font-size:11px'>
                        <label class='col-sm-2'>Alamat OP</label>
                        <div class='col-sm-10'>
                            : " . $op['t_alamatobjek'] . "
                            ,Desa/Kel. " . $op['s_namakelobjek'] . "
                            ,Kec. " . $op['s_namakecobjek'] . "
                            ,Kab. " . $op['t_kabupatenobjek'] . "
                        </div>
                    </div>
                    <div class='col-sm-12' style='font-size:11px'>
                        <label class='col-sm-2 control-label'>Periode Pajak</label>
                        <div class='col-sm-2'>
                            <input type='text' class='form-control' name='periodepajak' id='periodepajak'>
                        </div>
                        <div class='col-sm-1'>
                            <input type='button' class='btn btn-sm btn-primary' value='Cari' onclick='CariLaporanByObjek(" . $op['t_idobjek'] . ");'>
                        </div>
                    </div>";
        $datatransaksi = "";
        $data_render = array(
            "dataop" => $dataop,
            "datatransaksi" => $datatransaksi
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function CariLaporanByObjekAction() {
        /** Cari Laporan By Objek Pajak
         * @param int $idobjek
         * @param int $periodepajak
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 29/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $datatransaksi = "  <div class='remove-columns'>
                                    <table class='table table-bordered table-striped table-condensed cf' style='font-size : 11px; color:black'>
                                        <thead class='cf' style='background-color:blue'>
                                            <tr>
                                                <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>No.</th>
                                                <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Masa Pajak</th>
                                                <th colspan='4' style='background-color: #00BCA4; color: white; text-align:center'>Laporan</th>
                                                <th colspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Pembayaran</th>
                                            </tr>
                                            <tr>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Kode Rekening</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Masa Pajak</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Pajak (Rp.)</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Jml. (Rp.)</th>
                                            </tr>
                                        </thead>
                                        <tbody>";
        $dataawal = $this->Tools()->getService('ObjekTable')->getPendataanAwalbyIdObjek($data_get['idobjek']);
        for ($i = 1; $i <= 12; $i++) {
            $row = $this->Tools()->getService('ObjekTable')->getPendataanbyMasa($i, $data_get['periodepajak'], $data_get['idobjek']);
            $abulan = ['1' => 'Januari', '2' => 'Februari', '3' => 'Maret', '4' => 'April', '5' => 'Mei', '6' => 'Juni', '7' => 'Juli', '8' => 'Agustus', '9' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
            if ($row == false) {
                $tglpembanding = $data_get['periodepajak'] . "-" . str_pad($i, 2, '0', STR_PAD_LEFT) . "-01";
                if ($dataawal['t_masaawal'] <= date('Y-m-t', strtotime($tglpembanding)) && date('Y-m-d') >= date('Y-m-t', strtotime($tglpembanding))) { //jika belum melaporkan pajak dan pernah melaporkan sebelumnya
                    $dataparameter = $data_get['periodepajak'] . "" . str_pad($i, 2, '0', STR_PAD_LEFT) . "01";
                    $dataparameterTeguran = $data_get['periodepajak'] . "" . str_pad($i, 2, '0', STR_PAD_LEFT) . "01";
                    $datatransaksi .= "     <tr>
                                                <td data-title='No.' style='text-align:center'>" . $i . "</td>
                                                <td data-title='Masa Pajak'>" . $abulan[$i] . "</td>
                                                <td data-title='Keterangan' colspan='6' style='text-align:center'><b style='color:red; font-size:12px'>BELUM LAPOR</b></td>
                                            </tr>";
                } else { // data sebelum wp daftar dan dilakukan pendataan sama sekali
                    $datatransaksi .= "     <tr>
                                                <td data-title='No.' style='text-align:center'>" . $i . "</td>
                                                <td data-title='Masa Pajak'>" . $abulan[$i] . "</td>
                                                <td data-title='Kode Rekening'>-</td>
                                                <td data-title='Tgl' style='text-align:center'>-</td>
                                                <td data-title='Masa Pajak' style='text-align:center'>-</td>
                                                <td data-title='Pajak' style='text-align:right'>-</td>
                                                <td data-title='Tgl. Bayar' style='text-align:center'>-</td>
                                                <td data-title='Jml. Bayar' style='text-align:right'>-</td>
                                            </tr>";
                }
            } else {
                $t_tglpembayaran = (!empty($row['t_tglpembayaran']) ? date('d-m-Y', strtotime($row['t_tglpembayaran'])) : '-'); // returns true
                $datatransaksi .= "         <tr>
                                                <td data-title='No.' style='text-align:center'>" . $i . "</td>
                                                <td data-title='Masa Pajak'>" . $abulan[$i] . "</td>
                                                <td data-title='Kode Rekening'>" . $row['korek'] . " - " . $row['s_namakorek'] . "</td>
                                                <td data-title='Tgl' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</td>
                                                <td data-title='Masa Pajak' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>
                                                <td data-title='Pajak' style='text-align:right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>
                                                <td data-title='Tgl. Bayar' style='text-align:center'>" . $t_tglpembayaran . "</td>
                                                <td data-title='Jml. Bayar' style='text-align:right'>" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "</td>
                                            </tr>";
            }
        }
        $datatransaksi .= "             </tbody>
                                    </table>
                                </div>";
        $data_render = array(
            "datatransaksi" => $datatransaksi
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function caritarifminerbaAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataRekening = $this->Tools()->getService('RekeningTable')->getDataRekeningId($data_get['t_idkorek']);
        $data = array(
            't_hargapasaran' => number_format($dataRekening['s_tarifdasarkorek'], 0, ",", "."),
            't_tarifpersen' => $dataRekening['s_persentarifkorek']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungpajakminerbaAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jumlah = str_ireplace(".", "", $data_get['t_volume']) * str_ireplace(".", "", $data_get['t_hargapasaran']);
        $t_pajak = $t_jumlah * $data_get['t_tarifpersen'] / 100;
        $data = array(
            't_jumlah' => number_format($t_jumlah, 0, ",", "."),
            't_pajak' => number_format($t_pajak, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hitungtotalpajakminerbaAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_jmlhpajak = str_ireplace(".", "", $data_get['t_pajak1']) + str_ireplace(".", "", $data_get['t_pajak2']) + str_ireplace(".", "", $data_get['t_pajak3']) + str_ireplace(".", "", $data_get['t_pajak4']) + str_ireplace(".", "", $data_get['t_pajak5']) + str_ireplace(".", "", $data_get['t_pajak6']) + str_ireplace(".", "", $data_get['t_pajak7']);
        $data = array(
            't_jmlhpajak' => number_format($t_jmlhpajak, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

}
