<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of University
 *
 * @author abert
 */
// main university staff Ci_model
require_once APPPATH . 'core/Constants.php';
require(APPPATH . 'third_party/PHPExcel-1.8/Classes/PHPExcel.php');
require(APPPATH . 'third_party/PHPExcel-1.8/Classes/PHPExcel/Writer/Excel2007.php');

class UniversityModel extends CI_Model {

    //put your code here
    public function __construct() {
        parent::__construct();
    }

    public function fetch_positions() {
        $this->db->from('positions');
        $this->db->where('position_university_id', $this->session->userdata('university_id'));
        $query = $this->db->get();
        return $query->result();
    }

//insert position 
    public function submitPosition($data) {
        return $this->db->insert('positions', $data);
    }

    public function editPositonData($position_id) {
        $this->db->from('positions');
        $this->db->where('position_id', $position_id);
        $query = $this->db->get();
        return $query->row();
    }

    public function updatedPosition($data, $position_id) {
        $this->db->where('position_id', $position_id);
        return $this->db->update('positions', $data);
    }

    public function deletePosition($position_id) {
        $data['position_id'] = $position_id;
        return $this->db->delete('positions', $data);
    }

    //staff details
    public function fetch_all_staff() {
        $this->db->from('staff');
        $this->db->join('staff_details', 'staff.user_id=staff_details.users_user_id', 'left');
        $this->db->join('positions', 'staff_details.positions_position_id=positions.position_id', 'left');
        $this->db->where('universities_university_id', $this->session->userdata('university_id'));
        $this->db->where('staff.status', 0);
        $query = $this->db->get();
        return $query->result();
    }

    function fetch_singleStaff($staff_id) {
        $this->db->from('staff');
        $this->db->where('user_id', $staff_id);
        $query = $this->db->get();
        return $query->row();
    }

    function updatestaffDetails($data, $staff_id) {
        $this->db->where('user_id', $staff_id);
        $this->db->update('staff', $data);
    }

    function deleteStaff($staff_id) {
        $this->db->where('user_id', $staff_id);
        $this->db->update('staff', array('status' => 1));
    }

    //assign position to staff
    public function saveStaffPosition($data, $staff_id) {
        $this->db->where('users_user_id', $staff_id);
        return $this->db->update('staff_details', $data);
    }

    //changing staff position
    function staffPositionDatails($staff_id) {
        $this->db->from('staff_details');
        $this->db->where('users_user_id', $staff_id);
        $query = $this->db->get()->row();
        return $query;
    }

    public function fetch_semesters() {
        $this->db->from('semesters');
        return $this->db->get()->result();
    }

    public function saveAcademicYear($data) {
        return $this->db->insert('academic_years', $data);
    }

    //courses
    //insert single course
    public function submitCourse($data) {
        return $this->db->insert('courses', $data);
    }

    public function DeleteCourse($course_id) {
        $data['course_id'] = $course_id;
        $this->db->where($data);
        return $this->db->update('courses', array('status' => 1));
    }

//submit single course unit
    public function registerCourseUnit($data) {
        return $this->db->insert('course_units', $data);
    }

//edit course unit
    public function fetchSingleCourseUnit($courseUnitId) {
        $this->db->from('course_units');
        $this->db->join('courses', 'course_units.courses_course_id=courses.course_id', 'left');
        $this->db->where('course_unit_id', $courseUnitId);
        $query = $this->db->get();
        return $query->row();
    }

    //update course unit
    public function UpdateCourseUnit($data, $course_unit_id) {
        $this->db->where('course_unit_id', $course_unit_id);
        return $this->db->update('course_units', $data);
    }

    //delete course unit
    public function deleteCourseUnit($course_unit_id) {
        $data['course_unit_id'] = $course_unit_id;
        $this->db->where($data);
        return $this->db->update('course_units', array('status' => 1));
    }

//ToDo
//fetch all university  students 
    public function fetch_students() {
        $this->db->from('student');
        $this->db->join('courses', 'student.courses_course_id=courses.course_id', 'left');
        $this->db->where('student.universities_university_id', $this->session->userdata('university_id'));
        $query = $this->db->get();
        return $query->result();
    }

    //submit single student
    public function registerStudent($data) {
        return $this->db->insert('student', $data);
    }

    //edit student
    public function editSudent($student_id) {
        $this->db->from('student');
        $this->db->where('student_id', $student_id);
        $query = $this->db->get();
        return $query->row();
    }

    //altering student details
    public function updateStudent($data, $student_id) {
        $this->db->where('student_id', $student_id);
        return $this->db->update('student', $data);
    }

    //delete student
    public function deleteStudent($student_id) {
        $data['student_id'] = $student_id;
        $this->db->where($data);
        return $this->db->update('student', array('status' => 1));
    }

    //student course units offered
    public function fetch_student_courseUnits($student_id) {
        $this->db->from('registered_course_units');
        $this->db->join('course_units', 'registered_course_units.course_units_units_id=course_units.course_unit_id', 'LEFT');
        $this->db->join('academic_years', 'registered_course_units.academic_years_years_id=academic_years.academic_year_id', 'LEFT');
        $this->db->join('semesters', 'registered_course_units.semester_semester_id=semesters.semester_id', 'LEFT');
        $this->db->where('student_student_id', $student_id);
        $query = $this->db->get();
        return $query->result();
    }

