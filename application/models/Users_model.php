<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of users_model
 *
 * @author abert
 */
class users_model extends CI_Model {

    //put your code here

    public function fetch_user_groups() {
        $this->db->select('a.*,count(b.id)');
        $this->db->from('user_groups a');
        $this->db->join('group_users b','a.group_id=b.group','inner join');
        $this->db->where('university_id', $this->session->userdata('university'));
        $this->db->where('_status', 0);
        $this->db->group_by('a.group_id');
        $query = $this->db->get()->result();
        return $query;
    }

    
    
    
    public function fetch_group($group_id) {
        $this->db->from('user_groups');
        $this->db->where('group_id', $group_id);
        $query = $this->db->get()->row();
        return $query;
    }

    public function insert_group($array) {
        return $this->db->insert('user_groups', $array);
    }

    public function update_group($id, $array) {
        $this->db->where('group_id', $id);
        return $this->db->update('user_groups', $array);
    }

    public function delete_group($group_id) {
        $this->db->where('group_id', $group_id);
        return $this->db->update('user_groups', array('_status' => 1));
    }

    public function delete_user_from_group($group_id,$user_id){
        $this->db->where("group",$group_id);
        $this->db->where("user",$user_id);
        return $this->db->delete("group_users");
    }
    
    public function fetch_users() {
        $this->db->select('users.*,user_groups.*,user_groups.group_id as select_group');
        $this->db->from('users');
        $this->db->join('group_users', 'group_users.user=users.user_id', 'left');
        $this->db->join('user_groups', 'group_users.group=user_groups.group_id', 'left');
        
        $this->db->where('users._status', 0);
        return $this->db->get()->result();
    }

    public function add_user($array) {
        return $this->db->insert('users', $array);
    }

    public function user_dept_status($user_id) {
        $this->db->where('user_id', $user_id);
        return $this->db->update('users', array('dept_status' => 1));
    }

    public function check_password($old_password) {
        $this->db->from('users');
        $this->db->where('password', $old_password);
        $this->db->where('user_id', $this->session->userdata('user_id'));
        return $this->db->get()->row();
    }

    public function change_password($new_password) {
        $this->db->where('user_id', $this->session->userdata('user_id'));
        return $this->db->update('users', array('password' => $new_password));
    }

}
