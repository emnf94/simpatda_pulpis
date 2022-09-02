<?php

namespace Pajak\Controller\Penetapan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Penetapan\PenetapanFrm;
use Pajak\Model\Penetapan\PenetapanBase;

class Penetapan extends AbstractActionController
{

    public function indexAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
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
        $dataobjekOff = $this->Tools()->getService('RekeningTable')->getdataJenisObjekOff();
        $recordsdataobjekOff = array();
        foreach ($dataobjekOff as $dataobjekOff) {
            $recordsdataobjekOff[] = $dataobjekOff;
        }
        $dataRekOff = $this->Tools()->getService('RekeningTable')->getdataRekOff();

        $descPendaftaran = $this->Tools()->getService('PendaftaranTable')->getDescTablePendaftaran();
        $recordspendaftaran = array();
        foreach ($descPendaftaran as $descPendaftaran) {
            $recordspendaftaran[] = $descPendaftaran;
        }
        $descPendaftaranOP = $this->Tools()->getService('PendaftaranTable')->getDescTablePendaftaranop();
        $recordspendaftaranOP = array();
        foreach ($descPendaftaranOP as $descPendaftaranOP) {
            $recordspendaftaranOP[] = $descPendaftaranOP;
        }
        $descTransaksi = $this->Tools()->getService('PenetapanTable')->getDescTableTransaksi();
        $recordstransaksi = array();
        foreach ($descTransaksi as $descTransaksi) {
            $recordstransaksi[] = $descTransaksi;
        }

        $view = new ViewModel(array(
            'form' => $form,
            'ar_ttd0' => $recordspejabat,
            'ar_kecamatan' => $recordskecamatan,
            'dataobjekOff' => $recordsdataobjekOff,
            'descPendaftaran' => $recordspendaftaran,
            'descPendaftaranOP' => $recordspendaftaranOP,
            'descTransaksi' => $recordstransaksi,
            'dataRekOff' => $dataRekOff
        ));
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function skrdAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
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
        $dataobjekOff = $this->Tools()->getService('RekeningTable')->getdataJenisObjekOffret();
        $recordsdataobjekOff = array();
        foreach ($dataobjekOff as $dataobjekOff) {
            $recordsdataobjekOff[] = $dataobjekOff;
        }
        $dataRekOff = $this->Tools()->getService('RekeningTable')->getdataRekOffret();

        $descPendaftaran = $this->Tools()->getService('PendaftaranTable')->getDescTablePendaftaran();
        $recordspendaftaran = array();
        foreach ($descPendaftaran as $descPendaftaran) {
            $recordspendaftaran[] = $descPendaftaran;
        }
        $descPendaftaranOP = $this->Tools()->getService('PendaftaranTable')->getDescTablePendaftaranop();
        $recordspendaftaranOP = array();
        foreach ($descPendaftaranOP as $descPendaftaranOP) {
            $recordspendaftaranOP[] = $descPendaftaranOP;
        }
        $descTransaksi = $this->Tools()->getService('PenetapanTable')->getDescTableTransaksi();
        $recordstransaksi = array();
        foreach ($descTransaksi as $descTransaksi) {
            $recordstransaksi[] = $descTransaksi;
        }

