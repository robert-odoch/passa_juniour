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
        <form action="<?php echo base_url() ?>complaints/complaint_controller/submitCategory" method="POST">
            <input type="hidden" value="<?php echo ((isset($category)) ? $category->complaint_types_id : "") ?>" name="id">
            <div class="form-group"> 
                <label for="group">Category</label>
                <input class="form-control m-t-xxs" value="<?php echo ((isset($category)) ? $category->type : "") ?>" id="year"  name="category" placeholder="Enter Category here" type="text">
            </div>

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add category") ?></button>
            </div>
        </form>
    </div>
</div>



