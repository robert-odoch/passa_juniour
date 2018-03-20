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

    $sql_string = "select news.*,DATE_FORMAT(_when_added, '%d/%m/%Y') as when_added from news where university_university_id='" . $university_id . "' order by news_id desc";
    $query = mysqli_query($con, $sql_string);

    if (!$query)
        echo mysqli_error($con);

    if (mysqli_num_rows($query) > 0) {
        $array_data=array();
        while ($row = mysqli_fetch_assoc($query)) {
            $array_data['title'] = $row['title'];
            $array_data['news_id']=$row['news_id'];
            $array_data['image']=$row['image'];
             $array_data['news_detail'] =  str_ireplace(array("\r","\n",'\r','\n'),'',strip_tags($row['news_detail']));
              $array_data['_when_added'] = $row['when_added'];

        $data[]=$array_data;
        
        }
        // strip_tags("Hello <b>world!</b>")
        // echo json_encode($response)
    }

    mysqli_close($con);
    return $data;
}

?>