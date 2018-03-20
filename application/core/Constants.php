<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Constants
 *
 * @author abert
 */
define('FIREBASE_API_KEY', "AIzaSyCOmvUi2-_cQFkit8_92DnaP8r1jGVVQvM");
class Constants {

    function getDatetimeNow() {
        $tz_object = new DateTimeZone('EAT');
        $datetime = new DateTime();
        $datetime->setTimezone($tz_object);
        return $datetime->format('Y\-m\-d');
    }
    

}
