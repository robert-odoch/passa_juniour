<br>
<button class="btn btn-success pull-right" id="all_actions_btn" onclick="AddCourseStudent(<?php echo $course_id; ?>)"><i class="glyphicon glyphicon-plus"></i> Add Single student</button>
<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>Reg No:</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th>Phone</th>
            <th>Email</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($students) {
            foreach ($students as $students):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($students->registration_number); ?></td>
                    <td><?php echo ucwords($students->firstName); ?></td>
                    <td><?php echo ucwords($students->lastName); ?></td>
                    <td><?php echo ucwords($students->gender); ?></td>
                    <td><?php echo ucwords($students->contact); ?></td>
                    <td><?php echo ucwords($students->email); ?></td>
                    <td> <a href="#" onclick="editStudent(<?php echo $students->student_id; ?>)">Edit</a> || <a href="#" onclick="deleteStudent(<?php echo $students->student_id; ?>)">Delete</a></td>
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
    var save_method;
    //show upload students modal
    function uploadCourseStudents(course_id) {
        $('[name="course_id"]').val(course_id);
        $('#uploadStudentsModal').modal('show');
    }
    //show single student form modal
    function AddCourseStudent(course_id) {
        save_method = "add";
        $('#addStudentModal').modal('show');
        $('[name="course_id"]').val(course_id);
    }
    //register student
    function submitStudent() {
        var url;
        if (save_method == "add") {
            url = "<?php echo base_url('university/dashboard/addSingleStudent'); ?>";
        } else {
            url = "<?php echo base_url('university/dashboard/updateStudent'); ?>"
        }
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'JSON',
            data: $('#student_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                $('#student_form')[0].reset();
                $('#addStudentModal').modal('hide');
                location.reload();
                toastr.success('Action successful.', 'Success Alert', {timeOut: 8000});
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function editStudent(student_id) {
        save_method = "update";
        $.ajax({
            url: "<?php echo base_url('university/dashboard/editStudent/'); ?>/" + student_id,
            type: 'POST',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('[name="registration_number"]').val(data.registration_number);
                $('[name="firstName"]').val(data.firstName);
                $('[name="lastName"]').val(data.lastName);
                $('[name="gender"]').val(data.gender);
                $('[name="contact"]').val(data.contact);
                $('[name="email"]').val(data.email);
                $('[name="course_id"]').val(data.courses_course_id);
                $('[name="gender"]').val(data.gender);
                $('[name="student_id"]').val(data.student_id);
                $('[name="intake_id"]').val(data.intake_intake_id);
                $('#addStudentModal').modal('show');
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function deleteStudent(student_id) {
        if (confirm("Are sure want to delete?")) {
            $.ajax({
                url: "<?php echo base_url('university/dashboard/deleteStudent/'); ?>/" + student_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    toastr.success('Action successful.', 'Success Alert', {timeOut: 8000});
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
</script>



<!--register student-->

<div class="modal fade" id="addStudentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Register Student</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="" id="student_form">
                    <div class="form-group">
                        <label for="exampleInputEmail">Intake</label>
                        <select name="intake_id" class="form-control selectpicker"  data-live-search="true">

                            <?php
                            if ($intake):
                                foreach ($intake as $intake):
                                    echo '<option value="' . $intake->intake_id . '">' . $intake->intake_name . '</option>';
                                endforeach;
                            endif;
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Registration Number</label>
                        <input type="text" name="registration_number" id="registration_number" placeholder="Reg No:" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">First Name</label>
                        <input type="text" name="firstName" id="firstName" placeholder="First Name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Last Name</label>
                        <input type="text" name="lastName" id="lastName" placeholder="Last Name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Gender </label>
                        <input type="radio" name="gender" id="gender" value="Male">Male
                        <input type="radio" name="gender" id="gender" value="Female">Female
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Contact</label>
                        <input type="text" name="contact" id="contact" placeholder="Telephone Number" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="text" name="email" id="email" placeholder="Email Address" class="form-control">
                    </div>

                    <input type="hidden" name="course_id" id="course_id" placeholder="course_id">
                    <input type="hidden" name="student_id" placeholder="student id" class="form-control">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submitStudent()">Save changes</button>
            </div>
        </div> 
    </div> 
</div> 