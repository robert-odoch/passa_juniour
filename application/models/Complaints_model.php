<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of complaints_model
 *
 * @author abert
 */
class Complaints_model extends CI_Model {

    //put your code here
    //student complaint categories
    public function fetch_complaint_categories() {
        $this->db->from('complaint_types');
        $this->db->where('university_university_id', $this->session->userdata('university'));
        $query = $this->db->get();
        return $query->result();
    }

    public function single_cagetegory_details($category_id) {
        $this->db->from('complaint_types');
        $this->db->where('complaint_types_id', $category_id);
        $query = $this->db->get();
        return $query->row();
    }

    function add_complaint_category($data) {
        return $this->db->insert('complaint_types', $data);
    }

    function insert_in_tb($table,$data) {
        return $this->db->insert($table, $data);
    }
    
    public function updateCategory($data, $id) {
        $this->db->where('complaint_types_id', $id);
        return $this->db->update('complaint_types', $data);
    }

    public function fetch_pending_complaints() {
        $this->db->select('complaints.*,complaints._when_added as time_stamp,complaint_types.type');
        $this->db->from('complaints');
        $this->db->join('complaint_types', 'complaints.type_id=complaint_types.complaint_types_id', 'inner');
        $this->db->join('student', 'complaints.student_student_id=student.student_id', 'inner');
        $this->db->join('courses', 'student.courses_course_id=courses.course_id', 'inner');
        $this->db->where('complaint_types.university_university_id', $this->session->userdata('university'));
        $this->db->where('_status', 0);
        if ($this->session->userdata('dept_status') == 0):
        else:
            $this->db->where('dept_id', $this->session->userdata('dept_id'));
        endif;
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_pending_complaints2(){
        $this->db->select("gc.message,gc._when_added as time_stamp,gc._status");
        $this->db->from("general_complaints gc");
        $this->db->join("complaint_response cr","cr.complaint=gc.id","left");
        $this->db->where("cr.complaint","is not null");
        
        $query = $this->db->get();
        return $query->result();              
    }
    
    public function filter_pending($course_id) {
        $this->db->select('complaints.*,complaints._when_added as time_stamp,complaint_types.type');
        $this->db->from('complaints');
        $this->db->join('complaint_types', 'complaints.type_id=complaint_types.complaint_types_id', 'inner');
        $this->db->join('student', 'complaints.student_student_id=student.student_id', 'inner');
        $this->db->where('complaint_types.university_university_id', $this->session->userdata('university'));
        $this->db->where('_status', 0);
        $this->db->where('student.courses_course_id', $course_id);
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_complaint_detail($complaint_id) {
        $this->db->select('*,complaints.*,complaint_types.*,student.*,complaints._when_added as time_stamp');
        $this->db->from('complaints');
        $this->db->join('complaint_types', 'complaints.type_id=complaint_types.complaint_types_id', 'inner');
        $this->db->join('student', 'complaints.student_student_id=student.student_id', 'inner');
        $this->db->join('study_year', 'complaints.year_id=study_year.year_id', 'inner');
        $this->db->join('semesters', 'complaints.semester_id=semesters.semester_id', 'inner');
        $this->db->join('course_units', 'complaints.course_unit_id=course_units.course_unit_id', 'inner');
        $this->db->where('complaint_id', $complaint_id);
        $query = $this->db->get();
        return $query->row();
    }

    public function insertComplaintReply($array) {
        return $this->db->insert('complaint_reply', $array);
    }

    public function complaint_status($complaint_id) {
        $this->db->where('complaint_id', $complaint_id);
        return $this->db->update('complaints', array('_status' => 1));
    }

    public function fetch_cleared_complaints() {
        $this->db->select('general_complaints.*,general_complaints.message,general_complaints._when_added as time_stamp,general_complaints._status');
        $this->db->from('complaint_response');
        $this->db->join('general_complaints', 'complaint_response.complaint=general_complaints.id', 'left');
        $this->db->join('student', 'general_complaints._who_added=student.student_id', 'inner');
        $this->db->join('courses', 'student.courses_course_id=courses.course_id', 'inner');
        
       $this->db->where('university_id', $this->session->userdata('university'));
       $this->db->where('complaint_response._who_added',$this->session->userdata('user_id'));
       $this->db->where('complaint_response.action',"reply");
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_replied_complaint($complaint_id) {
        $this->db->select('*,general_complaints.*,general_complaints.message as complaint,student.*,general_complaints._when_added as '
                . 'time_stamp,complaint_response.message as complaint_reply,complaint_response._when_added as reply_date');
        $this->db->from('general_complaints');
        $this->db->join('student', 'general_complaints._who_added=student.student_id', 'inner');
        $this->db->join('complaint_response', 'complaint_response.complaint=general_complaints.id', 'inner');
//        $this->db->join('study_year', 'complaints.year_id=study_year.year_id', 'inner');
//        $this->db->join('semesters', 'complaints.semester_id=semesters.semester_id', 'inner');
//        $this->db->join('course_units', 'complaints.course_unit_id=course_units.course_unit_id', 'inner');
        $this->db->where('general_complaints.id', $complaint_id);
        $query = $this->db->get();
        return $query->row();
    }
    
    public function filter_cleared($course_id) {
        $this->db->select('complaints.*,complaints._when_added as time_stamp,complaint_types.type');
        $this->db->from('complaints');
        $this->db->join('complaint_types', 'complaints.type_id=complaint_types.complaint_types_id', 'inner');
        $this->db->join('student', 'complaints.student_student_id=student.student_id', 'inner');
        $this->db->where('complaint_types.university_university_id', $this->session->userdata('university'));
        $this->db->where('_status', 1);
        $this->db->where('student.courses_course_id', $course_id);
        $query = $this->db->get();
        return $query->result();
    }

    
    public function fetch_paymentComplaints(){
//        $this->db->from('tuition_complaints');
//        $this->db->join('student','tuition_complaints.student_id=student.student_id','left');
//        $this->db->where('tuition_complaints.status',0);
       
        $this->db->from('general_complaints');
        $this->db->join('student','general_complaints._who_added=student.student_id','left');
        $this->db->where('general_complaints._status',1);
       
        $query=$this->db->get();
        $result=$query->result();
        return $result;
    }

//    SELECT gc.id,gc.message, gc._when_added , gc._status,cr.message as reply FROM complaint_response cr
//LEFT JOIN  general_complaints gc on (gc.id=cr.complaint) 
}
