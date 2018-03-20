<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of complaint_controller
 *
 * @author abert
 */
class Complaint_controller extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('complaints_model');
        $this->load->model('global/Global_model');
        $this->load->model('courses_model');
        $this->load->model('CRUD_model');
//        $this->load->helper('helper_class');
        $this->checkSession();
    }
    
    public function checkSession() {
        return parent::checkSession();
    }
    
    //complaint categories
    public function categories() {
        $data['category'] = $this->complaints_model->fetch_complaint_categories();
        $data['pageName'] = "Complaint Categories";
        $data['btn'] = "Add Complaint Category";
        $data['btn_link'] = "complaints/complaint_controller/add_category";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('complaints/categories', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    
    public function add_category() {
        $data['pageName'] = "Complaint Categories";
        $data['page'] = '<a href="' . base_url("complaints/complaint_controller/categories") . '">Back</a>';
        $data['sub_page'] = "Add Complaint Category";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('complaints/add_category', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitCategory() {
        $array = array(
            'type' => $this->input->post('category'),
            'university_university_id' => $this->session->userdata('university'),
            '_who_added' => $this->session->userdata('user_id'),
            '_when_added' => date('Y-m-d H:i:s'),
        );

        $id = $this->input->post('id');
        if ($id != null) {
            $success = $this->complaints_model->updateCategory($array, $id);
            $this->session->set_flashdata('msg', "Category updated successfully");
        } else {
            $success = $this->complaints_model->add_complaint_category($array);
            $this->session->set_flashdata('msg', "Category added successfully");
        }

        if ($success) {

            redirect('complaints/complaint_controller/categories');
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again");
            redirect('complaints/complaint_controller/add_category');
        }
    }

    public function editCategory($category_id) {
        $data['category'] = $this->complaints_model->single_cagetegory_details($category_id);
        $data['pageName'] = "Complaint Categories";
        $data['page'] = '<a href="' . base_url("complaints/complaint_controller/categories") . '">Back</a>';
        $data['sub_page'] = "Update Complaint Category";
        $data['formBtn'] = "Update";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('complaints/add_category', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function pending_complaints() {
        $data['complaints'] = $this->CRUD_model->getRecords('general_complaints gc left join student s on(gc._who_added=s.student_id) left join courses e on(s.courses_course_id=e.course_id) left join depts f on(e.dept_id=f.dept_id) left join schools h on(f.school_id=h.school_id) left join complaint_status d on(gc.id=d.desc_name and d._who_added='.$this->session->userdata('user_id').')', array('gc.category','gc.id', 'gc.message', 'DATE_FORMAT(gc._when_added, \'%d-%M-%Y\') as `_when_added`','s.name','h.school_id','s.registration_number','d.viewed_status'),"order by gc.id desc");
        //check user position
        $data['courses'] = $this->courses_model->fetch_courses();
        $data["positions"]=$this->CRUD_model->getRecords('positions',array("id","pos_name"),"order by id desc");
        $data['pageName'] = "Inbox Complaints";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('complaints/view_pending', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function complaint_detail($id) {
           $data['pageName'] = "Reply complaint";
        $data['page'] = '<a href="' . base_url("complaints/complaint_controller/pending_complaints") . '">Back</a>';
        $data['pageName'] = "Complaint inbox";


        $data['complaint'] = $this->CRUD_model->getRecord('general_complaints a  left join student b on(a._who_added=b.student_id) left join study_year c on(a.study_year=c.year_id) left join semesters d on(a.semester=d.semester_id)', array('a.id','a.message','b.name','b.registration_number as `reg_no`','category','year as `study_year`','d.semester','attachment','a._when_added'), "where a.id='" . $id . "'");
        //insert as read
        $array=array(
            'desc_name'=>$id,
            '_who_added'=>$this->session->userdata('user_id'),
            'viewed_status'=>'read'
        );
        //check if already read
       $count= $this->CRUD_model->getRecord('complaint_status',array('id'),"where desc_name='".$id."' and _who_added='".$this->session->userdata('user_id')."'");
           if(count($count)==0){
                 $this->CRUD_model->insert('complaint_status',$array);
           }
         $data['complaints'] = $this->complaints_model->fetch_cleared_complaints();
       
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('complaints/pending_complaint_detail', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

  


    public function complaint_remarks($complaint_id){
      $result=$this->CRUD_model->getRecords('complaint_response a left join users b on(a._who_added=b.user_id) left join user_position c on(b.user_id=c.user) left join positions d on(c.pos_name=d.id)',
                array('a.message','d.pos_name','b.name'), "where complaint='" . $complaint_id . "' ");
      $html='';
     foreach ($result as $row):
      $html.= "<span><h3>" .$row['name']." ".$row['pos_name']."</h3><br>". $row['message'] . "</span><br>";
    endforeach;
     echo json_encode($html);

    }

    public function forward_complaint($complaint_id,$to_position){
        $comment=  $this->input->post('forward_comment');
        $data=array(
            "complaint"=>$complaint_id,
            "target"=>$to_position,
            "message_type"=>"forward"
        );
        
        $response_data=array(
           "complaint" =>$complaint_id,
            "message"=>$comment,
            "action"=>"forward",
            "forwarded_to"=>$to_position,
            "_when_added"=>date("Y-m-d H:i:s")
        );
        
        $result=$this->complaints_model->insert_in_tb("complaint_receiver",$data);
        $result2=$this->CRUD_model->insert("complaint_response",$response_data);
        
        echo json_encode($result2);
    }
    
    public function save_reply($id){
        
        $response_data=array(
           "complaint" =>$id,
            "message"=>  $this->input->post("reply"),
            "action"=>"reply",
            "_when_added"=> date("Y-m-d H:i:s")
        );
        $result2=$this->CRUD_model->insert("complaint_response",$response_data);
        
        echo json_encode($result2);
    }
    
    
    public function filter_pending($course_id) {
        $result = $this->complaints_model->filter_pending($course_id);
        $output = '';
        $count = 1;
        $progress = "";
        foreach ($result as $row) {
            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->type) . '</td>
        <td>' . ucwords(substr($row->complaint, 0, 40) . '... <span class="text-success"><a href="' . base_url("complaints/complaint_controller/complaint_view/" . $row->complaint_id) . '">Read More</a></span>') . '</td>  
         <td>' . ucwords($row->time_stamp) . '</td>      
         <td>
          <a class="text-success" href="' . base_url() . 'complaints/complaint_controller/complaint_view/' . $row->complaint_id . '" ><i class="fa fa-eye"> View Complaint</i></a>
          </td>
         </td>    
       </tr>
      ';
            $count++;
        }
        echo json_encode($output);
    }

    public function complaint_view($complaint_id) {
        $data['complaint'] = $this->complaints_model->fetch_complaint_detail($complaint_id);
        $data['pageName'] = "Pending Complaints";
        $data['page'] = '<a href="' . base_url("complaints/complaint_controller/pending_complaints") . '">Back</a>';
        $data['pageName'] = "Pending Complaint detail";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('complaints/pending_complaint_detail', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function reply_complaint($complaint_id){
         $data['complaint'] = $this->CRUD_model->getRecord('general_complaints a  left join student b on(a._who_added=b.student_id) left join study_year c on(a.study_year=c.year_id) left join semesters d on(a.semester=d.semester_id)', array('a.id','a.message','b.name','b.registration_number as `reg_no`','category','year as `study_year`','d.semester','attachment','a._when_added'), "where a.id='" . $complaint_id . "'");
         $data['pageName'] = "Reply complaint";
        $data['page'] = '<a href="' . base_url("complaints/complaint_controller/complaint_detail/".$complaint_id) . '">Back</a>';
        $data['pageName'] = "Reply Complaint";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['id']=$complaint_id;
        $data['content'] = $this->load->view('complaints/reply_complaint', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    
    
    
    public function send_reply() {
        $id=$this->input->post('id');
       $data=array(
        'message'=>$this->input->post('reply'),
        'complaint'=>$id,
       );
       $this->CRUD_model->insert('complaint_response',$data);
        redirect('complaints/complaint_controller/complaint_detail/'.$id);
    }

    public function cleared() {
        $data['complaints'] = $this->complaints_model->fetch_cleared_complaints();
        $data['pageName'] = "Cleared Complaints";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('complaints/view_cleared', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function filter_cleared($course_id) {
        $result = $this->complaints_model->filter_cleared($course_id);
        $output = '';
        $count = 1;
        $progress = "";
        foreach ($result as $row) {
            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->type) . '</td>
        <td>' . ucwords(substr($row->complaint, 0, 40) . '... <span class="text-success"><a href="' . base_url("complaints/complaint_controller/replied_complaint/" . $row->complaint_id) . '">Read More</a></span>') . '</td>  
         <td>' . ucwords($row->time_stamp) . '</td> 
        <td>' . ucwords($row->cleared_date) . '</td> 
         <td>
          <a class="text-success" href="' . base_url() . 'complaints/complaint_controller/replied_complaint/' . $row->complaint_id . '" ><i class="fa fa-eye"> View Complaint</i></a>
          </td>
         </td>    
       </tr>
      ';
            $count++;
        }
        echo json_encode($output);
    }

    public function replied_complaint($complaint_id) {
        $data['page'] = '<a href="' . base_url("complaints/complaint_controller/cleared") . '">Back</a>';
        $data['sub_page'] = "Compliant detail";
        $data['complaint'] = $this->complaints_model->fetch_replied_complaint($complaint_id);
        $data['pageName'] = "Cleared Complaints";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('complaints/replied_complaint', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

}
