<br>
<div class="pull-center" style="margin-left: 200px;">
    <form class="form-inline" id="filter_form" method="post" action="">
        <div class="form-group">
            <label for="exampleInputName2">Academic Year</label>
            <select id="sel2" name="academic_year">
                <?php
                foreach ($academic_years as $year) {
                    echo '<option value="' . $year->academic_year_id . '">' . $year->academic_year . '</option>';
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail2">Semester</label>
            <select id="semester" name="semester" class="form-control">
                <?php
                foreach ($semesters as $sem) {
                    echo '<option value="' . $sem->semester_id . '">' . $sem->semester . '</option>';
                }
                ?>
            </select>
            <input type="hidden" name="student_id" value="<?php echo $studen_id ?>" placeholder="student id">
        </div>
        <button type="submit" onclick="filterCourseUnits()" class="btn btn-default">Filter</button>
    </form>
</div>

<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>Academic Year</th>
            <th>Semester</th>
            <th>Course Unit Code</th>
            <th>Course Unit</th>
        </tr>
    </thead>
    <tbody id="data_show">
        <?php
        $count = 1;
        if ($student_course_units) {
            foreach ($student_course_units as $student_course_unit):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($student_course_unit->academic_year); ?></td>
                    <td><?php echo ucwords($student_course_unit->semester); ?></td>
                    <td><?php echo ucwords($student_course_unit->course_unit_code); ?></td>
                    <td><?php echo ucwords($student_course_unit->course_unit); ?></td>
                    <!--<td> <a href="#" onclick="editStudent(<?php echo $student_course_unit->reg_course_units_id; ?>)">Edit</a> || <a href="#" onclick="deleteStudent(<?php echo $student_course_unit->reg_course_units_id; ?>)">Delete</a></td>-->
                </tr>
                <?php
                $count++;
            endforeach;
        }else {
            //echo '<tr><td class="text-danger">No data found</td></tr>';
        }
        ?>
    </tbody>
</table>
<script>
    function filterCourseUnits() {
        $.ajax({
            url: "<?php echo base_url('university/dashboard/filter_studentCourseUnits'); ?>",
            type: 'POST',
            dataType: 'html',
            data: $('#filter_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                $('#data_show').html(data);
                alert(data);
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
   
</script>