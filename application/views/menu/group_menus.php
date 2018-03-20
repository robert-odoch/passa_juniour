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
        <form action="<?php echo base_url() ?>usermgt/users_controller/submit_group" method="POST">
            <ul>
                <?php
                foreach ($group_menu as $key => $value) {
                   echo $value;
                }
                ?>
            </ul>
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add Group") ?></button>
            </div>
        </form>
    </div>
</div>



