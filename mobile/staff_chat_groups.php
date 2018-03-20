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
    $token = $_POST['token'];
    $photo = $_POST['photo'];
    $sql = "select c.room_id,u.chat_user_id from chatroom c left JOIN chat_memebers m on(c.room_id=m.chatroom_id) left join chat_users u on(m.member_id=u.chat_user_id) where u.user_id='$staff_id' && u.user_type='staff'";
    $query = mysqli_query($con, $sql);

    if (!$query)
        echo mysqli_error($con);

    if (mysqli_num_rows($query) > 0) {
        while ($row = mysqli_fetch_assoc($query)) {
            $result = mysqli_query($con, "SELECT * from chat_mgs m left join chat_memebers gm on(m.users_id=gm.member_id) left join chat_users u on(gm.member_id=u.chat_user_id) where m.room_id='" . $row['room_id'] . "' && m.users_id !='" . $row['chat_user_id'] . "' order by m.message_id desc LIMIT 1");
            while ($row2 = mysqli_fetch_assoc($result)) {
                $data[] = array(
                    'room_id' => $row2['room_id'],
                    'message' => $row2['message'],
                    'full_name' => $row2['full_name'],
                    '_when_sent' => $row2['_when_sent'],
                    'chat_user_id' => $row['chat_user_id'],
                    'photo'=>$row2['photo']
                );
            }
        }
        $time = date("Y-m-d H:i:s");
        //update staff device token
        mysqli_query($con, "update chat_users set token='$token',photo='$photo' where user_id='$staff_id' && user_type='staff' ");
        mysqli_query($con, "update users set last_login='$time' where user_id='$staff_id'");
    }

    mysqli_close($con);
    return $data;
}

?>