<?php

namespace Pajak\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class MainController extends AbstractActionController {

    public function indexAction() {
        ini_set('memory_limit', '2048M');
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();

        // Jumlah Data Entry
        $jmlpendaftaran = $this->Tools()->getService('PendaftaranTable')->getjmlpendaftaran();
        $jmlpendaftarantahun = $this->Tools()->getService('PendaftaranTable')->getjmlpendaftarantahun();
        $jmlpendataan = $this->Tools()->getService('PendataanTable')->getjmlpendataan();
        $jmlpendataantahun = $this->Tools()->getService('PendataanTable')->getjmlpendataantahun();

        $jmlpenetapan = $this->Tools()->getService('PenetapanTable')->getjmlpenetapan();
        $jmlpenetapantahun = $this->Tools()->getService('PenetapanTable')->getjmlpenetapantahun();

        $jmlpembayaran = $this->Tools()->getService('PembayaranTable')->getjmlpembayaran();
        $jmlpembayarantahun = $this->Tools()->getService('PembayaranTable')->getjmlpembayarantahun();
        
        if ($session['s_akses'] == 1) {
            $recordspajak = $this->Tools()->getService('ObjekTable')->getDataObjekLeftMenu($session['s_wp']);
        } else {
            $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
            $recordspajak = array();
            foreach ($dataobjek as $dataobjek) {
                $recordspajak[] = $dataobjek;
            }
        }
        $view = new ViewModel(array(
            'datauser' => $session,
            'jmlpendaftaran' => $jmlpendaftaran,
            'jmlpendaftarantahun' => $jmlpendaftarantahun,
            'jmlpendataan' => $jmlpendataan,
            'jmlpendataantahun' => $jmlpendataantahun,
            'jmlpenetapan' => $jmlpenetapan,
            'jmlpenetapantahun' => $jmlpenetapantahun,
            'jmlpembayaran' => $jmlpembayaran,
            'jmlpembayarantahun' => $jmlpembayarantahun,
            'data_pemda' => $ar_pemda
        ));

        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction() {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $data = $this->Tools()->getService('PendaftaranTable')->getGridRealisasi($allParams['textcari']);
        $s = "";
        $totaltetapjan = 0;
        $totalbayarjan = 0;
        $totaltetapfeb = 0;
        $totalbayarfeb = 0;
        $totaltetapmar = 0;
        $totalbayarmar = 0;
        $totaltetapapr = 0;
        $totalbayarapr = 0;
        $totaltetapmei = 0;
        $totalbayarmei = 0;
        $totaltetapjun = 0;
        $totalbayarjun = 0;
        $totaltetapjul = 0;
        $totalbayarjul = 0;
        $totaltetapagus = 0;
        $totalbayaragus = 0;
        $totaltetapsep = 0;
        $totalbayarsep = 0;
        $totaltetapokt = 0;
        $totalbayarokt = 0;
        $totaltetapnov = 0;
        $totalbayarnov = 0;
        $totaltetapdes = 0;
        $totalbayardes = 0;
        $totalseluruhketetapan = 0;
        $totalseluruhpembayaran = 0;
        $totalseluruhpiutang = 0;
        foreach ($data as $row) {
//            var_dump($row);
            $s .= "<tr>";
            $s .= "<td>" . $row['s_namajenissingkat'] . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapjan'] . "<br>" . number_format($row['tetapjan'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayarjan'] . "<br>" . number_format($row['bayarjan'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapfeb'] . "<br>" . number_format($row['tetapfeb'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayarfeb'] . "<br>" . number_format($row['bayarfeb'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapmar'] . "<br>" . number_format($row['tetapmar'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayarmar'] . "<br>" . number_format($row['bayarmar'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapapr'] . "<br>" . number_format($row['tetapapr'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayarapr'] . "<br>" . number_format($row['bayarapr'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapmei'] . "<br>" . number_format($row['tetapmei'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayarmei'] . "<br>" . number_format($row['bayarmei'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapjun'] . "<br>" . number_format($row['tetapjun'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayarjun'] . "<br>" . number_format($row['bayarjun'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapjul'] . "<br>" . number_format($row['tetapjul'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayarjul'] . "<br>" . number_format($row['bayarjul'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapagus'] . "<br>" . number_format($row['tetapagus'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayaragus'] . "<br>" . number_format($row['bayaragus'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapsep'] . "<br>" . number_format($row['tetapsep'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayarsep'] . "<br>" . number_format($row['bayarsep'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapokt'] . "<br>" . number_format($row['tetapokt'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayarokt'] . "<br>" . number_format($row['bayarokt'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapnov'] . "<br>" . number_format($row['tetapnov'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayarnov'] . "<br>" . number_format($row['bayarnov'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhtetapdes'] . "<br>" . number_format($row['tetapdes'], 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . $row['jmlhbayardes'] . "<br>" . number_format($row['bayardes'], 0, ',', '.') . "</td>";
            $totalketetapan = $row['tetapjan'] + $row['tetapfeb'] + $row['tetapmar'] + $row['tetapapr'] + $row['tetapmei'] + $row['tetapjun'] + $row['tetapjul'] + $row['tetapagus'] + $row['tetapsep'] + $row['tetapokt'] + $row['tetapnov'] + $row['tetapdes'];
            $totalpembayaran = $row['bayarjan'] + $row['bayarfeb'] + $row['bayarmar'] + $row['bayarapr'] + $row['bayarmei'] + $row['bayarjun'] + $row['bayarjul'] + $row['bayaragus'] + $row['bayarsep'] + $row['bayarokt'] + $row['bayarnov'] + $row['bayardes'];
            $totalpiutang = $row['piutangjan'] + $row['piutangfeb'] + $row['piutangmar'] + $row['piutangapr'] + $row['piutangmei'] + $row['piutangjun'] + $row['piutangjul'] + $row['piutangagus'] + $row['piutangsep'] + $row['piutangokt'] + $row['piutangnov'] + $row['piutangdes'];
            $s .= "<td class='text-right'>" . number_format($totalketetapan, 0, ',', '.') . "</td>";
            $s .= "<td class='text-right'>" . number_format($totalpembayaran, 0, ',', '.') . "</td>";
            $s .= "<td class='text-right piutang' >" . number_format($totalpiutang, 0, ',', '.') . "</td>";
            $s .= "</tr>";
            $totaltetapjan += $row['tetapjan'];
            $totalbayarjan += $row['bayarjan'];
            $totaltetapfeb += $row['tetapfeb'];
            $totalbayarfeb += $row['bayarfeb'];
            $totaltetapmar += $row['tetapmar'];
            $totalbayarmar += $row['bayarmar'];
            $totaltetapapr += $row['tetapapr'];
            $totalbayarapr += $row['bayarapr'];
            $totaltetapmei += $row['tetapmei'];
            $totalbayarmei += $row['bayarmei'];
            $totaltetapjun += $row['tetapjun'];
            $totalbayarjun += $row['bayarjun'];
            $totaltetapjul += $row['tetapjul'];
            $totalbayarjul += $row['bayarjul'];
            $totaltetapagus += $row['tetapagus'];
            $totalbayaragus += $row['bayaragus'];
            $totaltetapsep += $row['tetapsep'];
            $totalbayarsep += $row['bayarsep'];
            $totaltetapokt += $row['tetapokt'];
            $totalbayarokt += $row['bayarokt'];
            $totaltetapnov += $row['tetapnov'];
            $totalbayarnov += $row['bayarnov'];
            $totaltetapdes += $row['tetapdes'];
            $totalbayardes += $row['bayardes'];
            $totalseluruhketetapan += $totalketetapan;
            $totalseluruhpembayaran += $totalpembayaran;
            $totalseluruhpiutang += $totalpiutang;
        }
//        die();
        $s .= "<tr class='totalrow'>";
        $s .= "<td>Jumlah</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapjan, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayarjan, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapfeb, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayarfeb, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapmar, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayarmar, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapapr, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayarapr, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapmei, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayarmei, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapjun, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayarjun, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapjul, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayarjul, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapagus, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayaragus, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapsep, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayarsep, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapokt, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayarokt, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapnov, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayarnov, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totaltetapdes, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalbayardes, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalseluruhketetapan, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right'>" . number_format($totalseluruhpembayaran, 0, ',', '.') . "</td>";
        $s .= "<td class='text-right piutang'>" . number_format($totalseluruhpiutang, 0, ',', '.') . "</td>";
        $s .= "</tr>";
        $data_render = array(
            "grid" => $s
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

}
