<?php
$ik = parse_url($_SERVER['PHP_SELF']);
$url = substr($ik['path'], strripos($ik['path'], "/") + 1);

$url = $url . ((isset($_SERVER['QUERY_STRING']) && trim($_SERVER['QUERY_STRING']) != "") ? "?" . $_SERVER['QUERY_STRING'] : "");
?>


<div class="page-sidebar-wrapper">
    <div class="page-sidebar">
   
        <ul class="page-sidebar-menu  page-header-fixed ">

            <li class="heading">
                <h3 class="uppercase">Features</h3>
            </li>
            <?php
            $menu = $this->session->userdata('MM_UserGroup');
            $menu_cache = array();
            if ($menu != null):
                foreach ($menu as $menuItem) {
                    $menu_cache[] = $menuItem['id'];
                }

                foreach ($menu as $item) {
                    $data_array = array();
                    if (trim($item['parent']) == "") {
                        $sub_link = parent_links($item['id']);
                        ?> 
                         <li class="nav-item <?php echo active_link($item['menu_class']); ?>">
                            <a class="nav-link nav-toggle" href="javascript:;">
                                <i class="fa fa-shirtsinbulk"></i> <span class="title"><?php echo $item['label']; ?></span>
                                <span class="arrow"></span> </a>


                             <ul class="sub-menu">
                                <?php
                                $children = get_children($item['id']);
                                if (sizeof($children) > 0 && $children[0]['id'] != "") {
                                    foreach ($children as $item2):
                                        ?>
                                         <li class="nav-item">
                                        <a href="<?php echo site_url($item2['link']) ?>"><?php echo $item2['label'] ?></a>
                                        
                                            </li>
                                    <?php endforeach;
                                    ?>

                                </ul>
                            </li>

                            <?php
                        }
                    }
                }
            endif;
            ?>
        </ul>
    </div>
</div>
