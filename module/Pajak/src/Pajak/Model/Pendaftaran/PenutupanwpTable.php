<?php

namespace Pajak\Model\Pendaftaran;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PenutupanwpTable extends AbstractTableGateway {

    protected $table = 't_wp', $table_wpobjek = 't_wpobjek';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new PenggabunganopBase());
        $this->initialize();
    }

    public function getGridDataObjekPajak(PenggabunganopBase $base, $post, $t_idobjek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from('view_wpobjek');
        $where = new Where();
        if ($post->t_nop != '')
            $where->literal("t_nop ILIKE '%$post->t_nop%'");
        if ($post->t_namaobjek != '')
            $where->literal("t_namaobjek ILIKE '%$post->t_namaobjek%'");
        if ($post->t_alamatlengkapobjek != '')
            $where->literal("t_alamatlengkapobjek ILIKE '%$post->t_alamatlengkapobjek%'");
        $where->literal('t_idobjek not in (' . $t_idobjek . ')');
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function simpanPenutupanWP($post, $session) {
        $data = array(
            't_tgl_tutup' => date('Y-m-d', strtotime($post['t_tglpenutupanwp'])),
			't_noberita' => $post['t_noberitawp'],
			't_ket_tutup' => $post['t_isiberitawp'],
			't_status_wp' => 'f',
			't_operatorid_tutup' => $session['s_iduser']
        );
        $table_wp = new \Zend\Db\TableGateway\TableGateway('t_wp', $this->adapter);
        $table_wp->update($data, array('t_idwp' => $post['t_idwp']));
		
		$data_objek = array(
			't_statusobjek' => 'f',
			't_operatoridtutup' => $session['s_iduser']
        );
        $table_wpobjek = new \Zend\Db\TableGateway\TableGateway('t_wpobjek', $this->adapter);
        $table_wpobjek->update($data_objek, array('t_idwp' => $post['t_idwp']));
    }

	public function simpanAktifasiWP($post, $session) {
        $data = array(
            't_tgl_buka' => date('Y-m-d', strtotime($post['t_tglaktifasiwp'])),
			't_noberita_buka' => $post['t_noberitawp1'],
			't_ket_buka' => $post['t_isiberitawp1'],
			't_status_wp' => 't',
			't_operatorid_buka' => $session['s_iduser']
        );
        $table_wp = new \Zend\Db\TableGateway\TableGateway('t_wp', $this->adapter);
        $table_wp->update($data, array('t_idwp' => $post['t_idwp1']));
		
		$data_objek = array(
			't_statusobjek' => 't',
			't_operatoridtutup' => $session['s_iduser']
        );
        $table_wpobjek = new \Zend\Db\TableGateway\TableGateway('t_wpobjek', $this->adapter);
        $table_wpobjek->update($data_objek, array('t_idwp' => $post['t_idwp1']));
    }
	
	public function simpanAktifasiOP($post, $session) {
		$data = array(
			't_status_wp' => 't',
			't_operatorid_buka' => $session['s_iduser']
        );
        $table_wp = new \Zend\Db\TableGateway\TableGateway('t_wp', $this->adapter);
        $table_wp->update($data, array('t_idwp' => $post['t_idwp2']));
		
		$data_objek = array(
			't_statusobjek' => 't',
			't_operatoridtutup' => $session['s_iduser']
        );
        $table_wpobjek = new \Zend\Db\TableGateway\TableGateway('t_wpobjek', $this->adapter);
        $table_wpobjek->update($data_objek, array('t_idobjek' => $post['t_idwpobjek2']));
    }
	
	public function simpanTutupOP($post, $session) {
		$data_objek = array(
			't_statusobjek' => 'f',
			't_operatoridtutup' => $session['s_iduser']
        );
        $table_wpobjek = new \Zend\Db\TableGateway\TableGateway('t_wpobjek', $this->adapter);
        $table_wpobjek->update($data_objek, array('t_idobjek' => $post['t_idwpobjek1']));
    }
	
	public function getGridPenutupanCount(PendaftaranBase $base, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array('t_idwp'));
        $where = new Where();
		$where->literal("t_status_wp = 'true'");
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("t_tgldaftar between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_alamat_lengkap != '')
            $where->literal("t_alamat_lengkap ILIKE '%$post->t_alamat_lengkap%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridPenutupanData(PendaftaranBase $base, $offset, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array('t_idwp', 't_npwpd', 't_nama', 't_alamat_lengkap', 't_tgldaftar', 's_nama'));
        $where = new Where();
		$where->literal("t_status_wp = 'true'");
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("t_tgldaftar between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_alamat_lengkap != '')
            $where->literal("t_alamat_lengkap ILIKE '%$post->t_alamat_lengkap%'");
        $select->where($where);
        $select->order("t_tgldaftar desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
	
	public function getGridTidakaktifCount(PendaftaranBase $base, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array('t_idwp'));
        $where = new Where();
		$where->literal("t_status_wp = 'false'");
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("t_tgldaftar between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_alamat_lengkap != '')
            $where->literal("t_alamat_lengkap ILIKE '%$post->t_alamat_lengkap%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridTidakaktifData(PendaftaranBase $base, $offset, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->columns(array('t_idwp', 't_npwpd', 't_nama', 't_alamat_lengkap', 't_tgldaftar', 's_nama'));
        $where = new Where();
		$where->literal("t_status_wp = 'false'");
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("t_tgldaftar between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_npwpd ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_nama ILIKE '%$post->t_nama%'");
        if ($post->t_alamat_lengkap != '')
            $where->literal("t_alamat_lengkap ILIKE '%$post->t_alamat_lengkap%'");
        $select->where($where);
        $select->order("t_tgldaftar desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
	
	public function getGridTidakaktifOpCount(PendaftaranBase $base, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek"
        ));
        $select->columns(array('t_idobjek'));
        $where = new Where();
		$where->literal("t_statusobjek = 'false'");
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("t_tgldaftarobjek between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_nop ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_namaobjek ILIKE '%$post->t_nama%'");
        if ($post->t_alamat_lengkap != '')
            $where->literal("t_alamatlengkapobjek ILIKE '%$post->t_alamat_lengkap%'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridTidakaktifOpData(PendaftaranBase $base, $offset, $post) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wpobjek"
        ));
        $select->columns(array('t_idobjek', 't_nop', 't_npwpdwp', 't_namaobjek', 't_alamatlengkapobjek','t_namawp', 't_tgldaftarobjek', 's_namajenis'));
        $where = new Where();
		$where->literal("t_statusobjek = 'false'");
        if ($post->t_tgldaftar != '') {
            $t_tgl = explode(' - ', $post->t_tgldaftar);
            $where->literal("t_tgldaftarobjek between '" . date('Y-m-d', strtotime($t_tgl[0])) . "' and '" . date('Y-m-d', strtotime($t_tgl[1])) . "'");
        }
        if ($post->t_npwpd != '')
            $where->literal("t_nop ILIKE '%$post->t_npwpd%'");
        if ($post->t_nama != '')
            $where->literal("t_namaobjek ILIKE '%$post->t_nama%'");
        if ($post->t_alamat_lengkap != '')
            $where->literal("t_alamatlengkapobjek ILIKE '%$post->t_alamat_lengkap%'");
        if ($post->t_jenis != '')
            $where->literal("s_namajenis ILIKE '%$post->t_jenis%'");
        
        $select->where($where);
        $select->order("t_tgldaftarobjek desc");
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }
	
	
}
