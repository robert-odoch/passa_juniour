<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of newPHPClass
 *
 * @author abert
 */
class AdminModel extends CI_Model {

    //put your code here
    public function __construct() {
        parent::__construct();
    }

    public function show_universities() {
        $this->db->from('universities');
        $this->db->where('status', 0);
        $this->db->order_by('university_id', 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function university_registration_status($university_id) {
        $this->db->select('_student_registration');
        $this->db->from('universities');
        $this->db->where('university_id', $university_id);
        $query = $this->db->get()->row();
        return $query;
    }

    public function update_regitration_status($data, $university_id) {
        $this->db->where('university_id', $university_id);
        return $this->db->update('universities', $data);
    }

    public function check_user_groups($university_id) {
        $this->db->where('university_id', $university_id);
        $query = $this->db->get('user_groups');
        return $query->num_rows();
    }

    public function insert_university($data) {
        return $this->db->insert('universities', $data);
    }

    public function assign_group_mennu($insert_menu) {
        return $this->db->insert('menu_assignments', $insert_menu);
    }

    public function university_details($university_id) {
        $this->db->from('universities');
        $this->db->where('university_id', $university_id);
        $query = $this->db->get();
        return $query->row();
    }

    public function fetch_university_groups($university_id) {
        $this->db->where('university_id', $university_id);
        return $this->db->get('user_groups')->result();
    }

    public function check_email($email) {
        $this->db->where('email', $email);
        $query = $this->db->get('users');
        return $query->num_rows();
    }

    public function check_user_group($group_id) {
        $this->db->where('group_id', $group_id);
        $this->db->where('system_controller', 1);
        $query = $this->db->get('user_groups');
        return $query->num_rows();
    }

    public function add_user($array) {
        return $this->db->insert('users', $array);
    }

    public function insert_group($array) {
        $this->db->insert('user_groups', $array);
        return $this->db->insert_id();
    }

    public function fetch_users($unversity_id) {
        $this->db->from('users');
        $this->db->join('user_groups', 'users.group_id=user_groups.group_id', 'inner');
        $this->db->where('user_groups.university_id', $unversity_id);
        $this->db->where('users.status', 0);
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_user_details($user_id) {
        $this->db->select('users.*,user_groups.*,user_groups.group_id as select_group');
        $this->db->from('users');
        $this->db->join('group_users', 'group_users.user=users.user_id', 'left');
        $this->db->join('user_groups', 'group_users.group=user_groups.group_id', 'left');
        $this->db->where('users.user_id', $user_id);
         
        $query = $this->db->get();
        return $query->row();
    }

    public function update_user($update_data, $id) {
        $this->db->where('user_id', $id);
        return $this->db->update('users', $update_data);
    }

    public function dropUser($user_id) {
        $this->db->where('user_id', $user_id);
        return $this->db->update('users', array('_status' => 1));
    }

    public function saveUniversityUpdate($data, $university_id) {
        $this->db->where('university_id', $university_id);
        return $this->db->update('universities', $data);
    }

    public function dropUniversity($university_id) {
        $data['university_id'] = $university_id;
        $this->db->where($data);
        return $this->db->update('universities', array('status' => 1));
    }

    public function university_superusers($university_id) {
//        $array = array('university_id' => $university_id);
//        $this->session->set_userdata($array);
        $this->db->from('staff');
        $this->db->join('staff_details', 'staff.user_id=staff_details.users_user_id', 'left');
        $this->db->where('universities_university_id', $university_id);
        return $this->db->get()->result();
    }

    public function userTypes() {
        $this->db->from('auth_types');
        $this->db->where('auth_type', 'admin');
        $query = $this->db->get();
        return $query->row();
    }

    public function insertAdmin($data) {
        $this->db->insert('staff', $data);
        return $this->db->insert_id();
    }

    public function insertStaffDetails($data) {
        return $this->db->insert('staff_details', $data);
    }

    public function insertAuth($data) {
        return $this->db->insert('authetication', $data);
    }

    //assign university admin menu
    function assign_adminMenu($query_res) {
        return $this->db->insert('menu_assignments', $query_res);
    }

    //create admin position for the user

    function createAdminPosition($selected_university_id) {
        $data['position_university_id'] = $selected_university_id;
        $data['position'] = "System Administrator";
        $this->db->insert('positions', $data);
        return $this->db->insert_id();
    }

    public function fetch_banner($university_id) {
        $query = $this->db->query("select banner,university from universities where university_id='" . $university_id . "'");
        return $query->row();
    }

    public function save_banner($array, $university_id) {
        $this->db->where('university_id', $university_id);
        $this->db->update('universities', $array);
    }

    public function block_university($university_id) {
        $this->db->where('university_id', $university_id);
        return $this->db->update('universities', array('_status' => 1));
    }

    public function unblock_university($university_id) {
        $this->db->where('university_id', $university_id);
        return $this->db->update('universities', array('_status' => 0));
    }

    public function studentTokens() {
        $this->db->select('token');
        $this->db->from('tokens');
        $this->db->join('student', 'tokens.student_student_id=student.student_id', 'left');
        $this->db->where('student.universities_university_id', $this->session->userdata('university'));
        $result = $this->db->get()->result();
        $tokens = array();
        foreach ($result as $row) {
            array_push($tokens, $row->token);
        }
        return $tokens;
    }

}
