<div class="row"> 
    <div class="col-md-12">
        <?php
        $msg = $this->session->flashdata('msg');
        if ((isset($msg)) && (!empty($msg))) :
            ?>

            <div class="alert alert-success col-md-6"> <?php  echo $msg ?>. </div>

        <?php endif; ?>

    </div>
    <div class="col-md-6">
        <form action="<?php echo base_url() ?>usermgt/users_controller/submit_group" method="POST">
            <input type="hidden" value="<?php echo ((isset($user_group)) ? $user_group->group_id : "") ?>" name="id">
            <div class="form-group"> 
                <label for="group">User Group</label>
                <input class="form-control m-t-xxs" id="group" value="<?php  echo ((isset($user_group)) ? $user_group->group_name : "") ?>"   name="group_name" placeholder="Enter User group" type="text">

            </div> 
            <div class="form-group"> 
                <label for="group">Department User Group</label>
                <select name="dept_group" class="form-control" required>
                    <option>-select-</option>
                    <option value="1" <?php echo (($user_group->dept_user == 1) ? "selected" : "") ?> >Yes</option>
                    <option value="0" <?php echo (($user_group->dept_user == 0) ? "selected" : "") ?> >No</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add Group") ?></button>
            </div>
        </form>
    </div>
</div>



