<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);

$result = fetch_details();
$response = array();
header("content-type:application/json");
if ($result != null) {
    $response['members'] = $result;
    $response['success'] = TRUE;
} else {
    $response['success'] = FALSE;
}
echo json_encode($response);

function fetch_details() {
    $data = array();
    $con = db_connect();
    $student_id = $_POST['student_id'];
    $group_id = $_POST['group_id'];
    $sql_string = "select member_id,name from group_members m left join student s on(m.student_student_id=s.student_id)where group_group_id='" . $group_id . "' && not student_student_id='" . $student_id . "'";
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