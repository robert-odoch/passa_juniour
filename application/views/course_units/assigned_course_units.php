<div class="row">
    <form role="form" method="post" action="#" class="form-inline col-md-12" id="filter_form">
        <div class="col-md-12">
            <div class="form-group"> 
                <select  name="course_id" class="form-control m-t-xxs selectpicker"  data-live-search="true">
                    <?php
                    foreach ($courses as $course) {
                        echo '<option value="' . $course->course_id . '">' . $course->course . '</option>';
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <select name="academic_year" class="selectpicker col-lg-12"  data-live-search="true" >
                    <?php
                    if (isset($acad_years)) {
                        echo '<option>---Academic Year---</option>';
                        foreach ($acad_years as $year) {
                            echo '<option value="' . $year->academic_year_id . '">' . $year->academic_year . '</option>';
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <select id="year_study" class="selectpicker col-lg-12"  data-live-search="true" name="year_study" >
                    <?php
                    echo '<option>---Year of Study---</option>';
                    foreach ($study_years as $study_year) {
                        echo '<option value="' . $study_year->year_id . '">' . $study_year->year . '</option>';
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <select id="semester" class="selectpicker col-lg-12"  data-live-search="true" name="semester" >
                    <?php
                    if (isset($semesters)) {
                        echo '<option>---select semester--</option>';
                        foreach ($semesters as $semester) {
                            echo '<option value="' . $semester->semester_id . '">' . $semester->semester . '</option>';
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <button type="button" onclick="filterUnits()" class="btn green m-t-xs bottom15-xs">filter</button>
            </div>
        </div>
    </form>
</div>


<div class="pull-right" id="test">
    <div class="col-lg-12">
        <div class="col-lg-6" id="word"></div>
        <div class="col-lg-6" id="excel"></div>
    </div>
</div>

<br>
<br><br>
<br>
<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

    <thead>
        <tr>
            <th>No</th>
            <th>Course Unit Code</th>
            <th>Course Unit</th>
            <th>Credit Unit</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody id="course_units">
        <?php
        $count = 1;
        if (isset($course_units)) {
            foreach ($course_units as $course_unit):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($course_unit->course_unit_code); ?></td>
                    <td><?php echo ucwords($course_unit->course_unit); ?></td>
                    <td><?php echo ucwords($course_unit->cu); ?></td>
                    <td><a href="#" onclick="deleteCourseUnit(<?php echo $course_unit->course_unit_id; ?>)">Un assign</a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $('#export_Btn').hide();
    });
    function filterUnits() {
        $.ajax({
            url: "<?php echo base_url("course_units/Units_controller/fetch_sem_units") ?>",
            type: 'POST',
            dataType: 'JSON',
            data: $('#filter_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                $('#course_units').html(data.units);
                if (data.export_btn == true) {
                    $('#export_Btn').show();
                    $('#excel').html("<a href=\"<?php echo base_url(); ?>course_units/Units_controller/export_assigned/" + data.semester + "/" + data.academic_year + "/" + data.course_id + "\" class=\"btn btn-warning\" id=\"export_Btn\">Export Excel</a>");
                    $('#word').html("<a href=\"<?php echo base_url(); ?>course_units/Units_controller/download_assigned/" + data.semester + "/" + data.academic_year + "/" + data.course_id + "\" class=\"btn btn-success\" id=\"download_Btn\">Pdf Download</a>");
                } else {
                    $('#export_Btn').hide();
                    $('#download_Btn').hide()
                }

            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function un_assign(unit_id) {
        if (confirm("Are u sure want to remove the course unit??")) {
            $.ajax({
                url: "<?php echo base_url("course_units/Units_controller/un_assign_unit") ?>/" + unit_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    alert('course unit Unassigned');
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }

</script>


