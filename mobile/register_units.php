<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['student_id']) != null) {
    $student_id = $_POST["student_id"];
    $unit_id = $_POST['unit_id'];
    $year_id = $_POST['year_id'];
    $semester=$_POST['semester_id'];

    $sql_string = "INSERT INTO registered_course_units(course_units_units_id,student_student_id,registered_academic_years_id,semester)"
            . "values('$unit_id','$student_id','$year_id','$semester')";

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

