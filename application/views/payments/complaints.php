<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>
<div class="clearfix"></div>

<div class="clearfix"></div>
<br><br>
<br>
<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

    <thead>
        <tr>
            <th>No</th>
            <th>Registration Number</th>
             <th>Student Name</th>
            <th>Complaint</th>
             <th>Posted Date</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody id="complaints_table">
        <?php
        $count = 1;
        if ($complaints) {
            foreach ($complaints as $row):
                ?>
                <tr>
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($row->registration_number);?></td>
                    <td><?php echo ucwords($row->firstName." ".$row->lastName);?></td>
                    <td><?php echo ucwords(substr($row->complaint, 0, 40) . '... <span class="text-success"><a href="' . base_url("payments/payments_controller/pending_details/" . $row->complaint_id) . '">Read More</a></span>'); ?></td>
                    <td><?php echo ucwords($row->_when_added); ?></td>
                    <td><a href="<?php echo base_url(); ?>payments/payments_controller/pending_details/<?php echo $row->complaint_id; ?>"><i class="fa fa-eye"> View Complaint</i></a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
