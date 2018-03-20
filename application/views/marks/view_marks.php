 
                    <div class="col-lg-12">
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
                                    <label for="study_year">Choose Intake</label>
                                    <select  name="intake" class="form-control m-t-xxs selectpicker"  data-live-search="true">
                                        <option value="null"> ---intake--</option>
                                        <?php
                                        foreach ($intakes as $row) {
                                            echo '<option value="' . $row->intake_id . '">' . $row->intake_name . '</option>';
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group"> 
                                    <label for="study_year">Year Of Study</label>
                                    <select  name="study_year" class="form-control m-t-xxs selectpicker"  data-live-search="true">
                                        <option value="null"> ---study year--</option>
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
                                        <?php
                                        foreach ($semesters as $row) {
                                            echo '<option value="' . $row->semester_id . '">' . $row->semester . '</option>';
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="col-lg-12"><span style="opacity: 0">dummy</span></label>
          
                                    <button type="button" onclick="filter_marks()" class="btn btn-primary"><i class="fa fa-plus"></i> Apply Filter</button>
                                </div>
                            
                        </form>
                    
                    
                </div>


 <div class="row">
            <div class="col-sm-12 card">
                <br>
                <div id="marksTable">
                <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Student Reg No:</th>
                            <th></th>
                            <?php
                            foreach ($course_units as $row) {
                                echo '<th>' . $row->course_unit . '</th>';
                            }
                            ?>
                        </tr>
                    </thead>
                    <tbody id="studentsTable">
                        <?php
                        $count = 1;
                        if (isset($array_data)) {
                            foreach ($array_data as $student):
                                ?>
                                <tr id="table_show">
                                    <td><?php echo ucwords($count); ?></td>
                                    <?php
                                    foreach ($student as $data) {
                                        echo "<td>" . $data . "</td>";
                                    }
                                    ?>
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




<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script type="text/javascript">
    function filter_marks() {
        $.ajax({
            url: "<?php echo base_url("marks/marks_controller/filter_marks") ?>",
            type: 'POST',
            dataType: 'JSON',
            data: $('#filter_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                $('#marksTable').html(data);
                 $('#example').DataTable();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });

    }

</script>
        