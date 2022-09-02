<?php

namespace Pajak\Model\Pemeriksaan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;


class PemeriksaanskpdtTable extends AbstractTableGateway {

    protected $table = 't_skpdt';


     public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PemeriksaanskpdtBase());
        $this->initialize();
    }


    public function getjenissurat($s_idsurat) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_jenissurat");
        $where = new Where();
        $where->equalTo("s_idsurat", $s_idsurat);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function simpanskpdt(PemeriksaanskpdtBase $base, $session) {
        // Kode Provinsi dan Kab/Kota
        $kdProvkabkota = '01';
        $no = $this->maxNoSKPDT();
        $t_noskpdt = (int) $no['t_noskpdt'] + 1;

        // Jatuh Tempo SKPDTWS
        $t_tgljatuhtempofix = date('Y-m-d', strtotime("+30 days" . $base->t_tglpemeriksaan));
        
        if(!empty($base->t_dasarrevisi)){
            $t_dasarrevisi = str_ireplace('.', '', $base->t_dasarrevisi);
        }else{
            $t_dasarrevisi = 0 ;
        }
        
        if(!empty($base->t_selisihdasar)){
            $t_selisihdasar = str_ireplace('.', '', $base->t_selisihdasar);
        }else{
            $t_selisihdasar = 0 ;
        }
        
        // Kode Bayar Self => 5-SKPDT
        $jenissurat = $this->getjenissurat(10);
        $data = array(
            't_idtransaksi' => $base->t_idtransaksi,
            't_nopemeriksaan' => $base->t_nopemeriksaan,
            't_noskpdt' => $t_noskpdt,
            't_periodeskpdt' => $base->t_periodepemeriksaan,
            't_tglskpdt' => date('Y-m-d', strtotime($base->t_tglpemeriksaan)),
            't_tgljatuhtemposkpdt' => $t_tgljatuhtempofix,
            't_tarifpajak' => $base->t_tarifpajak,
            't_dasarrevisi' => $t_dasarrevisi,
            't_selisihdasar' => $t_selisihdasar,
            't_jmlhbln' => $base->t_jmlhbln,
            't_tarifpajak' => 0,
            't_tarifpersen' => $base->t_tarifpersen,
            't_jmlhdendaskpdt' => str_ireplace('.', '', $base->t_jmlhdendapemeriksaan),
            't_jmlhpajakseharusnya' => str_ireplace('.', '', $base->t_jmlhpajakseharusnya),
            't_tarifkenaikan' => $base->t_tarifkenaikan,
            't_jmlhkenaikan' => str_ireplace('.', '', $base->t_jmlhkenaikan),
            't_jmlhpajakskpdt' => str_ireplace('.', '', $base->t_jmlhpajakpemeriksaan),
            't_kodebayarskpdt' => $kdProvkabkota.''.str_pad($base->t_jenispajak, 2, "0", STR_PAD_LEFT).''.str_pad($jenissurat['s_idsurat'], 2, "0", STR_PAD_LEFT) . "" . substr($base->t_periodepemeriksaan,2) . "" . str_pad($t_noskpdt, 5, "0", STR_PAD_LEFT),
            't_totalskpdt' => str_ireplace('.', '', $base->t_totalpemeriksaan),
            't_operatorskpdt' => $session['s_iduser']
        );
        // var_dump($data);exit();
        $table_skpdt = new \Zend\Db\TableGateway\TableGateway('t_skpdt', $this->adapter);
        $table_skpdt->insert($data);
        return $data;
    }

    public function hapusPemeriksaan($id, $session) {
        $data = array(
            'is_deluserpembayaran' => $session['s_iduser']
        );
        $this->update($data, array('t_idtransaksi' => $id));
    }

    public function maxNoSKPDT() {
        $sql = "select max(t_noskpdt) as t_noskpdt from t_skpdt";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res->current();
    }

}
