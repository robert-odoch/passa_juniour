<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);

$result = fetch_student_years();

$response = array();
header("content-type:application/json");
if ($result != null) {
    $response['data'] = $result;
    $response['success'] = TRUE;
} else {
    $response['success'] = FALSE;
}
echo json_encode($response);

function fetch_student_years() {
    $data = array();
    $con = db_connect();
    $student_reg = $_POST['student_reg'];
    $university_id = $_POST['university_id'];

    $sql_string = "SELECT marks.fn,course_units.course_unit,cw,ex FROM marks left join course_units on(marks.course_unit=course_units.id)  WHERE marks.reg_no='" . $student_reg . "'";
    $query = mysqli_query($con, $sql_string) or die(mysqli_error($con));

    //fetch student graduate level

    $result1 = mysqli_query($con, "select courses_course_id from student where registration_number='$student_reg'");

    $row1 = mysqli_fetch_assoc($result1);
    $result2 = mysqli_query($con, "select level from courses where course_id='" . $row1['courses_course_id'] . "'");
    $row2 = mysqli_fetch_assoc($result2);


    $grading = mysqli_query($con, "select * from grading where grading.university_id='" . $university_id . "' && level='" . $row2['level'] . "'");


    if (!$query)
        echo mysqli_error($con);

    if (mysqli_num_rows($query) > 0) {
        $array_grades = array();
        while ($grade = mysqli_fetch_assoc($grading)) {
            $array_grades[] = array("from" => $grade['value_frm'], "to" => $grade['value_to'], "grade" => $grade['grade'], "value" => $grade['grade_value'], "progress" => $grade['progress']);
        }

        $array_data = array();
        $data_row = array();
        while ($row = mysqli_fetch_assoc($query)) {
            $found = false;
            foreach ($array_grades as $grade) {
                if ($row['fn'] >= $grade["from"] && $row['fn'] <= $grade["to"]) {
                    $found = true;
                    if ($grade["progress"] == 1) {
                        $data_row[] = array(
                            "course_unit" => $row['course_unit'],
                            'mark' => $row['fn'],
                            'cw'=>$row['cw'],
                            'ex'=>$row['ex'],
                            "grade_value" => $grade["grade"],
                            "value" => $grade["value"],
                            "progress" => "Retake"
                        );
                    } else {
                        $data_row[] = array(
                            "course_unit" => $row['course_unit'],
                            'mark' => $row['fn'],
                            'cw'=>$row['cw'],
                            'ex'=>$row['ex'],
                            "grade_value" => $grade["grade"],
                            "value" => $grade["value"],
                            "progress" => "Normal Progress"
                        );
                    }
                }
            }
            if ($found == false) {
                $data_row[] = array(
                    "course_unit" => $row['course_unit'],
                    'mark' => "-",
                    'cw'=>'-',
                    'ex'=>'-',
                    "grade_value" => "-",
                    "value" => '0',
                    "progress" => "Missing Marks"
                );
            }
        }
        return $data_row;
    }
}

?>