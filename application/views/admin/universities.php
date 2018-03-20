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
            <th>University</th>
            <th>Short Name</th>
            <th>Banner</th>
            <th>Users</th>
            <th>Active</th>
            <th>Settings</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        foreach ($universities as $university):
            ?>
            <tr>
                <td><?php echo ucwords($count); ?></td>
                <td><?php echo ucwords($university->university); ?></td>
                <td><?php echo ucwords($university->short_name); ?></td>
                <td><a href="<?php echo base_url(); ?>admin/dashboard/university_banner/<?php echo $university->university_id; ?>">Banner</a></td>
                <td> <a class="text-warning" href="<?php echo base_url("admin/dashboard/users/" . $university->university_id); ?>">Add Users</a></td>
                <td> 
                    <?php
                    if ($university->_status == 0) {
                        echo ' <a class="text-success" href="#" onclick="blockUser(' . $university->university_id . ')" > 
                            <i class="fa fa-eye"> Block</i></a> ';
                    } else {
                        echo ' <a class="text-danger" href="#"  onclick="UnblockUser(' . $university->university_id . ')"> 
                            <i class="fa fa-eye-slash"> Blocked</i></a> ';
                    }
                    ?>

                </td>
                <td> <a class="text-primary" href="<?php echo base_url("admin/dashboard/registration/" . $university->university_id); ?>">Settings</a></td>
                <td><a href="<?php echo base_url() ?>admin/dashboard/editUniversity/<?php echo $university->university_id; ?>" class="text-success">
                        <i class="fa fa-pencil-square-o"> Edit</i></a> ||
                    <a href="#" class="text-danger" onclick="deleteUniversity(<?php echo $university->university_id; ?>)">
                        <i class="fa fa-trash"> Delete</i></a>
                </td>
            </tr>
            <?php
            $count++;
        endforeach;
        ?>
    </tbody>
</table>
<script>

    function deleteUniversity(university_id) {
        if (confirm("Are you sure want to delete?")) {
            $.ajax({
                url: "<?php echo base_url('admin/dashboard/deleteUniversity/'); ?>/" + university_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert('University deleted successfully');
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }

</script>

<script>
    function blockUser(university_id) {
        if (confirm("Are you sure want to block this university")) {
            $.ajax({
                url: "<?php echo base_url('admin/dashboard/block_university'); ?>/" + university_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
    function UnblockUser(university_id) {
        if (confirm("Are you sure want to unblock this university")) {
            $.ajax({
                url: "<?php echo base_url('admin/dashboard/unblock_university'); ?>/" + university_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
</script>


