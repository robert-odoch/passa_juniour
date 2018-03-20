<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of News_controller
 *
 * @author abert
 */
require_once APPPATH . 'core/Constants.php';
require_once APPPATH . '/../mobile/libs/gcm.php';

class News_controller extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('NewsModel');
        $this->load->model('global/Global_model');
        $this->load->model('AdminModel');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function index() {
        $data['news'] = $this->NewsModel->fetch_news($this->session->userdata('university'));
        $data['pageName'] = "Campus News";
        $data['sub_page'] = "All Campus news";
        $data['btn'] = "Add news";
        $data['btn_link'] = "news/news_controller/add_news";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('news/campusNews', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_news() {
        $data['pageName'] = "News";
        
        $data['page'] = '<a href="' . base_url("news/news_controller") . '">Back</a>';
        $data['sub_page'] = "Add News";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('news/addNews', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function categories() {
        $data['category'] = $this->NewsModel->fetch_news_categories($this->session->userdata('university'));
        $data['pageName'] = "News Categories";
        $data['btn'] = "Add news category";
        $data['sub_page'] = "News Categories";
        $data['btn_link'] = "news/news_controller/addCategory";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('news/categories', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function addCategory() {
        $data['pageName'] = "News";
        $data['page'] = '<a href="' . base_url("news/news_controller/categories") . '">Back</a>';
        $data['sub_page'] = "Add News category";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('news/addCategory', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function addNewsCategory() {
        $data['category_name'] = $this->input->post('cat_name');
        $data['university_university_id'] = $this->session->userdata('university_id');
        $this->NewsModel->submitCat($data);
        echo json_encode(array('status' => TRUE));
    }

    public function submitCategory() {
        $this->form_validation->set_rules('category', 'Category', 'required');
        if ($this->form_validation->run() == TRUE) {
            $config['upload_path'] = './upload/featured/';
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
                'category' => $this->input->post('category'),
                'university_id' => $this->session->userdata('university'),
                'featured_image' => $data2['full_path'],
            );

            $id = $this->input->post('id');
            if ($id != null) {
//            $success = $this->complaints_model->updateCategory($array, $id);
                $this->session->set_flashdata('msg', "Category updated successfully");
            } else {
                $success = $this->NewsModel->submitCat($array);
                $this->session->set_flashdata('msg', "Category added successfully");
            }

            if ($success) {
                redirect('news/news_controller/categories');
            } else {
                $this->session->set_flashdata('msg', "Error has occurried try again");
                redirect('news/news_controller/addCategory');
            }
        } else {
            $data = validation_errors();
            $this->session->set_flashdata('msg', $data);
            redirect('news/news_controller/addCategory');
        }
    }

    function submitNews() {
        $this->form_validation->set_rules('title', 'title', 'required');
        $this->form_validation->set_rules('news_detail', 'News detail', 'required');
        if ($this->form_validation->run() == TRUE) {
            $time = new Constants();
            $config['upload_path'] = './upload/news/';
            $config['allowed_types'] = 'jpg|jpeg|png|gif';
            $this->load->library('upload', $config);
            if (!$this->upload->do_upload('photo')) {
                echo $this->upload->display_errors();
            } else {
                $upload_data = $this->upload->data();
                $this->load->library('image_lib');
                // Set your config up
                $this->image_lib->initialize($config);
                $config['upload_path'] = './upload/news/' . $upload_data["file_name"];
                // $config['new_image'] = './upload/news/' . $upload_data["file_name"];
                $config['create_thumb'] = FALSE;
                $config['maintain_ratio'] = TRUE;
                $config['master_dim'] = 'width';
                $config['quality'] = '100';
                $config['width'] = 1260;
                $config['height'] = 645;
                $this->load->library('image_lib', $config);
                // $this->image_lib->resize();

                $config = array();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './upload/news/' . $upload_data["file_name"];
                $config['new_image'] = './upload/news/' . $upload_data["file_name"];
                $config['create_thumb'] = FALSE;
                $config['maintain_ratio'] = FALSE;
                $config['quality'] = '100';
                $config['x_axis'] = 0;
                $config['y_axis'] = 0;
                $config['width'] = 1260;
                $config['height'] = 645;
                $this->image_lib->initialize($config);
                $this->image_lib->clear();

                $image_data = $upload_data["file_name"];
            }
            $title = $this->input->post('title');
            $data['title'] = $title;
            $detail = $this->input->post('news_detail');
            $data['news_detail'] = $detail;
            $data['university_university_id'] = $this->session->userdata('university');
            $data['_when_added'] = $time->getDatetimeNow();
            $data['_who_added'] = $this->session->userdata('user_id');

            $news_id = $this->input->post('id');
            if ($news_id != null) {
                $this->NewsModel->UpdateNews($data, $news_id);
                $this->session->set_flashdata('msg', "News upadted successfully");
            } else {
                $gcm = new gcm();
                $res['data']['chat_room'] = "news";
                $res['data']['title'] = "Campus News Updates";
                $res['data']['message'] = $title;
                $ss = $gcm->sendMessage($this->AdminModel->studentTokens(), $res);
                // print_r($ss);
                //$data['image'] = $image_data;
                $this->NewsModel->submitNews($data);
                $this->session->set_flashdata('msg', "News added successfully");
            }
             redirect('news/news_controller');
        } else {
            $data = validation_errors();
            $this->session->set_flashdata('msg', $data);
            redirect('news/news_controller/add_news');
        }
    }

    function editNews($new_id) {
        $data['news'] = $this->NewsModel->edit_news($new_id);
        $data['category'] = $this->NewsModel->fetch_news_categories($this->session->userdata('university'));
       
        $data['pageName'] = 'News';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['formBtn'] = "Update";
        $data['page'] = '<a href="' . base_url("news/news_controller") . '">Back</a>';
        $data['sub_page'] = "Update News";
        $data['content'] = $this->load->view('news/addNews', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function deleteNews($news_id) {
        $this->NewsModel->delete_News($news_id);
        echo json_encode(array('status' => TRUE));
    }

}
