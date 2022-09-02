<?php

namespace Pajak\Controller\Teguranlaporan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Pendataan\PendataanFrm;
use Pajak\Model\Pendataan\PendataanBase;
use Zend\Barcode\Barcode;

class Teguranlaporan extends AbstractActionController
{

    public function indexAction()
    {
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

        $dataRekOff = $this->Tools()->getService('RekeningTable')->getdataRekOff();
        $ar_kecamatan = $this->Tools()->getService('KecamatanTable')->getdata();
        $recordskecamatan = array();
        foreach ($ar_kecamatan as $ar_kecamatan) {
            $recordskecamatan[] = $ar_kecamatan;
        }
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
        $dataobjekOff = $this->Tools()->getService('RekeningTable')->getdataJenisObjekOff();
        $recordsdataobjekOff = array();
        foreach ($dataobjekOff as $dataobjekOff) {
            $recordsdataobjekOff[] = $dataobjekOff;
        }
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $view = new ViewModel(array(
            'form' => $form,
            's_idjenis' => $s_idjenis,
            'jenisobjek' => $jenisobjek,
            'ar_ttd0' => $recordspejabat,
            'dataRekOff' => $dataRekOff,
            'dataobjekOff' => $recordsdataobjekOff,
            'ar_kecamatan' => $recordskecamatan,
            'descPendaftaran' => $recordspendaftaran,
            'descPendaftaranOP' => $recordspendaftaranOP,
            'descTransaksi' => $recordstransaksi,
            'dataobjek' => $recordspajak,
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

    public function dataGridSuratTeguranAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new \Pajak\Model\Pendataan\TeguranBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('TeguranTable')->getGridCountSuratTeguran($base);
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
        $data = $this->Tools()->getService('TeguranTable')->getGridDataSuratTeguran($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td><input type='checkbox' name='t_idteguran' id='t_idteguran' value='" . $row['t_idteguran'] . "'/></td>";
            $s .= "<td><center style='color:red; font-size:12px; font-weight:bold'>" . $row['t_nop'] . "</center></td>";
            $s .= "<td>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td>" . $row['t_alamatlengkapobjek'] . "</td>";
            $s .= "<td>" . $row['t_npwpdwp'] . "</td>";
            $s .= "<td>" . $row['t_namawp'] . "</td>";
            $s .= "<td>" . $row['s_namajenis'] . "</td>";
            $s .= "<td>" . $row['t_bulanpajak'] . " / " . $row['t_tahunpajak'] . "</td>";
            $s .= "<td><center><b style='color:red'>" . $row['t_noteguran'] . "<br>" . date('d-m-Y', strtotime($row['t_tglteguran'])) . "</b></center></td>";
            $s .= "<td data-title='#'><center>
                <a href='teguranlaporan/form_pageinputteguranedit?t_idteguran=$row[t_idteguran]' class='btn btn-warning btn-xs' title='Edit Teguran'> <i class='glyph-icon icon-pencil'></i></a> 
                </center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $s .= "<script type='text/javascript'>
                    $(document).ready(function () {
                        $('.tableTeguran tr').click(function (event) {
                            if (event.target.type !== 'checkbox') {
                                $(':checkbox', this).trigger('click');
                            }
                        }); 
                    });
                </script>";
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridwp" => $s,
            "rowswp" => $base->rows,
            "countwp" => $count,
            "pagewp" => $page,
            "startwp" => $start,
            "total_halamanwp" => $total_pages,
            "paginatorewp" => $datapaging['paginatore'],
            "akhirdatawp" => $datapaging['akhirdata'],
            "awaldatawp" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetaksuratteguranAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdTeguranArray($data_get['idobjekdbelumlapor']);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttdmasalteguran']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'dataall' => $data,
            'tglpendataan0' => $data_get->tglpendataan0,
            'tglpendataan1' => $data_get->tglpendataan1,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

    public function FormPageinputteguraneditAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // var_dump($data_get);exit();

        $form = new \Pajak\Form\Pendataan\TeguranlaporanFrm();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('t_idteguran');
            // var_dump($id);exit();
            $datateguran = $this->Tools()->getService('TeguranTable')->getDataSuratTeguran($id);
            $jenispajak = $datateguran->current()['s_namajenis'];
            // var_dump($datateguran);exit();
            $data = $this->Tools()->getService('TeguranTable')->checkIdTeguran($id);
            // var_dump($data);exit();
            $bulanmasapajak = $data->t_bulanpajak;
            $tahunmasapajak = $data->t_tahunpajak;
            $abulan = ['01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
            $masapajak = $abulan[$bulanmasapajak];

            // var_dump($data);exit();
            // $form = new \Pajak\Form\Pendataan\TeguranlaporanFrm();
            $data->t_tglteguran = date('d-m-Y', strtotime($data->t_tglteguran));
            $form->bind($data);
            // var_dump($form); exit();
        }



        $view = new ViewModel(array(
            'form' => $form,
            'bulanpajak' => $bulanmasapajak,
            'masapajak' => $masapajak,
            'tahunpajak' => $tahunmasapajak,
            'jenispajak' => $jenispajak,
            'datateguran' => $datateguran
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

    public function FormPageinputteguranAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new \Pajak\Form\Pendataan\TeguranlaporanFrm();
        if ($req->isGet()) {
            $idobjek = $req->getQuery()->get('idobjekbelumlapor');
            $bulanmasapajak = $req->getQuery()->get('bulanmasapajak');
            $tahunmasapajak = $req->getQuery()->get('tahunmasapajak');
            $s_idjenis = $req->getQuery()->get('s_idjenis');
            $abulan = ['01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
            $masapajak = $abulan[$bulanmasapajak];

            $datamauditegur = $this->Tools()->getService('PendaftaranTable')->getPendaftaranbyIdObjekArray($idobjek);
            $maxnoteguran = $this->Tools()->getService('PendaftaranTable')->getNoteguran();
            $noteguran = (int) $maxnoteguran['t_noteguran'] + 1;

            $jenispajak = $this->Tools()->getService('PendaftaranTable')->JenisPajak($s_idjenis);
            //            $form->bind($data);
        }
        if ($this->getRequest()->isPost()) {
            $base = new \Pajak\Model\Pendataan\TeguranBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                for ($i = 0; count($post['t_noteguran']) > $i; $i++) {
                    $this->Tools()->getService('TeguranTable')->simpansuratteguran($base, $post, $session, $i);
                }
                return $this->redirect()->toRoute("teguranlaporan", array("controllers" => "Teguranlaporan", "action" => "index"));
            }
        }
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'datamauditegur' => $datamauditegur,
            'noteguran' => $noteguran,
            'bulanpajak' => $bulanmasapajak,
            'masapajak' => $masapajak,
            'tahunpajak' => $tahunmasapajak,
            'jenispajak' => $jenispajak['s_namajenis']
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

    public function formattglAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $tlg = (int) substr($data_get->tgl, 0, 2);

        $bln = (int) substr($data_get->tgl, 2, 2);
        if ($bln < 1) {
            $bln = 1;
        } elseif ($bln > 12) {
            $bln = 12;
        }

        $thn = substr($data_get->tgl, 4, 5);
        $tglfix = str_pad($tlg, 2, "0", STR_PAD_LEFT) . "-" . str_pad($bln, 2, "0", STR_PAD_LEFT) . "-20" . $thn;
        if ($tlg < 1) {
            $tglfix = "01-" . str_pad($bln, 2, "0", STR_PAD_LEFT) . "-20" . $thn;
        } elseif ($tlg > 28) {
            $tglfix0 = "28-" . str_pad($bln, 2, "0", STR_PAD_LEFT) . "-20" . $thn;
            $tglfix = date('t-m-Y', strtotime($tglfix0));
        }
        $data = array(
            'tgl' => $tglfix
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }
}
