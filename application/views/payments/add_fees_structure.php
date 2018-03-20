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
        <form action="<?php echo base_url() ?>payments/payments_controller/submitStucture" method="POST">
            <input type="hidden" value="<?php echo $course_id; ?>" name="course_id">

            <input type="hidden" value="<?php echo ((isset($fees)) ? $fees->fees_id : "") ?>" name="id">
            <div class="form-group">
                <label for="group" class="col-lg-12">Fees Category</label>
                <select name="category" class="form-control">
                    <option value="">Select Category</option>
                    <?php
                    foreach ($categories as $row):
                        ?>
                        <option value="<?php echo $row->cat_id ?>" <?php echo ((isset($fees) && $year->year_id == $fees->study_year ) ? "selected" : "") ?> >
                            <?php echo $row->name ?>
                        </option>
                        <?php
                    endforeach;
                    ?>
                </select>
            </div>
            <div class="form-group"> 
                <label for="group"  size="50">Amount</label>
                <input class="form-control m-t-xxs number" id="year"  name="amount" value="<?php echo ((isset($fees)) ? $fees->tuition : "") ?>" placeholder="Enter  Amount" type="number">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add Free Structure") ?></button>
            </div>
        </form>
    </div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script>



</script>



