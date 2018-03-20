<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of users_controller
 *
 * @author abert
 */
require_once APPPATH . 'core/Email.php';

class Users_controller extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('global/Global_model');
        $this->load->model('users_model');
        $this->load->model('AdminModel');
        $this->checkSession();
        $this->load->model('CRUD_model');
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function user_groups() {
        $data['pageName'] = 'User Management';
        $data['page'] = "User Groups";
        $data['btn'] = "Add User Group";
        $data['btn_link'] = "usermgt/users_controller/add_group";
        $data['usergroups'] = $this->CRUD_model->getRecords('user_groups a left join group_users b on(a.group_id=b.group)', array('a.group_id', 'a.group_name', 'count(b.id) as count_users'), " where a.university_id='" . $this->session->userdata('university') . "' and a._status='0'  group by a.group_id");
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/user_groups', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_group() {
        $data['pageName'] = 'User Management';
        $data['page'] = '<a href="' . base_url("usermgt/users_controller/user_groups") . '">Back</a>';
        $data['sub_page'] = "Add User Group";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/add_group', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submit_group() {
        $id = $this->input->post('id');
        $success = '';
        $array = array(
            'group_name' => $this->input->post('group_name'),
            'dept_user' => $this->input->post('dept_group'),
            'university_id' => $this->session->userdata("university"),
        );
        if ($id != null) {
            $success = $this->users_model->update_group($id, $array);
            $this->session->set_flashdata('msg', "User Group updated successfully");
        } else {
            $success = $this->users_model->insert_group($array);
            $this->session->set_flashdata('msg', "User Group added successfully");
        }

        if ($success) {
            redirect('usermgt/users_controller/user_groups');
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again");
            redirect('usermgt/users_controller/add_group');
        }
    }

    public function edit_group($group_id) {
        $data['pageName'] = 'User Management';
        $data['page'] = '<a href="' . base_url("usermgt/users_controller/user_groups") . '">Back</a>';
        $data['sub_page'] = "Update User Group";
        $data['formBtn'] = "Update group";
        $data['user_group'] = $this->users_model->fetch_group($group_id);
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/add_group', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function delete_grp($group_id) {
        $success = $this->users_model->delete_group($group_id);
        if ($success) {
            $this->session->set_flashdata('msg', "User Group Deleted Successfully");
            redirect('usermgt/users_controller/user_groups');
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again");
        }
    }
    
    public function users() {
        $data['users'] = $this->users_model->fetch_users();
        $data['pageName'] = 'User Management';
        $data['page'] = 'Users';
        $data['btn'] = "Add User";
        $data['btn_link'] = "usermgt/users_controller/add_user";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/users', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    
    public function add_user() {
        $data['pageName'] = 'User Management';
        $data['page'] = '<a href="' . base_url("usermgt/users_controller/users") . '">Back</a>';
        $data['sub_page'] = 'Add Users';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/add_user', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submit_user() {
        ///first check if the email is taken already
        $email = $this->input->post('email');
        $array = array(
            'name' => $this->input->post('firstName'),
//            'lastName' => $this->input->post('lastName'),
            'email' => $this->input->post('email'),
            'contact' => $this->input->post('contact'),
            'password' => sha1("123456")
        );
        $update_data = array(
            'name' => $this->input->post('firstName'),
//            'lastName' => $this->input->post('lastName'),
            'email' => $this->input->post('email'),
            'contact' => $this->input->post('contact'),
//            'group_id' => $this->input->post('user_group')
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
//           
        if ($success) {
            $this->session->set_flashdata('msg', $message);
            redirect('usermgt/users_controller/users');

            //send an email to the user(username and password)
            $sendEmail = new Email();
            $sentMail = $sendEmail->send("abertnamanya@gmail.com", "welcome to the results system ");
            if ($sendEmail == true) {
                // echo json_encode(array('status' => TRUE));
            } else {
                //  echo json_encode($sentMail);
            }
        } else {
            $this->session->set_flashdata('msg', $message);
            redirect('usermgt/users_controller/add_user');
        }
    }

    public function editUser($user_id) {
        $data['user'] = $this->AdminModel->fetch_user_details($user_id);
        $data['groups'] = $this->AdminModel->fetch_university_groups($this->session->userdata('university'));
        $data['pageName'] = "Users";
        $data['page'] = '<a href="' . base_url("usermgt/users_controller/users") . '">Back</a>';
        $data['sub_page'] = "Update User";
        $data['formBtn'] = "Update";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/add_user', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function change_password() {
        $data['pageName'] = 'User Profile';
        $data['page'] = 'Change User Password';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/change_password', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function update_password() {
        $old_password = $this->input->post('old_password');
        $new_password = $this->input->post('new_password');
        $confirm_password = $this->input->post('confirm_password');
        //check the old passwod
        $check_password = $this->users_model->check_password(sha1($old_password));
        if (count($check_password) > 0) {
//            $this->session->set_flashdata('msg', "password ok");
            if ($new_password == $confirm_password) {
                $this->users_model->change_password(sha1($new_password));
                $this->session->set_flashdata('msg', "Thank you password changed successfully");
            } else {
                $this->session->set_flashdata('msg', "please make sure that confirm and new password match");
            }
        } else {
            $this->session->set_flashdata('msg', "Sorry old passwords do not match!!!");
        }
        redirect('usermgt/users_controller/change_password');
    }

    public function positions() {
        $data['btn']="Add New Position";
        $data['btn_link']="usermgt/users_controller/add_postion";

        $data['positions'] = $this->CRUD_model->getRecords("positions a left join user_position b on(a.id=b.pos_name)", array('a.pos_name', 'a.id', 'count(b.id) as `users_count`'), " where _status='0' and university_id='" . $this->session->userdata('university') . "' group by a.id");
        $data['pageName'] = 'Position Management';
        $data['page'] = "Positions";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/positions', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    public function add_postion(){
        $data['pageName'] = 'Position Management';
        $data['page'] = "Add New Position";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/add_position', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    public function save_position(){
        $id=$this->input->post('id');
         $data=array(
            'pos_name'=>$this->input->post('pos_name'),
            'allow_fees_complaints'=>$this->input->post('titution'),
            'allow_exam_complaints'=>$this->input->post('results'),
            'university_id'=>$this->session->userdata('university')
        );

        if($id !=null){
            $this->CRUD_model->updateRecord('positions',$data,$id); 
             $this->session->set_flashdata('msg', "position  updated successfully");    
        }else{
            print_r($data);

            $this->CRUD_model->insert('positions',$data);
              $this->session->set_flashdata('msg', "position  added successfully");
       }
        redirect('usermgt/users_controller/positions');
    }
    public function edit_position($id){
        $data['formBtn']="Save updates";
     $data['position']=$this->CRUD_model->getRecord('positions',array('id','pos_name','allow_exam_complaints','allow_fees_complaints'),"where id='".$id."'");
         $data['pageName'] = 'Position Management';
        $data['page'] = "Update  Position";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/add_position', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    public function delete_pos($id){
        $data=array("_status"=>$id);
        $this->CRUD_model->updateRecord('positions',$data,$id);
       $this->session->set_flashdata('msg', "position  deleted successfully");
        redirect('usermgt/users_controller/positions');
    }

    public function position_users($id) {
        $data['position_users'] = $this->CRUD_model->getRecords("user_position a left join users b on(a.user=b.user_id and b._status='0') left join positions c on(a.pos_name=c.id)", array('b.name','a.id','b.email'), " where  c.university_id='" . $this->session->userdata('university') . "' and a.pos_name='" . $id . "'");
        $data['pageName'] = 'User Management';
        $result = $this->CRUD_model->getRecord('positions', array('pos_name'), "where id='" . $id . "'");
        $data['sub_page'] = "" . $result->pos_name;
        $data['page'] = '<a href="' . base_url("usermgt/users_controller/positions") . '">Back</a>';
        $data['btn'] = "Add Position user";
        $data['btn_link'] = "usermgt/users_controller/add_postionUser/" . $id;
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/position_users', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_postionUser($id) {
        $data['users'] = $this->CRUD_model->getRecords('users a', array("a.user_id", "a.name"), "where a._status='0' and a.user_id not in(select user from user_position) ");
        $result = $this->CRUD_model->getRecord('positions', array('pos_name'), "where id='" . $id . "'");
        $data['pageName'] = 'User Management';
        $data['sub_page'] = "" . $result->pos_name;
        $data['position_id'] = $id;
        $data['page'] = '<a href="' . base_url("usermgt/users_controller/position_users/" . $id) . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/assign_position', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitAssignedPos() {
        $array = array('user' => $this->input->post('user'), 'pos_name' => $this->input->post('position_id'));
        $success = $this->CRUD_model->insert('user_position', $array);
        if ($success) {
            $this->session->set_flashdata('msg', "User assigned position successfully");
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again ");
        }
        redirect('usermgt/users_controller/positions');
    }
    public function unassign_position($id){
        $this->CRUD_model->deleteData('user_position',array('id'=>$id));
         $this->session->set_flashdata('msg', "User position un-assigned successfully");
         redirect('usermgt/users_controller/positions');
    }

    public function assign_group($id) {
        $data['users'] = $this->CRUD_model->getRecords('users a', array("a.user_id", "a.name"), "where a._status='0' and a.user_id not in(select user from group_users) ");
        $result = $this->CRUD_model->getRecord('user_groups', array('group_name'), "where group_id='" . $id . "'");
        $data['pageName'] = 'User Management';
        $data['sub_page'] = "" . $result->group_name;
        $data['group_id'] = $id;
        $data['page'] = '<a href="' . base_url("usermgt/users_controller/group_users/" . $id) . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/assign_group', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function delete_from_group($grp_id,$user_id){
        $result = $this->users_model->delete_user_from_group($grp_id,$user_id);
        echo json_encode($result);
    }

    public function group_users($id) {
        $data['group_users'] = $this->CRUD_model->getRecords("group_users a left join users b on(a.user=b.user_id and b._status='0') left join user_groups c on(a.group=c.group_id)", array('b.name,b.user_id,c.group_id'), " where  c.university_id='" . $this->session->userdata('university') . "' and a.group='" . $id . "'");
        $result = $this->CRUD_model->getRecord('user_groups', array('group_name'), "where group_id='" . $id . "'");
        $data['pageName'] = 'User Management';
        $data['sub_page'] = "" . $result->group_name;
        $data['group_id'] = $id;
        $data['page'] = '<a href="' . base_url("usermgt/users_controller/user_groups") . '">Back</a>';
        $data['btn'] = "Add group user";
        $data['btn_link'] = "usermgt/users_controller/assign_group/" . $id;
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/group_users', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitAssignedGroup() {
        $array = array('user' => $this->input->post('user'), 'group' => $this->input->post('group_id'));
        $success = $this->CRUD_model->insert('group_users', $array);
        if ($success) {
            $this->session->set_flashdata('msg', "User assigned group successfully");
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again ");
        }
        redirect('usermgt/users_controller/user_groups');
    }

    public function exam_Invigilators(){
    $data['pageName'] = 'Exam Invigilators';
    $data['exam_invigilators']=$this->CRUD_model->getRecords('exam_invigilator a left join users b on(a.name=b.user_id)',array('a.id','b.name','email','contact'),"where a._status='1'");
     $data['users'] = $this->users_model->fetch_users();
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('usermgt/exam_invigilator', $data, true);
        $this->load->view('layout/_layout_main', $data);

    }

    public function save_invigilator(){
        $this->CRUD_model->insert('exam_invigilator',array('name'=>$this->input->post('user')));
        echo json_encode(array('status'=>"Record inserted successfully"));
    }

    public function removeInvigilator($id){
         $this->CRUD_model->deleteData('exam_invigilator',array('id'=>$id));
        echo json_encode(array('status'=>"Record deleted successfully"));
    }

}
