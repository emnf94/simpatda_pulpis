<?php

namespace Pajak\Controller\Perizinan;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class CekSppt extends AbstractActionController
{
    public function indexAction()
    {
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
        $data_tunggakan = $this->Tools()->getService('CeknopTable')->temukanDataTunggakanopInfo($data_get['nop'], $data_get['tahun']);

        /////////////////////////////////////////////////
        $datates = '<h1>sadsajdsakjd</h1>';
        if ($data_table['RT_OP'] == null) {
            $rtop = "000";
        } else {
            $rtop = $data_table['RT_OP'];
        }
        if ($data_table['RW_OP'] == null) {
            $rwop = "000";
        } else {
            $rwop = $data_table['RW_OP'];
        }
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
                            <div class='col-md-3'> :  " . $rtop . " /  " . $rwop . "</div>
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
                        <div class='panel-heading'><strong>Data SPPT-PBB</strong></div>
                        <table class='table table-striped'>
                            <tr>
                                <th>Tahun</th>
                                <th>Jatuh Tempo</th>
                                <th>Tunggakan (Rp.)</th>
                                <th>Denda (Rp.)</th>
                                <th>Tanggal Bayar</th>
                                <th>Jumlah Bayar</th>
                                <th>Status</th>
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
            $tunggakan = $row['PBB_YG_HARUS_DIBAYAR_SPPT'] + $denda;
            $dibayar = $row['DENDA_SPPT'] + $row['JML_SPPT_YG_DIBAYAR'];
            $id = $data_get['nop'] . "." . $data_get['tahun'];
            if ($tunggakan == $dibayar && !empty($row['TGL_BYR'])) {
                $status = "<a href='javascript:void(0)' onclick='cetakdata()' class='btn btn-success btn-xs'>Lunas <i class='glyphicon glyphicon-print'></i></a>";
            } else {
                $status = "Belum Lunas";
            }

            $datatunggakanpbb .= '<tr>
                        
                        <td>  ' . $row['THN_PAJAK_SPPT'] . ' </td>
                        <td>  ' . $row['JATUH_TEMPO'] . ' </td>
                        <td>  ' . number_format($row['PBB_YG_HARUS_DIBAYAR_SPPT'], 0, ',', '.') . ' </td>
                        <td>  ' . number_format($denda, 0, ',', '.') . ' </td>
                        <td>  ' . $row['TGL_BYR'] . ' </td>
                        <td>  ' . number_format($row['DENDA_SPPT'] + $row['JML_SPPT_YG_DIBAYAR'], 0, ',', '.') . ' </td>
                        <td>  ' . $status . ' </td>
                    </tr>
                    ';

            $i++;
            $PBB_YG_HARUS_DIBAYAR_SPPT = $PBB_YG_HARUS_DIBAYAR_SPPT + $row['PBB_YG_HARUS_DIBAYAR_SPPT'];
            $jumlahdenda = $jumlahdenda + $denda;
        }

        $datatunggakanpbb .= "
                <tr style='font-size:16px; font-weight:bold;'>
                    <td colspan='7'><center></center></td>
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

    public function cetakdataspptAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data_table = $this->Tools()->getService('CeknopTable')->temukanDataInfoop($data_get['nop']);
        // \var_dump($data_table);
        // exit;
        $data_tunggakan = $this->Tools()->getService('CeknopTable')->temukanDataTunggakanopInfo($data_get['nop'], $data_get['tahun']);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        if ($data_table['RT_OP'] == null) {
            $rtop = "000";
        } else {
            $rtop = $data_table['RT_OP'];
        }
        if ($data_table['RW_OP'] == null) {
            $rwop = "000";
        } else {
            $rwop = $data_table['RW_OP'];
        }
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data_table,
            'ar_pemda' => $ar_pemda,
            'datasppt' => $data_tunggakan,
            'rtop' => $rtop,
            'rwop' => $rwop
        ));
        $pdf->setOption("paperSize", "A4");
        return $pdf;
    }
}
