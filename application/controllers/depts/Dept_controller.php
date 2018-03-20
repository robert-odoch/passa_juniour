<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of dept_controller
 *
 * @author hp
 */
class Dept_controller extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('global/Global_model');
        $this->load->model('Sch_model');
        $this->load->model('UniversityModel');
        $this->load->model('users_model');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    //put your code here
    public function depts() {
        $data['pageName'] = "Departments";
        $data['depts'] = $this->Sch_model->fetch_depts();
        $data['btn'] = "Add department";
        $data['btn_link'] = "depts/dept_controller/add_department";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('depts/view_depts', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    public function add_department(){
          $data['dept'] = $this->Sch_model->dept_details($dept_id);
        $data['schools'] = $this->Sch_model->fetch_schools();
        $data['pageName'] = "Departments";
        $data['sub_sub_page'] = "add department";
        $data['sub_page'] = '<a href="' . base_url("depts/dept_controller/depts") . '">Back</a>';
        $data['formBtn'] = "add department";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('depts/add_dept', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_depts() {
        $data['schools'] = $this->Sch_model->fetch_schools();
        $data['pageName'] = "Departments";
        $data['sub_page'] = "upload departments";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('depts/upload_depts', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function uploadDepts() {
        $success = $this->Sch_model->upload_depts();
        if ($success) {
            $this->session->set_flashdata('msg', "departments Uploaded successfully");
            redirect('depts/dept_controller/depts');
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again");
            redirect('depts/dept_controller/add_depts');
        }
    }

    public function editDept($dept_id) {
        $data['dept'] = $this->Sch_model->dept_details($dept_id);
        $data['schools'] = $this->Sch_model->fetch_schools();
        $data['pageName'] = "Departments";
        $data['sub_sub_page'] = "update department";
        $data['sub_page'] = '<a href="' . base_url("depts/dept_controller/depts") . '">Back</a>';
        $data['formBtn'] = "update department";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('depts/add_dept', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function save_dept() {
        $id = $this->input->post('id');
        $data = array(
            'dept' => $this->input->post('dept'),
            'school_id' => $this->input->post('school'),
            'university_id'=>$this->session->userdata('university')
        );
        if ($id != null) {
            $success = $this->Sch_model->update_dept($data, $id);
              $this->session->set_flashdata('msg', "deptment updated successfully");
        }else{
             $this->Dept_model->insertDept($data);
               $this->session->set_flashdata('msg', "deptment inserted successfully");
        }
      
        redirect('depts/dept_controller/depts');
    }

    public function deleteDept($dept_id) {
        $success = $this->Sch_model->delete_dept($dept_id);
        if ($success) {
            echo json_encode(array('success' => true));
        }
    }

    public function dept_users($school_id) {
        $data['dept_users'] = $this->Sch_model->dept_users($school_id);
        $data['pageName'] = "School";
        $data['sub_sub_page'] = "School staff";
        $data['btn'] = "Add school staff";
        $data['btn_link'] = "depts/dept_controller/add_departmentStaff/" . $school_id;
        $data['sub_page'] = '<a href="' . base_url("depts/dept_controller/schools") . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('depts/dept_staff', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function deleteStaff($user_id) {
        $success = $this->Sch_model->delete_deptStaff($user_id);
        if ($success) {
            echo json_encode(array('status' => true));
        }
    }

    public function add_departmentStaff($school_id) {
        $data['deptal_users'] = $this->Sch_model->fetch_departmentalUsers();
        $data['pageName'] = "Departments";
        $data['sub_sub_page'] = "department staff";
        $data['dept_id'] = $school_id;
        $data['sub_page'] = '<a href="' . base_url("depts/dept_controller/dept_users/" . $school_id) . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('depts/add_deptStaff', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submit_staff() {
        $staff_id = $this->input->post('staff'); //
        $school_id = $this->input->post('dept_id');
        $success = $this->Sch_model->insert_staff($staff_id, $school_id);
        //update user now under dept
        $this->users_model->user_dept_status($staff_id);
        if ($success) {
            $this->session->set_flashdata('msg', "school staff member added successfully");
        } else {
            $this->session->set_flashdata('msg', "Error has occuried please try again");
        }
        redirect("depts/dept_controller/dept_users/" . $school_id);
    }

    public function dept_courses($dept_id) {
        $data['dept_courses'] = $this->Sch_model->fetch_departmentalCourses($dept_id);
        $data['pageName'] = "Department";
        $data['sub_sub_page'] = "Department Courses";
//        $data['btn'] = "Add department course";
        $data['btn_link'] = "depts/dept_controller/add_departmentCourse/" . $dept_id;
        $data['sub_page'] = '<a href="' . base_url("depts/dept_controller/depts") . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('depts/dept_courses', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_departmentCourse($dept_id) {
        $data['deptal_courses'] = $this->Sch_model->fetch_Courses();
        $data['pageName'] = "Departments";
        $data['sub_sub_page'] = " add department Courses";
        $data['dept_id'] = $dept_id;
        $data['sub_page'] = '<a href="' . base_url("depts/dept_controller/dept_courses/" . $dept_id) . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('depts/add_deptCourses', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitDeptCourses() {
        $courses = $this->input->post('my-select[]');
        $dept_id = $this->input->post('dept_id');
        foreach ($courses as $value) {
            $data['dept_id'] = $this->input->post('dept_id');
            $data['course_id'] = $value;
            $this->db->insert('dept_courses', $data);
        }
        $this->session->set_flashdata('msg', "Department courses added successfully");
        redirect('depts/dept_controller/dept_courses/' . $dept_id);
    }

    public function deleteDeptCourse($course_id) {

        $success = $this->Sch_model->deleteDepartmentCourse($course_id);
        if ($success) {
            echo json_encode(array('status' => TRUE));
        }
    }

    

    
    
}
