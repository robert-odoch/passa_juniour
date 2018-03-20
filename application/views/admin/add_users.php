<div class="row"> 
    <div class="col-md-12">
        <?php
        $msg = $this->session->flashdata('msg');
        if ((isset($msg)) && (!empty($msg))) :
            ?>

            <div class="alert alert-success col-md-6"> <?php echo  $msg ?>. </div>

        <?php endif; ?>



    </div>
    <div class="col-md-6">
        <form action="<?php echo base_url() ?>admin/dashboard/submit_user" method="POST">
            <input type="hidden" value="<?php echo ((isset($user)) ? $user->user_id : "") ?>" name="id">
            <div class="form-group"> 
                <label for="group">First Name</label>
                <input class="form-control m-t-xxs" value="<?php echo ((isset($user)) ? $user->firstName : "") ?>" id="firstName"  name="firstName" placeholder="First Name" type="text">
            </div>
            <div class="form-group"> 
                <label for="group">Last Name</label>
                <input class="form-control m-t-xxs" id="lastName" value="<?php echo ((isset($user)) ? $user->lastName : "") ?>"  name="lastName" placeholder="Last Name" type="text">
            </div>
            <div class="form-group"> 
                <label for="group">Email address</label>
                <input class="form-control m-t-xxs" id="email" value="<?php echo ((isset($user)) ? $user->email : "") ?>"  name="email" placeholder="Email" type="text">
            </div>
            <div class="form-group"> 
                <label for="group">Contact</label>
                <input class="form-control m-t-xxs" id="contact" value="<?php echo ((isset($user)) ? $user->contact : "") ?>"  name="contact" placeholder="contact" type="text">
            </div>
            <div class="form-group"> 
                <label for="group">User Group</label>
                <select class="form-control m-t-xxs" name="user_group">
                    <option value="null">--select user group--</option>
                    <?php
                    foreach ($groups as $group):
                        ?>
                        <option value="<?php echo $group->group_id ?>" <?php echo ((isset($user) && $group->group_id == $user->select_group ) ? "selected" : "") ?> >
                            <?php echo $group->group_name ?>
                        </option>
                        <?php
                    endforeach;
                    ?>


                </select>
            </div>
            <input type="hidden" value="<?php echo $university_id; ?>" name="university_id">
            <div class="form-group">
                <button type="submit" class="btn btn-primary m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Register User") ?></button>
            </div>
        </form>
    </div>
</div>



