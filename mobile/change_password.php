<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['user_id']) != null) {
    if(isset($_POST['user_type'])){
    $user_id = $_POST["user_id"];
    $password = sha1($_POST["password"]);
    $email=$_POST['email'];
    $user_type=$_POST['user_type'];
    if($user_type=="isStudent"){
       $sql_string = "update student set password='$password',email='$email' where student_id='$user_id'";  
   }else{
     $sql_string = "update users set password='$password',email='$email' where user_id='$user_id'";
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
}else{
     header("content-type:application/json");
     echo json_encode(array("success" => false));
}
}
?>

