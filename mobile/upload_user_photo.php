<?php

$response = array();
$upload_path = '../upload/user/';
try {
    $target_path = $upload_path . basename($_FILES['uploaded_file']['name']);
    move_uploaded_file($_FILES['uploaded_file']['tmp_name'], $target_path);
} catch (Exception $e) {
    $response['error'] = true;
    $response['message'] = $e->getMessage();
}
echo json_encode($response);
?>