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
            <th>Sent BY</th>
            <th>Contact</th>
            <th>Appointment Date</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    <form method="post">
        <?php
        $count = 1;

        foreach ($appointments as $row):
            ?>
            <tr>
                <td><?php echo ucwords($count); ?></td>
                <td><?php echo ucwords($row->firstName . " " . $row->lastName); ?></td>
                <td><?php echo ucwords($row->contact); ?></td>
                <td>
                    <span class="text-primary" >
                        <input type="text" name="time_stamp" id="appointmentDate" readonly="" class="form-control datepicker"  value="<?php echo ucwords($row->appointment_date); ?>">
                    </span>
                </td>


                <td>
                    <a href="#" class="text-danger" onclick="deleteUser(<?php echo $row->appointment_id; ?>)">
                        <i class="fa fa-trash"> Delete</i></a>
                </td>
            </tr>
            <?php
            $count++;
        endforeach;
        ?>
    </form>
</tbody>
</table> 
<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script type="text/javascript">
                        $(document).ready(function () {
                            //datepicker
                            $('.datepicker').datepicker({
                                autoclose: true,
                                format: "yyyy-mm-dd",
                                todayHighlight: true,
                                orientation: "top auto",
                                todayBtn: true,
                                todayHighlight: true,
                            });
                        });
                        $('#appointmentDate').keydown(function () {
                            alert('ok');
                        });
</script>

