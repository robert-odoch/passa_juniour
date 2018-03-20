<div class="pull-right" id="test">
    <div class="col-lg-12">
        <div class="col-lg-6" id="word">
            <a href="<?php echo base_url(); ?>marks/marks_controller/download_marks/<?php echo $course_id . "/" . $semester . "/" . $year . "/" . $intake ?>" class="btn btn-success" id="export_Btn">Download PDF</a>
        </div>
        <div class="col-lg-6">

        </div>
    </div>
</div>
<br></br><br>
<div class="clearfix"></div>
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
            <th>Action</th>
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
                    $reg_no = array();
                    foreach ($student as $data) {
                        echo "<td>" . $data . "</td>";
                        $reg_no[] = $data;
                    }
                    ?>
                    <?php
                    foreach ($reg_no as $key => $value):
                        if ($key == 0) {

                            echo '<td><form action="' . base_url("marks/marks_controller/generateMiniStatment") . '" method="post">'
                            . '<input type="hidden" name="reg_no" value="' . $value . '">'
                            . '<input type="hidden" name="semester" value="' . $r_sem . '">'
                            . '<input type="hidden" name="year" value="' . $r_year . '">'
                            . '<input type="submit" value="mini statement">'
                            . '</form></td>';
                            //  echo '<td><a href="' . base_url("marks/marks_controller/generateMiniStatment/" . $value . "/" . $r_sem . "/" . $r_year) . '">Report</a></td>';
                        }
                    endforeach;
                    ?>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>