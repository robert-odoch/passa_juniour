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
            <th>Complaint category</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($category) {
            foreach ($category as $category):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td> <?php echo ucwords($category->type); ?></td>
                    <td> <a  href="<?php echo base_url(); ?>complaints/complaint_controller/editCategory/<?php echo $category->complaint_types_id; ?>"><i class="fa fa-edit"></i> Edit</a> 
                        || <a class="text-danger" href="#" onclick="deleteCategory(<?php echo $category->complaint_types_id; ?>)"><i class="fa fa-trash"></i>  Delete</a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>

<script>

    function deleteCategory(category_id) {
        if (confirm("Are u sure what to delete")) {
            $.ajax({
                url: "<?php echo base_url('university/dashboard/deleteComplaintCategory/'); ?>/" + category_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert("Category deleted successfully");
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
</script>

