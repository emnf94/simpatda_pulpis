<?php

namespace Pajak\Controller\Skpdjabatan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class Skpdjabatan extends AbstractActionController
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
        $view = new ViewModel(array(
            'form' => $form,
            's_idjenis' => $s_idjenis,
            'jenisobjek' => $jenisobjek,
            'ar_ttd0' => $recordspejabat
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

    public function dataGridAction()
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
        $count = $this->Tools()->getService('PendataanTable')->getGridCountSkpdJabatan($base);
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
        $data = $this->Tools()->getService('PendataanTable')->getGridDataSkpdJabatan($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No' style='color:black'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. Urut' style='color:red'><center><b>" . $row['t_noskpdjab'] . "</b></center></td>";
            $s .= "<td data-title='NPWPD' style='color:red'><center><b>" . $row['t_npwpd'] . "</b></center></td>";
            $s .= "<td data-title='Nama' style='color:black'>" . $row['t_nama'] . "</td>";
            $s .= "<td data-title='NIOP' style='color:black'><center>" . $row['t_nop'] . "</center></td>";
            $s .= "<td data-title='Nama Objek' style='color:black'>" . $row['t_namaobjek'] . "</td>";
            $s .= "<td data-title='Tanggal Pendataan' style='color:black'><center>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</center></td>";
            $s .= "<td data-title='Jumlah Pajak' style='color:black; text-align: right'>" . number_format($row['t_jmlhkenaikan'], 0, ',', '.') . "</td>";
            $s .= "<td data-title='Jumlah Pajak' style='color:black; text-align: right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>";
            $hapus = "";
            if ($session['s_akses'] == 2) {
                $hapus = "<a href='#' onclick='hapus(" . $row['t_idtransaksi'] . ");return false;' class='btn btn-danger btn-xs btn-flat' title='Hapus'><i class='glyph-icon icon-trash'></i></a>";
            }
            $s .= "<td data-title='#'><center> 
                    <button onclick='bukaCetakSKPDJABATAN(" . $row['t_idtransaksi'] . ")' target='_blank' class='btn btn-primary btn-xs' title='Cetak SKPD Jabatan'><i class='glyph-icon icon-print'></i></button> 
                    $hapus
                    </center></td>";
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

    public function cetakskpdjabatanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data WP, OP dan Transaksi
        $datasekarang = $this->Tools()->getService('PendataanTable')->getDataPendataanSKPDJab($data_get['idtransaksi']);
        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['ttd0']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $datasekarang,
            'ar_pemda' => $ar_pemda,
            'ar_ttd' => $ar_ttd,
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }

    public function dataPendataanAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // Mengambil Data WP, OP dan Transaksi
        $data = $this->Tools()->getService('PendataanTable')->getDataPendataanID($data_get['idtransaksi']);
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

    public function hapusAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('PendataanTable')->hapusSkpdkbJabaran($this->params('page'), $session);
        return $this->getResponse();
    }
}
