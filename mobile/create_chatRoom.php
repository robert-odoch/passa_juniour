<?php

include 'connection.php';
$con = db_connect();
if (isset($_POST['student_id']) != null) {
    $student_id = $_POST["student_id"];
    $student_name = $_POST['student_name'];
    $user_id = $_POST["user_id"];
    $staff_name = $_POST['counsellor_name'];
    $token = $_POST['token'];


    $time = date("Y-m-d H:i:s");

    //first check if the student/user already exist

    $check_student = mysqli_query($con, "select * from chat_users where user_type='student' && user_id='$student_id'");

    if (mysqli_num_rows($check_student) > 0) {
        //student already exists  
    } else {
        //insert student
        mysqli_query($con, "insert into chat_users(user_id,user_type,full_name) values('$student_id','student','$student_name')");
    }
    $check_staff = mysqli_query($con, "select * from chat_users where user_type='staff' && user_id='$user_id'");

    if (mysqli_num_rows($check_staff) > 0) {
        //staff already exists  
    } else {
        //insert student
        mysqli_query($con, "insert into chat_users(user_id,user_type,full_name) values('$user_id','staff','$staff_name')");
    }

    //now create chat room
    mysqli_query($con, "insert into chatroom(_when_created)values('$time')");
    $last_id = mysqli_insert_id($con);

    //student
    $student_result = mysqli_query($con, "select * from chat_users where user_type='student' && user_id='$student_id'");
    $student = mysqli_fetch_assoc($student_result);

    //staff
    $staff_result = mysqli_query($con, "select * from chat_users where user_type='staff' && user_id='$user_id'");
    $staff = mysqli_fetch_assoc($staff_result);

    //insert chat room members

    mysqli_query($con, "insert into chat_memebers(member_id,chatroom_id,_when_added) values('" . $student['chat_user_id'] . "','$last_id','$time')");
    mysqli_query($con, "insert into chat_memebers(member_id,chatroom_id,_when_added) values('" . $staff['chat_user_id'] . "','$last_id','$time')");

    //update staff device token
    mysqli_query($con, "update chat_users set token='$token' where user_id='$student_id' && user_type='student' ");

    echo json_encode(array(
        "success" => TRUE,
        'user_id' => $student['chat_user_id'],
        'chatroom' => $last_id
            )
    );
}
?>

