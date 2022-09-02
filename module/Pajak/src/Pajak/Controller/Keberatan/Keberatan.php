<?php

namespace Pajak\Controller\Keberatan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Keberatan\KeberatanFrm;
use Pajak\Model\Keberatan\KeberatanBase;
use Pajak\Form\Keberatan\PersetujuanKeberatanFrm;
use Pajak\Model\Keberatan\PersetujuanKeberatanBase;

class Keberatan extends AbstractActionController {

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
        $base = new \Pajak\Model\Keberatan\KeberatanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('KeberatanTable')->getGridCount($base, $post);
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
        $data = $this->Tools()->getService('KeberatanTable')->getGridData($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            if(empty($row['t_statusverifikasi'])) {
                $status = '<span class="btn btn-info btn-xs"><i class="glyph-icon icon-pencil"></i> Baru</span>';
                $edit = "<a href='keberatan/form_edit?t_idkeberatan=$row[t_idkeberatan]' class='btn btn-primary btn-xs btn-flat' title='Edit Surat Permohonan'><i class='glyph-icon icon-edit'></i></a>";
                $persetujuan = "<a href='keberatan/form_persetujuan?t_idkeberatan=$row[t_idkeberatan]' class='btn btn-warning btn-xs btn-flat' title='Persetujuan'><i class='glyph-icon icon-check'></i></a>";
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
            $s .= "<td><center><button class='btn btn-info btn-xs btn-flat'><b>" . $row['t_nokeberatan'] . "</b></button></center></td>";
            $s .= "<td><center>" . date('d-m-Y', strtotime($row['t_tglketetapankeberatan'])) . "</center></td>";
            $s .= "<td><center>" . $row['t_npwpdwp'] . "</center></td>";
            $s .= "<td>" . $row['t_namawp'] . "</td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td style='text-align:right'>" . number_format($row['t_jmlhketetapanseharusnya'], 0, ',', '.') . "</td>";
            $s .= "<td><center>" . $status . "</center></td>";
            
            $hapus = "<a href='#' onclick='hapus(" . $row['t_idkeberatan'] . ");return false;' class='btn btn-danger btn-xs btn-flat' title='Hapus'><i class='glyph-icon icon-trash'></i></a>";
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
        $base = new \Pajak\Model\Keberatan\KeberatanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('KeberatanTable')->getGridCountsudah($base, $post);
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
        $data = $this->Tools()->getService('KeberatanTable')->getGridDatasudah($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            if($row['t_statusverifikasi'] == 1){
                $status = '<span class="btn btn-success btn-xs"><i class="glyph-icon icon-check"></i> Disetujui</span>';
                $cetakpersetujuan = "<button onclick='cetaksuratkeputusan(".$row['t_idkeberatan'].")' class='btn btn-success btn-xs' title='Cetak SK'><i class='glyph-icon icon-print'></i></button>";
            }else{
                $status = '<span class="btn btn-danger btn-xs"><i class="glyph-icon icon-close"></i> Ditolak</span>';
                $cetakpersetujuan = "";
            }
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><center><button class='btn btn-info btn-xs btn-flat'><b>" . $row['t_nokeberatan'] . "</b></button></center></td>";
            $s .= "<td><center>" . date('d-m-Y', strtotime($row['t_tglketetapankeberatan'])) . "</center></td>";
            $s .= "<td><center>" . $row['t_npwpdwp'] . "</center></td>";
            $s .= "<td>" . $row['t_namawp'] . "</td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td style='text-align:right'>" . number_format($row['t_jmlhditetapkan'], 0, ',', '.') . "</td>";
            $s .= "<td><center>" . $status . "</center></td>";
            
            $hapus = "<a href='#' onclick='hapus(" . $row['t_idkeberatan'] . ");return false;' class='btn btn-danger btn-xs btn-flat' title='Hapus'><i class='glyph-icon icon-trash'></i></a>";
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
        $form = new KeberatanFrm();
        if ($this->getRequest()->isPost()) {
            $base = new KeberatanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
//                var_dump($post); exit();
                $this->Tools()->getService('KeberatanTable')->simpankeberatan($base, $session, $post);
                return $this->redirect()->toRoute('keberatan');
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
        $form = new KeberatanFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idkeberatan');
            $data = $this->Tools()->getService('KeberatanTable')->getKeberatanId($id);
            $datakeberatan = $this->Tools()->getService('KeberatanTable')->getDataIdKeberatan($id, $data->t_jenisketetapan);

            if($data->t_jenisketetapan == 2){
                $jenisketetapan = 'SKPD';
            }elseif($data->t_jenisketetapan == 5){
                $jenisketetapan = 'SKPDKB';
            }elseif($data->t_jenisketetapan == 6){
                $jenisketetapan = 'SKPDKBT';
            }elseif($data->t_jenisketetapan == 10){
                $jenisketetapan = 'SKPDT';
            }
            $data->t_tarifpajak = $datakeberatan['t_tarifpajak'];
            if ((int)$datakeberatan['t_jenispajak']==8) {
               $data->t_totalbiaya = number_format($datakeberatan['t_totalbiaya'], 0, ',', '.');
            }
            // var_dump($datakeberatan);exit();
            $data->t_jmlhpajak = number_format($datakeberatan['t_jmlhpajak'], 0, ',', '.');
            $data->t_tglketetapankeberatan = date('d-m-Y', strtotime($datakeberatan['t_tglketetapankeberatan']));


            $form->bind($data);
        }
        // var_dump($form);exit();
        $view = new ViewModel(array(
            'form' => $form,
            'data' => $datakeberatan,
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
        $form = new PersetujuanKeberatanFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idkeberatan');
            $data = $this->Tools()->getService('KeberatanTable')->getKeberatanId($id);
            $datakeberatan = $this->Tools()->getService('KeberatanTable')->getDataIdKeberatan($id, $data->t_jenisketetapan);
//            var_dump($datakeberatan); exit();
//                        var_dump($data); exit();
            if($data->t_jenisketetapan == 2){
                $jenisketetapan = 'SKPD';
            }elseif($data->t_jenisketetapan == 5){
                $jenisketetapan = 'SKPDKB';
            }elseif($data->t_jenisketetapan == 6){
                $jenisketetapan = 'SKPDKBT';
            }elseif($data->t_jenisketetapan == 10){
                $jenisketetapan = 'SKPDT';
            }
            $data->t_jmlhpengurangan = number_format($datakeberatan['t_jmlhketetapanseharusnya'], 0, ',', '.');
            if ((int) $datakeberatan['t_jenispajak']==8) {
                if ((int) $datakeberatan['t_kualitasair']==1) {
               $data->t_kualitasair="KUALITAS JELEK";
               }else if((int) $datakeberatan['t_kualitasair']==4){
                $data->t_kualitasair="KUALITAS BAIK TIDAK ADA ALTERNATIF";
               }else{
                $data->t_kualitasair="KUALITAS BAIK ADA ALTERNATIF";
               }
               if ((int) $datakeberatan['t_peruntukan']==1) {
               $data->t_peruntukan="NON NIAGA";
               }else if((int) $datakeberatan['t_peruntukan']==2){
                $data->t_peruntukan="NIAGA KECIL";
               }else if((int) $datakeberatan['t_peruntukan']==3){
                $data->t_peruntukan="NIAGA BESAR";
               }else if((int) $datakeberatan['t_peruntukan']==4){
                $data->t_peruntukan="INDUSTRI KECIL";
                }else{
                $data->t_peruntukan="INDUSTRI BESAR";
               }

            }
             if ((int) $datakeberatan['t_jenispajak']==4) {
                  $detailReklame = $this->Tools()->getService('KeberatanTable')->getDataReklame($datakeberatan['t_idtransaksi']);

                  if ($detailReklame['t_tipewaktu']=='2'||$detailReklame['t_tipewaktu']==2) {
                    $t_tipewaktu="Bulan";
                }elseif ($detailReklame['t_tipewaktu']=='3'||$detailReklame['t_tipewaktu']==3) {
                    $t_tipewaktu="Hari";
                }else{
                    $t_tipewaktu="";
                }
                  if ($datakeberatan['t_jenisreklameusaha']==1) {
                   $data->t_jenisreklameusaha="Produk Usaha Rokok";
                }else{
                   $data->t_jenisreklameusaha="lainya";
                }
                // var_dump($t_tipewaktu);exit();
                $data->t_tipewaktu=$t_tipewaktu;
// t_tipewaktu
                }
            $data->t_jmlhpajak = number_format($datakeberatan['t_jmlhpajak'], 0, ',', '.');
            $data->t_tglketetapankeberatan = date('d-m-Y', strtotime($datakeberatan['t_tglketetapankeberatan']));
            $data->t_tglverifikasi = date('d-m-Y');
            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new PersetujuanKeberatanBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
               // var_dump($base); exit();
                $this->Tools()->getService('KeberatanTable')->simpanPersetujuan($base, $session, $post);
                return $this->redirect()->toRoute('keberatan');
            }
        }
        $view = new ViewModel(array(
            'form' => $form,
            'data' => $datakeberatan,
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
        $base = new \Pajak\Model\Keberatan\KeberatanBase();
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
            $count = $this->Tools()->getService('KeberatanTable')->getGridCountSkpd($base, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '5') {
            $count = $this->Tools()->getService('KeberatanTable')->getGridCountSkpdkb($base, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '6') {
            $count = $this->Tools()->getService('KeberatanTable')->getGridCountSkpdkbt($base, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '10') {
            $count = $this->Tools()->getService('KeberatanTable')->getGridCountSkpdt($base, $parametercari);
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
            $data = $this->Tools()->getService('KeberatanTable')->getGridDataSkpd($base, $start, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '5') {
            $namaketetapan = 'SKPDKB';
            $data = $this->Tools()->getService('KeberatanTable')->getGridDataSkpdkb($base, $start, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '6') {
            $namaketetapan = 'SKPDKBT';
            $data = $this->Tools()->getService('KeberatanTable')->getGridDataSkpdkbt($base, $start, $parametercari);
        } elseif ($parametercari->t_jenisketetapan == '10') {
            $namaketetapan = 'SKPDT';
            $data = $this->Tools()->getService('KeberatanTable')->getGridDataSkpdt($base, $start, $parametercari);
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
        $dataKetetapan = $this->Tools()->getService('KeberatanTable')->getDataKetetapanForKeberatan($data_get->t_idketetapan, $data_get->t_jenisketetapan);
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
           // var_dump($dataKetetapan);exit();
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
            't_tarifpajak'=>$dataKetetapan['t_tarifpajak'],
        
        );
        if ((int)$dataKetetapan['t_jenispajak']==4) {
          $detailReklame = $this->Tools()->getService('KeberatanTable')->getDataReklame($dataKetetapan['t_idtransaksi']);
          $dataukuran = $this->Tools()->getService('DetailreklameTable')->getcomborangeukuranmedia($detailReklame['t_jenisreklame']);
          $data['t_jangkawaktu']=$detailReklame['t_jangkawaktu'];
            if ($detailReklame['t_tipewaktu']=='2'||$detailReklame['t_tipewaktu']==2) {
                $t_tipewaktu="Bulan";
            }elseif ($detailReklame['t_tipewaktu']=='3'||$detailReklame['t_tipewaktu']==3) {
                $t_tipewaktu="Hari";
            }else{
                $t_tipewaktu="";
            }
            $data['t_idtipewaktu']=$detailReklame['t_tipewaktu'];
            $data['t_tipewaktu']=$t_tipewaktu;
            $data['t_jenisreklame']=$detailReklame['t_jenisreklame'];
            $data['t_kelasjalan']=$detailReklame['t_kelasjalan'];
            $data['t_parameter']=$detailReklame['t_parameter'];
            $data['t_dasarpengenaan']=$dataKetetapan['t_dasarpengenaan'];
            

            $no=1;
            $opsi = "";
            $opsi .= "<option value=''>Silahkan Pilih</option>";
            foreach ($dataukuran as $r) {
                if($detailReklame['t_ukuranmedia']==$r['s_idukurannilaireklame']){
                    $selected="selected";
                }else{
                 $selected=""; 
             }

             $opsi .= "<option ".$selected." value='" . $r['s_idukurannilaireklame'] . "'>" . $no++.' || '.$r['s_keteranganukuran']. "</option>";
         }
         $data['t_ukuranmedia']=$opsi;
         $data['t_jumlah']=$detailReklame['t_jumlah'];
         $opsi2  = "";
            if ((int)$detailReklame['t_jenisreklameusaha']==1) {
                    $ops =" selected ";
                }else{$ops=" ";}
        $opsi2 .= "<option".$ops."value='1'> 1 || Produk Usaha (Rokok)</option>";
            if ((int)$detailReklame['t_jenisreklameusaha']==2) {
                      $ops1 =" selected "; 
                }else{$ops1 =" ";}
        $opsi2 .= "<option".$ops1."value='2'> 2 || Lainya</option>
                   ";
        $data['t_jenisreklameusaha']=$opsi2;

        }
        // var_dump($data);exit();
        if ((int)$dataKetetapan['t_jenispajak']==8) {
            $detailAir = $this->Tools()->getService('KeberatanTable')->getDataAir($dataKetetapan['t_idtransaksi']);
            // var_dump($detailAir);
            $data['t_lamawaktu']=$detailAir['t_lamawaktu'];
            $data['t_debitair']=$detailAir['t_debitair'];
            $data['t_totalbiaya']=number_format($detailAir['t_totalbiaya'], 0, ",", ".");
            $data['t_volume']=$detailAir['t_volume'];
            $data['t_npa']=number_format($detailAir['t_npa'], 0, ",", ".");

            

        }
        // var_dump($data);exit();
       
     
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function dataKeberatanAction() {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('KeberatanTable')->getDataKeberatanID($data_get['idkeberatan']);
        $data_render = array(
            "idkeberatan" => $data['t_idkeberatan'],
            "jenisketetapan" => $data['t_jenisketetapan'],
            "namawp" => $data['t_namawp'],
            "alamatwp" => $data['t_alamat_lengkapwp'],
            "namaobjek" => $data['t_namaobjek'],
            "alamatobjek" => $data['t_alamatlengkapobjek'],
            "jenispajak" => $data['s_namajenis'],
            "idjenispajak" => $data['t_jenispajak'],
            "tglketetapan" => date('d-m-Y', strtotime($data['t_tglketetapankeberatan'])),
            "jenisketetapan" => $data['t_jenisketetapan'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetaksuratkeputusanAction() {
        $req = $this->getRequest();
        $data_get = $req->getQuery();

        if ($data_get['t_jenisketetapan'] == 2) { // SKPD
            $data = $this->Tools()->getService('KeberatanTable')->getDatabyIDKeberatanSkpd($data_get['idkeberatan'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 5) { // SKPDKB
            $data = $this->Tools()->getService('KeberatanTable')->getDatabyIDKeberatanSkpdkb($data_get['idkeberatan'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 6) { // SKPDKBT
            $data = $this->Tools()->getService('KeberatanTable')->getDatabyIDKeberatanSkpdkbt($data_get['idkeberatan'], $data_get['t_jenisketetapan']);
        } elseif ($data_get['t_jenisketetapan'] == 10) { // SKPDT
            $data = $this->Tools()->getService('KeberatanTable')->getDatabyIDKeberatanSkpdt($data_get['idkeberatan'], $data_get['t_jenisketetapan']);
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

     public function hitungpajakairAction() {
        
        // RUMUS PAJAK AIR = NPA X TARIF (20%)
        // NPA =  (Volume) x FNA x HAB (HDA) 
        // FNA = Faktor Nilai Air
        // HAB = HARGA AIR BAKU (HARGA DASAR AIR)
        // Volume (progresif)
        // Bobot kulitas air (BKA) 
        // Sumberdaya Alam (SA)= 60%
        // Kompensasi pemulihan, peruntukan dan pengelolaan (KPPP) = 40% 
        // Kompensasi Berdasarkan Volume Progresif (KBVP) => berkasarkan tabel ketetapan perda
        // FNA = (SA x BKA)+(PPP x KBVP)
        // HAB = TOTAL BIAYA / (masa pajak atau usia produksi(hari)xdebit sumur)

        $req = $this->getRequest();
        $data_get = $req->getPost();
        $t_volume = str_ireplace(".", "",$data_get['t_volume']);
        $BKA      = $data_get['t_kualitasair'];
        $t_idperuntukan = $data_get['t_peruntukan'];
        $t_debitair = $data_get['t_debitair'];
        $selisih = $data_get['t_lamawaktu']*365;
        $t_totalbiaya = str_ireplace(".", "",$data_get['t_totalbiaya']);
        $HDA = round(($t_totalbiaya/($selisih * $t_debitair)),2);
        $dataair = $this->Tools()->getService('PendaftaranTable')->getByidPeruntukan($t_idperuntukan);
        // var_dump($dataair);exit();
        $t_volume1 = 0;
        $t_volume2 = 0;
        $t_volume3 = 0;
        $t_volume4 = 0;
        $t_volume5 = 0;
        $t_fna1 = 0;
        $t_fna2 = 0;
        $t_fna3 = 0;
        $t_fna4 = 0;
        $t_fna5 = 0;
        $t_npa1 = 0;
        $t_npa2 = 0;
        $t_npa3 = 0;
        $t_npa4 = 0;
        $t_npa5 = 0;
        $t_hda1 = $HDA;
        $t_hda2 = $HDA;
        $t_hda3 = $HDA;
        $t_hda4 = $HDA;
        $t_hda5 = $HDA;
        
        if ($t_volume <= 50) {
            $t_volume1 = $t_volume;
            $t_fna1 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume1']);
            $t_npa1 = $t_volume1 * $t_fna1 * $HDA;
            $t_hda2 = 0;
            $t_hda3 = 0;
            $t_hda4 = 0;
            $t_hda5 = 0;

        } elseif ($t_volume >= 51 && $t_volume <= 500) {
            $t_volume1 = 50;
            $t_volume2 = $t_volume - $t_volume1;
            $t_fna1 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume1']);
            $t_fna2 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume2']);
            $t_npa1 = $t_volume1 * $t_fna1 * $HDA;
            $t_npa2 = $t_volume2 * $t_fna2 * $HDA;
            $t_hda3 = 0;
            $t_hda4 = 0;
            $t_hda5 = 0;
        } elseif ($t_volume >= 501 && $t_volume <= 1000) {
            $t_volume1 = 50;
            $t_volume2 = 450;
            $t_volume3 = $t_volume - ($t_volume1 + $t_volume2);
            $t_fna1 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume1']);
            $t_fna2 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume2']);
            $t_fna3 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume3']);
            $t_npa1 = $t_volume1 * $t_fna1 * $HDA;
            $t_npa2 = $t_volume2 * $t_fna2 * $HDA;
            $t_npa3 = $t_volume3 * $t_fna3 * $HDA;
            $t_hda4 = 0;
            $t_hda5 = 0;
        } elseif ($t_volume >= 1001 && $t_volume <= 2500) {
            $t_volume1 = 50;
            $t_volume2 = 450;
            $t_volume3 = 500;
            $t_volume4 = $t_volume - ($t_volume1+$t_volume2+$t_volume3);
            $t_fna1 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume1']);
            $t_fna2 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume2']);
            $t_fna3 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume3']);
            $t_fna4 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume4']);
            $t_npa1 = $t_volume1 * $t_fna1 * $HDA;
            $t_npa2 = $t_volume2 * $t_fna2 * $HDA;
            $t_npa3 = $t_volume3 * $t_fna3 * $HDA;
            $t_npa4 = $t_volume4 * $t_fna4 * $HDA;
            $t_hda5 = 0;
        } elseif ($t_volume > 2500) {
            $t_volume1 = 50;
            $t_volume2 = 450;
            $t_volume3 = 500;
            $t_volume4 = 1500;
            $t_volume5 = $t_volume - ($t_volume1 + $t_volume2 + $t_volume3 + $t_volume4);
            $t_volume5 = ($t_volume5 < 0)?0: $t_volume5;
            $t_fna1 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume1']);
            $t_fna2 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume2']);
            $t_fna3 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume3']);
            $t_fna4 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume4']);
            $t_fna5 = (60 / 100 * $BKA) + (40 /100 * $dataair['s_volume5']);
            $t_npa1 = $t_volume1 * $t_fna1 * $HDA;
            $t_npa2 = $t_volume2 * $t_fna2 * $HDA;
            $t_npa3 = $t_volume3 * $t_fna3 * $HDA;
            $t_npa4 = $t_volume4 * $t_fna4 * $HDA;
            $t_npa5 = $t_volume5 * $t_fna5 * $HDA;
        }else{

        }
        $t_totalnpa = ceil($t_npa1+$t_npa2+$t_npa3+$t_npa4+$t_npa5);
        $t_jmlhpajak = ceil($t_totalnpa * $data_get['t_tarifpajak']/100);
       
        $data_render = array(
            "t_totalnpa" =>  number_format($t_totalnpa, 2, ',', '.'),
            "t_jmlhpajak" => number_format($t_jmlhpajak, 2, ',','.'),

           
        );
        // var_dump($t_totalnpa);exit();
     
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }


        public function hitungpajakreklameAction() {
        $req = $this->getRequest();
        $postedData = $req->getPost();
          $indexreklame = $this->Tools()->getService('DetailreklameTable')->getindeksrekalame($postedData->t_jenisreklame);
        $indexkelasjalan = $this->Tools()->getService('DetailreklameTable')->getindekskelasjalan($postedData->t_jenisreklame, $postedData->t_kelasjalan);
        if ($postedData->t_jenisreklame=='10'||$postedData->t_jenisreklame=='11'||$postedData->t_jenisreklame=='12') {
           if ($postedData->t_tipewaktu=='2') {
            $postedData->t_jangkawaktu = (($postedData->t_jangkawaktu)*30);
            $postedData->t_tipewaktu ='3';
               
           }
        }

        $indexjangkawaktu = $this->Tools()->getService('DetailreklameTable')->getindeksjangkawaktu($postedData->t_jenisreklame, $postedData->t_jangkawaktu, $postedData->t_tipewaktu);

        $indexreklamejumlah = (1.0 * $postedData->t_jumlah);

        $indexukuranreklame = $this->Tools()->getService('DetailreklameTable')->getindeksukuranreklame($postedData->t_ukuranmedia);
        $hargadasar = $this->Tools()->getService('DetailreklameTable')->gettarifdasar($postedData->t_jenisreklame,$postedData->t_kelasjalan);
        $nsr = ($indexreklame*$indexkelasjalan*$indexjangkawaktu*$indexreklamejumlah*$indexukuranreklame*$hargadasar);
        $t_jmlhpajak = ($nsr*$postedData->t_tarifpajak)/100;
        $data_render = array(
            't_tarifpajak'=>$postedData->t_tarifpajak,
            "parameter"=>$indexreklame.' x '.$indexkelasjalan.' x '.$indexjangkawaktu.' x '.strval($indexreklamejumlah).' x '.$indexukuranreklame.' x '.$hargadasar,
            "t_jmlhpajak" => number_format($t_jmlhpajak, 0, ",", "."),
            "nsr" => $nsr,
        );

        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function caritarifreklameAction(){
    $req = $this->getRequest();
    $data_get = $req->getPost();
    //var_dump($data_get);exit();
    $t_tarifreklame = $this->Tools()->getService('DetailreklameTable')->gettarifreklame($data_get->t_jenistarif);
    $data['t_tarifreklame']=$t_tarifreklame;
     return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
 }

 public function hitungketetapanAction(){
        $req = $this->getRequest();
        $data_get = $req->getPost();
    

        if((int)$data_get->t_persetujuan==1){
            $data['t_jmlhditetapkan']=$data_get->t_jmlhpengurangan;
        }else if((int)$data_get->t_persetujuan==2){
            $data['t_jmlhditetapkan']=$data_get->t_jmlhpajak;
        
        }else{
             $data['t_jmlhditetapkan']=0;
        }

        $restitusi=(str_ireplace(".", "", $data_get->t_jmlhpajak))-(str_ireplace(".", "", $data['t_jmlhditetapkan']));
         $data['t_restitusi'] = number_format($restitusi, 0, ',', '.');
       return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function hapuskeberatanAction(){
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $hapus = $this->Tools()->getService('KeberatanTable')->hapusById($data_get->t_idkeberatan);
        $data="";
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }


}
