<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>
        <?php echo $msg ?>
    <?php endif; ?>



</div>

<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>No</th>
            <th>Subject</th>
            <th>When added</th>
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
                    <td> <?php echo ucwords($course['name']); ?></td>
                    <td><?php echo $course['_when_added']?></td>
                    <td> <a class="text-success" href="<?php echo base_url(); ?>courses/course_controller/editCourse/<?php echo $course['course_id']; ?>"> <i class="fa fa-pencil-square-o"> Edit</i></a> || <a href="#" class="text-danger" onclick="deleteCourse(<?php echo $course['course_id']; ?>)"> <i class="fa fa-trash"> Delete</i></a></td>
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
            url: "<?php echo base_url("courses/Course_controller/filter_courses") ?>/" + id,
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


