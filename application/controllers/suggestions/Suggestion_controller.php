<?php

/**
 * Description of suggestion_controller
 *
 * @author abert
 */
class Suggestion_controller extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('suggestions_model');
        $this->load->model('global/Global_model');
        $this->checkSession();
    }
    public function checkSession() {
        return parent::checkSession();
    }

    public function index() {
        $data['suggestions'] = $this->suggestions_model->fetch_suggestions();
        $data['pageName'] = "Suggestion Box";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('suggestions/view_suggestions', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function view_suggestion($suggestion_id) {
        $data['suggestion'] = $this->suggestions_model->fetch_suggestion_detail($suggestion_id);
        $data['pageName'] = "Suggestion Box";
        $data['page'] = '<a href="' . base_url("suggestions/suggestion_controller") . '">Back</a>';
        $data['sub_page'] = "Suggestion Details";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('suggestions/suggestion_details', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    //mark suggestion as read
    public function mark_suggesstion($suggestion_id) {
        $this->suggestions_model->mark_suggestion($suggestion_id);
        echo json_encode(array('status' => TRUE));
    }

    public function reply_suggesstion() {
        $reply = $this->input->post('reply'); //
        $id = $this->input->post('suggestion_id');
        $array = array(
            'suggestion_reply' => $reply,
            'suggestion_id' => $id,
            'user_id' => $this->session->userdata('user_id'),
            '_when_added' => date("Y-m-d-H-i-s")
        );
        $success = $this->suggestions_model->submitReply($array);
        if ($success) {
            $this->suggestions_model->mark_suggestion($id);
            $this->session->set_flashdata('msg', "suggesstion replied successfully");
            redirect('suggestions/suggestion_controller');
        } else {
            $this->session->set_flashdata('msg', "Error has happened try again please!!!");
            redirect('suggestions/suggestion_controller');
        }
    }

    public function delete_suggestion($sug_id){
        $result=  $this->suggestions_model->delete_sugestion($sug_id);
        echo json_encode($result);
    }
    
    public function read_suggestions() {
        $data['suggestions'] = $this->suggestions_model->fetch_read_suggestions();
        $data['pageName'] = "Suggestion Box";
        $data['page'] = "Read Suggestions";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('suggestions/read_suggestions', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function read_suggestion_detail($suggestion_id) {
        $data['suggestion'] = $this->suggestions_model->fetch_suggestion_detail($suggestion_id);
        $data['pageName'] = "Suggestion Box";
        $data['page'] = '<a href="' . base_url("suggestions/suggestion_controller/read_suggestions") . '">Back</a>';
        $data['sub_page'] = "Suggestion Details";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('suggestions/read_suggestion_details', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

}
