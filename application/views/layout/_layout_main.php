
<?php
if ($this->session->userdata('URES_loggedin') == true) {
    $this->load->view('components/header');
    ?>

    <body class="page-header-fixed ">
        <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <!--<p style="margin-top: 1px;margin-left: 20px;color: #FFF;font-size: 26px">-->
                    <!--                     MUST
                                        </p>-->
                    /<a href="#"> 

                                     <!--<img class="logo-default" alt="logo" src="<?php echo base_url(); ?>assets/images/logo.png">-->
                    </a> </div>
                <!-- END LOGO -->
                <div class="library-menu"> <span class="one">-</span> <span class="two">-</span> <span class="three">-</span> </div>

                <?php $this->load->view('components/nav'); ?>
            </div>
        </div>
        <div class="clearfix"> </div>
        <div class="page-container">

            <?php $this->load->view('components/side_bar'); ?>


            <div class="page-content-wrapper animated fadeInRight">
                <div class="page-content">
                    <div class="row wrapper border-bottom page-heading">
                        <div class="col-sm-12">
                            <h2><?php
                                if (isset($pageName)) {
                                    echo $pageName;
                                }
                                ?>
                                <div class="loader pull-right">
                                </div> 
                            </h2>

                            <ol class="breadcrumb">
                                <?php if (isset($page)): ?><li><?php echo $page; ?> </li><?php endif; ?>
                                <?php if (isset($sub_page)): ?> <li><?php echo $sub_page; ?></li><?php endif; ?>
                                <?php if (isset($sub_sub_page)): ?> <li><?php echo $sub_sub_page; ?></li><?php endif; ?>
                                <?php if (isset($sub_sub_sub_page)): ?>   <li class="active"> <strong><?php echo $sub_sub_sub_page; ?></strong> </li><?php endif; ?>
                                <?php if (isset($sub_sub_sub_sub_page)): ?>   <li class="active"> <strong><?php echo $sub_sub_sub_sub_page; ?></strong> </li><?php endif; ?>

                            </ol>


                            <?php if (isset($btn)): ?>
                                <a href="<?php echo base_url($btn_link); ?>" class="btn btn-primary pull-right"><?php echo $btn ?></a>
                            <?php endif; ?>
                            <?php if (isset($model_name)): ?>
                                <a href="#" onclick="addRecord(<?php echo $primary_id ?>);" class="btn btn-primary pull-right"><?php echo $model_name  ?></a>
                            <?php endif; ?>
                            <?php if (isset($export_btn)): ?>
                                <a href="<?php echo base_url($export_link); ?>" class="btn btn-success pull-left" id="exportData"><i class="fa fa-file-excel-o">  <?php echo $export_btn ?></i></a>
                            <?php endif; ?>

                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-12"> 

                        </div>

                    </div>
                    <div class="wrapper-content ">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="ibox float-e-margins">

                                    <div class="ibox-content collapse in">
                                        <div class="widgets-container">
                                            <div >
                                                <div >
                                                    <?php echo $content ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <?php
        $this->load->view('components/footer');
    }else {
        redirect('auth', TRUE);
    }
    ?>