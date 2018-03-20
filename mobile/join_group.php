<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['student_id']) != null) {
    $student_id = $_POST["student_id"];
    $group_id = $_POST["group_id"];
    $time = date("Y-m-d H:i:s");

    $sql_string = "INSERT INTO group_members(role,student_student_id,group_group_id,_when_added)"
            . "values('user','$student_id','$group_id','$time')";

    $con = db_connect();
    $query = mysqli_query($con, $sql_string);
    mysqli_close($con);
    header("content-type:application/json");
    if ($query) {
        echo json_encode(array("success" => TRUE));
    } else {
        echo json_encode(array("success" => FALSE));
    }
}
?>

