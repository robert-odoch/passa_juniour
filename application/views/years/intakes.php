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
            <th>Level</th>
             <th>When added</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($intakes) {
            foreach ($intakes as $intake):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($intake['name']); ?></td>
                    <td><?php echo ucwords($intake['_when_added']); ?></td>
                    <td> <a class="text-success" href="<?php echo base_url(); ?>years/yearcontroller/fetchIntake/<?php echo $intake['id']; ?>"> <i class="fa fa-pencil-square-o"> Edit</i></a>
                        || <a class="text-danger" href="#" onclick="deleteIntake(<?php echo $intake['id']; ?>)"> <i class="fa fa-trash"> Delete</i></a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
<script>
    function deleteIntake(intake_id) {
        if (confirm("Are you sure want to delete")) {
            $.ajax({
                url: "<?php echo base_url('years/yearcontroller/deleteIntake/'); ?>/" + intake_id,
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


