
<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>

</div>

<div class="row">
    <div class="col-lg-12">
        <div class="col-md-6">
            <form role="form" method="post" class="" action="<?php echo base_url(); ?>marks/mini_statement/generate_statement" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="exampleInputEmail1 " class="col-lg-12">Course</label>
                    <select name="course_id" id="course_id" class="selectpicker col-lg-12"  data-live-search="true">
                        <option value="null">--select course--</option>
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
                    <label for="exampleInputEmail1" class="col-lg-12">Intake</label>
                    <select name="intake" id="intake" class="selectpicker col-lg-12"  data-live-search="true" >
                        <?php
                        foreach ($intakes as $intake) {
                            echo '<option value="' . $intake->intake_id . '">' . $intake->intake_name . '</option>';
                        }
                        ?>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1" class="col-lg-12">Year of Study</label>
                    <select name="academic_year" class="selectpicker col-lg-12"  data-live-search="true" >
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
                    <label for="exampleInputEmail1" class="col-lg-12">Registration Number </label>
                    <div id="reg_nos">
                        <select class="form-control">
                            <option>--select registration number--</option>
                        </select>
                    </div>
                </div>
                <div class="form-group col-lg-12">
                    <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Generate statement") ?></button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script>
    $('#course_id').change(function () {
        var id = $(this).val();
        if (id == "") {
        } else {
            fetch_reg_no(id);
        }
    });
    function fetch_reg_no(id) {
        var intake = $('#intake').val();
        $.ajax({
            url: "<?php echo base_url("marks/marks_controller/fetch_reg_nos") ?>/" + id + "/" + intake,
            type: 'POST',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('#reg_nos').html(data);
                $('.selectpicker').selectpicker();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown)
            }
        });
    }

</script>
