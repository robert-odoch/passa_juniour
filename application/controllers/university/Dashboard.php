<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Dashboard
 *
 * @author abert
 */
require_once APPPATH . 'core/Constants.php';

class Dashboard extends MY_Controller {

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->model('UniversityModel');
        $this->load->model('AdminModel');
        $this->load->model('GlobalModel');
        $this->load->model('global/Global_model');
        $this->load->model('IntakeModel');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    //load the university admin dashboard
    public function index() {
        $data['page'] = "Dashboard";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_type_id'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('university/dashboard', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function positions() {
        $data['positions'] = $this->UniversityModel->fetch_positions();
        $data['staff_menu'] = "active";
        $data['positions_menu'] = "active";
        $data['page'] = "Staff Management";
        $data['sub_page'] = "Staff positions";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_type_id'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('university/positions', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function addPosition() {
        $data['position'] = $this->input->post('position');
        $data['position_university_id'] = $this->session->userdata('university_id');
        $this->UniversityModel->submitPosition($data);
        echo json_encode(array('status' => TRUE));
    }

    public function editPosition($position_id) {
        $result = $this->UniversityModel->editPositonData($position_id);
        echo json_encode($result);
    }

    public function updatePosition() {
        $data['position'] = $this->input->post('position');
        $position_id = $this->input->post('position_id');
        $this->UniversityModel->updatedPosition($data, $position_id);
        echo json_encode(array('status' => TRUE));
    }

    public function deletePosition($position_id) {
        $this->UniversityModel->deletePosition($position_id);
        echo json_encode(array('status' => TRUE));
    }

