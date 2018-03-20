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
            <th>Fees Category</th>
            <th>Amount</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        $total = 0;
        if ($amount) {
            foreach ($amount as $row):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($row->name); ?></td>
                    <td><?php echo ucwords(number_format($row->amount)); ?></td>
                    <td> <a class="text-success" href="<?php echo base_url(); ?>payments/payments_controller/editFees/<?php echo $row->fees_id; ?>" >  <i class="fa fa-pencil-square-o"> Edit</i></a> ||
                        <a class="text-danger" href="#" onclick="deleteFees(<?php echo $row->fees_id; ?>)">  <i class="fa fa-trash"> Delete</i></a></td>
                </tr>
                <?php
                $total += $row->amount;
                $count++;
            endforeach;
        }
        ?>
    </tbody>
    <tr>
        <td></td>
        <td></td>
        <td class="text-success"><?= "Total Amount: ".number_format($total)."/=";?></td>
        <td></td>
    </tr>
</table>
<script>
    function deleteFees(fees_id) {
        if (confirm("Are you sure want to delete")) {
            $.ajax({
                url: "<?php echo base_url('payments/payments_controller/deleteFees/'); ?>/" + fees_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert('Fees Stucture deleted successfully');
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
</script>

