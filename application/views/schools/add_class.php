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
        <form action="<?php echo base_url() ?>/schools/schools_controller/save_class" method="POST">
           
            <div class="form-group"> 
                <label for="group" value="<?php echo set_value('year'); ?>" size="50">class Name</label>
                <input type="hidden" value="<?php echo ((isset($dept)) ? $dept->dept_id : "") ?>" name="id">
                <input class="form-control m-t-xxs" id="dept"  name="dept" value="<?php echo ((isset($dept)) ? $dept->dept : "") ?>" placeholder="Enter class name here" type="text">
            </div>
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add class") ?></button>
            </div>
        </form>
    </div>
</div>



