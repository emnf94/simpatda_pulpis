<?php

namespace Pajak\Controller\Penghapusansanksi;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Penghapusansanksi\PenghapusansanksiFrm;
use Pajak\Model\Penghapusansanksi\PenghapusansanksiBase;

class Penghapusansanksi extends AbstractActionController {

    public function indexAction() {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getdata();
        $records = array();
        foreach ($ar_ttd0 as $ar_ttd0) {
            $records[] = $ar_ttd0;
        }
        $view = new ViewModel(array(
            'ar_ttd0' => $records
        ));
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

    public function dataGridAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new \Pajak\Model\Penghapusansanksi\PenghapusansanksiBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PenghapusansanksiTable')->getGridCount($base, $post);
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
        $data = $this->Tools()->getService('PenghapusansanksiTable')->getGridData($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            if(empty($row['t_statusverifikasi'])) {
                $status = '<span class="btn btn-info btn-xs"><i class="glyph-icon icon-pencil"></i> Baru</span>';
                $edit = "<a href='penghapusansanksi/form_edit?t_idhapussanksi=$row[t_idhapussanksi]' class='btn btn-primary btn-xs btn-flat' title='Edit Surat Permohonan'><i class='glyph-icon icon-edit'></i></a>";
                $persetujuan = "<a href='penghapusansanksi/form_persetujuan?t_idhapussanksi=$row[t_idhapussanksi]' class='btn btn-warning btn-xs btn-flat' title='Persetujuan'><i class='glyph-icon icon-check'></i></a>";
            } else if($row['t_statusverifikasi'] == 1){
                $status = '<span class="btn btn-success btn-xs"><i class="glyph-icon icon-check"></i> Disetujui</span>';
                $edit = "";
                $persetujuan = "";
            }else{
                $status = '<span class="btn btn-danger btn-xs"><i class="glyph-icon icon-close"></i> Ditolak</span>';
                $edit = "";
                $persetujuan = "";
            }
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center><button class='btn btn-info btn-xs btn-flat'><b>" . $row['t_nohapussanksi'] . "</b></button></center></td>";
            $s .= "<td><center>" . date('d-m-Y', strtotime($row['t_tglhapussanksi'])) . "</center></td>";
            $s .= "<td><center>" . $row['t_npwpdwp'] . "</center></td>";
            $s .= "<td>" . $row['t_namawp'] . "</td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td style='text-align:right'>" . number_format($row['t_jmlhketetapanseharusnya'], 0, ',', '.') . "</td>";
            $s .= "<td style='text-align:right'>" . number_format($row['t_jmlhdendaseharusnya'], 0, ',', '.') . "</td>";
            $s .= "<td><center>" . $status . "</center></td>";
            
            $hapus = "<a href='#' onclick='hapus(" . $row['t_idhapussanksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat' title='Hapus'><i class='glyph-icon icon-trash'></i></a>";
            $s .= "<td style='text-align:center;'>
                        $persetujuan
                        $edit
                        $hapus
                    </td>";
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

    public function dataGridsudahAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new \Pajak\Model\Penghapusansanksi\PenghapusansanksiBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PenghapusansanksiTable')->getGridCountsudah($base, $post);
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
        $data = $this->Tools()->getService('PenghapusansanksiTable')->getGridDatasudah($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            if($row['t_statusverifikasi'] == 1){
                $status = '<span class="btn btn-success btn-xs"><i class="glyph-icon icon-check"></i> Disetujui</span>';
                $cetakpersetujuan = "<button onclick='cetaksuratkeputusan(".$row['t_idhapussanksi'].")' class='btn btn-success btn-xs' title='Cetak SK'><i class='glyph-icon icon-print'></i></button>";
            }else{
                $status = '<span class="btn btn-danger btn-xs"><i class="glyph-icon icon-close"></i> Ditolak</span>';
                $cetakpersetujuan = "";
            }
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center><button class='btn btn-info btn-xs btn-flat'><b>" . $row['t_nohapussanksi'] . "</b></button></center></td>";
            $s .= "<td><center>" . date('d-m-Y', strtotime($row['t_tglhapussanksi'])) . "</center></td>";
            $s .= "<td><center>" . $row['t_npwpdwp'] . "</center></td>";
            $s .= "<td>" . $row['t_namawp'] . "</td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td style='text-align:right'>" . number_format($row['t_jmlhketetapanseharusnya'], 0, ',', '.') . "</td>";
            $s .= "<td style='text-align:right'>" . number_format($row['t_jmlhdendaseharusnya'], 0, ',', '.') . "</td>";
            $s .= "<td><center>" . $status . "</center></td>";
            
            $hapus = "<a href='#' onclick='hapus(" . $row['t_idhapussanksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat' title='Hapus'><i class='glyph-icon icon-trash'></i></a>";
            $s .= "<td style='text-align:center;'>
                        $cetakpersetujuan
                        $hapus
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
    
    public function FormTambahAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PenghapusansanksiFrm();
        if ($this->getRequest()->isPost()) {
            $base = new PenghapusansanksiBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
//                var_dump($post); exit();
                $this->Tools()->getService('PenghapusansanksiTable')->simpanhapussanksi($base, $session, $post);
                return $this->redirect()->toRoute('penghapusansanksi');
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
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function FormEditAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PenghapusansanksiFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idhapussanksi');
            $data = $this->Tools()->getService('PenghapusansanksiTable')->getPenghapusanId($id);
            $datapenghapusan = $this->Tools()->getService('PenghapusansanksiTable')->getDataIdPenghapusan($id, $data->t_jenisketetapan);
//            var_dump($datakeberatan); exit();
//                        var_dump($data); exit();
            if($data->t_jenisketetapan == 2){
                if($datapenghapusan['t_jenispajak'] == 4 || $datapenghapusan['t_jenispajak'] == 8){
                    $jenisketetapan = 'SKPD';
                }elseif($datapenghapusan['t_jenispajak'] == 1 || $datapenghapusan['t_jenispajak'] == 2 || $datapenghapusan['t_jenispajak'] == 3 || $datapenghapusan['t_jenispajak'] == 5 || $datapenghapusan['t_jenispajak'] == 6 || $datapenghapusan['t_jenispajak'] == 7 || $datapenghapusan['t_jenispajak'] == 9){
                    $jenisketetapan = 'SPTPD';
                }else{
                    $jenisketetapan = 'SKRD';
                }
            }elseif($data->t_jenisketetapan == 5){
                $jenisketetapan = 'SKPDKB';
            }elseif($data->t_jenisketetapan == 6){
                $jenisketetapan = 'SKPDKBT';
            }elseif($data->t_jenisketetapan == 10){
                $jenisketetapan = 'SKPDT';
            }
            $data->t_jmlhpajak = number_format($datapenghapusan['t_jmlhketetapanseharusnya'], 0, ',', '.');
            $data->t_jmlhdendaseharusnya = number_format($datapenghapusan['t_jmlhdendaseharusnya'], 0, ',', '.');
            $data->t_tglhapussanksi = date('d-m-Y', strtotime($datapenghapusan['t_tglhapussanksi']));
            $form->bind($data);
        }
        $view = new ViewModel(array(
            'form' => $form,
            'data' => $datapenghapusan,
            'jenisketetapan' => $jenisketetapan
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
    
    public function FormPersetujuanAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new PenghapusansanksiFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idhapussanksi');
            $data = $this->Tools()->getService('PenghapusansanksiTable')->getPenghapusanId($id);
            $datapenghapusan = $this->Tools()->getService('PenghapusansanksiTable')->getDataIdPenghapusan($id, $data->t_jenisketetapan);
//            var_dump($datakeberatan); exit();
//                        var_dump($data); exit();
            if($data->t_jenisketetapan == 2){
                if($datapenghapusan['t_jenispajak'] == 4 || $datapenghapusan['t_jenispajak'] == 8){
                    $jenisketetapan = 'SKPD';
                }elseif($datapenghapusan['t_jenispajak'] == 1 || $datapenghapusan['t_jenispajak'] == 2 || $datapenghapusan['t_jenispajak'] == 3 || $datapenghapusan['t_jenispajak'] == 5 || $datapenghapusan['t_jenispajak'] == 6 || $datapenghapusan['t_jenispajak'] == 7 || $datapenghapusan['t_jenispajak'] == 9){
                    $jenisketetapan = 'SPTPD';
                }else{
                    $jenisketetapan = 'SKRD';
                }
            }elseif($data->t_jenisketetapan == 5){
                $jenisketetapan = 'SKPDKB';
            }elseif($data->t_jenisketetapan == 6){
                $jenisketetapan = 'SKPDKBT';
            }elseif($data->t_jenisketetapan == 10){
                $jenisketetapan = 'SKPDT';
            }
            $data->t_jmlhpajak = number_format($datapenghapusan['t_jmlhketetapanseharusnya'], 0, ',', '.');
            $data->t_jmlhdendaseharusnya = number_format($datapenghapusan['t_jmlhdendaseharusnya'], 0, ',', '.');
            $data->t_tglhapussanksi = date('d-m-Y', strtotime($datapenghapusan['t_tglhapussanksi']));
            $data->t_tglverifikasi = date('d-m-Y');
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PenghapusansanksiBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
//                var_dump($post); exit();
                $this->Tools()->getService('PenghapusansanksiTable')->simpanPersetujuan($base, $session, $post);
                return $this->redirect()->toRoute('penghapusansanksi');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'data' => $datapenghapusan,
            'jenisketetapan' => $jenisketetapan
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
    
    
    public function dataGridKetetapanAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $parametercari = $req->getPost();
        $base = new \Pajak\Model\Penghapusansanksi\PenghapusansanksiBase();
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
            $count = $this->Tools()->getService('PenghapusansanksiTable')->getGridCountSkpd($base, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '5') {
            $count = $this->Tools()->getService('PenghapusansanksiTable')->getGridCountSkpdkb($base, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '6') {
            $count = $this->Tools()->getService('PenghapusansanksiTable')->getGridCountSkpdkbt($base, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '10') {
            $count = $this->Tools()->getService('PenghapusansanksiTable')->getGridCountSkpdt($base, $parametercari);
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
            $data = $this->Tools()->getService('PenghapusansanksiTable')->getGridDataSkpd($base, $start, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '5') {
            $namaketetapan = 'SKPDKB';
            $data = $this->Tools()->getService('PenghapusansanksiTable')->getGridDataSkpdkb($base, $start, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '6') {
            $namaketetapan = 'SKPDKBT';
            $data = $this->Tools()->getService('PenghapusansanksiTable')->getGridDataSkpdkbt($base, $start, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '10') {
            $namaketetapan = 'SKPDT';
            $data = $this->Tools()->getService('PenghapusansanksiTable')->getGridDataSkpdt($base, $start, $parametercari);
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td style='text-align:center'>" . $row['t_nop'] . "</td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td style='text-align:center'>" . $row['t_npwpdwp'] . "</td>";
            $s .= "<td>" . $row['t_namawp'] . "</td>";
            $s .= "<td style='text-align:center'>" . $row['t_nourut'] . "</td>";
            $s .= "<td>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</td>";
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
        $dataKetetapan = $this->Tools()->getService('PenghapusansanksiTable')->getDataKetetapanForPenghapusan($data_get->t_idketetapan, $data_get->t_jenisketetapan);
        if ($data_get->t_jenisketetapan == 2) {
            $id_ketetapan = $data_get->t_idketetapan;
            if($dataKetetapan['t_jenispajak'] == 4 || $dataKetetapan['t_jenispajak'] == 8){
                $t_namaketetapan = 'SKPD';
            }elseif($dataKetetapan['t_jenispajak'] == 1 || $dataKetetapan['t_jenispajak'] == 2 || $dataKetetapan['t_jenispajak'] == 3 || $dataKetetapan['t_jenispajak'] == 5 || $dataKetetapan['t_jenispajak'] == 6 || $dataKetetapan['t_jenispajak'] == 7 || $dataKetetapan['t_jenispajak'] == 9){
                $t_namaketetapan = 'SPTPD';
            }else{
                $t_namaketetapan = 'SKRD';
            }
        } elseif ($data_get->t_jenisketetapan == 5) {
            $id_ketetapan = $dataKetetapan['t_idskpdkb'];
            $t_namaketetapan = 'SKPDKB';
        } elseif ($data_get->t_jenisketetapan == 6) {
            $t_namaketetapan = 'SKPDKBT';
        } elseif ($data_get->t_jenisketetapan == 10) {
            $t_namaketetapan = 'SKPDT';
        }
        
        $jatuhtempo = $dataKetetapan['t_tgljatuhtempo'];
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
                $jmldenda = $jmlbulan * 2 / 100 * $dataKetetapan['t_jmlhpajak'];
        } elseif ($jmlbulan <= 0) {
                $jmlbulan = 0;
                $jmldenda = $jmlbulan * 2 / 100 * $dataKetetapan['t_jmlhpajak'];
        } else {
                $jmldenda = $jmlbulan * 2 / 100 * $dataKetetapan['t_jmlhpajak'];
        }

        $data = array(
            't_idwpobjek' => $dataKetetapan['t_idwpobjek'],
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
            't_jmlhpajak' => number_format($dataKetetapan['t_jmlhpajak'], 0, ',', '.'),
            't_jmlhdendapembayaran' => number_format($jmldenda, 0, ',', '.'),
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function dataPenghapusanAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PenghapusansanksiTable')->getDataPenghapusanID($data_get['idhapussanksi']);
        $data_render = array(
            "idhapussanksi" => $data['t_idhapussanksi'],
            "jenisketetapan" => $data['t_jenisketetapan'],
            "namawp" => $data['t_namawp'],
            "alamatwp" => $data['t_alamat_lengkapwp'],
            "namaobjek" => $data['t_namaobjek'],
            "alamatobjek" => $data['t_alamatlengkapobjek'],
            "jenispajak" => $data['s_namajenis'],
            "idjenispajak" => $data['t_jenispajak'],
            "tglketetapan" => date('d-m-Y', strtotime($data['t_tglhapussanksi'])),
            "jenisketetapan" => $data['t_jenisketetapan'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetaksuratkeputusanAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();

        if ($data_get['t_jenisketetapan'] == 2) { // SKPD
            $data = $this->Tools()->getService('PenghapusansanksiTable')->getDatabyIDPenghapusanSkpd($data_get['idhapussanksi'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 5) { // SKPDKB
            $data = $this->Tools()->getService('PenghapusansanksiTable')->getDatabyIDPenghapusanSkpdkb($data_get['idhapussanksi'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 6) { // SKPDKBT
            $data = $this->Tools()->getService('PenghapusansanksiTable')->getDatabyIDPenghapusanSkpdkbt($data_get['idhapussanksi'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 10) { // SKPDT
            $data = $this->Tools()->getService('PenghapusansanksiTable')->getDatabyIDPenghapusanSkpdt($data_get['idhapussanksi'], $data_get['t_jenisketetapan']);
        }
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function hitungnilaipenguranganAction(){
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $persentase = str_ireplace(".", "", $data_get['t_jmlhpajak']) * $data_get['t_nilaipengurangan'] /100;
        $t_jmlhpengurangan = $persentase;
        $t_jmlhditetapkan = str_ireplace(".", "", $data_get['t_jmlhpajak']) - $t_jmlhpengurangan;
        $data_render = array(
            "t_jmlhpengurangan" => number_format($t_jmlhpengurangan, 0, ",", "."),
            "t_jmlhditetapkan" => number_format($t_jmlhditetapkan, 0, ",", ".")
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

}
