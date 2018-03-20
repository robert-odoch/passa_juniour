<?php

class MainClass {

    //this function is used to login into the mobile app
    public function login($con, $username, $password) {
        $response = array();
        $response['success'] = false;
        $sql_str = "SELECT * FROM parent WHERE `user_name`='".$username."' AND `password`='$password' ";
        $query = mysqli_query($con, $sql_str);
        if (!$query) {
            echo mysqli_error($con);
        } else {
            if(mysqli_num_rows($query)>0){
            $row = mysqli_fetch_assoc($query);

            $response['parents_data'] = array("parent_id" => $row["parent_id"], "name" => $row["name"]);

            if (!empty($response['parents_data'])) {
                $response['success'] = true;
            }
        }else{
              $response['success'] = false;
        } 
        }
        mysqli_close($con); //close the connection
        $this->echo_reponse($response); //call function to echo responce
    }


    //request memebership


    public function request_membership($con,$email,$phone_number){
         $response = array();
        $response['success'] = false;
        if(!$this->checkIfExists($email,$phone_number,$con)){
             $response['success']=true;
             $response['message']="success";
        mysqli_query($con,"insert into parent(user_name,password,phone_number) values('$email','$phone_number','$phone_number')") or die(mysqli_error($con));
        $response['message']="Account Created successfuly\n Please use email as username then phone number as password";
        }else{
             $response['message']="Sorry Account Already Exists";
         $response['success']=false;
        }
     mysqli_close($con); //close the connection
        $this->echo_reponse($response); //call function to echo responce
    }
    public function checkIfExists($email,$phone_number,$con){
        $query=mysqli_query($con,"select * from parent where user_name='$email' || phone_number='$phone_number'") or die(mysqli_error($con));
        if(mysqli_num_rows($query)>0){
          return true;
        }else{
            return false;
        }

    }

//end login method

    public function get_news($con){
        $results=array();
        $string="SELECT * FROM news";
        $query=mysqli_query($con,$string);
        if($query){
            if(mysqli_num_rows($query)>0){
                while($row=mysqli_fetch_array($query)){
                    $array_data['title'] = $row['title'];
            $array_data['news_id']=$row['news_id'];
            $array_data['image']=$row['image'];
             $array_data['news_detail'] =  str_replace("&nbsp;","",str_ireplace(array("\r","\n",'\r','\n'),'',strip_tags($row['news_detail'])));
              $array_data['_when_added'] = $row['_when_added'];
               $results['data'][]=$array_data;
                }


            }

        }

        if(!empty($results["data"])){
            $results["success"]=true;
        }else{
            $results["success"]=false;
        }
        $this->echo_reponse($results);
    }

    public function fetch_news($con,$cat_id){
       
        $results=array();

        $string="SELECT news_id,title,news_detail,image,views_count,_when_added as time_stamp FROM news 
        WHERE category_id='1' ";

        $fetch_query=mysqli_query($con,$string);
        
        if(!$fetch_query) echo mysqli_error($con);
        // if($fetch_query){
        //     if(mysqli_num_rows($fetch_query)>0){
        //         while($row1=mysqli_fetch_array($fetch_query)){
        //             $results["data"][]=$row1;
        //         }
        //     }
        // }

        if ($fetch_query) {
            while ($row = mysqli_fetch_assoc($fetch_query)) { 
                $results["data"][] = $row;
            }
        }
        if(!empty($results["data"])){
            $results["success"]=true;
        }else{
            $results["success"]=false;
        }
        
        $this->echo_reponse($results);
    }
    
    public function get_students($con, $parent_id) {
        $response = array();
        $response["success"]=false;
        $sql_string = "SELECT ps.student_id,s.name,s.registration_number,s.universities_university_id,s.courses_course_id FROM `parent_student` ps
            LEFT JOIN student s on (s.student_id=ps.student_id)"
                . " WHERE `parent_id`='$parent_id' ";
        $query = mysqli_query($con, $sql_string);

        if(!$query) echo mysqli_error($con);

        if ($query) {
            while ($row = mysqli_fetch_assoc($query)) { 
                $response["data"][] = $row;
            }
        }
        if(!empty($response["data"])){
            $response["success"]=true;
        }
        $this->echo_reponse($response);
    }
    

