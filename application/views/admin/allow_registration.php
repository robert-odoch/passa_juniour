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
        <form action="<?php echo base_url() ?>admin/dashboard/update_status" method="POST">
            <div class="form-group"> 
                <label for="group">Force student pay before Registration</label>
                <select name="status" id="status" class="form-control" required>
                    <option value="null">select</option>
                    <?php
                    if (isset($registration_status)):
                        if ($registration_status->_student_registration == 0) {
                            echo ' <option value="1">Yes</option>';
                        } else {
                            echo ' <option value="0">No</option>';
                        }
                    endif;
                    ?>
                </select>
            </div>
            <input type="hidden" value="<?= $university_id ?>" name="university_id">  
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs">
                    <?php
                    if (isset($registration_status->_student_registration) == 0):
                        echo 'Force payment';
                    else:
                        echo 'Force Payment';
                    endif;
                    ?></button>
            </div>
        </form>
    </div>
</div>






