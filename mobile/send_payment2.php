<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);
if (isset($_POST['student_id']) != null) {
    $con = db_connect();
    $std_id = $_POST["student_id"];
    $semester = $_POST["semester"];
    $study_year = $_POST["study_year"];
    $receipt_number = $_POST["receipt_number"];
    $amount_paid = $_POST["amount_paid"];
    $payment_date = $_POST["payment_date"];

    $time = date("Y-m-d H:i:s");
    
    $previous_bal=get_balance($std_id);
    
    $fees_structure=get_fees_structure($std_id);//

    $to_be_paid=calculate_fees($fees_structure,$semester);//get inital amount to be paid

    if($previous_bal==-1){
        $new_bal=$to_be_paid-$amount_paid;
    }else{
        //if semester has already been paid for
        if(check_yr_sem_payment_status($std_id,$study_year,$semester)){
            $new_bal=$previous_bal-$amount_paid;//if its a semester you have already paind for
            
        }else{
            //get amount for this semester i.e to be paid
            $new_bal=$to_be_paid+$previous_bal-$amount_paid;
        }
        
    }

    
    //insert payment and update payment
    insert_payment_value($amount_paid,$receipt_number,$std_id,$study_year,$semester,$payment_date,$time);

    header("content-type:application/json");
    
    if(update_balance($new_bal,$std_id,$previous_bal)){
         echo json_encode(array("success" => TRUE, 'message' => 'Payment sent Successfully'));
    }else{
       echo json_encode(array("success" => FALSE, 'message' => 'Error has occuried please try again!!')); 
    }


}else{
     echo json_encode(array("success" => FALSE, 'message' => 'needed values not submitted')); 
}


function check_yr_sem_payment_status($std_id,$study_year,$sem){
    $con=db_connect();
    $sql_string="SELECT * FROM student_payments WHERE student_id='$std_id' AND study_year='$study_year' AND     semester='$sem' ";
    $query=mysqli_query($con,$sql_string);
    if($query && mysqli_num_rows($query)>0){
        return true;
    }else{
        return false;
    }
}


function insert_payment_value($amount,$recept_no,$student_id,$study_year,$semester,     $payment_date,$sent_date){
    
    $con=db_connect();

    $string="INSERT INTO student_payments (amount,recept_no,student_id,study_year,semester,     payment_date,sent_date) 
            VALUES ('$amount','$recept_no','$student_id','$study_year','$semester', '$payment_date','$sent_date') ";

    $query=mysqli_query($con,$string);
    if(!$query){
        echo mysqli_error($con);
        mysqli_close($con);
        return false;       
    }else{
        mysqli_close($con);
        return true;
    }

}


//calculates the amount the person is supossed to pay per semester
function calculate_fees($structure_array,$sem){
        $total=0;
        foreach ($structure_array as $fees_item):
            $times=$fees_item["paid_times"];
            $amount=$fees_item["amount"];
            
            switch ($times):
                case "Per Semester":
                     $total+=$amount;
                    break;
                case "Per Year":
                    if($sem==1){
                       $total+=$amount;
                    }
                    break;
            
                default:
                    break;
            endswitch;
                
        endforeach;
        
        return  $total;
        
    }

function get_fees_structure($std_id){
    $con=db_connect();

    $get_univ=mysqli_query($con,"SELECT universities_university_id,courses_course_id FROM student WHERE student_id=".$std_id);
    $course_id=0;
    $university_id=0;
    
    if($get_univ){
        $row=mysqli_fetch_array($get_univ);
        $course_id=$row["courses_course_id"];
        $university_id=$row["universities_university_id"];
    }

    $string="SELECT fc.name,fs.`amount`,fc.paid_times FROM `fees_structure` fs  
             LEFT JOIN fees_categories fc ON fs.`fees_category`=fc.cat_id
             WHERE fs.`course_id`='$course_id' AND fc.university_id='$university_id' ";
    $query=mysqli_query($con,$string);
    $struct_array=array();
    if($query){
        if(mysqli_num_rows($query)>0){
            while($row=mysqli_fetch_array($query)){
                $struct_array[]=$row;
            }
        }
    }
    mysqli_close($con);
    return $struct_array;
}


function get_balance($std_id){
    $con = db_connect();
    $sql_string="SELECT amount from balances_temp WHERE student=$std_id ";
    $query=mysqli_query($con,$sql_string);
    if(!$query){
        echo mysqli_error($con);
        return -1;
    }
    if(mysqli_num_rows($query)>0){
        $row=mysqli_fetch_array($query);
        mysqli_close($con);
        return $row["amount"];
    }else{
        mysqli_close($con);
        return -1;
    }

}


function update_balance($new_bal,$std_id,$prev_bal){
    //if the previous balance is -1 just make an insertion
    //if the previous balance is more then update to the current balance
    $con = db_connect();
    $sql_string="";
    if($prev_bal==-1){
        //insert
        $sql_string="INSERT INTO balances_temp (amount,student) VALUES ('$new_bal','$std_id')";
    
    }else{
        //update
        $sql_string="UPDATE balances_temp SET amount='$new_bal' WHERE student=$std_id ";
        
    }

    $query=mysqli_query($con,$sql_string);

    if(!$query){
        echo mysqli_error($con);
        mysqli_close($con);
        return false;
    }else{
        
        mysqli_close($con);
        return true;
    }

}


?>