    public function get_students_general_results($con, $student_id, $student_reg, $university_id) {
        $response = array();
        $response["success"] = false;
        
        //get all registered years for student (yr-sem pair)
        $registered_yrs_query = mysqli_query($con, "select r.year_study,r.semester_semester_id from registered_academic_years r where r.student_student_id='$student_id'")or die(mysqli_error($con));
        
        $registered_yrs = array();
        while ($row = mysqli_fetch_assoc($registered_yrs_query)) {
            $registered_yrs[] = array('year_id' => $row['year_study'], 'semester_id' => $row['semester_semester_id']);
        }

//      $response["registered_yrs"]=$registered_yrs;
        $all_grades_array=array();
        foreach ($registered_yrs as $reg_yr)://loop through sem yr pair
            $marks_string = "SELECT marks.fn,cw,ex,marks.course_unit,s.semester,y.year FROM marks left join semesters s  on(marks.semester=s.semester_id) "
                    . "left join study_year y on(marks.study_year=y.year_id)"
                    . " WHERE marks.reg_no='" . $student_reg . "'
                            && marks.semester='" . $reg_yr['semester_id'] . "' && marks.study_year='" . $reg_yr['year_id'] . "'";
            $marks_query = mysqli_query($con, $marks_string)or die(mysqli_error($con));

            $temp_semester = array();

//          $temp_semester["period"] = "Yr: " . $reg_yr['year_id'] . " Sem: " . $reg_yr['semester_id'];

            $temp_semester["period"] = array("year" => $reg_yr['year_id'], "semester" => $reg_yr['semester_id']);

            //establish the levels
            $course_ids_query = mysqli_query($con, "select courses_course_id from student where student_id='$student_id'");
            $courses_ids = mysqli_fetch_assoc($course_ids_query);

            $levels_query = mysqli_query($con, "select level from courses where course_id='" . $courses_ids['courses_course_id'] . "'");
            $levels = mysqli_fetch_assoc($levels_query);

            $grading = mysqli_query($con, "select * from grading where grading.university_id='" . $university_id . "' && level='" . $levels['level'] . "'") or die(mysqli_error($con));

            $temp_semester["marks"] = array();

            
            
            if (mysqli_num_rows($marks_query) > 0) ://check if marks query returned any data
                $array_grades = array();
                $response["success"] = true;

                while ($grade = mysqli_fetch_assoc($grading)) {
                    $array_grades[] = array("from" => $grade['value_frm'], "to" => $grade['value_to'], "grade" => $grade['grade'], "value" => $grade['grade_value'], "progress" => $grade['progress']);
                }

                $temp_sem_marks = array();
                $marks = array();
                $units_count = 0;

                $temp_grades=array();
                
                while ($row = mysqli_fetch_assoc($marks_query)) {
                    $found = false;
                    foreach ($array_grades as $grade) {
                        if ($row['fn'] >= $grade["from"] && $row['fn'] <= $grade["to"]) {
                            $found = true;

//                          $temp_sem_marks["unit_name"]=$row["cu.course_unit"];
                            $temp_sem_marks["code"] = $row['course_unit'];
                            $temp_sem_marks["fn"] = $row['fn'];
                               $temp_sem_marks["cw"] = $row['cw'];
                                  $temp_sem_marks["ex"] = $row['ex'];
                            $temp_sem_marks["grade"] = $grade["grade"];
                            $temp_sem_marks["value"] = $grade["value"];
                            $temp_sem_marks["progress"] = (($grade["progress"]==0)?"N":"RE");
//                          $temp_sem_marks["cu"] = $row["cu"];
                            $temp_grades[]=$grade["value"];
                            $all_grades_array[]=$grade["value"];
                            $temp_semester["marks"][] = $temp_sem_marks;
                        }
                    }
                }//end while for marks
//            $temp_semester["marks"] = $marks;
            $temp_semester["avg_grade"] =round($this->avg_grade($temp_grades),2);
//            $all_records[] = $temp_semester;
            endif; //if to check if marks are in marks query

            $response["data"][] = $temp_semester;
        endforeach; //end of loop through yr sem pair
        $response["cgpa"]=round($this->avg_grade($all_grades_array),2);
        $this->echo_reponse($response);
    }

