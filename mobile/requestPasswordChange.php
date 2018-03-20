<?php

include 'connection.php';
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

if (isset($_POST['email']) && isset($_POST['reg_no'])) {
//check valid email
    $con = db_connect();
    $email = $_POST['email'];
    $reg_no = $_POST['reg_no'];

    $query = mysqli_query($con, "select student_id,email from  student where email='" . mysqli_real_escape_string($con, $email) . "' and registration_number='" . mysqli_real_escape_string($con, $reg_no) . "'");

    if (mysqli_num_rows($query)) {
        //update password to default
        $row = mysqli_fetch_assoc($query) or die(mysqli_error($con));
        mysqli_query($con, "update student set password='" . sha1("123456") . "' where student_id='" . $row['student_id'] . "'");

        echo json_encode(array('status' => true, 'message' => "Congrats your password has been set back to default(123456)"));
    } else {
        echo json_encode(array('status' => false, 'message' => "Opps this student does not exist"));
    }
} else {
    echo json_encode(array('status' => false, 'message' => "Please fill the empty fields"));
}
 





