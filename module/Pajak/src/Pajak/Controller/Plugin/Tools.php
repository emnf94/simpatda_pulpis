<?php

namespace Pajak\Controller\Plugin;

use Zend\Mvc\Controller\Plugin\AbstractPlugin;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * Tools that could be accessed by all of your controllers
 * Add your repetitive functions or methods here, so you can access it easily
 * @author farhan
 */
class Tools extends AbstractPlugin implements ServiceLocatorAwareInterface {

    protected $service;

    public function getServiceLocator() {
        return $this->serviceLocator;
    }

    public function setServiceLocator(ServiceLocatorInterface $serviceLocator) {
        $this->serviceLocator = $serviceLocator;
    }

    /**
     *  Function to access your predefined service in Module
     */
    public function getService($serviceName) {
        $this->service = $this->getServiceLocator()->getServiceLocator()->get($serviceName);
        return $this->service;
    }

    /**
     * $date:date string to be formatted
     * $type:format output
     * $type: 0 (dd-mm-yyyy) ex: 20-04-2016
     *        1 (dd MM yyyy) ex: 20 April 2016
     *        2 (MM)         ex: April
     */
    public function dateFormat($date, $type) {

        $bulan = [null, "Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"];
        $tgl = explode('-', $date);
        switch ($type) {
            case 0:
                $hasil = date('d-m-Y', strtotime($date));
                break;
            case 1:
                $hasil = $tgl[2] . " " . $bulan[(int) $tgl[1]] . " " . $tgl[0];
                break;
            case 2:
                $hasil = $bulan[(int) $tgl[1]];
                break;
            default:
                $hasil = $date;
                break;
        }

        return $hasil;
    }

    public function kekata($x) {
        $x = abs($x);
        $angka = array("", "Satu", "Dua", "Tiga", "Empat", "Lima",
            "Enam", "Tujuh", "Delapan", "Sembilan", "Sepuluh", "Sebelas");
        $temp = "";
        if ($x < 12) {
            $temp = " " . $angka[$x];
        } else if ($x < 20) {
            $temp = $this->kekata($x - 10) . " Belas";
        } else if ($x < 100) {
            $temp = $this->kekata($x / 10) . " Puluh" . $this->kekata($x % 10);
        } else if ($x < 200) {
            $temp = " Seratus" . $this->kekata($x - 100);
        } else if ($x < 1000) {
            $temp = $this->kekata($x / 100) . " Ratus" . $this->kekata($x % 100);
        } else if ($x < 2000) {
            $temp = " Seribu" . $this->kekata($x - 1000);
        } else if ($x < 1000000) {
            $temp = $this->kekata($x / 1000) . " Ribu" . $this->kekata($x % 1000);
        } else if ($x < 1000000000) {
            $temp = $this->kekata($x / 1000000) . " Juta" . $this->kekata($x % 1000000);
        } else if ($x < 1000000000000) {
            $temp = $this->kekata($x / 1000000000) . " Milyar" . $this->kekata(fmod($x, 1000000000));
        } else if ($x < 1000000000000000) {
            $temp = $this->kekata($x / 1000000000000) . " Trilyun" . $this->kekata(fmod($x, 1000000000000));
        }
        return $temp;
    }

    public function terbilang($x, $style = 4) {
        if ($x < 0) {
            $hasil = "MINUS " . trim($this->kekata($x));
        } else {
            $hasil = trim($this->kekata($x));
        }
        switch ($style) {
            case 1:
                $hasil = strtoupper($hasil);
                break;
            case 2:
                $hasil = strtolower($hasil);
                break;
            case 3:
                $hasil = ucwords($hasil);
                break;
            default:
                $hasil = ucfirst($hasil);
                break;
        }
        return $hasil;
    }

    public function getSession() {
        return $this->getService("Sessi_Manager")->getStorage();
    }

    /**
     * Fungsi ini digunakan untuk mendapatkan daftar semua aksi yg dimiliki controller
     * @param type $classInstance masukkan instance dari class 
     * @return type array[]
     */
    public function getPermissions($classInstance) {
        // daftar method dari class yg diinginkan
        $methods = get_class_methods($classInstance);
        // daftar method yg tidak termasuk action
        $excludeMethods = array(
            "getMethodFromAction",
            "notFoundAction",
            "onDispatch",
            "dispatch",
            "getRequest",
            "getResponse",
            "setEventManager",
            "getEventManager",
            "setEvent",
            "getEvent",
            "setServiceLocator",
            "getServiceLocator",
            "getPluginManager",
            "setPluginManager",
            "plugin",
            "__call"
        );
        //hapus method built-in dari controller
        foreach ($excludeMethods as $key => $value) {
            if (($key = array_search($value, $methods)) !== false) {
                unset($methods[$key]);
            }
        }
        //hapus kata 'Action' dari method
        foreach ($methods as $key => $value) {
            $methods[$key] = str_replace('Action', '', $value);
        }

        return $methods;
    }

    public function getResources() {
        $resources = $this->getService("Config")["controllers"]["invokables"];
        $searchword = 'Pajak';
        $exeption = 'AclManager';
        foreach ($resources as $k => $v) {
            if (!preg_match("/\b$searchword\b/i", $v) || preg_match("/\b$exeption\b/i", $v)) {
                unset($resources[$k]);
            }
        }
        return $resources;
    }

    public function getBasePath() {
        $server = $this->getService('ViewHelperManager')->get('serverUrl');
        $base = $this->getService('ViewHelperManager')->get('basePath');
        return $server('') . $base('/');
    }

}
