
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
        <form action="<?php echo base_url() ?>payments/payments_controller/submitCategory" method="POST">

            <div class="form-group"> 
                <label for="group">Category Name</label>
                <input type="hidden" value="<?php echo ((isset($category)) ? $category->cat_id : "") ?>" name="id">
                <input  value="<?php echo ((isset($category)) ? $category->name : "") ?>" class="form-control m-t-xxs" id="category"  name="category" placeholder="Enter Fees category" type="text">
            </div>
            <div class="form-group"> 
                <label for="group">Payment times</label>
                <select name="times" class="form-control">
                    <option value="Per Semester" <?php if(isset($category)):if ($category->paid_times == "Per Semester") { echo "SELECTED";} endif;?>>Per Semester</option>
                    <option value="Per Year" <?php if(isset($category)): if ($category->paid_times == "Per Year") { echo "SELECTED";}endif;?>>Per Year</option>
                  </select>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Save category") ?></button>
            </div>
        </form>
    </div>
</div>






