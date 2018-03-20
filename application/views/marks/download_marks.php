<html>
    <head>
        <link href="<?php echo base_url(); ?>assets/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
    <!--<center><h1><?php //echo $banner->university; ?></h1></center>-->
    <!--<center><h5>Semester Marks</h5></center>-->
        <div class="row">
            <img  src="public/mygrades/upload/banners/<?php echo $banner->banner; ?>" class="img-responsive" />
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
                            <?php
                            foreach ($course_units as $row) {
                                echo '<th>' . $row->course_unit . '</th>';
                            }
                            ?>
                        </tr>
                    </thead>
                    <tbody id="studentsTable">
                        <?php
                        $count = 1;
                        if (isset($array_data)) {
                            foreach ($array_data as $student):
                                ?>
                                <tr id="table_show">
                                    <td><?php echo ucwords($count); ?></td>
                                    <?php
                                    foreach ($student as $data) {
                                        echo "<td>" . $data . "</td>";
                                    }
                                    ?>
                                </tr>
                                <?php
                                $count++;
                            endforeach;
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>


