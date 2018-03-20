<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of students_model
 *
 * @author abert
 */
require_once APPPATH . 'core/Constants.php';

class Students_model extends CI_Model {

    //put your code here
    //upload all course students
    public function uploadCourseStudents() {
        $time_stamp = new constants();
        $filename = $_FILES["userfile"]["tmp_name"];
        //read file from path
        $objPHPExcel = PHPExcel_IOFactory::load($filename);

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
                    }
                }
            }
        }
        unset($dataArr[1]); // since in our example the first row is the header and not the actual data

        foreach ($dataArr as $val) {
            $data = array(
                'name' => $val['0'],
                'parent' => $val['1'],
                'phone_number' => $val['2'],
                'email' => $val['3'],
                'school_id' => $this->session->userdata('USERMM_school'),
                '_when_added' => $time_stamp->getDatetimeNow(),
                '_who_added' => $this->session->userdata('MM_USERID')
            );
             $success = $this->db->insert('students', $data);
        }
        return TRUE;
    }
   




    //students not registered to intake chat group
    private function fetch_unregisteredStduent($course_id, $intake_id, $group_id) {
        $query = $this->db->query("select student_id from student where courses_course_id='" . $course_id . "' && intake_intake_id='" . $intake_id . "' "
                . "&& status=0 && student_id not in(select student_student_id from group_members where group_group_id='" . $group_id . "')");
        return $query->result();
    }

    private function check_group($group_name) {
        $this->db->from('chatgroups');
        $this->db->where('group_name', $group_name);
        $this->db->where('university_id', $this->session->userdata('university'));
        $query = $this->db->get()->row();
        return $query;
    }

    private function fetch_intake($intake) {
        $this->db->from('intakes');
        $this->db->where('intake_id', $intake);
        $query = $this->db->get()->row();
        return $query;
    }

    //fetch students of a particular course
    public function fetch_course_students($course_id, $intake) {
        $this->db->from('student');
        $this->db->join('courses', 'student.courses_course_id=courses.course_id', 'left');
        $this->db->where('courses_course_id', $course_id);
        $this->db->where('student.intake_intake_id', $intake);
        $this->db->where('student.status', 0);
        $this->db->order_by('student_id', 'desc');
        $query = $this->db->get();
        return $query->result();
    }

    public function fetch_student_details($registation_number) {
        $this->db->from('student');
        $this->db->where('registration_number', $registation_number);
        $query = $this->db->get()->row();
        return $query;
    }

    private function fetch_course($course_id) {
        $this->db->from('courses');
        $this->db->where('course_id', $course_id);
        $query = $this->db->get()->row();
        return $query;
    }

}
