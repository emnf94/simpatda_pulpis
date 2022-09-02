<?php

namespace Pajak\Model\Pembukuan;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class PembukuanTable extends AbstractTableGateway {

    protected $table = 't_transaksi';

    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new \Pajak\Model\Penagihan\PenagihanBase());
        $this->initialize();
    }

    public function getDataPembukuanID($t_idtransaksi) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "t_namaobjek", "t_alamatobjek", "s_namakecobjek" => "s_namakec", "s_namakelobjek" => "s_namakel", "t_kabupatenobjek"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_idtransaksi", "t_tglpendataan", "t_jmlhpajak", "t_nourut", "t_tgljatuhtempo"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
                ), "d.s_idkorek = c.t_idkorek", array(
            "korek", "s_namakorek", "s_persentarifkorek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('c.t_idtransaksi', (int) $t_idtransaksi);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getdataWpbyId($t_idwp) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $where = new Where();
        $where->equalTo('a.t_idwp', $t_idwp);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

    public function getdataWpObjekbyId($t_idwp) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_idobjek", "t_nop", "t_namaobjek", "s_namajenis"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('b.t_idwp', $t_idwp);
        $select->where($where);
        $select->order('s_idjenis asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataBukuWP($t_periodepajak, $t_idwpobjek, $month) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $select->columns(array(
            't_nourut',
            't_tglpendataan', 't_jmlhpajak', 't_tgljatuhtempo', 't_jmlhpembayaran',
            't_tglpembayaran', 't_jmlhdendapembayaran', 't_tgldendapembayaran',
            't_jmlhbayardenda', 't_tglbayardenda', 't_jmlhbulandendapembayaran'
        ));
        $where = new Where();
        $where->equalTo('t_idwpobjek', $t_idwpobjek);
        $where->literal("extract(month from t_masaawal) ='" . str_pad($month, 2, '0', STR_PAD_LEFT) . "' and extract(year from t_masaawal) ='" . $t_periodepajak . "'");
        // $where->literal("extract(month from t_tglpendataan) ='" . str_pad($month, 2, '0', STR_PAD_LEFT) . "' and extract(year from t_tglpendataan) ='" . $t_periodepajak . "'");
        $select->where($where);
        $select->order('t_idtransaksi asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->current();
        return $res;
    }

	public function getDataBukuWPreklame($t_periodepajak, $t_idwpobjek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("t_transaksi");
        $select->columns(array(
            't_nourut', 't_nopenetapan', 't_tglpenetapan',
            't_tglpendataan', 't_jmlhpajak', 't_tgljatuhtempo', 't_jmlhpembayaran',
            't_tglpembayaran', 't_jmlhdendapembayaran', 't_tgldendapembayaran',
            't_jmlhbayardenda', 't_tglbayardenda', 't_jmlhbulandendapembayaran'
        ));
        $where = new Where();
        $where->equalTo('t_idwpobjek', $t_idwpobjek);
        $where->literal("extract(year from t_tglpenetapan) ='" . $t_periodepajak . "'");
        $select->where($where);
        $select->order('t_idtransaksi asc');
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getDataBelumbayar($t_periodepajak, $t_idwpobjek) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(["a" => "t_transaksi"]);
        $select->join(array(
            "b" => "s_jenisobjek"
                ), "a.t_jenispajak = b.s_idjenis", array("s_namajenis"), $select::JOIN_LEFT);
        $where = new Where();
        $where->equalTo('a.t_idwpobjek', $t_idwpobjek);
        $where->literal("a.t_periodepajak <= '" . $t_periodepajak . "' ");
        $where->isNull("a.t_tglpembayaran");
        $select->where($where);
        $select->order('a.t_periodepajak, a.t_masaawal asc');
        // $select->order('a.t_tglpendataan asc');
        // $select->order('t_idtransaksi asc');
        // echo $select->getSqlstring(); exit();
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataRealisasi____($tgl, $idrealisasi) {
        $tglreal = explode("-", $tgl);
        $bulan = date('m', strtotime($tgl));
        $tahun = date('Y', strtotime($tgl));

        $sql = "SELECT
	C .korek,
	C .s_namakorek,
	C .s_rinciankorek,
	(
		SELECT
			CASE
                WHEN C .s_kelompokkorek = '' THEN
                (
                    SELECT
					SUM (s_targetjumlah)
				FROM
					s_targetdetail d
				LEFT JOIN s_target e ON e.s_idtarget = d.s_idtargetheader
				LEFT JOIN view_rekening f ON f.s_idkorek = d.s_targetrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek

				AND e.s_idtarget = $idrealisasi
				AND d.s_idtargetheader = $idrealisasi
                )
                WHEN C .s_jeniskorek = '' THEN
                (
                    SELECT
					SUM (s_targetjumlah)
				FROM
					s_targetdetail d
				LEFT JOIN s_target e ON e.s_idtarget = d.s_idtargetheader
				LEFT JOIN view_rekening f ON f.s_idkorek = d.s_targetrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek

				AND e.s_idtarget = $idrealisasi
				AND d.s_idtargetheader = $idrealisasi
                )
                WHEN C .s_objekkorek = '' THEN
                (
                    SELECT
					SUM (s_targetjumlah)
				FROM
					s_targetdetail d
				LEFT JOIN s_target e ON e.s_idtarget = d.s_idtargetheader
				LEFT JOIN view_rekening f ON f.s_idkorek = d.s_targetrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek

				AND e.s_idtarget = $idrealisasi
				AND d.s_idtargetheader = $idrealisasi
                )
		WHEN C .s_rinciankorek = '00' THEN
			(
				SELECT
					SUM (s_targetjumlah)
				FROM
					s_targetdetail d
				LEFT JOIN s_target e ON e.s_idtarget = d.s_idtargetheader
				LEFT JOIN view_rekening f ON f.s_idkorek = d.s_targetrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek
				AND f.s_objekkorek = C .s_objekkorek
				AND e.s_idtarget = $idrealisasi
				AND d.s_idtargetheader = $idrealisasi
			)
		ELSE
			(
				SELECT
					s_targetjumlah
				FROM
					s_targetdetail d
				LEFT JOIN s_target e ON e.s_idtarget = d.s_idtargetheader
				WHERE
					d.s_targetrekening = C .s_idkorek
				AND e.s_idtarget=$idrealisasi and d.s_idtargetheader=$idrealisasi
			)
		END AS jml
	) AS targetjumlah,
	(
		SELECT
			CASE
                WHEN C.s_kelompokkorek = '' THEN
                (
                    SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek
				WHERE
					f.s_tipekorek = C .s_tipekorek

				AND EXTRACT (MONTH FROM A .t_tglpembayaran) < '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
                )+(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek

				AND EXTRACT (MONTH FROM A .t_tglsetor) < '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
                WHEN C .s_jeniskorek = '' THEN
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek

				AND EXTRACT (MONTH FROM A .t_tglpembayaran) < '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek

				AND EXTRACT (MONTH FROM A .t_tglsetor) < '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
                 WHEN C .s_objekkorek = '' THEN
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek

				AND EXTRACT (MONTH FROM A .t_tglpembayaran) < '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek

				AND EXTRACT (MONTH FROM A .t_tglsetor) < '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
		WHEN C .s_rinciankorek = '00' THEN
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek OR f.s_jenisobjek = A .t_jenispajak
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek
				AND f.s_objekkorek = C .s_objekkorek
				AND EXTRACT (MONTH FROM A .t_tglpembayaran) < '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek
				AND f.s_objekkorek = C .s_objekkorek
				AND EXTRACT (MONTH FROM A .t_tglsetor) < '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
                        WHEN c.s_tipekorek||c.s_kelompokkorek||c.s_jeniskorek||c.s_objekkorek='41407' THEN
                (
                    SELECT
					coalesce(SUM (t_jmlhbayardenda),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A.t_idkorekdenda
				WHERE
					f.s_idkorek = C.s_idkorek

				AND extract(month from A.t_tglbayardenda) < '" . $bulan . "'
                                    AND extract(year from A.t_tglbayardenda) = '" . $tahun . "'
                ) + (
                SELECT
					coalesce(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A.t_idrekening
				WHERE
					f.s_idkorek = C.s_idkorek

				AND extract(month from A.t_tglsetor) < '" . $bulan . "'
                                    AND extract(year from A.t_tglsetor) = '" . $tahun . "'
                                        AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
                )
		ELSE
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				WHERE
					C .s_idkorek = A .t_idkorek
				AND EXTRACT (MONTH FROM A .t_tglpembayaran) < '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				WHERE
					C .s_idkorek = A .t_idrekening
				AND EXTRACT (MONTH FROM A .t_tglsetor) < '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
		END AS jml
	) AS real_bulanlalu,
	(
		SELECT
			CASE
                WHEN C.s_kelompokkorek = '' THEN
                (
                    SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek
				WHERE
					f.s_tipekorek = C .s_tipekorek

				AND EXTRACT (MONTH FROM A .t_tglpembayaran) = '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
                )+(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek

				AND EXTRACT (MONTH FROM A .t_tglsetor) = '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
                WHEN C .s_jeniskorek = '' THEN
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek

				AND EXTRACT (MONTH FROM A .t_tglpembayaran) = '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek

				AND EXTRACT (MONTH FROM A .t_tglsetor) = '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
                WHEN C .s_objekkorek = '' THEN
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek

				AND EXTRACT (MONTH FROM A .t_tglpembayaran) = '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek

				AND EXTRACT (MONTH FROM A .t_tglsetor) = '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
		WHEN C .s_rinciankorek = '00' THEN
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek OR f.s_jenisobjek = A .t_jenispajak
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek
				AND f.s_objekkorek = C .s_objekkorek
				AND EXTRACT (MONTH FROM A .t_tglpembayaran) = '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek
				AND f.s_objekkorek = C .s_objekkorek
				AND EXTRACT (MONTH FROM A .t_tglsetor) = '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
                        WHEN c.s_tipekorek||c.s_kelompokkorek||c.s_jeniskorek||c.s_objekkorek='41408' THEN
                (
                    SELECT
					coalesce(SUM (t_jmlhbayardenda),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A.t_idkorekdenda
				WHERE
					f.s_idkorek = C.s_idkorek

				AND extract(month from A.t_tglbayardenda) = '" . $bulan . "'
                                    AND extract(year from A.t_tglbayardenda) = '" . $tahun . "'
                ) + (
                SELECT
					coalesce(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A.t_idrekening
				WHERE
					f.s_idkorek = C.s_idkorek

				AND extract(month from A.t_tglsetor) = '" . $bulan . "'
                                    AND extract(year from A.t_tglsetor) = '" . $tahun . "'
                                        AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
                )
		ELSE
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				WHERE
					C .s_idkorek = A .t_idkorek
				AND EXTRACT (MONTH FROM A .t_tglpembayaran) = '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				WHERE
					C .s_idkorek = A .t_idrekening
				AND EXTRACT (MONTH FROM A .t_tglsetor) = '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
		END AS jml
	) AS real_bulanini,
	(
		SELECT
			CASE
                WHEN C .s_kelompokkorek = '' THEN
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek
				WHERE
					f.s_tipekorek = C .s_tipekorek

				AND EXTRACT (MONTH FROM A .t_tglpembayaran) <= '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek

				AND EXTRACT (MONTH FROM A .t_tglsetor) <= '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
                WHEN C .s_jeniskorek = '' THEN
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek

				AND EXTRACT (MONTH FROM A .t_tglpembayaran) <= '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek

				AND EXTRACT (MONTH FROM A .t_tglsetor) <= '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
                WHEN C .s_objekkorek = '' THEN
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek

				AND EXTRACT (MONTH FROM A .t_tglpembayaran) <= '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek

				AND EXTRACT (MONTH FROM A .t_tglsetor) <= '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
		WHEN C .s_rinciankorek = '00' THEN
			(
				SELECT
					COALESCE(SUM (t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idkorek OR f.s_jenisobjek = A .t_jenispajak
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek
				AND f.s_objekkorek = C .s_objekkorek
				AND EXTRACT (MONTH FROM A .t_tglpembayaran) <= '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A .t_idrekening
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek
				AND f.s_objekkorek = C .s_objekkorek
				AND EXTRACT (MONTH FROM A .t_tglsetor) <= '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
                        WHEN c.s_tipekorek||c.s_kelompokkorek||c.s_jeniskorek||c.s_objekkorek='41407' THEN
                (
                    SELECT
					coalesce(SUM (t_jmlhbayardenda),0)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A.t_idkorekdenda
				WHERE
					f.s_idkorek = C.s_idkorek

				AND extract(month from A.t_tglbayardenda) <= '" . $bulan . "'
                                    AND extract(year from A.t_tglbayardenda) = '" . $tahun . "'
                ) + (
                SELECT
					coalesce(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				LEFT JOIN view_rekening f ON f.s_idkorek = A.t_idrekening
				WHERE
					f.s_idkorek = C.s_idkorek

				AND extract(month from A.t_tglsetor) <= '" . $bulan . "'
                                    AND extract(year from A.t_tglsetor) = '" . $tahun . "'
                                        AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
                )
		ELSE
			(
				SELECT
					COALESCE(SUM (A.t_jmlhpembayaran),0)
				FROM
					t_transaksi A
				WHERE
					C .s_idkorek = A .t_idkorek
				AND EXTRACT (MONTH FROM A .t_tglpembayaran) <= '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglpembayaran) = '" . $tahun . "'
			)
+
(
				SELECT
					COALESCE(SUM (t_jumlahsetor),0)
				FROM
					t_setoranlain A
				WHERE
					C .s_idkorek = A .t_idrekening
				AND EXTRACT (MONTH FROM A .t_tglsetor) <= '" . $bulan . "'
				AND EXTRACT (YEAR FROM A .t_tglsetor) = '" . $tahun . "'
				AND A.t_viasetor = '1'
				AND A.t_issetorandeleted = 0
			)
		END AS jml
	) AS real_sdbulanini
FROM
	view_rekening C
ORDER BY
	C .korek";
       // die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        // var_dump($res);die;
        return $res;
    }

    public function getdataKasHarian($tgl, $idrealisasi) {
        $tglreal = explode("-", $tgl);
        $tgl_db = date('Y-m-d', strtotime($tgl));
        $tgl_dby = date('Y-m-d', strtotime($tgl . '- 1 day'));
        $sql = "SELECT
	C.korek,
	C.s_namakorek,
	C.s_rinciankorek,
	(
		SELECT
			CASE
		WHEN C.s_rinciankorek = '00' THEN
			(
				SELECT
					SUM (s_targetjumlah)
				FROM
					s_targetdetail d
				LEFT JOIN s_target e ON e.s_idtarget = d.s_idtargetheader
				LEFT JOIN view_rekening f ON f.s_idkorek = d.s_targetrekening
				WHERE
					f.s_tipekorek = C.s_tipekorek
				AND f.s_kelompokkorek = C.s_kelompokkorek
				AND f.s_jeniskorek = C.s_jeniskorek
				AND f.s_objekkorek = C.s_objekkorek
				AND e.s_tahuntarget = '" . $tglreal[2] . "'
				AND d.s_idtargetheader = " . $idrealisasi . "
			)
		ELSE
			(
				SELECT
					s_targetjumlah
				FROM
					s_targetdetail d
				LEFT JOIN s_target e ON e.s_idtarget = d.s_idtargetheader
				WHERE
					d.s_targetrekening = C .s_idkorek
				AND e.s_tahuntarget = '" . $tglreal[2] . "' and d.s_idtargetheader=" . $idrealisasi . "
			)
		END AS jml
	) AS targetjumlah,
	(
		SELECT
			CASE
		WHEN C.s_rinciankorek = '00' THEN
			(
				SELECT
					SUM (t_jmlhpembayaran)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A.t_idkorek
				WHERE
					f.s_tipekorek = C.s_tipekorek
				AND f.s_kelompokkorek = C.s_kelompokkorek
				AND f.s_jeniskorek = C.s_jeniskorek
				AND f.s_objekkorek = C.s_objekkorek
				AND A.t_tglpembayaran <= '" . $tgl_dby . "'
			)
                WHEN c.s_tipekorek||c.s_kelompokkorek||c.s_jeniskorek||c.s_objekkorek='41407' THEN
                (
                    SELECT
					SUM (t_jmlhbayardenda)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A.t_idkorekdenda
				WHERE
					f.s_idkorek = C.s_idkorek

				AND A.t_tglbayardenda <= '" . $tgl_dby . "'
                )
		ELSE
			(
				SELECT
					SUM (t_jmlhpembayaran)
				FROM
					t_transaksi A
				WHERE
					C.s_idkorek = A.t_idkorek
				AND A.t_tglpembayaran <= '" . $tgl_dby . "'
			)
		END AS jml
	) AS real_sdharilalu,
	(
		SELECT
			CASE
		WHEN C.s_rinciankorek = '00' THEN
			(
				SELECT
					SUM (t_jmlhpembayaran)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A.t_idkorek
				WHERE
					f.s_tipekorek = C.s_tipekorek
				AND f.s_kelompokkorek = C.s_kelompokkorek
				AND f.s_jeniskorek = C.s_jeniskorek
				AND f.s_objekkorek = C.s_objekkorek
				AND A.t_tglpembayaran = '" . $tgl_db . "'
			)
                        WHEN c.s_tipekorek||c.s_kelompokkorek||c.s_jeniskorek||c.s_objekkorek='41407' THEN
                (
                    SELECT
					SUM (t_jmlhbayardenda)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A.t_idkorekdenda
				WHERE
					f.s_idkorek = C.s_idkorek
				AND A.t_tglbayardenda = '" . $tgl_db . "'
                )
		ELSE
			(
				SELECT
					SUM (t_jmlhpembayaran)
				FROM
					t_transaksi A
				WHERE
					C.s_idkorek = A.t_idkorek
				AND A.t_tglpembayaran = '" . $tgl_db . "'
			)
		END AS jml
	) AS real_hariini,
	(
		SELECT
			CASE
		WHEN C.s_rinciankorek = '00' THEN
			(
				SELECT
					SUM (t_jmlhpembayaran)
				FROM
					t_transaksi a
				LEFT JOIN view_rekening f ON f.s_idkorek = a.t_idkorek
				WHERE
					f.s_tipekorek = C.s_tipekorek
				AND f.s_kelompokkorek = C.s_kelompokkorek
				AND f.s_jeniskorek = C.s_jeniskorek
				AND f.s_objekkorek = C.s_objekkorek
				AND a.t_tglpembayaran <= '" . $tgl_db . "'
			)
                WHEN c.s_tipekorek||c.s_kelompokkorek||c.s_jeniskorek||c.s_objekkorek='41407' THEN
                (
                    SELECT
					SUM (t_jmlhbayardenda)
				FROM
					t_transaksi A
				LEFT JOIN view_rekening f ON f.s_idkorek = A.t_idkorekdenda
				WHERE
					f.s_idkorek = C.s_idkorek
				AND A.t_tglbayardenda <= '" . $tgl_db . "'
                )
		ELSE
			(
				SELECT
					SUM (t_jmlhpembayaran)
				FROM
					t_transaksi A
				WHERE
					C .s_idkorek = A .t_idkorek
				AND A .t_tglpembayaran <= '" . $tgl_db . "'
			)
		END AS jml
	) AS real_sdhariini,
	(SELECT
			CASE
		WHEN C .s_rinciankorek = '00' THEN
			(
				SELECT
					SUM (t_jmlhsbd)
				FROM
					t_setorbankdetail a
				LEFT JOIN t_setorbankheader b ON b.t_idsbh=a.t_idsbh
				LEFT JOIN view_rekening f ON f.s_idkorek = a.t_idkoreksbd
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek
				AND f.s_objekkorek = C .s_objekkorek
				AND b.t_tglsbh <= '" . $tgl_dby . "'
                                AND b.t_issbhdeleted = 0
			)
		ELSE
			(
				SELECT
					SUM (t_jmlhsbd)
				FROM
					t_setorbankdetail A
					LEFT JOIN t_setorbankheader B ON B.t_idsbh=A.t_idsbh
				WHERE
					C .s_idkorek = A .t_idkoreksbd
				AND B.t_tglsbh <= '" . $tgl_dby . "'
                                AND b.t_issbhdeleted = 0
			)
		END AS jml
	) AS pengeluaran_sdharilalu,
(SELECT
			CASE
		WHEN C .s_rinciankorek = '00' THEN
			(
				SELECT
					SUM (t_jmlhsbd)
				FROM
					t_setorbankdetail a
				LEFT JOIN t_setorbankheader b ON b.t_idsbh=a.t_idsbh
				LEFT JOIN view_rekening f ON f.s_idkorek = a.t_idkoreksbd
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek
				AND f.s_objekkorek = C .s_objekkorek
				AND b.t_tglsbh = '" . $tgl_db . "'
                                AND b.t_issbhdeleted = 0
			)
		ELSE
			(
				SELECT
					SUM (t_jmlhsbd)
				FROM
					t_setorbankdetail A
					LEFT JOIN t_setorbankheader B ON B.t_idsbh=A.t_idsbh
				WHERE
					C .s_idkorek = A .t_idkoreksbd
				AND B.t_tglsbh = '" . $tgl_db . "'
                                AND b.t_issbhdeleted = 0
			)
		END AS jml
	) AS pengeluaran_hariini,
(SELECT
			CASE
		WHEN C .s_rinciankorek = '00' THEN
			(
				SELECT
					SUM (t_jmlhsbd)
				FROM
					t_setorbankdetail a
				LEFT JOIN t_setorbankheader b ON b.t_idsbh=a.t_idsbh
				LEFT JOIN view_rekening f ON f.s_idkorek = a.t_idkoreksbd
				WHERE
					f.s_tipekorek = C .s_tipekorek
				AND f.s_kelompokkorek = C .s_kelompokkorek
				AND f.s_jeniskorek = C .s_jeniskorek
				AND f.s_objekkorek = C .s_objekkorek
				AND b.t_tglsbh <= '" . $tgl_db . "'
                                AND b.t_issbhdeleted = 0
			)
		ELSE
			(
				SELECT
					SUM (t_jmlhsbd)
				FROM
					t_setorbankdetail A
					LEFT JOIN t_setorbankheader B ON B.t_idsbh=A.t_idsbh
				WHERE
					C.s_idkorek = A.t_idkoreksbd
				AND B.t_tglsbh <= '" . $tgl_db . "'
                                AND b.t_issbhdeleted = 0
			)
		END AS jml
	) AS pengeluaran_sdhariini
FROM
	view_rekening C
ORDER BY
	C.korek";
//        die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getdataBKU__($bulan, $tahun) {
        $sql = "SELECT * FROM ((
	SELECT
		t0.t_tglpembayaran AS tglbayar,
		t0.t_jmlhpembayaran AS pembayaran,
		0 AS penyetoran,
		t_rek.korek,
		t_rek.s_namakorek
	FROM
		t_transaksi t0
	LEFT JOIN view_rekening t_rek ON t_rek.s_idkorek = t0.t_idkorek
	WHERE
		t0.t_tglpembayaran IS NOT NULL
		AND t0.t_viapembayaran = 1
	ORDER BY t0.t_tglpembayaran, t_rek.korek
)
UNION
	(
		SELECT
			t0.t_tglbayardenda AS tglbayar,
			t0.t_jmlhbayardenda AS pembayaran,
			0 AS penyetoran,
			t_rekdenda.korek,
			t_rekdenda.s_namakorek
		FROM
			t_transaksi t0
		LEFT JOIN view_rekening t_rekdenda ON t_rekdenda.s_idkorek = t0.t_idkorekdenda
		WHERE
			t0.t_tglbayardenda IS NOT NULL
			AND t0.t_viapembayarandenda = 1
		ORDER BY t0.t_tglbayardenda, t_rekdenda.korek
	)
UNION
(
SELECT
bb.t_tglsbh AS tglbayar,
0 AS pembayaran,
sum(aa.t_jmlhsbd) AS penyetoran,
t_rek.korek,
'SETOR '||t_rek.s_namakorek
FROM t_setorbankdetail aa
LEFT JOIN t_setorbankheader bb ON aa.t_idsbh=bb.t_idsbh
LEFT JOIN view_rekening t_rek ON t_rek.s_idkorek=aa.t_idkoreksbd
WHERE bb.t_issbhdeleted = 0
GROUP BY bb.t_tglsbh, t_rek.korek, t_rek.s_namakorek
ORDER BY bb.t_tglsbh, t_rek.korek
)) AS bku WHERE extract(month from tglbayar)::int = " . $bulan . " AND extract(year from tglbayar)='" . $tahun . "' ORDER BY tglbayar";
//        die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getdataBKU($bulan, $tahun) {
        $sql = "SELECT * FROM ((
		SELECT
			t0.t_tglpembayaran AS tglbayar,
			t0.t_jmlhpembayaran AS pembayaran,
			t0.t_jmlhpembayaran AS penyetoran,
			t_rek.korek,
			t_rek.s_namakorek
		FROM
			t_transaksi t0
		LEFT JOIN view_rekening t_rek ON t_rek.s_idkorek = t0.t_idkorek
		WHERE
			t0.t_tglpembayaran IS NOT NULL
			AND t0.t_viapembayaran = 2
		ORDER BY t0.t_tglpembayaran, t_rek.korek
		)

		UNION
			(
				SELECT
					t0.t_tglsetor AS tglbayar,
					t0.t_jumlahsetor AS pembayaran,
					t0.t_jumlahsetor AS penyetoran,
					t_rek.korek,
					t_rek.s_namakorek
				FROM t_setoranlain t0
				LEFT JOIN view_rekening t_rek ON t_rek.s_idkorek = t0.t_idrekening
				WHERE t0.t_tglsetor IS NOT NULL
					AND t0.t_issetorandeleted = 0
					ORDER BY t0.t_tglsetor, t_rek.korek
			)

		UNION
			(
				SELECT
					t0.t_tglbayardenda AS tglbayar,
					t0.t_jmlhbayardenda AS pembayaran,
					t0.t_jmlhbayardenda AS penyetoran,
					t_rekdenda.korek,
					t_rekdenda.s_namakorek
				FROM
					t_transaksi t0
				LEFT JOIN view_rekening t_rekdenda ON t_rekdenda.s_idkorek = t0.t_idkorekdenda
				WHERE
					t0.t_tglbayardenda IS NOT NULL
					AND t0.t_viapembayarandenda = 2
				ORDER BY t0.t_tglbayardenda, t_rekdenda.korek
			)

		UNION
		(
		SELECT
		bb.t_tglsbh AS tglbayar,
		0 AS pembayaran,
		sum(aa.t_jmlhsbd) AS penyetoran,
		t_rek.korek,
		'SETOR '||t_rek.s_namakorek
		FROM t_setorbankdetail aa
		LEFT JOIN t_setorbankheader bb ON aa.t_idsbh=bb.t_idsbh
		LEFT JOIN view_rekening t_rek ON t_rek.s_idkorek=aa.t_idkoreksbd
		WHERE bb.t_issbhdeleted = 0
		GROUP BY bb.t_tglsbh, t_rek.korek, t_rek.s_namakorek
		ORDER BY bb.t_tglsbh, t_rek.korek
		)) AS bku WHERE pembayaran <> 0 and penyetoran <> 0 and extract(month from tglbayar)::int = " . $bulan . " AND extract(year from tglbayar)='" . $tahun . "' ORDER BY tglbayar, korek";
       // die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }
    public function getdataBKU___($bulan, $tahun) {
        $sql = "SELECT * FROM ((
	SELECT
		t0.t_tglpembayaran AS tglbayar,
		t0.t_jmlhpembayaran AS pembayaran,
		t0.t_jmlhpembayaran AS penyetoran,
		t_rek.korek,
		t_rek.s_namakorek
	FROM
		t_transaksi t0
	LEFT JOIN view_rekening t_rek ON t_rek.s_idkorek = t0.t_idkorek
	WHERE
		t0.t_tglpembayaran IS NOT NULL
		AND t0.t_viapembayaran = 2
	ORDER BY t0.t_tglpembayaran
)
UNION
	(
		SELECT
			t0.t_tglbayardenda AS tglbayar,
			t0.t_jmlhbayardenda AS pembayaran,
			t0.t_jmlhbayardenda AS penyetoran,
			t_rekdenda.korek,
			t_rekdenda.s_namakorek
		FROM
			t_transaksi t0
		LEFT JOIN view_rekening t_rekdenda ON t_rekdenda.s_idkorek = t0.t_idkorekdenda
		WHERE
			t0.t_tglbayardenda IS NOT NULL
			AND t0.t_viapembayarandenda = 2
		ORDER BY t0.t_tglbayardenda, t_rekdenda.korek
	)
UNION
(
SELECT
bb.t_tglsbh AS tglbayar,
0 AS pembayaran,
sum(aa.t_jmlhsbd) AS penyetoran,
t_rek.korek,
'SETOR '||t_rek.s_namakorek
FROM t_setorbankdetail aa
LEFT JOIN t_setorbankheader bb ON aa.t_idsbh=bb.t_idsbh
LEFT JOIN view_rekening t_rek ON t_rek.s_idkorek=aa.t_idkoreksbd
WHERE bb.t_issbhdeleted = 0
GROUP BY bb.t_tglsbh, t_rek.korek, t_rek.s_namakorek
ORDER BY bb.t_tglsbh, t_rek.korek
)) AS bku WHERE pembayaran <> 0 and penyetoran <> 0 and extract(month from tglbayar)::int = " . $bulan . " AND extract(year from tglbayar)='" . $tahun . "' ORDER BY tglbayar";
//        die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getdataBKUTotal($bulan, $tahun) {
		$sql = "SELECT * FROM ((
		SELECT
			t0.t_tglpembayaran AS tglbayar,
			t0.t_jmlhpembayaran AS pembayaran,
			t0.t_jmlhpembayaran AS penyetoran,
			t_rek.korek,
			t_rek.s_namakorek
		FROM
			t_transaksi t0
		LEFT JOIN view_rekening t_rek ON t_rek.s_idkorek = t0.t_idkorek
		WHERE
			t0.t_tglpembayaran IS NOT NULL
			AND t0.t_viapembayaran = 2
		ORDER BY t0.t_tglpembayaran, t_rek.korek
		)

		UNION
			(
				SELECT
					t0.t_tglsetor AS tglbayar,
					t0.t_jumlahsetor AS pembayaran,
					t0.t_jumlahsetor AS penyetoran,
					t_rek.korek,
					t_rek.s_namakorek
				FROM t_setoranlain t0
				LEFT JOIN view_rekening t_rek ON t_rek.s_idkorek = t0.t_idrekening
				WHERE t0.t_tglsetor IS NOT NULL
					AND t0.t_issetorandeleted = 0
					ORDER BY t0.t_tglsetor, t_rek.korek
			)

		UNION
			(
				SELECT
					t0.t_tglbayardenda AS tglbayar,
					t0.t_jmlhbayardenda AS pembayaran,
					t0.t_jmlhbayardenda AS penyetoran,
					t_rekdenda.korek,
					t_rekdenda.s_namakorek
				FROM
					t_transaksi t0
				LEFT JOIN view_rekening t_rekdenda ON t_rekdenda.s_idkorek = t0.t_idkorekdenda
				WHERE
					t0.t_tglbayardenda IS NOT NULL
					AND t0.t_viapembayarandenda = 2
				ORDER BY t0.t_tglbayardenda, t_rekdenda.korek
			)

		UNION
		(
		SELECT
		bb.t_tglsbh AS tglbayar,
		0 AS pembayaran,
		sum(aa.t_jmlhsbd) AS penyetoran,
		t_rek.korek,
		'SETOR '||t_rek.s_namakorek
		FROM t_setorbankdetail aa
		LEFT JOIN t_setorbankheader bb ON aa.t_idsbh=bb.t_idsbh
		LEFT JOIN view_rekening t_rek ON t_rek.s_idkorek=aa.t_idkoreksbd
		WHERE bb.t_issbhdeleted = 0
		GROUP BY bb.t_tglsbh, t_rek.korek, t_rek.s_namakorek
		ORDER BY bb.t_tglsbh, t_rek.korek
		)) AS bku WHERE pembayaran <> 0 and penyetoran <> 0 and extract(month from tglbayar)::int < " . $bulan . " AND extract(year from tglbayar)='" . $tahun . "' ORDER BY tglbayar, korek";
        // $sql = "select
			// (
			// select sum(t0.t_jmlhpembayaran) FROM t_transaksi t0
			// where extract(month from t0.t_tglpembayaran)::int < " . $bulan . "
			// and extract(year from t0.t_tglpembayaran) = '" . $tahun . "'
			// ) as total_sdbulanlalu,
			// (
			// select sum(t0.t_jmlhpembayaran) FROM t_transaksi t0
			// where extract(month from t0.t_tglpembayaran)::int <= " . $bulan . "
			// and extract(year from t0.t_tglpembayaran) = '" . $tahun . "'
			// ) as total_sdbulanini,
			// (
			// select sum(t0.t_jmlhpembayaran) FROM t_transaksi t0
			// where extract(month from t0.t_tglpembayaran)::int < " . $bulan . "
			// and extract(year from t0.t_tglpembayaran) = '" . $tahun . "'
			// ) as total_setor_sdbulanlalu,
			// (
			// select sum(t0.t_jmlhpembayaran) FROM t_transaksi t0
			// where extract(month from t0.t_tglpembayaran)::int <= " . $bulan . "
			// and extract(year from t0.t_tglpembayaran) = '" . $tahun . "'
			// ) as total_setor_sdbulanini";
//        die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
		// $res = $statement->execute()->current();
        return $res;
    }

    public function getdataBKUTotal__($bulan, $tahun) {
        $sql = "select
			(
			select sum(t0.t_jmlhpembayaran) FROM t_transaksi t0
			where extract(month from t0.t_tglpembayaran)::int < " . $bulan . "
			and extract(year from t0.t_tglpembayaran) = '" . $tahun . "'
			) as total_sdbulanlalu,
			(
			select sum(t0.t_jmlhpembayaran) FROM t_transaksi t0
			where extract(month from t0.t_tglpembayaran)::int <= " . $bulan . "
			and extract(year from t0.t_tglpembayaran) = '" . $tahun . "'
			) as total_sdbulanini,
			(
			select sum(t0.t_jmlhsbd) from t_setorbankdetail t0
			LEFT JOIN t_setorbankheader t1 ON t0.t_idsbh=t1.t_idsbh
			where extract(month from t1.t_tglsbh)::int < " . $bulan . " AND extract(year from t1.t_tglsbh) = '" . $tahun . "'
			) as total_setor_sdbulanlalu,
			(
			select sum(t0.t_jmlhsbd) from t_setorbankdetail t0
			LEFT JOIN t_setorbankheader t1 ON t0.t_idsbh=t1.t_idsbh
			where extract(month from t1.t_tglsbh)::int <= " . $bulan . " AND extract(year from t1.t_tglsbh) = '" . $tahun . "'
			) as total_setor_sdbulanini";
//        die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->current();
        return $res;
    }

    public function getdataBpps__($tgl1, $tgl2, $viabayar) {
        $tgl1 = date('Y-m-d', strtotime($tgl1));
        $tgl2 = date('Y-m-d', strtotime($tgl2));
        if ($viabayar != NULL):
            $whereviabayar = " and t0.t_viapembayaran::text='$viabayar' ";
        endif;
        $sql = "select (select aa.s_namakorek from view_rekening aa where aa.s_jenisobjek=t1.s_jenisobjek and aa.s_rinciankorek='00' ) korek_parent,
            t1.s_namakorek korek_child, t_nopembayaran, t2.t_namaobjek, t3.t_npwpd,
            t0.t_jmlhpembayaran, t1.s_jenisobjek, t0.t_kodebayar from t_transaksi t0
left join view_rekening t1 ON t1.s_idkorek=t0.t_idkorek
left join view_wpobjek t2 ON t2.t_idobjek=t0.t_idwpobjek
left join view_wp t3 ON t3.t_idwp=t2.t_idwp
where t_jmlhpembayaran != 0 and t_tglpembayaran between '" . $tgl1 . "' and '" . $tgl2 . "' " . $whereviabayar . "
order by t0.t_kodebayar, t1.s_tipekorek, t1.s_kelompokkorek, t1.s_jeniskorek, t1.s_objekkorek, t1.s_rinciankorek";
//        die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getdataBpps($tgl1, $tgl2, $viabayar) {
        $tgl1 = date('Y-m-d', strtotime($tgl1));
        $tgl2 = date('Y-m-d', strtotime($tgl2));
        if ($viabayar != NULL):
            $whereviabayar1 = " and t_viapembayaran::text='$viabayar' ";
            $whereviabayar2 = " and t_viasetor::text='$viabayar' ";
        endif;
        $sql =
        "
        (SELECT t_jmlhpembayaran as t_jmlhpembayaran, t_namaobjek as t_namaobjek, t_jmlhbayardenda as t_jmlhbayardenda, t_tglpembayaran as t_tglpembayaran, t_kodebayar as t_kodebayar, view_rekening.s_jenisobjek as s_jenisobjek, view_rekening.s_namajenis as korek_parent, view_rekening.korek, view_rekening.s_objekkorek, view_rekening.s_rinciankorek, view_rekening.s_namakorek as korek_child, view_wp.t_npwpd as t_npwpd
		FROM t_transaksi
		LEFT JOIN view_wpobjek ON view_wpobjek.t_idobjek=t_transaksi.t_idwpobjek
		LEFT JOIN view_wp ON view_wp.t_idwp=view_wpobjek.t_idwp
		LEFT JOIN view_rekening ON view_rekening.s_idkorek=t_transaksi.t_idkorek
		WHERE t_jmlhpembayaran != 0
		AND t_tglpembayaran BETWEEN '" . $tgl1 . "' and '" . $tgl2 . "' " . $whereviabayar1 . " )
		UNION
		(SELECT t_jumlahsetor as t_jmlhpembayaran, s_namakorek as t_namaobjek, null as t_jmlhbayardenda, t_tglsetor as t_tglpembayaran, 'Setoran Lain' as t_kodebayar, view_rekening.s_jenisobjek as s_jenisobjek, view_rekening.s_namajenis as korek_parent, view_rekening.korek, view_rekening.s_objekkorek, view_rekening.s_rinciankorek, view_rekening.s_namakorek as korek_child, 'Setoran Lain' as t_npwpd
		FROM t_setoranlain
		LEFT JOIN view_rekening ON view_rekening.s_idkorek=t_setoranlain.t_idrekening
		WHERE t_issetorandeleted = 0
		AND t_tglsetor BETWEEN '" . $tgl1 . "' and '" . $tgl2 . "' " . $whereviabayar2 . " )

		ORDER BY t_kodebayar, s_objekkorek, s_rinciankorek ASC
        ";

        // die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getdataBppsRinci($bulan, $viabayar, $jenispajak) {
        if ($viabayar != NULL):
            $whereviabayar = " and t0.t_viapembayaran::text='$viabayar' ";
        endif;
        if ($jenispajak != NULL):
            $wherejenispajak = " and t0.t_jenispajak = $jenispajak ";
        endif;
        $sql = "SELECT
	t0.*
FROM
	t_transaksi t0
WHERE
	EXTRACT (
		MONTH
		FROM
			t0.t_tglpembayaran
	) :: INT = $bulan
AND EXTRACT (YEAR FROM t0.t_tglpembayaran) :: INT = " . date('Y') . "
$wherejenispajak";
//        die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getdataBppsRinciBulanLalu($bulan, $viabayar, $jenispajak) {
        if ($viabayar != NULL):
            $whereviabayar = " and t0.t_viapembayaran::text='$viabayar' ";
        endif;
        if ($jenispajak != NULL):
            $wherejenispajak = " and t0.t_jenispajak = $jenispajak ";
        endif;
        $sql = "SELECT
	sum(t0.t_jmlhpembayaran) as jumlah
FROM
	t_transaksi t0
WHERE
	EXTRACT (
		MONTH
		FROM
			t0.t_tglpembayaran
	) :: INT < $bulan
AND EXTRACT (YEAR FROM t0.t_tglpembayaran) :: INT = " . date('Y') . "
$wherejenispajak";
//        die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->current();
        return $res;
    }

    public function getdataBppsRinciBulanIni($bulan, $viabayar, $jenispajak) {
        if ($viabayar != NULL):
            $whereviabayar = " and t0.t_viapembayaran::text='$viabayar' ";
        endif;
        if ($jenispajak != NULL):
            $wherejenispajak = " and t0.t_jenispajak = $jenispajak ";
        endif;
        $sql = "SELECT
	sum(t0.t_jmlhpembayaran) as jumlah
FROM
	t_transaksi t0
WHERE
	EXTRACT (
		MONTH
		FROM
			t0.t_tglpembayaran
	) :: INT <= $bulan
AND EXTRACT (YEAR FROM t0.t_tglpembayaran) :: INT = " . date('Y') . "
$wherejenispajak";
//        die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->current();
        return $res;
    }

    public function getdataRekapPenerimaan($tgl1, $tgl2, $viabayar) {
        $tgl1 = date('Y-m-d', strtotime($tgl1));
        $tgl2 = date('Y-m-d', strtotime($tgl2));
        if ($viabayar != NULL):
            $whereviabayar = " and t0.t_viapembayaran::text='$viabayar' ";
            $whereviabayardenda = " and t0.t_viapembayarandenda::text='$viabayar' ";
        endif;
        $sql = "SELECT
	*
FROM
	(
		SELECT
			t_rek.korek, t_rek.s_namakorek,
			CASE
		WHEN s_tipekorek || s_kelompokkorek || s_jeniskorek || s_objekkorek = '41407' THEN
			(
				SELECT
					SUM (t_jmlhbayardenda)
				FROM
					t_transaksi t0
				LEFT JOIN view_rekening t1 ON t1.s_idkorek = t0.t_idkorekdenda
				WHERE
					t1.s_tipekorek = t_rek.s_tipekorek
				AND t1.s_kelompokkorek = t_rek.s_kelompokkorek
				AND t1.s_jeniskorek = t_rek.s_jeniskorek
				AND t1.s_objekkorek = t_rek.s_objekkorek
				AND t1.s_rinciankorek = t_rek.s_rinciankorek
				AND t0.t_tglbayardenda BETWEEN '" . $tgl1 . "'
				AND '" . $tgl2 . "' $whereviabayardenda
			)
		ELSE
			(
				SELECT
					SUM (t_jmlhpembayaran)
				FROM
					t_transaksi t0
				LEFT JOIN view_rekening t1 ON t1.s_idkorek = t0.t_idkorek
				WHERE
					t1.s_tipekorek = t_rek.s_tipekorek
				AND t1.s_kelompokkorek = t_rek.s_kelompokkorek
				AND t1.s_jeniskorek = t_rek.s_jeniskorek
				AND t1.s_objekkorek = t_rek.s_objekkorek
				AND t0.t_tglpembayaran BETWEEN '" . $tgl1 . "'
				AND '" . $tgl2 . "' $whereviabayar
			)
	 END AS jumlah
		FROM
			view_rekening t_rek
		WHERE
			s_rinciankorek = '00'
		OR (
			s_rinciankorek != '00'
			AND s_tipekorek || s_kelompokkorek || s_jeniskorek || s_objekkorek = '41407'
		)
	) AS rekap
WHERE jumlah is not null
order by korek";

        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getdataBPP($bulan, $tahun) {

        $sql = "select * from ((
select
t0.t_tglpembayaran as tglbayar,
t0.t_kodebayar as nobukti,
t_rek.korek,
t_rek.s_namakorek as uraian,
t0.t_jmlhpembayaran as penerimaan,
(select aa.t_jmlhsbd from t_setorbankdetail aa where aa.t_idtransaksi=t0.t_idtransaksi and aa.t_idkoreksbd=t0.t_idkorek) as penyetoran,
(select t_nosbh from t_setorbankheader where t_idsbh=(select aa.t_idsbh from t_setorbankdetail aa where aa.t_idtransaksi=t0.t_idtransaksi and aa.t_idkoreksbd=t0.t_idkorek)) as nosts,
(select t_tglsbh from t_setorbankheader where t_idsbh=(select aa.t_idsbh from t_setorbankdetail aa where aa.t_idtransaksi=t0.t_idtransaksi and aa.t_idkoreksbd=t0.t_idkorek)) as tglsetor
from t_transaksi t0
left join view_rekening t_rek ON t_rek.s_idkorek=t0.t_idkorek
where extract(month from t0.t_tglpembayaran)::int = " . $bulan . " AND extract(year from t0.t_tglpembayaran)::int = " . $tahun . "
)
UNION
(
select
t0.t_tglbayardenda as tglbayar,
t0.t_kodebayar as nobukti,
t_rek.korek,
t_rek.s_namakorek as uraian,
t0.t_jmlhbayardenda as penerimaan,
(select aa.t_jmlhsbd from t_setorbankdetail aa where aa.t_idtransaksi=t0.t_idtransaksi and aa.t_idkoreksbd=t0.t_idkorekdenda) as penyetoran,
(select bb.t_nosbh from t_setorbankdetail aa left join t_setorbankheader bb ON aa.t_idsbh=bb.t_idsbh where aa.t_idtransaksi=t0.t_idtransaksi and aa.t_idkoreksbd=t0.t_idkorekdenda) as nosts,
(select t_tglsbh from t_setorbankheader where t_idsbh=(select aa.t_idsbh from t_setorbankdetail aa where aa.t_idtransaksi=t0.t_idtransaksi and aa.t_idkoreksbd=t0.t_idkorekdenda)) as tglsetor
from t_transaksi t0
left join view_rekening t_rek ON t_rek.s_idkorek=t0.t_idkorekdenda
where extract(month from t0.t_tglbayardenda)::int = " . $bulan . " AND extract(year from t0.t_tglbayardenda)::int = " . $tahun . "
)) as bpp order by tglbayar";
    //    die($sql);
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getdataRealisasiObjek($t_periodepajak, $t_kecamatanobjek, $t_kelurahanobjek) {

        $where_kec = "";
        if (!empty($t_kecamatanobjek)) {
            $where_kec .= "and b.t_kecamatanobjek = $t_kecamatanobjek";
        }

        /*
        * dikarnakan beda pemanggilan id dan kode
        * maka id digunakan sebagai paramater untuk
        * menemukan kode.
        * <kasus sudah terpasang dan memiliki data banyak>
        */

        if (!empty($t_kelurahanobjek)){
        	
	       	$search_kel = "SELECT s_kodekel FROM s_kelurahan WHERE
	       					s_idkeckel = '".$t_kecamatanobjek."' AND
	       					s_idkel = '".$t_kelurahanobjek."' ";
			$state = $this->adapter->query($search_kel)->execute();
			foreach ($state as $key => $value) {
				# code...
				// var_dump($value['s_kodekel']);die;
				$t_kelurahan = $value['s_kodekel'];
			}
        }

        $where_kel = "";
        if (!empty($t_kelurahan)) {
            $where_kel .= "and b.t_kelurahanobjek = $t_kelurahan";
        }

        // $where_kel = "";
        // if (!empty($t_kelurahanobjek)) {
        //     $where_kel .= "and b.t_kelurahanobjek = $t_kelurahanobjek";
        // }

        // var_dump($state);die;
        $sql = "select korek, s_namakorek, s_rinciankorek,
                    CASE
                    WHEN C .s_kelompokkorek = '0' THEN
                    (
                        select sum(t_jmlhpajak) as jmlhpajak
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            left join view_rekening f on f.s_idkorek = a.t_idkorek
                            where f.s_tipekorek = c.s_tipekorek
                            and a.t_periodepajak = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    WHEN C .s_jeniskorek = '0' THEN
                    (
                        select sum(t_jmlhpajak) as jmlhpajak
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            left join view_rekening f on f.s_idkorek = a.t_idkorek
                            where f.s_tipekorek = c.s_tipekorek
                            and f.s_kelompokkorek = c.s_kelompokkorek
                            and a.t_periodepajak = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    WHEN C .s_objekkorek = '0' THEN
                    (
                        select sum(t_jmlhpajak) as jmlhpajak
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            left join view_rekening f on f.s_idkorek = a.t_idkorek
                            where f.s_tipekorek = c.s_tipekorek
                            and f.s_kelompokkorek = c.s_kelompokkorek
                            and f.s_jeniskorek = c.s_jeniskorek
                            and a.t_periodepajak = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    WHEN C .s_rinciankorek = '00' THEN
                    (
                        select sum(t_jmlhpajak) as jmlhpajak
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            left join view_rekening f on f.s_idkorek = a.t_idkorek
                            where f.s_tipekorek = c.s_tipekorek
                            and f.s_kelompokkorek = c.s_kelompokkorek
                            and f.s_jeniskorek = c.s_jeniskorek
                            and f.s_objekkorek = c.s_objekkorek
                            and a.t_periodepajak = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    WHEN c.s_tipekorek||c.s_kelompokkorek||c.s_jeniskorek||c.s_objekkorek='41408' THEN
                    (
                        select sum(t_jmlhdendapembayaran) as jmlhdenda
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            where c.s_idkorek = a.t_idkorekdenda
                            and extract(year from a.t_tgldendapembayaran) = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    WHEN c.s_tipekorek||c.s_kelompokkorek||c.s_jeniskorek||c.s_objekkorek='41409' THEN
                    (
                        select sum(t_jmlhdendapembayaran) as jmlhdenda
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            where c.s_idkorek = a.t_idkorekdenda
                            and extract(year from a.t_tgldendapembayaran) = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    ELSE
                    (
                            select sum(t_jmlhpajak) as jmlhpajak
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            where c.s_idkorek = a.t_idkorek
                            and a.t_periodepajak = '" . $t_periodepajak . "' $where_kec $where_kel
                    ) END as penetapan,

                    CASE
                    WHEN C .s_kelompokkorek = '0' THEN
                    (
                        select sum(t_jmlhpembayaran) as jmlhbayar
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            left join view_rekening f on f.s_idkorek = a.t_idkorek
                            where f.s_tipekorek = c.s_tipekorek
                            and a.t_periodepajak = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    WHEN C .s_jeniskorek = '0' THEN
                    (
                        select sum(t_jmlhpembayaran) as jmlhbayar
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            left join view_rekening f on f.s_idkorek = a.t_idkorek
                            where f.s_tipekorek = c.s_tipekorek
                            and f.s_kelompokkorek = c.s_kelompokkorek
                            and a.t_periodepajak = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    WHEN C .s_objekkorek = '0' THEN
                    (
                        select sum(t_jmlhpembayaran) as jmlhbayar
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            left join view_rekening f on f.s_idkorek = a.t_idkorek
                            where f.s_tipekorek = c.s_tipekorek
                            and f.s_kelompokkorek = c.s_kelompokkorek
                            and f.s_jeniskorek = c.s_jeniskorek
                            and a.t_periodepajak = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    WHEN C .s_rinciankorek = '00' THEN
                    (
                        select sum(t_jmlhpembayaran) as jmlhbayar
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            left join view_rekening f on f.s_idkorek = a.t_idkorek
                            where f.s_tipekorek = c.s_tipekorek
                            and f.s_kelompokkorek = c.s_kelompokkorek
                            and f.s_jeniskorek = c.s_jeniskorek
                            and f.s_objekkorek = c.s_objekkorek
                            and a.t_periodepajak = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    WHEN c.s_tipekorek||c.s_kelompokkorek||c.s_jeniskorek||c.s_objekkorek='41408' THEN
                    (
                        select sum(t_jmlhbayardenda) as jmlhdenda
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            where c.s_idkorek = a.t_idkorekdenda
                            and extract(year from a.t_tglbayardenda) = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    WHEN c.s_tipekorek||c.s_kelompokkorek||c.s_jeniskorek||c.s_objekkorek='41409' THEN
                    (
                        select sum(t_jmlhbayardenda) as jmlhdenda
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            where c.s_idkorek = a.t_idkorekdenda
                            and extract(year from a.t_tglbayardenda) = '" . $t_periodepajak . "' $where_kec $where_kel
                    )
                    ELSE
                    (
                            select sum(t_jmlhpembayaran) as jmlhbayar
                            from t_transaksi a
                            left join t_wpobjek b on b.t_idobjek = a.t_idwpobjek
                            where c.s_idkorek = a.t_idkorek
                            and a.t_periodepajak = '" . $t_periodepajak . "' $where_kec $where_kel
                    ) END as realisasi
                from view_rekening c order by korek";
        $statement = $this->adapter->query($sql);
        // var_dump($statement);die;
        $res = $statement->execute();
        return $res;
    }

    public function getdataKetetapanSetoran($tgl,$periodeketset, $jenisobj, $korekid) {

        if (!empty($jenisobj)):
            $wherejenisobj = " where b.s_idjenis = " . $jenisobj . " ";

        endif;
        if ($korekid != NULL):
            $wherekorekid = " and c.t_idkorek = $korekid ";
            $wherekorekobjek = " where idkorek_objek = $korekid ";
        endif;
        $tglmasa = explode("-", $tgl);
        // $periode = $tglmasa[2];
        $periode = $periodeketset;
        $sql = "select * from (select t_nama, s_namajenis, t_npwpd, t_nop, t_namaobjek,
                (select tt.t_idkorek from t_transaksi tt where tt.t_idwpobjek=b.t_idobjek limit 1 ) as idkorek_objek,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '01' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_jan,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '01' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_jan,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '02' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_feb,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '02' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_feb,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '03' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_mar,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '03' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_mar,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '04' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_apr,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '04' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_apr,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '05' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_mei,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '05' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_mei,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '06' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_jun,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '06' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_jun,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '07' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_jul,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '07' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_jul,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '08' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_agu,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '08' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_agu,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '09' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_sep,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '09' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_sep,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '10' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_okt,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '10' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_okt,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '11' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_nov,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '11' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_nov,
		(
			select sum(t_jmlhpajak) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '12' and extract(year from t_masaawal) = '" . $periode . "'
		) as data_des,
		(
			select sum(t_jmlhpembayaran) from t_transaksi c
			where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '12' and extract(year from t_masaawal) = '" . $periode . "'
		) as bayar_des
                from view_wp a
                left join view_wpobjek b on a.t_idwp = b.t_idwp

                " . $wherejenisobj . "
                order by b.s_idjenis asc ) ketset $wherekorekobjek ";

        //perubahan sebelum 03102019
  //       if (!empty($jenisobj)):
  //           $wherejenisobj = " where b.s_idjenis = " . $jenisobj . " ";

  //       endif;
  //       if ($korekid != NULL):
  //           $wherekorekid = " and c.t_idkorek = $korekid ";
  //           $wherekorekobjek = " where idkorek_objek = $korekid ";
  //       endif;
  //       $tglmasa = explode("-", $tgl);
  //       $periode = $tglmasa[2];
  //       $sql = "select * from (select t_nama, s_namajenis, t_npwpd, t_nop, t_namaobjek,
  //               (select tt.t_idkorek from t_transaksi tt where tt.t_idwpobjek=b.t_idobjek limit 1 ) as idkorek_objek,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '01' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_jan,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '01' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_jan,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '02' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_feb,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '02' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_feb,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '03' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_mar,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '03' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_mar,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '04' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_apr,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '04' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_apr,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '05' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_mei,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '05' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_mei,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '06' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_jun,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '06' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_jun,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '07' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_jul,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '07' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_jul,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '08' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_agu,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '08' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_agu,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '09' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_sep,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '09' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_sep,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '10' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_okt,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '10' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_okt,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '11' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_nov,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '11' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_nov,
		// (
		// 	select sum(t_jmlhpajak) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '12' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as data_des,
		// (
		// 	select sum(t_jmlhpembayaran) from t_transaksi c
		// 	where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_tglpendataan) = '12' and extract(year from t_tglpendataan) = '" . $periode . "'
		// ) as bayar_des
  //               from view_wp a
  //               left join view_wpobjek b on a.t_idwp = b.t_idwp

  //               " . $wherejenisobj . "
  //               order by b.s_idjenis asc ) ketset $wherekorekobjek ";

        // if (!empty($jenisobj)):
        // $wherejenisobj = " where b.s_idjenis = " . $jenisobj . " ";
        // endif;
        // if ($korekid != NULL):
        // $wherekorekid = " and c.t_idkorek = $korekid ";
        // $wherekorekobjek = " where idkorek_objek = $korekid ";
        // endif;
        // $tglmasa = explode("-", $tgl);
        // $sql = "select * from (select t_nama, s_namajenis, t_npwpd, t_nop, t_namaobjek,
        // (select tt.t_idkorek from t_transaksi tt where tt.t_idwpobjek=b.t_idobjek limit 1 ) as idkorek_objek,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '01' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_jan,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '01' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_jan,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '02' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_feb,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '02' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_feb,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '03' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_mar,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '03' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_mar,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '" . $tglmasa[1] . "' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_apr,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '" . $tglmasa[1] . "' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_apr,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '05' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_mei,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '05' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_mei,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '06' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_jun,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '06' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_jun,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '07' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_jul,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '07' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_jul,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '08' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_agu,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '08' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_agu,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '09' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_sep,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '09' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_sep,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '10' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_okt,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '10' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_okt,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '11' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_nov,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '11' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_nov,
        // (
        // select t_jmlhpajak from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '12' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as data_des,
        // (
        // select t_jmlhpembayaran from t_transaksi c
        // where c.t_idwpobjek = b.t_idobjek $wherekorekid and extract(month from t_masaawal) = '12' and extract(year from t_masaawal) = '" . $tglmasa[2] . "'
        // ) as bayar_des
        // from view_wp a
        // left join view_wpobjek b on a.t_idwp = b.t_idwp
        // " . $wherejenisobj . "
        // order by b.s_idjenis asc ) ketset $wherekorekobjek ";
        //        die($sql);
        // echo $sql; exit();
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getDataTransaksiByMasaPajak($masaawaltrans, $periodetrans, $jenisobjtrans) {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from(array(
            "a" => "view_wp"
        ));
        $select->join(array(
            "b" => "view_wpobjek"
                ), "a.t_idwp = b.t_idwp", array(
            "t_nop", "s_namajenis"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "c" => "t_transaksi"
                ), "b.t_idobjek = c.t_idwpobjek", array(
            "t_tglpendataan", "t_jmlhpajak", "t_tglpembayaran", "t_jmlhpembayaran", "t_tgljatuhtempo", "t_masaawal", "t_masaakhir", "t_periodepajak"
                ), $select::JOIN_LEFT);
        $select->join(array(
            "d" => "view_rekening"
                ), "c.t_idkorek = d.s_idkorek", array(
            "s_namakorek", "korek"
                ), $select::JOIN_LEFT);
        $where = new Where();
        $where->literal("extract(month from c.t_masaawal) in (" . $masaawaltrans . ")");
        $where->equalTo('t_periodepajak', $periodetrans);
        if ($jenisobjtrans != null) {
            $where->literal("b.t_jenisobjek in (" . $jenisobjtrans . ")");
        }
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getdataRealisasi($tglawal, $tglakhir, $idrealisasi) {
		$tahun = date("Y", strtotime($tglakhir));
        $bulan = date('m', strtotime($tglakhir));
        // if ($bulan_desember == 12) {
            // $tgl_akhir = date('Y-11-30', strtotime($tglakhir));
        // } else {
            // $tgl_akhir = date('Y-m-t', strtotime($tglakhir . " -1 months"));
        	// $tgl_akhir = date('Y-m-d', strtotime($tglakhir . " -1 months"));
        
        // }

		$tgl_akhir = date('Ym', strtotime($tglakhir . " -1 months"));
        
         $connect_db_bphtb = "host=localhost user=postgres password=pgsql@Pulang Pisau2020 dbname=bphtbPulang Pisau"; //KONEKSI DB BPHTB


        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("s_rekening");
        $select->columns(array(
            "s_idkorek",
            "s_objekkorek",
            "s_tipekorek",
            "s_kelompokkorek",
            "s_jeniskorek",
            "s_objekkorek",
            "s_rinciankorek",
            "s_sub1korek",
            "s_sub2korek",
            "s_sub3korek",
            "korek" => new \Zend\Db\Sql\Expression("(CASE WHEN " .
                    "s_kelompokkorek = '0' THEN s_tipekorek " .
                    "WHEN s_jeniskorek = '0' THEN s_tipekorek || '.' || s_kelompokkorek " .
                    "WHEN s_objekkorek = '0' THEN s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek " .
                    "WHEN s_rinciankorek = '00' THEN s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek || '.' || s_objekkorek  " .
                    "WHEN s_sub1korek IS NULL THEN " .
                    "s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek || '.' || s_objekkorek || '.' || s_rinciankorek " .
                    "WHEN s_sub2korek IS NULL THEN " .
                    "s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek || '.' || s_objekkorek || '.' || s_rinciankorek || '.' || s_sub1korek " .
                    "WHEN s_sub3korek = '' THEN " .
                    "s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek || '.' || s_objekkorek || '.' || s_rinciankorek || '.' || s_sub1korek || '.' || s_sub2korek " .
                    "ELSE " .
                    "s_tipekorek || '.' || s_kelompokkorek || '.' || s_jeniskorek || '.' || s_objekkorek || '.' || s_rinciankorek || '.' || s_sub1korek || '.' || s_sub2korek || '.' || s_sub3korek " .
                    "END )"),
            "s_namakorek",
            "target" => new \Zend\Db\Sql\Predicate\Expression("(SELECT coalesce(s_targetjumlah,0) FROM s_target " .
                    "LEFT JOIN s_targetdetail on s_target.s_idtarget = s_targetdetail.s_idtargetheader " .
                    "WHERE s_target.s_idtarget = " . $idrealisasi . " and s_targetdetail.s_targetrekening = s_rekening.s_idkorek)"),
            "transaksi_blnlalu" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '0' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END )"),
            "transaksi_blnini" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END )"),
            "transaksi_sdblnini" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND aa.t_jenispajak != 6 " .
                    ") " .
                    "END )"),
            "minerba_blnlalu" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglpembayaran ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END )"),
            "minerba_blnini" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END )"),
            "minerba_sdblnini" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bb.t_pajak),0) FROM t_detailminerba bb " .
                    "LEFT JOIN t_transaksi aa on bb.t_idtransaksi = aa.t_idtransaksi " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = bb.t_idkorek " .
                    "WHERE aa.t_tglpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND aa.t_idtransaksi is not null " .
                    ") " .
                    "END )"),
            "dendatransaksi_blnlalu" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglbayardenda, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglbayardenda ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglbayardenda, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglbayardenda ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglbayardenda, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglbayardenda ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglbayardenda, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglbayardenda ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglbayardenda, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglbayardenda ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglbayardenda, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglbayardenda ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglbayardenda, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglbayardenda ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE TO_CHAR(aa.t_tglbayardenda, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglbayardenda ) = '" . $tahun . "' " .
                    // "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    ") " .
                    "END )"),
            "dendatransaksi_blnini" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    ") " .
                    "END )"),
            "dendatransaksi_sdblnini" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jmlhbayardenda), 0) FROM t_transaksi aa " .
                    "LEFT JOIN s_rekening za on aa.t_idkorekdenda = za.s_idkorek " .
                    "WHERE aa.t_tglbayardenda >= '" . date('Y-01-d', strtotime($tglawal)) . "' and aa.t_tglbayardenda <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    ") " .
                    "END )"),
            "setoranlain_blnlalu" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND to_char(aa.t_tglsetor, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
					// "AND aa.t_tglsetor >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglsetor <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND to_char(aa.t_tglsetor, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
					// "AND aa.t_tglsetor >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglsetor <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND to_char(aa.t_tglsetor, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
					// "AND aa.t_tglsetor >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglsetor <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND to_char(aa.t_tglsetor, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
					// "AND aa.t_tglsetor >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglsetor <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND to_char(aa.t_tglsetor, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
					// "AND aa.t_tglsetor >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglsetor <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND to_char(aa.t_tglsetor, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
					// "AND aa.t_tglsetor >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglsetor <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND to_char(aa.t_tglsetor, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
					// "AND aa.t_tglsetor >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglsetor <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND to_char(aa.t_tglsetor, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
					// "AND aa.t_tglsetor >= '" . date('Y-m-d', strtotime($tglawal)) . "' and aa.t_tglsetor <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    ") " .
                    "END )"),
            "setoranlain_blnini" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 AND aa.t_tglsetor >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 AND aa.t_tglsetor >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 AND aa.t_tglsetor >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 AND aa.t_tglsetor >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 AND aa.t_tglsetor >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 AND aa.t_tglsetor >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 AND aa.t_tglsetor >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 AND aa.t_tglsetor >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    ") " .
                    "END )"),
            "setoranlain_sdblnini" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(t_jumlahsetor),0) FROM t_setoranlain aa " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening " .
                    "WHERE aa.t_idrekening != 252 AND aa.t_issetorandeleted=0 " .
					"AND aa.t_tglsetor <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM aa.t_tglsetor ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    ") " .
                    "END )"),
            "bphtb_blnlalu" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
					FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
					"WHERE to_char(bphtb.t_tanggalpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    // "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and bphtb.t_tanggalpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
					"WHERE to_char(bphtb.t_tanggalpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    // "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and bphtb.t_tanggalpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
					"WHERE to_char(bphtb.t_tanggalpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    // "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and bphtb.t_tanggalpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
					"WHERE to_char(bphtb.t_tanggalpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    // "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and bphtb.t_tanggalpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
					"WHERE to_char(bphtb.t_tanggalpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    // "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and bphtb.t_tanggalpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
					"WHERE to_char(bphtb.t_tanggalpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    // "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and bphtb.t_tanggalpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
					"WHERE to_char(bphtb.t_tanggalpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    // "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and bphtb.t_tanggalpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
					"WHERE to_char(bphtb.t_tanggalpembayaran, 'YYYYMM') < '" . date('Ym', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    // "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-d', strtotime($tglawal)) . "' and bphtb.t_tanggalpembayaran <= '" . $tgl_akhir . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    ") " .
                    "END )"),
            "bphtb_blnini" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran >= '" . date('Y-m-01', strtotime($tglakhir)) . "' and bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    ") " .
                    "END )"),
            "bphtb_sdblnini" => new \Zend\Db\Sql\Expression("(case when s_rekening.s_kelompokkorek != '0' THEN " .
                    "case when s_rekening.s_jeniskorek != '0' THEN " .
                    "case when s_rekening.s_objekkorek != '0' THEN " .
                    "case when s_rekening.s_rinciankorek != '00' THEN " .
                    "case when s_rekening.s_sub1korek != '' THEN " .
                    "case when s_rekening.s_sub2korek != '0' THEN " .
                    "case when s_rekening.s_sub3korek != '0' THEN " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    "AND za.s_sub3korek = s_rekening.s_sub3korek " .
                    ") " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    "AND za.s_sub2korek = s_rekening.s_sub2korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    "AND za.s_sub1korek = s_rekening.s_sub1korek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
												FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    "AND za.s_rinciankorek = s_rekening.s_rinciankorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
					FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    "AND za.s_objekkorek = s_rekening.s_objekkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
					FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    "AND za.s_jeniskorek = s_rekening.s_jeniskorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
					FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    "AND za.s_kelompokkorek = s_rekening.s_kelompokkorek " .
                    ") " .
                    "END " .
                    "ELSE " .
                    "(SELECT COALESCE(SUM(bphtb.t_nilaipembayaranspt),0) 
					FROM dblink('" . $connect_db_bphtb . "','SELECT t_tanggalpembayaran,t_nilaipembayaranspt,t_idkorekspt FROM t_pembayaranspt ') AS bphtb(t_tanggalpembayaran date, t_nilaipembayaranspt bigint, t_idkorekspt integer) " .
                    "LEFT JOIN s_rekening za on za.s_idkorek = 252 " .
                    "WHERE bphtb.t_tanggalpembayaran <= '" . date('Y-m-d', strtotime($tglakhir)) . "' " .
					"AND EXTRACT ( YEAR FROM bphtb.t_tanggalpembayaran ) = '" . $tahun . "' " .
                    "AND za.s_tipekorek = s_rekening.s_tipekorek " .
                    ") " .
                    "END )"),
        ));
        $where = new Where();
