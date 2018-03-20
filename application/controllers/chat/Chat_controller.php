<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of chat_controller
 *
 * @author abert
 *///
class Chat_controller extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('Chat_model');
        $this->load->model('global/Global_model');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function show_groups() {
        $data['groups'] = $this->Chat_model->fetch_groups();
        $data['pageName'] = "Chat Groups";
        $data['btn'] = "Register chat group";
        $data['btn_link'] = "chat/chat_controller/register_group";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('chat/groups', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function register_group() {
        $data['pageName'] = "Chat Groups";
        $data['page'] = '<a href="' . base_url("chat/chat_controller/show_groups") . '">Back</a>';
        $data['sub_page'] = "Register Group";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('chat/add_group', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitGroup() {
        $array = array(
            'group_name' => $this->input->post('group_name'),
            'open' => 1,
            'university_id' => $this->session->userdata('university'),
            '_when_added' => date("Y-m-d-H-i-s")
        );

        $success = $this->Chat_model->submit_group($array);
        if ($success) {
            $this->session->set_flashdata('msg', "chat group created successfully");
            redirect('chat/chat_controller/show_groups');
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again");
            redirect('chat/chat_controller/register_group');
        }
    }

    public function view_members($group_id) {
        $data['members'] = $this->Chat_model->fetch_group_members($group_id);
        $row = $this->Chat_model->fetch_group_name($group_id);
        $data['pageName'] = "Chat Groups";
        $data['sub_page'] = $row->group_name;
        $data['page'] = '<a href="' . base_url("chat/chat_controller/show_groups") . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('chat/view_members', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function block_user($member_id) {
        $this->Chat_model->block_memeber($member_id);
        $this->db->select('group_group_id');
        $this->db->from('group_members');
        $this->db->where('member_id', $member_id);
        $query = $this->db->get()->row();
        $result = $this->Chat_model->fetch_group_members($query->group_group_id);

        $output = '';
        $count = 1;

        foreach ($result as $row) {
            $out_status = '';
            if ($row->active_user == 0) {
                $out_status .= ' <a class="text-success" href="#" onclick="blockUser(' . $row->member_id . ')" > 
                            <i class="fa fa-eye"> Block</i></a> ';
            } else {
                $out_status .= ' <a class="text-danger" href="#"  onclick="UnblockUser(' . $row->member_id . ')"> 
                            <i class="fa fa-eye-slash"> Blocked</i></a> ';
            }

            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->registration_number) . '</td>
       <td>' . ucwords($row->firstName) . '</td>
         <td>' . ucwords($row->lastName) . '</td> 
       <td>
            ' . $out_status . '

        </td>  
       </tr>
      ';
            $count++;
        }
        echo json_encode($output);
    }

    public function unblock_user($member_id) {
        $this->Chat_model->unblock_memeber($member_id);
        $this->db->select('group_group_id');
        $this->db->from('group_members');
        $this->db->where('member_id', $member_id);
        $query = $this->db->get()->row();
        $result = $this->Chat_model->fetch_group_members($query->group_group_id);

        $output = '';
        $count = 1;

        foreach ($result as $row) {
            $out_status = '';
            if ($row->active_user == 0) {
                $out_status .= ' <a class="text-success" href="#" onclick="blockUser(' . $row->member_id . ')" > 
                            <i class="fa fa-eye"> Block</i></a> ';
            } else {
                $out_status .= ' <a class="text-danger" href="#"  onclick="UnblockUser(' . $row->member_id . ')"> 
                            <i class="fa fa-eye-slash"> Blocked</i></a> ';
            }

            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->registration_number) . '</td>
       <td>' . ucwords($row->firstName) . '</td>
         <td>' . ucwords($row->lastName) . '</td> 
       <td>
            ' . $out_status . '

        </td>  
       </tr>
      ';
            $count++;
        }
        echo json_encode($output);
    }

}
