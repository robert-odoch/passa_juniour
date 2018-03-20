
<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>

</div>
<br><br>



<div class="container">
    <div class="clearfix"></div>
    <div class="col-lg-12">
        <h3 class="head">Please upload students csv format file</h3>
        <form role="form" method="post" class="form-inline" action="<?php echo base_url(); ?>students/Students_controller/uploadCourseStudents" id="courses_form"enctype="multipart/form-data">
            <div class="form-group">
                <label for="exampleInputEmail1"></label>
                <input type="file" name="userfile" id="userfile">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Upload students") ?></button>
            </div>
        </form>
    </div>


</div>



