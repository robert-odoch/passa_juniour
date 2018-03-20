<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);

header("content-type:application/json");
$con = db_connect();
$member_id = $_POST['member_id'];
$room_id = $_POST['room_id'];
$sql_string = "SELECT ms.message_id,ms.message,ms._when_sent,ms.users_id,u.full_name from chat_mgs ms left join chat_users u on(ms.users_id=u.chat_user_id) LEFT join chatroom c on(ms.room_id=c.room_id) left JOIN chat_memebers m on(c.room_id=m.chatroom_id) where m.member_id='$member_id' && ms.room_id='$room_id' order by ms.message_id asc";
$query = mysqli_query($con, $sql_string);
if (!$query)
    echo mysqli_error($con);
$response = array();
$response['messages'] = array();
if (mysqli_num_rows($query) > 0) {
    $response['success'] = TRUE;
    while ($row = mysqli_fetch_assoc($query)) {
        $temp['id'] = $row['message_id'];
        $temp['message'] = $row['message'];
        $temp['userid'] = $row['users_id'];
        $temp['sentat'] = $row['_when_sent'];
        $temp['name'] = $row['full_name'];
        array_push($response['messages'], $temp);
    }
} else {
    $response['success'] = FALSE;
}
mysqli_close($con);
echo json_encode($response);
?>