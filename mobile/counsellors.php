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
    $university_id = $_POST['university_id'];
    $student_id = $_POST['student_id'];
    $token = $_POST['token'];
    $photo = $_POST['photo'];

    //$sql_string = "select u.name,u.photo,TIMESTAMPDIFF(MINUTE, u.last_login, NOW()) as last_login,u.user_id from counsellors c left join users u on(c.user_id=u.user_id) where u.university_id='" . $university_id . "'";
    $sql_string=" SELECT u.name,u.photo,TIMESTAMPDIFF(MINUTE, u.last_login, NOW()) as last_login,u.user_id  FROM user_position up left join users u on(up.user=u.user_id) where u.university_id='" . $university_id . "'&& up.pos_name=4 ";


    $query = mysqli_query($con, $sql_string);
    $chat_status = FALSE;
    if (!$query)
        echo mysqli_error($con);

    if (mysqli_num_rows($query) > 0) {
        while ($row = mysqli_fetch_assoc($query)) {
            $array['name'] = $row["name"];
            $array['photo'] = $row['photo'];
            if ($row["last_login"] > 75) {
                $array['online'] = false;
            } else {
                $array['online'] = true;
            }
            $array['user_id'] = $row["user_id"];
            $data[] = $array;
        }
        mysqli_query($con, "update chat_users set token='$token',photo='$photo' where user_id='$student_id' && user_type='student' ");
    }

    mysqli_close($con);
    return $data;
}

?>