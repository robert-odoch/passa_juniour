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
        <form action="<?php echo base_url() ?>marks/marks_controller/updateMarks" method="POST">

            <div class="form-group"> 
                <label for="group">Course Unit</label>
                <input type="hidden" value="<?php echo ((isset($marks)) ? $marks->marks_id : "") ?>" name="id">
                <input  value="<?php echo ((isset($marks)) ? $marks->course_unit : "") ?>" class="form-control m-t-xxs" id="course_unit"  name="course_unit" placeholder="Enter course unit here" type="text">
            </div>
            <div class="form-group"> 
                <label for="group">Mark</label>
                <input  value="<?php echo ((isset($marks)) ? $marks->mark : "") ?>" class="form-control m-t-xxs" id="mark"  name="mark" placeholder="Enter Marks here" type="number">
            </div>

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Update Marks") ?></button>
            </div>
        </form>
    </div>
</div>



