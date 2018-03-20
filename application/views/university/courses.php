<br>
<button class="btn btn-success pull-right" id="all_actions_btn" onclick="AddCourse()"><i class="glyphicon glyphicon-plus"></i> Add Single Course</button>
<a href="<?php echo base_url("courses/Course_controller/exportCourses"); ?>" style="margin-left: 20px;" class="btn btn-default" id="all_actions_btn">
    <i class="fa fa-file-excel-o"></i> &nbsp;Export Courses</a>
<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($courses) {
            foreach ($courses as $course):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($course->course_code); ?></td>
                    <td> <?php echo ucwords($course->course); ?></td>
                    <td> <a href="#" onclick="editCourse(<?php echo $course->course_id; ?>)">Edit</a> || <a href="#" onclick="deleteCourse(<?php echo $course->course_id; ?>)">Delete</a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>

<script>
    var save_method;
    function uploadCourses() {
        $('#uploadCoursesModal').modal('show');
    }
    function AddCourse() {
        save_method = "add";
        $('#CourseModal').modal('show');
        $('#course_form')[0].reset();
    }
    function submitCourse() {
        var url;
        if (save_method == "add") {
            url = "<?php echo base_url('university/dashboard/submitCourse'); ?>";
        } else {
            url = "<?php echo base_url('university/dashboard/updateCourse'); ?>";
        }
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'JSON',
            data: $('#course_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                $('#CourseModal').modal('hide');
                $('#course_form')[0].reset();
                toastr.success('Action successful.', 'Success Alert', {timeOut: 8000});
                location.reload();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
//edit the course details
    function editCourse(course_id) {
        save_method = "update";
        $.ajax({
            url: "<?php echo base_url('university/dashboard/editCourse/'); ?>/" + course_id,
            type: 'GET',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('[name="course_id"]').val(data.course_id);
                $('[name="course_code"]').val(data.course_code);
                $('[name="course"]').val(data.course);
                $('#CourseModal').modal('show');
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function deleteCourse(course_id) {
        if (confirm("Are you sure want to delete")) {
            $.ajax({
                url: "<?php echo base_url('university/dashboard/deleteCourse/'); ?>/" + course_id,
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
    //show single course students
    function showCourseStudents($course_id) {
        $.ajax({
            url: "<?php echo base_url('university/dashboard/courseStudents/'); ?>/" + $course_id,
            type: 'POST',
            dataType: 'TEXT',
            success: function (data, textStatus, jqXHR) {

            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }

        });
    }

</script>


<!--uploading courses-->



<!--insert single course-->

<div class="modal fade" id="CourseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Register course</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="" id="course_form">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Course Code</label>
                        <input type="text" name="course_code" id="course_code" placeholder="Course Code eg(). BCS" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Course</label>
                        <input type="text" name="course" id="course" placeholder="Course Name" class="form-control">
                    </div>
                    <input type="hidden" name="course_id" id="course_id" placeholder="course_id">

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submitCourse()">Save changes</button>
            </div>
        </div> 
    </div> 
</div> 