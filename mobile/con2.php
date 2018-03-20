<?php
date_default_timezone_set('Africa/Kampala');
define('HOST', '127.0.0.1');
define('USER', 'mygrades_user');
define('PASS', '8technologies@mygrades');
define('DB', 'mygrades_database');
define('FIREBASE_API_KEY', 'AIzaSyCOmvUi2-_cQFkit8_92DnaP8r1jGVVQvM');

function db_connect() {
    $con = mysqli_connect(HOST, USER, PASS, DB) or die('unable to connect to db');
    return $con;
}

?>