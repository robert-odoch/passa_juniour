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
    $con = db_connect();
    $registerd_year_id = $_POST['registered_year_id'];
    $student_id = $_POST['student_id'];
    $semester_id = $_POST['semester_id'];
    $year_id = $_POST['year_id'];

    //first fetch student course
    $student = mysqli_query($con, "select courses_course_id  from student where student_id='" . $student_id . "'");
    $row = mysqli_fetch_assoc($student);

   // $sql_string = "select c.id,code,c.course_unit as unit from assigned_units au left join course_units c on(au.course_unit=c.id) where au.course_unit='" . $row['courses_course_id'] . "' && au.year_study='" . $year_id . "' && au.semeter='" . $semester_id . "' && au.course_unit NOT IN (select course_units_units_id from registered_course_units rc where registered_academic_years_id='" . $registerd_year_id . "' && student_student_id='" . $student_id . "')";

  $sql_string="select b.id,b.code,b.course_unit as `unit` from assigned_units a left join course_units b on(a.course_unit=b.id) where a.course='". $row['courses_course_id'] ."' && a.year_study='" . $year_id . "' && a.semeter='" . $semester_id . "' && a.course_unit NOT IN (select c.course_units_units_id from registered_course_units c where c.registered_academic_years_id='" . $registerd_year_id . "' && c.student_student_id='" . $student_id . "' and c.semester='".$semester_id."')";


    $query = mysqli_query($con, $sql_string) or die(mysqli_error($con));

    if (!$query)
        echo mysqli_error($con);

    if (mysqli_num_rows($query) > 0) {
        while ($row = mysqli_fetch_assoc($query)) {
            $data[] = $row;
        }
    }

    mysqli_close($con);
    return $data;
}

?>