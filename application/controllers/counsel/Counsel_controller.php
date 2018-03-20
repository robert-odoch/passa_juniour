<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of counsel_controller
 *
 * @author abert
 */
class Counsel_controller extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('global/Global_model');
        $this->load->model('counsel_model');
        $this->load->model('users_model');
        $this->load->model('CRUD_model');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function index() {
        $data['appointments'] = $this->counsel_model->fetch_appointments();
        $data['pageName'] = "Appointments";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('counsel/view_appointments', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function counsellors() {
        $data['counsellors'] = $this->counsel_model->fetch_counsellors2();
        $data['pageName'] = "View Counsellors";
        $data['btn'] = "Add counsellor";
        $data['btn_link'] = "counsel/counsel_controller/add_consellor";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('counsel/view_counsellors', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_consellor() {
        $data['users'] = $this->users_model->fetch_users();
        $data['page'] = '<a href="' . base_url("counsel/counsel_controller/counsellors") . '">Back</a>';
        $data['pageName'] = "Counselling";
        $data['sub_page'] = "Add Counsellor";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('counsel/add_counsellor', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submit_counsellor() {
//        $array = array(
//            'user_id' => $this->input->post('counsellor'),
//            'university_id' => $this->session->userdata('university')
//        );
        $array = array(
            'user' => $this->input->post('counsellor'),
            'pos_name'=>4,
            
        );
        
        $success = $this->CRUD_model->insert("user_position",$array);
        if ($success) {
            $this->session->set_flashdata('msg', "counsellor added successfully");
            redirect('counsel/counsel_controller/counsellors');
        }
    }

    public function deleteCouncoil($user_id){
      $this->CRUD_model->deleteData('user_position',array('id'=>$user_id));
     echo json_encode(array('status'=>"counsellor removed successfully"));
    }

}
