<div class="row">
    <?php
    $msg = $this->session->flashdata('message');
    if (isset($msg)):
        ?>
        <div class="alert alert-success col-md-7"> <?php echo $msg ?>. </div>
    <?php endif; ?>
</div>

<div class="clearfix"></div>
<div class="container">
    <h3 class="head">Please upload marks excel format file</h3>
    <div class="col-lg-12">


        <form role="form" method="post" class="form-inline" action="<?php echo base_url(); ?>marks/marks_controller/uploadAllStudentMarks" enctype="multipart/form-data">
           
            <div class="form-group">
                <label for="exampleInputEmail1" class="col-lg-12">Year Of Study</label>
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
                <label for="exampleInputEmail1"></label>
                <input type="file" name="userfile" id="userfile">
            </div>
            <div class="form-group">
                <br>
                <button type="submit" class="btn btn-primary m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Upload marks") ?></button>
            </div>
        </form>
    </div>
</div>

