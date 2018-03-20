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
        <form action="<?php echo base_url() ?>years/yearcontroller/submitIntake" method="POST">

            <div class="form-group"> 
                <label for="group">Intake</label>
                <input type="hidden" value="<?php echo ((isset($intake)) ? $intake->intake_id : "") ?>" name="id">
                <input  value="<?php echo ((isset($intake)) ? $intake->intake_name : "") ?>" class="form-control m-t-xxs" id="year"  name="intake" placeholder="Enter Intake here" type="text">
            </div>

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Register Intake") ?></button>
            </div>
        </form>
    </div>
</div>



