<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>


<!--  -->
</div>
<div class="clearfix"></div>
<div class="row" id="courses_form">
    <div class="col-md-12">
    <form class="form-inline" id="units_form" action="<?php echo base_url("course_units/Units_controller/submitSelectedUnits"); ?>" method="post">
      <div class="form-group">

    <label for="email">Course</label>
     <select  name="course" class="form-control selectpicker" id="course"  data-live-search="true">
                 <option value="null"> ---select course--</option>
                <?php
                foreach ($courses as $course) {
                    echo '<option value="' . $course->course_id . '">' . $course->course_code . '</option>';
                }
                ?>
            </select>

  </div>
  <div class="form-group" id="div-course_units" style="">
    <label for="email">Course Units</label>
     <select id="course_units" name="course_units" class="form-control " data-live-search="true">
    </select>
  </div>
  <div class="form-group">
    <label for="pwd">Year of study</label>
    <select  name="study_year"  id="study_year" class="form-control selectpicker" data-live-search="true">
                <option value="null"> ---select year of study--</option>
                <?php
                foreach ($study_years as $year_study) {
                    echo '<option value="' . $year_study->year_id . '">' . $year_study->year . '</option>';
                }
                ?>
            </select>
  </div>
  <div class="form-group">
    <label for="pwd">Semester</label>
   <select  name="semester"  id="semester" class="form-control selectpicker" data-live-search="true">
                <option value="null"> ---select semester--</option>
                <?php
                foreach ($semesters as $sem) {
                    echo '<option value="' . $sem->semester_id . '">' . $sem->semester . '</option>';
                }
                ?>
            </select>
  </div>
        <div class="form-group">
            <label for="exampleInputEmail1" class="col-lg-12"><span style="opacity: 0">dummy</span></label>
            <button type="button" onclick="add_units()" class="form-control btn btn-primary">Add selected</button>
        </div>
      </form>  
    </div>
</div>
<div class="row">
    
    <div class="col-md-12">
<div class="clearfix"></div>
<br><br>
<div class="form-group" >
    <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
        <thead>
            <tr>
               <th>ID</th>
                <th>Code</th>
               <th>Action</th>
            </tr>
        </thead>
        <tbody id="units_table">
        </tbody>
    </table>
</div>

<br>
 <button type="button" onclick="submitUnits()" class="btn btn-success">Upload course Units</button>
 <br><br>
    </div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script>
   var items = [];
     $(document).ready(function () {
           $('#div-course_units').hide();
        });
   function submitUnitj(){
     $.ajax({
            url: "<?php echo base_url("course_units/Units_controller/submitSelectedUnits") ?>",
            type: 'POST',
            dataType: 'json',
            data: $('#units_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                console.log(data.data);
               alert("course units submitted successfully");
               location.reload();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
   }
  $('#course').change(function () {
            var id = $(this).val();
            if (id != "") {
                fetchCourseUnits(id);
            }
        });
 function fetchCourseUnits(id){
    $.ajax({
            url: "<?php echo base_url("course_units/Units_controller/fetch_unassigned/") ?>/"+id,
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
             $('#div-course_units').show();
                 $('#course_units').html(data);
               $('#course_units').selectpicker();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });

 }

function add_units() {

                var course = $('#course').val();

                 var course_name = $('#course :selected').text();
                var study_year = $('#study_year').val();
                  var semester = $('#semester').val();
                var units_name = $('#course_units :selected').text();
                var course_units = $('#course_units').val();
                var html = '';
                items.push([course, course_name, study_year, semester, course_units, units_name]);

                $.grep(items, function (v, i) {
                    html += '<tr><td>' + (i + 1) + '</td><td>' + v[5] + '</td><td><a onclick= "remove_item(' + i + ')"><i class = "fa fa-times fa-fw"></i></a></td></tr>';
                    console.log(v + " " + i);
                });
                $('#units_table').html(html);

    }

    function remove_item(index) {
        if (confirm("Are you sure what to remove course unit ?")) {
            var price = 0;
            var spi = items.splice(index, 1);
            $.grep(spi, function (v, i) {
              
            });
            var html = '';
             $.grep(items, function (v, i) {
                    html += '<tr><td>' + (i + 1) + '</td><td>' + v[5] + '</td><td><a onclick= "remove_item(' + i + ')"><i class = "fa fa-times fa-fw"></i></a></td></tr>';
                    console.log(v + " " + i);
                });
            $('#units_table').html(html);

        }
    }

    function submitUnits() {
        if (items.length <= 0) {
           alert('Please select course units');
        } else {
            $.ajax({
                url: "<?php echo site_url('course_units/Units_controller/submitSelectedUnits') ?>",
                type: "POST",
                dataType: "JSON",
                data: {
                    items: JSON.stringify(items)
                },
                success: function (data) {
                    console.log(data);
                    alert('submited successfully');
                    resetAll();
                    location.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(errorThrown);
                }
            });
        }
      }

</script>


