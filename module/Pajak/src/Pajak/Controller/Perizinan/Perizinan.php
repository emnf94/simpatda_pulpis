<?php

namespace Pajak\Controller\Perizinan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class Perizinan extends AbstractActionController
{

    public function indexAction()
    {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }

        $ar_kecamatan = $this->Tools()->getService('KecamatanTable')->getdata0();
        $recordskecamatan = array();
        foreach ($ar_kecamatan as $ar_kecamatan) {
            $recordskecamatan[] = $ar_kecamatan;
        }
        $view = new ViewModel(array(
            'dataobjek' => $recordspajak,
            'ar_kecamatan' => $recordskecamatan
        ));
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $post = $req->getPost();

        $base = new \Pajak\Model\Pendataan\PendataanBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('PendataanTable')->getGridCountReklame($base);
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
        $data = $this->Tools()->getService('PendataanTable')->getGridDataReklame($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. SKPD'><center>" . $row['t_nopenetapan'] . "</a></center></td>";
            $s .= "<td data-title='NPWPD'><center>" . $row['t_npwpd'] . "</center></td>";
            $s .= "<td data-title='Nama WP'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Tanggal Penetapan'><center>" . date('d-m-Y', strtotime($row['t_tglpenetapan'])) . "</center></td>";
            $s .= "<td data-title='Masa Pajak'><center>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Pajak' style='text-align: right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            if (empty($row['t_tglpembayaran'])) {
                $s .= "<td data-title='Status Bayar'><center><button class='btn btn-xs btn-round btn-danger' title='Belum Bayar'><i class='glyph-icon icon-close'></i></button></center></td>";
            } else {
                $s .= "<td data-title='Status Bayar'><center><a href='javascript:void(0)' onclick='bukaDetailPenetapan(" . $row['t_idtransaksi'] . ")' class='btn btn-xs btn-round btn-primary' title='Sudah Bayar'><i class='glyph-icon icon-check'></i></a></center></td>";
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

    public function dataPenetapanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('PendataanTable')->getDataPendataanIDTrans($data_get['idtransaksi']);
        $html = "   <div class='row' style='padding-bottom:13px'>
                        &nbsp;&nbsp;&nbsp;<span style='text-align:right; background:black; color: orange; padding: 10px 10px; font-size: 16px; font-weight:bolder'>" . $data['t_npwpd'] . "</span>
                    </div>";
        $html .= "  <div class='content-box border-top border-green' style='font-size:11px'>
                        <h3 class='content-box-header clearfix' style='font-size:12px; color:blue; font-weight: bold;'>
                            Data WP
                        </h3>
                        <div class='content-box-wrapper'>
                            <div class='row'>
                                <div class='col-sm-12'>
                                    <div class='col-sm-2'>Nama</div>
                                    <div class='col-sm-4'>
                                        : " . $data['t_nama'] . "
                                    </div>
                                </div>
                                <div class='col-sm-12'>
                                    <div class='col-sm-2'>Alamat</div>
                                    <div class='col-sm-10'>
                                        : " . $data['t_alamat'] . "
                                        ,RT. " . $data['t_rt'] . "
                                        ,RW. " . $data['t_rw'] . "
                                        ,Desa/Kel. " . $data['s_namakel'] . "
                                        ,Kec. " . $data['s_namakec'] . "
                                        ,Kab. " . $data['t_kabupaten'] . "
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='content-box border-top border-green' style='font-size:11px'>
                        <h3 class='content-box-header clearfix' style='font-size:12px; color:blue; font-weight: bold;'>
                            Data OP
                        </h3>
                        <div class='content-box-wrapper'>
                            <div class='row'>
                                <div class='col-sm-12'>
                                    <div class='col-sm-2'>NIOP</div>
                                    <div class='col-sm-4'>
                                        : " . $data['t_nop'] . "
                                    </div>
                                </div>
                                <div class='col-sm-12'>
                                    <div class='col-sm-2'>Nama</div>
                                    <div class='col-sm-4'>
                                        : " . $data['t_namaobjek'] . "
                                    </div>
                                </div>
                                <div class='col-sm-12'>
                                    <div class='col-sm-2'>Alamat</div>
                                    <div class='col-sm-10'>
                                        : " . $data['t_alamatobjek'] . "
                                        ,RT. " . $data['t_rtobjek'] . "
                                        ,RW. " . $data['t_rwobjek'] . "
                                        ,Desa/Kel. " . $data['s_namakelobjek'] . "
                                        ,Kec. " . $data['s_namakecobjek'] . "
                                        ,Kab. " . $data['t_kabupatenobjek'] . "
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='content-box border-top border-green' style='font-size:11px'>
                        <h3 class='content-box-header clearfix' style='font-size:12px; color:blue; font-weight: bold;'>
                            Data SKPD
                        </h3>
                        <div class='content-box-wrapper'>
                            <div class='row'>
                                <div class='col-sm-12'>
                                    <div class='col-sm-2'>Tgl. Penetapan</div>
                                    <div class='col-sm-4'>
                                        : " . date('d-m-Y', strtotime($data['t_tglpenetapan'])) . "
                                    </div>
                                </div>
                                <div class='col-sm-12'>
                                    <div class='col-sm-2'>Masa Pajak</div>
                                    <div class='col-sm-4'>
                                        : " . date('d-m-Y', strtotime($data['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($data['t_masaakhir'])) . "
                                    </div>
                                </div>
                                <div class='col-sm-12'>
                                    <div class='col-sm-2'>Pajak</div>
                                    <div class='col-sm-10'>
                                        : Rp. " . number_format($data['t_jmlhpajak'], 0, ',', '.') . ",-
                                    </div>
                                </div>
                                <div class='col-sm-12'>
                                    <div class='col-sm-2'>Rekening</div>
                                    <div class='col-sm-10'>
                                        : " . $data['s_namakorek'] . "
                                        <input type='hidden' id='t_idtransaksi' value='" . $data['t_idtransaksi'] . "'>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>";
        $data_render = array(
            "datapenetapan" => $html
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetakdataAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PendataanTable')->getDataReklame($data_get->t_kecamatan);
        if (!empty($data_get->t_kecamatan)) {
            $datakec = $this->Tools()->getService('KecamatanTable')->getDataId($data_get->t_kecamatan);
        } else {
            $datakec = "";
        }
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda,
            'kecamatan' => $datakec
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakmasahabisAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();

        $data = $this->Tools()->getService('PendataanTable')->getDataReklame($data_get->t_kecamatan, $data_get->awal, $data_get->akhir);
        if (!empty($data_get->t_kecamatan)) {
            $datakec = $this->Tools()->getService('KecamatanTable')->getDataId($data_get->t_kecamatan);
        } else {
            $datakec = "";
        }
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda,
            'kecamatan' => $datakec
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function cetakdataketetapanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('PendataanTable')->getDataPendataanIDTrans($data_get->idtransaksi);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }
}