    public function filterCourseUnits() {
        $this->db->from('registered_course_units');
        $this->db->join('course_units', 'registered_course_units.course_units_units_id=course_units.course_unit_id', 'LEFT');
        $this->db->join('academic_years', 'registered_course_units.academic_years_years_id=academic_years.academic_year_id', 'LEFT');
        $this->db->join('semesters', 'registered_course_units.semester_semester_id=semesters.semester_id', 'LEFT');
        $this->db->where('student_student_id', $this->input->post('student_id'));
        $this->db->where('academic_years_years_id', $this->input->post('academic_year'));
        $this->db->where('semester_semester_id', $this->input->post('semester'));
        $query = $this->db->get();
        return $query->result();
    }

    //percourse student marks
    public function fetch_student_marks($data) {
//        $this->db->from('marks');
//        $this->db->join('academic_years', 'marks.academic_years_year_id=academic_years.academic_year_id', 'left');
//        $this->db->join('semesters', 'marks.semesters_semester_id=semesters.semester_id', 'left');
//        $this->db->where($data);
//        $query = $this->db->get();
//        return $query->result();

        $this->db->from('student_marks');
        $this->db->join('marks_students', 'student_marks.marks_stu_id=marks_students.marks_s_id', 'inner');
        $this->db->join('academic_years', 'marks_students.year=academic_years.academic_year_id', 'left');
        $this->db->join('semesters', 'marks_students.semester=semesters.semester_id', 'left');
//        $this->db->where($data);
        $query = $this->db->get();
        return $query->result();
    }

    function single_year($year_id) {
        $this->db->from('academic_years');
        $this->db->where('academic_year_id', $year_id);
        return $this->db->get()->row();
    }

    function single_semester($semester_id) {
        $this->db->from('semesters');
        $this->db->where('semester_id', $semester_id);
        return $this->db->get()->row();
    }

    function fetch_singleMark($mark_id) {
        $this->db->from('marks');
        $this->db->where('marks_id', $mark_id);
        $query = $this->db->get();
        return $query->row();
    }

    //update student marks

    function updateStudentMarks($data, $marks_id) {
        $this->db->where('marks_id', $marks_id);
        $this->db->update('marks', $data);
    }

   
    public function deleteComplaintCategory($category_id) {
        $data['complaint_types_id'] = $category_id;
        $this->db->delete('complaint_types', $data);
    }

    //all course student complaints
    public function fetch_unreplied_complaints($course_id) {
        $this->db->from('complaints');
        $this->db->join('student', 'complaints.student_student_id = student.student_id', 'LEFT');
        $this->db->join('complaint_types', 'complaints. complaint_types_complaint_types_id = complaint_types.complaint_types_id', 'LEFT');
        $this->db->where('student.courses_course_id', $course_id);
        $this->db->where('complaints._status', 0);
        $this->db->order_by('complaint_id', 'desc');
        $query = $this->db->get()->result();
        return $query;
    }

//all course complaint replies
    public function fetch_replied_complaints($course_id) {
        $this->db->select('*, complaint_reply._when_added as time_stamp');
        $this->db->from('complaints');
        $this->db->join('student', 'complaints.student_student_id = student.student_id', 'LEFT');
        $this->db->join('complaint_types', 'complaints.complaint_types_complaint_types_id = complaint_types.complaint_types_id', 'LEFT');
        $this->db->join('complaint_reply', 'complaints.complaint_id = complaint_reply.complaints_complaint_id', 'LEFT');
        $this->db->where('student.courses_course_id', $course_id);
        $this->db->where('complaints._status', 1);
        $this->db->order_by('complaint_id', 'desc');
        $query = $this->db->get()->result();
        return $query;
    }

    //student complaint details
    public function singleStudentComplaintDetails($complaint_id) {
        $this->db->select('*, complaints._when_added as time_stamp');
        $this->db->from('complaints');
        $this->db->join('student', 'complaints.student_student_id = student.student_id', 'LEFT');
        $this->db->join('complaint_types', 'complaints. complaint_types_complaint_types_id = complaint_types.complaint_types_id', 'LEFT');
        $this->db->where('complaint_id', $complaint_id);
        $query = $this->db->get()->row();
        return $query;
    }

    //save the complaint reply
    public function saveReply($data, $complaint_id) {
        $success = $this->db->insert('complaint_reply', $data);
        //now update the complaints status to 1/meaning replied
        if ($success) {
            $this->db->where('complaint_id', $complaint_id);
            $this->db->update('complaints', array('_status' => 1));
        }
    }

    //fetch single complaint reply
    public function singleComplaintReplyDetails($complaint_id) {
        $this->db->select('*, complaints._when_added as time_stamp');
        $this->db->from('complaints');
        $this->db->join('student', 'complaints.student_student_id = student.student_id', 'LEFT');
        $this->db->join('complaint_types', 'complaints. complaint_types_complaint_types_id = complaint_types.complaint_types_id', 'LEFT');
        $this->db->join('complaint_reply', 'complaints.complaint_id = complaint_reply.complaints_complaint_id', 'LEFT');
        $this->db->where('complaint_id', $complaint_id);
        $query = $this->db->get()->row();
        return $query;
    }

}
