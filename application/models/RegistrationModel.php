<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of RegistrationModel
 *
 * @author abert
 */
class RegistrationModel extends CI_Model {

    function fetch_registerdStudents($array, $course_id,$intake=null) {
        $this->db->select('*,registered_academic_years._when_added as time_stamp');
        $this->db->from('registered_academic_years');
        $this->db->join('student', 'registered_academic_years.student_student_id=student.student_id', 'left');
        $this->db->where($array);
        $this->db->where('student.intake_intake_id', $intake);
        $this->db->where('student.courses_course_id', $course_id);
        $query = $this->db->get()->result();
        return $query;
    }

    function fetch_registerdCourseUnits($registerd_year_id) {
        $this->db->from('registered_course_units');
        $this->db->join('course_units', 'registered_course_units.course_units_units_id=course_units.id', 'left');
        $this->db->where('registered_academic_years_id', $registerd_year_id);
        $query = $this->db->get()->result();
        return $query;
    }

    public function registerdCourseUnit($registerd_year_id) {
        $this->db->from('registered_course_units');
        $this->db->join('course_units', 'registered_course_units.course_units_units_id=course_units.id', 'left');
        $this->db->where('registered_academic_years_id', $registerd_year_id);
        $query = $this->db->get()->result();
        return $query;
    }

    function studenRegistredDetails($registerd_year_id) {
        $this->db->from('registered_academic_years');
        $this->db->join('student', 'registered_academic_years.student_student_id=student.student_id', 'left');
//        $this->db->join('academic_years', 'registered_academic_years.academic_years_years_id=academic_years.academic_year_id', 'left');
        $this->db->join('semesters', 'registered_academic_years.semester_semester_id=semesters.semester_id', 'left');
        $this->db->where('registered_academic_years.registered_academic_years_id', $registerd_year_id);
        $query = $this->db->get()->row();
        return $query;
    }

}