    //staff members details
    public function staff() {
        $data['positions'] = $this->UniversityModel->fetch_positions();
        $data['staff'] = $this->UniversityModel->fetch_all_staff();
        $data['staff_menu'] = "active";
        $data['staff_details_menu'] = "active";
        $data['page'] = "Staff Management";
        $data['sub_page'] = "Staff Details";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_type_id'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('university/staff', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    /// register staff members
    public function submitStaff() {
        $data['firstName'] = $this->input->post('firstName');
        $data['lastName'] = $this->input->post('lastName');
        $data['email'] = $this->input->post('email');
        $data['contact'] = $this->input->post('contact');
        // return last inserted row
        $lastInserted = $this->AdminModel->insertAdmin($data);

        $details['users_user_id'] = $lastInserted;
        $details['universities_university_id'] = $this->session->userdata('university_id');

        //insert now in the staff details table
        $this->AdminModel->insertStaffDetails($details);

        //auto generate password
        $password = chr(mt_rand(97, 122)) . mt_rand(0, 9) . chr(mt_rand(97, 122)) . mt_rand(10, 99) . chr(mt_rand(97, 122)) . mt_rand(100, 999);
        $login['auth_type_auth_type_id'] = "3";
        $login['username'] = $this->input->post('email');
        $login['password'] = "123456";
        $login['staff_user_id'] = $lastInserted;

        //insert into authecation  table
        $this->AdminModel->insertAuth($login);
        echo json_encode(array('status' => TRUE));
    }

    public function submitStaffPosition() {
        $data['positions_position_id'] = $this->input->post('positions');
        $staff_id = $this->input->post('user_id');
        $this->UniversityModel->saveStaffPosition($data, $staff_id);
        echo json_encode(array('status' => TRUE));
    }

    //edut staff details
    function editStaffDetails($staff_id) {
        $value = $this->UniversityModel->fetch_singleStaff($staff_id);
        echo json_encode($value);
    }

    //update staff details
    function updateStaff() {
        $data['firstName'] = $this->input->post('firstName');
        $data['lastName'] = $this->input->post('lastName');
        $data['email'] = $this->input->post('email');
        $data['contact'] = $this->input->post('contact');
        $staff_id = $this->input->post('staff_user_id');
        $this->UniversityModel->updatestaffDetails($data, $staff_id);
        echo json_encode(array('status' => TRUE));
    }

    function deleteSaff($staff_id) {
        $this->UniversityModel->deleteStaff($staff_id);
        echo json_encode(array('status' => TRUE));
    }

    //update staff postion 
    function updateUserPosition($staff_id) {
        $data = $this->UniversityModel->staffPositionDatails($staff_id);
        echo json_encode($data);
    }

    public function adddAcademicYear() {
        $time_stamp = new constants();
        $data['academic_year'] = $this->input->post('academic_year');
        $data['_who_added'] = $this->session->userdata('user_id');
        $data['_when_added'] = $time_stamp->getDatetimeNow();
        $data['university_university_id'] = $this->session->userdata('university_id');
        $this->UniversityModel->saveAcademicYear($data);
        echo json_encode(array('status' => TRUE));
    }

    //courses
    //upload csv file
//input from the form(adding single course)
    public function submitCourse() {
        $data['course'] = $this->input->post('course');
        $data['course_code'] = $this->input->post('course_code');
        $data['_who_added'] = $this->session->userdata('user_id');
        $data['universities_university_id'] = $this->session->userdata('university_id');
        $this->UniversityModel->submitCourse($data);
        echo json_encode(array('status' => TRUE));
    }

    public function deleteCourse($course_id) {
        $this->UniversityModel->DeleteCourse($course_id);
        echo json_encode(array('status' => TRUE));
    }

    public function SelectCourses() {
        $courses = $this->UniversityModel->fetch_courses();
        echo json_encode($courses);
    }

    //register single course unit
    public function registerCourseUnit() {
        $time = new Constants();
        $data['course_unit_code'] = $this->input->post('course_unit_code');
        $data['course_unit'] = $this->input->post('course_unit');
        $data['cu'] = $this->input->post('cu');
        $data['courses_course_id'] = $this->input->post('course');
        $data['_when_added'] = $time->getDatetimeNow();
        $data['_who_added'] = $this->session->userdata('user_id');
        $this->UniversityModel->registerCourseUnit($data);
        echo json_encode(array('status' => TRUE));
    }

    //edit course unit
    public function editCourseUnit($courseUnitId) {
        $data['courses'] = $this->UniversityModel->fetch_courses();
        $data['courseUnit'] = $this->UniversityModel->fetchSingleCourseUnit($courseUnitId);
        $this->load->view('university/editCourseUnit', $data);
    }

    //update 
    public function updateCourseUnit() {
        $course_unit_id = $this->input->post('course_unit_id');
        $data['course_unit_code'] = $this->input->post('course_unit_code');
        $data['course_unit'] = $this->input->post('course_unit');
        $data['cu'] = $this->input->post('cu');
        $data['courses_course_id'] = $this->input->post('course');
        $this->UniversityModel->UpdateCourseUnit($data, $course_unit_id);
        echo json_encode(array('status' => TRUE));
    }

    public function deleteCourseUnit($course_unit_id) {
        $this->UniversityModel->deleteCourseUnit($course_unit_id);
        echo json_encode(array('status' => TRUE));
    }

// todo
    // getting all students
    public function students() {
        $data['courses'] = $this->UniversityModel->fetch_courses();
        $data['students_menu'] = "active";
        $data['student_menu'] = "active";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_type_id'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('university/students', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function courseStudents($course_id) {
        
    }

//adding single student to a course
    public function addSingleStudent() {
        $time_stamp = new Constants();
        $data['registration_number'] = $this->input->post('registration_number');
        $data['firstName'] = $this->input->post('firstName');
        $data['lastName'] = $this->input->post('lastName');
        $data['gender'] = $this->input->post('gender');
        $data['contact'] = $this->input->post('contact');
        $data['email'] = $this->input->post('email');
        $data['intake_intake_id'] = $this->input->post('intake_id');
        $data['password'] = "123456";
        $data['courses_course_id'] = $this->input->post('course_id');
        $data['_when_added'] = $time_stamp->getDatetimeNow();
        $data['_who_added'] = $this->session->userdata('user_id');
        $data['universities_university_id'] = $this->session->userdata('university_id');
        $this->UniversityModel->registerStudent($data);
        echo json_encode(array('status' => TRUE));
    }

    //edit student details
    public function editStudent($student_id) {
        $data = $this->UniversityModel->editSudent($student_id);
        echo json_encode($data);
    }

    public function updateStudent() {
        $data['registration_number'] = $this->input->post('registration_number');
        $data['firstName'] = $this->input->post('firstName');
        $data['lastName'] = $this->input->post('lastName');
        $data['contact'] = $this->input->post('contact');
        $data['email'] = $this->input->post('email');
        $data['intake_intake_id'] = $this->input->post('intake_id');
        $data['courses_course_id'] = $this->input->post('course_id');
        $student_id = $this->input->post('student_id');
        $this->UniversityModel->updateStudent($data, $student_id);
        echo json_encode(array('status' => TRUE));
    }

//delete student
    public function deleteStudent($student_id) {
        $this->UniversityModel->deleteStudent($student_id);
        echo json_encode(array('status' => TRUE));
    }

    //student course units and academic years
    public function studentCourseUnits($student_id) {
        $data['student_course_units'] = $this->UniversityModel->fetch_student_courseUnits($student_id);
        //fetch academic years
        $data['academic_years'] = $this->UniversityModel->fetch_academic_years();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['students_menu'] = "active";
        $data['student_menu'] = "active";
        $data['page'] = "Students";
        $data['sub_page'] = "Course students";
        //fetch student name
        $row = $this->db->from('student')->join('courses', 'student.courses_course_id=courses.course_id', 'LEFT')->where('student_id', $student_id)->get()->row();
        $data['sub_sub_page'] = $row->course;
        $data['sub_sub_sub_page'] = $row->firstName . " " . $row->lastName;
        $data['studen_id'] = $row->student_id;
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_type_id'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('university/student_course_units', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function filter_studentCourseUnits() {
        $result_set = $this->UniversityModel->filterCourseUnits();

        $result_html;
        $count = 1;
        foreach ($result_set as $result) {
            $result_html .= '
    <tr>
        <td>' . $count . '</td>
        <td>' . $result->academic_year . '</td>
        <td>' . $result->semester . '</td>
        <td>' . $result->course_unit_code . '</td>
        <td>' . $result->course_unit . '</td>
    </tr>';
            $count++;
        }
        echo $result_html;
    }

    //filter all general students marks
    function filterMarks() {
        
    }

    //all student courses 
    public function marks() {

        $data['marks_menu'] = "active";
        $data['mark_menu'] = "active";
        $data['page'] = "Courses";
        $data['sub_page'] = "Student marks";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_type_id'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('university/marks', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    //show all students marks
    //upload single student marks
    public function uploadStudentMarks() {
        $this->UniversityModel->upload_studentMarks();
        redirect('university/dashboard/marks');
    }

    //editting marks
    function editMark($mark_id) {
        $value = $this->UniversityModel->fetch_singleMark($mark_id);
        echo json_encode($value);
    }

    function updateMarks() {
        $data['reg_number'] = $this->input->post('registration_number');
        $data['course_unit'] = $this->input->post('course_unit');
        $data['mark'] = $this->input->post('mark');
        $data['grade'] = $this->input->post('grade');
        $data['academic_years_year_id'] = $this->input->post('academic_year');
        $data['semesters_semester_id'] = $this->input->post('semester');
        $marks_id = $this->input->post('marks_id');
        $this->UniversityModel->updateStudentMarks($data, $marks_id);
        echo json_encode(array('status' => TRUE));
    }

    public function deleteComplaintCategory($category_id) {
        $this->UniversityModel->deleteComplaintCategory($category_id);
        echo json_encode(array('status' => TRUE));
    }

    //student complaints
    public function Complaints() {
        $data['courses'] = $this->UniversityModel->fetch_courses();
        $data['count_unread'] = $this->GlobalModel->count_unread_complaints();
        $data['complaints_menu'] = "active";
        $data['complaint_menu'] = "active";
        $data['page'] = "Course";
        $data['sub_page'] = "Complaints";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_type_id'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('university/complaints', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    //un replied complaints
    public function UnRepliedComplaints($course_id) {
        $data['complaints'] = $this->UniversityModel->fetch_unreplied_complaints($course_id);
        $data['complaints_menu'] = "active";
        $data['complaint_menu'] = "active";
        $data['page'] = '<a href="' . base_url("university/dashboard/Complaints") . '">Courses</a>';
        $data['sub_page'] = "Complaints";
        $data['sub_sub_page'] = "UnReplied Complaints";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_type_id'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('university/unrepliedComplaints', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    //replied complaints
    public function RepliedComplaints($course_id) {
        $data['complaints'] = $this->UniversityModel->fetch_replied_complaints($course_id);
        $data['complaints_menu'] = "active";
        $data['complaint_menu'] = "active";
        $data['page'] = '<a href="' . base_url("university/dashboard/Complaints") . '">Courses</a>';
        $data['sub_page'] = "Complaints";
        $data['sub_sub_page'] = "Replied Complaints";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_type_id'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('university/repliedComplaints', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function studentComplaintDetails($complaint_id) {
        $data = $this->UniversityModel->singleStudentComplaintDetails($complaint_id);
        echo json_encode($data);
    }

    //university complaint reply
    public function complaintReply() {
        $time_stamp = new Constants();
        $data['complaint_reply'] = $this->input->post('reply');
        $data['complaints_complaint_id'] = $this->input->post('complaint_id');
        $data['_who_added'] = $this->session->userdata('user_id');
        $data['_when_added'] = $time_stamp->getDatetimeNow();
        $this->UniversityModel->saveReply($data, $this->input->post('complaint_id'));
        echo json_encode(array('status' => TRUE));
    }

    //complaint reply details
    public function studentComplaintReplyDetails($complaint_id) {
        $data = $this->UniversityModel->singleComplaintReplyDetails($complaint_id);
        echo json_encode($data);
    }

    //university events calendar
    public function eventsCalendar() {
        $data['calendar_menu'] = "active";
        $data['calendar_events_menu'] = "active";
        $data['page'] = "University Calendar";
        $data['sub_page'] = "Events";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_type_id'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('university/calendarEvents', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function functions() {
        redirect('university/dashboard/functions');
    }

}
