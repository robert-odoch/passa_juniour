
<div class="row">
    <!-- begin col-3 -->
    <div class="col-md-3 col-sm-6">
        <div class="widget widget-stats" style="background-color: #4B0082">
            <div class="stats-icon stats-icon-lg"><i class="fa fa-shopping-cart fa-fw"></i></div>
            <div class="stats-title">Total Students</div>
            <div class="stats-number"><?php echo number_format($students->students); ?></div>
            <div class="stats-progress progress">
                <!--<div style="width: 70.1%;" class="progress-bar"></div>-->
            </div>
            <div class="stats-desc">Total Students</div>
        </div>
    </div>
    <!-- end col-3 -->
    <!-- begin col-3 -->
    <div class="col-md-3 col-sm-6 mtop15">
        <div class="widget widget-stats" style="background-color: #4682B4">
            <div class="stats-icon stats-icon-lg"><i class="fa fa-support fa-fw"></i></div>
            <div class="stats-title">Total Users</div>
            <div class="stats-number"><?php echo number_format($school_users->users); ?></div>
            <div class="stats-progress progress">
                <!--<div style="width: 40.5%;" class="progress-bar"></div>-->
            </div>
            <div class="stats-desc">All students</div>
        </div>
    </div>
    <!-- end col-3 -->
    <!-- begin col-3 -->
    <div class="col-md-3 col-sm-6 mtop15">
        <div class="widget widget-stats purple-bg">
            <div class="stats-icon stats-icon-lg"><i class="fa fa-user fa-fw"></i></div>
            <div class="stats-title">Suggestion box</div>
            <div class="stats-number"><?php echo number_format($unreadSuggestion); ?></div>
            <div class="stats-progress progress">
                <div style="width: 76.3%;" class="progress-bar"></div>
            </div>
            <div class="stats-desc">Total Unread suggestions</div>
        </div>
    </div>
    <!-- end col-3 -->
    <!-- begin col-3 -->
    <div class="col-md-3 col-sm-6 mtop15">
        <div class="widget widget-stats black-bg">
            <div class="stats-icon stats-icon-lg"><i class="fa fa-comments fa-fw"></i></div>
            <div class="stats-title">Total active parents phones </div>
            <div class="stats-number"><?php  echo number_format($complaints->count_sum); ?></div>
            <div class="stats-progress progress">
                <!--<div style="width: 54.9%;" class="progress-bar"></div>-->
            </div>
            <div class="stats-desc">Parents active phone</div>
        </div>
    </div>
    <!-- end col-3 -->
</div>

<div class="clearfix"></div>
<br></br>
<a href="<?php echo base_url()?>schools/Schools_controller/add_user/<?php echo $school_id ?>" class="btn btn-primary pull-right">Add New User</a>

<div class="clearfix"></div>
<br>
<br>
<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Email Address</th>
            <th>Phone Number</th>
            <th>When added</th>
            <th>User Group</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        foreach ($users as $row):
            ?>
            <tr>
                <td><?php echo ucwords($count); ?></td>
                <td><?php echo ucwords($row['name']); ?></td>
                  <td><?php echo ucwords($row['email']); ?></td>
              <td><?php echo ucwords($row['phone_number']); ?></td>
                <td><?php echo ucwords($row['_when_added']); ?></td>
                <td><?php echo ucwords($row['group_name']); ?></td>
                  <td></td>
             
            </tr>
            <?php
            $count++;
        endforeach;
        ?>
    </tbody>
</table>
