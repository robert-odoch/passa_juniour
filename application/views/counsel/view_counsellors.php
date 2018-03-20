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
        foreach ($counsellors as $user):
            ?>
            <tr>
                <td><?php echo ucwords($count); ?></td>
                <td><?php echo ucwords($user->name); ?></td>
                <td><?php echo ucwords($user->email); ?></td>
                <td><?php echo ucwords($user->contact); ?></td>
                <td><a href="#" onclick="deleteUser(<?php echo $user->id?>)" class="text-danger"><i class="fa fa-trash"></i></a></td>
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
                url: "<?php echo base_url("counsel/counsel_controller/deleteCouncoil"); ?>/" + user_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert(data.status);
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }

    }

</script>
