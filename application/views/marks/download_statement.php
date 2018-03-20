<link href="<?php echo base_url(); ?>assets/css/bootstrap.min.css" rel="stylesheet">
<div  id="print_complaint">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-6">
                <p>Student Name: <span style="font-weight: 600;font-size: 15px;"><?php
                        if (isset($student)): echo ucfirst($student->firstName . " " . $student->lastName);
                        endif;
                        ?></span></p>
                <p>Registration Number: <span style="font-weight: 600;font-size: 15px;"><?php
                        if (isset($student)): echo ucfirst($student->registration_number);
                        endif;
                        ?></span></p>

                <p>Academic Year: <span style="font-weight: 600;font-size: 15px;"><?php echo ucfirst($year->academic_year) ?></span></p>
                <p>Semester: <span class="text-justify" style="font-weight: 600;font-size: 15px;"><?php echo ucfirst($semester->semester) ?></span></p>
            </div>
        </div> 
        <div class="clearfix"></div>
        <div class="col-lg-12">
           <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
                <thead>
                <th>Course Code</th>
                <th>Marks</th>
                <th>Grade</th>
                <th>Grade Value</th>
                <th>Progress</th>
                <hr>
                </thead>

                <?php
                $count = 0;

                $sum_value = 0;
                if (isset($marks)):
                    foreach ($marks as $row):
                        $grade_row;
                        ?>
                        <tr>
                            <td style="padding:5px"><?php echo ucwords($row->course_unit) ?></td>
                            <td><?php echo ucwords($row->mark) ?></td>
                            <?php
                            foreach ($grading as $grade) {

                                if ($row->mark >= $grade->value_frm && $row->mark <= $grade->value_to) {
                                    if ($grade->progress == 1) {
                                        $grade_row = $grade->grade . "";
                                        echo ' <td>' . ucfirst($grade_row) . '</td>';
                                        echo ' <td>' . ucfirst($grade->grade_value) . '</td>';
                                        echo ' <td>' . ucfirst("Retake") . '</td>';
                                    } else {
                                        $grade_row = $grade->grade;
                                        echo ' <td>' . ucfirst($grade_row) . '</td>';
                                        echo ' <td>' . ucfirst($grade->grade_value) . '</td>';
                                        echo ' <td>' . ucfirst("Normal Progress") . '</td>';
                                    }
                                    $sum_value = $sum_value + $grade->grade_value;
                                }
                            }
                            ?>
                        </tr>

                        <?php
                        $count++;
                    endforeach;

                endif;
                ?>

            </table>
            <hr style="border: 0.03em solid #5b5a5a">
            <div class="col-lg-12">
                <span style="font-weight: 600">
                    GPA: <?php
                    if (isset($marks)):
                        try {
                            if ($count != 0):
                                echo number_format((float) $sum_value / $count, 2, '.', '');
                            else:
                                echo '<span class="text-danger">No Results found</span>';
                            endif;
                        } catch (Exception $e) {
                            echo $e;
                        }
                    endif;
                    ?>
                </span>
            </div>
        </div>

    </div>
    <div class="clearfix"></div>

</div>




