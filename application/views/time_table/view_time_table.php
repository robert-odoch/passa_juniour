<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>
<div class="clearfix"></div>
<!--<div class="col-md-12">

    <form class="form-inline center" method="post" action="#">
        <div class="form-group col-md-6">
            <label>Filter Graduate Course</label>
            <select name="level" id="level" class="form-control">
                <option value="null">---select graduate level--</option>
                <option value="0">Under graduate level</option>
                <option value="1">Post graduate level</option>
            </select>
        </div>
    </form>
</div>-->

<div class="clearfix"></div>

<button onclick="deleteTimetables()" class="btn btn-danger">Clear All Time Table</button><br>

<br><br>
<br>

<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>No</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <th>Year Of Study</th>
            <th>Semester</th>
            <th>Study Period</th>
            <td>Details</td>
        </tr>
    </thead>
    <tbody id="courses_table">
        <?php
        $count = 1;
        if ($time_table) {
            foreach ($time_table as $row):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($row->course_code); ?></td>
                    <td> <?php echo ucwords($row->course); ?></td>
                    <td> <?php echo ucwords($row->year); ?></td>
                    <td> <?php echo ucwords($row->semester); ?></td>
                       <td> <?php echo ucwords($row->study_period); ?></td>
                    <td><a href="<?php echo base_url(); ?>timetable/time_table/details/<?php echo $row->time_table_id . "/" . $row->course_id ?>">Details</a></td>
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
    $('#level').change(function () {
        var id = $(this).val();
        if (id == "") {
        } else {
            fetch_courses(id);
        }
    });
    function fetch_courses(id) {
        $.ajax({
            url: "<?php echo base_url("timetable/time_table/filter_table") ?>/" + id,
            type: 'POST',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('#courses_table').html(data);
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown)
            }
        });
    }
    function deleteTimetables(){
         if(confirm("Please Note !,Make sure you use this action to remove all the previous timetables")){
               $.ajax({
            url: "<?php echo base_url("timetable/time_table/delete_all_timetables") ?>" ,
            type: 'POST',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('#courses_table').html(data);
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown)
            }
        });

         }
    }

</script>


