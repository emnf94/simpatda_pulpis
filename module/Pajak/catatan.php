<?php

/* 1. mendapatkan string pada zf2
        echo $select->getSqlString();
  
 * 2. agar bisa rewind pada zf2. contoh :
        $rekening = $this->Tools()->getService('RekeningTable')->getdataRekeningMineral();
        $recordsrekening = array();
        foreach ($rekening as $rekening) {
            $recordsrekening[] = $rekening;
        }
 * 3. PHP Shorthand If/Else Using Ternary Operators (?:)
       $t_masaawalsblm = ($datasebelumnya['t_masaawal'] != null ? date('d-m-Y', strtotime($datasebelumnya['t_masaawal'])) : '...........'); // returns true
 * 4. Array Month
        $abulan = ['01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember'];
        $t_tglpendataan = date('d', strtotime($data['t_tglpendataan'])) . " " . $abulan[date('m', strtotime($data['t_tglpendataan']))] . " " . date('Y', strtotime($data['t_tglpendataan']));
 * 5. array_merge
                $bs->s_akses = array_merge((array) $bs->s_pendataansspd, (array) $bs->s_verifikasisspd);
                $bs->s_akses = array_merge((array) $bs->s_akses, (array) $bs->s_pembayaransspd);
 * 
 * 
 * 
 * 
 * 
 */

