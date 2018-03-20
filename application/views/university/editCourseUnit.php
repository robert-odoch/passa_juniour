

<form role="form" method="post" action="" id="editcourse_Units_form">
    <div class="form-group">
        <label for="exampleInputEmail1">Course Unit Code</label>
        <input type="text" <?php if (isset($courseUnit)) { ?>value="<?php echo $courseUnit->course_unit_code; ?>"<?php } ?> name="course_unit_code" placeholder="course Unit Code" class="form-control">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Course Unit</label>
        <input type="text" <?php if (isset($courseUnit)) { ?>value="<?php echo $courseUnit->course_unit; ?>"<?php } ?> name="course_unit" placeholder="course Unit" class="form-control">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Credit Unit</label>
        <input type="text" <?php if (isset($courseUnit)) { ?>value="<?php echo $courseUnit->cu; ?>"<?php } ?> name="cu" placeholder="Credit unit" class="form-control">
    </div>
    <input type="hidden" <?php if (isset($courseUnit)) { ?>value="<?php echo $courseUnit->course_unit_id; ?>"<?php } ?> name="course_unit_id" placeholder="course Unit" class="form-control">
    <div class="form-group">
        <label for="exampleInputEmail1">Course</label>
        <select name="course" class="form-control">
            <?php if (isset($courseUnit)) { ?>
                <option value="<?php
                if (isset($courseUnit)) {
                    echo $courseUnit->course_id;
                }
                ?>"><?php
                            if (isset($courseUnit)) {
                                echo $courseUnit->course;
                            }
                            ?></option>
                <?php
            }
            ?>
        </select>
    </div>

</form>




