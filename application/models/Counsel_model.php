<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of counsel_model
 *
 * @author abert
 */
class Counsel_model extends CI_Model {

    //put your code here

    public function fetch_appointments() {
        $this->db->from('appointments');
        $this->db->join('student', 'appointments.student_id=student.student_id', 'inner');
        $this->db->where('appointments.university_id', $this->session->userdata('university'));
        return $this->db->get()->result();
    }

    public function fetch_counsellors() {
        
        $this->db->from('counsellors');
        $this->db->join('users', 'counsellors.user_id=users.user_id', 'inner');
        $this->db->where('counsellors.university_id', $this->session->userdata('university'));
        return $this->db->get()->result();
    }
    
    public function fetch_counsellors2() {
        $this->db->from('user_position');
        $this->db->join('users', 'user_position.user=users.user_id', 'inner');
        // $this->db->where('users.university_id', $this->session->userdata('university'));
        $this->db->where("user_position.pos_name",4);
        return $this->db->get()->result();
    }
    
    public function insert_counsellor($array){
        return $this->db->insert('counsellors',$array);
    }

    
}
