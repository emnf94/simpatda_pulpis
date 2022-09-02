<?php

namespace Pajak\Controller\Userman;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Pajak\Form\Pendataan\PendataanFrm;
use Pajak\Model\Pendataan\PendataanBase;
use Zend\Barcode\Barcode;

class Userman extends AbstractActionController
{
    public function indexAction()
    {
        $session = $this->getServiceLocator()->get('PajakService')->getStorage()->read();
        $akses = $session['s_akses'];
        if ($akses == 2) {
            $attachment_location = $_SERVER["DOCUMENT_ROOT"] . "/public/panduan/User_Manual.pdf";
            $attachment_name = "User_Manual.pdf";
        } elseif ($akses == 3) {
            $attachment_location = $_SERVER["DOCUMENT_ROOT"] . "/public/panduan/User_Manual_Pendaftaran_dan_Pendataan.pdf";
            $attachment_name = "User_Manual_Pendaftaran_dan_Pendataan.pdf";
        } elseif ($akses == 6) {
            $attachment_location = $_SERVER["DOCUMENT_ROOT"] . "/public/panduan/User_Manual_Bendahara.pdf";
            $attachment_name = "User_Manual_Bendahara.pdf";
        } elseif ($akses == 5) {
            $attachment_location = $_SERVER["DOCUMENT_ROOT"] . "/public/panduan/User_Manual_Penagihan.pdf";
            $attachment_name = "User_Manual_Penagihan.pdf";
        } elseif ($akses == 8) {
            $attachment_location = $_SERVER["DOCUMENT_ROOT"] . "/public/panduan/User_Manual_Operator.pdf";
            $attachment_name = "User_Manual_Operator.pdf";
        } elseif ($akses == 7) {
            $attachment_location = $_SERVER["DOCUMENT_ROOT"] . "/public/panduan/User_Manual_Pemeriksaan.pdf";
            $attachment_name = "User_Manual_Pemeriksaan.pdf";
        }

        if (file_exists($attachment_location)) {
            header($_SERVER["SERVER_PROTOCOL"] . " 200 OK");
            header("Cache-Control: public"); // needed for internet explorer
            header("Content-Type: pdf");
            header("Content-Transfer-Encoding: Binary");
            header("Content-Length:" . filesize($attachment_location));
            header("Content-Disposition: attachment; filename=.$attachment_name");
            readfile($attachment_location);
            die();
        } else {
            die("Error: File not found.");
        }
    }
}
