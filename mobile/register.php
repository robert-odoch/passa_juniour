<?php

include 'connection.php';
$con = db_connect();
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['student_id']) != null) {
    $student_id = $_POST["student_id"];
    // $year = $_POST["year"];
    $semester = $_POST["semester"];
    $time = date("Y-m-d H:i:s");
    $study_year=$_POST['study_year'];
    $university_id = $_POST['university_id'];
    //first check if the university registration status
    //first check if already registered
    $check = mysqli_query($con, "select * from registered_academic_years where student_student_id='" . $student_id . "' && semester_semester_id='" . $semester . "' && year_study='$study_year'");
    if (mysqli_num_rows($check) > 0) {
        echo json_encode(array("success" => FALSE, "message" => "Your Already registered!!"));
    } else {
        $sql_string = "INSERT INTO registered_academic_years(student_student_id,year_study,semester_semester_id,_when_added) "
                . "values('$student_id','$study_year','$semester','$time')";
        $query = mysqli_query($con, $sql_string);
          $lastinsert=mysqli_insert_id($con);
        echo json_encode(array("success" => TRUE,"registered_year_id"=>$lastinsert, "message" => "Study year and semester submitted successfully"));
    }
}
?>

