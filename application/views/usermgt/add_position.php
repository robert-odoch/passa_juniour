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
        <form action="<?php echo base_url() ?>usermgt/users_controller/save_position" method="POST">
            <input type="hidden" value="<?php echo  ((isset($position)) ? $position->id : "") ?>" name="id">
            <div class="form-group"> 
                <label for="group">Position</label>
                <input class="form-control m-t-xxs" id="pos_name" value="<?php  echo ((isset($position)) ? $position->pos_name : "") ?>"   name="pos_name" placeholder="Enter Position Here" type="text">

            </div> 
            <div class="form-group"> 
                <label for="group">Allow view Titution Complaints</label>
                <select name="titution" class="form-control" required>
                    <option>-select-</option>
                    <option value="yes" <?php echo (($position->allow_fees_complaints == "yes") ? "selected" : "") ?> >Yes</option>
                    <option value="no" <?php echo (($position->allow_fees_complaints == "no") ? "selected" : "") ?> >No</option>
                </select>
            </div>
             <div class="form-group"> 
                <label for="group">Allow view Results Complaints</label>
                <select name="results" class="form-control" required>
                    <option>-select-</option>
                    <option value="yes" <?php echo (($position->allow_exam_complaints == "yes") ? "selected" : "") ?> >Yes</option>
                    <option value="no" <?php echo (($position->allow_exam_complaints == "no") ? "selected" : "") ?> >No</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Save Changes") ?></button>
            </div>
        </form>
    </div>
</div>



