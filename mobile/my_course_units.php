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
    $student_id = $_POST['student_id'];
    $registered_year_id = $_POST['registered_year_id'];

    // $sql_string = "select code,course_unit as unit,rc._status from registered_course_units rc 
    //     left join course_units c ON(rc.course_units_units_id=c.id) 
    //     where student_student_id='".$student_id."' && registered_academic_years_id='".$registered_year_id."' && c.code is not null";
$sql_string="SELECT a.code,a.course_unit as unit,b._status from course_units a left join registered_course_units b on(a.id=b.course_units_units_id) where b.student_student_id='$student_id' and b.registered_academic_years_id='$registered_year_id'";

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