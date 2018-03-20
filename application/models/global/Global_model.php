<?php

if (!defined('BASEPATH')) {

    exit('No direct script access allowed');
}

class Global_model extends CI_Model {

    public function __construct() {

        parent::__construct();
        $this->load->database();
    }

    function fecth_menu($usergroupid) {
        $fullMenu = array();

        $this->db->select('menu_assignments.*,menu_assignments.menu_id as ami,menu.*,menu.menu_class', false);
        $this->db->from('menu_assignments');
        $this->db->join('menu', 'menu_assignments.menu_id = menu.menu_id and menu.status=\'0\'', 'left outer');
        $this->db->where('menu_assignments.user_group_id', $usergroupid);
          $this->db->where('menu_assignments.status',0);
        $this->db->order_by('menu.menu_name');
        $query_result = $this->db->get();
        $menures = $query_result->result();

        foreach ($menures as $key) {
            $fullSubMenus = array();
            if ($this->has_sub_menus($key->ami)) {
                $submenures = $this->get_sub_menus($key->ami);
                foreach ($submenures as $row) {
                    $submenu = array(
                        'subname' => $row->sub_menu_name,
                        'sublink' => $row->sub_menu_link
                    );
                    array_push($fullSubMenus, $submenu);
                }
            }
            $menu = array(
                'menuname' => $key->menu_name,
                'menu_class' => $key->menu_class,
                'menulink' => $key->menu_link,
                'submenus' => $fullSubMenus
            );
            unset($fullSubMenus);
            array_push($fullMenu, $menu);
        }

        return json_encode($fullMenu);
    }

    function has_sub_menus($menuid) {
        $this->db->select('sub_menu.*', false);
        $this->db->from('sub_menu');
        $this->db->where('sub_menu.menu_id', $menuid);
        $query = $this->db->get();
        $retVal = ($query->num_rows() > 0) ? true : false;
        return $retVal;
    }

    function get_sub_menus($menuid) {
        $this->db->select('sub_menu.*', false);
        $this->db->from('sub_menu');
        $this->db->join('group_menu', 'sub_menu.sub_menu_id=group_menu.sub_menu_id', 'inner');
        $this->db->where('sub_menu.menu_id', $menuid);
        $this->db->where('group_menu.group_id', $this->session->userdata('user_group'));
		$this->db->where('sub_menu.status',0);
        $this->db->order_by('sub_menu.sub_menu_name');
        $query = $this->db->get();
        return $query->result();
    }

}
