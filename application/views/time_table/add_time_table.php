
<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>

</div>
<div class="row">
    <div class="col-lg-6">
        <form role="form" method="post" class="" action="<?php echo base_url(); ?>/timetable/time_table/upload_time_table" enctype="multipart/form-data">
            <div class="form-group">
                <label for="exampleInputEmail1 " class="col-lg-12">Course</label>
                <select name="course_id" class="selectpicker col-lg-12"  data-live-search="true">
                    <?php
                    if (isset($courses)) {
                        foreach ($courses as $course) {
                            echo '<option value="' . $course->course_id . '">' . $course->course . '</option>';
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1" class="col-lg-12">Year of Study</label>
                <select name="study_year" class="selectpicker col-lg-12"  data-live-search="true" >
                    <?php
                    foreach ($study_year as $year) {
                        echo '<option value="' . $year->year_id . '">' . $year->year . '</option>';
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
                <label for="group">Study Period</label>
                <select name="study_period" class="form-control">
                    <option value="Day">Day</option>
                    <option value="Evening">Evening</option>
                   </select>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1"></label>
                <input type="file" name="userfile" id="userfile">
            </div>
            <div class="form-group">
                <br>
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Upload time table") ?></button>
            </div>
        </form>
    </div>
</div>
