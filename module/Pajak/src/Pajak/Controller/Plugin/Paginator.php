<?php

namespace Pajak\Controller\Plugin;

class Paginator extends \Zend\Mvc\Controller\AbstractActionController {

    public function paginator($baserows, $count, $page, $total_pages, $start) {
        $pager = "<ul class='pagination pagination-sm no-margin' style='margin:0; padding:0'>";
        $class = ( $page == 1 ) ? "disabled" : '';
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid(' . ( $page ) . ')">&laquo;</a></li>';
        if ($start >= 1) {
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagrid(1)">1</a></li>';
            $pager .= '<li class="disabled"><span>...</span></li>';
        }
        if ($page <= $total_pages) {
            if ($page == $total_pages) { // page terahir
                $total_pagesnya = $page;
                $i = $page - 1;
                if ($page <= 1) {
                    $i = $page;
                }
            } elseif ($page == ($total_pages - 1)) { // page terahir -1
                $total_pagesnya = $page + 1;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            } else {
                $total_pagesnya = $page + 2;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            }
        }
        while ($i <= $total_pagesnya) {
            $class = ( $page == $i ) ? "active" : "";
            if ($i == 0) {
                $i = 1;
            }
            $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid(' . $i . ');return false;">' . $i . '</a></li>';
            $i++;
        }
        if ($total_pages > $page) {
            $pager .= '<li class="disabled"><span>...</span></li>';
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagrid(' . $total_pages . ');return false;">' . $total_pages . '</a></li>';
        }
        $class = ( $page == $total_pages ) ? "disabled" : "";
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid(' . ( $page + 1 ) . ')">&raquo;</a></li>';

        $pager .= "</ul>";
        $akhirdata = (int) $baserows * (int) $page;
        if ($akhirdata < $baserows) {
            $akhirdata = $baserows;
        }
        if ($akhirdata >= $count) {
            $akhirdata = $count;
        }

        if ($akhirdata == 0) {
            $awaldata = 0;
            $page = 1;
        } elseif ($akhirdata < $baserows) {
            $awaldata = 1;
            $page = 1;
        } else {
            $awaldata = ((int) $baserows * ((int) $page - 1)) + 1;
            if ($awaldata <= 0) {
                $awaldata = 1;
            }
        }

        $datapaging = array(
            "paginatore" => $pager,
            "akhirdata" => $akhirdata,
            "awaldata" => $awaldata
        );
        return $datapaging;
    }
    
    public function paginator1($baserows, $count, $page, $total_pages, $start) {
        $pager = "<ul class='pagination pagination-sm no-margin' style='margin:0; padding:0'>";
        $class = ( $page == 1 ) ? "disabled" : '';
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid1(' . ( $page ) . ')">&laquo;</a></li>';
        if ($start >= 1) {
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagrid1(1)">1</a></li>';
            $pager .= '<li class="disabled"><span>...</span></li>';
        }
        if ($page <= $total_pages) {
            if ($page == $total_pages) { // page terahir
                $total_pagesnya = $page;
                $i = $page - 1;
                if ($page <= 1) {
                    $i = $page;
                }
            } elseif ($page == ($total_pages - 1)) { // page terahir -1
                $total_pagesnya = $page + 1;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            } else {
                $total_pagesnya = $page + 2;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            }
        }
        while ($i <= $total_pagesnya) {
            $class = ( $page == $i ) ? "active" : "";
            if ($i == 0) {
                $i = 1;
            }
            $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid1(' . $i . ');return false;">' . $i . '</a></li>';
            $i++;
        }
        if ($total_pages > $page) {
            $pager .= '<li class="disabled"><span>...</span></li>';
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagrid1(' . $total_pages . ');return false;">' . $total_pages . '</a></li>';
        }
        $class = ( $page == $total_pages ) ? "disabled" : "";
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid1(' . ( $page + 1 ) . ')">&raquo;</a></li>';

        $pager .= "</ul>";
        $akhirdata = (int) $baserows * (int) $page;
        if ($akhirdata < $baserows) {
            $akhirdata = $baserows;
        }
        if ($akhirdata >= $count) {
            $akhirdata = $count;
        }

        if ($akhirdata == 0) {
            $awaldata = 0;
            $page = 1;
        } elseif ($akhirdata < $baserows) {
            $awaldata = 1;
            $page = 1;
        } else {
            $awaldata = ((int) $baserows * ((int) $page - 1)) + 1;
            if ($awaldata <= 0) {
                $awaldata = 1;
            }
        }

        $datapaging = array(
            "paginatore" => $pager,
            "akhirdata" => $akhirdata,
            "awaldata" => $awaldata
        );
        return $datapaging;
    }
    
