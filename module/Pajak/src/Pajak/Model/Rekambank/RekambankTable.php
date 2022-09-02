<?php

namespace Pajak\Model\Rekambank;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class RekambankTable extends AbstractTableGateway {

    protected $table = 't_setorbankheader', $table_detail = 't_setorbankdetail';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new RekambankBase());
        $this->initialize();
    }

    public function getRekambankId($t_idsbh) {
        $rowset = $this->select(array('t_idsbh' => $t_idsbh));
        $row = $rowset->current();
        return $row;
    }

    public function getRekambankNo($t_nosbh, $t_tglsbh) {
        $tgl = (int) date('Y', strtotime($t_tglsbh));
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        $where->literal("extract(YEAR FROM t_tglsbh)=$tgl");
        $where->equalTo('t_nosbh', $t_nosbh);
        $where->equalTo('t_issbhdeleted', 0);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getRekambankTgl($t_tglsbh) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);

        $where = new Where();
        $where->equalTo('t_tglsbh', date('Y-m-d', strtotime($t_tglsbh)));
        $where->equalTo('t_issbhdeleted', 0);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getRekambankDetailTgl($t_tglsbh) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(["a" => "t_setorbankdetail"]);
        $select->join(["b" => "view_rekening"], 'b.s_idkorek=a.t_idkoreksbd', ['*'], $select::JOIN_LEFT);
        $select->join(["c" => "t_setorbankheader"], 'c.t_idsbh=a.t_idsbh', ['t_tglsbh'], $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_tglsbh', date('Y-m-d', strtotime($t_tglsbh)));
        $where->equalTo('a.t_issbddeleted', 0);
        $where->equalTo('c.t_issbhdeleted', 0);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function simpansetoranheader(RekambankBase $base, $session, $post) {
        $data = array(
            't_tglsbh' => date('Y-m-d', strtotime($base->t_tglsbh)),
            't_nosbh' => $base->t_nosbh
        );
        if ($base->t_idsbh != NULL):
            $this->update($data, ['t_idsbh' => $base->t_idsbh]);
        else:
            $this->insert($data);
        endif;

        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_setorbankheader");
        $select->columns(array(
            "t_idsbh"
        ));
        $where = new Where();
        $where->equalTo('t_tglsbh', date('Y-m-d', strtotime($base->t_tglsbh)));
        $where->equalTo('t_nosbh', $base->t_nosbh);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function simpansetorandetail($dataheader, $t_idkorek, $t_jmlhskbd, $idtransaksi) {
        $data = array(
            't_idsbh' => $dataheader['t_idsbh'],
            't_idtransaksi' => $idtransaksi,
            't_idkoreksbd' => $t_idkorek,
            't_jmlhsbd' => str_ireplace(".", "", $t_jmlhskbd)
        );
        $table_detail = new \Zend\Db\TableGateway\TableGateway('t_setorbankdetail', $this->adapter);
        if ($dataheader['t_idsbd'] != NULL):
            $table_detail->update($data, ['t_idsbd' => $dataheader['t_idsbd']]);
        else:
            $table_detail->insert($data);
        endif;
    }

    public function getGridCountSetoran(RekambankBase $base) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
        $select->columns(
                array(
                    't_idsbh', 't_tglsbh', 't_nosbh',
                    't_jmlhsetoran' => new \Zend\Db\Sql\Expression("?", array($sql->select()->from(
                                        array(
                                            'b' => $this->table_detail
                                ))->columns(array(
                                    't_jmlhsetoran' => new \Zend\Db\Sql\Expression('sum(t_jmlhsbd)')
                                ))
                                ->where("a.t_idsbh = b.t_idsbh")
                            ))
                )
        );
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari LIKE '%$base->kolomcari%'");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $where->equalTo('t_issbhdeleted', 0);
        $select->where($where);
        $select->order('t_nosbh desc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridDataSetoran(RekambankBase $base, $offset) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => $this->table
        ));
        $select->columns(
                array(
                    't_idsbh', 't_tglsbh', 't_nosbh',
                    't_jmlhsetoran' => new \Zend\Db\Sql\Expression("?", array($sql->select()->from(
                                        array(
                                            'b' => $this->table_detail
                                ))->columns(array(
                                    't_jmlhsetoran' => new \Zend\Db\Sql\Expression('sum(t_jmlhsbd)')
                                ))
                                ->where("a.t_idsbh = b.t_idsbh")
                            ))
                )
        );
        $where = new Where();
        if ($base->kolomcari != 'undefined') {
            if ($base->combocari != "undefined") {
                if ($base->combooperator == "carilike" || $base->combooperator == 'undefined') {
                    $where->literal("$base->combocari LIKE '%$base->kolomcari%'");
                } elseif ($base->combooperator == "carisama") {
                    $where->equalTo($base->combocari, $base->kolomcari);
                }
            }
        }
        $where->equalTo('t_issbhdeleted', 0);
        $select->where($where);
        if ($base->sortasc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortasc");
            } else {
                $select->order("t_nosbh desc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("t_nosbh desc");
            }
        } else {
            $select->order("t_nosbh desc");
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function hapusRekambank($id, $session) {
        $data = array(
            't_issbhdeleted' => 1
        );
        $this->update($data, array('t_idsbh' => $id));
        $tbDetail = new \Zend\Db\TableGateway\TableGateway('t_setorbankdetail', $this->adapter);
        $tbDetail->update(['t_issbddeleted' => 1], ['t_idsbh' => $id]);
    }

    public function carisetoranpokok($t_tglsbh) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => 't_transaksi'
        ));
        $select->columns(array(
            "t_idkorek", 't_tglpembayaran', 't_jmlhpembayaran', 't_idtransaksi'
        ));
        $select->join(array(
            "b" => 'view_rekening'
                ), "a.t_idkorek = b.s_idkorek", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('t_tglpembayaran', date('Y-m-d', strtotime($t_tglsbh)));
        $where->equalTo('t_viapembayaran', 1);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function carisetorandenda($t_tglsbh) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => 't_transaksi'
        ));
        $select->columns(array(
            "t_idkorek" => "t_idkorekdenda", 't_tglpembayaran' => 't_tglbayardenda', 't_jmlhpembayaran' => 't_jmlhbayardenda', 't_idtransaksi'
        ));
        $select->join(array(
            "b" => 'view_rekening'
                ), "a.t_idkorekdenda = b.s_idkorek", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('t_tglbayardenda', date('Y-m-d', strtotime($t_tglsbh)));
        $where->equalTo('t_viapembayarandenda', 1);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataRekambankIDHeader($t_idsbh) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => 't_setorbankheader'
        ));
        $where = new Where();
        $where->equalTo('a.t_idsbh', (int) $t_idsbh);
        $where->equalTo('t_issbhdeleted', 0);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getDataRekambankIDDetail($t_idsbh) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            'a' => 't_setorbankdetail'
        ));
        $select->join(array(
            "b" => 'view_rekening'
                ), "a.t_idkoreksbd = b.s_idkorek", array(
            "korek", "s_namakorek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idsbh', (int) $t_idsbh);
        $where->equalTo('t_issbddeleted', 0);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    function getDataRekambank($tahun, $bulan) {
        $tahun = str_replace(' ', '', $tahun);
        $sql = "select t1.t_tglsbh as tglbayar, t0.t_jmlhsbd as pembayaran, t_rek.korek, t_rek.s_namakorek, 'Bendahara Penerima' as penyetor
from t_setorbankdetail t0
left join t_setorbankheader t1 ON t1.t_idsbh=t0.t_idsbh
left join view_rekening t_rek ON t_rek.s_idkorek=t0.t_idkoreksbd
where extract(month from t1.t_tglsbh)::int = " . $bulan . " and extract(year from t1.t_tglsbh)::int=" . $tahun . "
order by t1.t_tglsbh";
//        die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

}
