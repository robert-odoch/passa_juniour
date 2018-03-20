<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['student_id']) != null) {
    $student_id = $_POST["student_id"];
    $suggestion = $_POST["suggestion"];
    $university_id = $_POST["university_id"];
    $time = date("Y-m-d H:i:s");
    $sql_string = "insert into suggestion_box(suggestion,student_student_id,university_university_id,sent_time)"
            . "values('$suggestion','$student_id','$university_id','$time')";

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

