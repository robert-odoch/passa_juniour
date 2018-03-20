<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of menu_model
 *
 * @author abert
 */
class Menu_model extends CI_Model {

    function fetch_user_groups() {
        $query = $this->db->where('university_id', $this->session->userdata('university'))->get('user_groups')->result();
        return $query;
    }

    public function view_user_menus() {
//        $university_id = $this->session->userdata('university');
//        $query = "select m.*, ug.*,ug.group_id as ugid,m.menu_id as mid ,ma.*,count(gm.group_menu_id) as count_sub_menus from menu_assignments ma left join menu m on(ma.menu_id=m.menu_id) LEFT join user_groups ug on(ma.user_group_id=ug.group_id) left JOIN sub_menu sm on(m.menu_id=sm.menu_id) left join group_menu gm on(sm.sub_menu_id=gm.sub_menu_id) where ug.university_id='$university_id' group by ma.assignmet_id";
//        $query_result = $this->db->query($query);
        $this->db->select('menu.*, menu_assignments.*, user_groups.*,menu.menu_id as mid, user_groups.group_id as ugid');
        $this->db->from('menu_assignments');
        $this->db->join('menu', 'menu_assignments.menu_id = menu.menu_id', 'left outer');
        $this->db->join('user_groups', 'menu_assignments.user_group_id = user_groups.group_id', 'left outer');
        $this->db->where('university_id', $this->session->userdata('university'));
        $query_result = $this->db->get();
        return $query_result->result();
    }
    
    
    public function assign_menus($data) {
        return ($this->db->insert('menu_assignments', $data)) ? true : false;
    }

    public function un_assing_menu($id) {
        $this->db->where('assignmet_id', $id);
        return $this->db->update('menu_assignments', array('status' => 1));
    }

    public function un_assing_submenu($id) {
        $this->db->where('group_menu_id', $id);
        return $this->db->delete('group_menu');
    }

    public function view_unassigned_menus($usergroup) {
        $query = "SELECT menu.* FROM menu WHERE menu_id !=13 && menu_id !=14  && menu.menu_id NOT IN (
      SELECT menu.menu_id FROM menu LEFT OUTER JOIN menu_assignments ON menu.menu_id = menu_assignments.menu_id WHERE menu_assignments.user_group_id =
      '$usergroup')";
        $sql = $this->db->query($query);
        return $sql->result();
    }

    public function fetch_sub_menus($assignmet_id) {
        $query = "select * from group_menu g left join sub_menu m on(g.sub_menu_id=m.sub_menu_id) where g.menu_assigned_id='" . $assignmet_id . "'";
        $sql = $this->db->query($query);
        return $sql->result();
    }

    public function unassigned_sub_menus($assignmet_id, $group_id) {
        $query = "SELECT sm.sub_menu_id,sm.sub_menu_name from menu m left join sub_menu sm on(m.menu_id=sm.menu_id) "
                . "left join menu_assignments ma on(m.menu_id=ma.menu_id)"
                . " where ma.user_group_id='$group_id' && ma.assignmet_id='$assignmet_id' && sm.sub_menu_id not in(SELECT gm.sub_menu_id "
                . "from group_menu gm WHERE gm.menu_assigned_id='$assignmet_id' && gm.group_id='$group_id' )";
        $sql = $this->db->query($query);
        return $sql->result();
    }

    public function assign_submenus($data) {
        return $this->db->insert('group_menu', $data);
    }
     public function fetch_menus($group__id){
       $query= $this->db->query("select * from menu m left join sub_menu s on(m.menu_id=s.menu_id and s.status='0' ) left join menu_assignments a on(m.menu_id=a.menu_id and a.status='0') left join group_menu g on(a.assignmet_id=g.menu_assigned_id) where m.status='0' and a.user_group_id='".$group_id."'");
        return $query->result();
    }

}
