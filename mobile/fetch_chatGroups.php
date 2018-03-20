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
    $university_id = $_POST['university_id'];
    $sql_string = "select DISTINCT(g.group_id),g.group_name from chatgroups g left join group_members m on(g.group_id=m.group_group_id) where university_id='" . $university_id . "' && open='1' && student_student_id not in(select m.student_student_id from chatgroups g left join group_members m on(g.group_id=m.group_group_id) where student_student_id='" . $student_id . "')";
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