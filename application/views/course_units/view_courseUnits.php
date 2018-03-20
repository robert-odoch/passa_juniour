<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>


<div class="row">
   <!--  <h2></h2>
    <ul class="nav nav-tabs">
        <li class="active"><a href="#home">View Course Units</a></li>
        <li><a href="#menu1">Assign Course Unit</a></li>
        <li><a href="#menu2">View Assigned</a></li>
        <li><a href="#menu3">Upload Course Units</a></li>
    </ul> -->

  <!--   <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <h3></h3> -->

            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-12">
                    <div class="col-lg-9">
                        <form role="form" method="post" action="#" class="form-inline" id="filter_form">
                             <div class="form-group"> 
                                    <label for="course">Course</label>
                                    <select  name="course" class="form-control m-t-xxs selectpicker"  data-live-search="true">
                                        <option value="null"> ---select course--</option>
                                        <?php
                                        foreach ($courses as $course) {
                                            echo '<option value="' . $course->course_id . '">' . $course->course_code . '</option>';
                                        }
                                        ?>
                                    </select>
                                </div>
                                 <div class="form-group"> 
                                    <label for="study_year">Year Of Study</label>
                                    <select  name="study_year" class="form-control m-t-xxs selectpicker"  data-live-search="true">
                                        <option value="null"> ---study year--</option>
                                        <option value="all">All years</option>
                                        <?php
                                        foreach ($study_years as $row) {
                                            echo '<option value="' . $row->year_id . '">' . $row->year . '</option>';
                                        }
                                        ?>
                                    </select>
                                </div>
                                 <div class="form-group"> 
                                     <label for="semester">Semester</label>
                                    <select  name="semester" class="form-control m-t-xxs selectpicker"  data-live-search="true">
                                        <option value="null"> ---Semester--</option>
                                        <option value="all">All semesters</option>
                                        <?php
                                        foreach ($semesters as $row) {
                                            echo '<option value="' . $row->semester_id . '">' . $row->semester . '</option>';
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="col-lg-12"><span style="opacity: 0">dummy</span></label>
          
                                    <button type="button" onclick="filterUnits()" class="btn btn-primary"><i class="fa fa-plus"></i> Apply Filter</button>
                                </div>
                            
                        </form>
                    
                    
                </div>
                <div class="pull-right col-lg-3 col-sm-12" id="test" style="margin-top: 2%;">
                      <div class="col-lg-6 col-sm-12" id="word"></div>
                      <div class="col-lg-6 col-sm-12" id="excel"></div>
                       
                </div>
            </div>
            </div>
            <div class="clearfix"></div>


            <br>
            <br><br>
            <br>
            <div class="row">
                <div class="col-md-12">
            <div id="course_units">
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
                    <tbody>
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
                                    <td> <a href="#" onclick="editCourseUnit(<?php echo $course_unit->course_unit_id; ?>)">Edit</a> || <a href="#" onclick="deleteCourseUnit(<?php echo $course_unit->course_unit_id; ?>)">Delete</a></td>
                                </tr>
                                <?php
                                $count++;
                            endforeach;
                        }
                        ?>
                    </tbody>
                </table>
            </div>
                
                </div>
            </div>











       <!--  </div>
        <div id="menu1" class="tab-pane fade">
            <h3>Menu 1</h3>
            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>
        <div id="menu2" class="tab-pane fade">
            <h3>Menu 2</h3>
            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
        </div>
        <div id="menu3" class="tab-pane fade">
            <h3>Menu 3</h3>
            <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
        </div>
    </div> -->
</div>

















<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script>
                            function filterUnits() {
                                $.ajax({
                                    url: "<?php echo base_url("course_units/units_controller/fetch_course_units") ?>",
                                    type: 'POST',
                                    dataType: 'JSON',
                                    data: $('#filter_form').serialize(),
                                    success: function (data, textStatus, jqXHR) {
                                        $('#course_units').html(data.data);
                                        $('#example').DataTable();
                                        if (data.export_btn == true) {
                                            $('#export_Btn').show();
                                            $('#excel').html("<a href=\"<?php echo base_url(); ?>course_units/Units_controller/export_units/" + data.course_id + "\" class=\"btn btn-danger col-sm-12\" id=\"export_Btn\">Export Excel</a>");
                                            $('#word').html("<a href=\"<?php echo base_url(); ?>course_units/Units_controller/download_all_units/" + data.course_id + "\" class=\"btn btn-success col-sm-12\" id=\"download_Btn\">Pdf Download</a>");
                                        } else {
                                            $('#export_Btn').hide();
                                            $('#download_Btn').hide()
                                        }
                                    }, error: function (jqXHR, textStatus, errorThrown) {
                                        alert(errorThrown);
                                    }
                                });

                            }



                    function delete_Unit(unit_id) {
                                if (confirm("Are you sure want to delete")) {
                                    $.ajax({
                                        url: "<?php echo base_url('course_units/units_controller/deassignUnit'); ?>/" + unit_id,
                                        type: 'POST',
                                        dataType: 'JSON',
                                        success: function (data, textStatus, jqXHR) {
                                            location.reload();
                                            alert(' deleted successfully');
                                        }, error: function (jqXHR, textStatus, errorThrown) {
                                            alert(errorThrown);
                                        }
                                    });
                                }
                            }

</script>