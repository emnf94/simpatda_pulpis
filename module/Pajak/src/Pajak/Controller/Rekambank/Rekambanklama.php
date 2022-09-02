<?php

namespace Pajak\Controller\Rekambank;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Rekambank\RekambankFrm;
use Pajak\Model\Rekambank\RekambankBase;

class Rekambank extends AbstractActionController {

    public function indexAction() {
        $req = $this->getRequest();
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $form = new \Pajak\Form\Pendaftaran\PendaftaranFrm($this->Tools()->getService('PendaftaranTable')->getcomboIdKecamatan(), null);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_ttd0 = $this->Tools()->getService('PejabatTable')->getdata();
        $ar_pejabat = $this->Tools()->getService('PejabatTable')->getdata();
        $recordspejabat = array();
        foreach ($ar_pejabat as $ar_pejabat) {
            $recordspejabat[] = $ar_pejabat;
        }
        $view = new ViewModel(array(
            'form' => $form,
            'ar_pejabat' => $recordspejabat,
            'ar_ttd0' => $ar_ttd0
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

    public function datagridsetoranAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $allParams = (array) $this->getEvent()->getRouteMatch()->getParams();
        $base = new RekambankBase();
        $base->exchangeArray($allParams);
        if ($base->direction != 'undefined') {
            $base->page = $base->direction;
        }
        $page = $base->page;
        $limit = $base->rows;
        $count = $this->Tools()->getService('RekambankTable')->getGridCountSetoran($base);
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
        $data = $this->Tools()->getService('RekambankTable')->getGridDataSetoran($base, $start);
        $s = "";
        $counter = 1 + ($base->page * $base->rows) - $base->rows;
        if ($counter <= 1) {
            $counter = 1;
        }
        foreach ($data as $row) {
            $s .= "<tr>";
            $s .= "<td data-title='No'><center>" . $counter . "</center></td>";
            $s .= "<td data-title='No. Setoran'><center>" . $row['t_nosbh'] . "</center></td>";
            $s .= "<td data-title='Tgl. Setoran'><center>" . date('d-m-Y', strtotime($row['t_tglsbh'])) . "</center></td>";
            $s .= "<td data-title='jml. Setoran' style='text-align: right'>" . number_format($row['t_jmlhsetoran'], 0, ',', '.') . "</td>";
            $hapus = "";
            $operator = "";
            if ($session['s_akses'] == 2) {
                $hapus = "<a href='#' onclick='hapus(" . $row['t_idsbh'] . ");return false;' class='btn btn-danger btn-xs' title='Hapus'><i class='glyph-icon icon-trash'></i></a>";
                $operator = $row['s_nama'];
            }
            $s .= "<td data-title='#'><center><a href='#' class='btn btn-primary btn-xs' onclick='bukaCetakSTS($row[t_idsbh])' title='Cetak Surat Tanda Setoran'><i class='glyph-icon icon-print'></i> STS</a> <a href='rekambank/form_setoran?t_idsbh=$row[t_idsbh]' class='btn btn-warning btn-xs btn-flat'><i class='glyph-icon icon-pencil'></i> Edit</a> $hapus <br>$operator</center></td>";
            $s .= "</tr>";
            $counter++;
        }
        $datapaginge = new \Pajak\Controller\Plugin\Paginator();
        $datapaging = $datapaginge->paginator($base->rows, $count, $page, $total_pages, $start);
        $data_render = array(
            "gridbelum" => $s,
            "rowsbelum" => $base->rows,
            "countbelum" => $count,
            "pagebelum" => $page,
            "startbelum" => $start,
            "total_halamanbelum" => $total_pages,
            "paginatorebelum" => $datapaging['paginatore'],
            "akhirdatabelum" => $datapaging['akhirdata'],
            "awaldatabelum" => $datapaging['awaldata']
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function FormSetoranAction() {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $req = $this->getRequest();
        $form = new RekambankFrm();
        if ($this->getRequest()->isGet()) {
            $datarekambank = $this->Tools()->getService('RekambankTable')->getRekambankId($req->getQuery()->t_idsbh);
            if ($req->getQuery()->t_idsbh != NULL):
                $form->bind($datarekambank);
                $form->get('t_tglsbh')->setValue(date('d-m-Y',strtotime($datarekambank->t_tglsbh)));
            endif;
        }
        if ($this->getRequest()->isPost()) {
            $base = new RekambankBase();
            $form->setInputFilter($base->getInputFilter());
            $post = $req->getPost()->toArray();
            $form->setData($post);
            if ($form->isValid()) {
                $base->exchangeArray($form->getData());
                $data = $this->Tools()->getService('RekambankTable')->simpansetoranheader($base, $session, $post);
                for ($i = 1; $i <= count($post['t_idkorek']); $i++) {
                    $data['t_idsbd'] = $post['t_idsbd'][$i];
                    $this->Tools()->getService('RekambankTable')->simpansetorandetail($data, $post['t_idkorek'][$i], $post['t_jmlhskbd'][$i], $post['t_idtransaksi'][$i]);
                }

                return $this->redirect()->toRoute('rekambank');
            }
        }
        $view = new ViewModel(array(
            'form' => $form
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

    public function carisetoranAction() {
        /** Mendapatkan Data Setoran Ke Bendahara
         * @param date Tanggal Setoran
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 14/01/2017
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data_pokok = $this->Tools()->getService('RekambankTable')->carisetoranpokok($data_get['t_tglsbh']);
        $data_denda = $this->Tools()->getService('RekambankTable')->carisetorandenda($data_get['t_tglsbh']);

        $datarekambankdetail = $this->Tools()->getService('RekambankTable')->getRekambankDetailTgl($data_get['t_tglsbh']);
        $rinciansetoran = "";

        $rinciansetoran .= "<div class='col-md-12'>
                                <div class='scroll-columns'>
                                    <table class='table table-bordered table-striped table-condensed cf' style='font-size:11px; color: black'>
                                        <thead class='cf'>
                                            <tr>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>No.</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Kode Rekening</th>
                                                <th style='background-color: #00BCA4; color: white; text-align:center'>Jumlah</th>
                                            </tr>
                                        </thead>
                                        <tbody>";
        $total = 0;
        if ($datarekambankdetail->count() > 0):
            $datarekambank = $this->Tools()->getService('RekambankTable')->getRekambankTgl($data_get['t_tglsbh']);
            $i = 1;
            foreach ($datarekambankdetail as $row):
                $rinciansetoran .= "<tr>";
                $rinciansetoran .= "<td style='text-align:center'>" . $i . "</td>";
                $rinciansetoran .= "<td><input type='hidden' name='t_idsbd[" . $i . "]' value='" . $row['t_idsbd'] . "'><input type='hidden' name='t_idkorek[" . $i . "]' value='" . $row['t_idkoreksbd'] . "'>" . $row['korek'] . " || " . $row['s_namakorek'] . "</td>";
                $rinciansetoran .= "<td> <input type='text' class='form-control' name='t_jmlhskbd[" . $i . "]' value='" . number_format($row['t_jmlhsbd'], 0, ',', '.') . "' readonly='true' style='text-align:right;'></td>";
                $rinciansetoran .= "</tr>";
                $total += $row['t_jmlhsbd'];
                $i++;
            endforeach;
        else:
            $i = 1;
            foreach ($data_pokok as $row) {
                $rinciansetoran .= "<tr>";
                $rinciansetoran .= "<td style='text-align:center'>" . $i . "</td>";
                $rinciansetoran .= "<td><input type='hidden' name='t_idtransaksi[" . $i . "]' value='" . $row['t_idtransaksi'] . "'>" . "<input type='hidden' name='t_idkorek[" . $i . "]' value='" . $row['t_idkorek'] . "'>" . $row['korek'] . " || " . $row['s_namakorek'] . "</td>";
                $rinciansetoran .= "<td> <input type='text' class='form-control' name='t_jmlhskbd[" . $i . "]' value='" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "' readonly='true' style='text-align:right'></td>";
                $rinciansetoran .= "</tr>";
                $total += $row['t_jmlhpembayaran'];
                $i++;
            }

            foreach ($data_denda as $row) {
                if ($row['t_jmlhpembayaran'] == 0) {
                    # code...
                } else {
                    # code...
                
                    $rinciansetoran .= "<tr>";
                    $rinciansetoran .= "<td style='text-align:center'>" . $i . "</td>";
                    $rinciansetoran .= "<td><input type='hidden' name='t_idtransaksi[" . $i . "]' value='" . $row['t_idtransaksi'] . "'>" . "<input type='hidden' name='t_idkorek[" . $i . "]' value='" . $row['t_idkorek'] . "'>" . $row['korek'] . " || " . $row['s_namakorek'] . "</td>";
                    $rinciansetoran .= "<td> <input type='text' class='form-control' name='t_jmlhskbd[" . $i . "]' value='" . number_format($row['t_jmlhpembayaran'], 0, ',', '.') . "' readonly='true' style='text-align:right'></td>";
                    $rinciansetoran .= "</tr>";
                    $total += $row['t_jmlhpembayaran'];
                    $i++;
                }
            }
        endif;

        $rinciansetoran .= "<tr>";
        $rinciansetoran .= "<td style='text-align:center;font-size:12pt;' colspan='2'><b>Jumlah (Rp.)</b></td>";
        $rinciansetoran .= "<td style='text-align:right;'> <input type='text' class='form-control' name='t_jmlhskbh' value='" . number_format($total, 0, ',', '.') . "' readonly='true' style='text-align:right;font-size:12pt;font-weight:bold;'></td>";
        $rinciansetoran .= "</tr>";
        $rinciansetoran .= "            </tbody>
                                </table>
                            </div>
                        </div>";
        $data_render = array(
            "rinciansetoran" => $rinciansetoran,
            "existingdata" => $datarekambank,
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function hapusAction() {
        /** Hapus Rekambank
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $post = $this->getRequest()->getPost();
        $this->Tools()->getService('RekambankTable')->hapusRekambank($post->t_idsbh, $session);
        return $this->getResponse();
    }
    public function ceknosbhAction() {
        /** Cek No SBH
         * @param int $page
         * @author Abdul Aziz Nur Farhana <abaz.nurfarhana@gmail.com>
         * @date 3/08/2017
         */
        $data_get = $this->getRequest()->getPost();
        $datarekambank = $this->Tools()->getService('RekambankTable')->getRekambankNo($data_get->t_nosbh, $data_get->t_tglsbh);
        $return = [
          'count' => (int)$datarekambank,  
        ];
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($return));
    }

    public function cetakregisterstsAction() {
        /** Cetak Rekambank
         * @param string $tglcetak Tanggal Mencetak Dokumen
         * @param date('d-m-Y') $tglbayar0 Tanggal Minimal Rekambank
         * @param date('d-m-Y') $tglbayar1 Tanggal Maximal Rekambank
         * @param int $t_kecamatan 
         * @param int $t_kelurahan  
         * @param int $t_idkorek
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 04/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        $data = $this->Tools()->getService('RekambankTable')->getDataRekambank($data_get->tahun, $data_get->bulan);
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'data' => $data,
            'bulan' => $data_get->bulan,
            'tahun' => $data_get->tahun,
            'tglcetak' => $data_get->tglcetak,
            'ar_pemda' => $ar_pemda
        ));
        $pdf->setOption("paperSize", "legal-L");
        return $pdf;
    }

    public function dataRekambankAction() {
        /** Mendapatkan Data Rekambank
         * @param int $page
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 05/11/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getPost();
        $data = $this->Tools()->getService('RekambankTable')->getDataRekambankIDHeader($data_get['t_idsbh']);
        $data_render = array(
            "idsbh" => $data['t_idsbh'],
        );
        return $this->getResponse()->setContent(\Zend\Json\Json::encode($data_render));
    }

    public function cetakstsAction() {
        /** Cetak Kode Bayar
         * @param int $t_idwp
         * @author Miftahul Huda <miftahul06@gmail.com>
         * @date 02/01/2016
         */
        $req = $this->getRequest();
        $data_get = $req->getQuery();
        // Mengambil Data Header
        $dataheader = $this->Tools()->getService('RekambankTable')->getDataRekambankIDHeader($data_get['idsbh']);
        // Mengambil Data Detail
        $datadetail = $this->Tools()->getService('RekambankTable')->getDataRekambankIDDetail($data_get['idsbh']);

        $recordsdetail = array();
        foreach ($datadetail as $datadetail) {
            $recordsdetail[] = $datadetail;
        }

        $jmlhsetoran = 0;
        foreach ($recordsdetail as $row) {
            $jmlhsetoran += $row['t_jmlhsbd'];
        }

        // Mengambil Data Pemda
        $ar_pemda = $this->Tools()->getService('PemdaTable')->getdata();
        $ar_mengetahui = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['mengetahuists']);
        $ar_diperiksa = $this->Tools()->getService('PejabatTable')->getPejabatId($data_get['diperiksasts']);
        $pdf = new \LosPdf\View\Model\PdfModel();
        $pdf->setVariables(array(
            'dataheader' => $dataheader,
            'datadetail' => $recordsdetail,
            'jmlhsetorannya' => $jmlhsetoran,
            'ar_pemda' => $ar_pemda,
            'ar_mengetahui' => $ar_mengetahui,
            'ar_diperiksa' => $ar_diperiksa,
        ));
        $pdf->setOption("paperSize", "potrait");
        return $pdf;
    }

}
