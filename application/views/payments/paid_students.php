

<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>

</div>



<div class="col-lg-12">
    
    <form role="form" method="post" class="form-inline" action="#" id="studentsForm">
        <div class="form-group">
            <label for="exampleInputEmail1 " class="col-lg-12">Course</label>
            <select name="course_id" class="selectpicker col-lg-12"  data-live-search="true">
                <?php
                if (isset($courses)) {
                    foreach ($courses as $course) {
                        echo '<option value="' . $course->course_id . '">' . $course->course_code . '</option>';
                    }
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1" class="col-lg-12">Intake</label>
            <select name="intake" class="selectpicker col-lg-12"  data-live-search="true" >
                <?php
                if (isset($intakes)) {
                    foreach ($intakes as $intake) {
                        echo '<option value="' . $intake->intake_id . '">' . $intake->intake_name . '</option>';
                    }
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1" class="col-lg-12">Year of Study</label>
            <select name="year_of_study" class="selectpicker col-lg-12"  data-live-search="true" >
                <?php
                foreach ($study_years as $study_year) {
                    echo '<option value="' . $study_year->year_id . '">' . $study_year->year . '</option>';
                }
                ?>
            </select>
        </div>
        <div class="form-group">
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

        <div class="form-group">
            <label for="exampleInputEmail1" class="col-lg-12"><span style="opacity: 0">dummy</span></label>
            <button type="button" onclick="filterStudents()" class="btn btn-success m-t-xs bottom15-xs">Filter students</button>
            <!--<input type="submit" class="btn btn-primary" value="go"/>-->
        </div>
    </form>
</div>
<div class="clearfix"></div
<br><br>
<div class="row">
    <div class="pull-left col-lg-4" id="test">
        <div class="col-lg-12">
            <div class="col-lg-6" id="excel"></div>
        </div>
    </div>
</div>
<br><br>
<div id="paid_students">
    <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
            <tr>
                <th>No</th>
                <th>Registration Number</th>
                <th>Student Name</th>
                <th>Paid Amount</th>
                <th>Balance</th>
                <th>Paid Percentage</th>
                <th>Payment Times</th>
                 <th>Recept No</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="studentsTable">

        </tbody>
    </table>
</div>
<script>
   window.addEventListener("load", function(){
    //reload payment page
   payments_reload();
});
    function filterStudents() {
        $.ajax({
            url: "<?php echo base_url("payments/payments_controller/fetchPaid"); ?>",
            type: 'POST',
            dataType: 'JSON',
            data: $('#studentsForm').serialize(),
            success: function (data, textStatus, jqXHR) {
                $('#paid_students').html(data.data);
                $('#example').DataTable();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function payments_reload(){
         $.ajax({
            url: "<?php echo base_url("payments/payments_controller/payments_reload"); ?>",
            type: 'POST',
            dataType: 'JSON',
            data: $('#studentsForm').serialize(),
            success: function (data, textStatus, jqXHR) {
                $('#paid_students').html(data.data);
                $('#example').DataTable();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    
   
</script>
<script>

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