<?php

namespace Pajak\Model\CeknopTable;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class CeknopTable extends AbstractTableGateway
{

    protected $table = 'SPPT';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->initialize();
    }

    public function temukanDataInfoop($nopcari)
    {

        $nop = explode('.', $nopcari);

        $KD_PROPINSI = $nop[0];
        $KD_DATI2 = $nop[1];
        $KD_KECAMATAN = $nop[2];
        $KD_KELURAHAN = $nop[3];
        $KD_BLOK = $nop[4];
        $NO_URUT = $nop[5];
        $KD_JNS_OP = $nop[6];



        $sql = "select 
                    A.*,
                    B.NM_KECAMATAN,
                    C.NM_KELURAHAN,
                    D.NILAI_PER_M2_TANAH,
                    E.NILAI_PER_M2_BNG,
                    F.JALAN_OP,
                    F.BLOK_KAV_NO_OP,
                    F.RW_OP,
                    F.RT_OP
                from 
                    SPPT A
                LEFT JOIN
                    REF_KECAMATAN B ON B.KD_PROPINSI = A.KD_PROPINSI AND B.KD_DATI2 = A.KD_DATI2 AND B.KD_KECAMATAN = A.KD_KECAMATAN
                LEFT JOIN
                    REF_KELURAHAN C ON C.KD_PROPINSI = A.KD_PROPINSI AND C.KD_DATI2 = A.KD_DATI2 AND C.KD_KECAMATAN = A.KD_KECAMATAN AND C.KD_KELURAHAN = A.KD_KELURAHAN
                LEFT JOIN
                    KELAS_TANAH D ON D.KD_KLS_TANAH = A.KD_KLS_TANAH
                LEFT JOIN
                    KELAS_BANGUNAN E ON E.KD_KLS_BNG = A.KD_KLS_BNG
                LEFT JOIN
                    DAT_OBJEK_PAJAK F ON F.KD_PROPINSI = A.KD_PROPINSI AND F.KD_DATI2 = A.KD_DATI2 AND F.KD_KECAMATAN = A.KD_KECAMATAN AND F.KD_KELURAHAN = A.KD_KELURAHAN AND F.KD_BLOK = A.KD_BLOK AND F.NO_URUT = A.NO_URUT AND F.KD_JNS_OP = A.KD_JNS_OP
                where 
                    A.KD_JNS_OP = '" . $KD_JNS_OP . "' AND A.NO_URUT = '" . $NO_URUT . "' AND A.KD_BLOK = '" . $KD_BLOK . "' AND A.KD_KELURAHAN = '" . $KD_KELURAHAN . "' AND A.KD_KECAMATAN = '" . $KD_KECAMATAN . "' AND A.KD_DATI2 = '" . $KD_DATI2 . "' AND A.KD_PROPINSI ='" . $KD_PROPINSI . "'";

        $statement = $this->adapter->query($sql);

        return $statement->execute()->current();
    }

    public function temukanDataTunggakanopInfo($nopcari)
    { //SPPTBase $spt
        $nop = explode('.', $nopcari);
        $KD_PROPINSI =  $nop[0];
        $KD_DATI2 = $nop[1];
        $KD_KECAMATAN = $nop[2];
        $KD_KELURAHAN = $nop[3];
        $KD_BLOK = $nop[4];
        $NO_URUT = $nop[5];
        $KD_JNS_OP = $nop[6];
        $sql = "select THN_PAJAK_SPPT, PBB_YG_HARUS_DIBAYAR_SPPT, TO_CHAR(TGL_JATUH_TEMPO_SPPT,'DD-MM-YYYY') AS JATUH_TEMPO from SPPT 
                where KD_JNS_OP = '" . $KD_JNS_OP . "' AND NO_URUT = '" . $NO_URUT . "' AND KD_BLOK = '" . $KD_BLOK . "' AND KD_KELURAHAN = '" . $KD_KELURAHAN . "' AND KD_KECAMATAN = '" . $KD_KECAMATAN . "' AND KD_DATI2 = '" . $KD_DATI2 . "' AND KD_PROPINSI ='" . $KD_PROPINSI . "' AND STATUS_PEMBAYARAN_SPPT='0' order by THN_PAJAK_SPPT ASC";

        //KD_JNS_OP||NO_URUT||KD_BLOK||KD_KELURAHAN||KD_KECAMATAN||KD_DATI2||KD_PROPINSI='".$KD_JNS_OP.$NO_URUT.$KD_BLOK.$KD_KELURAHAN.$KD_KECAMATAN.$KD_DATI2.$KD_PROPINSI."' AND STATUS_PEMBAYARAN_SPPT='0' order by THN_PAJAK_SPPT ASC";
        $statement = $this->adapter->query($sql);

        return $statement->execute();
    }
}
