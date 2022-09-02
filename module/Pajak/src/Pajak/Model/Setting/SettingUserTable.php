<?php

namespace Pajak\Model\Setting;

use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Adapter\Adapter;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;

class SettingUserTable extends AbstractTableGateway
{

    protected $table = 's_users';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
        $this->resultSetPrototype = new ResultSet();
        $this->resultSetPrototype->setArrayObjectPrototype(new SettingUserBase());
        $this->initialize();
    }

    public function getGridCount(SettingUserBase $base)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->join(array('role' => 'role'), 'role.rid = s_users.s_akses', array('rid', 'role_name'), 'LEFT');
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
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->count();
    }

    public function getGridData(SettingUserBase $base, $offset)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->join(array('role' => 'role'), 'role.rid = s_users.s_akses', array('rid', 'role_name'), 'LEFT');
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
        $select->where($where);
        if ($base->sortasc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortasc");
            } else {
                $select->order("s_iduser asc");
            }
        } elseif ($base->sortdesc != 'undefined') {
            if ($base->combosorting != "undefined") {
                $select->order("$base->combosorting $base->sortdesc");
            } else {
                $select->order("s_iduser asc");
            }
        }
        $select->limit($base->rows = (int) $base->rows);
        $select->offset($offset = (int) $offset);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function fetchAll()
    {
        $resultSet = $this->select();
        return $resultSet;
    }

    public function getUser(SettingUserBase $sb)
    {
        $rowset = $this->select(array('s_iduser' => $sb->s_iduser));
        $row = $rowset->current();
        return $row;
    }

    public function getUserId($id)
    {
        $rowset = $this->select(array('s_iduser' => $id));
        $row = $rowset->current();
        return $row;
    }

    public function getUserEdit(SettingUserBase $sb)
    {
        $rowset = $this->select(array('s_username' => $sb->s_username, 's_tipe_pejabat' => $sb->s_tipe_pejabat, 's_idpejabat_idnotaris' => $sb->s_idpejabat_idnotaris));
        $row = $rowset->current();
        return $row;
    }

    public function saveData(SettingUserBase $sb)
    {
        /*$s_main = ($sb->s_main == null ? $sb->s_main : '(2)');
        $s_pendaftaran = ($sb->s_pendaftaran == null ? $sb->s_pendaftaran : '(3)');
        $s_pendataan = ($sb->s_pendataan == null ? $sb->s_pendataan : '(4)');
        $s_penetapan = ($sb->s_penetapan == null ? $sb->s_penetapan : '(5)');
        $s_skpdjabatan = ($sb->s_skpdjabatan == null ? $sb->s_skpdjabatan : '(6)');
        $s_skpdkb = ($sb->s_skpdkb == null ? $sb->s_skpdkb : '(7)');
        $s_skpdkbt = ($sb->s_skpdkbt == null ? $sb->s_skpdkbt : '(8)');
        $s_skpdlb = ($sb->s_skpdlb == null ? $sb->s_skpdlb : '(9)');
        $s_skpdn = ($sb->s_skpdn == null ? $sb->s_skpdn : '(10)');
        $s_pembayaran = ($sb->s_pembayaran == null ? $sb->s_pembayaran : '(11)');
        $s_pembayarandenda = ($sb->s_pembayarandenda == null ? $sb->s_pembayarandenda : '(12)');
        $s_rekambank = ($sb->s_rekambank == null ? $sb->s_rekambank : '(13)');
        $s_setoranlain = ($sb->s_setoranlain == null ? $sb->s_setoranlain : '(34)');
        $s_penagihan = ($sb->s_penagihan == null ? $sb->s_penagihan : '(14)');
        $s_pemeriksaan = ($sb->s_pemeriksaan == null ? $sb->s_pemeriksaan : '(15)');
        $s_pembukuan = ($sb->s_pembukuan == null ? $sb->s_pembukuan : '(16)');
        $s_stpdpembayaran = ($sb->s_stpdpembayaran == null ? $sb->s_stpdpembayaran : '(17)');
        $s_monitoring = ($sb->s_monitoring == null ? $sb->s_monitoring : '(19)');
        $s_pemda = ($sb->s_pemda == null ? $sb->s_pemda : '(20)');
        $s_user = ($sb->s_user == null ? $sb->s_user : '(21)');
        $s_kelurahan = ($sb->s_kelurahan == null ? $sb->s_kelurahan : '(22)');
        $s_pejabat = ($sb->s_pejabat == null ? $sb->s_pejabat : '(23)');
        $s_kecamatan = ($sb->s_kecamatan == null ? $sb->s_kecamatan : '(24)');
        $s_rekening = ($sb->s_rekening == null ? $sb->s_rekening : '(25)');
        $s_target = ($sb->s_target == null ? $sb->s_target : '(26)');
        $s_reklame = ($sb->s_reklame == null ? $sb->s_reklame : '(27)');
        $s_air = ($sb->s_air == null ? $sb->s_air : '(28)');
        $s_skpdt = ($sb->s_skpdt == null ? $sb->s_skpdt : '(29)');
        $s_laporan = ($sb->s_laporan == null ? $sb->s_laporan : '(30)');
        $s_perizinan = ($sb->s_perizinan == null ? $sb->s_perizinan : '(31)');
        $s_pratama = ($sb->s_pratama == null ? $sb->s_pratama : '(32)');
        $s_laporanbendahara = ($sb->s_laporanbendahara == null ? $sb->s_laporanbendahara : '(33)');
        
        $s_menu = array_merge((array) $s_main, (array) $s_pendaftaran
                , (array) $s_pendataan, (array) $s_penetapan
                , (array) $s_skpdjabatan, (array) $s_skpdkb
                , (array) $s_skpdkbt, (array) $s_skpdlb, (array) $s_skpdn
                , (array) $s_pembayaran, (array) $s_pembayarandenda, (array) $s_rekambank, (array) $s_setoranlain
                , (array) $s_penagihan, (array) $s_pemeriksaan, (array) $s_pembukuan
                , (array) $s_stpdpembayaran, (array) $s_monitoring);
        $s_menu = array_merge((array) $s_menu, (array) $s_pemda, (array) $s_user
                , (array) $s_kelurahan, (array) $s_pejabat, (array) $s_kecamatan
                , (array) $s_rekening, (array) $s_target, (array) $s_reklame, (array) $s_air, (array) $s_skpdt
                , (array) $s_laporan, (array) $s_perizinan, (array) $s_pratama, (array) $s_laporanbendahara);
//        if($sb->s_reklame!=null):
        $s_menu = array_merge((array) $s_menu, (array) '(35)', (array) '(36)', (array) '(37)', (array) '(38)', (array) '(39)', (array) '(40)', (array) '(41)');
//        endif;
        */
        if ($sb->s_akses == '1') {
            $s_jabatan = 'Wajib Pajak';
            $s_menu = '(1)';
        } elseif ($sb->s_akses == '2') {   // admin
            $s_jabatan = $sb->s_jabatan;
            $s_menu = '(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(27)';
        } elseif ($sb->s_akses == '3') {   // pendaftaran pendataan
            $s_jabatan = $sb->s_jabatan;
            $s_menu = '(1),(2),(3),(4),(5),(6),(7),(11),(12)';
        } elseif ($sb->s_akses == '4') {   // Penetapan
            $s_jabatan = $sb->s_jabatan;
            $s_menu = '(1),(4),(5),(6),(7),(10),(11),(12)';
        } elseif ($sb->s_akses == '5') {   // penagihan
            $s_jabatan = $sb->s_jabatan;
            $s_menu = '(1),(9),(12)';
        } elseif ($sb->s_akses == '6') {   // bendahara
            $s_jabatan = $sb->s_jabatan;
            $s_menu = '(1),(8),(11),(12)';
        } elseif ($sb->s_akses == '7') {   // pemeriksaan
            $s_jabatan = $sb->s_jabatan;
            $s_menu = '(1),(10),(11),(12),(13),(14)';
        } elseif ($sb->s_akses == '8') {   // Operator
            $s_jabatan = $sb->s_jabatan;
            $s_menu = '(1),(4),(3),(5),(6),(7),(9),(11)';
        } elseif ($sb->s_akses == '10') {  //Pengelolaan Pendataan 
            $s_jabatan = $sb->s_jabatan;
            $s_menu = '(1),(11)';
        } elseif ($sb->s_akses == '11') {  //Perizinan
            $s_jabatan = $sb->s_jabatan;
            $s_menu = '(29),(30)';
        // }
        //  elseif ($sb->s_akses == '12') {  //Perizinan
        //     $s_jabatan = $sb->s_jabatan;
        //     $s_menu = '(30)';
        } elseif ($sb->s_akses == '12') {   // pendaftaran pendataan
            $s_jabatan = $sb->s_jabatan;
            $s_menu = '(1),(11)';
        } else {
            $s_jabatan = $sb->s_jabatan;
            $s_menu = '(1)';
        }

        $data = array(
            's_username' => $sb->s_username,
            's_password' => md5($sb->s_password),
            's_akses' => $sb->s_akses,
            's_jabatan' => $s_jabatan,
            's_nama' => $sb->s_nama,
            's_noidentitas' => $sb->s_nip,
            's_menu' => $s_menu,
            's_wp' => (!empty($sb->s_wp)) ? $sb->s_wp : 0,
        );
        $id = (int) $sb->s_iduser;
        if ($id == 0) {
            $this->insert($data);
        } else {
            $data['s_iduser'] = $sb->s_iduser;
            $this->update($data, array('s_iduser' => $sb->s_iduser));
        }
        $rowset = $this->select(array(
            's_username' => $sb->s_username,
            's_password' => md5($sb->s_password)
        ));
        $row = $rowset->current();
        return $row;
    }

    public function saveresourcepermission($s_iduser, $s_akses)
    {
        $sql = "INSERT INTO permission_resource (s_iduser, s_idpermission) VALUES (" . $s_iduser . "," . $s_akses . ")";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    //    public function savesession($session) {
    //        $datahistlog = array(
    //            'hislog_opr_id' => $session['s_iduser'],
    //            'hislog_opr_user' => $session['s_username'] . "-" . $session['s_jabatan'],
    //            'hislog_opr_nama' => $session['s_username'],
    //            'hislog_time' => date("Y-m-d h:i:s")
    //        );
    //        $datahistlog['hislog_idspt'] = 0;
    //        $datahistlog['hislog_action'] = "SIMPAN / EDIT DATA USER - " . $s_iduser;
    //        $tabel_histlog = new \Zend\Db\TableGateway\TableGateway('history_log', $this->adapter);
    //        $tabel_histlog->insert($datahistlog);
    //    }

    public function deleteResourcePermision($s_iduser)
    {
        $sql = "DELETE FROM permission_resource WHERE s_iduser = " . $s_iduser;
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    public function CariAkses($role_akses)
    {
        $sql = "select id FROM permission WHERE permission_role like '%(" . $role_akses . ")%'";
        $statement = $this->adapter->query($sql);
        return $statement->execute();
    }

    //    public function saveUserRole(SettingUserBase $userrole) {
    //        $sql = "INSERT INTO user_role(user_id,role_id) VALUES (" . $userrole->s_iduser . "," . $userrole->s_akses . ")";
    //        $st = $this->adapter->query($sql);
    //        $rs = $st->execute();
    //    }
    //    public function saveRolePermission($role_id, $permission_id) {
    //        $sql = "INSERT INTO role_permission(role_id, permission_id) VALUES ($role_id,$permission_id)";
    //        $st = $this->adapter->query($sql);
    //        $rs = $st->execute();
    //    }

    public function getRole()
    {
        $sql = "SELECT * FROM role where status notnull";
        $st = $this->adapter->query($sql);
        $rs = $st->execute();
        foreach ($rs as $key => $value) {
            $ar_role[$value['rid']] = $value['role_name'];
        }
        return $ar_role;
    }

    public function getPejabat()
    {
        $sql = "SELECT * FROM s_pejabat";
        $st = $this->adapter->query($sql);
        return $st->execute();
    }

    public function getuserdata($user)
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $select->join(array('role' => 'role'), 'role.rid = s_users.s_akses', array('rid', 'role_name'), 'LEFT');
        //        $select->join(array('userRole' => 'user_role'), "userRole.user_id = role.rid", array('role_id'), 'LEFT');
        $where = new \Zend\Db\Sql\Where();
        $where->equalTo("s_username", $user);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res->current();
    }

    public function hapusData($id)
    {
        $this->delete(array('s_iduser' => $id));
        $sql = "DELETE FROM permission_resource WHERE s_iduser=$id";
        $st = $this->adapter->query($sql);
        $st->execute();
    }

    public function getPermission($resource_id)
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('permission');
        $select->order('permission_name', 'asc');
        $where = new \Zend\Db\Sql\Where();
        $where->equalTo("resource_id", $resource_id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function getPermissionAcc()
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('permission');
        $select->order('permission_name', 'asc');
        $where = new \Zend\Db\Sql\Where();
        //        $where->notIn("id", array(
        //            1, 2, 3, 4, 5, 7, 8, 9, 10,
        //            11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        //            21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        //            31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
        //            41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
        //            51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
        //            61, 62, 63, 64, 65, 66, 67, 68
        //        ));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();

        $i = 0;
        $data_array = array();
        foreach ($res as $row) {
            $data_array[$i] = $row['id'];
            $i++;
        }
        return $data_array;
    }

    public function getResourcePermision($id)
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from('permission_resource');
        $where = new \Zend\Db\Sql\Where();
        $where->equalTo("s_iduser", $id);
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        $returnArray = array();
        foreach ($res as $row) {
            $returnArray[] = $row['s_idpermission'];
        }
        return $returnArray;
    }

    public function savepassword(SettingUserBase $sb)
    {
        $data = array(
            's_password' => md5($sb->s_password)
        );
        $this->update($data, array('s_iduser' => $sb->s_iduser));
    }

    public function getjmlpengguna()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->count();
        return $res;
    }

    public function getjmlpenggunatahun()
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new Where();
        $where->literal("extract(year from s_tgldaftar) = '" . date('Y') . "'");
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute()->count();
        return $res;
    }

    public function getDataPermission(SettingUserBase $sb)
    {
        $sql = new Sql($this->adapter);
        $select = $sql->select();
        $select->from("permission");
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function resetpassword($id)
    {
        $newpassword = \Zend\Math\Rand::getString(64, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789', true);
        $this->update(array("s_passwordreset" => $newpassword, "s_passwordresetvalid" => date('Y-m-d H:i:s', strtotime("+15 minutes"))), array("s_iduser" => $id));
        return $newpassword;
    }

    public function getBy($key = array())
    {
        return $this->select($key);
    }

    public function validation($key)
    {
        $sql = new \Zend\Db\Sql\Sql($this->adapter);
        $select = $sql->select();
        $select->from($this->table);
        $where = new \Zend\Db\Sql\Where();
        $where->equalTo("s_passwordreset", $key);
        $where->greaterThanOrEqualTo("s_passwordresetvalid", date('Y-m-d H:i:s'));
        $select->where($where);
        $state = $sql->prepareStatementForSqlObject($select);
        $res = $state->execute();
        return $res;
    }

    public function changepassword($pass, $id)
    {
        $this->update(array("s_password" => md5($pass)), array("s_iduser" => $id));
    }

    public function cekPassOld($pass, $session)
    {
        $rowset = $this->select(array('s_password' => md5($pass), 's_iduser' => $session['s_iduser']));
        $row = $rowset->current();
        return $row;
    }
}
