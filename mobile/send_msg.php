<?php

include 'connection.php';
include './libs/gcm.php';
$con = db_connect();
$json = json_decode(file_get_contents('php://input'), true);
header("content-type:application/json");
$gcm = new gcm();
if (isset($_POST['member_id']) != null) {
    $member_id = $_POST["member_id"];
    $room_id = $_POST["room_id"];
    $message = $_POST["message"];
    $time = date("Y-m-d H:i:s");
    $token_user = $_POST['token_user'];

    $name = $_POST["name"];
//    $group_name = $_POST['group_name'];

    $sql_string = "INSERT INTO chat_mgs(message,room_id,users_id,_when_sent)"
            . "values('$message','$room_id','$member_id','$time')";


    $query = mysqli_query($con, $sql_string);

    $res = array();
    //Creating an array containing message data
    $pushdata = array();
//    Adding title which would be the username
    $res['data']['title'] = $name;
    //Adding the message to be sent
    $res['data']['message'] = $message;
    //Adding user id to identify the user who sent the message
    $res['data']['id'] = $member_id;
    $res['data']['chat_room'] = "counsellor_chat";
    $res['data']['group_id'] = $room_id;
    $res['data']['group_name'] = getOtherMemberName($member_id, $room_id);
    $res['data']['member_id'] = getOtherMember_id($member_id, $room_id);
    if ($query) {
        $data = $gcm->sendMessage(getGroupTokens($member_id, $room_id), $res);
//        print_r($data);
        echo json_encode(array("success" => TRUE));
    } else {
        echo json_encode(array("success" => FALSE));
    }
} else {
    
}

function getOtherMember_id($member_id, $room_id) {
    $con = db_connect();
    $result = mysqli_query($con, "select * from chat_memebers m left join chat_users c on(m.member_id=c.chat_user_id) where m.member_id !='$member_id' && m.chatroom_id='$room_id'");
    $row = mysqli_fetch_assoc($result);
    return $row['member_id'];
}

function getOtherMemberName($member_id, $room_id) {
    $con = db_connect();
    $result = mysqli_query($con, "select * from chat_memebers m left join chat_users c on(m.member_id=c.chat_user_id) where m.member_id !='$member_id' && m.chatroom_id='$room_id'");
    $row = mysqli_fetch_assoc($result);
    return $row['full_name'];
}

function getGroupTokens($member_id, $room_id) {
    $con = db_connect();
    $result = mysqli_query($con, "SELECT token FROM chat_users s left join chat_memebers g on(s.chat_user_id=g.member_id) WHERE g.member_id !='$member_id' && g.chatroom_id='$room_id'");

    $tokens = array();
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($tokens, $row['token']);
    }
    return $tokens;
}
?>