    public function paginator2($baserows, $count, $page, $total_pages, $start) {
        $pager = "<ul class='pagination pagination-sm no-margin' style='margin:0; padding:0'>";
        $class = ( $page == 1 ) ? "disabled" : '';
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid2(' . ( $page ) . ')">&laquo;</a></li>';
        if ($start >= 1) {
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagrid2(1)">1</a></li>';
            $pager .= '<li class="disabled"><span>...</span></li>';
        }
        if ($page <= $total_pages) {
            if ($page == $total_pages) { // page terahir
                $total_pagesnya = $page;
                $i = $page - 1;
                if ($page <= 1) {
                    $i = $page;
                }
            } elseif ($page == ($total_pages - 1)) { // page terahir -1
                $total_pagesnya = $page + 1;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            } else {
                $total_pagesnya = $page + 2;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            }
        }
        while ($i <= $total_pagesnya) {
            $class = ( $page == $i ) ? "active" : "";
            if ($i == 0) {
                $i = 1;
            }
            $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid2(' . $i . ');return false;">' . $i . '</a></li>';
            $i++;
        }
        if ($total_pages > $page) {
            $pager .= '<li class="disabled"><span>...</span></li>';
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagrid2(' . $total_pages . ');return false;">' . $total_pages . '</a></li>';
        }
        $class = ( $page == $total_pages ) ? "disabled" : "";
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid2(' . ( $page + 1 ) . ')">&raquo;</a></li>';

        $pager .= "</ul>";
        $akhirdata = (int) $baserows * (int) $page;
        if ($akhirdata < $baserows) {
            $akhirdata = $baserows;
        }
        if ($akhirdata >= $count) {
            $akhirdata = $count;
        }

        if ($akhirdata == 0) {
            $awaldata = 0;
            $page = 1;
        } elseif ($akhirdata < $baserows) {
            $awaldata = 1;
            $page = 1;
        } else {
            $awaldata = ((int) $baserows * ((int) $page - 1)) + 1;
            if ($awaldata <= 0) {
                $awaldata = 1;
            }
        }

        $datapaging = array(
            "paginatore" => $pager,
            "akhirdata" => $akhirdata,
            "awaldata" => $awaldata
        );
        return $datapaging;
    }
    
    public function paginator3($baserows, $count, $page, $total_pages, $start) {
        $pager = "<ul class='pagination pagination-sm no-margin' style='margin:0; padding:0'>";
        $class = ( $page == 1 ) ? "disabled" : '';
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid3(' . ( $page ) . ')">&laquo;</a></li>';
        if ($start >= 1) {
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagrid3(1)">1</a></li>';
            $pager .= '<li class="disabled"><span>...</span></li>';
        }
        if ($page <= $total_pages) {
            if ($page == $total_pages) { // page terahir
                $total_pagesnya = $page;
                $i = $page - 1;
                if ($page <= 1) {
                    $i = $page;
                }
            } elseif ($page == ($total_pages - 1)) { // page terahir -1
                $total_pagesnya = $page + 1;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            } else {
                $total_pagesnya = $page + 2;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            }
        }
        while ($i <= $total_pagesnya) {
            $class = ( $page == $i ) ? "active" : "";
            if ($i == 0) {
                $i = 1;
            }
            $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid3(' . $i . ');return false;">' . $i . '</a></li>';
            $i++;
        }
        if ($total_pages > $page) {
            $pager .= '<li class="disabled"><span>...</span></li>';
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagrid3(' . $total_pages . ');return false;">' . $total_pages . '</a></li>';
        }
        $class = ( $page == $total_pages ) ? "disabled" : "";
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid3(' . ( $page + 1 ) . ')">&raquo;</a></li>';

        $pager .= "</ul>";
        $akhirdata = (int) $baserows * (int) $page;
        if ($akhirdata < $baserows) {
            $akhirdata = $baserows;
        }
        if ($akhirdata >= $count) {
            $akhirdata = $count;
        }

        if ($akhirdata == 0) {
            $awaldata = 0;
            $page = 1;
        } elseif ($akhirdata < $baserows) {
            $awaldata = 1;
            $page = 1;
        } else {
            $awaldata = ((int) $baserows * ((int) $page - 1)) + 1;
            if ($awaldata <= 0) {
                $awaldata = 1;
            }
        }

        $datapaging = array(
            "paginatore" => $pager,
            "akhirdata" => $akhirdata,
            "awaldata" => $awaldata
        );
        return $datapaging;
    }
    
