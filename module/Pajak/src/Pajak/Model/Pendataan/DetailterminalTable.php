<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailterminalTable extends AbstractTableGateway {

    protected $table = 't_detailterminal';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpandetailterminal($datapost, $dataparent) {
        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));
        for ($i = 0; $i < count($datapost['t_idtarif']); $i++) {
            if (!empty($datapost['t_idtarif'][$i])) {
                $data = array(
                    't_idtransaksi' => $dataparent['t_idtransaksi'],
                    't_idtarif' => $datapost['t_idtarif'][$i],
                    't_idjenispelayanan' => $datapost['t_idjenis'][$i],
                    't_volume' => str_ireplace(".", "", $datapost['t_volume'][$i]),
                    't_hargadasar' => str_ireplace(".", "", $datapost['t_hargadasar'][$i]),
                    't_jumlah' => str_ireplace(".", "", $datapost['t_jumlah'][$i]),
                );
                $this->insert($data);
            }
        }
    }

    public function getDetailTerminalByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailterminal"
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getPendataanterminalByIdTransaksi($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailterminal"
        ));
        $select->join(array(
            "b" => "t_jenispelayanan_terminal"
                ), "a.t_idjenispelayanan = b.t_idjenispelayanan", 
                array("t_namajenispelayanan" => "t_keterangan"), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_tarifterminal"
                ), "a.t_idtarif = c.s_idtarif", 
                array("t_namatarif" => "s_keterangan"), $select::JOIN_LEFT);
        
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        // echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataJenis() {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('t_jenispelayanan_terminal');
        $where = new Where();
        $select->where($where);
        $select->order(['t_idjenispelayanan' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

	public function getdataTarifTerminal($idjenis) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifterminal');
        $where = new Where();
		$where->equalTo("s_idjenispelayanan", $idjenis);
        $select->where($where);
        $select->order(['s_idtarif' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
	
    public function getDataIdTerminal($id) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('s_tarifterminal');
        $where = new Where();
        $where->equalTo('s_idtarif', $id);
        $select->where($where);
        $select->order(['s_idtarif' => 'asc']);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }


}
