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
            <th>Registration Number</th>
            <th>Name</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody id="membersTable">
        <?php
        $count = 1;
        if ($members) {
            foreach ($members as $row):
                ?>
                <tr>
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($row->registration_number); ?></td>
                    <td><?php echo ucwords($row->name); ?></td>
                    <td> 
                        <?php
                        if ($row->active_user == 0) {
                            echo ' <a class="text-success" href="#" onclick="blockUser(' . $row->member_id . ')" > 
                            <i class="fa fa-eye"> Block</i></a> ';
                        } else {
                            echo ' <a class="text-danger" href="#"  onclick="UnblockUser(' . $row->member_id . ')"> 
                            <i class="fa fa-eye-slash"> Blocked</i></a> ';
                        }
                        ?>

                    </td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
<script>
    function blockUser(member_id) {
        if (confirm("Are you sure want to block the group Memember")) {
            $.ajax({
                url: "<?php echo base_url('chat/chat_controller/block_user'); ?>/" + member_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    $('#membersTable').html(data)
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
    function UnblockUser(member_id) {
        if (confirm("Are you sure want to unblock the group Memember")) {
            $.ajax({
                url: "<?php echo base_url('chat/chat_controller/unblock_user'); ?>/" + member_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    $('#membersTable').html(data)
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
</script>

