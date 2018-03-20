<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>
<div class="clearfix"></div>

<div class="row" id="courses_form">
    <form role="form" method="post"  action="<?php echo base_url() ?>schools/schools_controller/submitDeptCourses" class=" col-md-6" id="units_form" style="margin-right: 30px;">
        <div class="form-group" id="year"> 
            <label>Courses</label>
            <select multiple="multiple" id="my-select" name="my-select[]">
                <?php
                foreach ($classes as $row) {
                    echo '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                }
                ?>
            </select>
        </div>
        <input type="hidden" name="school_id" value="<?php echo $school_id; ?>">
        <div class="form-group">
            <button type="submit" class="btn btn-primary m-t-xs bottom15-xs">submit classes</button>
        </div>
    </form>
</div>
<div class="clearfix"></div>


