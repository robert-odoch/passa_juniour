<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of suggestions_model
 *
 * @author abert
 */
class Suggestions_model extends CI_Model {

    //put your code here

    public function fetch_suggestions() {
        $this->db->from('suggestion_box');
        $this->db->join('student', 'suggestion_box.student_student_id=student.student_id', 'inner');
        $this->db->where('university_university_id', $this->session->userdata('university'));
        $this->db->where('suggestion_box._status', 0);
        $this->db->order_by('suggestion_box_id','desc');
        $query = $this->db->get()->result();
        return $query;
    }

    public function fetch_read_suggestions() {
        $this->db->from('suggestion_box');
        $this->db->join('student', 'suggestion_box.student_student_id=student.student_id', 'inner');
        $this->db->where('university_university_id', $this->session->userdata('university'));
        $this->db->where('suggestion_box._status', 1);
        $query = $this->db->get()->result();
        return $query;
    }

    public function delete_sugestion($id){
        $this->db->where("suggestion_box_id",$id);
        return $this->db->delete("suggestion_box");
    }


    public function fetch_suggestion_detail($suggestion_id) {
        $query = $this->db->query("select * from suggestion_box where suggestion_box_id='" . $suggestion_id . "'");
        return $query->row();
    }

    public function mark_suggestion($suggestion_id) {
        $this->db->where('suggestion_box_id', $suggestion_id);
        return $this->db->update('suggestion_box', array('_status' => 1));
    }

    public function submitReply($array) {
        return $this->db->insert('suggestion_replies', $array);
    }

}
