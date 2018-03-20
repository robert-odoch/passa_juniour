
<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>

</div>


<div id="studentsTable">
    <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
            <tr>
                <th>No</th>
                <th>student Name</th>
                <th>Parent Name</th>
                <th>Parent contact</th>
                <th>Parent Email</th>
                 <th>When added</th>
                <td>Action</td>
            </tr>
        </thead>
        <tbody>
            <?php
            $count = 1;
            if (isset($students)) {
                foreach ($students as $students):
                    ?>
                    <tr id="table_show">
                        <td><?php echo ucwords($count); ?></td>
                        <td><?php echo ucwords($students['name']); ?></td>
                        <td><?php echo ucwords($students['parent']); ?></td>
                        <td><?php echo ucwords($students['phone_number']); ?></td>
                        <td><?php echo ucwords($students['email']); ?></td>
                         <td><?php echo ucwords($students['_when_added']); ?></td>
                        <td> <a href="#" onclick="editStudent(<?php echo $students['id']; ?>)">Edit</a> || <a href="#" onclick="deleteStudent(<?php echo $students['id']; ?>)">Delete</a></td>
                    </tr>
                    <?php
                    $count++;
                endforeach;
            }
            ?>
        </tbody>
    </table>
</div>
<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script>// 
                            $(document).ready(function () {
                                $('#exportStudentBtn').hide();
                            });
                            function filterStudents() {
                                var course_id = $('#course_id').val();
                                var intake = $('#intake').val();
                                $('#intake_exp').val(intake);
                                $('#course_exp').val(course_id);


                                $.ajax({
                                    url: "<?php echo base_url("students/Students_controller/students"); ?>",
                                    type: 'POST',
                                    dataType: 'json',
                                    data: $('#studentsForm').serialize(),
                                    success: function (data, textStatus, jqXHR) {
                                        $('#studentsTable').html(data);
                                        $('#example').DataTable();
                                        if (data != null) {
                                            $('#exportStudentBtn').show();
                                        } else {
                                            $('#exportStudentBtn').hide();
                                        }
                                    }, error: function (jqXHR, textStatus, errorThrown) {
                                        alert(errorThrown);
                                    }
                                });
                                $('#exportData').click(function () {
                                    var id = $('#exportData').val();
                                    alert(id);
                                });
                            }
</script>
