<html>
    <head>
        <link href="<?php echo base_url(); ?>assets/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
    <center><h1><?php echo $banner->university; ?></h1></center>
    <center><h5><?php
            if ($level == 0):echo "Undergraduate ";
            else: echo 'Post Graduate ';
            endif;
            ?>Marks Grading</h5></center>
    <div class="row">
        <!--<img src="<?= base_url("upload/banners/" . $banner->banner); ?>" class="img-responsive" />-->
    </div>
    <div class="clearfix"></div>

    <div class="row">
        <div class="col-sm-12 card">
            <br>
            <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Grade</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Grade Value</th>
                        <th>Progress Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $count = 1;
                    if (isset($grading)):
                        foreach ($grading as $row) {
                            ?>
                            <tr>
                                <td><?php echo ucwords($count); ?></td>
                                <td><?php echo ucwords($row->grade); ?></td>
                                <td><?php echo ucwords($row->value_frm); ?></td>
                                <td><?php echo ucwords($row->value_to); ?></td>
                                <td><?php echo ucwords($row->grade_value); ?></td>
                                <td><?php
                                    if ($row->progress == 0) {
                                        echo ucwords("Normal Progress");
                                    } else {
                                        echo ucwords("Retake");
                                    }
                                    ?></td>
                            </tr>
                            <?php
                            $count++;
                        }
                    endif;
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>


