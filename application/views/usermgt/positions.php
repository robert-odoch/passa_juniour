<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>
<div class="clearfix"></div>

<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>No</th>
            <th>Position Name</th>
            <th>Total Users</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        foreach ($positions as $row):
            ?>
            <tr>
                <td><?php echo ucwords($count); ?></td>
                <td><?php echo ucwords($row['pos_name']); ?></td>
                <td><a href="<?php echo base_url();?>usermgt/users_controller/position_users/<?php echo $row['id'];?>"> Users <?php echo $row['users_count']?></a></td>
                <td><a class="text-success" href="<?php echo base_url(); ?>usermgt/users_controller/edit_position/<?php echo $row['id']; ?>"><i class="fa fa-pencil-square-o"> Edit</i></a>
                    <a class="text-danger" href="<?php echo base_url();?>usermgt/users_controller/delete_pos/<?php echo $row['id']?>">  <i class="fa fa-trash"> Delete</i></a>
                </td>
            </tr>
            <?php
            $count++;
        endforeach;
        ?>
    </tbody>
</table>
