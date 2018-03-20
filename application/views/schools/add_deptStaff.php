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
        <form action="<?php echo base_url() ?>schools/schools_controller/submit_staff" method="POST">
            <div class="form-group"> 
                <label for="group"> staff Name</label>
                <select class="form-control m-t-xxs selectpicker col-lg-12"  data-live-search="true" name="staff">
                    <option value="null">--select school staff--</option>
                    <?php
                    foreach ($deptal_users as $row):
                        ?>
                        <option value="<?php echo $row->user_id ?>">
                            <?= $row->name; ?>
                        </option>
                        <?php
                    endforeach;
                    ?>


                </select>
            </div>
            <input type="hidden" value="<?php echo $dept_id; ?>" name="dept_id">
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add staff member") ?></button>
            </div>
        </form>
    </div>
</div>



