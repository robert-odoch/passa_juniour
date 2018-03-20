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
    $student = mysqli_query($con, "select courses_course_id from student where student_id='".$student_id."'") or die(mysqli_error($con));
    $row1 = mysqli_fetch_assoc($student);

  $sql="select * from fees_structure a left join fees_categories b on(a.fees_category=b.cat_id) where  a.status='0' and `course_id`='".$row1['courses_course_id']."'";

    $query = mysqli_query($con,$sql) or die(mysqli_error($con));
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