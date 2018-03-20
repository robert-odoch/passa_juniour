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
        <form action="<?php  echo  base_url() ?>schools/Schools_controller/submit_user" method="POST">

            <input type="hidden" value="<?php echo ((isset($user)) ? $user->user_id : "") ?>" name="id">
            <div class="form-group"> 
                <label for="group">User Group</label>
              <select name="group" class="form-control">
                 <?php
                  foreach ($groups as $key) {?>
                     <option value="<?php echo $key['id'];?>"><?php echo $key['name'];?></option> 
                 <?php }
                 ?>
              </select>
            </div>
              <div class="form-group"> 
                <label for="group">Name</label>
                <input class="form-control m-t-xxs" value="<?php echo ((isset($user)) ? $user->name : "") ?>" id="name"  name="name" placeholder="Enter Name" type="text">
            </div>
            <div class="form-group"> 
                <label for="group">Email Address</label>
                <input class="form-control m-t-xxs" id="email" value="<?php  echo ((isset($user)) ? $user->email : "") ?>"  name="email" placeholder="Email" type="text">
            </div>
            <div class="form-group"> 
                <label for="group">Contact</label>
                <input class="form-control m-t-xxs" id="phone_number" value="<?php echo ((isset($user)) ? $user->contact : "") ?>"  name="phone_number" placeholder="phone number" type="text">
            </div>
            <input type="hidden" value="<?php echo $school_id; ?>" name="school_id">
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Register User") ?></button>
            </div>
        </form>
    </div>
</div>



