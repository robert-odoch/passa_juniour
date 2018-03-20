<?php

include 'connection.php';
    $con = db_connect();
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['student_id']) != null) {
    $student_id = $_POST["student_id"];
    $year = $_POST["year"];
    $semester = $_POST["semester"];
    $description = $_POST['description'];
    $courseUnit = $_POST['course_unit'];
    $lecture_name = $_POST['lecture_name'];
    $document = $_POST['document'];
    $university_id=$_POST["university_id"];
    $target=$_POST['target'];
    $type=$_POST['type'];

    $time = date("Y-m-d H:i:s");
    // $sql_string = "INSERT INTO complaints(complaint,attachment,student_student_id,type_id,_when_added,year_id,semester_id,lecture,course_unit_id) "
    //         . "values('$description','$document','$student_id','$complaint_category','$time','$year','$semester','$lecture_name','$courseUnit')";

    $insert_general="INSERT INTO general_complaints 
            (message,attachment,_who_added,_status,_when_added, university_id,study_year,semester) 
    values ('$description','$document','$student_id','1','$time','$university_id','$year','$semester') ";
    $query = mysqli_query($con, $insert_general) or die(mysqli_error($con));;
  $last_insert= mysqli_insert_id($con); 

    if($query){
        if($type==1){
     $sql=mysqli_query($con,"INSERT INTO complaints_details(complaint_id,lecture,course_unit_id) 
    values ('$last_insert','$lecture_name','$courseUnit') ") or die(mysqli_error($con));
      }
       $forward_inst=mysqli_query($con,"INSERT INTO complaint_receiver(complaint,target,message_type) 
    values ('$last_insert','$target','forward') ") or die(mysqli_error($con));
        //forward 
    //$target=(($complaint_category==0)?1:3);//1 for registra 3  for accountant
   
    } 
    
    
   echo json_encode(array("success" => TRUE));
}
?>

