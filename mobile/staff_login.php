
<?php

include 'connection.php';
$response = array();
$response['success'] = FALSE;
if (isset($_POST['email']) && isset($_POST['password'])) {
    $con = db_connect();
    $email = $_POST['email'];
    $password = $_POST['password'];
    $string = "SELECT * FROM counsellors c left join users u on(c.user_id=u.user_id) where u.email='" . $email . "' && password='" . $password . "'";
    $query = mysqli_query($con, $string);
    if (mysqli_num_rows($query) > 0) {
        $response['data'] = array();
        $response['success'] = TRUE;
        while ($row = mysqli_fetch_assoc($query)) {
            $data['firstName'] = $row['firstName'];
            $data['lastName'] = $row['lastName'];
            $data['user_id'] = $row['user_id'];
            $data['university_id'] = $row['university_id'];
            array_push($response['data'], $data);
        }
    } else {
        $response['message'] = "wrong username or password";
        $response['success'] = FALSE;
    }
} else {
    $response['message'] = "Please fill the empty fields";
    $response['success'] = FALSE;
}
echo json_encode($response);
?>
