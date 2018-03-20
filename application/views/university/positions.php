<br>
<button class="btn btn-success pull-right" id="all_actions_btn" onclick="addPosition()"><i class="glyphicon glyphicon-plus"></i> Add Position</button>
<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>Position</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($positions) {
            foreach ($positions as $position):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($position->position); ?></td>
                    <td> <a href="#" onclick="editPosition(<?php echo $position->position_id; ?>)">Edit</a> || <a href="#" onclick="deletePosition(<?php echo $position->position_id; ?>)">Delete</a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }else {
            //echo '<tr><td class="text-danger">No data found</td></tr>';
        }
        ?>
    </tbody>
</table>
<script>
    // register positions
    var save_method;
    function addPosition() {
        save_method = "add";
        $('#position_form')[0].reset();
        $('#addPositionModal').modal('show');
    }
    function submitPosition() {
        var url;
        if (save_method == "add") {
            url = "<?php echo base_url('university/dashboard/addPosition'); ?>";
        } else {
            url = "<?php echo base_url('university/dashboard/updatePosition'); ?>";
        }
        $.ajax({
            url: url,
            dataType: 'JSON',
            type: 'POST',
            data: $('#position_form').serialize(),
            success: function (data) {
                $('#position_form')[0].reset();
                $('#addPositionModal').modal('hide');
                toastr.success('Position added successfully.', 'Success Alert', {timeOut: 8000});
                location.reload();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }

        });
    }
    function editPosition(position_id) {
        save_method = "update";
        $.ajax({
            url: "<?php echo base_url('university/dashboard/editPosition/'); ?>/" + position_id,
            type: 'GET',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('[name="position_id"]').val(data.position_id);
                $('[name="position"]').val(data.position);
                $('#addPositionModal').modal('show');
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    function  deletePosition(position_id) {
        if (confirm("Are sure want to delete")) {
            $.ajax({
                url: "<?php echo base_url('university/dashboard/deletePosition/'); ?>/" + position_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    toastr.success('Position Deleted successfully.', 'Success Alert', {timeOut: 8000});
                    location.reload();
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
</script>




<!--registering positions-->
<div class="modal fade" id="addPositionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Register Position</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="" id="position_form">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Position</label>
                        <input type="email" class="form-control" name="position" id="exampleInputEmail1" placeholder="Enter position">
                    </div>
                    <input type="hidden" name="position_id" id="position_id" placeholder="position_id">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submitPosition()">Save changes</button>
            </div>
        </div> 
    </div> 
</div> 
