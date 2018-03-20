<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo  $msg ?>. </div>

    <?php endif; ?>



</div>
<div class="clearfix"></div>

<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>No</th>
            <th>Group Name</th>
             <th>Users</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        foreach ($usergroups as $group):
            ?>
            <tr>
                <td><?php echo ucwords($count); ?></td>
                <td><?php echo ucwords($group['group_name']); ?></td>
                <td><a href="<?php echo base_url();?>usermgt/users_controller/group_users/<?php echo $group['group_id']; ?>">Users <?php echo $group['count_users'];?></a></td>
                <td><a class="text-success" href="<?php echo base_url(); ?>usermgt/users_controller/edit_group/<?php echo $group['group_id']; ?>"><i class="fa fa-pencil-square-o"> Edit</i></a>
                    <a class="text-danger" href="<?php echo base_url();?>usermgt/users_controller/delete_grp/<?php echo $group['group_id']?>">  <i class="fa fa-trash"> Delete</i></a>
                </td>
            </tr>
            <?php
            $count++;
        endforeach;
        ?>
    </tbody>
</table>
