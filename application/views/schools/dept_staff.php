<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>
<div class="clearfix"></div>

<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        foreach ($dept_users as $user):
            ?>
            <tr>
                <td><?php echo ucwords($count); ?></td>
                <td><?php echo ucwords($user->name); ?></td>
                <td><?php echo ucwords($user->email); ?></td>
                <td><?php echo ucwords($user->contact); ?></td>
                <td>
                    <a href="#" class="text-danger" onclick="deleteUser(<?php echo $user->user_id; ?>)">
                        <i class="fa fa-trash"> Delete</i></a>
                </td>
            </tr>
            <?php
            $count++;
        endforeach;
        ?>
    </tbody>
</table>
<script>
    function deleteUser(user_id) {
        if (confirm("Are u sure want to delete??")) {
            $.ajax({
                url: "<?php echo base_url("schools/schools_controller/deleteStaff"); ?>/" + user_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert('department staff Deleted successfully');
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }

    }
    function addRecord(id) {
        $('#modal_form').modal('show');
        $('[name="school_id"]').val(id);
    }
    function save() {
        $.ajax({
            url: "<?php echo base_url("schools/schools_controller/submit_staff"); ?>",
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
                                <select id="employee" name="staff" class="form-control selectpicker"
                                        data-live-search="true" data-required="true"  data-trigger="change" required="">
                                    <option value="">--Select staff--</option>
                                    <?php
                                    foreach ($staff as $key) {
                                        ?>
                                        <option
                                            value="<?php echo $key['user_id']; ?>"><?php echo $key['name'] ?></option>
                                            <?php
                                        }
                                        ?>
                                </select>
                            </div>
                        </div>
                        <input name="school_id" placeholder="" class="form-control" type="hidden" required="">
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