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
    $complaint_id = $_POST['complaint_id'];

    $sql_string = "SELECT c._status as type, c.message,c._when_added as time_stamp,r.message as complaint_reply, r._when_added as reply_date from general_complaints c 
    left join complaint_response r on(c.id=r.complaint) 
    where c.id='" . $complaint_id . "'";
    
    $query = mysqli_query($con, $sql_string);

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