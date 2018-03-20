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
        <form action="<?php echo base_url() ?>usermgt/users_controller/update_password" method="POST">

            <div class="form-group"> 
                <label for="group"  size="50">Old Password</label>
                <input class="form-control m-t-xxs" id="year"  name="old_password"  placeholder="Enter old password" type="text">
            </div>
            <div class="form-group"> 
                <label for="group" size="50">New Password</label>
                <input class="form-control m-t-xxs" id="year"  name="new_password"  placeholder="Enter New password" type="text">
            </div>
            <div class="form-group"> 
                <label for="group" size="50">Confirm Password</label>
                <input class="form-control m-t-xxs" id="year"  name="confirm_password"  placeholder="Confirm password" type="text">
            </div>
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo  ((isset($formBtn)) ? $formBtn : "change password") ?></button>
            </div>
        </form>
    </div>
</div>



