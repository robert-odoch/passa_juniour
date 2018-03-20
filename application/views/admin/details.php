<button class="btn btn-success pull-right" id="all_actions_btn" onclick="addAdmin()"><i class="glyphicon glyphicon-plus"></i> Add User</button>
<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Contact</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($users) {
            foreach ($users as $user):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($user->firstName); ?></td>
                    <td><?php echo ucwords($user->lastName); ?></td>
                    <td><?php echo ucwords($user->email); ?></td>
                    <td><?php echo ucwords($user->contact); ?></td>
                    <td>Edit||Delete</td>
                </tr>
                <?php
                $count++;
            endforeach;
        }else {
            echo '<tr><td class="text-danger">No data found</td></tr>';
        }
        ?>
    </tbody>
</table>



<script>
    // call the auth type admin and display in  the modal
    function addAdmin() {
        $.ajax({
            url: "<?php echo base_url('admin/dashboard/get_users'); ?>",
            type: 'POST',
            dataType: 'JSON',
            success: function (data) {
                $('[name="userType"]').val(data.auth_type_id);
                //setting the university id
                $('[name="university_id_selected"]').val($("#pa").text());
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });

        $('#addUniversityAdminModal').modal('show');

    }
    //submit the eneter university admin
    function registerAdmin() {
        $.ajax({
            url: "<?php echo base_url(); ?>admin/dashboard/registerAdmin",
            dataType: 'JSON',
            type: 'POST',
            data: $('#admin_form').serialize(),
            success: function (data) {
                $('#addUniversityAdminModal').modal('hide');
                $('#admin_form')[0].reset();
                $('#myModal').modal('show');
                toastr.success('staff addedd successfully.', 'Success Alert', {timeOut: 8000});
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }

        });
    }

</script>


