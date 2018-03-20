<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>
        <div id="success_alert">
            <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>
        </div>
    <?php endif; ?>

    <div id="success_alert">

    </div>

</div>
<div class="clearfix"></div>
<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

    <thead>
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>When Added</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($classes) {
            foreach ($classes as $row):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($row['name']); ?></td>
                      <td><?php echo ucwords($row['_when_added']); ?></td>
                    <td>
                        <a class="text-danger" href="#" onclick="deleteDept(<?php echo $row['id']; ?>)">  <i class="fa fa-trash"> Delete</i></a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
<script>
    function deleteDept(dept_id) {
        if (confirm("Are you sure want to delete")) {
            $.ajax({
                url: "<?php echo base_url('schools/schools_controller/deleteDept/'); ?>/" + dept_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert('department deleted successfully');
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }

    function addRecord(id = null) {
        $("#modal_form").modal('show');
        $('[name="school_id"]').val(id);
    }
    function save() {
        $.ajax({
            url: "<?php echo base_url("schools/schools_controller/save_dept"); ?>",
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
                <h3 class="modal-title">Register department</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal" data-parsley-validate>
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">

                        <div class="form-group">
                            <div class="col-md-12">
                                <input name="dept" placeholder="Department Name" class="form-control" type="text" required="">
                            </div>
                        </div>
                        <input name="school_id" placeholder="Department Name" class="form-control" type="hidden" required="">
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
