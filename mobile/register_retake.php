<?php

include 'connection.php';
$con = db_connect();
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['student_id']) != null) {
    $student_id = $_POST["student_id"];
    $unit_id = $_POST['unit_id'];
    $semester_id = $_POST['semester'];
    $study_year=$_POST['study_year'];



    $sql = mysqli_query($con, "select registered_academic_years_id as id from registered_academic_years where  student_student_id='" . $student_id . "' and year_study='".$study_year."' and semester_semester_id='".$semester_id."'");
    $row = mysqli_fetch_assoc($sql);
    $last_insert=array();

  $time=date('Y-m-d');
     if(count($row['id'])==0){
    $sql_insert = mysqli_query($con,"INSERT INTO registered_academic_years(student_student_id,year_study,semester_semester_id,_when_added) "
                . "values('$student_id','$study_year','$semester_id','$time')");
    $insert_id=mysqli_insert_id($con); 
    $last_insert[]=$insert_id;

     }else{
         $last_insert[]=$row['id'];
     }

  foreach ($last_insert as $key) {
      $sql_string = "INSERT INTO registered_course_units(course_units_units_id,student_student_id,registered_academic_years_id,_status)"
            . "values('$unit_id','$student_id','".$key."','1')";
    $query = mysqli_query($con, $sql_string) or die(mysqli_error($con));
  } 
    mysqli_close($con);
    header("content-type:application/json");
    if ($query) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => FALSE));
    }
}
?>

