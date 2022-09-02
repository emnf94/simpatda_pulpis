<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Setting\PenggunaFrm;
use Pajak\Model\Setting\SettingUserBase;

class SettingUser extends AbstractActionController
{

    public function indexAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $form = new PenggunaFrm($this->Tools()->getService('UserTable')->getRole(), array());
        $view = new ViewModel(array(
            'form' => $form
        ));
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function dataGridAction()
    {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new SettingUserBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('UserTable')->getGridCount($base);
        if ($count > 0 && $limit > 0) {
            $total_pages = ceil($count / $limit);
        } else {
            $total_pages = 0;
        }

        if ($page > $total_pages)
            $page = $total_pages;
        $start = $limit * $page - $limit;
        if ($start < 0)
            $start = 0;
        $data = $this->Tools()->getService('UserTable')->getGridData($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No' style='color:black'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='Username' style='color:black'>" . $row['s_username'] . "</td>";
            $s .= "<td data-title='Nama' style='color:black'>" . $row['s_nama'] . "</td>";
            $s .= "<td data-title='NIK' style='color:black'>" . $row['s_noidentitas'] . "</td>";
            $s .= "<td data-title='NIK' style='color:black'>" . $row['role_name'] . "</td>";
            $s .= "<td data-title='#'><center><a href='setting_user/edit?s_iduser=$row[s_iduser]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Edit</a> <a href='#' onclick='hapus(" . $row['s_iduser'] . ");return false;' class='btn btn-danger btn-xs btn-flat'><i class='glyph-icon icon-trash'></i> Hapus</a></center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "grid" => $s,
            "rows" => $base->rows,
            "count" => $count,
            "page" => $page,
            "start" => $start,
            "total_halaman" => $total_pages,
            "paginatore" => $datapaging['paginatore'],
            "akhirdata" => $datapaging['akhirdata'],
            "awaldata" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function tambahAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        // $s_reklame = $this->getResource(27) + $this->getResource(35) + $this->getResource(36) + $this->getResource(37) + $this->getResource(38) + $this->getResource(39) + $this->getResource(40) + $this->getResource(41);
        $frm = new PenggunaFrm($this->Tools()->getService('UserTable')->getRole(), $this->Tools()->getService('PendaftaranTable')->getAllWp());
        // , $this->getResource(2), $this->getResource(3), $this->getResource(4), $this->getResource(5)
        // , $this->getResource(6), $this->getResource(7), $this->getResource(8), $this->getResource(9), $this->getResource(10)
        // , $this->getResource(11), $this->getResource(12), $this->getResource(13), $this->getResource(14), $this->getResource(15)
        // , $this->getResource(16), $this->getResource(17), $this->getResource(19), $this->getResource(20)
        // , $this->getResource(21), $this->getResource(22), $this->getResource(23), $this->getResource(24), $this->getResource(25)
        // , $this->getResource(26), $s_reklame, $this->getResource(28), $this->getResource(29), $this->getResource(30)
        // , $this->getResource(31), $this->getResource(32), $this->getResource(33), $this->getResource(34));
        $req = $this->getRequest();
        if ($req->isPost()) {
            $bs = new SettingUserBase();
            $frm->setInputFilter($bs->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $bs->exchangeArray($frm->getData());
                $post = $req->getPost();
                if ($post->s_akses == 1) {
                    $this->Tools()->getService('ObjekTable')->saveDataKorek($post);
                }
                $data = $this->Tools()->getService('UserTable')->saveData($bs);
                $this->Tools()->getService('UserTable')->deleteResourcePermision($data->s_iduser);
                // $bs->s_akses = array_merge((array) $bs->s_main, (array) $bs->s_laporan);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pendaftaran);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pendataan);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_penetapan);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_skpdjabatan);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_skpdkb);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_skpdkbt);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_skpdlb);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_skpdn);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_skpdt);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pembayaran);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pembayarandenda);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_rekambank);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_penagihan);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pemeriksaan);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pembukuan);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_stpdpembayaran);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_monitoring);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pemda);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_user);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_kelurahan);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pejabat);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_kecamatan);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_rekening);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_target);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_reklame);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_air);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_perizinan);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pratama);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_laporanbendahara);
                // $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_setoranlain);
                $akses = $this->Tools()->getService('UserTable')->CariAkses($post->s_akses);
                foreach ($akses as $row => $rw) {
                    $this->Tools()->getService('UserTable')->saveresourcepermission($data->s_iduser, $rw['id']);
                }
                return $this->redirect()->toRoute('setting_user');
            } else {
                // $msg = $frm->getMessages();
                // var_dump($msg);
                // exit();
            }
        }
        $view = new ViewModel(array(
            'frm' => $frm,
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function editAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_iduser');
            $data = $this->Tools()->getService('UserTable')->getUserId($id);
            $data_role = $this->Tools()->getService('UserTable')->getResourcePermision($id);
            $data->s_password = '';
            $data->s_nip = $data->s_noidentitas;
            $s_reklame = $this->getResource(27) + $this->getResource(35) + $this->getResource(36) + $this->getResource(37) + $this->getResource(38) + $this->getResource(39) + $this->getResource(40) + $this->getResource(41);
            $frm = new PenggunaFrm(
                $this->Tools()->getService('UserTable')->getRole(),
                $this->Tools()->getService('PendaftaranTable')->getAllWp(),
                $this->getResource(2),
                $this->getResource(3),
                $this->getResource(4),
                $this->getResource(5),
                $this->getResource(6),
                $this->getResource(7),
                $this->getResource(8),
                $this->getResource(9),
                $this->getResource(10),
                $this->getResource(11),
                $this->getResource(12),
                $this->getResource(13),
                $this->getResource(14),
                $this->getResource(15),
                $this->getResource(16),
                $this->getResource(17),
                $this->getResource(19),
                $this->getResource(20),
                $this->getResource(21),
                $this->getResource(22),
                $this->getResource(23),
                $this->getResource(24),
                $this->getResource(25),
                $this->getResource(26),
                $s_reklame,
                $this->getResource(28),
                $this->getResource(29),
                $this->getResource(30),
                $this->getResource(31),
                $this->getResource(32),
                $this->getResource(33),
                $this->getResource(34)
            );
            $frm->bind($data);
            $jsonrole = \Zend\Json\Json::encode($data_role);
            $frm->get("s_main")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_laporan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pendaftaran")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pendataan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_penetapan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_skpdjabatan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_skpdkb")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_skpdkbt")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_skpdlb")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_skpdn")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_skpdt")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pembayaran")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pembayarandenda")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_rekambank")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_setoranlain")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_penagihan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pemeriksaan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pembukuan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_stpdpembayaran")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_monitoring")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pemda")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_user")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_kelurahan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pejabat")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_kecamatan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_rekening")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_target")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_reklame")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_air")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_perizinan")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_pratama")->setValue(\Zend\Json\Json::decode($jsonrole));
            $frm->get("s_laporanbendahara")->setValue(\Zend\Json\Json::decode($jsonrole));
        }
        if ($data->s_akses == 1) {
            $idwp = $data->s_wp;
        } else {
            $idwp = null;
        }
        if ($data->s_akses == 1) {
            $displaywp = 'block';
            $displayadmin = 'none';
            $displayoperator = 'none';
            $displaydpm = 'none';
            $displaykpp = 'none';
            $displaybendaharadin = 'none';
        } elseif ($data->s_akses == 2) {
            $displaywp = 'none';
            $displayadmin = 'block';
            $displayoperator = 'block';
            $displaydpm = 'none';
            $displaykpp = 'none';
            $displaybendaharadin = 'none';
        } elseif ($data->s_akses == 3) {
            $displaywp = 'none';
            $displayadmin = 'none';
            $displayoperator = 'block';
            $displaydpm = 'none';
            $displaykpp = 'none';
            $displaybendaharadin = 'none';
        } elseif ($data->s_akses == 4) {
            $displaywp = 'none';
            $displayadmin = 'none';
            $displayoperator = 'none';
            $displaydpm = 'block';
            $displaykpp = 'none';
            $displaybendaharadin = 'none';
        } elseif ($data->s_akses == 5) {
            $displaywp = 'none';
            $displayadmin = 'none';
            $displayoperator = 'none';
            $displaydpm = 'none';
            $displaykpp = 'block';
            $displaybendaharadin = 'none';
        } elseif ($data->s_akses == 6) {
            $displaywp = 'none';
            $displayadmin = 'none';
            $displayoperator = 'none';
            $displaydpm = 'none';
            $displaykpp = 'none';
            $displaybendaharadin = 'block';
        } elseif ($data->s_akses == 12) {
            $displaywp = 'none';
            $displayadmin = 'block';
            $displayoperator = 'block';
            $displaydpm = 'none';
            $displaykpp = 'none';
            $displaybendaharadin = 'none';
        }
        $view = new ViewModel(array(
            'frm' => $frm,
            'idwp' => $idwp,
            'displaywp' => $displaywp,
            'displayadmin' => $displayadmin,
            'displayoperator' => $displayoperator,
            'displaydpm' => $displaydpm,
            'displaykpp' => $displaykpp,
            'displaybendaharadin' => $displaybendaharadin
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $data = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($data);
        return $view;
    }

    public function hapusAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $this->Tools()->getService('UserTable')->hapusData($this->params('page'), $session);
        return $this->getResponse();
    }

    public function ubahpassbackAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $data = $this->Tools()->getService('UserTable')->getUserId($session['s_iduser']);
        //        var_dump($data);
        //        exit();
        $frm = new PenggunaFrm();
        $frm->bind($data);
        if ($this->getRequest()->isPost()) {
            $bs = new SettingUserBase();
            $frm2 = new PenggunaFrm();
            $frm2->setInputFilter($bs->getInputFilter());
            $frm2->setData($this->getRequest()->getPost());
            if ($frm2->isValid()) {
                $bs->exchangeArray($frm2->getData());
                $this->Tools()->getService('UserTable')->savepassword($bs);
            }
        }
        $view = new ViewModel(array(
            'frm' => $frm,
            //            'datauser' => $session
        ));
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $dataobjek = $this->Tools()->getService('RekeningTable')->getdataJenisObjek();
        $recordspajak = array();
        foreach ($dataobjek as $dataobjek) {
            $recordspajak[] = $dataobjek;
        }
        $datane = array(
            'data_pemda' => $ar_pemda,
            'datauser' => $session,
            'dataobjek' => $recordspajak
        );
        $this->layout()->setVariables($datane);
        return $view;
    }

    private function getPejabat()
    {
        $data = $this->Tools()->getService('UserTable')->getPejabat();
        $html = "<option value=''>Silahkan Pilih</option>";
        foreach ($data as $row) {
            $html .= "<option value='" . $row['s_idpejabat'] . "'>" . $row['s_namapejabat'] . " - " . $row['s_jabatanpejabat'] . "</option>";
        }
        return $html;
    }

    private function getResource($resourceid)
    {
        $data = $this->Tools()->getService('UserTable')->getPermission($resourceid);
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['id']] = ' ' . ucwords($row['alias']);
        }
        return $selectData;
    }

    public function cariobjekwpAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataobjek = $this->Tools()->getService('ObjekTable')->getDataObjekKorek($data_get['idwp']);
        $html = "";
        $html .= "<div class='col-md-12'>
                    <div class='scroll-columns'>
                        <table class='table table-bordered table-striped table-condensed cf' style='font-size:11px; color: black'>
                            <thead class='cf'>
                                <tr>
                                    <th style='background-color: #00BCA4; color: white; text-align:center'>No.</th>
                                    <th style='background-color: #00BCA4; color: white; text-align:center'>NIOP</th>
                                    <th style='background-color: #00BCA4; color: white; text-align:center'>Nama</th>
                                    <th style='background-color: #00BCA4; color: white; text-align:center'>Jenis</th>
                                    <th style='background-color: #00BCA4; color: white; text-align:center'>Alamat</th>
                                    <th style='background-color: #00BCA4; color: white; text-align:center'>Kode Rekening</th>
                                    <th style='background-color: #00BCA4; color: white; text-align:center'>#</th>
                                </tr>
                            </thead>
                            <tbody>";
        $counter = 1;
        foreach ($dataobjek as $row) {
            if ($row['t_jenisobjek'] == 1 || $row['t_jenisobjek'] == 2 || $row['t_jenisobjek'] == 3 || $row['t_jenisobjek'] == 6 || $row['t_jenisobjek'] == 7) {
                $html .= "<tr>
                                        <td><center>" . $counter . "<input type='hidden' name='t_idobjek[]' id='t_idobjek' value='" . $row['t_idobjek'] . "'></center></td>
                                        <td style='color:red; font-size:12px; font-weight:bold'><center>" . $row['t_nop'] . "</center></td>
                                        <td>" . $row['t_namaobjek'] . "</td>
                                        <td>" . $row['s_namajenis'] . "</td>
                                        <td>" . $row['t_alamatobjek'] . "</td>
                                        <td><input type='hidden' name='t_idkorek[]' id='t_idkorek" . $row['t_idobjek'] . "' value='" . $row['t_korekobjek'] . "'><input type='text' name='t_korek[]' id='t_korek" . $row['t_idobjek'] . "' class='form-control' readonly='true' value='" . $row['korek'] . " || " . $row['s_namakorek'] . "'></td>
                                        <td style='text-align: center'><button class='btn btn-warning btn-xs' type='button' onclick='bukamodalRekening(" . $row['t_jenisobjek'] . "," . $row['t_idobjek'] . ")'><span class='glyph-icon icon-search'></span></button></td>
                                    </tr>";
                $counter++;
            }
        }
        $html .= "</tbody>
                        </table>
                    </div>
                </div>";
        $data = array(
            'dataobjek' => $html
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function dataGridRekeningAction()
    {
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $req = $this->getRequest();
        $req->isGet();
        $parametercari = $req->getQuery();
        $base = new \Pajak\Model\Setting\RekeningBase();
        $base->exchangeArray($allParams);
        $count = $this->Tools()->getService('RekeningTable')->getGridCountRekeningUser($base, $parametercari);
        $s = "";
        $data = $this->Tools()->getService('RekeningTable')->getGridDataRekeningUser($base, $parametercari);
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td>" . $row['korek'] . "</td>";
            $s .= "<td>" . $row['s_namakorek'] . "</td>";
            $s .= "<td>" . $row['s_persentarifkorek'] . "</td>";
            $s .= "<td><center><a href='#' onclick='pilihRekening(" . $row['s_idkorek'] . "," . $parametercari->t_idobjek . ");return false;' class='btn btn-xs btn-primary'><span class='glyph-icon icon-hand-o-up'> Pilih </a></center></td>";
            $s .= "</tr>";
        }
        $data_render = array(
            "grid" => $s,
            "count" => $count,
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function pilihRekeningAction()
    {
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $dataRekening = $this->Tools()->getService('RekeningTable')->getDataRekeningId($data_get['s_idkorek']);
        $data = array(
            't_idkorek' => $dataRekening['s_idkorek'],
            't_korek' => $dataRekening['korek'] . " || " . $dataRekening['s_namakorek']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data));
    }

    public function validasipassAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $pass_lama = $this->Tools()->getService('UserTable')->cekPassOld($data_get['t_password_old'], $session);
        if (empty($pass_lama)) {
            $pesan_passlama = 'Password Lama Salah!';
            $field_passlama = '';
        } else {
            $pesan_passlama = '';
            $field_passlama = $data_get['t_password_old'];
        }

        if ($data_get['s_password'] == $data_get['t_pass2']) {
            $pesan_passbaru = '';
            $field_passbaru = $data_get['s_password'];
            $field_passbaru2 = $data_get['t_pass2'];
        } else {
            $pesan_passbaru = 'Password Baru & Ulangi Password Baru tidak sama!';
            $field_passbaru = '';
            $field_passbaru2 = '';
        }
        $data_render = array(
            "pesan_passlama" => $pesan_passlama,
            "field_passlama" => $field_passlama,
            "pesan_passbaru" => $pesan_passbaru,
            "field_passbaru" => $field_passbaru,
            "field_passbaru2" => $field_passbaru2
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }
}
