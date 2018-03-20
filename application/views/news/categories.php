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
            <th>Featured Image</th>
            <th>News Category</th>
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
                    <td>
                        <?php if ($category->featured_image != null):
                            ?>
                        <img style="height: 80px;width: 120px;" src="<?= base_url("upload/featured/" . $category->featured_image); ?>" class="img-responsive" />
                            <?php
                        else:
                            echo '<img style="height: 120px;width: 120px;" src="' . base_url("assets/img/default/NoPicAvailable.png") . '" class="img-responsive" />';
                            ?>

                        <?php endif; ?>
                    </td>
                    <td> <?php echo ucwords($category->category); ?></td>
                    <td> <a href="<?php echo base_url(); ?>complaints/complaint_controller/editCategory/<?php echo $category->category_id; ?>">Edit</a> 
                        || <a href="#" onclick="deleteCategory(<?php echo $category->category_id; ?>)">Delete</a></td>
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

