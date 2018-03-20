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
        <form action="<?php echo base_url() ?>chat/chat_controller/submitGroup" method="POST">

            <div class="form-group"> 
                <label for="group">Group Name</label>
                <input type="hidden" value="<?php echo ((isset($year)) ? $year->academic_year_id : "") ?>" name="id">
                <input class="form-control m-t-xxs" id="year"  name="group_name" value="<?php echo ((isset($year)) ? $year->academic_year : "") ?>" placeholder="Enter Group Name" type="text">

            </div>

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "register Group") ?></button>
            </div>
        </form>
    </div>
</div>