//        $where->literal('aa.t_jmlhpembayaran > 0');
        $select->where($where);
        $select->order(new \Zend\Db\Sql\Expression("s_rekening.s_tipekorek, " .
                "s_rekening.s_kelompokkorek, " . "s_rekening.s_jeniskorek, " . "s_rekening.s_objekkorek, " .
                "s_rekening.s_rinciankorek, " . "s_rekening.s_sub1korek"));
        // echo $select->getSqlString();exit();
        $state = $sql->prepareStatementForSqlObject($select);
        
        $res = $state->execute();
        return $res;
    }

    public function getDataTransaksiByPerMasaPajak($masaawaltrans, $periodetrans, $jenisobjtrans, $korekid) {
//        $sql = new Sql($this->adapter);
//        $select = $sql->select();
//        $select->from(array(
//            "a" => "view_wp"
//        ));
//        $select->join(array(
//            "b" => "view_wpobjek"
//                ), "a.t_idwp = b.t_idwp", array(
//            "t_nop", "s_namajenis"
//                ), $select::JOIN_LEFT);
//        $select->join(array(
//            "c" => "t_transaksi"
//                ), "b.t_idobjek = c.t_idwpobjek", array(
//            "t_tglpendataan","t_nourut", "t_jmlhpajak", "t_tglpembayaran", "t_jmlhpembayaran", "t_tgljatuhtempo", "t_masaawal", "t_masaakhir", "t_periodepajak"
//                ), $select::JOIN_LEFT);
//        $select->join(array(
//            "d" => "view_rekening"
//                ), "c.t_idkorek = d.s_idkorek", array(
//            "s_namakorek", "korek"
//                ), $select::JOIN_LEFT);
//        $where = new Where();
//        $where->literal("extract(month from c.t_masaawal) in (" . $masaawaltrans . ")");
//        $where->equalTo('t_periodepajak', $periodetrans);
//        if ($jenisobjtrans != null) {
//            $where->literal("b.t_jenisobjek in (" . $jenisobjtrans . ")");
//        }
//        $select->where($where);
//        $select->order('d.s_idkorek asc');
//        $state = $sql->prepareStatementForSqlObject($select);
//        $res = $state->execute();
//        return $res;
        if ($jenisobjtrans != null) {
            $where_jenisobjek = " AND b.t_jenisobjek=$jenisobjtrans ";
        } else {
            $where_jenisobjek = " ";
        }

        if ($korekid != null):
            $wherekorekid = " AND c.t_idkorek = $korekid ";
        endif;

        $sql = "SELECT c.t_tglpendataan,c.t_nourut,a.t_npwpd,a.t_nama,a.t_alamat, c.t_jmlhpajak, extract(MONTH FROM c.t_masaawal) as masapajak, extract(YEAR FROM c.t_masaawal) as periodepajak, d.s_namakorek
                FROM view_wp a
                    LEFT JOIN view_wpobjek b ON a.t_idwp = b.t_idwp
                    LEFT JOIN t_transaksi c ON b.t_idobjek = c.t_idwpobjek
                    LEFT JOIN view_rekening d ON c.t_idkorek = d.s_idkorek
                WHERE extract(month from c.t_masaawal)='$masaawaltrans' AND extract(YEAR FROM c.t_masaawal)='$periodetrans' $where_jenisobjek $wherekorekid
                ORDER BY d.s_idkorek asc";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getDataTotalTransaksiByPerMasaPajak($masaawaltrans, $periodetrans, $jenisobjtrans, $korekid) {
        if ($jenisobjtrans != null) {
            $where_jenisobjek = " AND c.t_jenispajak=$jenisobjtrans ";
        } else {
            $where_jenisobjek = " ";
        }

        if ($korekid != NULL):
            $wherekorekid = " and c.t_idkorek = $korekid ";
        endif;

        $bulan_lalu = ($masaawaltrans) - 1;

        $sql = "SELECT  (
				select sum(c.t_jmlhpajak) from t_transaksi c
                WHERE extract(month from c.t_masaawal)='$masaawaltrans' AND extract(YEAR FROM c.t_masaawal)='$periodetrans' $where_jenisobjek $wherekorekid)
				as total_bulanini,
				(
				select sum(c.t_jmlhpajak) from t_transaksi c
                WHERE (extract(month from c.t_masaawal) between '01' and '$bulan_lalu') AND extract(YEAR FROM c.t_masaawal)='$periodetrans' $where_jenisobjek $wherekorekid)
				as total_sdbulanlalu,
				(
				select sum(c.t_jmlhpajak) from t_transaksi c
                WHERE (extract(month from c.t_masaawal) between '01' and '$masaawaltrans') AND extract(YEAR FROM c.t_masaawal)='$periodetrans' $where_jenisobjek $wherekorekid)
				as total_sdbulanini";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->current();
        return $res;
    }

    public function getDataTransaksiByPerMasaAkhirpajak($tglcetak, $periodedimuka, $jenisobjdimuka, $korekid) {
        $tglcetak_thn = date('Y', strtotime($tglcetak));
        if ($jenisobjdimuka != null) {
            $where_jenisobjek = " AND b.t_jenisobjek=$jenisobjdimuka ";
        } else {
            $where_jenisobjek = " ";
        }

        if ($korekid != null):
            $wherekorekid = " AND c.t_idkorek = $korekid ";
        endif;

        $sql = "SELECT c.t_tglpendataan,c.t_nourut,a.t_npwpd,a.t_nama,b.t_namaobjek, a.t_alamat, c.t_jmlhpajak, c.t_nopembayaran, c.t_tglpembayaran, c.t_jmlhpembayaran, c.t_jenispajak, c.t_masaawal, c.t_masaakhir, extract(MONTH FROM c.t_masaawal) as masapajak, extract(YEAR FROM c.t_masaawal) as periodepajak, d.s_namakorek
                FROM view_wp a
                    LEFT JOIN view_wpobjek b ON a.t_idwp = b.t_idwp
                    LEFT JOIN t_transaksi c ON b.t_idobjek = c.t_idwpobjek
                    LEFT JOIN view_rekening d ON c.t_idkorek = d.s_idkorek
                WHERE c.t_periodepajak='$periodedimuka' and extract(year from c.t_masaakhir)='$tglcetak_thn' $where_jenisobjek $wherekorekid
                ORDER BY d.s_idkorek asc";
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function getdataRealisasiPerjenis($periodepajak, $targetanggaran, $jenispungutan) {
        if(!empty($jenispungutan)){
            $target = "AND B.s_jenispungutan = '".$jenispungutan."'";
        }else{
            $target = "";
        }
        $sql = "SELECT A.s_jenisobjek, A.korek, A.s_namakorek, A.s_rinciankorek, B.s_jenispungutan,
                (SELECT coalesce(D.s_targetjumlah,0) FROM s_target C
                    LEFT JOIN s_targetdetail D ON C.s_idtarget = D.s_idtargetheader
                    WHERE C.s_idtarget = $targetanggaran and D.s_targetrekening = A.s_idkorek) AS target,
                (SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa
                    LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek
                    WHERE EXTRACT(YEAR FROM aa.t_tglpembayaran) = '$periodepajak'
                    AND za.s_tipekorek = A.s_tipekorek
                    AND za.s_kelompokkorek = A.s_kelompokkorek
                    AND za.s_jeniskorek = A.s_jeniskorek
                    AND za.s_objekkorek = A.s_objekkorek) AS real_tahunini,
                (SELECT coalesce(sum(aa.t_jmlhbayarskpdkb), 0) FROM t_skpdkb aa
                    LEFT JOIN t_transaksi zb on aa.t_idtransaksi = zb.t_idtransaksi
                    LEFT JOIN s_rekening za on zb.t_idkorek = za.s_idkorek
                    WHERE EXTRACT(YEAR FROM aa.t_tglbayarskpdkb) = '$periodepajak'
                    AND za.s_tipekorek = A.s_tipekorek
                    AND za.s_kelompokkorek = A.s_kelompokkorek
                    AND za.s_jeniskorek = A.s_jeniskorek
                    AND za.s_objekkorek = A.s_objekkorek) AS real_skpdkb,
                (SELECT coalesce(sum(aa.t_jmlhbayarskpdkbt), 0) FROM t_skpdkbt aa
                    LEFT JOIN t_transaksi zb on aa.t_idtransaksi = zb.t_idtransaksi
                    LEFT JOIN s_rekening za on zb.t_idkorek = za.s_idkorek
                    WHERE EXTRACT(YEAR FROM aa.t_tglbayarskpdkbt) = '$periodepajak'
                    AND za.s_tipekorek = A.s_tipekorek
                    AND za.s_kelompokkorek = A.s_kelompokkorek
                    AND za.s_jeniskorek = A.s_jeniskorek
                    AND za.s_objekkorek = A.s_objekkorek) AS real_skpdkbt,

                (SELECT coalesce(sum(aa.t_jumlahsetor),0) FROM t_setoranlain aa
                	LEFT JOIN s_rekening za on za.s_idkorek = aa.t_idrekening
                	Where EXTRACT(YEAR from aa.t_tglsetor) ='$periodepajak'
                	AND aa.t_issetorandeleted=0
                	AND za.s_tipekorek = A.s_tipekorek
                    AND za.s_kelompokkorek = A.s_kelompokkorek
                    AND za.s_jeniskorek = A.s_jeniskorek
                    AND za.s_objekkorek = A.s_objekkorek
                    AND za.s_rinciankorek = A.s_rinciankorek) as real_setorantahuniniret,


                (SELECT coalesce(sum(aa.t_jmlhpembayaran), 0) FROM t_transaksi aa
                    LEFT JOIN s_rekening za on aa.t_idkorek = za.s_idkorek
                    WHERE EXTRACT(YEAR FROM aa.t_tglpembayaran) = '$periodepajak'
                    AND za.s_tipekorek = A.s_tipekorek
                    AND za.s_kelompokkorek = A.s_kelompokkorek
                    AND za.s_jeniskorek = A.s_jeniskorek
                    AND za.s_objekkorek = A.s_objekkorek
                    AND za.s_rinciankorek = A.s_rinciankorek) AS real_tahuniniret

                    FROM view_rekening A
                    LEFT JOIN s_jenisobjek B ON B.s_idjenis=A.s_jenisobjek

                WHERE
                ((A.s_tipekorek||A.s_kelompokkorek||A.s_jeniskorek = '4101' AND A.s_rinciankorek='00')
                OR (A.s_tipekorek||A.s_kelompokkorek||A.s_jeniskorek = '4102' AND A.s_rinciankorek!='00' AND A.s_rinciankorek!='0'))
                AND A.s_sub1korek ='000'
                ".$target."
                order by A.korek";
        // echo ($sql);exit();
        $statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }

    public function dataopd(){
    	$sql="SELECT * from s_satker";
    	$statement = $this->adapter->query($sql);
        $res = $statement->execute();
        return $res;
    }
     public function databulanini($tglbayar0,$tglbayar1,$s_idsatker) {
         $sql = "SELECT coalesce(sum(b.t_jumlahsetor ),0 ) AS bulanini
         FROM s_satker A 
         LEFT JOIN t_setoranlain b ON b.t_idsatker = A.s_idsatker
		 LEFT JOIN view_rekening C ON C.s_idkorek = b.t_idrekening
         WHERE b.t_issetorandeleted = 0 AND a.s_idsatker='$s_idsatker'
         and t_tglsetor BETWEEN '" . date('Y-m-d', strtotime($tglbayar0)) . "' AND '" . date('Y-m-d', strtotime($tglbayar1)) . "'";
       // echo ($sql); exit();
        $statement = $this->adapter->query($sql);
        $res = $statement->execute()->current();
        return $res;
    }

    public function databulanlalu($tglbayar0,$s_idsatker) {
         $sql = "SELECT coalesce(sum(b.t_jumlahsetor ),0 ) AS bulanlalu
         FROM s_satker A 
         LEFT JOIN t_setoranlain b ON b.t_idsatker = A.s_idsatker
		 LEFT JOIN view_rekening C ON C.s_idkorek = b.t_idrekening 
		 WHERE
		 b.t_issetorandeleted = 0 AND b.t_tglsetor < '$tglbayar0' AND a.s_idsatker='$s_idsatker'";
        $statement = $this->adapter->query($sql);

        $res = $statement->execute()->current();
        return $res;
    }
    

}
