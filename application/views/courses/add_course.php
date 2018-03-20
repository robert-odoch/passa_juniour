<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>
        <?php echo $msg ?>
    <?php endif; ?>


</div>



<div class="container">

    <div class="col-lg-12">
        <h3 class="head"> upload courses excel file here</h3>
        <div class="col-md-6">
            <form role="form" method="post" action="<?php echo base_url(); ?>courses/Course_controller/uploadCourses" id="courses_form" enctype="multipart/form-data">
                <div class="form-group">
                    <div class="form-group">
                        <select name="level" class="form-control">
                            <option value="null">---select graduate level--</option>
                            <option value="0">Under graduate level</option>
                            <option value="1">Post graduate level</option>
                        </select>
                    </div>
                    <?php if ($this->session->userdata('dept_status') == 0): ?>
                        <div class="form-group">

                            <select name="dept" class="form-control">
                                <option value="null">---select course department--</option>
                                <?php
                                if ($depts) {
                                    foreach ($depts as $row):
                                        echo '<option value="' . $row->dept_id . '">' . $row->dept . '</option>';
                                    endforeach;
                                }
                                ?>
                            </select>
                        </div>
                        <?php
                    ELSE: echo '<input type="hidden" name="dept" value="' . $this->session->userdata('dept_id') . '">';
                    endif;
                    ?>
                    <input type="file" name="userfile" id="userfile">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Upload Courses") ?></button>
                </div>
            </form>
        </div>
    </div>
</div>