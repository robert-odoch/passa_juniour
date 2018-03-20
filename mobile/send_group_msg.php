<?php

include 'connection.php';
include './libs/gcm.php';
$con = db_connect();
$json = json_decode(file_get_contents('php://input'), true);
header("content-type:application/json");
$gcm = new gcm();
if (isset($_POST['student_id']) != null) {
    $student_id = $_POST["student_id"];
    $group_id = $_POST["group_id"];
    $message = $_POST["message"];
    $time = date("Y-m-d H:i:s");

    $name = $_POST["name"];
    $group_name = $_POST['group_name'];

    $sql_string = "INSERT INTO group_messages(message,group_group_id,student_student_id,_when_added)"
            . "values('$message','$group_id','$student_id','$time')";


    $query = mysqli_query($con, $sql_string);

    $res = array();
    //Creating an array containing message data
//    $pushdata = array();
    //Adding title which would be the username
    $res['data']['title'] = $name;
    //Adding the message to be sent
    $res['data']['message'] = $message;
    //Adding user id to identify the user who sent the message
    $res['data']['id'] = $student_id;
    $res['data']['chat_room'] = "group_chat";
    $res['data']['group_id'] = $group_id;
    $res['data']['group_name'] = $group_name;
    $res['data']['member_id']="";
    if ($query) {
        $data = $gcm->sendMessage(getGroupTokens($student_id, $group_id), $res);
        print_r($data);
      //  echo json_encode(array("success" => TRUE));
    } else {
       // echo json_encode(array("success" => FALSE));
    }
}

function getGroupTokens($student_id, $group_id) {
    $con = db_connect();
    $result = mysqli_query($con, "SELECT token FROM tokens t left join student s on(t.student_student_id=s.student_id)"
            . " left join group_members g on(s.student_id=g.student_student_id) WHERE NOT t.student_student_id ='" . $student_id . "' && group_group_id='" . $group_id . "'");

    $tokens = array();
    while ($row = mysqli_fetch_assoc($result)) {
        array_push($tokens, $row['token']);
    }
    return $tokens;
}
?>

