<?php

include 'connection.php';
    $con = db_connect();
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['student_id']) != null) {
    $student_id = $_POST["student_id"];
    $year = $_POST["year"];
    $semester = $_POST["semester"];
    $description = $_POST['description'];
    $university_id=$_POST["university_id"];
    $target=$_POST['target'];
    $type=$_POST['type'];

    $time = date("Y-m-d H:i:s");


    $insert_general="INSERT INTO general_complaints(message,_who_added,_status,_when_added, university_id,study_year,semester) 
    values ('$description','$student_id','0','$time','$university_id','$year','$semester') ";

$query = mysqli_query($con, $insert_general) or die(mysqli_error($con));;
  $last_insert= mysqli_insert_id($con); 

$forward_inst=mysqli_query($con,"INSERT INTO complaint_receiver(complaint,target,message_type)values ('$last_insert','$target','forward') ") or die(mysqli_error($con));

   echo json_encode(array("success" => TRUE));
}
?>

