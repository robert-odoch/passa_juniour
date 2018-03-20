<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);

// $result = fetch_student_years();


// $response = array();
// header("content-type:application/json");
// if ($result != null) {
//     $response['data'] = $result;
//     $response['success'] = TRUE;
// } else {
//     $response['success'] = FALSE;
// }
// echo json_encode($response);

// function fetch_student_years() {
    $data = array();
    $con = db_connect();
    $student_reg = $_POST['student_reg'];
    // $semester_id = $_POST['semester_id'];
    // $university_id = $_POST['university_id'];
    $student_id = $_POST['student_id'];

   //fetch student graduate level

    $sql=mysqli_query($con,"select level from student a left join courses b on(a.courses_course_id=b.course_id) where a.student_id='".$student_id."'");
    $row=mysqli_fetch_assoc($sql);
    //check grading
    $sql_query=mysqli_query($con,"select max(value_to) as value_to from grading where level='".$row['level']."' and progress='1'");
    // $data_row=array();
    $row2=mysqli_fetch_assoc($sql_query);
         //fetch retakes
     $sql_retakes=mysqli_query($con,"select  code,fn,c.year,d.semester,b.course_unit,b.id from marks a left join course_units b on(a.course_unit=b.id) left join study_year c on(a.study_year=c.year_id) left join semesters d on(a.semester=d.semester_id) where reg_no='".$student_reg."' and fn<='".$row2['value_to']."' and b.id not in (select course_units_units_id from registered_course_units where student_student_id='".$student_id."' and _status='1' )" ) or die(mysqli_error($con));
     $response=array();
      $data['response']=array();
      $response['success']=false;
     while($row3=mysqli_fetch_assoc($sql_retakes)){
        if($row3['fn']<=$row2['value_to']){ 
             $response['success']=true;
        $data_row[] = array(
            'id' => $row3['id'],
            "code" => $row3['code'],
            "year"=>$row3['year'],
            'semester'=>$row3['semester'],
            'course_unit'=>$row3['course_unit']
           );
            $response['data']=$data_row;
        }else{
             $response['success']=false;
        }
     }
     echo json_encode($response);
    // print_r($data_row);
    // return $data_row;

    // $sql_string = "SELECT m.mark,m.course_unit,y.year FROM marks m left join study_year y on(m.academic_years_year_id=y.year_id) WHERE m.reg_number='" . $student_reg . "'"
    //         . " &&m.semesters_semester_id='" . $semester_id . "'";
    // $query = mysqli_query($con, $sql_string) or die(mysqli_error($con));

    // //fetch student graduate level

    // $result1 = mysqli_query($con, "select courses_course_id from student where student_id='$student_id'");

    // $row1 = mysqli_fetch_assoc($result1);
    // $result2 = mysqli_query($con, "select level from courses where course_id='" . $row1['courses_course_id'] . "'");
    // $row2 = mysqli_fetch_assoc($result2);


    // $grading = mysqli_query($con, "select * from grading where grading.university_id='" . $university_id . "' && level='" . $row2['level'] . "'");


    // if (!$query)
    //     echo mysqli_error($con);

    // if (mysqli_num_rows($query) > 0) {
    //     $array_grades = array();
    //     while ($grade = mysqli_fetch_assoc($grading)) {
    //         $array_grades[] = array("from" => $grade['value_frm'], "to" => $grade['value_to'], "grade" => $grade['grade'], "value" => $grade['grade_value'], "progress" => $grade['progress']);
    //     }

    //     $array_data = array();
    //     $data_row = array();
    //     while ($row = mysqli_fetch_assoc($query)) {
    //         $found = false;
    //         foreach ($array_grades as $grade) {
    //             if ($row['mark'] >= $grade["from"] && $row['mark'] <= $grade["to"]) {
    //                 $found = true;
    //                 if ($grade["progress"] == 1) {

    //                     $units_query = mysqli_query($con, "select c.course_unit_code,c.course_unit,c.course_unit_id from course_units c where course_unit_code='" . $row['course_unit'] . "' && c.course_unit_id not in (select r.course_units_units_id from registered_course_units r where r.student_student_id='" . $student_id . "') ");
    //                     $row_units = mysqli_fetch_assoc($units_query);
    //                     if($row_units!=null) {
    //                         $data_row[] = array(
    //                             'id' => $row_units['course_unit_id'],
    //                             "code" => $row_units['course_unit_code'],
    //                             "course_unit" => $row_units['course_unit'],
    //                             'year'=>$row['year']
    //                         );
    //                     }
    //                 }
    //             }
    //         }
    //     }
    //     return $data_row;
    // }
// }

?>