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
    $row2 = mysqli_query($con, "select courses_course_id as course_id from student where student_id='$student_id'");
    $res = mysqli_fetch_assoc($row2);
    $sql_string = "select DISTINCT(f.study_year),s.year from fees_structure f  left join study_year s on(f.study_year=s.year_id) where f.course_id='" . $res['course_id'] . "' order by s.year_id asc";
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