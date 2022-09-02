<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailairTable extends AbstractTableGateway {

    protected $table = 't_detailair';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new DetailairBase());
        $this->initialize();
    }

    public function simpanpendataanair(DetailairBase $base, $dataparent) {
        
        if(!empty($base->t_volume)){
            $t_volume = $base->t_volume;
        }else{
            $t_volume = 0;
        }    
         $t_tarifdasarkorek= str_ireplace(".", "", $base->t_tarifpajak);
         if ($t_tarifdasarkorek=='0'||$t_tarifdasarkorek=="0"||$t_tarifdasarkorek==""||$t_tarifdasarkorek=='') {
            $t_tarifdasarkorek=null;
         }else{
            $t_tarifdasarkorek=$t_tarifdasarkorek;
         }
        
        $data = array(
            't_idtransaksi' => $dataparent['t_idtransaksi'],
            't_volume' => str_ireplace(".", "", $base->t_volume),
            't_tarifdasarkorek' => $t_tarifdasarkorek,
            't_lamawaktu'=>$base->t_lamawaktu,
            't_debitair'=>$base->t_debitair,
            't_kualitasair'=>$base->t_kualitasair,
            't_peruntukan'=>$base->t_peruntukan,
            't_totalbiaya'=>(int)(str_ireplace(".", "",$base->t_totalbiaya)),
            't_npa' => (float)(str_ireplace(".", "", $base->t_npa)),
        );
       
        $t_idair = $base->t_idair;
        if (empty($t_idair)) {
            $this->insert($data);
        } else {
            $this->update($data, array('t_idair' => $t_idair));

        }
        return $data;
    }

    public function getDetailAirByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getPendataanairByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "view_rekening"
                ), "a.t_idkorek = b.s_idkorek", array(
            "s_idkorek", "korek", "s_namakorek", "s_persentarifkorek", "s_tarifdasarkorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

  
}
