<?php

require_once ("../mobile/connection.php");
require_once("MainClass.php");

$json = json_decode(file_get_contents('php://input'), true);

$con = db_connect(); //db connection
$source = $_POST["source"];

$mainClassObj = new MainClass();


switch ($source) {


    case 'news':
    $mainClassObj->get_news($con);
    break;

    case 'news':
    $category=$_POST["cat_id"];
    $mainClassObj->fetch_news($con,$category);
    break;

    case 'login'://from login page

        $username = $_POST["username"];
        $password = $_POST["password"];
        $mainClassObj->login($con, $username, $password);

        break;

    case 'results'://from results page
        $university_id=$_POST["university_id"];
        $student_reg=$_POST["student_regno"];
        $std_id = $_POST["student_id"];
        $mainClassObj->get_students_general_results($con,$std_id,$student_reg,$university_id);

        break;
    
    case 'students'://from results page
        $parent_id=$_POST["parent_id"];
        $mainClassObj->get_students($con,$parent_id);
        
        break;
    
    case 'payments':
        $university_id=$_POST["university_id"];
        $course_id=$_POST["course_id"];
        $std_id = $_POST["student_id"];
        $mainClassObj->get_payments($con,$std_id,$course_id,$university_id);

        break;
    
    case 'performance':
        $university_id=$_POST["university_id"];
        $student_reg=$_POST["student_regno"];
        $std_id = $_POST["student_id"];
        
        $mainClassObj->get_student_perfomance($con,$std_id,$student_reg,$university_id);
        break;
        case 'request_membership':
          $email=$_POST['email'];
          $phone_number=$_POST['phone_number'];
           $mainClassObj->request_membership($con,$email,$phone_number);
        break;
        case 'search_student':
           $student_reg=$_POST['student_reg'];
            $parent_id=$_POST['parent_id'];
             $mainClassObj->searchStudent($con,$student_reg,$parent_id);
        break;
        case 'parent_student':
            $student_id=$_POST['student_id'];
            $parent_id=$_POST['parent_id'];
            $res= $mainClassObj->add_parent_student($con,$student_id,$parent_id);
        break;
         case 'get_messages':
         $parent_id=$_POST["parent_id"];
            $mainClassObj->get_my_help_message($con,$parent_id);
        break;
        case 'parent_help':
         $parent_id=$_POST["parent_id"];
         $message=$_POST["message"];
         $mainClassObj->save_help_message($con,$parent_id,$message);
      break;
      case 'change_password':
           $email=$_POST['email'];
           $mainClassObj->change_password($con,$email);
      break;

    
    default:
        
        # code...
        break;
}
?>