<?php

include 'connection.php';
$response = array();
$response['success'] = FALSE;

if (isset($_POST['reg_no']) && isset($_POST['password'])) {
    $con = db_connect();
    $reg_no = $_POST['reg_no'];
    $password = $_POST['password'];
    $time = date("Y-m-d H:i:s");
    $string = "SELECT * FROM student WHERE registration_number='" . $reg_no . "' and password='" . sha1($password) . "' && status=0";
    $query = mysqli_query($con, $string);

    //staff login
    // $string_staff = "SELECT * FROM counsellors c left join users u on(c.user_id=u.user_id) where u.email='" . $reg_no . "' && password='" . sha1($password) . "' ";
 
    $string_staff = "SELECT * FROM user_position up left join users u on(up.user=u.user_id) where u.email='" . $reg_no . "' && password='" . sha1($password) . "' && up.pos_name=4 ";//4 is for consellors
    
    $query_staff = mysqli_query($con, $string_staff);

    //login invigiltors

    $sql_query="select b.* from exam_invigilator a left join users b on(a.name=b.user_id) where b.email='".$reg_no."' and password='".sha1($password)."'";
   $invigiltor= mysqli_query($con,$sql_query) or die(mysqli_error($con));

   //other staff members

    $other_query="select * from users b  where b.email='".$reg_no."' and password='".sha1($password)."'";
   $other_staff= mysqli_query($con,$other_query) or die(mysqli_error($con));


    if (mysqli_num_rows($query) > 0) {
        $response['data'] = array();
        $response['success'] = TRUE;
        while ($row = mysqli_fetch_assoc($query)) {
            mysqli_query($con, "update student set logged_in='$time' where student_id='" . $row['student_id'] . "'");
            $data['student_id'] = $row['student_id'];
            $data['name'] = $row['name'];
            $data['password'] = $password;
            $data['email']=$row['email'];
            $data['photo'] = $row['photo'];
            $data['isStudent'] = true;
            $data['other_staff']=false;
            $data['registration_number'] = $row['registration_number'];
            $data['university_id'] = $row['universities_university_id'];
            //get university name
            $university_query = mysqli_query($con, "select * from universities where university_id='" . $row['universities_university_id'] . "'");
            $row2 = mysqli_fetch_assoc($university_query);
            $data['university_name'] = $row2['short_name'];
            array_push($response['data'], $data);
        }
    } else if (mysqli_num_rows($query_staff) > 0) {
        $response['data'] = array();
        $response['success'] = TRUE;
        while ($row = mysqli_fetch_assoc($query_staff)) {
            $data['name'] = $row['name'];
             $data['email']=$row['email'];
            $data['user_id'] = $row['user_id'];
            $data['photo'] = $row['photo'];
            $data['isStudent'] = false;
            $data['isInvigilator']=false;
            $data['other_staff']=false;
            $data['university_id'] = $row['university_id'];
            //get university
            $university_query = mysqli_query($con, "select * from universities where university_id='" . $row['university_id'] . "'");
            $row2 = mysqli_fetch_assoc($university_query);
            $data['university_name'] = $row2['short_name'];
            array_push($response['data'], $data);
        }
    } else if(mysqli_num_rows($invigiltor) > 0){
         $response['data'] = array();
        $response['success'] = TRUE;
        while ($row = mysqli_fetch_assoc($invigiltor)) {
            $data['name'] = $row['name'];
            $data['user_id'] = $row['user_id'];
            $data['photo'] = $row['photo'];
             $data['email']=$row['email'];
            $data['isInvigilator'] = true;
              $data['isStudent'] = false;
              $data['other_staff']=false;
            $data['university_id'] = $row['university_id'];
            //get university
            $university_query = mysqli_query($con, "select * from universities where university_id='" . $row['university_id'] . "'");
            $row2 = mysqli_fetch_assoc($university_query);
            $data['university_name'] = $row2['short_name'];
            array_push($response['data'], $data);
    }
}else if(mysqli_num_rows($other_staff)){
         $response['data'] = array();
        $response['success'] = TRUE;
        while ($row = mysqli_fetch_assoc($other_staff)) {
            $data['name'] = $row['name'];
            $data['user_id'] = $row['user_id'];
            $data['photo'] = $row['photo'];
             $data['email']=$row['email'];
            $data['isInvigilator'] = false;
              $data['isStudent'] = false;
              $data['other_staff']=true;
            $data['university_id'] = $row['university_id'];
            //get university
            $university_query = mysqli_query($con, "select * from universities where university_id='" . $row['university_id'] . "'");
            $row2 = mysqli_fetch_assoc($university_query);
            $data['university_name'] = $row2['short_name'];
            array_push($response['data'], $data);

    }
}
     else {
        $response['message'] = "wrong registration Number or password";
        $response['success'] = FALSE;
    }
} else {
    $response['message'] = "Please fill the emapy fields";
    $response['success'] = FALSE;
}
echo json_encode($response);
?>
