<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>

<div class="clearfix"></div>
<br><br>
<br>

<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

    <thead>
        <tr>
            <th>No</th>
            <th>Complaint Category</th>
            <th>Complaint</th>
            <th>Posted Date</th>
            <th>Cleared Date</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody id="complaints_table">
        <?php
        $count = 1;
        if ($complaints) {
            foreach ($complaints as $row):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?=(($row->_status==0)?"Fees Complaint":"Marks Complaint") ?></td>
                    <td><?php echo ucwords(substr($row->message, 0, 40) . '... <span class="text-success"><a href="' . base_url("complaints/complaint_controller/replied_complaint/" . $row->complaint_id) . '">Read More</a></span>'); ?></td>
                    <td><?php echo ucwords($row->time_stamp); ?></td>
                    <td><?php echo ucwords($row->cleared_date); ?></td>
                    <td><a href="<?php echo base_url(); ?>complaints/complaint_controller/replied_complaint/<?php echo $row->id; ?>"><i class="fa fa-eye"> View Complaint</i></a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script>
    $('#courses').change(function () {
        var id = $(this).val();
        if (id == "") {
        } else {
            fetch_complaints(id);
        }
    });
    function fetch_complaints(id) {
        $.ajax({
            url: "<?php echo base_url("complaints/complaint_controller/filter_cleared") ?>/" + id,
            type: 'POST',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('#complaints_table').html(data);
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown)
            }
        });
    }

</script>
