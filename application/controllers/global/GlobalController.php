<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of University
 *
 * @author abert
 */
class GlobalController extends MY_Controller {

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->model('GlobalModel');
        $this->load->model('global/Global_model');
        $this->load->model('UniversityModel');
        $this->load->model('developer/Developer_model');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function profile() {
        $data = $this->GlobalModel->userProfile();
        echo json_encode($data);
    }

    public function updateProfile() {
        $data['firstName'] = $this->input->post('firstName');
        $data['lastName'] = $this->input->post('lastName');
        $data['email'] = $this->input->post('email');
        $data['contact'] = $this->input->post('contact');
        $this->GlobalModel->updateProfile($data);
        echo json_encode(array('status' => true));
    }

    public function settings() {
        $data = $this->GlobalModel->userSettings();
        echo json_encode($data);
    }

    public function updateSettings() {
        //main old password
        $password = $this->input->post('password');
        $username = $this->input->post('username');
        $oldPassword = $this->input->post('oldPassword');
        $newPassword = $this->input->post('newPassword');
        $confirmPassword = $this->input->post('confirmPassword');

        if ($newPassword == $confirmPassword) {
            if ($password == $oldPassword) {
                $this->GlobalModel->updateSettings($username, $newPassword);
                echo json_encode(TRUE);
            } else {
                echo json_encode("old password is wrong please try again");
            }
        } else {
            echo json_encode("new password not matching with confirm password");
        }
    }

    public function manageMenu() {
        $data['menu_assigned'] = $this->GlobalModel->fetch_assignedMenu();
        $data['positions'] = $this->UniversityModel->fetch_positions();
        $data['added_menu'] = $this->Developer_model->get_menus();
        $data['staff_menu'] = "active";
        $data['positions_menu'] = "active";
        $data['page'] = "Menu assigment";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_type_id'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('university/assign_menu', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    function submitMenu() {
        $data['user_group_id'] = $this->input->post('position');
        $data['menu_id'] = $this->input->post('menu');
        $data['university_university_id'] = $this->session->userdata('university_id');
        //check if the menu alreadly assigned
        $res = $this->GlobalModel->ckeckMenu($data);
        $array = array();
        if ($res) {
            $array['message'] = "Menu already assigned";
        } else {
            $this->GlobalModel->insertAssignMenu($data);
            $array['message'] = "Menu added successfully";
        }
        echo json_encode($array);
    }

}
