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
            <th>Group Name</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($groups) {
            foreach ($groups as $row):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($row->group_name); ?></td>
                    <td> 
                        <a class="text-success" href="<?php echo base_url(); ?>years/yearcontroll/editAcademicYear/<?php echo $row->group_id; ?>" > 
                            <i class="fa fa-pencil-square-o"> Edit</i></a> ||
                        <a class="text-danger" href="#" onclick="deleteAcadecYear(<?php echo $row->group_id; ?>)"> 
                            <i class="fa fa-trash"> Delete</i></a>||
                            <a class="text-warning" href="<?php echo base_url();?>chat/chat_controller/view_members/<?php echo $row->group_id;?>"> 
                            <i class="fa fa-eye"> View Members</i></a>
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
    function deleteAcademicYear(academic_year_id) {
        if (confirm("Are you sure want to delete")) {
            $.ajax({
                url: "<?php echo base_url('years/yearcontroller/deleteAcademicYear/'); ?>/" + academic_year_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert('Academic Year deleted successfully');
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
</script>

