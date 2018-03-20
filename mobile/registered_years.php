<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);

$result = fetch_details();
$response = array();
header("content-type:application/json");
if ($result != null) {
    $response['data'] = $result;
    $response['success'] = TRUE;
} else {
    $response['success'] = FALSE;
}
echo json_encode($response);

function fetch_details() {
    $data = array();
    $con = db_connect();
    $student_id = $_POST['student_id'];
    $university_id = $_POST['university_id'];

    $sql_string = "select registered_academic_years_id as id,_status,semester,semester_semester_id as semester_id,ra._when_added as time_stamp,sy.year_id,sy.year from registered_academic_years ra 
        LEFT JOIN semesters s ON(ra.semester_semester_id=s.semester_id)
left join study_year sy on(ra.year_study=sy.year_id)
where student_student_id='" . $student_id . "' order by registered_academic_years_id desc";
    
    $query = mysqli_query($con, $sql_string);
    
    if(!$query) echo mysqli_error($con);
    
    $university_status = false;
    $check1 = mysqli_query($con, "select * from universities where university_id='$university_id' && _student_registration='1'");
    if (mysqli_num_rows($check1) > 0) {
        $university_status = TRUE;
    } else {
        $university_status = false;
    }

    if (!$query)
        echo mysqli_error($con);

    if (mysqli_num_rows($query) > 0) {
        while ($row = mysqli_fetch_assoc($query)) {
            $data[] = array(
                'id' => $row['id'],
                'semester' => $row['semester'],
                'semester_id' => $row['semester_id'],
                'status' => $row['_status'],
                'time_stamp' => $row['time_stamp'],
                'university_status' => $university_status,
                'year_id'=>$row['year_id'],
                'year'=>$row['year'],
            );
        }
    }

    mysqli_close($con);
    return $data;
}

?>