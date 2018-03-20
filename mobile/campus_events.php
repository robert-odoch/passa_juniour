<?php

include 'connection.php';
$json = json_decode(file_get_contents('php://input'), true);
$response = array();
header("content-type:application/json");
$data = array();
$con = db_connect();
$university_id = $_POST['university_id'];

$sql_string = "select * from campus_events where university_university_id='" . $university_id . "' order by event_id desc";
$query = mysqli_query($con, $sql_string);

if (!$query)
    echo mysqli_error($con);

if (mysqli_num_rows($query) > 0) {
    $response['success'] = TRUE;
    $response['data'] = array();
    while ($row = mysqli_fetch_assoc($query)) {
        $data['title'] = $row['title'];
        $data['event_detail'] = str_replace(array("\n", "\r"), '', strip_tags($row['event_detail']));
        $data['time']=$row['time'];
        $data['venue']=$row['venue'];
        $data['time_stamp'] = $row['time_stamp'];
        array_push($response['data'], $data);
    }
} else {
    $response['success'] = FALSE;
}

mysqli_close($con);
echo json_encode($response);
?>