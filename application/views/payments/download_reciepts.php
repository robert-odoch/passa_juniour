<html>
    <head>
        <link href="<?php echo base_url(); ?>assets/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
         <center><h1><?php echo $banner->university; ?></h1></center>
        <center><h5>Student Receipts</h5></center>
    
        <div class="row">
            <!--<img  src="public/upload/banners/<?php echo $banner->banner; ?>" class="img img-responsive" />-->
        </div>
        
        <div class="clearfix"></div>
        <div class="row">
            
            <div class="col-xs-5">
                <h3>Course: <?php echo $course->course; ?></h3>
                <h4>Name: <?php echo $names; ?></h4>
                <h5>Intake : <?php echo $intake->intake_name; ?></h5>
                <h5>Year : <?php echo $academic_year->year; ?></h5>
                <h5>Semester: <?php echo $semester->semester; ?></h5>
                
            </div>
            
            <div class="col-xs-3">
                
            </div>
            <div class="col-xs-4">
                
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 card">
                <br>
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
        </div>
    </body>
</html>

