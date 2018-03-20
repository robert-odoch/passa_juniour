
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
        <form action="<?php echo base_url() ?>course_units/Units_controller/uploadCourseUnits" method="POST" enctype="multipart/form-data">
            <div class="form-group"> 
                <label for="exampleInputEmail1">Please upload course units csv format file</label>
                <input type="file" name="userfile" id="userfile">
            </div> 
            <div class="form-group">
                <button type="submit" class="btn btn-primary m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Upload Course Units") ?></button>
            </div>
        </form>
    </div>
</div>




