<?php
date_default_timezone_set('Africa/Kampala');
define('HOST', 'localhost');
define('USER', 'root');
define('PASS', 'abertnamanya2.');
define('DB', 'mygrades');
define('FIREBASE_API_KEY', 'AIzaSyCOmvUi2-_cQFkit8_92DnaP8r1jGVVQvM');

function db_connect() {
    $con = mysqli_connect(HOST, USER, PASS, DB) or die('unable to connect to db');
    return $con;
}
?>