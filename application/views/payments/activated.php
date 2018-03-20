<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>
<div class="col-lg-12">
    <form role="form" method="post" class="form-inline" action="#" id="filterForm">
        <div class="form-group col-lg-3" >
            <label for="exampleInputEmail1 " class="col-lg-12">Course</label>
            <select name="course_id" class="selectpicker col-lg-12"  data-live-search="true">
                <?php
                if (isset($courses)) {
                    foreach ($courses as $course) {
                        echo '<option value="' . $course->course_id . '">' . $course->course . '</option>';
                    }
                }
                ?>
            </select>
        </div>
        <div class="form-group col-lg-3">
            <label for="exampleInputEmail1 " class="col-lg-12">Intake</label>
            <select name="intake_id" class="selectpicker col-lg-12"  data-live-search="true">
                <?php
                if (isset($intakes)) {
                    foreach ($intakes as $intake) {
                        echo '<option value="' . $intake->intake_id . '">' . $intake->intake_name . '</option>';
                    }
                }
                ?>
            </select>
        </div>
        <div class="form-group col-lg-2">
            <label for="exampleInputEmail1" class="col-lg-12">Year of Study</label>
            <select name="study_year" class="selectpicker col-lg-12"  data-live-search="true" >
                <?php
                if (isset($study_year)) {
                    foreach ($study_year as $year) {
                        echo '<option value="' . $year->year_id . '">' . $year->year . '</option>';
                    }
                }
                ?>
            </select>
        </div>
        <div class="form-group col-lg-2">
            <label for="exampleInputEmail1" class="col-lg-12">Semester </label>
            <select id="semester" class="selectpicker col-lg-12"  data-live-search="true" name="semester" >
                <?php
                if (isset($semesters)) {
                    foreach ($semesters as $semester) {
                        echo '<option value="' . $semester->semester_id . '">' . $semester->semester . '</option>';
                    }
                }
                ?>
            </select>
        </div>

        <div class="form-group col-lg-2">
            <label for="exampleInputEmail1 hi" class="col-lg-12 hidden"></label>
            <button type="button" onclick="filterActivated()" class="btn btn-primary m-t-xs bottom15-xs">show Registered</button>
        </div>
    </form>
</div>
<div class="clearfix"></div>
<br>
<div class="activate_table">
    <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>No</th>
                <th>Registration Number</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Activate</th>
            </tr>
        </thead>
        <tbody id="filter_table">
            <?php
            $count = 1;
            if (isset($students)):
                foreach ($students as $row):
                    ?>
                    <tr>
                        <td><?php echo ucwords($count); ?></td>
                        <td><?php echo ucwords($row->registration_number); ?></td>
                        <td><?php echo ucwords($row->firstName); ?></td>
                        <td><?php echo ucwords($row->lastName); ?></td>
                        <td> 
                            <?php
                            if ($row->activated_status == 1) {
                                echo ' <a class="text-success" href="#" onclick="blockUser(' . $row->payment_id . ')" > 
                            <i class="fa fa-eye"> Deactivate</i></a> ';
                            } else {
                                echo ' <a class="text-danger" href="#"  onclick="UnblockUser(' . $row->payment_id . ')"> 
                            <i class="fa fa-eye-slash"> Activate</i></a> ';
                            }
                            ?>

                        </td>
                    </tr>
                    <?php
                    $count++;
                endforeach;
            endif;
            ?>
        </tbody>
    </table>
</div>

<script>
    function filterActivated() {
        $.ajax({
            url: "<?php echo base_url("payments/payments_controller/filter_activated") ?>",
            type: 'POST',
            dataType: 'JSON',
            data: $('#filterForm').serialize(),
            success: function (data, textStatus, jqXHR) {
                $('.activate_table').html(data);
                $('#example').DataTable();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }

    function blockUser(id) {
        if (confirm("Are you sure want to Deactivate this student")) {
            $.ajax({
                url: "<?php echo base_url('payments/payments_controller/deactivate'); ?>/" + id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert('student deactivated successfully');
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
    function UnblockUser(id) {
        if (confirm("Are you sure want to Activate this student")) {
            $.ajax({
                url: "<?php echo base_url('payments/payments_controller/activate_student'); ?>/" + id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert('student activated successfully');
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
</script>


