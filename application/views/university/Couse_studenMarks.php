<br>
<button class="btn btn-success pull-right" id="all_actions_btn" onclick="AddSingleStudentMarks()"><i class="glyphicon glyphicon-plus"></i> Add Single student Marks</button>
<button class="btn btn-success pull-right" id="all_actions_btn" onclick="uploadGeneralMarks()"><i class="glyphicon glyphicon-plus"></i> Upload marks</button>
<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>Reg No:</th>
            <?php
            foreach ($course_units as $units):
                echo '<th>' . $units->course_unit . '</th>';
            endforeach;
            ?>
            <!--<th>Course Unit</th>-->
            <th>Mark</th>
            <th>Grade</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($marks) {
            foreach ($marks as $mark):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($mark->reg_no); ?></td>
                    <td><?php echo ucwords($mark->course_unit); ?></td>
                    <td><?php echo ucwords($mark->mark); ?></td>
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
    function uploadGeneralMarks() {
        $('#uploadStudentMarksModal').modal('show');
    }
    //show single student marks form modal
    function AddSingleStudentMarks() {
        $('#addStudentMarksModal').modal('show');
    }
    function editMark(mark_id) {
        $.ajax({
            url: "<?php echo base_url('university/dashboard/editMark/'); ?>/" + mark_id,
            type: 'POST',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('[name="registration_number"]').val(data.reg_number);
                $('[name="course_unit"]').val(data.course_unit);
                $('[name="mark"]').val(data.mark);
                $('[name="grade"]').val(data.grade);
                $('[name="academic_year"]').val(data.academic_years_year_id);
                $('[name="semester"]').val(data.semesters_semester_id);
                $('[name="marks_id"]').val(data.marks_id);
                $('#editMarksModal').modal('show');
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }

    function updateMarks() {
        $.ajax({
            url: "<?php echo base_url('university/dashboard/updateMarks'); ?>",
            type: 'POST',
            dataType: 'JSON',
            data: $('#updatemarks_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                toastr.success('Action successful.', 'Success Alert', {timeOut: 8000});
                location.reload();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }

    function uploadgeneralStudentsMarks() {

    }
</script>


<!--uploading general marks-->
<div class="modal fade" id="uploadStudentMarksModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Upload <?php echo $course_name; ?> marks</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="<?php echo base_url(); ?>university/dashboard/uploadAllStudentMarks" id="student_form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Academic Year</label>
                        <select name="academic_year" class="form-control">
                            <?php
                            if (isset($acad_years)) {
                                foreach ($acad_years as $year) {
                                    echo '<option value="' . $year->academic_year_id . '">' . $year->academic_year . '</option>';
                                }
                            } else {
                                echo '<option> no data</option>';
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Semester </label>
                        <select id="semester" class="form-control" name="semester" >
                            <?php
                            if (isset($semesters)) {
                                foreach ($semesters as $semester) {
                                    echo '<option value="' . $semester->semester_id . '">' . $semester->semester . '</option>';
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">upload Marks document csv file </label>
                        <input type="file" name="userfile">
                    </div>
                    <input type="hidden" name="course_id" value="<?php echo $course_id; ?>">
                    <button type="submit" name="submit" class="btn btn-info">Save</button>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div> 
    </div> 
</div> 


<!--Add single student marks-->

<div class="modal fade" id="addStudentMarksModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Add single Student Marks</h4>
            </div>
            <div class="modal-body">

                <form role="form" method="post" action="<?php echo base_url(); ?>university/dashboard/uploadStudentMarks" id="student_form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Registration Number</label>
                        <input type="text" name="registration_number" id="registration_number" placeholder="Reg No:" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Academic Year</label>
                        <select name="academic_year" class="form-control">
                            <?php
                            if (isset($acad_years)) {
                                foreach ($acad_years as $year) {
                                    echo '<option value="' . $year->academic_year_id . '">' . $year->academic_year . '</option>';
                                }
                            } else {
                                echo '<option> no data</option>';
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Semester </label>
                        <select id="semester" class="form-control" name="semester" >
                            <?php
                            if (isset($semesters)) {
                                foreach ($semesters as $semester) {
                                    echo '<option value="' . $semester->semester_id . '">' . $semester->semester . '</option>';
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">upload Marks document csv file </label>
                        <input type="file" name="userfile">
                    </div>
                    <input type="hidden" name="course_id" value="<?php echo $course_id; ?>">
                    <button type="submit" name="submit" class="btn btn-info">Save</button>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div> 
    </div> 
</div> 

<!--editing student marks-->
<div class="modal fade" id="editMarksModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Add single Student Marks</h4>
            </div>
            <div class="modal-body">

                <form role="form" method="post" action="" id="updatemarks_form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Registration Number</label>
                        <input type="text" name="registration_number" id="registration_number" placeholder="Reg No:" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Course Unit</label>
                        <input type="text" name="course_unit" id="mark" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Mark</label>
                        <input type="text" name="mark" id="mark" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Grade</label>
                        <input type="text" name="grade" id="grade" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Academic Year</label>
                        <select name="academic_year" class="form-control">
                            <?php
                            if (isset($acad_years)) {
                                foreach ($acad_years as $year) {
                                    echo '<option value="' . $year->academic_year_id . '">' . $year->academic_year . '</option>';
                                }
                            } else {
                                echo '<option> no data</option>';
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Semester </label>
                        <select id="semester" class="form-control" name="semester" >
                            <?php
                            if (isset($semesters)) {
                                foreach ($semesters as $semester) {
                                    echo '<option value="' . $semester->semester_id . '">' . $semester->semester . '</option>';
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <input type="hidden" name="marks_id">

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="updateMarks()">Save changes</button>
            </div>
        </div> 
    </div> 
</div> 