        $view = new ViewModel(array(
            'form' => $form,
            'ar_ttd0' => $recordspejabat,
            'ar_kecamatan' => $recordskecamatan,
            'dataobjekOff' => $recordsdataobjekOff,
            'descPendaftaran' => $recordspendaftaran,
            'descPendaftaranOP' => $recordspendaftaranOP,
            'descTransaksi' => $recordstransaksi,
            'dataRekOff' => $dataRekOff
        ));
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridBelumAction()
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
        $count = $this->Tools()->getService('PenetapanTable')->getGridCountBelum($base);
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
        $data = $this->Tools()->getService('PenetapanTable')->getGridDataBelum($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SPTPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_nourut'] . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Tanggal Pendataan'><center>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Pajak' style='color:black; text-align: right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            if ($row['t_jenisobjek'] == 4) {
                $s .= "<td data-title='#'><center><a href='penetapan/form_penetapanreklame?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-check'></i> Tetapkan</a></center></td>";
            } elseif ($row['t_jenisobjek'] == 8) {
                $s .= "<td data-title='#'><center><a href='penetapan/form_penetapanair?t_idtransaksi=$row[t_idtransaksi]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-check'></i> Tetapkan</a></center></td>";
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

    public function dataGridSudahAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new PenetapanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PenetapanTable')->getGridCountSudah($base, $post);
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
        $data = $this->Tools()->getService('PenetapanTable')->getGridDataSudah($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SPTPD/SKPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_nourut'] . "/" . $row['t_nopenetapan'] . "</center></td>";
            $s .= "<td data-title='Tanggal Penetapan'><center>" . date('d-m-Y', strtotime($row['t_tglpenetapan'])) . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Jenis Objek'>" . $row['s_namajenis'] . "</td>";
            $s .= "<td data-title='Masa Awal'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>";
            $s .= "<td data-title='Jumlah Pajak' style='color:black; text-align: right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            $hapus = "";
            $operator = "";
            if ($session['s_akses'] == 2) {
                //                $hapus = "<a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyph-icon icon-trash'></i> Hapus</a>";
                $operator = $row['s_nama'];
            }
            if ($row['t_jenispajak'] == 4 || $row['t_jenispajak'] == 8) {
                if ($row['t_tglpembatalanskpd'] != NULL) {
                    $cetak = "<button onclick='bukaCetakBatalSKPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak Pembatalan SKPD'><i class='glyph-icon icon-print'></i> Cetak Pembatalan SKPD</button>";
                } else {

                    $cetak = "<button onclick='bukaCetakSKPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SKPD'><i class='glyph-icon icon-print'></i> SKPD </button> <button onclick='bukaCetakNPPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak Nota Perhitungan Pajak Daerah'><i class='glyph-icon icon-print'></i> NPPD </button>";
                    if ($row['t_tglpembayaran'] == NULL) :
                        $cetak .= " <a href='javascript:;' onclick='batalSKPD($row[t_idtransaksi])' class='btn btn-danger btn-xs'><i class='glyph-icon icon-trash'></i> Batal</a>";
                    endif;
                }
            } else {
                $cetak = "<button onclick='bukaCetakSKRD($row[t_idtransaksi])' target='_blank' class='btn btn-warning btn-xs' title='Cetak SKRD'><i class='glyph-icon icon-print'></i> SKRD </button>";
            }
            $s .= "<td data-title='#'><center> $cetak $hapus <br> $operator</center></td>";
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

    public function dataGridSudahskrdAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new PenetapanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PenetapanTable')->getGridCountSudahskrd($base, $post);
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
        $data = $this->Tools()->getService('PenetapanTable')->getGridDataSudahskrd($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SPTPD/SKPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_nourut'] . "/" . $row['t_nopenetapan'] . "</center></td>";
            $s .= "<td data-title='Tanggal Penetapan'><center>" . date('d-m-Y', strtotime($row['t_tglpenetapan'])) . "</center></td>";
            $s .= "<td data-title='NPWPD'><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Jenis Objek'>" . $row['s_namajenis'] . "</td>";
            $s .= "<td data-title='Masa Awal'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>";
            $s .= "<td data-title='Jumlah Pajak' style='color:black; text-align: right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            $hapus = "";
            $operator = "";
            if ($session['s_akses'] == 2) {
                //                $hapus = "<a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyph-icon icon-trash'></i> Hapus</a>";
                $operator = $row['s_nama'];
            }
            if ($row['t_jenispajak'] == 4 || $row['t_jenispajak'] == 8) {
                if ($row['t_tglpembatalanskpd'] != NULL) {
                    $cetak = "<button onclick='bukaCetakBatalSKPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak Pembatalan SKPD'><i class='glyph-icon icon-print'></i> Cetak Pembatalan SKPD</button>";
                } else {

                    $cetak = "<button onclick='bukaCetakSKPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak SKPD'><i class='glyph-icon icon-print'></i> SKPD </button> <button onclick='bukaCetakNPPD($row[t_idtransaksi])' target='_blank' class='btn btn-primary btn-xs' title='Cetak Nota Perhitungan Pajak Daerah'><i class='glyph-icon icon-print'></i> NPPD </button>";
                    if ($row['t_tglpembayaran'] == NULL) :
                        $cetak .= " <a href='javascript:;' onclick='batalSKPD($row[t_idtransaksi])' class='btn btn-danger btn-xs'><i class='glyph-icon icon-trash'></i> Batal</a>";
                    endif;
                }
            } else {
                $cetak = "<button onclick='bukaCetakSKRD($row[t_idtransaksi])' target='_blank' class='btn btn-warning btn-xs' title='Cetak SKRD'><i class='glyph-icon icon-print'></i> SKRD </button>";
            }
            $s .= "<td data-title='#'><center> $cetak $hapus <br> $operator</center></td>";
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

    public function FormPenetapanreklameAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PenetapanFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datatransaksi = $this->Tools()->getService('PendataanTable')->getPendataanReklameByIdTransaksi($id);
            $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
            $datatransaksi['t_tgldaftar'] = date('d-m-Y', strtotime($datatransaksi['t_tgldaftar']));
            $data->t_tglpenetapan = '';
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $message = '';
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PenetapanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('PenetapanTable')->simpanpenetapan($base, $session, $post['t_jenisobjekpajak']);
                return $this->redirect()->toRoute('penetapan');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datatransaksi' => $datatransaksi,
            'message' => $message
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

    public function FormPenetapanairAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PenetapanFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idtransaksi');
            $datatransaksi = $this->Tools()->getService('PendataanTable')->getPendataanAirByIdTransaksi($id);
            $data = $this->Tools()->getService('PenetapanTable')->getPenetapanId($id);
            $datatransaksi['t_tgldaftar'] = date('d-m-Y', strtotime($datatransaksi['t_tgldaftar']));
            $data->t_tglpenetapan = '';
            $data->t_idtransaksi = $datatransaksi['t_idtransaksi'];
            $message = '';
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PenetapanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $this->Tools()->getService('PenetapanTable')->simpanpenetapan($base, $session, $post['t_jenisobjekpajak']);
                return $this->redirect()->toRoute('penetapan');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datatransaksi' => $datatransaksi,
            'message' => $message
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

    public function hapusAction()
    {
        /** Hapus Penetapan
         * @param int $s_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('PenetapanTable')->hapusPenetapan($this->params('s_idkorek'), $session);
        return $this->getResponse();
    }

    public function pembatalanSKPDAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('PenetapanTable')->batalPenetapan($this->getRequest()->getPost());
        return $this->getResponse();
    }

    public function dataPenetapanAction()
    {
        /** Mendapatkan Data Penetapan
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PenetapanTable')->getDataPenetapanID($data_get['idtransaksi']);

        $data_render = array(
            "idtransaksi" => $data['t_idtransaksi'],
            "namawp" => $data['t_nama'],
            "alamatwp" => $data['t_alamat'],
            "tglketetapan" => date('d-m-Y', strtotime($data['t_tglpenetapan'])),
            "jenisobjek" => $data['s_idjenis'],
            "jenispajak" => $data['s_namajenis'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetakskpdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        if ($data_get['jenisobjek'] == 4) {
            $data = $this->Tools()->getService('PenetapanTable')->getDataPenetapanReklame($data_get['idtransaksi']);
            $ar_jenisreklame = $this->Tools()->getService('ReklameTable')->getDataTarifReklame($data['t_jenisreklame']);
            // $tarif_nspr = $this->Tools()->getService('ReklameTable')->getTarifNSPR($data['t_klasifikasi_jalan']);
            // $tarif_kawasan = $this->Tools()->getService('ReklameTable')->getDataZona($data['t_wilayah']);
            // $tarif_tinggi = $this->Tools()->getService('ReklameTable')->getTarifTinggi($data['t_tinggi']);
        } elseif ($data_get['jenisobjek'] == 8) {
            $data = $this->Tools()->getService('PenetapanTable')->getDataPenetapanABT($data_get['idtransaksi']);
            // $peruntukan_air = $this->Tools()->getService('AirTable')->getdataPeruntukanairId($data['t_kodekelompok']);
            //            if($data['t_hargaberdasarkan'] == 2){
            //                $ukuranpipa = $this->Tools()->getService('AirTable')->getdataTarifpipaId($data['t_ukuranpipa']);
            //            }
        }

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
            'jenisobjek' => $data_get['jenisobjek'],
            'ar_jenisreklame' => $ar_jenisreklame,
            'peruntukan_air' => $peruntukan_air,
            //            'ukuranpipa' => $ukuranpipa
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetakmasalskpdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        if ($data_get->jenisobjmasalskpd == 4) {
            $data = $this->Tools()->getService('PenetapanTable')->getDataMasalPenetapanReklame($data_get->t_tglpenetapan0, $data_get->t_tglpenetapan1);
        } elseif ($data_get->jenisobjmasalskpd == 8) {
            $data = $this->Tools()->getService('PenetapanTable')->getDataMasalPenetapanABT($data_get->t_tglpenetapan0, $data_get->t_tglpenetapan1);
        }

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->ttdmasalskpd);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
            'jenisobjek' => $data_get->jenisobjmasalskpd
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cetakmasalskrdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenetapanTable')->getDataMasalPenetapanRetribusi($data_get->t_tglpenetapan0, $data_get->t_tglpenetapan1, $data_get->jenisobjmasalskpd);

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->ttdmasalskpd);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
            'jenisobjek' => $data_get->jenisobjmasalskpd
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
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
                $opsi .= "<option value=''>Semua Kelurahan</option>";
                foreach ($data as $r) {
                    $opsi .= "<option value='" . $r['s_idkel'] . "'>" . str_pad($r['s_kodekel'], 2, "0", STR_PAD_LEFT) . " || " . $r['s_namakel'] . "</option>";
                }
                $res->setContent($opsi);
            }
        }
        return $res;
    }

    public function cetakdataskpdrekAction()
    {
        /** Cetak Penetapan
         * @param string $tglcetak Tanggal Mencetak Dokumen
         * @param date('d-m-Y') $tglpenetapan0 Tanggal Minimal Penetapan
         * @param date('d-m-Y') $tglpenetapan1 Tanggal Maximal Penetapan
         * @param int $t_kecamatan 
         * @param int $t_kelurahan  
         * @param int $t_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenetapanTable')->getDataPenetapanRek($data_get->tglpenetapan0, $data_get->tglpenetapan1, $data_get->t_kecamatan, $data_get->t_kelurahan, $data_get->jenisrek);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'tglpenetapan0' => $data_get->tglpenetapan0,
                'tglpenetapan1' => $data_get->tglpenetapan1,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'jenisketetapan' => $data_get->jenisketetapan,
                'formatcetak' => $data_get->formatcetak,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'tglpenetapan0' => $data_get->tglpenetapan0,
                'tglpenetapan1' => $data_get->tglpenetapan1,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'jenisketetapan' => $data_get->jenisketetapan,
                'formatcetak' => $data_get->formatcetak,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetakdataskpdobjAction()
    {
        /** Cetak Penetapan
         * @param string $tglcetak Tanggal Mencetak Dokumen
         * @param date('d-m-Y') $tglpenetapan0 Tanggal Minimal Penetapan
         * @param date('d-m-Y') $tglpenetapan1 Tanggal Maximal Penetapan
         * @param int $t_kecamatan 
         * @param int $t_kelurahan  
         * @param int $t_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PenetapanTable')->getDataPenetapanObj($data_get->tglpenetapan0, $data_get->tglpenetapan1, $data_get->t_kecamatan, $data_get->t_kelurahan, $data_get->jenisobj);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->diperiksa);
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);
        if ($data_get->formatcetak == 'pdf') {
            $pdf = new \LosPdf\View\Model\PdfModel();
            $pdf->setVariables(array(
                'data' => $data,
                'tglpenetapan0' => $data_get->tglpenetapan0,
                'tglpenetapan1' => $data_get->tglpenetapan1,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'jenisketetapan' => $data_get->jenisketetapan,
                'formatcetak' => $data_get->formatcetak,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
            ));
            $pdf->setOption("paperSize", "legal-L");
            return $pdf;
        } elseif ($data_get->formatcetak == 'excel') {
            $view = new ViewModel(array(
                'data' => $data,
                'tglpenetapan0' => $data_get->tglpenetapan0,
                'tglpenetapan1' => $data_get->tglpenetapan1,
                'tglcetak' => $data_get->tglcetak,
                'ar_pemda' => $ar_pemda,
                'jenisketetapan' => $data_get->jenisketetapan,
                'formatcetak' => $data_get->formatcetak,
                'ar_diperiksa' => $ar_diperiksa,
                'ar_mengetahui' => $ar_mengetahui,
            ));
            $data = array('nilai' => '3');
            $this->layout()->setVariables($data);
            return $view;
        }
    }

    public function cetakskrdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP

        $data = $this->Tools()->getService('PendataanTable')->getPendataanRetribusi($data_get['idtransaksi']);
        $datakorek = $this->Tools()->getService('RekeningTable')->getRekeningParentByKorek(substr($data['korek'], 0, 12));

        $data_get['jenisobjek'] = (int)$data['t_jenispajak'];
        if ($data_get['jenisobjek'] == 13) {
            $datadetail = $this->Tools()->getService('DetailkebersihanTable')->getPendataanKebersihanByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 17) {
            $datadetail = $this->Tools()->getService('DetailpasarTable')->getPendataanPasarByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 26) {
            $datadetail = $this->Tools()->getService('DetailkekayaanTable')->getDetailKekayaanByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 30) {
            $datadetail = $this->Tools()->getService('DetailtempatparkirTable')->getPendataanTempatparkirByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 12) {
            $datadetail = $this->Tools()->getService('DetailretribusiTable')->getPendataanPelayananKesehatanByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 18) {
            $datadetail = $this->Tools()->getService('DetailkirTable')->getPendataanPengujianKendaraanBermotorByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 16) {
            $datadetail = $this->Tools()->getService('DetailparkirtepiTable')->getPendataanParkirTepiByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 40) {
            $datadetail = $this->Tools()->getService('DetailtrayekTable')->getPendataanTrayekByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 37) {
            $datadetail = $this->Tools()->getService('DetailimbTable')->getPendataanImbByIdTransaksi($data_get['idtransaksi']);
        } elseif ($data_get['jenisobjek'] == 29) {
            $datadetail = $this->Tools()->getService('DetailterminalTable')->getPendataanterminalByIdTransaksi($data_get['idtransaksi']);
            $detailpasargrosir = $this->Tools()->getService('DetailpasargrosirTable')->getnamatarif($datadetail['t_jenisbangunan']);
        } elseif ($data_get['jenisobjek'] == 27) {
            $datadetail = $this->Tools()->getService('DetailpasargrosirTable')->getPendataanPasargrosirByIdTransaksi($data_get['idtransaksi']);
            $detailpasargrosir = $this->Tools()->getService('DetailpasargrosirTable')->getnamatarif($datadetail['t_jenisbangunan']);
        }


        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'datakorek' => $datakorek,
            'data' => $data,
            'datadetail' => $datadetail,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
            'jenisobjek' => $data['t_jenispajak'],
            'detailpasargrosir' => $detailpasargrosir,
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function cariwpAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataobjek = $this->Tools()->getService('PenetapanTable')->getDataPenetapanByTgl($data_get->bulanmasalskpd, $data_get->tahunmasalskpd, $data_get->jenisobjmasalskpd);
        $combo = "<script type='text/javascript'>
                        $(function () {
                            'use strict';
                            $('.multi-select').multiSelect();
                        });
                    </script>";
        $combo .= "<div class='col-md-12 form-horizontal'>
                        <label class='col-md-2 control-label'>
                            Daftar WP
                        </label>
                    <div class='col-md-10'>";
        $combo .= "<select id='t_daftarwpmasalskpd' class='multi-select' multiple>";
        foreach ($dataobjek as $row) {
            $combo .= "<option value='" . $row['t_idtransaksi'] . "'>" . $row['t_npwpd'] . " || " . $row['t_nama'] . " || " . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</option>";
        }
        $combo .= "</select>";
        $combo .= "     </div>
                   </div>";
        $data = array(
            'daftarwp' => $combo
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function cetakpembatalanskpdAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP
        $data = $this->Tools()->getService('PendataanTable')->getPendataan($data_get['idtransaksi']);
        //        var_dump($data);
        //        die();
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd0' => $ar_ttd0,
            'jenisobjek' => $data_get['jenisobjek']
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }
}
