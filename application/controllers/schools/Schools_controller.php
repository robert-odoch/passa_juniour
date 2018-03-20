<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of payments_controller
 *
 * @author steve
 */
class Schools_controller extends MY_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('global/Global_model');
        $this->load->model('Sch_model');
        $this->load->model('UniversityModel');
        $this->load->model('users_model');
        $this->load->model('CRUD_model');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function index() {
        $data['pageName'] = "Schools";
        $data['btn'] = "Add New School";
        $data['btn_link'] = "schools/Schools_controller/add_school";
        $data['schools'] = $this->CRUD_model->getRecords('schools a left join school_classes b on(a.id=b.school_id)',array('a.*,count(b.school_id) as `count_classes`'),"where a._status='1' group by a.id");
        $data['content'] = $this->load->view('schools/schools', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_school() {
        $data['pageName'] = "Schools";
        $data['page'] = '<a href="' . base_url("schools/Schools_controller") . '">Back</a>';
        $data['sub_page'] = "Register School";
        $data['content'] = $this->load->view('schools/add_school', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function register_school() {
        $array = array(
            'name' => $this->input->post('school'),
        );
        $id = $this->input->post('id');
        $message = "";
        if ($id != null) {
            $success = $this->Sch_model->updateRecord('schools',$array, $id);
            $message = "school updated successfully";
        } else {
            $success = $this->CRUD_model->insert('schools',$array);
            $message = "school added successfully";
        }
        if ($success) {
            $this->session->set_flashdata('msg', $message);
        } else {
            $this->session->set_flashdata('msg', "Error has occuried please try again");
        }
        redirect("schools/Schools_controller");
    }

    public function editSchool($school_id) {
        $data['school'] = $this->Sch_model->school_details($school_id);
        $data['pageName'] = "Schools";
        $data['page'] = '<a href="' . base_url("schools/Schools_controller") . '">Back</a>';
        $data['sub_page'] = "Register School";
        $data['formBtn'] = "update school";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('schools/add_school', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function deleteSchool($school_id) {
        $success = $this->Sch_model->deleteSchool($school_id);
        echo $success;
    }

    public function school_subjects($sch_id) {
        $result = $this->CRUD_model->getRecord('schools', array('name'), "where id='" . $sch_id . "'");
        $data['pageName'] = $result->name;
        $data['classes']=$this->CRUD_model->getRecords('school_classes a left join schools b on(a.school_id=b.id and b._status=\'1\') left join classes c on(a.class_id=c.id and c._status=\'1\')',array('a._when_added','a.id','c.name'),"where a.school_id='".$sch_id."' and a._status='1'");
        $data['page'] = '<a href="' . base_url("schools/Schools_controller") . '">Back</a>';
         $data['btn'] = "Assign New class";
        $data['btn_link'] = "schools/Schools_controller/assign_newclass/".$sch_id;
        $data['content'] = $this->load->view('schools/view_depts', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function assign_newclass($schoo_id){
 $result = $this->CRUD_model->getRecord('schools', array('name'), "where id='" . $schoo_id . "'");
        $data['pageName'] = $result->name;
        $data['classes']=$this->CRUD_model->getRecords('classes',array('id','name')," where id not in(select class_id from school_classes where school_id='".$schoo_id."')");
        $data['page'] = '<a href="' . base_url("schools/Schools_controller/school_subjects/".$schoo_id) . '">Back</a>';
        $data['school_id']=$schoo_id;
        $data['content'] = $this->load->view('schools/add_school_classes', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_class() {
        $data['pageName'] = "Classes";
        $data['sub_sub_page'] = "add class";
        $data['sub_page'] = '<a href="' . base_url("schools/Schools_controller/depts") . '">Back</a>';
        $data['formBtn'] = "add class";
        $data['content'] = $this->load->view('schools/add_class', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_depts() {
        $data['schools'] = $this->Sch_model->fetch_schools();
        $data['pageName'] = "Departments";
        $data['sub_page'] = "upload departments";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('schools/upload_depts', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function uploadDepts() {
        $success = $this->Sch_model->upload_depts();
        if ($success) {
            $this->session->set_flashdata('msg', "departments Uploaded successfully");
            redirect('schools/Schools_controller/depts');
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again");
            redirect('schools/Schools_controller/add_depts');
        }
    }

    public function editDept($dept_id) {
        $data['dept'] = $this->Sch_model->dept_details($dept_id);
        $data['schools'] = $this->Sch_model->fetch_schools();
        $data['pageName'] = "Departments";
        $data['sub_sub_page'] = "update department";
        $data['sub_page'] = '<a href="' . base_url("schools/Schools_controller/depts") . '">Back</a>';
        $data['formBtn'] = "update department";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('schools/add_dept', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function save_class() {
        $data = array(
            'name' => $this->input->post('dept')
        );
        $this->CRUD_model->insert('classes',$data);
         $this->session->set_flashdata('msg', "class inserted successfully");
         redirect('schools/Schools_controller/classes');
    }

    public function deleteDept($dept_id) {
        $success = $this->Sch_model->delete_dept($dept_id);
        if ($success) {
            echo json_encode(array('success' => true));
        }
    }

    public function dept_users($school_id) {
        $data['staff'] = $this->CRUD_model->getRecords('users', array('name', 'user_id'), "where user_id not in (select user_id from dept_members)");
        $data['dept_users'] = $this->Sch_model->dept_users($school_id);
        $data['pageName'] = "School";
        $data['sub_sub_page'] = "School staff";
        $data['model_name'] = "Add school staff";
        $data['primary_id'] = $school_id;
        $data['sub_page'] = '<a href="' . base_url("schools/Schools_controller/schools") . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('schools/dept_staff', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function deleteStaff($user_id) {
        $success = $this->Sch_model->delete_deptStaff($user_id);
        if ($success) {
            echo json_encode(array('status' => true));
        }
    }

// 
    public function add_departmentStaff($school_id) {
        $data['deptal_users'] = $this->Sch_model->fetch_departmentalUsers();
        $data['pageName'] = "Departments";
        $data['sub_sub_page'] = "department staff";
        $data['dept_id'] = $school_id;
        $data['sub_page'] = '<a href="' . base_url("schools/Schools_controller/dept_users/" . $school_id) . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('schools/add_deptStaff', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submit_staff() {
        $staff_id = $this->input->post('staff'); //
        $school_id = $this->input->post('school_id');
        $success = $this->Sch_model->insert_staff($staff_id, $school_id);
        echo json_encode(array('status' => "staff added successfully"));
    }

    public function dept_courses($dept_id) {
        $data['dept_courses'] = $this->Sch_model->fetch_departmentalCourses($dept_id);
        $result = $this->CRUD_model->getRecord('depts', array('dept'), "where dept_id='" . $dept_id . "'");
        $data['pageName'] = $result->dept;
        $data['sub_sub_page'] = "Department Courses";
        $data['model_name'] = "Register Program";
        $data['primary_id'] = $dept_id;
        $data['btn_link'] = "schools/Schools_controller/add_departmentCourse/" . $dept_id;
        $data['sub_page'] = '<a href="' . base_url("schools/Schools_controller/depts") . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('schools/dept_courses', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_departmentCourse($dept_id) {
        $data['deptal_courses'] = $this->Sch_model->fetch_Courses();
        $data['pageName'] = "Departments";
        $data['sub_sub_page'] = " add department Courses";
        $data['dept_id'] = $dept_id;
        $data['sub_page'] = '<a href="' . base_url("schools/Schools_controller/dept_courses/" . $dept_id) . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('schools/add_deptCourses', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitDeptCourses() {

       $school_id= $this->input->post('school_id');
       $classes = $this->input->post('my-select[]');
        foreach ($classes as $value) {
            $data['class_id'] = $value;
            $data['school_id'] =$school_id;
            $this->CRUD_model->insert('school_classes', $data);
        }

       redirect('schools/Schools_controller/school_subjects/'.$school_id);
    }

    public function deleteDeptCourse($course_id) {

        $success = $this->Sch_model->deleteDepartmentCourse($course_id);
        if ($success) {
            echo json_encode(array('status' => TRUE));
        }
    }

     public function classes() {
         $data['btn'] = "Add New class";
        $data['btn_link'] = "schools/Schools_controller/add_class";
        $data['pageName'] = "Classes";
        $data['page'] = '<a href="' . base_url("schools/Schools_controller") . '">Back</a>';
        $data['class_data']=$this->CRUD_model->getRecords('classes',array('*'),"where _status='1'");
        $data['sub_page'] = "Register School";
        $data['content'] = $this->load->view('schools/classes', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }


    public function school_dashboard($school_id){
 $school_name=$this->CRUD_model->getRecord('schools',array('name'),"where _status='1' and id='".$school_id."'");
        $data['pageName']="".$school_name->name;
        $data['students']=$this->CRUD_model->getRecord('students',array('count(*) as `students`'),"where _status='1' and school_id='".$school_id."'");
     $data['school_users']=$this->CRUD_model->getRecord('school_users',array('count(*) as `users`'),"where _status='1' and school_id='".$school_id."'");
     $data['school_id']=$school_id;
     $data['users']=$this->CRUD_model->getRecords('users a left join user_group b on(a.id=b.name and b._status=\'1\') left join `groups` c on(b.`group`=c.id and c._status=\'1\') left join school_users d on(a.id=d.user_id)',array('a.name','a.email','a.phone_number','c.name as `group_name`','a._when_added'),"where a._status='1' and d.school_id='".$school_id."'");

    $data['content'] = $this->load->view('schools/dashboard', $data, true);
    $this->load->view('layout/_layout_main', $data);
    }
  
    public function add_user($school_id) {
       $school_name=$this->CRUD_model->getRecord('schools',array('name'),"where _status='1' and id='".$school_id."'");
        $data['pageName']="Register ".$school_name->name." User";
         $data['school_id']=$school_id;
        $data['page'] = '<a href="' . base_url("schools/Schools_controller/school_dashboard/".$school_id) . '">Back</a>';
        $data['sub_page'] = 'Add User';
        $data['groups']=$this->CRUD_model->getRecords('groups',array('*'),"where _status='1' and super='No'");
        $data['content'] = $this->load->view('usermgt/add_user', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

      public function submit_user() {
        $array = array(
            'name' => $this->input->post('name'),
            'email' => $this->input->post('email'),
            'phone_number' => $this->input->post('phone_number'),
            'password' => sha1("123456")
        );
        $school_id=$this->input->post('school_id');
        $group_id=$this->input->post('group');
       $last_inserted= $this->CRUD_model->insert('users',$array);
       $data_1=array('name'=>$last_inserted,'group'=>$group_id);
       //group user
        $this->CRUD_model->insert('user_group',$data_1);

        $data=array('school_id'=>$school_id,'user_id'=>$last_inserted);
       //school user
        $this->CRUD_model->insert('school_users',$data);
        $this->session->set_flashdata('msg', "User added successfully");
        redirect('schools/Schools_controller/school_dashboard/'.$school_id);
    }


}
