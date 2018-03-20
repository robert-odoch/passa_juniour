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
            <th>ID</th>
            <th>School Name</th>
            <th>Classes</th>
            <th>When added</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
            foreach ($schools as $row):
                ?>
                <tr id="table_show">
                    <td><?php echo $count;?></td>
                    <td><a href="<?php echo base_url("schools/Schools_controller/school_dashboard/" . $row['id']); ?>"><?php echo ucwords($row['name'] ); ?></a></td>
                    <td><a href="<?php echo base_url("schools/Schools_controller/school_subjects/".$row['id']);?>"><?php echo ucwords($row['count_classes']." classes");?></a></td>
                    <td><?php echo $row['_when_added'];?></td>
                    <td> <a class="text-success" href="<?php echo base_url(); ?>schools/schools_controller/editSchool/<?php echo $row['id']; ?>"> <i class="fa fa-pencil-square-o"> Edit</i></a> || <a href="#" class="text-danger" onclick="deleteSchool(<?php echo $row['id']; ?>)"> <i class="fa fa-trash"> Delete</i></a></td>
                </tr>
                <?php
                $count++;
            endforeach;
 
        ?>
    </tbody>
</table>

<script>
    function deleteSchool(school_id) {
        if (confirm("Are you sure want to delete")) {
            $.ajax({
                url: "<?php echo base_url('depts/dept_controller/deleteSchool/'); ?>/" + school_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert('School deleted successfully');
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }

</script>
