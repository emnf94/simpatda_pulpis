<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailreklameTable extends AbstractTableGateway
{

    protected $table = 't_detailreklame';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new DetailreklameBase());
        $this->initialize();
    }

    public function simpanpendataanreklame($datapost, $dataparent, $namafile, $dir)
    {
        // if ($base->s_masa == 'Hari' || $base->s_masa == "Hari") {
        //     $base->s_masa = intval(1);
        // } elseif ($base->s_masa == 'Minggu' || $base->s_masa == "Minggu") {
        //     $base->s_masa = intval(2);
        // } elseif ($base->s_masa == 'Bulan' || $base->s_masa == "Bulan") {
        //     $base->s_masa = intval(3);
        // } elseif ($base->s_masa == 'Tahun' || $base->s_masa == "Tahun") {
        //     $base->s_masa = intval(4);
        // } else {
        //     $base->s_masa = null;
        // }

        // $data = array(
        //     't_idtransaksi' => $dataparent['t_idtransaksi'],
        //     't_jenisreklame' => $base->t_jenisreklame,
        //     't_naskah' => $base->t_naskah,
        //     't_kelasjalan' => $base->t_kelasjalan,
        //     't_lokasi' => $base->t_lokasi,
        //     't_ukuranmedia' => $base->t_ukuranmedia,
        //     't_satuanukuranmedia' => $base->t_satuanukuranmedia,
        //     't_parameter' => $base->t_parameter,
        //     't_tarifreklame' =>  $base->t_tarifpajak,
        //     't_panjang' => $base->t_panjang,
        //     't_lebar' => $base->t_lebar,
        //     't_jumlah' => $base->t_jumlah,
        //     't_jangkawaktu' => $base->t_jangkawaktu,
        //     't_tipewaktu' => $base->t_tipewaktu,
        //     't_idlokasi' => $base->t_idlokasi,
        //     't_jenisreklameusaha' => $base->t_jenisreklameusaha,
        //     't_luas' => $base->t_luas,
        //     // 't_kompensasi' => (int)(str_ireplace(".", "", $base->t_kompensasi)),
        //     // 't_jmlhpajakasli' => (int)(str_ireplace(".", "", $base->t_jmlhpajakasli)),

        // );

        // array(33) { ["t_periodepajak"]=> string(4) "2022" 
        //     ["t_jenisobjekpajak"]=> string(1) "4" 
        //     ["t_idtransaksi"]=> string(0) "" 
        //     ["t_iddetailreklame"]=> string(0) "" 
        //     ["t_idobjek"]=> string(4) "3450" 
        //     ["t_jenispajak"]=> string(1) "4" 
        //     ["t_tglpendataan"]=> string(10) "16-07-2022" 
        //     ["t_tglpenetapan"]=> string(10) "16-07-2022" 
        //     ["t_tipewaktu"]=> string(1) "1" 
        //     ["t_jangkawaktu"]=> string(1) "1" 
        //     ["t_masaawal"]=> string(10) "01-06-2022" 
        //     ["t_masaakhir"]=> string(10) "01-06-2022" 
        //     ["t_idkorek"]=> string(2) "59" 
        //     ["t_korek"]=> string(16) "4.1.01.09.01.001" 
        //     ["t_namakorek"]=> string(42) "REKLAME PAPAN/BILLBOARD/VIDEOTRON/MEGATRON" 
        //     ["t_naskah"]=> string(4) "asdw" 
        //     ["t_kelasjalan"]=> string(1) "4" 
        //     ["t_idlokasi"]=> string(2) "10" 
        //     ["t_lokasi"]=> string(4) "aswd" 
        //     ["t_jumlah"]=> string(1) "1" 
        //     ["t_jenisreklameusaha"]=> string(1) "2" 
        //     ["t_idkeberatan"]=> string(0) "" 
        //     ["t_jenisreklame"]=> array(3) { [0]=> string(1) "1" [1]=> string(1) "4" [2]=> string(1) "4" } 
        // ["t_panjang"]=> array(3) { [0]=> string(1) "0" [1]=> string(1) "3" [2]=> string(4) "0.76" } 
        // ["t_lebar"]=> array(3) { [0]=> string(1) "0" [1]=> string(3) "1.6" [2]=> string(3) "0.9" } 
        // ["t_sisi"]=> array(3) { [0]=> string(1) "0" [1]=> string(1) "2" [2]=> string(1) "1" } 
        // ["t_tinggi"]=> array(3) { [0]=> string(1) "7" [1]=> string(1) "0" [2]=> string(1) "0" } 
        // ["t_folio"]=> array(3) { [0]=> string(1) "0" [1]=> string(1) "0" [2]=> string(1) "0" } 
        // ["t_nsr"]=> array(3) { [0]=> string(5) "40000" [1]=> string(5) "28000" [2]=> string(5) "28000" } 
        // ["t_param"]=> array(3) { [0]=> string(42) "(( 7 m x Rp. 40.000 ) x 1 Tahun ) x 1 Buah" [1]=> string(62) "((( 3 m x 1.6 m x 2 sisi ) x Rp. 28.000 ) x 1 Tahun ) x 1 Buah" [2]=> string(65) "((( 0.76 m x 0.9 m x 1 sisi ) x Rp. 28.000 ) x 1 Tahun ) x 1 Buah" } 
        // ["t_jmlhpajaksub"]=> array(3) { [0]=> string(7) "280.000" [1]=> string(7) "268.800" [2]=> string(6) "28.000" } 
        // ["t_jmlhpajak"]=> string(7) "576.800" 
        // ["Pendataansubmit"]=> string(6) "Simpan" } 

        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));

        for ($i = 0; $i < count($datapost['t_jenisreklame']); $i++) {
            if (!empty($datapost['t_jenisreklame'][$i])) {

                $data = array(
                    't_idtransaksi' => $dataparent['t_idtransaksi'],
                    't_jenisreklame' => $datapost['t_jenisreklame'][$i],
                    't_naskah' => $datapost['t_naskah'],
                    't_lokasi' => $datapost['t_lokasi'],
                    't_panjang' => $datapost['t_panjang'][$i],
                    't_lebar' => $datapost['t_lebar'][$i],
                    't_jumlah' => $datapost['t_jumlah'],
                    't_jangkawaktu' => $datapost['t_jangkawaktu'],
                    't_tipewaktu' => $datapost['t_tipewaktu'],
                    't_jenisreklameusaha' => $datapost['t_jenisreklameusaha'],
                    't_nsr' => str_ireplace(".", "", $datapost['t_nsr'][$i]),
                    't_tarifreklame' =>  $datapost->t_tarifpajak,
                    't_kelasjalan' => $datapost['t_kelasjalan'],
                    't_sudutpandang' => $datapost['t_sisi'][$i],
                    't_idlokasi' => $datapost['t_idlokasi'],
                    't_parameter' => $datapost['t_param'][$i],
                    't_tinggi' => $datapost['t_tinggi'][$i],
                    't_jmlhpajakasli' => (float)str_ireplace(".", "", $datapost['t_jmlhpajaksub'][$i]),
                    't_suratrekomendasi' => $dir,
                    't_namafilerekomendasi' => $namafile
                    // 't_luas' => $datapost->t_luas,
                    // 't_ukuranmedia' => $datapost->t_ukuranmedia,
                    // 't_satuanukuranmedia' => $datapost->t_satuanukuranmedia,
                );

                $this->insert($data);
            }
        }
        return $data;
    }

    public function getDetailReklameByIdTransaksi($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        $where->equalTo('t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }


    public function getdatarekeningreklame($t_jenisreklame)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_rekening"
        ));
        $select->columns(array(
            "s_idkorek", "s_namakorek", "s_persentarifkorek", "korek"
        ));
        $select->join(array(
            "b" => "s_reklamejenis"
        ), "a.s_idkorek = b.s_idrekening", array(
            "s_idreklamejenis"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('b.s_idreklamejenis', $t_jenisreklame);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function gettarifreklame($s_jenistarif)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklamejenis');
        $select->columns(array("s_njop"));
        $where = new Where();
        $where->equalTo('s_idreklamejenis', $s_jenistarif);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        foreach ($res as $key) {
            $res = $key;
        }
        return $res;
    }

    public function getnilaistrategis($t_jenisreklame, $t_kelasjalan)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_nilaistrategis');
        $select->columns(array("s_harga"));
        $where = new Where();
        $where->equalTo('s_idreklamelokasi', $t_kelasjalan);
        $where->equalTo('s_idreklamejenis', $t_jenisreklame);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        foreach ($res as $key) {
            $res = $key;
        }
        return $res;
    }

    public function getLokasiByKelas($s_klasifikasilokasi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklamelokasi');
        $where = new Where();
        $where->equalTo('s_klasifikasilokasi', $s_klasifikasilokasi);
        $select->where($where);
        $select->order('s_idreklamelokasi asc');
        $state = $sql->prepareStatementForSqlObject($select);
        return $state->execute();
    }

    public function getLokasiAll()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklamelokasi');
        $select->order('s_idreklamelokasi asc');
        $state = $sql->prepareStatementForSqlObject($select);
        return $state->execute();
    }

    public function getindeksrekalame($t_jenisreklame)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklamejenis');
        $select->columns(array("s_indeks"));
        $where = new Where();
        $where->equalTo('s_idreklamejenis', $t_jenisreklame);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        foreach ($res as $key) {
            $res = $key;
        }
        return $res;
    }
    public function getindekskelasjalan($t_jenisreklame, $t_kelasjalan)
    {
        // var_dump($t_jenisreklame."   ".$t_kelasjalan);exit();
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklamenilaijalan');
        $select->columns(array("s_indeks"));
        $where = new Where();
        $where->equalTo('s_idjenisreklame', $t_jenisreklame);
        $where->equalTo('s_klasifikasilokasi', $t_kelasjalan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        foreach ($res as $key) {
            $res = $key;
        }
        return $res;
    }
    public function getindeksjangkawaktu($t_idjenisreklame, $t_jangkawaktu, $t_tipewaktu)
    {
        $sql = "SELECT s_indeks FROM s_reklamenilaiwaktu WHERE s_idjenisreklame='$t_idjenisreklame' AND $t_jangkawaktu>=s_waktu1 AND $t_jangkawaktu<=s_waktu2 AND s_idreklamewaktu='$t_tipewaktu'";
        $statement = $this->adapter->query($sql);
        // var_dump($sql);exit();
        $res = $statement->execute();
        foreach ($res as $key) {
            $res = $key['s_indeks'];
        }
        return $res;
    }

    public function getindeksukuranreklame($s_idukurannilaireklame)
    {
        $sql = "SELECT s_indeks FROM s_reklamenilaiukuran WHERE s_idukurannilaireklame='$s_idukurannilaireklame'";
        // var_dump($sql);exit();
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        foreach ($res as $key) {
            $res = $key['s_indeks'];
        }
        return $res;
    }

    public function gettarifdasar($t_jenisreklame, $t_kelasjalan)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklamenjop');
        $select->columns(array("s_njopdasar"));
        $where = new Where();
        $where->equalTo('s_idjenisreklame', $t_jenisreklame);
        $where->equalTo('s_klasifikasilokasi', $t_kelasjalan);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        foreach ($res as $key) {
            $res = $key;
        }
        return $res;
    }

    public function getcomborangeukuranmedia($t_idjenisreklame)
    {
        $sql = "SELECT * FROM s_reklamenilaiukuran WHERE s_idjenisreklame='$t_idjenisreklame'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getcombokelasjalan($t_idjenisreklame)
    {
        $sql = "SELECT * FROM s_nilaistrategis WHERE s_idreklamejenis='$t_idjenisreklame'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getpermanen($t_idjenisreklame)
    {
        $sql = "SELECT s_permanen FROM s_reklamejenis WHERE s_idreklamejenis='$t_idjenisreklame'";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->current();
        return $res;
    }

    public function getketeranganukuran($s_idukurannilaireklame)
    {

        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_reklamenilaiukuran');
        $where = new Where();
        $where->equalTo('s_idukurannilaireklame', (int) $s_idukurannilaireklame);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }
}
