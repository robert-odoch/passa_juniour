<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['user_id']) != null) {
    $userType = $_POST["userType"];
    $user_id = $_POST["user_id"];
    $image_name = $_POST["image_name"];
    if ($userType == "student") {
        $sql_string = "update student set photo='$image_name' where student_id='$user_id'";
    } else {
        $sql_string = "update users set photo='$image_name' where user_id='$user_id'";
    }
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

