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
    $academic_year = $_POST['academic_year'];
    
    $sql_string = "SELECT DISTINCT(s.semester_id),s.semester from marks m left JOIN semesters s on(m.semester=s.semester_id) "
            . "where m.reg_no='".$student_reg."' && m.study_year='".$academic_year."'";
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