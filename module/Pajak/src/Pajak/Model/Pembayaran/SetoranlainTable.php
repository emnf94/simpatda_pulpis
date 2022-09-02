<?php

namespace Pajak\Model\Pembayaran;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class SetoranlainTable extends AbstractTableGateway
{

    protected $table = 't_setoranlain';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SetoranlainBase());
        $this->initialize();
    }

    public function getsetoranlainId($t_idtransaksi)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from([
            'a' => $this->table
        ]);
        $select->join(array(
            "b" => "view_rekening"
        ), "a.t_idrekening = b.s_idkorek", array(
            "*"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_satker"
        ), "a.t_idsatker = c.s_idsatker", array(
            "*"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_issetorandeleted', 0);
        $where->equalTo('t_idsetoranlain', $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->current();
    }

    public function simpan(SetoranlainBase $base)
    {
        $nilai = str_ireplace('.', '', $base->t_jumlahsetor);
        $t_jumlahsetor = str_replace(',', '.', $nilai);
        // var_dump($t_jumlahsetor);exit();
        $data = [
            't_idsatker' => $base->t_idsatker,
            't_idrekening' => $base->t_idrekening,
            't_tahunpajak' => $base->t_tahunpajak,
            't_jumlahsetor' => (float) $t_jumlahsetor,
            't_tglsetor' => date('Y-m-d', strtotime($base->t_tglsetor)),
            't_viasetor' => $base->t_viasetor,
            't_kodebukti' => $base->t_kodebukti,
            't_keterangan' => $base->t_keterangan,
        ];

        // $data = [
        //     't_idsatker' => $base->t_idsatker,
        //     't_idrekening' => $base->t_idrekening,
        //     't_tahunpajak' => $base->t_tahunpajak,
        //     't_jumlahsetor' => str_ireplace('.', '', $base->t_jumlahsetor),
        //     't_tglsetor' => date('Y-m-d', strtotime($base->t_tglsetor)),
        //     't_viasetor' => $base->t_viasetor,
        //     't_kodebukti' => $base->t_kodebukti,
        //     't_keterangan' => $base->t_keterangan,
        // ];

        // var_dump($data);exit();
        if ($base->t_idsetoranlain != NULL) :
            $this->update($data, array('t_idsetoranlain' => $base->t_idsetoranlain));
        else :
            $this->insert($data);
        endif;

        return $data;
    }

    public function getGridCount(SetoranlainBase $base, $parametercari)
    {
        // var_dump($parametercari);exit();
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from([
            'a' => $this->table
        ]);
        $select->join(array(
            "b" => "view_rekening"
        ), "a.t_idrekening = b.s_idkorek", array(
            "*"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_satker"
        ), "a.t_idsatker = c.s_idsatker", array(
            "*"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_issetorandeleted', 0);

        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari LIKE '%$base->kolomcari%'");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        if (!empty($parametercari->s_kodesatker)) {
            $where->literal("c.s_kodesatker LIKE '%$parametercari->s_kodesatker%'");
        }
        if (!empty($parametercari->korek)) {
            $where->literal("b.korek LIKE '%$parametercari->korek%'");
        }
        if (!empty($parametercari->t_tglsetor)) {
            $where->literal("to_char(a.t_tglsetor , 'DD-MM-YYYY') LIKE '%$parametercari->t_tglsetor%'");
        }
        if (!empty($parametercari->t_jumlahsetor)) {
            $t_jumlahsetor = str_ireplace(".", "", $parametercari->t_jumlahsetor);
            $where->literal("(a.t_jumlahsetor::text) LIKE '%$t_jumlahsetor%'");
        }
        $select->where($where);

        $state = $sql->prepareStatementForSqlObject($select);
        // echo $select->getSqlstring(); exit();
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(SetoranlainBase $base, $offset, $parametercari)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from([
            'a' => $this->table
        ]);
        $select->join(array(
            "b" => "view_rekening"
        ), "a.t_idrekening = b.s_idkorek", array(
            "*"
        ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "s_satker"
        ), "a.t_idsatker = c.s_idsatker", array(
            "*"
        ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_issetorandeleted', 0);
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari LIKE '%$base->kolomcari%'");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $select->where($where);
        if ($base->sortasc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortasc");
            } else {
                $select->order("t_idsetoranlain desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_idsetoranlain desc");
            }
        } else {
            $select->order("t_tglsetor desc");
        }
        if (!empty($parametercari->s_kodesatker)) {
            $where->literal("c.s_kodesatker LIKE '%$parametercari->s_kodesatker%'");
        }
        if (!empty($parametercari->korek)) {
            $where->literal("b.korek LIKE '%$parametercari->korek%'");
        }
        if (!empty($parametercari->t_tglsetor)) {
            $where->literal("to_char(a.t_tglsetor , 'DD-MM-YYYY') LIKE '%$parametercari->t_tglsetor%'");
        }
        if (!empty($parametercari->t_jumlahsetor)) {
            $t_jumlahsetor = str_ireplace(".", "", $parametercari->t_jumlahsetor);
            $where->literal("(a.t_jumlahsetor::text) LIKE '%$t_jumlahsetor%'");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $select->order("a.t_idsetoranlain asc");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function hapus($id)
    {
        $data = array(
            't_issetorandeleted' => 1,
        );
        $this->update($data, array('t_idsetoranlain' => $id));
    }

    public function gePembayaranByTglALL($tglbayar0, $tglbayar1)
    {

        $sql = "SELECT * 
        FROM t_setoranlain a
        LEFT JOIN view_rekening b ON b.s_idkorek = a.t_idrekening 
        WHERE t_issetorandeleted = 0
        and t_tglsetor BETWEEN '" . date('Y-m-d', strtotime($tglbayar0)) . "' AND '" . date('Y-m-d', strtotime($tglbayar1)) . "'
        order by b.korek, a.t_tglsetor ASC
        ";
        // echo ($sql); exit();
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }
}
