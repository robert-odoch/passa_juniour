<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>
        <?php echo $msg ?>
    <?php endif; ?>



</div>

<div class="clearfix"></div>
<br><br>
<br>
<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>No</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody id="courses_table">
        <?php
        $count = 1;
        if ($courses) {
            foreach ($courses as $course):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($course->course_code); ?></td>
                    <td> <?php echo ucwords($course->course); ?></td>
                    <td><a class="btn btn-primary" href="<?php echo base_url();?>payments/payments_controller/course_frees/<?php echo $course->course_id?>">Fees Structure</a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>

<script>

    function deleteCourse(course_id) {
        if (confirm("Are you sure want to delete")) {
            $.ajax({
                url: "<?php echo base_url('university/dashboard/deleteCourse/'); ?>/" + course_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    toastr.success('Action successful.', 'Success Alert', {timeOut: 8000});
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
</script>
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
            url: "<?php echo base_url("payments/payments_controller/filter_courses") ?>/" + id,
            type: 'POST',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('#courses_table').html(data);
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown)
            }
        });
    }

</script>


