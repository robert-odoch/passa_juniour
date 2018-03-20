<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>

</div>
<div class="container">
    <div class="clearfix"></div>
    <div class="col-lg-12">
        <form role="form" method="post" action="<?php echo base_url(); ?>schools/schools_controller/uploadDepts" id="courses_form" enctype="multipart/form-data">
            <div class="form-group">
                <label for="exampleInputEmail1 " class="col-lg-12">school</label>
                <select name="school" class="selectpicker col-lg-5"  data-live-search="true">
                    <?php
                    if (isset($schools)) {
                        echo '<option>----select school---</option>';
                        foreach ($schools as $row) {
                            echo '<option value="' . $row->school_id . '">' . $row->school . '</option>';
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <input type="file" name="userfile" id="userfile">
            </div>
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Upload departments") ?></button>
            </div>
        </form>
    </div>
</div>