<?php

namespace Pajak\Helper;

use Zend\View\Helper\AbstractHelper;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use DOMPDFModule\View\Model\PdfModel;

class MenuHelper extends AbstractHelper implements ServiceLocatorAwareInterface {

    protected $tbl;

    public function __invoke() {
        return $this;
    }

    public function setServiceLocator(ServiceLocatorInterface $serviceLocator) {
        $this->serviceLocator = $serviceLocator;
        return $this;
    }

    public function getServiceLocator() {
        return $this->serviceLocator;
    }

    public function GetDataPemda() {

        $ar_pemda = $this->gettbl("PemdaTable")->getdata();

        return $ar_pemda;
    }

    public function GetDataBackground() {

        $bg = $this->gettbl("CustomLayoutTable")->get_bg();

        return $bg;
    }

    public function gettbl($tbl_service) {
        $this->tbl = $this->getServiceLocator()->getServiceLocator()->get($tbl_service);
        return $this->tbl;
    }

    //=========== warna header
    public function warnadefault($warna) {
        if (!empty($warna)) {
            $warnajudulheader = $warna;
        } else {
            $warna = '#0073b7';
        }

        return $warna;
    }

    public function GetDataLayout() {

        $warna = $this->gettbl("CustomLayoutTable")->get_layout();

        return $warna;
    }
    
    public function GetDataReklameSudutPandang($id) {

        $data = $this->gettbl("PendataanTable")->cek_sudutpandang_reklame($id);

        return $data;
    }
    
    public function adminpendataanleftmenu() {

        $data = $this->gettbl("PendataanTable")->adminpendataanleftmenu();

        return $data;
    }
    
    public function cekjenispajak($id) {

        $data = $this->gettbl("PendataanTable")->cekjenispajak($id);

        return $data;
    }
    
    public function cekkecamatan($id) {

        $data = $this->gettbl("PendataanTable")->cekkecamatan($id);

        return $data;
    }
    
    public function cekkelurahan($id) {

        $data = $this->gettbl("PendataanTable")->cekkelurahan($id);

        return $data;
    }
    
    public function ceknamaobjekwp($id) {

        $data = $this->gettbl("PendataanTable")->ceknamaobjekwp($id);

        return $data;
    }
    
    public function cekobjekwp($id){
        $data = $this->gettbl("PendataanTable")->cekobjekwp($id);

        return $data;
    }
    
    
    public function semuapejabat(){
        $ar_ttd0 = $this->gettbl('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_ttd0 as $ar_ttd0) {
            $recordspejabat[] = $ar_ttd0;
        }
        
        return $recordspejabat;
    }    
    
    public function getnamapejabat($id){
        $ar_ttd = $this->gettbl('PejabatTable')->getPejabatId($id);
        return $ar_ttd;
    }
    
    public function GetDataKecamatan($id) {

        $data = $this->gettbl("KecamatanTable")->getDataId($id);

        return $data;
    }
    
    public function GetDataKelurahan($id) {

        $data = $this->gettbl("KelurahanTable")->getDataId($id);

        return $data;
    }
    
    public function GetDataPeruntukanAirtanah($id) {

        $data = $this->gettbl("PembayaranTable")->getDataperuntukan($id);

        return $data;
    }
    
    public function getDatajenisketetapan() {

        $data = $this->gettbl("PembayaranTable")->getDatajenisketetapan();

        return $data;
    }
    
    public function getDatajenispajak() {

        $data = $this->gettbl("PembayaranTable")->getDatajenispajak();

        return $data;
    }
    
    public function semuadata_target() {

        $data = $this->gettbl("PembukuanTable")->semuadata_target();

        return $data;
    }
    
    public function detailminerba($id) {

        $data = $this->gettbl("PendataanTable")->cek_detailminerba($id);

        return $data;
    }
    
    public function semudadata_role() {

        $data = $this->gettbl("UserTable")->semudadata_role();

        return $data;
    }
    
    public function jenislokasi_reklame($id){
        $data = $this->gettbl("PendataanTable")->jenislokasi_reklame($id);

        return $data;
    }
    
    public function kelasjalan_reklame($id){
        $data = $this->gettbl("PendataanTable")->kelasjalan_reklame($id);

        return $data;
    }
    
    public function sudutpandang_reklame($id){
        $data = $this->gettbl("PendataanTable")->sudutpandang_reklame($id);

        return $data;
    }
    
    public function semuadatakecamatan(){
        $data = $this->gettbl('KecamatanTable')->getdata();
        
        return $data;
    }
    
    public function semuadatalokasireklame(){
        $datacombo_lokasi_reklame = $this->gettbl('PendataanTable')->semuadatalokasireklame();
        return $datacombo_lokasi_reklame;
    }
    
    public function semuadatakelasjalan(){
        $datacombo_kelasjalan_reklame = $this->gettbl('PendataanTable')->semuadatakelasjalan();
        return $datacombo_kelasjalan_reklame;
    }
            
    public function semuadatakelurahan_berdasarkec($id){
        $data = $this->gettbl('PendataanTable')->semuadatakelurahan_berdasarkec($id);
        return $data;
    }
    
