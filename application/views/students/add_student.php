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
        <form action="<?php echo base_url() ?>students/students_controller/insertStudent" method="POST">

            <input type="hidden" value="<?php echo ((isset($user)) ? $user->user_id : "") ?>" name="id">
            <div class="form-group"> 
                <label for="group">student Name</label>
                <input class="form-control m-t-xxs" id="student_name" value="<?php echo ((isset($user)) ? $user->name : "") ?>"  name="student_name" placeholder="Student Name" type="text">
            </div>
          
            <div class="form-group"> 
                <label for="group">Parent Name</label>
                <input class="form-control m-t-xxs" id="parent" value="<?php echo ((isset($user)) ? $user->contact : "") ?>"  name="parent" placeholder="parent's Name" type="text">
            </div>
             <div class="form-group"> 
                <label for="group">Parent phone number</label>
                <input class="form-control m-t-xxs" id="nationality" value="<?php echo ((isset($user)) ? $user->nationality : "") ?>"  name="phone_number" placeholder="Phone Number" type="text">
            </div>
             <div class="form-group"> 
                <label for="group">Parent email<span class="text-danger"> (if parent has)</span></label>
                <input class="form-control m-t-xxs" id="nationality" value="<?php echo ((isset($user)) ? $user->nationality : "") ?>"  name="email" placeholder="Email address" type="text">
            </div>
           
            <input type="hidden" name="id" value="<?php echo $user->student_id ?>">

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Register student") ?></button>
            </div>
        </form>
    </div>
</div>



