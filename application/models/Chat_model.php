<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of chat_model
 *
 * @author abert
 */
class Chat_model extends CI_Model {

    public function fetch_groups() {
        $this->db->from('chatgroups');
        $this->db->where('university_id', $this->session->userdata("university"));
        $this->db->where('status', 0);
        $query = $this->db->get()->result();
        return $query;
    }

    public function fetch_group_members($group_id) {
        $this->db->select('student.*,group_members.*,group_members.status as active_user');
        $this->db->from('group_members');
        $this->db->join('student', 'group_members.student_student_id=student.student_id', 'inner');
        $this->db->where('group_group_id', $group_id);
        $query = $this->db->get()->result();
        return $query;
    }

    public function fetch_group_name($group_id) {
        $this->db->where('group_id', $group_id);
        $row = $this->db->get('chatgroups')->row();
        return $row;
    }

    public function submit_group($array) {
        return $this->db->insert('chatgroups', $array);
    }

    public function block_memeber($member_id) {
        $this->db->where('member_id', $member_id);
        return $this->db->update('group_members', array('status' => 1));
    }

    public function unblock_memeber($member_id) {
        $this->db->where('member_id', $member_id);
        return $this->db->update('group_members', array('status' => 0));
    }

}
