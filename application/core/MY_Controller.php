<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Security
 *
 * @author hp
 */
class MY_Controller extends CI_Controller {

    private $API_KEY;
    private $user_id;
    private $token;
    private $random;
    private $time_stamp;

    function __construct() {
        parent::__construct();
        $this->API_KEY = "AIzaSyCOmvUi2-_cQFkit8_92DnaP8r1jGVVQvM";
        $this->load->model('LoginModel');
        $this->load->model('CRUD_model');
        $this->store_sessions();
    }

    protected function generateToken() {
        $this->random = $this->randomString();
        $this->token = $_SERVER['HTTP_USER_AGENT'] . $this->random;
        $this->token = $this->hashData($this->token);
        $this->user_id = $this->session->userdata('MM_USERID');
        $this->time_stamp = date("Y-m-d-H-i-s");

        $data = array(
            'token' => $this->token,
            'session_id' => $this->session->session_id,
            'session_user' => $this->user_id,
            'last_session' => $this->time_stamp
        );
        $this->session->set_userdata($data);
        $this->LoginModel->deleteOldToken($this->user_id);
        $this->LoginModel->InsertNewtoken($data);
        return TRUE;
    }

    private function randomString() {
        $string = bin2hex(mt_rand(10,15));
        return $string;
    }

    protected function hashData($data) {
        return hash_hmac('sha512', $data, $this->API_KEY);
    }

    public function checkSession() {
        $this->user_id = $this->session->userdata('session_user');
        $selection = $this->LoginModel->UserSession($this->user_id);
        if ($selection) {
            if ($this->session->session_id == $selection->session_id && $this->session->userdata('token') == $selection->token) {
                $this->refreshSession();
                return TRUE;
            } else {
                return $this->logout();
            }
        } else {
            return $this->logout();
        }
    }

    private function refreshSession() {
        $this->session->sess_update;
        $random = $this->randomString();
        $this->token = $_SERVER['HTTP_USER_AGENT'] . $random;
        $this->token = $this->hashData($this->token);
        $this->user_id = $this->session->userdata('MM_USERID');
        $this->time_stamp = date("Y-m-d-H-i-s");

        $data = array(
            'token' => $this->token,
            'session_id' => $this->session->session_id,
            'session_user' => $this->user_id,
            'last_session' => $this->time_stamp
        );
        $this->session->set_userdata($data);
        $this->LoginModel->deleteOldToken($this->user_id);
        $this->LoginModel->InsertNewtoken($data);
    }

    private function store_sessions(){
            $user_group = $this->CRUD_model->getRecords("user_group a left join  groups b on(a.group=b.id && b._status='1')", array('a.`group`','b.name'), "where a.name='" . $this->session->userdata('MM_USERID') . "' and a._status='1'");

             $group_id = $this->CRUD_model->getRecord("user_group a", array('a.group'), "where a.name='" . $this->session->userdata('MM_USERID'). "' and a._status='1'");
            $group_list = '';
            $group_name = '';
            $group_type='';
            foreach ($user_group as $group) {
                $group_list .= $group['group'];
                $group_name.=$group['name'];
            }
            $MM_UserGroup = $this->CRUD_model->getRecords("group_menu join menu on (group_menu.label = menu.id and menu._status='1')", array("distinct(menu.id) as "
                . "id", "menu.label as label", "menu.link as link", "menu.parent as parent", "menu.sort","menu.menu_class"), "where group_menu.group='".$group_list."' and group_menu._status = '1' and menu._status = '1' order by menu.sort asc");
            //school
                $school = $this->CRUD_model->getRecord("users a left join school_users b on(a.id=b.user_id)", array('b.school_id'), "where a.id='" .$this->session->userdata('MM_USERID') . "' and a._status='1'");
                 

            $this->session->set_userdata(
                    array(
                        'MM_UserID' => $this->session->userdata('MM_USERID'),
                        'MM_UserGroup' => $MM_UserGroup,
                        'MM_GROUP'=>$group_id->group,
                        'MM_GROUPNAME'=>$group_name,
                        'USERMM_school'=>$school->school_id,
                        'isLoggedin'=>true
            ));
 }

    private function logout() {
        $this->session->sess_destroy();
        redirect('auth');
    }

}
