<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');


if (!function_exists('active_link')) {

    function active_link($controller) {
        $CI = & get_instance();

        $class = $CI->router->fetch_class();

        return ($class == $controller) ? 'open active' : '';
    }

}


function getUserDetails($userId = NULL, $field = '') {
    $CI = & get_instance();
    $mod = $CI->load->model('CRUD_model');
    $conditions = array('users.id' => $userId);
    $result = $CI->user_model->getUsers($conditions);
    if ($result->num_rows() > 0) {
        $data = $result->row();
        $res = $data->$field;
    } else {
        $res = '';
    }
    return $res;
}

function get_children($id) {//MM_UserID
    $CI = & get_instance();
    $mod = $CI->load->model('CRUD_model');
    //fetch user group
    $data = $result = $CI->CRUD_model->getRecords("menu a left join group_menu b on(a.id=b.label)", array("a.id", "a.label", "a.link"), "where parent = '" . $id . "' and a._status = '1' and b.group='".$CI->session->userdata('MM_GROUP')."' order by sort ASC");
    return $data;
}

function getLink($id) {
    $CI = & get_instance();
    $mod = $CI->load->model('CRUD_model');
    $data = $result = $CI->CRUD_model->getCount("menu", "count(*) as count", "where parent = '" . $id . "'");
    return $data;
}

function parent_links($parent) {
    $CI = & get_instance();
    $mod = $CI->load->model('CRUD_model');
    $data = $result = $CI->CRUD_model->getRecord("menu", "link", "where `parent` = '" . $parent . "' and `_status` = '1'");
    return $data;
}
function getLoggedUser(){
      $CI = & get_instance();
    $mod = $CI->load->model('CRUD_model');
    $data = $result = $CI->CRUD_model->getRecord("users", array("surname","othername","photo"), "where `_status` = '1' and id='".$CI->session->userdata("MM_UserID")."'");
    return $data;
}




?>