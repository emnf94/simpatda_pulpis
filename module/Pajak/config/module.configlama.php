<?php

// This app creted by : Miftahul Huda (miftahul06@gmail.com)

return array(
    'controllers' => array(
        'invokables' => array(
            //Login dan Main
            'LoginAccess' => 'Pajak\Controller\LoginAccess',
            'MainController' => 'Pajak\Controller\MainController',
            //Modul Wajib Pajak
            'Laporan' => 'Pajak\Controller\Laporan\Laporan',
            //Modul Laporan Bendahara
            'Laporanbendahara' => 'Pajak\Controller\Laporanbendahara\Laporanbendahara',
            //Modul Utama
            'Pendaftaran' => 'Pajak\Controller\Pendaftaran\Pendaftaran',
            'Penggabunganop' => 'Pajak\Controller\Pendaftaran\Penggabunganop',
            'Penutupanwp' => 'Pajak\Controller\Pendaftaran\Penutupanwp',
            'Pendataan' => 'Pajak\Controller\Pendataan\Pendataan',
            'Teguranlaporan' => 'Pajak\Controller\Teguranlaporan\Teguranlaporan',
            'Penetapan' => 'Pajak\Controller\Penetapan\Penetapan',
            'Skpdjabatan' => 'Pajak\Controller\Skpdjabatan\Skpdjabatan',
            'Skpdkb' => 'Pajak\Controller\Skpdkb\Skpdkb',
            'Skpdkbt' => 'Pajak\Controller\Skpdkbt\Skpdkbt',
            'Skpdlb' => 'Pajak\Controller\Skpdlb\Skpdlb',
            'Skpdn' => 'Pajak\Controller\Skpdn\Skpdn',
            'Skpdt' => 'Pajak\Controller\Skpdt\Skpdt',
            'Stpd' => 'Pajak\Controller\Stpd\Stpd',
            'Pembayaran' => 'Pajak\Controller\Pembayaran\Pembayaran',
            'Setoranlain' => 'Pajak\Controller\Pembayaran\Setoranlain',
            'Pembayarandenda' => 'Pajak\Controller\Pembayaran\Pembayarandenda',
            'pembayaranangsuran' => 'Pajak\Controller\Pembayaran\pembayaranangsuran',
            'Rekambank' => 'Pajak\Controller\Rekambank\Rekambank',
            'Angsuran' => 'Pajak\Controller\Angsuran\Angsuran',
            'Keberatan' => 'Pajak\Controller\Keberatan\Keberatan',
            'Penghapusansanksi' => 'Pajak\Controller\Penghapusansanksi\Penghapusansanksi',
            'Penagihan' => 'Pajak\Controller\Penagihan\Penagihan',
            'Pemeriksaan' => 'Pajak\Controller\Pemeriksaan\Pemeriksaan',
            'Pembukuan' => 'Pajak\Controller\Pembukuan\Pembukuan',
            'Stpdpembayaran' => 'Pajak\Controller\Stpdpembayaran\Stpdpembayaran',
            'Pencetakan' => 'Pajak\Controller\Pencetakan\Pencetakan',
            'Monitoring' => 'Pajak\Controller\Monitoring\Monitoring',
            'Perizinan' => 'Pajak\Controller\Perizinan\Perizinan',
            'Pratama' => 'Pajak\Controller\Pratama\Pratama',
            //Modul Setting
            'SettingPemda' => 'Pajak\Controller\Setting\SettingPemda',
            'SettingUser' => 'Pajak\Controller\Setting\SettingUser',
            'SettingKelurahan' => 'Pajak\Controller\Setting\SettingKelurahan',
            'SettingPejabat' => 'Pajak\Controller\Setting\SettingPejabat',
            'SettingKecamatan' => 'Pajak\Controller\Setting\SettingKecamatan',
            'SettingRekening' => 'Pajak\Controller\Setting\SettingRekening',
            'SettingTarget' => 'Pajak\Controller\Setting\SettingTarget',
            'SettingTipeusaha' => 'Pajak\Controller\Setting\SettingTipeusaha',
            'SettingReklame' => 'Pajak\Controller\Setting\SettingReklame',
            'SettingReklameSticker' => 'Pajak\Controller\Setting\SettingReklameSticker',
            'SettingReklameSelebaran' => 'Pajak\Controller\Setting\SettingReklameSelebaran',
            'SettingReklameBerjalan' => 'Pajak\Controller\Setting\SettingReklameBerjalan',
            'SettingReklameBiayapemasangan' => 'Pajak\Controller\Setting\SettingReklameBiayapemasangan',
            'SettingReklameKelompokjalan' => 'Pajak\Controller\Setting\SettingReklameKelompokjalan',
            'SettingReklameSkorukuran' => 'Pajak\Controller\Setting\SettingReklameSkorukuran',
            'SettingReklameSudutpandang' => 'Pajak\Controller\Setting\SettingReklameSudutpandang',
            'SettingMinerba' => 'Pajak\Controller\Setting\SettingMinerba',


            'SettingAir' => 'Pajak\Controller\Setting\SettingAir',
            'AclManager' => 'Pajak\Controller\Setting\AclManager',
        ),
    ),
    'controller_plugins' => array(
        'invokables' => array(
            'Tools' => 'Pajak\Controller\Plugin\Tools',
        )
    ),
    'router' => array(
        'routes' => array(
            'sign_in' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/sign_in[/:action][/:par1]',
                    'defaults' => array(
                        'controller' => 'LoginAccess',
                        'action' => 'index',
                    ),
                ),
//                'may_terminate' => true,
//                'child_routes' => array(
//                    'captcha_form' => array(
//                        'type' => 'segment',
//                        'options' => array(
//                            'route' => '/[:controller[/[:action[/]]]]',
//                            'constraints' => array(
//                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
//                            ),
//                            'defaults' => array(),
//                        ),
//                    ),
//                    'captcha_form_generate' => array(
//                        'type' => 'segment',
//                        'options' => array(
//                            'route' => '/[:controller[/captcha/[:id]]]',
//                            'constraints' => array(
//                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
//                            ),
//                            'defaults' => array(
//                                'controller' => 'LoginAccess',
//                                'action' => 'generate',
//                            ),
//                        ),
//                    ),
//                ),
            ),
            'main' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/main[/:action][/:textcari]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'MainController',
                        'action' => 'index',
                    ),
                ),
            ),
            'laporan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/laporan[/:action][/:s_idjenis][/:t_idobjek][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Laporan',
                        'action' => 'index',
                    ),
                ),
            ),
            'laporanbendahara' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/laporanbendahara[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Laporanbendahara',
                        'action' => 'index',
                    ),
                ),
            ),
            'pendaftaran' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pendaftaran[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Pendaftaran',
                        'action' => 'index',
                    ),
                ),
            ),
            'penggabunganop' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/penggabunganop[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Penggabunganop',
                        'action' => 'index',
                    ),
                ),
            ),
            'penutupanwp' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/penutupanwp[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Penutupanwp',
                        'action' => 'index',
                    ),
                ),
            ),
            'pendataan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pendataan[/:action][/:s_idjenis][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Pendataan',
                        'action' => 'index',
                    ),
                ),
            ),
            'teguranlaporan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/teguranlaporan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Teguranlaporan',
                        'action' => 'index',
                    ),
                ),
            ),
            'penetapan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/penetapan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Penetapan',
                        'action' => 'index',
                    ),
                ),
            ),
            'skpdjabatan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/skpdjabatan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Skpdjabatan',
                        'action' => 'index',
                    ),
                ),
            ),
            'skpdkb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/skpdkb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Skpdkb',
                        'action' => 'index',
                    ),
                ),
            ),
            'skpdkbt' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/skpdkbt[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Skpdkbt',
                        'action' => 'index',
                    ),
                ),
            ),
            'skpdlb' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/skpdlb[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Skpdlb',
                        'action' => 'index',
                    ),
                ),
            ),
            'skpdn' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/skpdn[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Skpdn',
                        'action' => 'index',
                    ),
                ),
            ),
            'skpdt' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/skpdt[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Skpdt',
                        'action' => 'index',
                    ),
                ),
            ),
            'pembayaran' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pembayaran[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Pembayaran',
                        'action' => 'index',
                    ),
                ),
            ),
            'setoranlain' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setoranlain[/:action][/:s_idjenis][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Setoranlain',
                        'action' => 'index',
                    ),
                ),
            ),
            'pembayarandenda' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pembayarandenda[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Pembayarandenda',
                        'action' => 'index',
                    ),
                ),
            ),
            'pembayaranangsuran' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pembayaranangsuran[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'pembayaranangsuran',
                        'action' => 'index',
                    ),
                ),
            ),
            'rekambank' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/rekambank[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Rekambank',
                        'action' => 'index',
                    ),
                ),
            ),
            'angsuran' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/angsuran[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Angsuran',
                        'action' => 'index',
                    ),
                ),
            ),
            'keberatan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/keberatan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Keberatan',
                        'action' => 'index',
                    ),
                ),
            ),
			'penghapusansanksi' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/penghapusansanksi[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Penghapusansanksi',
                        'action' => 'index',
                    ),
                ),
            ),
            'stpd' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/stpd[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Stpd',
                        'action' => 'index',
                    ),
                ),
            ),
            'penagihan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/penagihan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Penagihan',
                        'action' => 'index',
                    ),
                ),
            ),
            'pemeriksaan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pemeriksaan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Pemeriksaan',
                        'action' => 'index',
                    ),
                ),
            ),
            'pembukuan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pembukuan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Pembukuan',
                        'action' => 'index',
                        'combocari' => 'undefined',
                        'kolomcari' => 'undefined',
                        'combosorting' => 'undefined',
                        'sortasc' => 'undefined',
                        'sortdesc' => 'DESC',
                        'combooperator' => 'undefined',
                    ),
                ),
            ),
            'stpdpembayaran' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/stpdpembayaran[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Stpdpembayaran',
                        'action' => 'index',
                    ),
                ),
            ),
            'pencetakan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pencetakan[/:action][/:page][/:rows][/:direction]',
                    'defaults' => array(
                        'controller' => 'Pencetakan',
                        'action' => 'index'
                    )
                )
            ),
            'monitoring' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/monitoring[/:action]',
                    'defaults' => array(
                        'controller' => 'Monitoring',
                        'action' => 'index'
                    )
                )
            ),
            'perizinan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/perizinan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Perizinan',
                        'action' => 'index',
                    ),
                ),
            ),
            'pratama' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/pratama[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Pratama',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_pemda' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_pemda[/:action][/:page][/:rows][/:direction]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingPemda',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_pejabat' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_pejabat[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingPejabat',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_kelurahan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_kelurahan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingKelurahan',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_kecamatan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_kecamatan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingKecamatan',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_rekening' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_rekening[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingRekening',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_target' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_target[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingTarget',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_tipeusaha' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_tipeusaha[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingTipeusaha',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_reklame' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_reklame[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingReklame',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_reklame_sticker' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_reklame_sticker[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingReklameSticker',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_reklame_selebaran' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_reklame_selebaran[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingReklameSelebaran',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_reklame_berjalan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_reklame_berjalan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingReklameBerjalan',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_reklame_biayapemasangan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_reklame_biayapemasangan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingReklameBiayapemasangan',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_reklame_kelompokjalan' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_reklame_kelompokjalan[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingReklameKelompokjalan',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_reklame_skorukuran' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_reklame_skorukuran[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingReklameSkorukuran',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_reklame_sudutpandang' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_reklame_sudutpandang[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingReklameSudutpandang',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_air' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_air[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingAir',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_minerba' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_minerba[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingMinerba',
                        'action' => 'index',
                    ),
                ),
            ),
            'setting_user' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/setting_user[/:action][/:page][/:rows][/:direction][/:combocari][/:kolomcari][/:combosorting][/:sortasc][/:sortdesc][/:combooperator]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'SettingUser',
                        'action' => 'index',
                    ),
                ),
            ),
            'acl_manager' => array(
                'type' => 'segment',
                'options' => array(
                    'route' => '/acl_manager[/:action][/:page][/:rows][/:direction]',
                    'defaults' => array(
                        'controller' => 'AclManager',
                        'action' => 'index'
                    )
                )
            ),
        ),
    ),
    'view_manager' => array(
        'template_map' => array(
            'pajak/layout' => __DIR__ . '/../view/layout/layout.phtml',
            'pajak/layoutempty' => __DIR__ . '/../view/layout/layout_empty.phtml',
            'error/404' => __DIR__ . '/../view/error/404.phtml',
            'error/index' => __DIR__ . '/../view/error/index.phtml',
        ),
        'template_path_stack' => array(
            'pajak' => __DIR__ . '/../view',
        ),
    ),
);
