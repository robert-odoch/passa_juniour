<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Dashboard
 *
 * @author abert
 */
require_once APPPATH . 'core/Email.php';

class Dashboard extends MY_Controller {

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->model('AdminModel');
        $this->load->model('global/Global_model');
        $this->load->model('developer/Developer_model');
        $this->load->model('statisticsModel');
        $this->load->model('menu/menu_model');
        $this->checkSession();
        $this->load->model('CRUD_model');
      
    }

    public function checkSession() {
        return parent::checkSession();
    }


    public function index() {
       
    }
   public function super_dashboard(){
      $data['students'] = $this->CRUD_model->getRecord('students',array('count(id)'),"where _status='1' and school_id='".$this->session->userdata("USERMM_school")."'");
        $data['content'] = $this->load->view('admin/dashboard', $data, true);
        $this->load->view('layout/_layout_main', $data);
   }

   public function user_dashboard(){
     $data['students'] = $this->CRUD_model->getRecord('students',array('count(id)'),"where _status='1' and school_id='".$this->session->userdata("USERMM_school")."'");
        $data['content'] = $this->load->view('admin/dashboard', $data, true);
        $this->load->view('layout/_layout_main', $data);
   }



    private function systemAdmin() {
        $data['message'] = "";
        $data['page'] = "Statistics";
        $data['sub_page'] = "Super user";
        $data['students'] = $this->statisticsModel->students();
        $data['courses'] = $this->statisticsModel->courses();
        $data['unreadSuggestion'] = $this->statisticsModel->unreadSuggestion();
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('admin/dashboard', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    private function dept() {
        
    }

    public function universities() {
        $data['pageName'] = "Registered Universities";
        $data['universities'] = $this->AdminModel->show_universities();
        $data['btn'] = "Add University";
        $data['btn_link'] = "admin/dashboard/add_university";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('admin/universities', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_university() {
        $data['pageName'] = "Universities";
        $data['page'] = '<a href="' . base_url("admin/dashboard/universities") . '">Back</a>';
        $data['sub_page'] = 'Add University';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('admin/add_university', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitUniversity() {
        $success;
        $array = array(
            'short_name' => $this->input->post('shortName'),
            'university' => $this->input->post('university')
        );
        $id = $this->input->post('id');
        if ($id != null) {
            $success = $this->AdminModel->saveUniversityUpdate($array, $id);
            $this->session->set_flashdata('msg', "University updated successfully");
        } else {
            $success = $this->AdminModel->insert_university($array);
            $this->session->set_flashdata('msg', "University Added successfully");
        }

        if ($success) {

            redirect('admin/dashboard/universities');
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again");
            redirect('admin/dashboard/add_university');
        }
    }

    //show all the users in the university

    public function users($university_id) {
        //check for user groups
        $count = $this->AdminModel->check_user_groups($university_id);
        $details = $this->AdminModel->university_details($university_id);
        if ($count == 0) {
            //add user groups
            $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
            $data['pageName'] = $details->university;
            $data['sub_page'] = "Add User Group";
            $data['page'] = '<a href="' . base_url("admin/dashboard/universities") . '">Back</a>';
            $data['university_id'] = $university_id;
            $data['universities'] = $this->AdminModel->show_universities();
            $data['content'] = $this->load->view('admin/add_groups', $data, true);
            $this->load->view('layout/_layout_main', $data);
        } else {
            redirect('admin/dashboard/university_users/' . $university_id);
        }
    }

    public function add_group() {
        $details = $this->AdminModel->university_details($this->input->post('university_id'));
        $array = array(
            'group_name' => $details->short_name . " " . $this->input->post('group_name'),
            'university_id' => $this->input->post('university_id'),
            'system_controller' => $this->input->post('controller')
        );
        $lastInserted = $this->AdminModel->insert_group($array);
        //insert again department user group
        if ($lastInserted) {
            //check if the user group is university super user
            $group_supper = $this->AdminModel->check_user_group($lastInserted);
            if ($group_supper) {
                //fetch menu 
                $result = $this->menu_model->view_unassigned_menus($lastInserted);
                foreach ($result as $row) {
                    $insert_menu['menu_id'] = $row->menu_id;
                    $insert_menu['user_group_id'] = $lastInserted;
                    $this->AdminModel->assign_group_mennu($insert_menu);
                }
            }


            //insert departmental user group
            $other_data = array(
                'group_name' => 'Departmental',
                'university_id' => $this->input->post('university_id')
            );
            $this->AdminModel->insert_group($other_data);
            $this->session->set_flashdata('msg', "User Group added successfully");
            redirect('admin/dashboard/university_users/' . $this->input->post('university_id'));
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again");
            redirect('admin/dashboard/users/' . $this->input->post('university_id'));
        }
    }

    public function university_users($university_id) {
        $data['users'] = $this->AdminModel->fetch_users($university_id);
        $details = $this->AdminModel->university_details($university_id);
        $data['pageName'] = $details->university;
        $data['page'] = '<a href="' . base_url("admin/dashboard/universities") . '">Back</a>';
        $data['sub_page'] = "Users";
        $data['btn'] = "Add Users";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['btn_link'] = "admin/dashboard/add_users/" . $university_id;
        $data['content'] = $this->load->view('admin/university_users', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_users($university_id) {
        $data['groups'] = $this->AdminModel->fetch_university_groups($university_id);
        $details = $this->AdminModel->university_details($university_id);
        $data['pageName'] = $details->university;
        $data['page'] = '<a href="' . base_url("admin/dashboard/university_users/" . $university_id) . '">Back</a>';
        $data['sub_page'] = "Add Users";
        $data['university_id'] = $university_id;
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('admin/add_users', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submit_user() {
        $university_id = $this->input->post('university_id');
        ///first check if the email is taken already
        $email = $this->input->post('email');
        $array = array(
            'firstName' => $this->input->post('firstName'),
            'lastName' => $this->input->post('lastName'),
            'email' => $this->input->post('email'),
            'contact' => $this->input->post('contact'),
            'group_id' => $this->input->post('user_group'),
            'password' => sha1("123456")// $this->encryption->encrypt("123456")
        );
        $update_data = array(
            'firstName' => $this->input->post('firstName'),
            'lastName' => $this->input->post('lastName'),
            'email' => $this->input->post('email'),
            'contact' => $this->input->post('contact'),
            'group_id' => $this->input->post('user_group')
        );
        $success = false;
        $id = $this->input->post('id');
        if ($id != null) {
            $success = $this->AdminModel->update_user($update_data, $id);
            $message = "User updated successfull";
        } else {
            if ($this->AdminModel->check_email($email) == 0) {
                $success = $this->users_model->add_user($array);
                $message = "User Added successfull";
            } else {
                $message = "Sorry Email already exists";
            }
        }
        if ($success) {
            $this->session->set_flashdata('msg', $message);
            redirect('admin/dashboard/university_users/' . $university_id);
        } else {
            $this->session->set_flashdata('msg', $message);
            redirect('admin/dashboard/add_users/' . $university_id);
        }
    }

    public function editUser($user_id) {
        $user_details = $this->AdminModel->fetch_user_details($user_id);
        $data['user'] = $this->AdminModel->fetch_user_details($user_id);
        $data['groups'] = $this->AdminModel->fetch_university_groups($user_details->university_id);
        $details = $this->AdminModel->university_details($user_details->university_id);
        $data['pageName'] = $details->university;
        $data['page'] = '<a href="' . base_url("admin/dashboard/university_users/" . $user_details->university_id) . '">Back</a>';
        $data['sub_page'] = "Update User";
        $data['formBtn'] = "Update";
        $data['university_id'] = $user_details->university_id;
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('admin/add_users', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function deleteUser($user_id) {
        $this->AdminModel->dropUser($user_id);
        echo json_encode(array("status" => TRUE));
    }

    public function editUniversity($university_id) {
        $data['university'] = $this->AdminModel->university_details($university_id);
        $data['pageName'] = "Universities";
        $data['page'] = '<a href="' . base_url("admin/dashboard/universities") . '">Back</a>';
        $data['sub_page'] = 'Update University';
        $data['formBtn'] = "update";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('admin/add_university', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function deleteUniversity($university_id) {
        $this->AdminModel->dropUniversity($university_id);
        echo json_encode(array("status" => TRUE));
    }

    public function universitySuperUsers($university_id) {
        $data['users'] = $this->AdminModel->university_superusers($university_id);
        $this->load->view('admin/details', $data);
    }

    //only admin users type
    public function get_users() {
        $res = $this->AdminModel->userTypes();
        echo json_encode($res);
    }

    //register university admin
    public function registerAdmin() {
        $data['firstName'] = $this->input->post('firstName');
        $data['lastName'] = $this->input->post('lastName');
        $data['email'] = $this->input->post('email');
        $data['contact'] = $this->input->post('contact');
        // return last inserted row
        $lastInserted = $this->AdminModel->insertAdmin($data);

        $details['users_user_id'] = $lastInserted;

        $selected_university_id = $this->input->post('university_id_selected');

        $details['universities_university_id'] = $selected_university_id;

        //create admin position for the university
        $user_position = $this->AdminModel->createAdminPosition($selected_university_id);
        $details['positions_position_id'] = $user_position;

        //assgin position to the user
        //insert now in the staff details table
        $this->AdminModel->insertStaffDetails($details);

        //auto generate password
        $password = chr(mt_rand(97, 122)) . mt_rand(0, 9) . chr(mt_rand(97, 122)) . mt_rand(10, 99) . chr(mt_rand(97, 122)) . mt_rand(100, 999);

        // admin group id
        $login['auth_type_auth_type_id'] = $this->input->post('userType');
        $login['username'] = $this->input->post('email');
        $login['password'] = sha1("123456"); //"123456";
        $login['staff_user_id'] = $lastInserted;

        //insert into authecation  table
        $this->AdminModel->insertAuth($login);

        //assign user menu to the system university admin

        $menu_return = $this->Developer_model->get_menus();

        foreach ($menu_return as $menu_r) {
            //insert into the assign menu table
            $query_res['menu_id'] = $menu_r->menu_id;
            $query_res['user_group_id'] = $user_position;
            $query_res['university_university_id'] = $selected_university_id;
            $this->AdminModel->assign_adminMenu($query_res);
        }


        //send an email to the user(username and password)
        // $sendEmail = new Email();
        //$sentMail = $sendEmail->send($this->input->post('email'), "welcome to the results system ");
//        if ($sendEmail == true) {
//            echo json_encode(array('status' => TRUE));
//        } else {
//            echo json_encode($sentMail);
//        }
        echo json_encode(array('status' => TRUE));
    }

    public function university_banner($university_id) {
        $row = $this->db->query("select university from  universities where university_id='" . $university_id . "'")->row();
        $data['pageName'] = $row->university;
        $data['sub_page'] = "<a href=" . base_url("admin/dashboard/universities") . ">Back</a>";
        $data['sub_sub_page'] = "Banner";
        $data['university_id'] = $university_id;
        $data['banner'] = $this->AdminModel->fetch_banner($university_id);
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('admin/banner', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function upload_banner() {
        $config['upload_path'] = './upload/banners/';
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $config['max_size'] = 250000000;
        $this->load->library('upload', $config);
        $this->load->library('upload', $this->config);
        if ($this->upload->do_upload('userfile')) {
            $upload_data = $this->upload->data();
            $file_name = $upload_data['file_name'];
            $data2['full_path'] = $file_name;
        } else {
            $upload_data = $this->upload->data();
            $file_name = $upload_data['file_name'];
            $data2['full_path'] = $file_name;
        }

        $array = array(
            'banner' => $data2['full_path']
        );
        $this->AdminModel->save_banner($array, $this->input->post('university_id'));
        $this->session->set_flashdata('msg', "banner uploaded successfully");
        redirect('admin/dashboard/universities');
    }

    public function block_university($university_id) {
        $success = $this->AdminModel->block_university($university_id);
        if ($success) {
            echo json_encode(array('success' => TRUE));
        }
    }

    public function unblock_university($university_id) {
        $success = $this->AdminModel->unblock_university($university_id);
        if ($success) {
            echo json_encode(array('success' => TRUE));
        }
    }

    //university allow student registration status
    public function registration($university_id) {
        $data['registration_status'] = $this->AdminModel->university_registration_status($university_id);
        $data['pageName'] = "Universities";
        $data['page'] = '<a href="' . base_url("admin/dashboard/universities") . '">Back</a>';
        $data['sub_page'] = 'Allow student Registration';
        $data['university_id'] = $university_id;
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('admin/allow_registration', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    //updated forced payment
    public function update_status() {
        $data['_student_registration'] = $this->input->post('status');
        $university_id = $this->input->post('university_id');
        $success = $this->AdminModel->update_regitration_status($data, $university_id);
        if ($success) {
            $this->session->set_flashdata('msg', "Forced student payment status uploaded successfully");
        } else {
            $this->session->set_flashdata('msg', "Error has occured please try again!!");
        }

        redirect('admin/dashboard/universities');
    }
 

 
}
