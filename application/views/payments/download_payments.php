<html>
    <head>
        <link href="<?php echo base_url(); ?>assets/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
    <center><h1><?php echo $banner->university; ?></h1></center>
    <center><h5>Student's Payments</h5></center>
        <div class="row">
            <!--<img  src="public/upload/banners/<?php echo $banner->banner; ?>" class="img img-responsive" />-->
        </div>
        
        <div class="clearfix"></div>
        <div class="row">
            
            <div class="col-xs-5">
                <h3>Course: <?php echo $course->course; ?></h3>
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
                            <th>Registration Number</th>
                            <th>Student Name</th>
                            <th>Paid Amount</th>
                            <th>Balance</th>
                            <th>Paid Percentage</th>
                            <th>Payment Times</th>
                            <th>Recept No</th>
                        </tr>
                    </thead>
                    <tbody id="studentsTable">
                       <?php
                        $count = 1;
        foreach ($table_content as $row) {//total_fees
            $per = "";
            $details_link = "";
            if ($row->paid_times > 1) {
                $details_link = "";
            } else {
                $details_link = "$row->recept_no";
            }

            $balance = "";
            if ($fees != null) {
                $balance = number_format($fees - $row->amount);
                $per = ($row->amount / $fees) * 100;
                $per=  round($per,2);
            } else {
                $balance = "Fees Structure Required";
                $per = "";
            }

            ?>
                        
                        
       <tr>
        <td><?= ucwords($count) ?></td>
        <td><?= ucwords($row->registration_number)?></td>
       <td><?= ucwords($row->firstName . " " . $row->lastName) ?></td>
         <td><?= ucwords(number_format($row->amount)) ?></td> 
       <td><?= ucwords($balance) ?></td> 
        <td><?= ucwords($per . " %") ?></td> 
       <td><?= ucwords($row->paid_times) ?></td>
        <td><?= ucwords($details_link) ?></td> 
         </tr>
      <?php
          $count++;
        }
        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>