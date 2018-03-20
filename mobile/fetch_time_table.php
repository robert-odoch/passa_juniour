<?php

include 'connection.php';
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
    $program=$_POST['program'];

    $course = mysqli_query($con, "select courses_course_id from student where student_id='$student_id' ")or die(mysqli_error($con));;
    $row = mysqli_fetch_assoc($course);
    $sql_string = "select time_table,semester,year from time_table a left join semesters b on(a.semester_id=b.semester_id) left join study_year c on(a.study_year=c.year_id) where course_id='" . $row['courses_course_id'] . "' and study_period='".$program."'";
    $query = mysqli_query($con, $sql_string)or die(mysqli_error($con));;

    if (!$query)
        echo mysqli_error($con);

    if (mysqli_num_rows($query) > 0) {
        while ($row = mysqli_fetch_assoc($query)) {
            $data[] = $row;
        }
    }

    mysqli_close($con);
    return $data;
}

?>