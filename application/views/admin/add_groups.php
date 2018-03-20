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
        <form action="<?php echo base_url() ?>admin/dashboard/add_group" method="POST">

            <div class="form-group"> 
                <label for="group">User Group</label>
                <input class="form-control m-t-xxs" id="group"  name="group_name" placeholder="Enter User group" type="text">

            </div>
            <div class="form-group"> 
                <label for="group">System Controller</label>
                <select class="form-control" name="controller">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                </select>
            </div>
            <input type="hidden" value="<?= $university_id ?>" name="university_id">  
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add Group") ?></button>
            </div>
        </form>
    </div>
</div>



