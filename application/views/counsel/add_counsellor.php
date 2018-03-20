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
        <form action="<?php echo base_url() ?>counsel/counsel_controller/submit_counsellor" method="POST"> 
            <div class="form-group"> 
                <label for="group"></label>
                <select class="form-control m-t-xxs selectpicker" name="counsellor"  data-live-search="true">
                    <option value="null">--select Counsellor--</option>
                    <?php
                    foreach ($users as $row):
                        ?>
                        <option value="<?= $row->user_id ?>" <?php echo ((isset($user) && $row->user_id == $row->user_id ) ? "selected" : "") ?> >
                            <?= $row->name?>
                        </option>
                        <?php
                    endforeach;
                    ?>


                </select>
            </div>

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add Counsellor") ?></button>
            </div>
        </form>
    </div>
</div>



