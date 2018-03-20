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

    $sql_string = "select suggestion_box_id as id,suggestion,sent_time as time_stamp from suggestion_box where 	student_student_id='" . $student_id . "' order by suggestion_box_id desc";
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