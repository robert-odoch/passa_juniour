<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of courses_model
 *
 * @author abert
 */
class Courses_model extends CI_Model {

    //put your code here
    public function fetch_courses() {
        $this->db->from('courses');
        $this->db->where('universities_university_id', $this->session->userdata('university'));
        $this->db->where('status', 0);
        return $this->db->get()->result();
    }

    private function fetch_department_courses() {
        $query = $this->db->query("SELECT c.* from courses c LEFT join depts d on(c.dept_id=d.dept_id) LEFT join schools s on(d.school_id=s.school_id) where d.school_id='" . $this->session->userdata('dept_id') . "' && c.status=0");
        return $query->result();
    }

    public function filter_courses($level) {
        if ($this->session->userdata('dept_status') == 0):
            $this->db->from('courses');
            $this->db->where('universities_university_id', $this->session->userdata('university'));
            $this->db->where('level', $level);
            $this->db->where('status', 0);
            return $this->db->get()->result();
        else:
            $result = $this->fetch_departLevelCourses($level);
            return $result;
        endif;
    }

    private function fetch_departLevelCourses($level) {
        $query = $this->db->query("SELECT c.* from courses c LEFT join depts d on(c.dept_id=d.dept_id) LEFT join schools s on(d.school_id=s.school_id) where d.school_id='" . $this->session->userdata('dept_id') . "' && c.status='0' && c.level='" . $level . "'");
        return $query->result();
    }

    public function upload_courses() {
        $level = $this->input->post('level');
        $dept = $this->input->post('dept');
        $time_stamp = new constants();
        $filename = $_FILES["userfile"]["tmp_name"];
        //read file from path
        $objPHPExcel = PHPExcel_IOFactory::load($filename);

        $code = $objPHPExcel->getActiveSheet()->getCell('A1')->getValue();
        $course = $objPHPExcel->getActiveSheet()->getCell('B1')->getValue();
        if ($code == "CODE" && $course == "COURSE") {
            $dataArr = array();

            foreach ($objPHPExcel->getWorksheetIterator() as $worksheet) {
                $worksheetTitle = $worksheet->getTitle();
                $highestRow = $worksheet->getHighestRow(); // e.g. 10
                $highestColumn = $worksheet->getHighestColumn(); // e.g 'F'
                $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);
                $maxCell = $worksheet->getHighestRowAndColumn();
                $data = $worksheet->rangeToArray('A1:' . $maxCell['column'] . $maxCell['row']);
                for ($row = 1; $row <= $highestRow; ++$row) {
                    for ($col = 0; $col < $highestColumnIndex; ++$col) {
                        $cell = $worksheet->getCellByColumnAndRow($col, $row);
                        $val = $cell->getValue();
                        if ($val != null) {
                            $dataArr[$row][$col] = $val;
                        } else {
                            $val = '';
                            $dataArr[$row][$col] = $val;
                        }
                    }
                }
            }
            unset($dataArr[1]); // since in our example the first row is the header and not the actual data
            foreach ($dataArr as $val) {
                $data = array(
                    'course_code' => $val['0'],
                    'course' => $val['1'],
                    'level' => $level,
                    'dept_id' => $dept,
                    'universities_university_id' => $this->session->userdata('university'),
                    '_when_added' => $time_stamp->getDatetimeNow(),
                    '_who_added' => $this->session->userdata('user_id')
                );
                $this->db->insert('courses', $data);
            }
            return TRUE;
        } else {
            return FALSE;
        }
    }

//course units
    public function fetch_courseUnits($year, $semester, $course_id) {
        $query = "SELECT * FROM  course_units c left join assigned_units au on(c.course_unit_id=au.course_unit_unit_id)"
                . " WHERE c.courses_course_id = '" . $course_id . "' and  c.status = 0  and c.course_unit_id  NOT IN (SELECT a.course_unit_unit_id"
                . " FROM assigned_units a "
                . "WHERE a.course_course_id='" . $course_id . "')"; //&& a.academic_academic_year_id='" . $year . "' ||  a.semester_semester_id='" . $semester . "
        $sql = $this->db->query($query);
        return $sql->result();
    }

    public function fetch_course_units($course_id, $semester, $study_year) {
        $this->db->select('course_units.*,assigned_units.id as `_id`');
        $this->db->from('assigned_units');
        $this->db->join('course_units', 'assigned_units.course_unit=course_units.id and course_units._status=0', 'left outer');
        $this->db->where('assigned_units.course', $course_id);
        if ($semester != "all") {
            $this->db->where('semeter', $semester);
        }if ($study_year != "all") {
            $this->db->where('year_study', $study_year);
        }
        $this->db->where('assigned_units._status', 0);
        $query = $this->db->get();
        return $query->result();
    }

    //edit single course details
    public function fetchCourse($course_id) {
        $this->db->from('courses');
        $this->db->where('course_id', $course_id);
        return $this->db->get()->row();
    }

    public function UpdateCourse($data, $course_id) {
        $this->db->where('course_id', $course_id);
        return $this->db->update('courses', $data);
    }

    public function insertCourse($data) {
        return $this->db->insert('courses', $data);
    }

}
