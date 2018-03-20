<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);

header("content-type:application/json");
$con = db_connect();
$student_id = $_POST['student_id'];
$group_id = $_POST['group_id'];
$sql_string = "SELECT group_message_id,message,m.student_student_id,name,m._when_added as time_stamp FROM group_messages m inner join  student s on(m.student_student_id = s.student_id)inner join chatgroups g  on( m.group_group_id=g.group_id) inner join group_members gm on(g.group_id=gm.group_group_id)"
        . " where gm.student_student_id='" . $student_id . "' and m.group_group_id='" . $group_id . "'  ORDER BY group_message_id ASC";
$query = mysqli_query($con, $sql_string);
if (!$query)
    echo mysqli_error($con);
$response = array();
if (mysqli_num_rows($query) > 0) {
    $response['messages'] = array();
    $response['success'] = TRUE;
    while ($row = mysqli_fetch_assoc($query)) {
        $temp['id'] = $row['group_message_id'];
        $temp['message'] = $row['message'];
        $temp['userid'] = $row['student_student_id'];
        $temp['sentat'] = $row['time_stamp'];
        $temp['name'] = $row['name'];
        array_push($response['messages'], $temp);
    }
} else {
    $response['success'] = FALSE;
}
mysqli_close($con);
echo json_encode($response);
?>