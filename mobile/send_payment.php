<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['student_id']) != null) {
    $con = db_connect();
    $student_id = $_POST["student_id"];
    $semester = $_POST["semester"];
    $study_year = $_POST["study_year"];
    $receipt_number = $_POST["receipt_number"];
    $amount_paid = $_POST["amount_paid"];
    $payment_date = $_POST["payment_date"];
    $time = date("Y-m-d H:i:s");
    $row = mysqli_query($con, "select intake_intake_id from student where student_id='$student_id'");
    $row2 = mysqli_fetch_assoc($row);

    $sql_string = "insert into student_payments(amount,recept_no,student_id,intake_id,study_year,semester,payment_date,sent_date)"
            . "values('$amount_paid','$receipt_number','$student_id','" . $row2['intake_intake_id'] . "','$study_year','$semester','$payment_date','$time')";

    $query = mysqli_query($con, $sql_string);
    mysqli_close($con);
    header("content-type:application/json");
    if ($query) {
        echo json_encode(array("success" => TRUE, 'message' => 'Payment sent Successfully'));
    } else {
        echo json_encode(array("success" => FALSE, 'message' => 'Error has occuried please try again!!'));
    }
}
?>

