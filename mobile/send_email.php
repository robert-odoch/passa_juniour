<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


require './functions.php';

$api=new APi();

//send email


$success=$api->send_email('abert', 'abertnamanya@gmail.com', 'testing', "an tsinnff");
if($success){
     echo json_encode(array('status'=>""));
}





