<?php

include 'connection.php';
$con = db_connect();
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['student_id']) != null) {
    $student_id = $_POST["student_id"];
    $token = $_POST['token'];

    //check student token
    $check = mysqli_query($con, "select * from tokens where student_student_id='" . $student_id . "'");
    if (mysqli_num_rows($check) > 0) {
        //update the token
        $query = mysqli_query($con, "update tokens set token='" . $token . "' where student_student_id='" . $student_id . "'");
    } else {
        //insert new student token
        $query = mysqli_query($con, "insert into tokens(token,student_student_id) values('$token','$student_id')");
    }

//    $query = mysqli_query($con, $sql_string);
    mysqli_close($con);
    header("content-type:application/json");
    if ($query) {
        echo json_encode(array("success" => TRUE));
    } else {
        echo json_encode(array("success" => FALSE));
    }
}
?>

