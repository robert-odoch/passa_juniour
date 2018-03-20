<html>
    <head>
        <link href="<?php echo base_url(); ?>assets/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
    <center><h1><?php echo $banner->university; ?></h1></center>
    <center><h5>Assigned Course Units</h5></center>
    <div class="row">
        <!--<img src="<?= base_url("upload/banners/" . $banner->banner); ?>" class="img-responsive" />-->
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-xs-5">
            <h5>Course: <?php echo $course_name->course; ?></h5>
            <h5>Academic year: <?php echo $academic_year->academic_year; ?></h5>
            <h6>Semester: <?php echo $semester->semester ?></h6>
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
                        <th>Code</th>
                        <th>Course Unit</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $count = 1;
                    if (isset($course_units)):
                        foreach ($course_units as $row) {
                            ?>
                            <tr>
                                <td><?php echo ucwords($count); ?></td>
                                <td><?php echo ucwords($row->course_unit_code); ?></td>
                                <td><?php echo ucwords($row->course_unit); ?></td>
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


