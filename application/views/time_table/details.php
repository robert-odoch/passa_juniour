<div class="container">
    <div class="col-md-12">
        <?php
        $msg = $this->session->flashdata('msg');
        if (isset($msg)):
            ?>

            <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

        <?php endif; ?>

    </div>

    <div class="col-lg-12">
        <form role="form" method="post" class="form-inline" action="<?php echo base_url(); ?>timetable/time_table/update" enctype="multipart/form-data">
            <div class="form-group">
                <label for="exampleInputEmail1 " class="col-lg-12">Course</label>
                <select name="course_id" class="selectpicker col-lg-12"  data-live-search="true">
                    <?php
                    foreach ($courses as $course):
                        ?>
                        <option value="<?= $course->course_id ?>" <?php echo ((isset($time_table) && $course->course_id == $time_table->course_id ) ? "selected" : "") ?> >
                            <?php echo $course->course ?>
                        </option>
                        <?php
                    endforeach;
                    ?>

                </select>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1" class="col-lg-12">Year of Study</label>
                <select name="study_year" class="selectpicker col-lg-12"  data-live-search="true" >
                    <?php
                    foreach ($study_year as $year):
                        ?>
                        <option value="<?= $year->year_id ?>" <?php echo ((isset($time_table) && $year->year_id == $time_table->study_year ) ? "selected" : "") ?> >
                            <?php echo $year->year ?>
                        </option>
                        <?php
                    endforeach;
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1" class="col-lg-12">Semester </label>
                <select id="semester" class="selectpicker col-lg-12"  data-live-search="true" name="semester" >
                    <?php
                    foreach ($semesters as $semester):
                        ?>
                        <option value="<?= $semester->semester_id ?>" <?php echo ((isset($time_table) && $semester->semester_id == $time_table->semester_id ) ? "selected" : "") ?> >
                            <?php echo $semester->semester ?>
                        </option>
                        <?php
                    endforeach;
                    ?>

                </select>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1" class="col-lg-12">Study Period </label>
                <select id="study_period" class="selectpicker col-lg-12"  data-live-search="true" name="study_period" >
                  
                         <option value="Day" <?php echo ((isset($time_table) && "Day"== $time_table->study_period ) ? "selected" : "") ?>>Day</option>
                     <option value="Evening"<?php echo ((isset($time_table) && "Evening"== $time_table->study_period ) ? "selected" : "") ?>>Evening</option>
                    
                </select>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1"></label>
                <input type="file" name="userfile" id="userfile">
            </div>
            <div class="form-group">
                <br>
                <button type="submit" class="btn btn-danger m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Change TimeTable") ?></button>
            </div>
        </form>
    </div>

    <div class="clearfix"></div>
    <br><br>
    <div class="col-lg-11">
        <embed src="<?php echo base_url(); ?>upload/time_table/<?= $time_table->time_table; ?>"   height="500px" width="100%" class="responsive">

    </div>

</div>

