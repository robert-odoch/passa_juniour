<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of LoginModel
 *
 * @author abert
 */
class LoginModel extends CI_Model {

    //put your code here
    public function __construct() {
        parent::__construct();
    }

    function login($username, $password) {
        $this->db->select('users.*,groups.super');
        $this->db->from('users');
        $this->db->where('email', $username);
        $this->db->join('user_group','users.id=user_group.name','inner');
        $this->db->join('groups','user_group.group=groups.id','inner');
        $this->db->where('password', sha1($password));
        $query = $this->db->get();
        $result = $query->row();
        $url;
        if ($query->num_rows() > 0) {
            $data = array(
                'full_name' => $result->name,
                'MM_USERID' => $result->id,
                'URES_loggedin' => true,
            );
            $this->lastLogin($result->user_id);

            $this->session->set_userdata($data);
            if( $result->super=="Yes"){
                $url = "admin/dashboard/super_dashboard";  
            }else{
                $url = "admin/dashboard/user_dashboard";  
            }
              return $url; 
        }
        return false;
    }

    private function lastLogin($user_id) {
        $query = $this->db->query("update users set last_login = now() where id='" . $user_id."'");
    }

    public function assign_menus($data) {
        return ($this->db->insert('menu_assignments', $data)) ? true : false;
    }

    public function un_assing_menu($id) {
        $this->db->where('assignmet_id', $id);
        return $this->db->delete('menu_assignments');
    }

    public function view_user_menus() {
        $this->db->select('menu.*, menu_assignments.*, user_groups.*,menu.menu_id as mid, user_groups.group_id as ugid');
        $this->db->from('menu_assignments');
        $this->db->join('menu', 'menu_assignments.menu_id = menu.menu_id', 'left outer');
        $this->db->join('user_groups', 'menu_assignments.user_group_id = user_groups.group_id', 'left outer');
        $this->db->where('menu.status',0);
        $query_result = $this->db->get();
        return $query_result->result();
    }

    public function view_unassigned_menus($usergroup) {
        $query = "SELECT menu.* FROM menu WHERE menu.menu_id NOT IN (
      SELECT menu.menu_id FROM menu LEFT OUTER JOIN menu_assignments ON menu.menu_id = menu_assignments.menu_id WHERE menu_assignments.user_group_id =
      '$usergroup')";
        $sql = $this->db->query($query);
        return $sql->result();
    }

    function fetch_user_groups() {
        $query = $this->db->get('user_groups')->result();
        return $query;
    }

    public function check_status() {
        $this->db->where('_status', 0);
        $this->db->where('university_id', $this->session->userdata('university'));
        $query = $this->db->get('universities');
        return $query->num_rows();
    }

    public function deleteOldToken($user_id) {
        $this->db->where('session_user', $user_id);
        return $this->db->delete('sessions');
    }

    public function InsertNewtoken($data) {
        return $this->db->insert('sessions', $data);
    }

    public function UserSession($user_id) {
        $this->db->from('sessions');
        $this->db->where('session_user', $user_id);
        $count = $this->db->get()->row();
        return $count;
    }

}
