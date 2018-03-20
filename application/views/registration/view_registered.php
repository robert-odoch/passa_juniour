<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>

</div>



<div class="col-lg-12">
    <form role="form" method="post" class="form-inline" action="#" id="studentsForm">
        <div class="form-group">
            <label for="exampleInputEmail1 " class="col-lg-12">Course</label>
            <select name="course_id" class="selectpicker col-lg-12"  data-live-search="true">
                <?php
                if (isset($courses)) {
                    foreach ($courses as $course) {
                        echo '<option value="' . $course->course_id . '">' . $course->course_code . '</option>';
                    }
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1" class="col-lg-12">Intake</label>
            <select name="intake" class="selectpicker col-lg-12"  data-live-search="true" >
                <?php
                if (isset($intakes)) {
                    foreach ($intakes as $intake) {//intake_id,intake_name
                        echo '<option value="' . $intake["intake_id"] . '">' . $intake["intake_name"] . '</option>';
                    }
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1" class="col-lg-12">Year of Study</label>
            <select name="year_of_study" class="selectpicker col-lg-12"  data-live-search="true" >
                <?php
                foreach ($study_years as $study_year) {
                    echo '<option value="' . $study_year->year_id . '">' . $study_year->year . '</option>';
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1" class="col-lg-12">Semester </label>
            <select id="semester" class="selectpicker col-lg-12"  data-live-search="true" name="semester" >
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
            <button type="button" onclick="filterStudents()" class="btn btn-primary m-t-xs bottom15-xs">Filter students</button>
        </div>
    </form>
</div>
<div class="clearfix"></div
<br><br>
<div class="row">
    <div class="pull-left col-lg-4" id="test">
        <div class="col-lg-12">
            <div class="col-lg-6" id="excel"></div>
        </div>
    </div>
</div>
<br><br>
<div id="course_units">
    <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
            <tr>
                <th>No</th>
                <th>Registration Number</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Registered</th>
                <th>View Course Units</th>
            </tr>
        </thead>
        <tbody id="studentsTable">
            <?php
            $count = 1;
            if (isset($students)) {
                foreach ($students as $student):
                    ?>
                    <tr id="table_show">
                        <td><?php echo ucwords($count); ?></td>
                        <td><?php echo ucwords($student->registration_number); ?></td>
                        <td><?php echo ucwords($student->name); ?></td>
                        <td><?php echo ucwords($student->time_stamp); ?></td>
                    </tr>
                    <?php
                    $count++;
                endforeach;
            }
            ?>
        </tbody>
    </table>
</div>
<script>
    function filterStudents() {

        $.ajax({
            url: "<?php echo base_url("registration/Registrationcontroller/fetchRegistered"); ?>",
            type: 'POST',
            dataType: 'JSON',
            data: $('#studentsForm').serialize(),
            success: function (data, textStatus, jqXHR) {
//                $('#studentsTable').html(data);
                 // alert(data.data);
                $('#course_units').html(data.data);
                $('#example').DataTable();
                if (data.export_btn == true) {
                    $('#export_Btn').show();
                    $('#excel').html("<a href=\"<?php echo base_url(); ?>registration/registrationcontroller/exportRegistered/" + data.course_id + "/" + data.intake + "/" + data.study_year + "/" + data.semester + "\" class=\"btn btn-danger\" id=\"export_Btn\">Export registered</a>");
                } else {
                    $('#export_Btn').hide();
                    $('#download_Btn').hide()
                }


            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
</script>
