`<div class="row"> 
    <div class="col-md-12">
        <?php
        $msg = $this->session->flashdata('msg');
        if ((isset($msg)) && (!empty($msg))) :
            ?>

            <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

        <?php endif; ?>



    </div>
    <div class="col-md-6">
        <form action="<?php echo base_url() ?>grading/grading_controller/submitGrade" method="POST">

            <div class="form-group"> 
                <label for="group">Grade</label>
                <input type="hidden" value="<?php echo ((isset($grading)) ? $grading->grading_id : "") ?>" name="id">
                <input class="form-control m-t-xxs" id="grade"  name="grade" value="<?php echo ((isset($grading)) ? $grading->grade : "") ?>" placeholder="Enter Grade here Eg(A)" type="text">
            </div>
            <div class="form-group"> 
                <label for="group">first Mark</label>
                <input class="form-control m-t-xxs" id="mark_one"  name="mark_one" value="<?php echo ((isset($grading)) ? $grading->value_frm : "") ?>" placeholder="Enter first mark Eg.80" type="number">
            </div>
            <div class="form-group"> 
                <label for="group">Second Mark</label>
                <input class="form-control m-t-xxs" id="mark_two"  name="mark_two" value="<?php echo ((isset($grading)) ? $grading->value_to : "") ?>" placeholder="Enter Second mark Eg 100" type="number">
            </div>
            <div class="form-group"> 
                <label for="group">Grade Value</label>
                <input class="form-control m-t-xxs" id="value"  name="mark_value" value="<?php echo ((isset($grading)) ? $grading->grade_value : "") ?>" placeholder="Enter Grade Value Eg. 5.0" type="text">
            </div>
            <div class="form-group">
                <label for="group">Progress status</label>
                <select class="form-control" name="progress_status">
                    <?php
                    if (isset($grading)):
                        if ($grading->progress == 0):
                            echo '<option value="' . $grading->progress . '">Normal Progress</option>';
                            echo '<option value="1">Retake</option>';
                        else:
                            echo '<option value="' . $grading->progress . '">Retake</option>';
                            echo '<option value="0">Normal Progress</option>';
                        endif;
                    else:
                        echo '<option value="0">Normal Progress</option>';
                        echo '<option value="1">Retake</option>';
                    endif;
                    ?>

                </select>
            </div>


            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add grading") ?></button>
            </div>
        </form>
    </div>
</div>



