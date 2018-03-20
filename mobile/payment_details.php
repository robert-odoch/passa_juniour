<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);

$result = fetch_student_years();
$response = array();
header("content-type:application/json");
if ($result != null) {
    $response['data'] = $result;
    $response['success'] = TRUE;
} else {
    $response['success'] = FALSE;
}
echo json_encode($response);

function fetch_student_years() {
    $data = array();
    $con = db_connect();
    $student_id = $_POST['student_id'];
    $semester_id = $_POST['semester_id'];
    $year_id = $_POST['year_id'];

    $sql_string = "select * from student_payments p where p.student_id='$student_id' && p.study_year='$year_id' && p.semester='$semester_id'";
    $query = mysqli_query($con, $sql_string);

    //fetch student course 
    $student = mysqli_query($con, "select courses_course_id from student where student_id='$student_id'") or die(mysqli_error($con));
    $row1 = mysqli_fetch_assoc($student);

    $tuition = mysqli_query($con, "select * from fees_structure f left join fees_categories c on(f.fees_category=c.cat_id) where  f.course_id='" . $row1['courses_course_id'] . "'");
    //$row2 = mysqli_fetch_assoc($tuition);

    $bal_qry=mysqli_query($con,"select amount from balances_temp where student=".$student_id);
    $balance=0;
    if($bal_qry){
        $row=mysqli_fetch_array($bal_qry);
        $balance=$row["amount"];
    }


    if (!$query)
        echo mysqli_error($con);
    $total = 0;
    if (mysqli_num_rows($query) > 0) {
        while ($row2 = mysqli_fetch_assoc($tuition)) {

            while ($row = mysqli_fetch_assoc($query)) {
                $array['payments_id'] = $row['payments_id'];
                $array['amount'] = $row['amount'];
                $array['recept_no'] = $row['recept_no'];
                $array['payment_date'] = $row['payment_date'];
                $array['balance']=$balance;
                
                // if ($semester_id == 1) {
                //     $twice = mysqli_query($con, "select (sum(amount)/2) as paid_twice from fees_structure f left join fees_categories c on(f.fees_category=c.cat_id) where  f.course_id='" . $row1['courses_course_id'] . "' && paid_times='twice'");
                //     $row5 = mysqli_fetch_assoc($twice);
                //     $others = mysqli_query($con, "select sum(amount)as total_others from fees_structure f left join fees_categories c on(f.fees_category=c.cat_id) where  f.course_id='" . $row1['courses_course_id'] . "' && paid_times !='twice'");
                //     $row6 = mysqli_fetch_assoc($others);
                //     $array['total_fees'] = $row5['paid_twice'] + $row6['total_others'];
                    
                // } else if ($semester_id == 2) {
                //     $twice = mysqli_query($con, "select (sum(amount)/2) as paid_twice from fees_structure f left join fees_categories c on(f.fees_category=c.cat_id) where  f.course_id='" . $row1['courses_course_id'] . "' && paid_times='twice'");
                //     $row5 = mysqli_fetch_assoc($twice);
                //     $others = mysqli_query($con, "select sum(amount)as total_others from fees_structure f left join fees_categories c on(f.fees_category=c.cat_id) where  f.course_id='" . $row1['courses_course_id'] . "' && paid_times !='twice' && paid_times !='Once'");
                //     $row6 = mysqli_fetch_assoc($others);
                //     $array['total_fees'] = $row5['paid_twice'] + $row6['total_others'];
                   
                // }

                $data[] = $array;
            }
        }
        $total += $row2['amount'];
    }



    mysqli_close($con);
    return $data;
}

?>