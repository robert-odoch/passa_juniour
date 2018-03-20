<br>
<button class="btn btn-success pull-right" id="all_actions_btn" onclick="AssignMenu()"><i class="glyphicon glyphicon-plus"></i>Assign Menu</button>
<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>User Position</th>
            <th>Menu</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($menu_assigned) {
            foreach ($menu_assigned as $menu):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td> <?php echo ucwords($menu->position); ?></td>
                    <td> <?php echo ucwords($menu->menu_name); ?></td>
                    <td> <a href="#" onclick="editCourse(<?php echo $menu->assignmet_id; ?>)">Edit</a> || <a href="#" onclick="deleteCourse(<?php echo $menu->assignmet_id; ?>)">Delete</a></td>
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
    function AssignMenu() {
        save_method = "add";
        $('#menuModal').modal('show');
        $('#menu_form')[0].reset();
    }
    function submitMenuAssigment() {
        $.ajax({
            url: "<?php echo base_url("global/globalcontroller/submitMenu"); ?>",
            type: 'POST',
            dataType: 'JSON',
            data: $('#menu_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                alert(data.message);
               // toastr.success('Action successful.', 'Success Alert', {timeOut: 8000});
                location.reload();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        })
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

<div class="modal fade" id="menuModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Assign User Menu</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="" id="menu_form">
                    <div class="form-group">
                        <label for="exampleInputEmail1">User positions</label>
                        <select class="form-control" name="position">
                            <?php
                            if (isset($positions)) {
                                foreach ($positions as $positions):
                                    echo '<option value="' . $positions->position_id . '">' . $positions->position . '</option>';
                                endforeach;
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Menu</label>
                        <select class="form-control" name="menu">
                            <?php
                            if (isset($added_menu)) {
                                foreach ($added_menu as $menu):
                                    echo '<option value="' . $menu->menu_id . '">' . $menu->menu_name . '</option>';
                                endforeach;
                            }
                            ?>
                        </select>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submitMenuAssigment()">Save changes</button>
            </div>
        </div> 
    </div> 
</div> 