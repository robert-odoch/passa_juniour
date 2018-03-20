<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>

</div>
<div id="course_units">
    <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
            <tr>
                <th>No</th>
                <th>Category Name</th>
                <th>Payment Times</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="studentsTable">
            <?php
            $count = 1;
            if ($categories) {
                foreach ($categories as $row):
                    ?>
                    <tr>
                        <td><?php echo ucwords($count); ?></td>
                        <td><?php echo ucwords($row['name']); ?></td>
                        <td><?php echo ucwords($row['paid_times']); ?></td>
                        <td> <a class="text-success" href="<?php echo base_url(); ?>payments/payments_controller/edit_category/<?php echo $row['cat_id']; ?>" >  <i class="fa fa-pencil-square-o"> Edit</i></a> ||
                            <a class="text-danger" href="<?php echo base_url(); ?>payments/payments_controller/delete_category/<?php echo $row['cat_id']; ?>">  <i class="fa fa-trash"> Delete</i></a></td>

                    </tr>
                    <?php
                    $count++;
                endforeach;
            }
            ?>
        </tbody>
    </table>
</div>
