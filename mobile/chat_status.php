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
    $staff_id = $_POST['staff_id'];
    $student_id = $_POST['student_id'];

    $sql_string = "SELECT c.room_id from chatroom c left join chat_memebers m on(c.room_id=m.chatroom_id) LEFT join  chat_users u on(m.member_id=u.chat_user_id) where u.user_id='" . $staff_id . "' && u.user_type='staff'";
    $staff_query = mysqli_query($con, $sql_string);

    if (!$staff_query)
        echo mysqli_error($con);

    if (mysqli_num_rows($staff_query) > 0) {
        while ($row = mysqli_fetch_assoc($staff_query)) {
            $sql_query = "select * from chat_memebers m left join chat_users u on(m.member_id=u.chat_user_id) where m.chatroom_id='" . $row["room_id"] . "' && u.user_id='$student_id' && u.user_type='student'";
            $student = mysqli_query($con, $sql_query);
            $student_row = mysqli_fetch_assoc($student);
            if (mysqli_num_rows($student) > 0) {
                $array['member_id'] = $student_row['member_id'];
                $array['chatroom_id'] = $student_row['chatroom_id'];
                $array['chat_status'] = TRUE;
                $data[] = $array;
            } else {
                
            }
        }
    }
    mysqli_close($con);
    return $data;
}

?>