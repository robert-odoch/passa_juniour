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
                foreach ($deptal_courses as $row) {
                    echo '<option value="' . $row->course_id . '">' . $row->course . '</option>';
                }
                ?>
            </select>
        </div>
        <input type="hidden" name="dept_id" value="<?php echo $dept_id; ?>">
        <div class="form-group">
            <button type="submit" class="btn btn-primary m-t-xs bottom15-xs">add departmental courses</button>
        </div>
    </form>
</div>
<div class="clearfix"></div>