    public function semuadata_sudutpandang_berdasarkelasjalan($id){
        $data = $this->gettbl('PendataanTable')->semuadata_sudutpandang_berdasarkelasjalan($id);
        return $data;
    }
    
    
    public function cekrekening($id){
        $data = $this->gettbl('PendataanTable')->cekrekening($id);
        return $data;
    }
    
    public function semuadata_peruntukanairtanah(){
        $data = $this->gettbl("PendataanTable")->semua_bymsjenisair();

        return $data;
    }
    
    public function cek_byms_reklame_detail($id){
        $data = $this->gettbl("PendataanTable")->cek_byms_reklame_detail($id);

        return $data;
    }
    
    public function semuadata_jenisairtanah(){
        $data = $this->gettbl("AirTable")->semuadata_jenisairtanah();

        return $data;
    }
    
    public function semuadata_sumur($idobjek){
        $data = $this->gettbl("ObjekTable")->getDataObjekId_sumur($idobjek);

        return $data;
    }
    
    public function semuadata_sumur_volumesebelum($id_sumurke, $bulansebelum, $tahunsekarang){
        $data = $this->gettbl("ObjekTable")->getDataObjekId_sumur_volumesebelum($id_sumurke, $bulansebelum, $tahunsekarang);

        return $data;
    }
    
    
    /*public function getOneKecamatan($id) {

        $data = $this->gettbl("KecamatanTable")->getOneKecamatan($id);

        return $data;
    }
    
    public function getOneKelurahan($id) {

        $data = $this->gettbl("KelurahanTable")->getOneKelurahan($id);

        return $data;
    }*/

