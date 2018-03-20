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
    $student_id = $_POST['student_id'];
    $student = mysqli_query($con, "select courses_course_id from student where student_id='" . $student_id . "'");
    $row = mysqli_fetch_assoc($student);


    $sql_string = "select c_unit.id, c_unit.code,c_unit.course_unit from assigned_units au
                    LEFT JOIN course_units c_unit ON (c_unit.id=au.course_unit)
                    where au.course='" . $row['courses_course_id'] . "'";

    $query = mysqli_query($con, $sql_string);

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