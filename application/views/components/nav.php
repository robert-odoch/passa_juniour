<div class="page-header-inner ">
    <!-- BEGIN LOGO -->
    <div class="page-logo"> <a href="#"> 
            <img class="logo-default" alt="" src="<?php echo base_url(); ?>assets/images/logo.png"> </a> </div>
    <!-- END LOGO -->
    <div class="library-menu"> 
        <p style="color: #efbf2e">Welcome <?php echo $this->session->userdata('group_name')?></p>
        <!--<span class="one">-</span> <span class="two">-</span> <span class="three">-</span>--> 

    </div>
    <!-- BEGIN TOP NAVIGATION MENU -->
    <div class="top-menu">
        <ul class="nav navbar-nav pull-right">
<!--            <li class="dropdown"> <a href="#" data-toggle="dropdown" class="dropdown-toggle count-info" > <i class="fa fa-envelope"></i> <span class="badge badge-danger ">6</span> </a>
                <ul class="dropdown-menu dropdown-messages menuBig">
                    <li>
                        <div class="dropdown-messages-box"> <a class="pull-left" href="profile.html"> <img src="<?php echo base_url(); ?>assets/images/teem/a7.jpg" class="img-circle" alt="image"> </a>
                            <div class="media-body"> <small class="pull-right">46h ago</small> <strong>Mike Loreipsum</strong> started following <strong>Olivia Wenscombe</strong>. <br>
                                <small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small> </div>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="dropdown-messages-box"> <a class="pull-left" href="profile.html"> <img src="<?php echo base_url(); ?>assets/images/teem/a4.jpg" class="img-circle" alt="image"> </a>
                            <div class="media-body "> <small class="pull-right text-navy">5h ago</small> <strong>Alex Smith </strong> started following <strong>Olivia Wenscombe</strong>. <br>
                                <small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small> </div>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="dropdown-messages-box"> <a class="pull-left" href="profile.html"> <img src="<?php echo base_url(); ?>assets/images/teem/a3.jpg" class="img-circle" alt="image"> </a>
                            <div class="media-body "> <small class="pull-right">23h ago</small> <strong>Olivia Wenscombe</strong> love <strong>Sophie </strong>. <br>
                                <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small> </div>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="text-center link-block"> <a href="mailbox.html"> <i class="fa fa-envelope"></i> <strong>Read All Messages</strong> </a> </div>
                    </li>
                </ul>
            </li>
            <li class="dropdown"> <a href="#" data-toggle="dropdown" class="dropdown-toggle count-info" > <i class="fa fa-bell"></i> <span class="badge badge-primary">8</span> </a>
                <ul class="dropdown-menu dropdown-alerts menuBig">
                    <li> <a href="mailbox.html">
                            <div> <i class="fa fa-envelope fa-fw"></i> You have 16 messages <span class="pull-right text-muted small">4 minutes ago</span> </div>
                        </a> </li>
                    <li class="divider"></li>
                    <li> <a href="profile.html">
                            <div> <i class="fa fa-twitter fa-fw"></i> 3 New Followers <span class="pull-right text-muted small">12 minutes ago</span> </div>
                        </a> </li>
                    <li class="divider"></li>
                    <li> <a href="grid_options.html">
                            <div> <i class="fa fa-upload fa-fw"></i> Server Rebooted <span class="pull-right text-muted small">4 minutes ago</span> </div>
                        </a> </li>
                    <li class="divider"></li>
                    <li>
                        <div class="text-center link-block"> <a href="mailbox.html"> <strong>See All Alerts</strong> <i class="fa fa-angle-right"></i> </a> </div>
                    </li>
                </ul>
            </li>-->
            <!-- START USER LOGIN DROPDOWN -->
            <li class="dropdown dropdown-user"> <a data-close-others="true" data-hover="dropdown" data-toggle="dropdown"  class="dropdown-toggle" href="javascript:;"> <img src="<?php echo base_url(); ?>assets/images/teem/a10.jpg" class="img-circle" alt="">
                    <span class="username username-hide-on-mobile"> <?php echo $this->session->userdata("full_name"); ?></span> <i class="fa fa-angle-down"></i> </a>
                <ul class="dropdown-menu dropdown-menu-default">
<!--                    <li> <a href="profile.html"> <i class="icon-user"></i> My Profile </a>

                    </li>
                    <li>
                        <a href="profile_2.html"> <i class="icon-user"></i> Profile-2 </a> </li>
                    <li> <a href="calendar.html"> <i class="icon-calendar"></i> My Calendar </a> </li>
                    <li> <a href="mailbox.html"> <i class="icon-envelope-open"></i> My Inbox <span class="badge badge-danger"> 3 </span> </a> </li>
                    <li> <a href="dashboard2.html"> <i class="icon-rocket"></i> My Tasks <span class="badge badge-success"> 7 </span> </a> </li>
                    <li class="divider"> </li>-->
                    <li> <a href="#"> <i class="icon-lock"></i> Lock Screen </a> </li>
                    <li> <a href="<?php echo base_url() ?>usermgt/users_controller/change_password"> <i class="icon-lock"></i> Change Password </a> </li>
                    <li> <a href="<?php echo base_url("auth/logout"); ?>"> <i class="icon-key"></i> Log Out </a> </li>
                </ul>
            </li>
            <!-- END USER LOGIN DROPDOWN -->
        </ul>
    </div>
    <!-- END TOP NAVIGATION MENU -->
</div>