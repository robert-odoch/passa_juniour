<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Time_table
 *
 * @author hp
 */
class Time_table extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('global/Global_model');
        $this->load->model('courses_model');
        $this->load->model('Table_model');
        $this->load->model('UniversityModel');
        $this->load->model('IntakeModel');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function index() {
        $data['time_table'] = $this->Table_model->fetch_time_table();
        $data['pageName'] = "Time Table";
        $data['btn'] = "Add Time table";
        $data['btn_link'] = "timetable/time_table/add_time_table";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('time_table/view_time_table', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function details($id, $course_id) {
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['study_year'] = $this->IntakeModel->fetch_study_years();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $course = $this->courses_model->fetchCourse($course_id);
        $data['pageName'] = $course->course;
        $data['page'] = '<a href="' . base_url("timetable/time_table") . '">Back</a>';
        $data['sub_page'] = "Time Table Details";
        $data['time_table'] = $this->Table_model->fetch_details($id);
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('time_table/details', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_time_table() {
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['study_year'] = $this->IntakeModel->fetch_study_years();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['pageName'] = "Time Table";
        $data['page'] = '<a href="' . base_url("timetable/time_table") . '">Back</a>';
        $data['sub_page'] = "Upload time table";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('time_table/add_time_table', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function upload_time_table() {
        $array=array(
             'course_id' => $this->input->post('course_id'),
             'study_year' => $this->input->post('study_year'),
             'semester_id' => $this->input->post('semester'),
             'study_period'=>$this->input->post('study_period'),
          );
        $check = $this->Table_model->check_course($array);
        if ($check == 0) {
            $config['upload_path'] = './upload/time_table/';
            $config['allowed_types'] = 'gif|jpg|png|pdf|doc';
            $config['max_size'] = 250000000;
            $config['max_width'] = 10240000;
            $config['max_height'] = 76800000;
            $this->load->library('upload', $config);
            $this->load->library('upload', $this->config);
            if ($this->upload->do_upload('userfile')) {
                $upload_data = $this->upload->data();
                $file_name = $upload_data['file_name'];
            } else {
                $upload_data = $this->upload->data();
                $file_name = $upload_data['file_name'];
            }

            $array = array(
                'course_id' => $this->input->post('course_id'),
                'study_year' => $this->input->post('study_year'),
                'semester_id' => $this->input->post('semester'),
                'university_id' => $this->session->userdata('university'),
                 'study_period'=>$this->input->post('study_period'),
                'time_table' => $file_name
            );
            $success = $this->Table_model->add_time_table($array);
            if ($success) {
                $this->session->set_flashdata('msg', "Time table added successfyully");
                redirect('timetable/time_table');
            }
        } else {
            $this->session->set_flashdata('msg', "course already has time table please update it!!!!");
            redirect('timetable/time_table');
        }
    }

    public function update() {
        $config['upload_path'] = './upload/time_table/';
        $config['allowed_types'] = 'gif|jpg|png|pdf|doc';
        $config['max_size'] = 250000000;
        $config['max_width'] = 10240000;
        $config['max_height'] = 76800000;
        $this->load->library('upload', $config);
        $this->load->library('upload', $this->config);
        if ($this->upload->do_upload('userfile')) {
            $upload_data = $this->upload->data();
            $file_name = $upload_data['file_name'];
        } else {
            $upload_data = $this->upload->data();
            $file_name = $upload_data['file_name'];
        }
        $course_id = $this->input->post('course_id');
        $array = array();
        if ($file_name != null) {

            $array = array(
                'study_year' => $this->input->post('study_year'),
                'semester_id' => $this->input->post('semester'),
                'study_period' => $this->input->post('study_period'),
                'time_table' => $file_name
            );
        } else {
            $array = array(
                'study_year' => $this->input->post('academic_year'),
                'semester_id' => $this->input->post('semester'),
                'study_period' => $this->input->post('study_period'),
            );
        }
        $success = $this->Table_model->update_time_table($array, $course_id);
        $this->session->set_flashdata('msg', "TimeTable Updated successfully");
        redirect('timetable/time_table');
    }

    public function delete_all_timetables(){
        $this->Table_model->delete_all_timetables(); 
        echo json_encode(array('status'=>true));
    }

}
