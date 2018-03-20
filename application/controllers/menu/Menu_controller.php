<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of menu_controller
 *
 * @author abert
 */
class Menu_controller extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('menu/menu_model');
        $this->load->model('global/Global_model');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    function assign_menus() {
        $data['pageName'] = 'Menu Management';
        $data['main_link'] = "Assign User Menu";
        $data['menudata'] = $this->menu_model->view_user_menus();
        $data['usergroups'] = $this->menu_model->fetch_user_groups();
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('menu/assign_menus', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    function load_user_unassigned($usergroup) {
        $result = $this->menu_model->view_unassigned_menus($usergroup);
        $html = '<option value="">--Select Menu--</option>';
        foreach ($result as $row) {
            $html .= '<option value ="' . $row->menu_id . '">' . $row->menu_name . '</option>';
        }
        echo json_encode($html);
    }

    function load_all_menu_data() {
        $result = $this->menu_model->view_user_menus();
        $output = '';
        $count = 1;
        foreach ($result as $menu) {
            $output .= '
      <tr>
      <td>' . ucwords($count) . '</td>
      <td>' . ucwords($menu->group_name) . '</td>
      <td>' . ucwords($menu->menu_name) . '</td>
      <td><a href="#" onclick="unassign_menu(' . $menu->assignmet_id . ')"><i class="fa fa-trash-o fa-fw"></i></a> </td>
      </tr>
      ';
            $count++;
        }
        echo json_encode($output);
    }

    public function assigned() {
        $data['pageName'] = 'Menu Management';
        $data['page'] = "Users Menu";
        $data['sub_page'] = "Main Menus";
        $data['main_link'] = "Assign User Menu";
        $data['menudata'] = $this->menu_model->view_user_menus();
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('menu/assigned_menus', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    public function group_menu($group_id){
        $data['pageName'] = 'Menu Management';
        $data['page'] = "Users Menu";
        $data['sub_page'] = "Main Menus";
        $data['main_link'] = "Assign User Menu";
        $group_menu = $this->menu_model->fetch_menus($group_id);
        print_r($group_menu);
        // $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        // $data['content'] = $this->load->view('menu/group_menus', $data, true);
        // $this->load->view('layout/_layout_main', $data);
    }

    public function sub_menus($assignmet_id, $group_id, $menu_id) {
        $row = $this->db->where('menu_id', $menu_id)->get('menu')->row();
        $data['pageName'] = $row->menu_name;
        $data['page'] = '<a href="' . base_url("menu/menu_controller/assigned") . '">Back</a>';
        $data['sub_page'] = "Users SubMenu";
        $data['group_id'] = $group_id;
        $data['assignment_id'] = $assignmet_id;
        $data['menudata'] = $this->menu_model->fetch_sub_menus($assignmet_id);
        $data['unassigned_sub_menu'] = $this->menu_model->unassigned_sub_menus($assignmet_id, $group_id);
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('menu/sub_menus', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    function assign_menu_to_user() {
        $data = array(
            'menu_id' => $this->input->post('menu'),
            'user_group_id' => $this->input->post('user_group')
        );
        if ($this->menu_model->assign_menus($data)) {
            $this->load_all_menu_data();
        }
    }

    public function assign_submenu_to_user() {
        $assignmet_id = $this->input->post('assignment_id');
        $data = array(
            'sub_menu_id' => $this->input->post('sub_menu'),
            'group_id' => $this->input->post('group_id'),
            'menu_assigned_id' => $assignmet_id
        );
        if ($this->menu_model->assign_submenus($data)) {
            $this->load_all_submenu_data($assignmet_id);
        }
    }

    function unassign_menu_from_users($id) {
        if ($this->menu_model->un_assing_menu($id)) {
            $this->load_all_menu_data();
        }
    }

    public function unassign_submenu_from_users($id, $assign_id) {
        if ($this->menu_model->un_assing_submenu($id)) {
            // $this->load_all_submenu_data($assign_id);
            echo json_encode(array('status' => true));
        }
    }

    function load_all_submenu_data($assignmet_id) {
        $result = $this->menu_model->fetch_sub_menus($assignmet_id);
        $output = '';
        $count = 1;
        foreach ($result as $menu) {
            $output .= '
      <tr>
      <td>' . ucwords($count) . '</td>
      <td>' . ucwords($menu->sub_menu_id) . '</td>
      <td>' . ucwords($menu->sub_menu_name) . '</td>
      <td><a href="#" onclick="unassign_menu(' . $menu->sub_menu_id . ')"><i class="fa fa-trash-o fa-fw"></i></a> </td>
      </tr>
      ';
            $count++;
        }
        echo json_encode($output);
    }

}
