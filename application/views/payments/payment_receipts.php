<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>

</div>


<div class="clearfix"></div
<br><br>
<div class="row">
    <div class="pull-left col-lg-4" id="test">
        <div class="col-lg-12">
            <div class="col-lg-6" id="excel"></div>
        </div>
    </div>
</div>
<br><br>
<div id="course_units">
    <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
            <tr>
                <th>No</th>
                <th>Receipts No:</th>
                <th>Amount</th>
                <th>Payment Date</th>
            </tr>
        </thead>
        <tbody id="studentsTable">
            <?php
            $count = 1;
            if ($student_recepts) {
                $sum_paid = 0;
                foreach ($student_recepts as $row):
                    ?>
                    <tr id="table_show">
                        <td><?php echo ucwords($count); ?></td>
                        <td><?php echo ucwords($row->recept_no); ?></td>
                        <td> <?php echo ucwords(number_format($row->amount)); ?></td>
                        <td> <?php echo ucwords($row->_when_added); ?></td>
                        <?php $sum_paid += $row->amount ?>
                    </tr>
                    <?php
                    $count++;
                endforeach;
            }
            ?>
        </tbody>
        <tr>
            <td></td>
            <td><span class="text-success">Total Amount &nbsp; <?php echo number_format($sum_paid); ?></span> </td>
            <td> <span class="text-danger">Balance: <?php echo number_format($balance); ?></span></td>
            <td></td>
        </tr>
    </table>
</div>

