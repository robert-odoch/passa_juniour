<br>
<button class="btn btn-success pull-right" id="all_actions_btn" onclick="addStaff()"><i class="glyphicon glyphicon-plus"></i> Add Staff</button>
<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Position</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($staff) {
            foreach ($staff as $staff):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($staff->firstName); ?></td>
                    <td><?php echo ucwords($staff->lastName); ?></td>
                    <td><?php echo ucwords($staff->email); ?></td>
                    <td><?php echo ucwords($staff->contact); ?></td>
                    <td><?php
                        if ($staff->position != null)
                            echo '<a href="#" onclick="update_position(' . $staff->user_id . ')">' . ucwords($staff->position) . '</a>';
                        else
                            echo '<a href="#" onclick="assign_positions(' . $staff->user_id . ')">none</a>';
                        ?></td>
                    <td> <a href="#" onclick="editStaff(<?php echo $staff->user_id; ?>)">Edit</a> || <a href="#" onclick="deleteStaff(<?php echo $staff->user_id; ?>)">Delete</a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }else {
            //echo '<tr><td class="text-danger">No data found</td></tr>';
        }
        ?>
    </tbody>
</table>

<script>
    var save_postion_method;
    function  assign_positions(user_id) {
        save_postion_method = "save";
        $('[name="user_id"]').val(user_id);
        $('#save_btn').text('assign staff Position');
        $('#assignPositionModal').modal('show');
    }
    function assignStaffRole() {
        var url;
        if (save_postion_method == "save") {
            url = "<?php echo base_url('university/dashboard/submitStaffPosition'); ?>";
        } else {
            url = "<?php echo base_url('university/dashboard/submitStaffPosition'); ?>";
        }
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'JSON',
            data: $('#assign_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                $('#assignPositionModal').modal('hide');
                location.reload();
                toastr.success('Action successful.', 'Success Alert', {timeOut: 8000});
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function update_position(staff_id) {
        $('#save_btn').text('update staff Position');
        save_postion_method = "update";
        $.ajax({
            url: "<?php echo base_url('university/dashboard/updateUserPosition/'); ?>/" + staff_id,
            type: 'POST',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('[name="user_id"]').val(data.users_user_id);
                $('[name="positions"]').val(data.positions_position_id);
                $('#assignPositionModal').modal('show');

            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }

</script>


<script type="text/javascript">
    var save_staff;
    function addStaff() {
        save_staff = "save";
        $('#staff_form')[0].reset();
        $('#addUniversityStaffModal').modal('show');
    }
    function registerStaff() {
        var url;
        if (save_staff == "save") {
            url = "<?php echo base_url('university/dashboard/submitStaff') ?>";
        } else {
            url = "<?php echo base_url('university/dashboard/updateStaff') ?>";
        }
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'JSON',
            data: $('#staff_form').serialize(),
            success: function (data) {
                $('#addUniversityStaffModal').modal('hide');
                toastr.success('Action successful.', 'Success Alert', {timeOut: 8000});
                location.reload();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function editStaff(staff_id) {
        save_staff = "update";
        $.ajax({
            url: "<?php echo base_url('university/dashboard/editStaffDetails/'); ?>/" + staff_id,
            type: 'POST',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('[name="staff_user_id"]').val(data.user_id);
                $('[name="firstName"]').val(data.firstName);
                $('[name="lastName"]').val(data.lastName);
                $('[name="email"]').val(data.email);
                $('[name="contact"]').val(data.contact);
                $('#addUniversityStaffModal').modal('show');
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function deleteStaff(staff_id) {
        if (confirm("Are you sure want to delete")) {
            $.ajax({
                url: "<?php echo base_url('university/dashboard/deleteSaff/') ?>/" + staff_id,
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


<!--adding university staff-->
<div class="modal fade" id="addUniversityStaffModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Register Staff</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="" id="staff_form">
                    <div class="form-group">
                        <label for="exampleInputEmail1">First Name</label>
                        <input type="text" class="form-control" name="firstName" id="exampleInputEmail1" placeholder="First Name">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Last Name</label>
                        <input type="text" class="form-control" name="lastName" id="exampleInputPassword1" placeholder="Last Name">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Email</label>
                        <input type="email" class="form-control" name="email" id="exampleInputPassword1" placeholder="Email Address">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Contact</label>
                        <input type="text" class="form-control" name="contact" id="contact" placeholder="Telephone Number">
                    </div>
                    <input type="hidden" class="form-control" name="staff_user_id">
                    <!--                    <div class="form-group">
                                            <label for="exampleInputPassword1">Profile Image</label>
                                            <input type="file"  name="short_name" id="exampleInputPassword1">
                                        </div>-->

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="registerStaff()">Save changes</button>
            </div>
        </div> 
    </div> 
</div> 


<!--assigning positions to staff members--> 
<div class="modal fade" id="assignPositionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Assign staff role</h4>
            </div>
            <div class="modal-body">

                <form role="form" method="post" action="" id="assign_form">
                    <div class="form-group form-group-select2" >
                        <select id="positions" class="form-control" name="positions">
                            <option value="null">--select position---</option>
                            <?php
                            foreach ($positions as $position) {
                                echo '<option value="' . $position->position_id . '">' . $position->position . '</option>';
                            }
                            ?>
                        </select>
                    </div>
                    <input type="hidden" name="user_id" placeholder="staff user id">
                </form>



            </div>
            <div class="modal-footer">
                <p id="pa" class="hidden"></p>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="save_btn" class="btn btn-primary" onclick="assignStaffRole()">Save changes</button>
            </div>
        </div> 
    </div> 
</div> 
