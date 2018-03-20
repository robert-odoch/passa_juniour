<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of payments_model
 *
 * @author hp
 */
class Payments_model extends CI_Model {

    public function filter_activated($student_id,$course_id, $semester, $year_study, $intake_id) {
        $this->db->from('registered_academic_years');
        $this->db->join('student', 'registered_academic_years.student_student_id=student.student_id', 'inner join');
        $this->db->where('student.courses_course_id', $course_id);
        $this->db->where('student.intake_intake_id', 1);//$intake_id
        $this->db->where('year_study', $year_study);
        $this->db->where('semester_semester_id', $semester);
        $this->db->where('student_student_id', $student_id);
        $query = $this->db->get();
        return $query->row();
    }

    public function deactivate($registration_id) {
        $this->db->where('registered_academic_years_id', $registration_id);
        return $this->db->update('registered_academic_years', array('_status' => 0));
    }

    public function activate($registration_id) {
        $this->db->where('registered_academic_years_id', $registration_id);
        return $this->db->update('registered_academic_years', array('_status' => 1));
    }

    public function course_fees($course_id) {
        $this->db->from('fees_structure');
        $this->db->join('fees_categories', 'fees_structure.fees_category=fees_categories.cat_id', 'left inner');
        $this->db->where('course_id', $course_id);
        $this->db->where('fees_structure.status', 0);
        $query = $this->db->get()->result();
        return $query;
    }

    public function insert_fees($array) {
        return $this->db->insert('fees_Structure', $array);
    }

    public function check_structure($course_id, $study_year, $semester) {
        $this->db->from('fees_Structure');
        $this->db->where('course_id', $course_id);
        $this->db->where('study_year', $study_year);
        $this->db->where('semester', $semester);
        return $this->db->get()->row();
    }

    public function editFees($fees_id) {
        return $this->db->where('fees_id', $fees_id)->get('fees_structure')->row();
    }

    public function update_fees($id, $array) {
        $this->db->where('fees_id', $id);
        return $this->db->update('fees_structure', $array);
    }

    public function delete_fees($fees_id) {
        $this->db->where('fees_id', $fees_id);
        return $this->db->update('fees_structure', array('status' => 1));
    }

    public function get_std_bal($std_id){
        $this->db->from("balances_temp");
        $this->db->where("student",$std_id);
        return $this->db->get()->row();
    }

    // public function filter_paid_student($study_year, $semester, $course_id) {
    //     $query = $this->db->query("SELECT p.student_id, p.payments_id,sum(p.amount) as amount,COUNT(p.payments_id) as paid_times,p.recept_no,s.registration_number,s.name from student_payments p left join student s on(p.student_id=s.student_id) left join courses c on(s.courses_course_id=c.course_id) where c.course_id='$course_id' && p.study_year='$study_year' && p.semester='$semester'  group by p.student_id")->result();
    //     return $query;
    // }

    public function filter_paid_student($intake, $study_year, $semester, $course_id) {
        $query = $this->db->query("SELECT p.student_id, p.payments_id,sum(p.amount) as amount,COUNT(p.payments_id) as paid_times,p.recept_no,s.registration_number,s.name from student_payments p left join student s on(p.student_id=s.student_id) left join courses c on(s.courses_course_id=c.course_id) where c.course_id='$course_id' && s.intake_intake_id='$intake' && p.study_year='$study_year' && p.semester='$semester'  group by p.student_id")->result();
        return $query;
    }

    public function fetch_courseSemesterStructure($course_id, $university_id) {
        $query = $this->db->query("SELECT fc.name,fs.`amount`,fc.paid_times FROM `fees_structure` fs  
                                    left join fees_categories fc on fs.`fees_category`=fc.cat_id
                                    WHERE fs.`course_id`='$course_id' AND
                                    fc.university_id='$university_id' ");
        return $query->result();
    }
    
    
    public function student_recepts($intake, $study_year, $semester, $student_id) {
        $query = $this->db->query("SELECT p.payment_date as _when_added, p.payments_id,p.amount,p.recept_no from student_payments p where p.study_year='$study_year' && p.semester='$semester' && p.student_id='$student_id'")->result();
        return $query;
    }

    public function fetch_pending_complaints() {
        $this->db->from('tuition_complaints');
        $this->db->where('university_id', $this->session->userdata('university'));
        $this->db->where('status', 0);
        return $this->db->get()->result();
    }

    public function pending_complaint_details($comlaint_id) {
        $this->db->from('tuition_complaints');
        $this->db->join('student', 'tuition_complaints.student_id=student.student_id', 'left');
        $this->db->join('study_year','tuition_complaints.year_id=study_year.year_id','left');
          $this->db->join('semesters','tuition_complaints.semester_id=semesters.semester_id','left');
        $this->db->where('complaint_id', $comlaint_id);
        return $this->db->get()->row();
    }
    public function complaint_remarks($comlaint_id){
    $this->db->from('reply_complaint');
        $this->db->join('users', 'reply_complaint._who_replied=users.user_id', 'left');
        $this->db->where('complaint_id', $comlaint_id);
        return $this->db->get()->result();
    }

    public function reply_complaint($data) {
        return $this->db->insert('reply_complaint', $data);
    }

    public function fetch_paymentCategories() {
        $this->db->from('fees_categories');
        $this->db->where('university_id', $this->session->userdata('university'));
        $this->db->where('status', 0);
        $query = $this->db->get()->result();
        return $query;
    }

    public function fetch_assigned_fees($course_id, $university_id) {
        $query = $this->db->query("select * from fees_categories where university_id='$university_id' && status=0  && cat_id not in(select fees_category from fees_structure where course_id='$course_id' && status='0')");
        $query_res = $query->result();
        return $query_res;
    }

    public function insert_category($data) {
        return $this->db->insert('fees_categories', $data);
    }

    public function fetch_category($category_id) {
        $this->db->from('fees_categories');
        $this->db->where('cat_id', $category_id);
        return $this->db->get()->row();
    }

    public function update_category($data, $id) {
        $this->db->where('cat_id', $id);
        return $this->db->update('fees_categories', $data);
    }

    public function delete_category($category_id) {
        $this->db->where('cat_id', $category_id);
        return $this->db->update('fees_categories', array('status' => 1));
    }

}