    public function get_student_perfomance($con, $student_id, $student_reg, $university_id) {
        $response = array();
        $response["success"] = false;

        //get all registered years for student (yr-sem pair)
        $registered_yrs_query = mysqli_query($con, "select r.year_study,r.semester_semester_id from registered_academic_years r where r.student_student_id='$student_id'");
        
        $registered_yrs = array();
        while ($row = mysqli_fetch_assoc($registered_yrs_query)) {
            $registered_yrs[] = array('year_id' => $row['year_study'], 'semester_id' => $row['semester_semester_id']);
        }

//      $response["registered_yrs"]=$registered_yrs;

        foreach ($registered_yrs as $reg_yr)://loop through sem yr pair
            $marks_string = "SELECT marks.fn,marks.course_unit,s.semester,y.year FROM marks left join semesters s  on(marks.semester=s.semester_id) "
                    . "left join study_year y on(marks.study_year=y.year_id)"
                    . " WHERE marks.reg_no='" . $student_reg . "'
                            && marks.semester='" . $reg_yr['semester_id'] . "' && marks.study_year='" . $reg_yr['year_id'] . "'";
            $marks_query = mysqli_query($con, $marks_string) or die(mysqli_error($con));

            $temp_semester = array();

//          $temp_semester["period"] = "Yr: " . $reg_yr['year_id'] . " Sem: " . $reg_yr['semester_id'];
                
            $temp_semester["year"] =$reg_yr['year_id'];
            $temp_semester["semester"]=$reg_yr['semester_id'];
            //establish the levels
            $course_ids_query = mysqli_query($con, "select courses_course_id from student where student_id='$student_id'");
            $courses_ids = mysqli_fetch_assoc($course_ids_query);
            
            $levels_query = mysqli_query($con, "select level from courses where course_id='" . $courses_ids['courses_course_id'] . "'");
            $levels = mysqli_fetch_assoc($levels_query);

            $grading = mysqli_query($con, "select * from grading where grading.university_id='" . $university_id . "' && level='" . $levels['level'] . "'");

            if (mysqli_num_rows($marks_query) > 0) ://check if marks query returned any data
                $array_grades = array();
                $response["success"] = true;

                while ($grade = mysqli_fetch_assoc($grading)) {
                    $array_grades[] = array("from" => $grade['value_frm'],
                                        "to" => $grade['value_to'],
                                        "grade" => $grade['grade'],
                                        "value" => $grade['grade_value'],
                                        "progress" => $grade['progress']);
                
                    
                }

                $temp_sem_grades = array();
                $marks = array();
                $units_count = 0;

                while ($row = mysqli_fetch_assoc($marks_query)) {
                    $found = false;
                    foreach ($array_grades as $grade) {
                        if ($row['fn'] >= $grade["from"] && $row['fn'] <= $grade["to"]) {
                            $found = true;

                            //$temp_sem_marks["unit_name"]=$row["cu.course_unit"];
                            
                            $temp_sem_grades[] = $grade["value"];
                            //$temp_sem_marks["cu"] = $row["cu"];

                        }
                    }
                }//end while for marks
//            $temp_semester["gpa"] = $marks;
            $temp_semester["gpa"] = $this->avg_grade($temp_sem_grades);
//            $all_records[] = $temp_semester;
            endif; //if to check if marks are in marks query

            $response["data"][] = $temp_semester;
        endforeach; //end of loop through yr sem pair

        $this->echo_reponse($response);
    }
    
    
    public function get_payments($con,$student_id,$course_id,$university_id){
        $response = array();
        $response["success"] = false;

        $bal_qry=mysqli_query($con,"select amount from balances_temp where student=".$student_id);
        $balance=0;
        if($bal_qry){
            $row=mysqli_fetch_array($bal_qry);
            $balance=$row["amount"];
        }

        //get all registered years for student (yr-sem pair)
        $registered_yrs_query = mysqli_query($con, "SELECT r.year_study,r.semester_semester_id
            FROM registered_academic_years r 
            WHERE r.student_student_id='$student_id' 
            GROUP BY r.year_study,r.semester_semester_id 
            ORDER BY r.year_study ");
        
        $registered_yrs = array();
        while ($row = mysqli_fetch_assoc($registered_yrs_query)) {
            $registered_yrs[] = array('year_id' => $row['year_study'], 'semester_id' => $row['semester_semester_id']);
        }
        
        foreach ($registered_yrs as $reg_yr)://loop through sem yr pair
            $payments_str = "SELECT * FROM `student_payments` WHERE student_id='$student_id' AND `study_year`='".$reg_yr['year_id']."' 
                AND `semester`='" . $reg_yr['semester_id'] . "' ";
        
            $payments_query = mysqli_query($con, $payments_str);

            $temp_semester = array();
            //assign semester period
            $temp_semester["period"] = array("year" => $reg_yr['year_id'], "semester" => $reg_yr['semester_id']);

            if(mysqli_num_rows($payments_query)>0){
                
                $response["success"] = true;
                $temp_sem_payments = array();
                $total_amounts = 0;//holds the amounts t
                
                while ($row = mysqli_fetch_assoc($payments_query)) {
                    $temp_sem_payments["amount"] = $row['amount'];
                    $temp_sem_payments["recept_no"] = $row['recept_no'];
                    $temp_sem_payments["payment_date"] = $row["payment_date"];
                    $total_amounts=$total_amounts+$row['amount']; 
                    $temp_semester["payments"][]=$temp_sem_payments;
                }//end while for marks
                $temp_semester["total"]=$total_amounts;
                
                $structure_array = $this->fetch_courseSemesterStructure($con,$course_id,$university_id);
                $fees=  $this->calculate_fees($structure_array,$reg_yr['semester_id']);
                //$temp_semester["balance"]=$fees-$total_amounts;
                $temp_semester["balance"]=$balance;
               
            }else{
              $temp_semester["payments"]=array();  
              $structure_array = $this->fetch_courseSemesterStructure($con,$course_id,$university_id);
              $fees=  $this->calculate_fees($structure_array,$reg_yr['semester_id']);
              $temp_semester["total"]=0;
              //$temp_semester["balance"]=$fees;
              $temp_semester["balance"]=$balance;
            }
            
            $response["data"][] = $temp_semester;
            
            
        endforeach;
        
        mysqli_close($con);
        $this->echo_reponse($response);
        
    }
    
    public function fetch_courseSemesterStructure($con,$course_id,$university_id){
        $sql_str="SELECT fc.name,fs.`amount`,fc.paid_times FROM `fees_structure` fs  
                                    left join fees_categories fc on fs.`fees_category`=fc.cat_id
                                    WHERE fs.`course_id`='$course_id' AND
                                    fc.university_id='$university_id' ";
        $query=  mysqli_query($con, $sql_str);
        $result=array();
        while($row=mysqli_fetch_assoc($query)){
           $result[]=$row; 
        }
        return $result;
    }
    public function searchStudent($con,$student_reg,$parent_id){
          $response = array();
        $response["success"]=false;
        $sql_string = "select student_id from student where registration_number='$student_reg'";
        $query = mysqli_query($con, $sql_string);
        if(mysqli_num_rows($query)>0){
            $response['success']=true;
            //now insert the student id
            $row=mysqli_fetch_assoc($query);
            //check if already exists
           $count= mysqli_query($con,"select * from parent_student where parent_id='".$parent_id."' && student_id='".$row['student_id']."'");
           if(mysqli_num_rows($count)<=0){
                mysqli_query($con,"insert into parent_student(parent_id,student_id) values('".$parent_id."','".$row['student_id']."')") or die(mysqli_error($con));
           }
            $response['message']="Student added successfuly";
        }else{
            $response['success']=false;
            $response['message']="Sorry the registration Number is not valid";
        }
        $this->echo_reponse($response);
    }
    
    
    public function calculate_fees($structure_array,$sem){
        $total=0;
        foreach ($structure_array as $fees_item):
            $times=$fees_item["paid_times"];
            $amount=$fees_item["amount"];
            
            switch ($times):
                case "fully":
                     $total+=$amount;
                    break;
                case "twice":
                    $value=$amount/2;
                    $total+=$value;
                    break;
                case "Once":
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
    
    private function avg_grade($temp_sem_grades){
        $counter=0;
        $total=0;
        foreach ($temp_sem_grades as $grade){
            $total+=$grade;
            $counter++;
        }
        return (($total!=0)?$total/$counter:0);
    }
    private function echo_reponse($response) {
        echo json_encode($response);
    }

    public function add_parent_student($con,$student_id,$parent_id){

           $response = array();
        $response["success"]=false;
          $already_exists=$this->check_student($con,$student_id.$parent_id);
          if(!$already_exists){
            mysqli_query($con,"insert into parent_student(student_id,parent_id) values('$student_id','$parent_id')");
            $response['message']="student added successfuly";
            $response['success']=true;

          }else{
           $response['message']="student Already exists in your Account";
           $response['success']=true;
          }
        $this->echo_reponse($response);
    }


    private function check_student($con,$student_id,$parent_id){
        $query=mysqli_query($con,"select * from parent_student where student_id='$student_id' && parent_id='$parent_id'");
        if(mysqli_num_rows($query)>0){
          return true;
        } else{
            return false;
        }
    }
     public function get_my_help_message($con,$parent_id){
        $response_array=array();
        $response_array['success'] = false;
        $sql="SELECT * FROM help_desk WHERE (sender_id=$parent_id OR to_id=$parent_id) AND delete_status=0 ORDER by id ASC ";
        $query = mysqli_query($con, $sql);
        if($query){
            if(mysqli_num_rows($query)>0){
                while ($row = mysqli_fetch_assoc($query)){
                                 $response_array["data"][]=$row;
                            }
              $response_array['success'] = true;              
            }
            
        }
        mysqli_close($con); //close the connection
        $this->echo_reponse($response_array); //call function to echo responce
    }//end function 
    public function save_help_message($con,$parent_id,$message){
       $response_array=array();
       $response_array['success'] = false;

      $time=date('Y-m-d H:i:s');

      $sql="INSERT INTO help_desk (message,sender_id,to_id,_when_sent) VALUES 
      ('$message','$parent_id',0,'$time') ";

        $query = mysqli_query($con, $sql);
        if($query){
            $response_array['success'] = true;
        }else{
            echo mysqli_error($con);
        }

        $this->echo_reponse($response_array); //call function to echo responce
    } 
    public function change_password($con,$email){
         $response=array();
        $checkIfExists =$this->emailExists($email,$con);
        if($checkIfExists){
          $response['success']=true;
          $query=mysqli_query($con,"update parent set password='123456'") or die(mysqli_error($con));
          $response['message']="Password reset to 123456";
        }else{
        $response['message']="email address does not exist";
        $response['success']=false;
        }
        echo json_encode($response);
    }
    public function emailExists($email,$con){
        $query=mysqli_query($con,"select * from parent where user_name='$email'") or die(mysqli_error($con));
        if(mysqli_num_rows($query)>0){
          return true;
        }else{
            return false;
        }

    }

}//end MainClass


?>