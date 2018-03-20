<br>
<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>Course Code</th>
            <th>Course Name</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($courses) {
            foreach ($courses as $course):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><a href="<?php echo base_url(); ?>university/dashboard/courseStudents/<?php echo $course->course_id; ?>"><?php echo ucwords($course->course_code); ?></a></td>
                    <td> <?php echo ucwords($course->course); ?></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
<script>
    function filterMarks(course_id) {
        $('[name="course_id"]').val(course_id);
        $('#filterStudentsModal').modal('show');
    }
</script>


<div class="modal fade" id="filterStudentsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Show students</h4>
            </div>
            <div class="modal-body">

                <form role="form" method="post" action="<?php echo base_url('university/dashboard/courseStudents/<span id="course_idd"></span>'); ?>" id="marksfilter_form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Intake</label>
                        <select name="intake" class="form-control">
                            <?php
                            foreach ($intakes as $intakes):
                                echo '<option value="' . $intakes->intake_id . '">' . $intakes->intake_name . '</option>';
                            endforeach;
                            ?>
                        </select>
                    </div>
                    <input type="hidden" name="course_id">
                    <button type="submit" class="btn btn-primary pull-right">show students</button>
                </form>
            </div>
            <br><br>
            <div class="modal-footer">

            </div>
        </div> 
    </div> 
</div> 