    public function headeratas($judul, $link) {
        $warna = $this->GetDataLayout();

        $headeratas = '<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary" style="border: 1px solid ' . $this->warnadefault($warna['warna_judul_box']) . ';">
                    <div class="box-header with-border" style="
    background: #0073b7 !important;
    background: -webkit-gradient(linear, left bottom, left top, color-stop(0, #0073b7), color-stop(1, #0089db)) !important;
    background: -ms-linear-gradient(bottom, #0073b7, #0089db) !important;
    background: -moz-linear-gradient(center bottom, ' . $this->warnadefault($warna['warna_judul_gradient_bawah']) . ' 0, ' . $this->warnadefault($warna['warna_judul_gradient_atas']) . ' 100%) !important;
    background: -o-linear-gradient(#0089db, #0073b7) !important;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#0089db\', endColorstr=\'#0073b7\', GradientType=0) !important;
    color: #fff;
">
                        <center><h3 class="box-title">' . $judul . '</h3> </center>
                        <div class="pull-right">         
                            ' . $link . '
                        </div>
                    </div>
                    <div class="box-body">    
    ';
        return $headeratas;
    }

    public function headeratas_end() {
        $headeratas_end = '</div>

                </div>
            </div>
        </div>
    </section>
</div>           ';

        return $headeratas_end;
    }

    
    public function fr_datatables($home, $idtabel, $url, $jmlkolom, $pencarian_bawah, $seleksi_kolom = null, $typeinput = null, $dtablename = null) {

        if (!empty($seleksi_kolom)) {
            $sortnyadiseleksi = $seleksi_kolom;
        } else {
            $sortnyadiseleksi = "0";
        }
        
        if(!empty($dtablename)){
            $namadatatables = $dtablename; 
        }else{
            $namadatatables = 'dTable';
        }
        
        $databasicprogram = $this->gettbl("PendaftaranTable")->tblbasicprogram();
        
        if ($_SERVER['HTTP_HOST'] == $databasicprogram['domain_http_host_simpatda']) { //'simpatda.banyumaskab.go.id'
            //$docroot = "http://simpatda.banyumaskab.go.id/";
            $docroot = "https://".$databasicprogram['domain_http_host_simpatda']."/";
            //$docroot = $_SERVER['DOCUMENT_ROOT'] . "/".$this->basePath() . "/";
        } else {
            
            $docroot = "http://".$_SERVER['HTTP_HOST']."/".$databasicprogram['letak_fr_datatables_simpatda'].""; ///kabupaten_banyumas/new/simpatda_banyumas/
        }
        
        //$docroot = $_SERVER['DOCUMENT_ROOT'];
        
        //var_dump($docroot); exit();
        
        //var_dump($namadatatables); exit();
        // "'8','9'"; //["8","9"];
        return '<script type="text/javascript">
                var seleksi_kolom = [' . $sortnyadiseleksi . '];
                 
                 $(document).ready(function () {
                        
                        var dTable;
                        fr_datatables("' . $home . '","' . $idtabel . '", "' . $url . '", "' . $jmlkolom . '", "' . $pencarian_bawah . '",seleksi_kolom,"' . $typeinput . '", "'.$docroot.'", "'.$namadatatables.'");
                        
                });

                $(\'.sidebar-toggle\').click(function() {
                        $(\'.dataTables_scrollHeadInner\').attr(\'style\', \'width:100%;\');
                        $(\'.dataTable\').attr(\'style\', \'width:100%;\');
                        $(\'.dataTables_scrollFootInner\').attr(\'style\', \'width:100%;\');
                        //dTable.columns.adjust();

                });
               </script>';
    }
    
    

    public function kekata($x) {
        $x = abs($x);
        $angka = array("", "Satu", "Dua", "Tiga", "Empat", "Lima",
            "Enam", "Tujuh", "Delapan", "Sembilan", "Sepuluh", "Sebelas");
        $temp = "";
        if ($x < 12) {
            $temp = " " . $angka[$x];
        } else if ($x < 20) {
            $temp = $this->kekata($x - 10) . " Belas";
        } else if ($x < 100) {
            $temp = $this->kekata($x / 10) . " Puluh" . $this->kekata($x % 10);
        } else if ($x < 200) {
            $temp = " Seratus" . $this->kekata($x - 100);
        } else if ($x < 1000) {
            $temp = $this->kekata($x / 100) . " Ratus" . $this->kekata($x % 100);
        } else if ($x < 2000) {
            $temp = " Seribu" . $this->kekata($x - 1000);
        } else if ($x < 1000000) {
            $temp = $this->kekata($x / 1000) . " Ribu" . $this->kekata($x % 1000);
        } else if ($x < 1000000000) {
            $temp = $this->kekata($x / 1000000) . " Juta" . $this->kekata($x % 1000000);
        } else if ($x < 1000000000000) {
            $temp = $this->kekata($x / 1000000000) . " Milyar" . $this->kekata(fmod($x, 1000000000));
        } else if ($x < 1000000000000000) {
            $temp = $this->kekata($x / 1000000000000) . " Trilyun" . $this->kekata(fmod($x, 1000000000000));
        }
        return $temp;
    }

    function terbilang($x, $style = 4) {
        if ($x < 0) {
            $hasil = "MINUS " . trim($this->kekata($x));
        } else {
            $hasil = trim($this->kekata($x));
        }
        switch ($style) {
            case 1:
                $hasil = strtoupper($hasil);
                break;
            case 2:
                $hasil = strtolower($hasil);
                break;
            case 3:
                $hasil = ucwords($hasil);
                break;
            default:
                $hasil = ucfirst($hasil);
                break;
        }
        return $hasil;
    }
    
    function namabulan($id){
        $abulan = ['1' => 'Januari', '2' => 'Februari', '3' => 'Maret', '4' => 'April', '5' => 'Mei', '6' => 'Juni', '7' => 'Juli', '8' => 'Agustus', '9' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
        
        return $abulan[$id];
    }
    
    function namabulandate($id){
        $abulan = ['01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
        
        return $abulan[$id];
    }


    public function cek_jumlahbulandenda($tgl_tempo, $tagihan, $tglbayarnya = null) {
        
        if(!empty($tglbayarnya)){
            $tgl_bayar = $tglbayarnya;
        }else{
            $tgl_bayar = date('Y-m-d');
        }

        
        //$tgl_bayar = '2018-02-11';
        //$tgl_tempo = '2017-02-10';

        $tgl_bayar = explode("-", $tgl_bayar);
        $tgl_tempo = explode("-", $tgl_tempo);

        $tahun = $tgl_bayar[0] - $tgl_tempo[0];
        $bulan = $tgl_bayar[1] - $tgl_tempo[1];
        $hari = $tgl_bayar[2] - $tgl_tempo[2];

        if (($tahun == 0) || ($tahun < 1)) {
            if (($bulan == 0 ) || ($bulan < 1)) {
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
                if ($bulan == 1) {
                    $months = $bulan;
                } else {
                    if (($hari == 0) || ($hari < 1)) {
                        $months = $bulan;
                    } else {
                        $months = $bulan + 1;
                    }
                }
            }
        } else {
            $jmltahun = $tahun * 12;
            if ($bulan == 0) {
                //$months = $jmltahun;
                if (($hari == 0) || ($hari < 1)) {
                    $months = $jmltahun;
                } else {
                    $months = $jmltahun + 1;
                    //var_dump($months); exit();
                }
            } elseif ($bulan < 1) {
                //$months = $jmltahun + $bulan;
                if (($hari == 0) || ($hari < 1)) {
                    $months = $jmltahun + $bulan;
                } else {
                    $months = $jmltahun + $bulan + 1;
                    //var_dump($months); exit();
                }
            } else {
                //$months = $bulan + $jmltahun;
                if (($hari == 0) || ($hari < 1)) {
                    $months = $jmltahun + $bulan;
                } else {
                    $months = $jmltahun + $bulan + 1;
                }
            }
        }

        //var_dump($months); exit();
        //return $months;
        if ($months > 24)
            $months = 24;                                               //jila lebih 24 bulan
        if ($months > 0)
            $jmldenda = $months * 2 / 100 * $tagihan;
        else
            $jmldenda = 0;    //hitung jumlah dendan 2% kali jumlah bulan
        //if($months<0) $months=0;
        $result['denda'] = ceil($jmldenda);
        $result['jumlahbulandenda'] = $months;
        return $result;
    }
}
