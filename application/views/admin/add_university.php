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
        <form action="<?php echo base_url() ?>admin/dashboard/submitUniversity" method="POST">

            <div class="form-group"> 
                <label for="group">short Name</label>
                <input class="form-control m-t-xxs" id="group"  value="<?php echo  ((isset($university)) ? $university->short_name : "") ?>" name="shortName" placeholder="short Name" type="text">

            </div>
            <div class="form-group"> 
                <input type="hidden" value="<?php echo ((isset($university)) ? $university->university_id : "") ?>" name="id">
                <label for="group">University Name</label>
                <input class="form-control m-t-xxs" id="group"  value="<?php echo  ((isset($university)) ? $university->university : "") ?>"  name="university" placeholder="Enter University Name here" type="text">

            </div>
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add university") ?></button>
            </div>
        </form>
    </div>
</div>



