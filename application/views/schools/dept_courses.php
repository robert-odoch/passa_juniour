<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>

<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
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
        if ($dept_courses) {
            foreach ($dept_courses as $course):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($course->course_code); ?></td>
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
    function deleteCourse(course_id) {
        if (confirm("Are you sure want to delete")) {
            $.ajax({
                url: "<?php echo base_url('schools/schools_controller/deleteDeptCourse/'); ?>/" + course_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert('departmental course deleted successfully');
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
    function addRecord(id) {
        $('#modal_form').modal('show');
        $('[name="dept_id"]').val(id);
    }
    function save() {
        $.ajax({
            url: "<?php echo base_url("schools/schools_controller/submitDeptCourses"); ?>",
            type: 'POST',
            dataType: 'JSON',
            data: $('form').serialize(),
            success: function (data, textStatus, jqXHR) {
                $('#success_alert').html(" <div class=\"alert alert-success col-md-6\"> " + data.status + "</div>");
                $("#modal_form").modal('hide');
                location.reload();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
</script>


<div class="modal fade" id="modal_form" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Add school system user</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal" data-parsley-validate>
                    <div class="form-body">

                        <div class="form-group">
                            <div class="col-md-12">
                                <input name="code" placeholder="Enter Code" class="form-control" type="text" required="">
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <input name="program"  placeholder="Enter Program Name" class="form-control" type="text" required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <select name="level" class="form-control">
                                    <option value="null">---select graduate level--</option>
                                    <option value="0">Under graduate level</option>
                                    <option value="1">Post graduate level</option>
                                </select>
                            </div>
                        </div>
                        <input name="dept_id" placeholder="" class="form-control" type="hidden" required="">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>