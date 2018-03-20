<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Developer extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('developer/Developer_model');
        $this->load->helper('form');
        $this->load->library('session');
        $this->load->model('global/Global_model');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function index() {
        $data['menuselect'] = $this->Developer_model->get_menus();
        $data['page'] = 'Developer ';
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('developer/developer_view', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    function get_main_menus() {
        $result = $this->Developer_model->get_menus();
        $html = '<option value="">--Select Menu--</option>';
        foreach ($result as $row) {
            $html .= '<option value ="' . $row->menu_id . '">' . $row->menu_name . '</option>';
        }
        echo json_encode($html);
    }

    function add_main_menu() {
        $data = array(
            'menu_name' => $this->input->post('name'),
            'menu_link' => '#'
        );
        if ($this->Developer_model->register_menu($data)) {
            $this->get_main_menus();
        }
    }

    function add_sub_menu() {
        $data = array(
            'sub_menu_name' => $this->input->post('name'),
            'sub_menu_link' => $this->input->post('link'),
            'menu_id' => $this->input->post('menu')
        );
        if ($this->Developer_model->register_submenu($data)) {
            $this->get_main_menus();
        }
    }

}
