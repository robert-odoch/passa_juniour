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
        <form action="<?php echo base_url() ?>courses/Course_controller/submitCourse" method="POST">

           
            <div class="form-group"> 
                <label for="group">Subject</label>
                <input type="hidden" value="<?php echo ((isset($course)) ? $course->course_id : "") ?>" name="id">
                <input class="form-control m-t-xxs" id="course_unit"  name="courseName" value="<?= ((isset($course)) ? $course->course : "") ?>" placeholder="Enter subject  Name" type="text">

            </div>

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add Subject") ?></button>
            </div>
        </form>
    </div>
</div>



