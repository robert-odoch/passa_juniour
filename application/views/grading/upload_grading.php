<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>

</div>



<div class="container">
    <div class="clearfix"></div>
    <div class="col-lg-12">
        <h3 class="head"> upload Grading excel file here</h3>
        <div class="col-md-6">
            <form role="form" method="post" action="<?php echo base_url(); ?>grading/grading_controller/uploadGrading" id="courses_form" enctype="multipart/form-data">
                <div class="form-group">
                    <select name="level" class="form-control">
                        <option value="null">---select graduate level--</option>
                        <option value="0">Under graduate level</option>
                        <option value="1">Post graduate level</option>
                    </select>
                </div>
                <div class="form-group">
                    <input type="file" name="userfile" id="userfile">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Upload Grading") ?></button>
                </div>
            </form>
        </div>
    </div>
</div>