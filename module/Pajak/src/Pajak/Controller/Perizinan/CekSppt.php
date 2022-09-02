<?php

namespace Pajak\Controller\Perizinan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class CekSppt extends AbstractActionController
{

    public function cekurl()
    {
        $basePath = $this->getRequest()->getBasePath();
        $uri = new \Zend\Uri\Uri($this->getRequest()->getUri());
        $uri->setPath($basePath);
        $uri->setQuery(array());
        $uri->setFragment('');
        return $uri->getScheme() . '://' . $uri->getHost() . ':' . $_SERVER['SERVER_PORT'] . '' . $uri->getPath();
    }

    public function indexAction()
    {
        // //////////////////////////////////////////////
        // echo '<pre>';
        // print_r('cek tunggakan pbb runs');
        // echo '</pre>';
        // exit();
        // //////////////////////////////////////////////

        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();

        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'ar_pejabat' => $recordspejabat,
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

    public function cariTunggakanNopAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        // bikin pbb table dan buat method temukanDataInfoop($nop)
        // buat method temukanDataTunggakanopInfo

        $data_table = $this->Tools()->getService('CeknopTable')->temukanDataInfoop($data_get['nop']);
        $data_tunggakan = $this->Tools()->getService('CeknopTable')->temukanDataTunggakanopInfo($data_get['nop']);

        /////////////////////////////////////////////////
        $datates = '<h1>sadsajdsakjd</h1>';
        $datatunggakanpbb = '';
        $datatunggakanpbb .= "
<div class='panel panel-primary'>
    <div class='panel-heading' style='background-color:white;'>
        <h4 class='panel-title'>
            Data NOP
        </h4>

        <div class='panel-body' style='background-color:white; color : black;'>
            <div class='col-md-12'>
                <label for='inputKey' class='col-md-2 control-label' style='text-align: left;'>Nama SPPT</label>
                <div class='col-md-3'> : " . $data_table['NM_WP_SPPT'] . "</div>
            </div>
            <div class='col-md-12'>
                <label for='inputKey' class='col-md-2 control-label' style='text-align: left;'>Letak</label>
                <div class='col-md-3'> :  " . $data_table['JALAN_OP'] . "</div>
                <label for='inputKey' class='col-md-2 control-label' style='text-align: left;'>RT/RW</label>
                <div class='col-md-3'> :  " . $data_table['RT_OP'] . " /  " . $data_table['RW_OP'] . "</div>
            </div>
            <div class='col-md-12'>
                <label for='inputKey' class='col-md-2 control-label' style='text-align: left;'>Kelurahan</label>
                <div class='col-md-3'> :  " . $data_table['NM_KELURAHAN'] . "</div>
                <label for='inputKey' class='col-md-2 control-label' style='text-align: left;'>Kecamatan</label>
                <div class='col-md-3'> :  " . $data_table['NM_KECAMATAN'] . "</div>
            </div>
            <hr>
            <div class='col-md-12'>
                <label for='inputKey' class='col-md-2 control-label' style='text-align: left;'>Luas Tanah</label>
                <div class='col-md-3'> :  " . $data_table['LUAS_BUMI_SPPT'] . "</div>  
                <label for='inputKey' class='col-md-2 control-label' style='text-align: left;'>NJOP Tanah</label>
                <div class='col-md-3'> :  " . number_format($data_table['NILAI_PER_M2_TANAH'] * 1000, 0, ',', '.') . "</div>
            </div>
            <div class='col-md-12'>
                <label for='inputKey' class='col-md-2 control-label' style='text-align: left;'>Luas Bangunan</label>
                <div class='col-md-3'> :  " . $data_table['LUAS_BNG_SPPT'] . "</div>
                <label for='inputKey' class='col-md-2 control-label' style='text-align: left;'>NJOP Bangunan</label>
                <div class='col-md-3'> :  " . number_format($data_table['NILAI_PER_M2_BNG'] * 1000, 0, ',', '.') . "</div>
            </div>
        </div>
    </div> 
</div>


<div class='row'>
    <div class='col-md-12'>
        <div class='panel panel-primary'>
            <div class='panel-heading'><strong>Tunggakan SPPT-PBB</strong></div>
            <table class='table table-striped'>
                <tr>
                    <th>No.</th>
                    <th>Tahun</th>
                    <th>Tunggakan (Rp.)</th>
                    <th>Jatuh Tempo</th>
                    <th>Denda (Rp.)</th>
                </tr>";

        $i = 1;
        $jumlahdenda = 0;
        $PBB_YG_HARUS_DIBAYAR_SPPT = 0;
        foreach ($data_tunggakan as $row) {
            $dat1 = date('Y-m-d', strtotime($row['JATUH_TEMPO']));
            $dat2 = date('Y-m-d');

            $tgl_bayar = explode("-", $dat2);
            $tgl_tempo = explode("-", $dat1);

            $tahun = $tgl_bayar[0] - $tgl_tempo[0];
            $bulan = $tgl_bayar[1] - $tgl_tempo[1];
            $hari = $tgl_bayar[2] - $tgl_tempo[2];


            if (($tahun == 0) || ($tahun < 1)) {
                if (($bulan == 0) || ($bulan < 1)) {
                    if ($bulan < 0) {
                        $months = 0;
                    } else {
                        if (($hari == 0) || ($hari < 1)) {
                            $months = 0;
                        } else {
                            $months = 1;
                        }
                    }
                } else {
                    if (($hari == 0) || ($hari < 1)) {
                        $months = $bulan;
                    } else {
                        $months = $bulan + 1;
                    }
                }
            } else {
                $jmltahun = $tahun * 12;
                if ($bulan == 0) {
                    $months = $jmltahun;
                } elseif ($bulan < 1) {
                    $months = $jmltahun + $bulan;
                } else {
                    $months = $bulan + $jmltahun;
                }
            }


            if ($months > 24) {
                $beda = 24;
            } else {
                $beda = $months;
            }

            $denda = $beda * $row['PBB_YG_HARUS_DIBAYAR_SPPT'] * 2 / 100;

            $datatunggakanpbb .= '<tr>
                        <td>  ' . $i . '</td>
                        <td>  ' . $row['THN_PAJAK_SPPT'] . ' </td>
                        <td>  ' . number_format($row['PBB_YG_HARUS_DIBAYAR_SPPT'], 0, ',', '.') . ' </td>
                        <td>  ' . $row['JATUH_TEMPO'] . ' </td>
                        <td>  ' . number_format($denda, 0, ',', '.') . ' </td>
                    </tr>
                    ';

            $i++;
            $PBB_YG_HARUS_DIBAYAR_SPPT = $PBB_YG_HARUS_DIBAYAR_SPPT + $row['PBB_YG_HARUS_DIBAYAR_SPPT'];
            $jumlahdenda = $jumlahdenda + $denda;
        }

        $datatunggakanpbb .= "
                <tr style='font-size:16px; font-weight:bold;'>
                    <td colspan='2'><center>Jumlah Tunggakan</center></td>
                <td>  " .  number_format($PBB_YG_HARUS_DIBAYAR_SPPT, 0, ',', '.') . "</td>
                <td>Jumlah Denda</td>
                <td>  " .  number_format($jumlahdenda, 0, ',', '.') . "</td>
                </tr>
                <tr style='font-size:16px; font-weight:bold;'>
                    <td colspan='3' style='border-color:black'><center>Jumlah Seluruh Tunggakan</center></td>
                     <td colspan='2' style='border-color:black'><div style='text-align:center; color:red' > Rp. " . number_format($PBB_YG_HARUS_DIBAYAR_SPPT + $jumlahdenda, 0, ',', '.') . "</div></td>
                 </tr>
            </table>
        </div>
    </div>
</div> ";

        /////////////////////////////////////////////////

        $data_render = array(
            'datatunggakanpbb' => $datatunggakanpbb
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cariTunggakanObjekPerPeriodeAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();

        // //////////////////////////////////////////////
        // echo '<pre>';
        // print_r($data_get);
        // echo '</pre>';
        // exit();
        // //////////////////////////////////////////////
        $abulan = ['1' => 'Januari', '2' => 'Februari', '3' => 'Maret', '4' => 'April', '5' => 'Mei', '6' => 'Juni', '7' => 'Juli', '8' => 'Agustus', '9' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
        $dataobjek = "";
        $dataobjek .= "
        <div class='remove-columns' style='float: left; margin:2px auto;'>
            <table class='table table-bordered table-striped table-condensed cf' style='font-size: 11px; color: black; width:470px'>
                <thead class='cf' style='background-color: blue;'>
                    <tr>
                        <th style='background-color: #00bca4; color: white; text-align: center; width: 83.55px;' height='50'>Masa Pajak</th>
                        <th style='background-color: #00bca4; color: white; text-align: center; width: 113.45px;'>Keterangan</th>
                    </tr>
                </thead>
                <tbody>";


        for ($i = 1; $i <= 6; $i++) {
            $laporan_pajak_januari_sampai_juni = $this->Tools()->getService('ObjekTable')->getPendataanbyMasa($i, $data_get['periodepajak'], $data_get['idobjek']);
            if ($laporan_pajak_januari_sampai_juni == '') {
                $dataobjek .= "
                            <tr>
                            <td style='text-align: left; width: 83.55px;' data-title='Masa Pajak'>" . $abulan[$i] . "</td>
                            <td style='width: 113.45px; color : red;' >Belum Melakukan Pelaporan Pajak</td>
                            </tr>";
            } else {
                $dataobjek .= "
                            <tr>
                            <td style='text-align: left; width: 83.55px;' data-title='Masa Pajak'>" . $abulan[$i] . "</td>
                            <td style='width: 113.45px; color:green;' >Sudah</td>
                            </tr>";
            }
        }

        $dataobjek .= "</tbody>
            </table>
        </div>

        <div class='remove-columns' style='float: right; margin:2px auto;'>
            <table class='table table-bordered table-striped table-condensed cf' style='font-size: 11px; color: black; width:470px;'>
                <thead class='cf' style='background-color: blue;'>
                    <tr>
                        <th style='background-color: #00bca4; color: white; text-align: center; width: 79.9px;' height='50'>Masa Pajak</th>
                        <th style='background-color: #00bca4; color: white; text-align: center; width: 115.1px;'>Keterangan</th>
                    </tr>
                </thead>
                <tbody>";

        for ($i = 7; $i <= 12; $i++) {
            $laporan_pajak_januari_sampai_juni = $this->Tools()->getService('ObjekTable')->getPendataanbyMasa($i, $data_get['periodepajak'], $data_get['idobjek']);
            if ($laporan_pajak_januari_sampai_juni == '') {
                $dataobjek .= "
                        <tr>
                        <td style='text-align: left; width: 83.55px;' data-title='Masa Pajak'>" . $abulan[$i] . "</td>
                        <td style='width: 113.45px; color: red;' >Belum Melakukan Pelaporan Pajak</td>
                        </tr>";
            } else {
                $dataobjek .= "
                        <tr>
                        <td style='text-align: left; width: 83.55px;' data-title='Masa Pajak'>" . $abulan[$i] . "</td>
                        <td style='width: 113.45px; color:green;' >Sudah</td>
                        </tr>";
            }
        }

        $dataobjek .= "
                </tbody>
            </table>
        </div> ";




        $data_render = array(
            "datatransaksi" => $dataobjek
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function CariObjekPajakAction()
    {

        $req = $this->getRequest();
        $data_get = $req->getPost();
        // Mengambil Data WP, OP dan Transaksi

        $data = $this->Tools()->getService('ObjekTable')->getObjekPajakbyNPWPD($data_get['npwpd']);

        $wp = $data->current();
        $datawp = " <div class='panel'>
                    <div class='panel-body'>
                    <h3>
                    <b class='title-hero' style='color:blue;'>Data WP</b>
                    </h3>
                        <div class='row'>
                        <div class='col-sm-12'>
                            <label class='col-sm-1'>Nama</label>
                            <div class='col-sm-11'>
                                <b>" . $wp['t_nama'] . "</b>
                            </div>
                        </div>
                        <div class='col-sm-12'>
                            <label class='col-sm-1'>Alamat</label>
                            <div class='col-sm-11'>
                                " . strtoupper($wp['t_alamat'] . "
                                ,Desa/Kel. " . $wp['s_namakel'] . "
                                ,Kec. " . $wp['s_namakec'] . "
                                ,Kab. " . $wp['t_kabupaten']) . "
                            </div>
                        </div>    
                    </div>
                    </div>";

        $dataobjek = "";



        $dataobjekpajak = $this->Tools()->getService('ObjekTable')->getObjekPajakbyNPWPD($data_get['npwpd']);
        $laporan_pajak_januari_sampai_juni = $this->Tools()->getService('ObjekTable')->getPendataanbyMasa(2, 2021, 2224);
        // $dataobjekpajak = $this->Tools()->getService('ObjekTable')->get($data_get['npwpd']);

        //////////////////////////////////////////////
        // if ($laporan_pajak_januari_sampai_juni == false)
        // {
        //     echo 'nono';
        // }
        // else
        // {
        //     echo 'yesyes';
        // }
        // echo '<pre>';
        // print_r(\Zend\Stdlib\ArrayUtils::iteratorToArray($dataobjekpajak));
        // print_r($laporan_pajak_januari_sampai_juni);
        // echo '</pre>';
        // exit();
        //////////////////////////////////////////////
        $periodepajak = 2021;
        $i = 1;
        $iddiv = 1;
        $abulan = ['1' => 'Januari', '2' => 'Februari', '3' => 'Maret', '4' => 'April', '5' => 'Mei', '6' => 'Juni', '7' => 'Juli', '8' => 'Agustus', '9' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
        foreach ($dataobjekpajak as $row) {
            $dataobjek .= "                 
                    <div class='panel'>
                        <div class='panel-body'>
                            <h3>
                                <b class='title-hero' style='color:blue;'>Data Objek Pajak</b>                  
                            </h3>
                           
                            <div class='example-box-wrapper'>
                                <div class='remove-columns'>
                                    <table class='table table-bordered table-striped table-condensed cf' style='font-size:11px; color:black'>
                                        <tbody>
                                            <tr>
                                                <td style='width:20px;'>NIOP</td>
                                                <td>" . $row['t_nop'] . "</td>
                                            </tr>
                                            <tr> 
                                                <td style='width:20px;'>Nama</td>
                                                <td >" . $row['t_namaobjek'] . "</td>
                                            </tr>
                                            <tr>   
                                                <td style='width:20px;'>Alamat</td>
                                                <td >" . $row['t_alamatobjek'] . ", " . $row['s_namakelobjek'] . ", " . $row['s_namakecobjek'] . "</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <input type='button' width='100'class='btn-dat-objek-pajak transaksi' value='Transaksi' onclick='bukatransaksibyobjek(" . $row['t_idobjek'] . ")'>
                                
                                <div class='cari'>
                                    <label for='periode'>Periode</label>
                                    <input type='text' name='periode' class='periode' id='periode" . $iddiv . "' value=" . $periodepajak . ">
                                    <input type='button' value='Cari' class='btn-dat-objek-pajak' id='cariperiode'onclick='cariTunggakanObjekPerPeriode(" . $iddiv . ", " . $row['t_idobjek'] . ")'>
                                </div>    
                            </div>

                            <div id='datatransaksi" . $iddiv . "'>
                                <div class='remove-columns' style='float: left; margin:2px auto;'>
                                    <table class='table table-bordered table-striped table-condensed cf' style='font-size: 11px; color: black; width:470px'>
                                        <thead class='cf' style='background-color: blue;'>
                                            <tr>
                                                <th style='background-color: #00bca4; color: white; text-align: center; width: 83.55px;' height='50'>Masa Pajak</th>
                                                <th style='background-color: #00bca4; color: white; text-align: center; width: 113.45px;'>Keterangan</th>
                                            </tr>
                                        </thead>
                                        <tbody>";


            for ($i = 1; $i <= 6; $i++) {
                $laporan_pajak_januari_sampai_juni = $this->Tools()->getService('ObjekTable')->getPendataanbyMasa($i, $periodepajak, $row['t_idobjek']);
                if ($laporan_pajak_januari_sampai_juni == '') {
                    $dataobjek .= "
                                                    <tr>
                                                    <td style='text-align: left; width: 83.55px;' data-title='Masa Pajak'>" . $abulan[$i] . "</td>
                                                    <td style='width: 113.45px; color:red;' >Belum Melakukan Pelaporan Pajak</td>
                                                    </tr>";
                } else {
                    $dataobjek .= "
                                                    <tr>
                                                    <td style='text-align: left; width: 83.55px;' data-title='Masa Pajak'>" . $abulan[$i] . "</td>
                                                    <td style='width: 113.45px;color : green;' >Sudah</td>
                                                    </tr>";
                }
            }

            $dataobjek .= "</tbody>
                                    </table>
                                </div>
                            
                                <div class='remove-columns' style='float: right; margin:2px auto;'>
                                    <table class='table table-bordered table-striped table-condensed cf' style='font-size: 11px; color: black; width:470px;'>
                                        <thead class='cf' style='background-color: blue;'>
                                            <tr>
                                                <th style='background-color: #00bca4; color: white; text-align: center; width: 79.9px;' height='50'>Masa Pajak</th>
                                                <th style='background-color: #00bca4; color: white; text-align: center; width: 115.1px;'>Keterangan</th>
                                            </tr>
                                        </thead>
                                        <tbody>";

            for ($i = 7; $i <= 12; $i++) {
                $laporan_pajak_januari_sampai_juni = $this->Tools()->getService('ObjekTable')->getPendataanbyMasa($i, $periodepajak, $row['t_idobjek']);
                if ($laporan_pajak_januari_sampai_juni == '') {
                    $dataobjek .= "
                                                <tr>
                                                <td style='text-align: left; width: 83.55px;' data-title='Masa Pajak'>" . $abulan[$i] . "</td>
                                                <td style='width: 113.45px; color:red;' >Belum Melakukan Pelaporan Pajak</td>
                                                </tr>";
                } else {
                    $dataobjek .= "
                                                <tr>
                                                <td style='text-align: left; width: 83.55px;' data-title='Masa Pajak'>" . $abulan[$i] . "</td>
                                                <td style='width: 113.45px; color:green;' >Sudah</td>
                                                </tr>";
                }
            }

            $dataobjek .= "
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                          ";

            $dataobjek .= "
                    </div>
                </div>";
            $iddiv++;
        }

        $data_render = array(
            "datawp" => $datawp,
            "dataobjek" => $dataobjek
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function CariObjekPajakOldAction()
    {

        $req = $this->getRequest();
        $data_get = $req->getPost();
        // Mengambil Data WP, OP dan Transaksi
        $data = $this->Tools()->getService('ObjekTable')->getObjekPajakbyNPWPD($data_get['npwpd']);
        $wp = $data->current();
        $datawp = " <div class='panel'>
                    <div class='panel-body'>
                    <h3>
                    <b class='title-hero' style='color:blue;'>Data WP</b>
                    </h3>
                        <div class='row'>
                        <div class='col-sm-12'>
                            <label class='col-sm-1'>Nama</label>
                            <div class='col-sm-11'>
                                <b>" . $wp['t_nama'] . "</b>
                            </div>
                        </div>
                        <div class='col-sm-12'>
                            <label class='col-sm-1'>Alamat</label>
                            <div class='col-sm-11'>
                                " . strtoupper($wp['t_alamat'] . "
                                ,Desa/Kel. " . $wp['s_namakel'] . "
                                ,Kec. " . $wp['s_namakec'] . "
                                ,Kab. " . $wp['t_kabupaten']) . "
                            </div>
                        </div>    
                    </div>
                    </div>";

        $dataobjek = "<div class='panel'>
                        <div class='panel-body'>
                            <h3>
                                <b class='title-hero' style='color:blue;'>Data Objek Pajak</b>
                               
                            </h3>
                            <div class='example-box-wrapper'>
                                <div class='remove-columns'>
                                    <table class='table table-bordered table-striped table-condensed cf' style='font-size:11px; color:black'>
                                        <thead class='cf'>
                                            <tr>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>No.</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>NIOP</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Nama</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Alamat</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>#</th>
                                            </tr>
                                        </thead>
                                        <tbody>";
        $dataobjekpajak = $this->Tools()->getService('ObjekTable')->getObjekPajakbyNPWPD($data_get['npwpd']);
        // $dataobjekpajak = $this->Tools()->getService('ObjekTable')->get($data_get['npwpd']);
        // //////////////////////////////////////////////
        // echo '<pre>';
        // print_r(\Zend\Stdlib\ArrayUtils::iteratorToArray($dataobjekpajak));
        // echo '</pre>';
        // exit();
        // //////////////////////////////////////////////

        $i = 1;
        foreach ($dataobjekpajak as $row) {
            $dataobjek .= "                 <tr>
                                                <td data-title='No.' style='text-align:center'>" . $i++ . "</td>
                                                <td data-title='NIOP' style='text-align:center'>" . $row['t_nop'] . "</td>
                                                <td data-title='Nama'>" . $row['t_namaobjek'] . "</td>
                                                <td data-title='Alamat'>" . $row['t_alamatobjek'] . ", " . $row['s_namakelobjek'] . ", " . $row['s_namakecobjek'] . "</td>
                                                <td data-title='#' style='text-align:center'><input type='button' class='btn btn-xs btn-warning' value='Transaksi' onclick='bukatransaksibyobjek(" . $row['t_idobjek'] . ")'></td>
                                            </tr>";
        }
        $dataobjek .= "                 </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div></div>";

        $data_render = array(
            "datawp" => $datawp,
            "dataobjek" => $dataobjek
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function CariTransaksiByobjekAction()
    {
        /** Cari Transaksi By Objek Pajak
         * param int $npwpd
         * author Miftahul Huda <miftahul06gmail.com>
         * date 29/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // Mengambil Data WP, OP dan Transaksi
        $op = $this->Tools()->getService('ObjekTable')->getObjekPajakbyIdObjek($data_get['idobjek']);
        $dataop = " <div class='col-sm-12'>
                        <label class='col-sm-1'>NIOP</label>
                        <div class='col-sm-11'>
                            : " . $op['t_nop'] . "
                        </div>
                    </div>
                    <div class='col-sm-12'>
                        <label class='col-sm-1'>Nama</label>
                        <div class='col-sm-11'>
                            : " . $op['t_namaobjek'] . "
                        </div>
                    </div>
                    <div class='col-sm-12'>
                        <label class='col-sm-1'>Alamat</label>
                        <div class='col-sm-11'>
                            : " . $op['t_alamatobjek'] . "
                            ,Desa/Kel. " . $op['s_namakelobjek'] . "
                            ,Kec. " . $op['s_namakecobjek'] . "
                            ,Kab. " . $op['t_kabupatenobjek'] . "
                        </div>
                    </div>";

        if ($op['t_jenisobjek'] == 4 || $op['t_jenisobjek'] == 8) {
            $datatransaksi = "  <div class='example-box-wrapper'>
                                <div class='remove-columns'>
                                    <table class='table table-bordered table-striped table-condensed cf' style='font-size : 11px; color:black'>
                                        <thead class='cf' style='background-color:blue'>
                                            <tr>
                                                <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>No.</th>
                                                <th colspan='4' style='background-color: #00BCA4; color: white; text-align:center'>Pendataan</th>
                                                <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Penetapan (Tgl.)</th>
                                                <th colspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Pembayaran</th>
                                                <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>#</th>
                                            </tr>
                                            <tr>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Kode Rekening</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Masa Pajak</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Pajak (Rp.)</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Jumlah (Rp.)</th>
                                            </tr>
                                        </thead>
                                        <tbody>";
            $datatransaksipajak = $this->Tools()->getService('ObjekTable')->getTransaksibyIdObjek($data_get['idobjek']);
            $i = 1;
            foreach ($datatransaksipajak as $row) {
                $t_tglpenetapan = (!empty($row['t_tglpenetapan']) ? date('d-m-Y', strtotime($row['t_tglpenetapan'])) : '-');
                $t_tglpembayaran = (!empty($row['t_tglpembayaran']) ? date('d-m-Y', strtotime($row['t_tglpembayaran'])) : '-');
                $t_tgldendapembayaran = (!empty($row['t_tgldendapembayaran']) ? date('d-m-Y', strtotime($row['t_tgldendapembayaran'])) : '-');
                $t_tglbayardenda = (!empty($row['t_tglbayardenda']) ? date('d-m-Y', strtotime($row['t_tglbayardenda'])) : '-');
                $datatransaksi .= "         <tr data-toggle='collapse' data-target='#accordion" . $row['t_idtransaksi'] . "' class='clickable'>
                                                <td data-title='No.' style='text-align:center'>" . $i++ . "</td>
                                                <td data-title='Kode Rekening'>" . $row['korek'] . " - " . $row['s_namakorek'] . "</td>
                                                <td data-title='Tgl.' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</td>
                                                <td data-title='Masa Pajak' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>
                                                <td data-title='Pajak' style='text-align:right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>
                                                <td data-title='Tgl. Penetapan' style='text-align:center'>" . $t_tglpenetapan . "</td>
                                                <td data-title='Tgl. Pembayaran' style='text-align:center'>" . $t_tglpembayaran . "</td>
                                                <td data-title='Jumlah' style='text-align:right'>" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "</td>
                                                <td data-title='Detail' style='text-align:right'><button type='button' class='btn btn-xs btn-warning'> Detail</button></td>
                                            </tr>
                                            <tr id='accordion" . $row['t_idtransaksi'] . "' class='collapse'>
                                                <td style='background-color: #C6E746'></td>
                                                <td style='background-color: #C6E746'>STPD</td>
                                                <td style='text-align:center; background-color: #C6E746'>" . $t_tgldendapembayaran . "</td>
                                                <td style='background-color: #C6E746'></td>
                                                <td style='text-align:right; background-color: #C6E746'>" . number_format($row['t_jmlhdendapembayaran'], 0, ',', '.') . "</td>
                                                <td style='background-color: #C6E746'></td>
                                                <td style='text-align:center; background-color: #C6E746'>" . $t_tglbayardenda . "</td>
                                                <td style='text-align:right; background-color: #C6E746'>" . number_format($row['t_jmlhbayardenda'], 0, ',', '.') . "</td>
                                                <td style='background-color: #C6E746'></td>
                                            </tr>";
            }
            $datatransaksi .= "             </tbody>
                                    </table>
                                </div>
                            </div>";
        } else {
            $datatransaksi = "  <div class='example-box-wrapper'>
                                <div class='remove-columns'>
                                    <table class='table table-bordered table-striped table-condensed cf' style='font-size : 11px; color:black'>
                                        <thead class='cf' style='background-color:blue'>
                                            <tr>
                                                <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>No.</th>
                                                <th colspan='4' style='background-color: #00BCA4; color: white; text-align:center'>Pendataan</th>
                                                <th colspan='2' style='background-color: #00BCA4; color: white; text-align:center'>Pembayaran</th>
                                                <th rowspan='2' style='background-color: #00BCA4; color: white; text-align:center'>#</th>
                                            </tr>
                                            <tr>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Kode Rekening</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Masa Pajak</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Pajak (Rp.)</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Tgl.</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Jumlah (Rp.)</th>
                                            </tr>
                                        </thead>
                                        <tbody>";
            $datatransaksipajak = $this->Tools()->getService('ObjekTable')->getTransaksibyIdObjek($data_get['idobjek']);
            $i = 1;
            foreach ($datatransaksipajak as $row) {
                $t_tglpembayaran = (!empty($row['t_tglpembayaran']) ? date('d-m-Y', strtotime($row['t_tglpembayaran'])) : '-');
                $t_tgldendapembayaran = (!empty($row['t_tgldendapembayaran']) ? date('d-m-Y', strtotime($row['t_tgldendapembayaran'])) : '-');
                $t_tglbayardenda = (!empty($row['t_tglbayardenda']) ? date('d-m-Y', strtotime($row['t_tglbayardenda'])) : '-');
                $datatransaksi .= "         <tr data-toggle='collapse' data-target='#accordion" . $row['t_idtransaksi'] . "' class='clickable'>
                                                <td data-title='No.' style='text-align:center'>" . $i++ . "</td>
                                                <td data-title='Kode Rekening'>" . $row['korek'] . " - " . $row['s_namakorek'] . "</td>
                                                <td data-title='Tgl' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_tglpendataan'])) . "</td>
                                                <td data-title='Masa Pajak' style='text-align:center'>" . date('d-m-Y', strtotime($row['t_masaawal'])) . " s/d " . date('d-m-Y', strtotime($row['t_masaakhir'])) . "</td>
                                                <td data-title='Pajak' style='text-align:right'>" . number_format($row['t_jmlhpajak'], 0, ',', '.') . "</td>
                                                <td data-title='Tgl' style='text-align:center'>" . $t_tglpembayaran . "</td>
                                                <td data-title='Jumlah' style='text-align:right'>" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "</td>
                                                <td data-title='Detail' style='text-align:right'><button type='button' class='btn btn-xs btn-warning'> Detail</button></td>
                                            </tr>
                                            <tr id='accordion" . $row['t_idtransaksi'] . "' class='collapse'>
                                                <td colspan='8'> 
                                                    <table class='table table-striped table-condensed table-bordered cf' style='font-size: 11px'>
                                                        <tr>
                                                            <td style='text-align:center; background-color: #C6E746'>Jenis Ketetapan</td>
                                                            <td style='text-align:center; background-color: #C6E746' colspan='2'>Penetapan</td>
                                                            <td style='text-align:center; background-color: #C6E746' colspan='2'>Pembayaaran</td>
                                                        </tr>
                                                        <tr>
                                                            <td>STPD</td>
                                                            <td style='text-align:center;'>" . $t_tgldendapembayaran . "</td>
                                                            <td style='text-align:right;'>" . number_format($row['t_jmlhdendapembayaran'], 0, ',', '.') . "</td>
                                                            <td style='text-align:center;'>" . $t_tglbayardenda . "</td>
                                                            <td style='text-align:right;'>" . number_format($row['t_jmlhbayardenda'], 0, ',', '.') . "</td>
                                                        </tr>";
                // SKPDKB
                $dataSKPDKB = $this->Tools()->getService('SkpdkbTable')->getDataSKPDKB($row['t_idtransaksi']);
                $t_tglpendataanSKPDKB = ($dataSKPDKB['t_tglpendataan'] != null ? date('d-m-Y', strtotime($dataSKPDKB['t_tglpendataan'])) : '-');
                $t_tglpembayaranSKPDKB = ($dataSKPDKB['t_tglpembayaran'] != null ? date('d-m-Y', strtotime($dataSKPDKB['t_tglpembayaran'])) : '-');
                $datatransaksi .= "                     <tr>
                                                            <td style=''>" . $dataSKPDKB['t_jenisketetapan'] . "</td>
                                                            <td style='text-align:center;'>" . $t_tglpendataanSKPDKB . "</td>
                                                            <td style='text-align:right;'>" . number_format($dataSKPDKB['t_totalpajak'], 0, ',', '.') . "</td>
                                                            <td style='text-align:center;'>" . $t_tglpembayaranSKPDKB . "</td>
                                                            <td style='text-align:right;'>" . number_format($dataSKPDKB['t_jmlhpembayaran'], 0, ',', '.') . "</td>
                                                        </tr>";

                // SKPDKBT
                $dataSKPDKBT = $this->Tools()->getService('SkpdkbtTable')->getDataSKPDKBT($row['t_idtransaksi']);
                $t_tglpendataanSKPDKBT = ($dataSKPDKBT['t_tglpendataan'] != null ? date('d-m-Y', strtotime($dataSKPDKBT['t_tglpendataan'])) : '-');
                $t_tglpembayaranSKPDKBT = ($dataSKPDKBT['t_tglpembayaran'] != null ? date('d-m-Y', strtotime($dataSKPDKBT['t_tglpembayaran'])) : '-');
                $datatransaksi .= "                     <tr>
                                                            <td style=''>" . $dataSKPDKBT['t_jenisketetapan'] . "</td>
                                                            <td style='text-align:center;'>" . $t_tglpendataanSKPDKBT . "</td>
                                                            <td style='text-align:right;'>" . number_format($dataSKPDKBT['t_totalpajak'], 0, ',', '.') . "</td>
                                                            <td style='text-align:center;'>" . $t_tglpembayaranSKPDKBT . "</td>
                                                            <td style='text-align:right;'>" . number_format($dataSKPDKBT['t_jmlhpembayaran'], 0, ',', '.') . "</td>
                                                        </tr>";

                // SKPDLB
                $dataSKPDLB = $this->Tools()->getService('SkpdlbTable')->getDataSKPDLB($row['t_idtransaksi']);
                $t_tglpendataanSKPDLB = ($dataSKPDLB['t_tglpendataan'] != null ? date('d-m-Y', strtotime($dataSKPDLB['t_tglpendataan'])) : '-');
                $t_tglpembayaranSKPDLB = ($dataSKPDLB['t_tglpembayaran'] != null ? date('d-m-Y', strtotime($dataSKPDLB['t_tglpembayaran'])) : '-');
                $datatransaksi .= "                     <tr>
                                                            <td style=''>" . $dataSKPDLB['t_jenisketetapan'] . "</td>
                                                            <td style='text-align:center;'>" . $t_tglpendataanSKPDLB . "</td>
                                                            <td style='text-align:right;'>" . number_format($dataSKPDLB['t_totalpajak'], 0, ',', '.') . "</td>
                                                            <td style='text-align:center;'>" . $t_tglpembayaranSKPDLB . "</td>
                                                            <td style='text-align:right;'>" . number_format($dataSKPDLB['t_jmlhpembayaran'], 0, ',', '.') . "</td>
                                                        </tr>";

                // SKPDN
                $dataSKPDN = $this->Tools()->getService('SkpdnTable')->getDataSKPDN($row['t_idtransaksi']);
                $t_tglpendataanSKPDN = ($dataSKPDN['t_tglpendataan'] != null ? date('d-m-Y', strtotime($dataSKPDN['t_tglpendataan'])) : '-');
                $datatransaksi .= "                     <tr>
                                                            <td style=''>" . $dataSKPDN['t_jenisketetapan'] . "</td>
                                                            <td style='text-align:center;'>" . $t_tglpendataanSKPDN . "</td>
                                                            <td style='text-align:right;'>" . number_format($dataSKPDN['t_totalpajak'], 0, ',', '.') . "</td>
                                                            <td style='text-align:center;'></td>
                                                            <td style='text-align:right;'></td>
                                                        </tr>";

                $datatransaksi .= "                 </table>
                                                </td>
                                            </tr>";
            }
            $datatransaksi .= "             </tbody>
                                    </table>
                                </div>
                            </div>";
        }

        $data_render = array(
            "dataop" => $dataop,
            "datatransaksi" => $datatransaksi
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function CariPembayaranByobjekAction()
    {
        /** Cari Pembayaran By Wajib Pajak
         * param int $npwpd
         * author Miftahul Huda <miftahul06gmail.com>
         * date 29/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        // Mengambil Data WP, OP dan Transaksi
        $wp = $this->Tools()->getService('PendaftaranTable')->getPendaftaranIDWP($data_get['idwp']);
        $datawp = " <div class='col-sm-12'>
                        <label class='col-sm-1'>NPWPD</label>
                        <div class='col-sm-11'>
                            <input type='hidden' id='t_idwplunaspembayaran' value='" . $data_get['idwp'] . "'>
                            : <b class='hero' style='color:blue;'>" . $wp['t_npwpd'] . "</b>
                        </div>
                    </div>
                    <div class='col-sm-12'>
                        <label class='col-sm-1'>Nama</label>
                        <div class='col-sm-11'>
                            : " . $wp['t_nama'] . "
                        </div>
                    </div>
                    <div class='col-sm-12'>
                        <label class='col-sm-1'>Alamat</label>
                        <div class='col-sm-11'>
                            : " . $wp['t_alamat'] . "
                            ,Desa/Kel. " . $wp['s_namakel'] . "
                            ,Kec. " . $wp['s_namakec'] . "
                            ,Kab. " . $wp['t_kabupaten'] . "
                        </div>
                    </div>
                    <div class='col-sm-12'>
                    <hr>
                    </div>";
        $dataop = $this->Tools()->getService('ObjekTable')->getDataObjek($data_get['idwp']);
        $datalunaspembayaran = "";
        foreach ($dataop as $row) {
            $datalunaspembayaran .= "<b class='hero' style='color:blue;'>" . $row['s_idjenis'] . ". " . $row['s_namajenis'] . "</b>"
                . "<div class='example-box-wrapper'>"
                . "<div style='overflow: auto'>";
            if ($row['s_idjenis'] == 4) {
                $datalunaspembayaran .= "<table class='table table-condensed table-bordered cf tableDaftar' style='font-size: 11px; color:black; width: 100%;'>"
                    . "<thead class='cf' style='background-color: blue'>"
                    . "<tr class='bg-blue'>
                    <th style='background-color: #00BCA4; color: white; text-align: center; vertical-align: middle;width:5%;'>
                        No. Urut
                    </th>
                    <th style='background-color: #00BCA4; color: white; text-align: center; vertical-align: middle;width:5%;'>
                        Nama & Alamat Objek
                    </th>
                    <th style='background-color: #00BCA4; color: white; text-align: center; vertical-align: middle;width:5%;'>
                        Tahun
                    </th>
                    <th style='background-color: #00BCA4; color: white; text-align: center; vertical-align: middle;width:5%;'>
                        Masa Pajak
                    </th>
                    <th style='background-color: #00BCA4; color: white; text-align: center; vertical-align: middle;width:5%;'>
                        Keterangan
                    </th>
                   </tr>
                </thead>";
                $op = $this->Tools()->getService('ObjekTable')->getTransaksiReklamebyIdObjek($row['s_idjenis'], $row['t_idobjek']);
                $objekpajak4 = $op->current();
                $datalunaspembayaran .= "<tbody>"
                    . "<tr>"
                    . " <td><center><center></td>"
                    . "<td><center>";
                $datalunaspembayaran .= "<u>" . $objekpajak4['namaobjek'] . "</u><br>" . strtoupper($objekpajak4['alamatobjek']) . "<br>";
                $datalunaspembayaran .= "</center></td><td><center>";
                foreach ($op as $v) :
                    if ($objekpajak4['t_periodepajak'] == date('Y')) {
                        $keterangan = 'Telah dilunasi untuk semua kewajiban pajak reklame';
                    } else {
                        $keterangan = 'Pajak Periode ' . date('Y') . ' belum ada pembayaran!';
                    }
                    $datalunaspembayaran .= "" . $v['t_periodepajak'] . "<br>";
                endforeach;
                $datalunaspembayaran .= "</center></td>"
                    . "<td><center></center></td>"
                    . "<td>" . $keterangan . "</td> "
                    . "</tr></tbody>";
                //".date('d-m-Y', strtotime($v['t_masaawal']))." s/d ".date('d-m-Y', strtotime($v['t_masaakhir']))."
                $datalunaspembayaran .= ""
                    . ""
                    . "</table>";
            } else {
                $datalunaspembayaran .= "<table class='table table-condensed table-bordered cf tableDaftar' style='font-size: 11px; color:black; width: 100%;'>"
                    . "<thead class='cf' style='background-color: blue'>"
                    . "<tr class='bg-blue'>
                    <th style='background-color: #00BCA4; color: white; text-align: center; vertical-align: middle;width:5%;'>
                        No. Urut
                    </th>
                    <th style='background-color: #00BCA4; color: white; text-align: center; vertical-align: middle;width:5%;'>
                        Nama & Alamat Objek
                    </th>
                    <th style='background-color: #00BCA4; color: white; text-align: center; vertical-align: middle;width:5%;'>
                        Tahun
                    </th>
                    <th style='background-color: #00BCA4; color: white; text-align: center; vertical-align: middle;width:5%;'>
                        Masa Pajak
                    </th>
                    <th style='background-color: #00BCA4; color: white; text-align: center; vertical-align: middle;width:5%;'>
                        Keterangan
                    </th>
                   </tr>"
                    . "</thead>";
                $op1 = $this->Tools()->getService('ObjekTable')->getTransaksiSelfbyIdObjek($row['s_idjenis'], $row['t_idobjek']);
                $objekpajak = $op1->current();
                $datalunaspembayaran .= "<tbody>"
                    . "<tr>"
                    . " <td><center><center></td>"
                    . "<td><center>";
                $datalunaspembayaran .= "<u>" . $objekpajak['namaobjek'] . "</u><br>" . strtoupper($objekpajak['alamatobjek']) . "<br>";
                $datalunaspembayaran .= "</center></td><td><center>";
                foreach ($op1 as $v1) :
                    $datalunaspembayaran .= "" . $v1['t_periodepajak'] . "<br>";
                    if ($objekpajak['t_periodepajak'] == date('Y')) {
                        //                    if(date('m', strtotime($objekpajak['masaawal'])) == date('m')){
                        $keterangan1 = 'Telah dilaporkan dan disetor Pajak yang seharusnya dibayar menurut SPTPD Masa';
                        //                    }else{
                        //                        $keterangan1 = 'Pajak Bulan ' . date('m', strtotime($objekpajak['masaawal'])) .' Tahun '.date('Y').' belum dilaporkan';
                        //                    }
                    } else {
                        $keterangan1 = 'Pajak Periode ' . date('Y') . ' belum ada pembayaran!';
                    }
                endforeach;
                $datalunaspembayaran .= "</center></td>"
                    . "<td><center>";
                foreach ($op1 as $v1) :
                    $datalunaspembayaran .= "" . $v1['masapajak'] . "<br>";
                endforeach;
                $datalunaspembayaran .= "</center></td>"
                    . "<td>" . $keterangan1 . "</td> "
                    . "</tr>"
                    . "</tbody>";
                //".date('d-m-Y', strtotime($v1['t_masaawal']))." s/d ".date('d-m-Y', strtotime($v1['t_masaakhir']))."

                $datalunaspembayaran .= ""
                    . "</table>";
            }
            $datalunaspembayaran .= "</div>"
                . "</div>";
        }

        $data_render = array(
            "datawp" => $datawp,
            "datalunaspembayaran" => $datalunaspembayaran
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetaklunaspembayaranAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $data = $this->Tools()->getService('PendaftaranTable')->getPendaftaranIDWP($data_get['idwp']);
        $html = ""
            . "<table width='100%' cellspacing='3' cellpadding='3' style='border-collapse: collapse;'>"
            . "<tr><td style='width:10%;border-bottom:4px double #000;'><img src='" . $this->cekurl() . "/" . $ar_pemda->s_logo . "' width='80'></td>"
            . "<td style='padding-right:10%;border-bottom:4px double #000;'><center><b style='font-size:14pt;'>PEMERINTAH KABUPATEN " . strtoupper($ar_pemda->s_namakabkota) . "</b><br>"
            . "<b style='font-size:20pt;'>" . strtoupper($ar_pemda->s_namainstansi) . "</b><br>" . $ar_pemda->s_alamatinstansi . " "
            . "" . $ar_pemda->s_namaibukotakabkota . "<br>No.Telp " . $ar_pemda->s_notelinstansi . "</center></td></tr>"
            . "<tr><td colspan='2' style='padding:10px 10px 20px 10px;font-size:14pt;'><center><b>SURAT KETERANGAN LUNAS PEMBAYARAN PAJAK DAERAH</b></center></td></tr>"
            . "<tr><td colspan='2'><p>Berikut Informasi pemenuhan kewajiban perpajakan dari Wajib Pajak :</p></td></tr>"
            . "<tr><td colspan='2'><table width='80%'>"
            . "<tr><td>Nama</td><td>:</td><td>" . $data['t_nama'] . "</td></tr>"
            . "<tr><td>NPWPD</td><td>:</td><td>" . $data['t_npwpd'] . "</td></tr>"
            . "<tr><td style='vertical-align:top;'>Alamat</td><td style='vertical-align:top;'>:</td><td>" . $data['t_alamat_lengkap'] . "</td></tr>"
            . "</table></td></tr>"
            . "<tr><td colspan='2'><center></center></td></tr>"
            . "</table>";

        $dataop = $this->Tools()->getService('ObjekTable')->getDataObjek($data_get['idwp']);
        foreach ($dataop as $row) {
            $html .= $row['s_idjenis'] . ". " . $row['s_namajenis'] . "<br>";
            if ($row['s_idjenis'] == 4) {
                $op = $this->Tools()->getService('ObjekTable')->getTransaksiReklamebyIdObjek($row['s_idjenis'], $row['t_idobjek']);
                $objekpajak4 = $op->current();
                $html .= "<table cellpadding='2' cellspacing='2' width='100%' style='border-collapse: collapse;margin-bottom:10px;'><tr>";
                $html .= "<td style='border:1px solid #000;'><center>No. Urut</center></td>";
                $html .= "<td style='border:1px solid #000;'><center>Nama & Alamat Objek</center></td>";
                $html .= "<td style='border:1px solid #000;'><center>Tahun Pajak</center></td>";
                $html .= "<td style='border:1px solid #000;'><center>Masa Pajak</center></td>";
                $html .= "<td style='border:1px solid #000;'><center>Keterangan</center></td></tr>";
                $html .= "<tr><td style='border:1px solid #000;'></td>";
                $html .= "<td style='border:1px solid #000;vertical-align:top;font-size:9pt;'>"
                    . "<u>" . $objekpajak4['namaobjek'] . "</u><br>" . strtoupper($objekpajak4['alamatobjek']) . "<br></td>";
                $html .= "<td style='border:1px solid #000;vertical-align:top;'><center>";
                foreach ($op as $v) :
                    $html .= $v['t_periodepajak'] . "<br>";
                    if ($objekpajak4['t_periodepajak'] == date('Y')) {
                        $keterangan = 'Telah dilunasi untuk semua kewajiban pajak reklame';
                    } else {
                        $keterangan = 'Pajak Periode ' . date('Y') . ' belum ada pembayaran!';
                    }
                endforeach;
                $html .= "</center></td>";
                $html .= "<td style='border:1px solid #000;vertical-align:top;'></td>";
                $html .= "<td style='border:1px solid #000;vertical-align:top;'>" . $keterangan . "</td>";
                $html .= "<tr></table>";
            } else {
                $op1 = $this->Tools()->getService('ObjekTable')->getTransaksiSelfbyIdObjek($row['s_idjenis'], $row['t_idobjek']);
                $objekpajak = $op1->current();
                $html .= "<table cellpadding='2' cellspacing='2' width='100%' style='border-collapse: collapse;margin-bottom:10px;'><tr>";
                $html .= "<td style='border:1px solid #000;'><center>No. Urut</center></td>";
                $html .= "<td style='border:1px solid #000;'><center>Nama & Alamat Objek</center></td>";
                $html .= "<td style='border:1px solid #000;'><center>Tahun Pajak</center></td>";
                $html .= "<td style='border:1px solid #000;'><center>Masa Pajak</center></td>";
                $html .= "<td style='border:1px solid #000;'><center>Keterangan</center></td></tr>";
                $html .= "<tr><td style='border:1px solid #000;'></td>";
                $html .= "<td style='border:1px solid #000;vertical-align:top;font-size:9pt;'>"
                    . "<u>" . $objekpajak['namaobjek'] . "</u><br>" . strtoupper($objekpajak['alamatobjek']) . "<br></td>";
                $html .= "<td style='border:1px solid #000;vertical-align:top;font-size:9pt;'><center>";
                foreach ($op1 as $v1) :
                    $html .= $v1['t_periodepajak'] . "<br>";
                    if ($objekpajak['t_periodepajak'] == date('Y')) {
                        $keterangan1 = 'Telah dilaporkan dan disetor Pajak yang seharusnya dibayar menurut SPTPD Masa';
                    } else {
                        $keterangan1 = 'Pajak Periode ' . date('Y') . ' belum ada pembayaran!';
                    }
                endforeach;
                $html .= "</center></td>";
                $html .= "<td style='border:1px solid #000;vertical-align:top;font-size:9pt;'><center>";
                foreach ($op1 as $v1) :
                    $html .= $v1['masapajak'] . "<br>";
                endforeach;
                $html .= "</center></td>";
                $html .= "<td style='border:1px solid #000;vertical-align:top;'>" . $keterangan1 . "</td>";
                $html .= "<tr></table>";
            }
        }
        //        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get->mengetahui);

        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'html' => $html,
            'data' => $data,
            'dataop' => $dataop,
            'ar_pemda' => $ar_pemda,
            //            'ar_mengetahui' => $ar_mengetahui,
            'dataget' => $data_get,
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }
}
