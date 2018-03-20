<div class="row"> 
    <div class="col-md-12">
        <?php
        $msg = $this->session->flashdata('msg');
        if ((isset($msg)) && (!empty($msg))) :
            ?>

            <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

        <?php endif; ?>



    </div>
    <div class="col-md-6">
        <form action="<?php echo base_url() ?>marks/Marks_controller/updatemark" method="POST">

            <div class="form-group"> 
                <label for="group">Course Work</label>
                <input class="form-control m-t-xxs" id="cw"  name="cw" value="<?php echo ((isset($student_mark)) ? $student_mark->cw : "") ?>" placeholder="" type="text">
         

            </div>
            <div class="form-group"> 
                <label for="group">Test Exam</label>
                <input type="hidden" value="<?php echo ((isset($student_mark)) ? $student_mark->marks_id : "") ?>" name="id">
                <input class="form-control m-t-xxs" id="ex"  name="ex" value="<?php echo ((isset($student_mark)) ? $student_mark->ex : "") ?>" placeholder="" type="text">

            </div>
            <div class="form-group"> 
                <label for="group">Final Exam</label>
                <input class="form-control m-t-xxs" id="fn"  name="fn" value="<?php echo ((isset($student_mark)) ? $student_mark->fn : "") ?>" placeholder="" type="text">

            </div>
            <div class="form-group"> 
                <label for="group">year of study</label>
                <select class="form-control m-t-xxs" name="study_year">
                    <option value="null">--choose year of study --</option>
                    <?php
                    foreach ($study_years as $row):
                        ?>
                        <option value="<?= $row->year_id ?>" <?php echo ((isset($student_mark) && $row->year_id == $student_mark->study_year ) ? "selected" : "") ?> >
                            <?php echo $row->year ?>
                        </option>
                        <?php
                   endforeach;
                    ?>


                </select>
            </div>
            <div class="form-group"> 
                <label for="group">semester</label>
                <select class="form-control m-t-xxs" name="semester">
                    <option value="null">--choose semester--</option>
                    <?php
                    foreach ($semesters as $row):
                        ?>
                        <option value="<?= $row->semester_id ?>" <?php echo ((isset($student_mark) && $row->semester_id == $student_mark->semester ) ? "selected" : "") ?> >
                            <?php echo $row->semester ?>
                        </option>
                        <?php
                   endforeach;
                    ?>


                </select>
            </div>

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "submit update") ?></button>
            </div>
        </form>
    </div>
</div>



