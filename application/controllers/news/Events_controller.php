<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Events_Controller
 *
 * @author abert
 */
require_once APPPATH . 'core/Constants.php';

class Events_Controller extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('global/Global_model');
        $this->load->model('NewsModel');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function index() {
        $data['events'] = $this->NewsModel->fetch_events($this->session->userdata('university'));
        $data['pageName'] = "Campus Events";
        $data['btn'] = "Add New Event";
        $data['btn_link'] = "news/events_controller/addEvent";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('news/campusEvents', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function addEvent() {
        $data['pageName'] = "Campus Events";
        $data['page'] = '<a href="' . base_url("news/events_controller") . '">Back</a>';
        $data['sub_page'] = "Add New Event";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('news/add_event', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitEvent() {
        $this->form_validation->set_rules('title', 'title', 'required');
        $this->form_validation->set_rules('detail', 'Event detail', 'required');
        $this->form_validation->set_rules('time_stamp', 'Event date', 'required');
        if ($this->form_validation->run() == TRUE) {
            $success;
            $id = $this->input->post('id');
            $array = array(
                'title' => $this->input->post('title'),
                'time'=>$this->input->post('time'),
                'venue'=>$this->input->post('venue'),
                'time'=>$this->input->post('time'),
                'event_detail' => $this->input->post('detail'),
                'time_stamp' => $this->input->post('time_stamp'),
                'university_university_id' => $this->session->userdata('university'),
                '_who_added' => $this->session->userdata('user_id'),
                '_when_added' => date('Y-m-d H:i:s'),
            );
            if ($id != null) {
                $success = $this->NewsModel->update_event($array, $id);
                $this->session->set_flashdata('msg', "Event updated successfully");
            } else {
                $success = $this->NewsModel->save_event($array);
                $this->session->set_flashdata('msg', "Event added successfully");
            }

            if ($success) {
                redirect('news/events_controller');
            } else {
                $this->session->set_flashdata('msg', "Error has occurried try again");
                redirect('news/events_controller/addEvent');
            }
        } else {
            $data = validation_errors();
            $this->session->set_flashdata('msg', $data);
            redirect('news/events_controller/addEvent');
        }
    }

    public function add_event() {
        $time_stamp = new Constants();
        $data['title'] = $this->input->post('event_title');
        $data['event_detail'] = $this->input->post('event_detail');
        $data['time_stamp'] = $this->input->post('time_stamp');
        $data['_when_added'] = $time_stamp->getDatetimeNow();
        $this->NewsModel->save_event($data);
        echo json_encode(array('status' => TRUE));
    }

    function edit_event($event_id) {
        $data['event'] = $this->NewsModel->fetch_eventDetails($event_id);
        $data['pageName'] = "Campus Events";
        $data['page'] = '<a href="' . base_url("news/events_controller") . '">Back</a>';
        $data['sub_page'] = "Update News Event";
        $data['formBtn'] = "Update";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('news/add_event', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    function deleteEvent($event_id) {
        $this->NewsModel->deleteEvent($event_id);
        echo json_encode(array('status' => TRUE));
    }

}