    public function paginator4($baserows, $count, $page, $total_pages, $start) {
        $pager = "<ul class='pagination pagination-sm no-margin' style='margin:0; padding:0'>";
        $class = ( $page == 1 ) ? "disabled" : '';
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid4(' . ( $page ) . ')">&laquo;</a></li>';
        if ($start >= 1) {
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagrid4(1)">1</a></li>';
            $pager .= '<li class="disabled"><span>...</span></li>';
        }
        if ($page <= $total_pages) {
            if ($page == $total_pages) { // page terahir
                $total_pagesnya = $page;
                $i = $page - 1;
                if ($page <= 1) {
                    $i = $page;
                }
            } elseif ($page == ($total_pages - 1)) { // page terahir -1
                $total_pagesnya = $page + 1;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            } else {
                $total_pagesnya = $page + 2;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            }
        }
        while ($i <= $total_pagesnya) {
            $class = ( $page == $i ) ? "active" : "";
            if ($i == 0) {
                $i = 1;
            }
            $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid4(' . $i . ');return false;">' . $i . '</a></li>';
            $i++;
        }
        if ($total_pages > $page) {
            $pager .= '<li class="disabled"><span>...</span></li>';
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagrid4(' . $total_pages . ');return false;">' . $total_pages . '</a></li>';
        }
        $class = ( $page == $total_pages ) ? "disabled" : "";
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagrid4(' . ( $page + 1 ) . ')">&raquo;</a></li>';

        $pager .= "</ul>";
        $akhirdata = (int) $baserows * (int) $page;
        if ($akhirdata < $baserows) {
            $akhirdata = $baserows;
        }
        if ($akhirdata >= $count) {
            $akhirdata = $count;
        }

        if ($akhirdata == 0) {
            $awaldata = 0;
            $page = 1;
        } elseif ($akhirdata < $baserows) {
            $awaldata = 1;
            $page = 1;
        } else {
            $awaldata = ((int) $baserows * ((int) $page - 1)) + 1;
            if ($awaldata <= 0) {
                $awaldata = 1;
            }
        }

        $datapaging = array(
            "paginatore" => $pager,
            "akhirdata" => $akhirdata,
            "awaldata" => $awaldata
        );
        return $datapaging;
    }
    
    //================== surat teguran
    public function paginatore3($baserows, $count, $page, $total_pages, $start) {
        $pager = "<ul class='pagination pagination-sm no-margin' style='margin:0; padding:0'>";
        $class = ( $page == 1 ) ? "disabled" : '';
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagridsuratteguran(' . ( $page ) . ')">&laquo;</a></li>';
        if ($start >= 1) {
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagridsuratteguran(1)">1</a></li>';
            $pager .= '<li class="disabled"><span>...</span></li>';
        }
        if ($page <= $total_pages) {
            if ($page == $total_pages) { // page terahir
                $total_pagesnya = $page;
                $i = $page - 1;
                if ($page <= 1) {
                    $i = $page;
                }
            } elseif ($page == ($total_pages - 1)) { // page terahir -1
                $total_pagesnya = $page + 1;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            } else {
                $total_pagesnya = $page + 2;
                $i = $page;
                if ($page <= 1) {
                    $i = $page;
                }
            }
        }
        while ($i <= $total_pagesnya) {
            $class = ( $page == $i ) ? "active" : "";
            if ($i == 0) {
                $i = 1;
            }
            $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagridsuratteguran(' . $i . ');return false;">' . $i . '</a></li>';
            $i++;
        }
        if ($total_pages > $page) {
            $pager .= '<li class="disabled"><span>...</span></li>';
            $pager .= '<li><a href="javascript:void(0);" onclick="calldatagridsuratteguran(' . $total_pages . ');return false;">' . $total_pages . '</a></li>';
        }
        $class = ( $page == $total_pages ) ? "disabled" : "";
        $pager .= '<li class="' . $class . '"><a href="javascript:void(0);" onclick="calldatagridsuratteguran(' . ( $page + 1 ) . ')">&raquo;</a></li>';

        $pager .= "</ul>";
        $akhirdata = (int) $baserows * (int) $page;
        if ($akhirdata < $baserows) {
            $akhirdata = $baserows;
        }
        if ($akhirdata >= $count) {
            $akhirdata = $count;
        }

        if ($akhirdata == 0) {
            $awaldata = 0;
            $page = 1;
        } elseif ($akhirdata < $baserows) {
            $awaldata = 1;
            $page = 1;
        } else {
            $awaldata = ((int) $baserows * ((int) $page - 1)) + 1;
            if ($awaldata <= 0) {
                $awaldata = 1;
            }
        }

        $datapaging = array(
            "paginatore" => $pager,
            "akhirdata" => $akhirdata,
            "awaldata" => $awaldata
        );
        return $datapaging;
    }
    //================== end surat teguran

}
