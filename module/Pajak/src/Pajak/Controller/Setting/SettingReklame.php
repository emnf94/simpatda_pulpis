<?php

namespace Pajak\Controller\Setting;

use Zend\Mvc\Controller\AbstractActionController;

class SettingReklame extends AbstractActionController
{

    public function indexAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $form = new \Pajak\Form\Setting\ReklameFrm();
        $view = new \Zend\View\Model\ViewModel(array('form' => $form));
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
        $req = $this->getRequest();
        $post = $req->getPost();
        $base = new \Pajak\Model\Setting\ReklameBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('ReklameTable')->getGridCount($base, $post);
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
        $data = $this->Tools()->getService('ReklameTable')->getGridData($base, $start, $post);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td><center>" . $counter . "</center></td>";
            $s .= "<td>" . $row['s_namareklamejenis'] . "</td>";
            $s .= "<td>" . $row['s_namakorek'] . "</td>";
            if ($row['s_permanen'] == '1') {
                $permanen = 'Permanen';
            } else {
                $permanen = 'Insidentil';
            }
            $s .= "<td>" . $permanen . "</td>";

            // if ($row['s_kodekawasan'] == '1' || $row['s_kodekawasan'] == "1") {
            //     $kawasan = 'Strategis';
            // } elseif ($row['s_kodekawasan'] == '2' || $row['s_kodekawasan'] == "2") {
            //     $kawasan = 'Sedang';
            // } else {
            //     $kawasan = 'Lainya';
            // }
            // $s .= "<td><center>" . $kawasan . "</center></td>";


            $s .= "<td style='text-align:right;'>" . number_format($row['s_njop'], 0, ',', '.') . "</td>";
            $s .= "<td><center><a href='setting_reklame/edit?s_idreklame=$row[s_idreklamejenis]' class='btn btn-warning btn-xs btn-flat'><i class='glyphicon glyphicon-pencil'></i> Edit</a></center></td>";
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
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        // $frm = new \Pajak\Form\Setting\ReklameFrm($this->populateComboRekening(), $this->comboLokasi());
        $frm = new \Pajak\Form\Setting\ReklameFrm($this->populateComboRekening());
        $req = $this->getRequest();
        if ($req->isPost()) {
            $kb = new \Pajak\Model\Setting\ReklameBase();
            $frm->setInputFilter($kb->getInputFilter());
            $frm->setData($req->getPost());
            if ($frm->isValid()) {
                $kb->exchangeArray($frm->getData());
                $savejenisreklame = $this->Tools()->getService('ReklameTable')->savedata($kb, $session);

                $this->Tools()->getService('ReklameTable')->savestrategis($kb, $savejenisreklame, $session);
                return $this->redirect()->toRoute('setting_reklame');
            }
        }
        $view = new \Zend\View\Model\ViewModel(array(
            "frm" => $frm
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

    public function editAction()
    {
        //$session = new \Zend\Session\Container('user_session');
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        // $frm = new \Pajak\Form\Setting\ReklameFrm($this->populateComboRekening(), $this->comboLokasi());
        $frm = new \Pajak\Form\Setting\ReklameFrm($this->populateComboRekening());
        $req = $this->getRequest();
        if ($req->isGet()) {
            $id = (int) $req->getQuery()->get('s_idreklame');
            $data = $this->Tools()->getService('ReklameTable')->getDataId($id);
            $nilaistrategis = $this->Tools()->getService('ReklameTable')->getDataStrategis($id);
            $data->kawasan1 = number_format($nilaistrategis[0]['s_harga'], 0, ',', '.');
            $data->kawasan2 = number_format($nilaistrategis[1]['s_harga'], 0, ',', '.');
            $data->kawasan3 = number_format($nilaistrategis[2]['s_harga'], 0, ',', '.');
            $data->kawasan4 = number_format($nilaistrategis[3]['s_harga'], 0, ',', '.');
            $data->s_njop = number_format($data->s_njop, 0, ',', '.');
            $frm->bind($data);
        }
        $view = new \Zend\View\Model\ViewModel(array(
            'frm' => $frm
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

    public function hapusAction()
    {
        $this->Tools()->getService('ReklameTable')->hapusData($this->params('page'));
        return $this->getResponse();
    }

    public function populateComboRekening()
    {
        $data = $this->Tools()->getService('RekeningTable')->comboBoxRekening();
        $selectData = array();
        foreach ($data as $row) {
            $selectData[$row['s_idkorek']] = $row['s_namakorek'];
        }
        return $selectData;
    }

    public function comboLokasi()
    {
        $data = $this->Tools()->getService('ReklameTable')->comboKawasan();
        //var_dump($data);exit();
        return $data;
    }

    public function cetakdaftarkecamatanAction()
    {
        /** Cetak Reklame
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $datakecamatan = $this->Tools()->getService('ReklameTable')->getdaftarkecamatan();
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'datakecamatan' => $datakecamatan,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }
}
