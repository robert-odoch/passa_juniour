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
        <form action="<?php echo base_url() ?>usermgt/users_controller/submitAssignedGroup" method="POST"> 
            <div class="form-group"> 
                <label for="group"></label>
                <select class="form-control m-t-xxs selectpicker" name="user"  data-live-search="true">
                    <option value="null">--select User--</option>
                    <?php
                    foreach ($users as $row):
                        ?>
                        <option value="<?php echo $row['user_id'] ?>">
                            <?php echo $row['name'] ?>
                        </option>
                        <?php
                    endforeach;
                    ?>


                </select>
            </div>
            <input type="hidden" name="group_id" value="<?php echo $group_id ?>"/>

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Asign group") ?></button>
            </div>
        </form>
    </div>
</div>



