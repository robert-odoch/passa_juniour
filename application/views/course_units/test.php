<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?= $msg ?>. </div>

    <?php endif; ?>



</div>
<div class="clearfix"></div>

<div class="row" id="courses_form">
    <form role="form" method="post"  action="<?php echo base_url()?>course_units/units_controller/submitYearUnits" class=" col-md-6" id="filter_form" style="margin-right: 30px;">

        <div class="form-group"> 
            <select  name="course" class="form-control m-t-xxs selectpicker" id="course"  data-live-search="true">
                <option value="null"> -select course-</option>
                <?php
                foreach ($courses as $course) {
                    echo '<option value="' . $course->course_id . '">' . $course->course . '</option>';
                }
                ?>
            </select>
        </div>

        <div class="form-group" id="year"> 
            <select  name="year" id="year" class="form-control m-t-xxs selectpicker"  data-live-search="true">
                <option value="null"> -select academic year-</option>
                <?php
                foreach ($academic_years as $year) {
                    echo '<option value="' . $year->academic_year_id . '">' . $year->academic_year . '</option>';
                }
                ?>
            </select>
        </div>
        <div class="form-group" id="semester" > 
            <select  name="semester"  class="form-control m-t-xxs selectpicker"  data-live-search="true">
                <option value="null"> ---select semester--</option>
                <?php
                foreach ($semesters as $sem) {
                    echo '<option value="' . $sem->semester_id . '">' . $sem->semester . '</option>';
                }
                ?>
            </select>
        </div>
        <div class="form-group course_units"> 

        </div>
        <div class="form-group">
            <button type="submit" class="btn green m-t-xs bottom15-xs">submit Course Units</button>
        </div>
    </form>
</div>
<div class="clearfix"></div>
<br>





<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script>

    $('#course').change(function () {
        var id = $(this).val();
        if (id == "") {
            $('#div-items').hide();
        } else {
//                        alert(id);
            populate_course_units(id);
            $('#div-units').show();
        }
    });

    function populate_course_units(id) {
        $.ajax({
            url: "<?php echo base_url("course_units/Units_controller/all_units") ?>/" + id,
            type: 'POST',
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                $('.course_units').html(data);
                $('#my-select').multiSelect();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    $(document).ready(function () {

    });
    $('#course').change(function () {
        var course = $('#course').val();
        $('#course_id').val(course);
    });
    function filterUnits() {
        $.ajax({
            url: "<?php echo base_url("course_units/Units_controller/all_units") ?>",
            type: 'POST',
            dataType: 'JSON',
            data: $('#filter_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                $('#course_units').html(data);
                $('#courses_form').hide();
                $('#year').show();
                $('#semester').show();
                $('#submitUnits').show();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function assignUnits() {
        $.ajax({
            url: "<?php echo base_url("course_units/units_controller/submitYearUnits"); ?>",
            type: 'POST',
            dataType: 'JSON',
            data: $('#units_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                alert('success');
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }

</script>


