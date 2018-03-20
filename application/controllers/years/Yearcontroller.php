<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of YearController
 *
 * @author abert
 */
require_once APPPATH . 'core/Constants.php';

class YearController extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('IntakeModel');
        $this->load->model('global/Global_model');
        $this->load->model('CRUD_model');
        $this->checkSession();

    }

    public function checkSession() {
        return parent::checkSession();
    }

    //other functions
    public function academicYears() {
        $data['pageName'] = "Terms";
        $data['btn'] = "Add New Term";
        $data['btn_link'] = "years/Yearcontroller/add_year";
        $data['terms']=$this->CRUD_model->getRecords('terms',array('*'),"where _status='1'");
        $data['content'] = $this->load->view('years/academic_years', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_year() {
        $data['pageName'] = "Terms";
        $data['page'] = '<a href="' . base_url("years/yearcontroller/academicYears") . '">Back</a>';
        $data['sub_page'] = "Register New Term";
        $data['content'] = $this->load->view('years/add_year', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitYear() {
        $this->form_validation->set_rules('year', 'Term', 'required');
        if ($this->form_validation->run() == TRUE) {
            $id = $this->input->post('id');
            $success;
            $array = array(
                'name' => $this->input->post('year'),
               
            );
            if ($id != null) {
                $success = $this->CRUD_model->updateRecord('terms',$array, $id);
                $this->session->set_flashdata('msg', "Term updated successfully");
            } else {
                $success = $this->CRUD_model->insert('terms',$array);
                $this->session->set_flashdata('msg', "term added successfully");
            }
            if ($success) {
                redirect('years/Yearcontroller/academicYears');
            } else {
                $this->session->set_flashdata('msg', "Error has occurried try again");
                redirect('years/yearcontroller/add_year');
            }
        } else {
            $data = validation_errors();
            $this->session->set_flashdata('msg', $data);
            redirect('years/yearcontroller/add_year');
        }
    }

    public function editAcademicYear($academic_year) {
        $data['year'] = $this->IntakeModel->fetch_academic_year($academic_year);
        $data['pageName'] = "Academic Years";
        $data['page'] = '<a href="' . base_url("years/yearcontroller/academicYears") . '">Back</a>';
        $data['sub_page'] = "Update Academic Year";
        $data['form_btn'] = "Update";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('years/add_year', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function deleteAcademicYear($academic_year_id) {
        $data['academic_year_id'] = $academic_year_id;
        $this->IntakeModel->deleteAcademicYear($data);
        echo json_encode(array('status' => TRUE));
    }

    public function Intakes() {
        $data['intakes'] = $this->CRUD_model->getRecords('levels',array('*'),"where _status='1'");
        $data['pageName'] = 'Education Levels';
        $data['btn'] = "Register New level";
        $data['btn_link'] = "years/Yearcontroller/add_intake";
        $data['content'] = $this->load->view('years/intakes', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_intake() {
        $data['pageName'] = 'Education Levels';
        $data['page'] = '<a href="' . base_url("years/yearcontroller/Intakes") . '">Back</a>';
        $data['sub_page'] = "Register Level";
        $data['content'] = $this->load->view('years/add_intake', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    function submitIntake() {
        $this->form_validation->set_rules('intake', 'intake', 'required');
        if ($this->form_validation->run() == TRUE) {
            $success;
            $id = $this->input->post('id');
            $array = array(
                'intake_name' => $this->input->post('intake'),
                'university_university_id' => $this->session->userdata('university'),
                '_who_added' => $this->session->userdata('user_id'),
                '_when_added' => date('Y-m-d H:i:s')
            );
            if ($id != null) {
                $success = $this->IntakeModel->updateIntake($array, $id);
                $this->session->set_flashdata('msg', "Intake updated successfully");
            } else {
                $success = $this->IntakeModel->saveIntake($array);
                $this->session->set_flashdata('msg', "Intake added successfully");
            }

            if ($success) {
                redirect('years/yearcontroller/Intakes');
            } else {
                $this->session->set_flashdata('msg', "Error has occurried try again");
                redirect('years/yearcontroller/add_intake');
            }
        } else {
            $data = validation_errors();
            $this->session->set_flashdata('msg', $data);
            redirect('years/yearcontroller/add_intake');
        }
    }

    function fetchIntake($intake_id) {
        $data['intake'] = $this->IntakeModel->fetch_IntakeDetails($intake_id);
        $data['pageName'] = 'INTAKES';
        $data['page'] = '<a href="' . base_url("years/yearcontroller/Intakes") . '">Back</a>';
        $data['sub_page'] = "Update Intake";
        $data['formBtn'] = "Update";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('years/add_intake', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    function deleteIntake($intake_id) {
        $this->IntakeModel->deleteIntake($intake_id);
        echo json_encode(array('status' => TRUE));
    }

}
