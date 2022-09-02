<?php

// This app creted by : Miftahul Huda (miftahul06@gmail.com)

namespace Pajak;

use Zend\ModuleManager\Feature\AutoloaderProviderInterface;
use Zend\Authentication\AuthenticationService;
use Zend\Authentication\Adapter\DbTable as DbTableAuthAdapter;
use Zend\Mvc\MvcEvent;
use Zend\Session\SessionManager;

class Module implements AutoloaderProviderInterface
{

    // Common Code
    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\ClassMapAutoloader' => array(
                __DIR__ . '/autoload_classmap.php'
            ),
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__
                )
            )
        );
    }

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    // Custom Code
    public function getServiceConfig()
    {
        return array(
            'factories' => array(
                'UserTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\SettingUserTable($dbAdapter);
                    return $table;
                },
                'LaporanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Laporan\LaporanTable($dbAdapter);
                    return $table;
                },
                'LaporanbendaharaTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Laporanbendahara\LaporanbendaharaTable($dbAdapter);
                    return $table;
                },
                'PendaftaranTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendaftaran\PendaftaranTable($dbAdapter);
                    return $table;
                },
                'ObjekTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendaftaran\ObjekTable($dbAdapter);
                    return $table;
                },
                'PenggabunganopTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendaftaran\PenggabunganopTable($dbAdapter);
                    return $table;
                },
                'PenutupanwpTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendaftaran\PenutupanwpTable($dbAdapter);
                    return $table;
                },
                'PendataanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\PendataanTable($dbAdapter);
                    return $table;
                },
                'TeguranTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\TeguranTable($dbAdapter);
                    return $table;
                },
                'DetailreklameTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailreklameTable($dbAdapter);
                    return $table;
                },
                'DetailparkirTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailparkirTable($dbAdapter);
                    return $table;
                },
                'DetailminerbaTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailminerbaTable($dbAdapter);
                    return $table;
                },
                'DetailairTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailairTable($dbAdapter);
                    return $table;
                },
                'DetailPpjTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailPpjTable($dbAdapter);
                    return $table;
                },
                'LampiranPpjTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\LampiranPpjTable($dbAdapter);
                    return $table;
                },
                'DetailretribusiTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailretribusiTable($dbAdapter);
                    return $table;
                },
                'DetailparkirtepiTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailparkirtepiTable($dbAdapter);
                    return $table;
                },
                'DetailterminalTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailterminalTable($dbAdapter);
                    return $table;
                },
                'DetailhoTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailhoTable($dbAdapter);
                    return $table;
                },
                'DetailimbTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailimbTable($dbAdapter);
                    return $table;
                },
                'DetailperikananTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailperikananTable($dbAdapter);
                    return $table;
                },
                'DetailkirTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailkirTable($dbAdapter);
                    return $table;
                },
                'DetailtrayekTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailtrayekTable($dbAdapter);
                    return $table;
                },
                'DetailkebersihanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailkebersihanTable($dbAdapter);
                    return $table;
                },
                'DetailpasarTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailpasarTable($dbAdapter);
                    return $table;
                },
                'DetailpasargrosirTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailpasargrosirTable($dbAdapter);
                    return $table;
                },
                'DetailtempatparkirTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailtempatparkirTable($dbAdapter);
                    return $table;
                },
                'DetailteraTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailteraTable($dbAdapter);
                    return $table;
                },
                'DetailmenaraTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailmenaraTable($dbAdapter);
                    return $table;
                },
                'DetailpemadamTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailpemadamTable($dbAdapter);
                    return $table;
                },
                'DetailkekayaanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailkekayaanTable($dbAdapter);
                    return $table;
                },
                'DetailrumahdinasTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailrumahdinasTable($dbAdapter);
                    return $table;
                },
                'DetailpanggungreklameTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailpanggungreklameTable($dbAdapter);
                    return $table;
                },
                'DetailtanahreklameTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailtanahreklameTable($dbAdapter);
                    return $table;
                },
                'DetailtanahlainTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailtanahlainTable($dbAdapter);
                    return $table;
                },
                'DetailgedungTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pendataan\DetailgedungTable($dbAdapter);
                    return $table;
                },
                'PenetapanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Penetapan\PenetapanTable($dbAdapter);
                    return $table;
                },
                'SkpdkbTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Skpdkb\SkpdkbTable($dbAdapter);
                    return $table;
                },
                'SkpdkbtTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Skpdkbt\SkpdkbtTable($dbAdapter);
                    return $table;
                },
                'SkpdlbTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Skpdlb\SkpdlbTable($dbAdapter);
                    return $table;
                },
                'SkpdnTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Skpdn\SkpdnTable($dbAdapter);
                    return $table;
                },
                'SkpdtTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Skpdt\SkpdtTable($dbAdapter);
                    return $table;
                },
                'PembayaranTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pembayaran\PembayaranTable($dbAdapter);
                    return $table;
                },
                'SetoranlainTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pembayaran\SetoranlainTable($dbAdapter);
                    return $table;
                },
                'PembayarandendaTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pembayaran\PembayarandendaTable($dbAdapter);
                    return $table;
                },
                'RekambankTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Rekambank\RekambankTable($dbAdapter);
                    return $table;
                },
                'AngsuranTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Angsuran\AngsuranTable($dbAdapter);
                    return $table;
                },
                'KeberatanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Keberatan\KeberatanTable($dbAdapter);
                    return $table;
                },
                'PenghapusansanksiTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Penghapusansanksi\PenghapusansanksiTable($dbAdapter);
                    return $table;
                },
                'PembayaranangsuranTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pembayaran\PembayaranangsuranTable($dbAdapter);
                    return $table;
                },
                'PenagihanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Penagihan\PenagihanTable($dbAdapter);
                    return $table;
                },
                'StpdpembayaranTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Stpdpembayaran\StpdpembayaranTable($dbAdapter);
                    return $table;
                },
                'PemeriksaanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pemeriksaan\PemeriksaanTable($dbAdapter);
                    return $table;
                },
                'PemeriksaanskpdtTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pemeriksaan\PemeriksaanskpdtTable($dbAdapter);
                    return $table;
                },
                'PembukuanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Pembukuan\PembukuanTable($dbAdapter);
                    return $table;
                },
                'PemdaTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\PemdaTable($dbAdapter);
                    return $table;
                },
                'PejabatTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\PejabatTable($dbAdapter);
                    return $table;
                },
                'TipeusahaTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\TipeusahaTable($dbAdapter);
                    return $table;
                },
                'KelurahanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\KelurahanTable($dbAdapter);
                    return $table;
                },
                'KecamatanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\KecamatanTable($dbAdapter);
                    return $table;
                },
                'RekeningTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\RekeningTable($dbAdapter);
                    return $table;
                },
                'TargetTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\TargetTable($dbAdapter);
                    return $table;
                },
                'TargetdetailTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\TargetdetailTable($dbAdapter);
                    return $table;
                },
                'ReklameTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\ReklameTable($dbAdapter);
                    return $table;
                },
                // minerba
                'MinerbaTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\MinerbaTable($dbAdapter);
                    return $table;
                },
                'AirTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\AirTable($dbAdapter);
                    return $table;
                },
                'SumberAirTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\SumberAirTable($dbAdapter);
                    return $table;
                },
                'LokasiCekunganTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\LokasiCekunganTable($dbAdapter);
                    return $table;
                },
                'JaringanPDAMTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\JaringanPDAMTable($dbAdapter);
                    return $table;
                },
                'KualitasAirTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\KualitasAirTable($dbAdapter);
                    return $table;
                },
                'AreaPengaruhTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\AreaPengaruhTable($dbAdapter);
                    return $table;
                },
                'KerusakanTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\KerusakanTable($dbAdapter);
                    return $table;
                },

                //ceknop
                'CeknopTable' => function ($sm) {
                    $dbAdapter = $sm->get('pbbdb');
                    $table = new Model\CeknopTable\CeknopTable($dbAdapter);
                    return $table;
                },
                //cektunggakan
                'CekTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\CeknopTable\CekTunggakanTable($dbAdapter);
                    return $table;
                },

                'SatkerTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\SatkerTable($dbAdapter);
                    return $table;
                },
                'KekayaandaerahTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\KekayaandaerahTable($dbAdapter);
                    return $table;
                },
                'RumahdinasTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\RumahdinasTable($dbAdapter);
                    return $table;
                },
                'BphtbTable' => function ($sm) {
                    $dbAdapter = $sm->get('bphtbdb');
                    $table = new Model\Bphtb\BphtbTable($dbAdapter);
                    return $table;
                },
                'PbbTable' => function ($sm) {
                    $dbAdapter = $sm->get('pbbdb');
                    $table = new Model\Bphtb\PbbTable($dbAdapter);
                    return $table;
                },
                'AclPermissionTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\AclPermissionTable($dbAdapter);
                    return $table;
                },
                'AclResourceTable' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $table = new Model\Setting\AclResourceTable($dbAdapter);
                    return $table;
                },
                'PajakService' => function ($sm) {
                    $dbAdapter = $sm->get('pajakdb');
                    $dbTableAuthAdapter = new DbTableAuthAdapter($dbAdapter, "s_users", "s_username", "s_password", "MD5(?)");
                    $eTaxService = new AuthenticationService();
                    $eTaxService->setAdapter($dbTableAuthAdapter);
                    return $eTaxService;
                },
                'RoleTable' => function ($serviceManager) {
                    return new Model\Secure\Role($serviceManager->get('pajakdb'));
                },
                'UserRoleTable' => function ($serviceManager) {
                    return new Model\Secure\UserRole($serviceManager->get('pajakdb'));
                },
                'PermissionTable' => function ($serviceManager) {
                    return new Model\Secure\PermissionTable($serviceManager->get('pajakdb'));
                },
                'ResourceTable' => function ($serviceManager) {
                    return new Model\Secure\ResourceTable($serviceManager->get('pajakdb'));
                },
                'RolePermissionTable' => function ($serviceManager) {
                    return new Model\Secure\RolePermissionTable($serviceManager->get('pajakdb'));
                },
                'PajakAcl' => function ($serviceManager) {
                    return new Utility\Acl();
                },
                'app_path' => function ($sm) {
                    $path_aplikasi = "/var/www/html/download/simpatda_gunungkidul";
                    return $path_aplikasi;
                }
            )
        );
    }

    public function init(\Zend\ModuleManager\ModuleManager $mm)
    {
        $mm->getEventManager()->getSharedManager()->attach(__NAMESPACE__, 'dispatch', function ($e) {
            $controller = basename(str_ireplace("\\", "/", $e->getRouteMatch()->getParam('controller')));
            if ($controller == 'AclManager') :
                $e->getTarget()->layout('pajak/layoutempty');
            else :
                $e->getTarget()->layout('pajak/layout');
            endif;
        });
    }

    public function bootstrapSession(MvcEvent $e)
    {
        $session = $e->getApplication()->getServiceManager()->get('Sessi_Manager');
        $session->start();
        $container = new Container('PajakService');
        if (isset($container->init)) {
            $session->regenaretId(true);
            $container->init = 1;
        }
    }

    public function onBootstrap($e)
    {
        $eventManager = $e->getApplication()->getEventManager();
        $moduleRouteListener = new \Zend\Mvc\ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
        $sessionManager = new SessionManager();
        $sessionManager->setName('eSIMPATDABIAK');
        $sessionManager->rememberMe('36000');
        $sessionManager->start();
        $eventManager->attach(\Zend\Mvc\MvcEvent::EVENT_DISPATCH, array(
            $this,
            'boforeDispatch'
        ), 100);
    }

    function boforeDispatch(\Zend\Mvc\MvcEvent $event)
    {
        $authenticationService = $event->getApplication()->getServiceManager()->get('PajakService');
        $request = $event->getRequest();
        $response = $event->getResponse();
        $target = $event->getTarget();
        $whiteList = array(
            'LoginAccess-logout',
            'LoginAccess-index',
            // 'Pendataan-getToken',
            //'AclManager-index'
        );
        $requestUri = $request->getRequestUri();
        $controller = $event->getRouteMatch()->getParam('controller');
        $action = $event->getRouteMatch()->getParam('action');
        if (strpos($action, '_') !== false) {
            $arr_action = explode("_", $action);
            $action = ucwords($arr_action[0]) . "" . ucwords($arr_action[1]);
        }
        $requestedResourse = $controller . "-" . $action;
        # protect route using acl
        /*
		if ($authenticationService->hasIdentity()) {
            if ($requestedResourse == 'LoginAccess-index' || in_array($requestedResourse, $whiteList)) {
                $url = 'main';
                $response->setHeaders($response->getHeaders()->addHeaderLine('Location', $url));
                $response->setStatusCode(302);
                $response->sendHeaders();
            } else {
                $serviceManager = $event->getApplication()->getServiceManager();
                $storage = $serviceManager->get('PajakService')->getStorage()->read();
                // $userRole = $storage['s_namauserrole'];
                $userRole = $storage ['s_username'];
                $acl = $serviceManager->get('PajakAcl');
                $acl->initAcl();

                $status = $acl->isAccessAllowed($userRole, $controller, $action);
                if (!$status) {
                    die('Anda tidak di ijinkan untuk membuka halaman ini');
//                $url = '-';
//                    $response->setHeaders($response->getHeaders()->addHeaderLine('Location', $url));
//                    $response->setStatusCode(302);
                }
            }
        } else {
            if ($requestedResourse != 'LoginAccess-index' && !in_array($requestedResourse, $whiteList)) {
                $url = 'sign_in';
                $response->setHeaders($response->getHeaders()->addHeaderLine('Location', $url));
                $response->setStatusCode(302);
                $response->sendHeaders();
            }
        }
        
		*/
        # protect route with session

        if (!$authenticationService->hasIdentity()) {
            if ($requestedResourse != 'LoginAccess-index' && !in_array($requestedResourse, $whiteList)) {
                $event->getRouteMatch()->setParam('controller', 'LoginAccess')->setParam('action', 'index');
            }
        } else {
            if ($requestedResourse == 'LoginAccess-index' || in_array($requestedResourse, $whiteList)) {
                $url = 'main';
                $response->setHeaders($response->getHeaders()->addHeaderLine('Location', $url));
                $response->setStatusCode(302);
            }

            $response->sendHeaders();
        }
    }
}
