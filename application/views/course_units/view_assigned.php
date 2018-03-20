<br>
<!--<button class="btn btn-success pull-right" id="all_actions_btn" onclick="AddCourseUnit()"><i class="glyphicon glyphicon-plus"></i> Add Single Course Unit</button>
<a href="<?php echo base_url("course_units/Units_controller/exportCourseUnits/" . $course_id); ?>" style="margin-left: 20px;" class="btn btn-default" id="all_actions_btn">
    <i class="fa fa-file-excel-o"></i> &nbsp;Export Course Units</a>-->

<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>Course Unit Code</th>
            <th>Course Unit</th>
            <th>Credit Unit</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($course_units) {
            foreach ($course_units as $course_unit):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($course_unit->course_unit_code); ?></td>
                    <td><?php echo ucwords($course_unit->course_unit); ?></td>
                    <td><?php echo ucwords($course_unit->cu); ?></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
