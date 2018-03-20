<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);

$result = fetch_details();
$response = array();
header("content-type:application/json");
if ($result != null) {
    $response['data'] = $result;
    $response['success'] = TRUE;
} else {
    $response['success'] = FALSE;
}
echo json_encode($response);

function fetch_details() {
    $data = array();
    // $data_row = array();
    $all_records = array();
    $con = db_connect();
    $student_reg =$_POST['student_reg'];
    $university_id =$_POST['university_id'];
    $student_id = $_POST['student_id'];
    



//fetch registered study years
    $registered_years = mysqli_query($con, "select r.year_study,r.semester_semester_id from registered_academic_years r where r.student_student_id='$student_id'") or die(mysqli_error($con));
    $data_years = array();
    while ($row4 = mysqli_fetch_assoc($registered_years)) {
        $data_years[] = array('year_id' => $row4['year_study'], 'semester_id' => $row4['semester_semester_id']);
    }

    //$all_records=array(); //mine

    foreach ($data_years as $year):
        $sql_string = "SELECT fn as mark,marks.course_unit,s.semester,y.year FROM marks left join semesters s  on(marks.semester=s.semester_id) left join study_year y on(marks.study_year=y.year_id) WHERE marks.reg_no='" . $student_reg . "'"
                . " && marks.semester='" . $year['semester_id'] . "' && marks.study_year='" . $year['year_id'] . "'";
        $query = mysqli_query($con, $sql_string) or die(mysqli_error($con));

        $temp_semester = array();
//        //semester name
//        $semester_query = mysqli_query($con, "select semester from semesters where semester_id='" . $year['semester_id'] . "'");
//        $row_sem = mysqli_fetch_assoc($semester_query);
//        //year name
//        $year_query = mysqli_query($con, "select year from study_year where year_id='" . $year['year_id'] . "'");
//        $row_year = mysqli_fetch_assoc($year_query);

        $temp_semester["period"] = "Yr: " . $year['year_id'] . " Sem: " . $year['semester_id'];
        //fetch student graduate level

        $result1 = mysqli_query($con, "select courses_course_id from student where student_id='$student_id'") or die(mysqli_error($con));

        $row1 = mysqli_fetch_assoc($result1);
        $result2 = mysqli_query($con, "select level from courses where course_id='" . $row1['courses_course_id'] . "'") or die(mysqli_error($con));
        $row2 = mysqli_fetch_assoc($result2);


        $grading = mysqli_query($con, "select * from grading where grading.university_id='" . $university_id . "' && level='" . $row2['level'] . "'") or die(mysqli_error($con));


        if (!$query)
            echo mysqli_error($con);

        if (mysqli_num_rows($query) > 0) {
            $array_grades = array();

            while ($grade = mysqli_fetch_assoc($grading)) {
                $array_grades[] = array("from" => $grade['value_frm'], "to" => $grade['value_to'], "grade" => $grade['grade'], "value" => $grade['grade_value'], "progress" => $grade['progress']) or die(mysqli_error($con));
            }
            $temp_sem_marks = array();
            $marks = array();
            $units_count = 0;
            while ($row = mysqli_fetch_assoc($query)) {
                $found = false;
                foreach ($array_grades as $grade) {
                    if ($row['mark'] >= $grade["from"] && $row['mark'] <= $grade["to"]) {
                        $found = true;
                        $marks[] = $grade["value"];
                        $temp_sem_marks[] = $grade["value"];
                        $units_count++;
                    }
                }
                if ($found == false) {
                    $units_count++;
                }
            }

//            $temp_semester["marks"] = $marks;
            $temp_semester["total_grade"] = avg_grade($temp_sem_marks, $units_count);

            $all_records[] = $temp_semester;
        }
    endforeach;
    // return $data_row;
    return $all_records;
}

function avg_grade($array, $units_count) {
    $sum = 0;
    foreach ($array as $key) :

        $sum += $key;
    endforeach;
    return $sum/$units_count;
}

?>