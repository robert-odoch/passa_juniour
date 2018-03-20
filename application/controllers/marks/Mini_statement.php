<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Mini_statement
 *
 * @author hp
 */
class Mini_statement extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('MarksModel');
        $this->load->model('global/Global_model');
        $this->load->model('courses_model');
        $this->load->model('IntakeModel');
        $this->load->model('students_model');
        $this->load->model('grade_model');
        $this->load->model('UniversityModel');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function generate_statement() {
        $data['page'] = '<a href="' . base_url("marks/mini_statement/fetch_statement") . '">Back</a>';
        $course_id = $this->input->post('course_id');
        $academic_year = $this->input->post('academic_year');
        $semester = $this->input->post('semester');
        $reg_no = $this->input->post('registration_no');
        $array = array(
            'course_course_id' => $course_id,
            'academic_years_year_id' => $academic_year,
            'semesters_semester_id' => $semester,
            'reg_number' => $reg_no
        );
        $data['r_year'] = $academic_year;
        $data['r_sem'] = $semester;
        $data['r_course'] = $course_id;
        $str = str_replace("\\", '-', $this->input->post('registration_no'));
        $name = str_replace(array("-", "/"), "-", $this->input->post('registration_no'));
        $data['r_reg'] = $name;
        $level = $this->courses_model->fetchCourse($course_id);
        $grading = $this->grade_model->filter_grading($level->level);

        $data['year'] = $this->IntakeModel->fetch_academic_year($this->input->post('academic_year'));
        $data['semester'] = $this->IntakeModel->fetch_semester($this->input->post('semester'));
        $data['student'] = $this->students_model->fetch_student_details($this->input->post('registration_no'));
        $data['grading'] = $grading;
        $data['marks'] = $this->MarksModel->fetch_single_statement($array);
        $data['pageName'] = "Mini statements";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('marks/single_statement', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function fetch_statement() {
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['study_year'] = $this->IntakeModel->fetch_study_years();
        $data['intakes'] = $this->IntakeModel->fetch_intakes();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['pageName'] = "Mini statements";
        $data['page'] = "";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('marks/ministatement', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

}
