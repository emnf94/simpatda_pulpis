<?php

namespace Pajak\Model\Pendataan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class DetailminerbaTable extends AbstractTableGateway
{

    protected $table = 't_detailminerba';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->initialize();
    }

    public function simpanpendataanminerba($datapost, $dataparent)
    {
        $this->delete(array('t_idtransaksi' => $dataparent['t_idtransaksi']));
        for ($i = 0; $i < count($datapost['t_idkorek']); $i++) {
            if (!empty($datapost['t_idkorek'][$i])) {
                $data = array(
                    't_idtransaksi' => $dataparent['t_idtransaksi'],
                    't_idkorek' => $datapost['t_idkorek'][$i],
                    't_volume' => (float)($datapost['t_volume'][$i]),
                    't_hargapasaran' => str_ireplace(".", "", $datapost['t_hargapasaran'][$i]),
                    't_jumlah' => str_ireplace(".", "", $datapost['t_jumlah'][$i]),
                    't_tarifpersen' => str_ireplace(".", "", $datapost['t_tarifpersen'][$i]),
                    't_pajak' => str_ireplace(".", "", $datapost['t_pajak'][$i]),
                    't_idjenis' => str_ireplace(".", "", $datapost['t_jenis'][$i]),
                );
                if (empty($data['t_idtransaksi'])) {
                    $data['t_idtransaksi'] = $datapost['t_idtransaksi'];
                }
                $this->insert($data);
            }
        }
        // exit();
    }

    public function getPendataanMinerbaByIdTransaksi($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_transaksi"
        ));
        $select->join(array(
            "b" => "view_rekeningminerba"
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

    public function getDetailMinerbaByIdTransaksi($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailminerba"
        ));
        $select->join(array(
            "b" => "s_minerba_jenis"
        ), "a.t_idjenis = b.s_idjenisminerba", array(
            "s_harga", "s_tarif"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getKorekDetail($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "t_detailminerba"
        ));
        $where = new Where();
        $where->equalTo('a.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataJenisMinerba($idkorek = null)
    {
        if ($idkorek != null) {
            $sql = "select * from s_minerba_jenis where s_idkorek = '" . $idkorek . "'";
        } else {
            $sql = "select * from s_minerba_jenis";
        }

        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function getdatatarifJenisMinerba($idjenis)
    {
        $sql = "select * from s_minerba_jenis where s_idjenisminerba = '" . $idjenis . "'";

        $statement = $this->adapter->query($sql);
        return $statement->execute()->current();
    }
}
