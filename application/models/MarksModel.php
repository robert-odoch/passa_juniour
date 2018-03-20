<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MarksModel
 *
 * @author abert
 */
require_once APPPATH . 'core/Constants.php';

class MarksModel extends MY_Model {

    protected $_primary_key = 'marks_id';
    protected $_table = 'marks';

    function __construct() {
        parent::__construct();
    }

    //uploading single student marks
    public function upload_studentMarks() {
        $fp = fopen($_FILES['userfile']['tmp_name'], 'r') or die("can't open file");
        $this->load->library('format');

        $string_csv = $fp;
        $result = $this->format->factory($string_csv, 'csv')->to_array();

        var_dump($result);

        $data = array();

        // Splits
        $rows = explode("\n", trim($string));
        $headings = explode(',', array_shift($rows));
        foreach ($rows as $row) {
            // The substr removes " from start and end
            $data_fields = explode('","', trim(substr($row, 1, -1)));

            if (count($data_fields) == count($headings)) {
                $data[] = array_combine($headings, $data_fields);
            }
        }

        return $data;

//        $time_stamp = new constants();
//        $count = 0;
    }

    function upload_generalstudentMarks() {

    }

    public function fetch_marks_semeter_units($year, $semester, $course_id) {
        $query = $this->db->query('select distinct(course_unit) as course_unit from marks m where academic_years_year_id=' . $year . ' and semesters_semester_id=' . $semester . ' and '
                . 'course_course_id=' . $course_id . ' ');
        return $query->result();
    }

    public function fetch_reg_nos($year, $semester, $course_id, $intake) {
        $query = $this->db->query("select distinct(reg_number) as reg_no from marks m left join courses c on(m.course_course_id=c.course_id) left join student s on(c.course_id=s.courses_course_id) where m.academic_years_year_id='" . $year . "' and semesters_semester_id='" . $semester . "' and course_course_id='" . $course_id . "' && s.intake_intake_id='" . $intake . "'");
        return $query->result();
    }

    public function fetch_marks($year, $semester, $course_id) {
        $query = $this->db->query('select distinct(reg_number) as reg_no from marks m where academic_years_year_id=' . $year . ' and semesters_semester_id=' . $semester . ' and '
                . 'course_course_id=' . $course_id . ' ');
        return $query->result();
    }

    public function fetch_registration_numbers($course_id, $intake) {
        $this->db->select('distinct(reg_number) as reg_number');
        $this->db->from('marks');
        $this->db->where('course_course_id', $course_id);
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_single_statement($array) {
        $this->db->from('marks');
        $this->db->where($array);
        $query = $this->db->get()->result();
        return $query;
    }

}
