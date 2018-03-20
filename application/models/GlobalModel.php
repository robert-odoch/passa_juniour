<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of GlobalModel
 *
 * @author abert
 */
class GlobalModel extends CI_Model {

    //put your code 
    //
    function userProfile() {
        $this->db->from('staff');
        $this->db->where('user_id', $this->session->userdata('user_id'));
        return $this->db->get()->row();
    }

    public function updateProfile($data) {
        $this->db->where('user_id', $this->session->userdata('user_id'));
        return $this->db->update('staff', $data);
    }

    public function userSettings() {
        $this->db->from('authetication');
        $this->db->where('staff_user_id', $this->session->userdata('user_id'));
        return $this->db->get()->row();
    }

    public function updateSettings($username, $newPassword) {
        $data['username'] = $username;
        $data['password'] = $newPassword;
        $this->db->where('staff_user_id', $this->session->userdata('user_id'));
        return $this->db->update('authetication', $data);
    }

//count the unread complaints
    function count_unread_complaints() {
        $this->db->from('complaints');
        $this->db->join('student', 'complaints.student_student_id=student.student_id', 'LEFT');
        $this->db->where('student.universities_university_id', $this->session->userdata('university_id'));
        $this->db->where('_status', 0);
        $query = $this->db->get();
        return $query->num_rows();
    }

    function fetch_assignedMenu() {
        $this->db->from('menu_assignments');
        $this->db->join('positions', 'menu_assignments.user_group_id=positions.position_id', 'LEFT');
        $this->db->join('menu', 'menu_assignments.menu_id=menu.menu_id', 'LEFT');
        $this->db->where('menu_assignments.university_university_id', $this->session->userdata('university_id'));
        $this->db->where('positions.position_university_id', $this->session->userdata('university_id'));
        $query = $this->db->get()->result();
        return $query;
    }

    function ckeckMenu($data) {
        $this->db->from('menu_assignments');
        $this->db->where($data);
        $query = $this->db->get();
        return $query->num_rows();
    }

    function insertAssignMenu($data) {
        return $this->db->insert('menu_assignments', $data);
    }

}
