<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Time_table
 *
 * @author hp
 */
class Table_model extends CI_Model {

    //put your code here

    public function fetch_time_table() {

        if ($this->session->userdata('dept_status') == 0):
            $this->db->from('time_table');
            $this->db->join('courses', 'time_table.course_id=courses.course_id', 'inner');
            $this->db->join('semesters', 'time_table.semester_id=semesters.semester_id', 'inner');
            $this->db->join('study_year', 'time_table.study_year=study_year.year_id', 'inner');
            $this->db->where('university_id', $this->session->userdata('university'));
            return $this->db->get()->result();
        else:
            $result = $this->fetch_department_timeTable();
            return $result;
        endif;
    }

    private function fetch_department_timeTable() {
        $query = $this->db->query("select * from time_table t left join semesters sm on(t.semester_id=sm.semester_id) left join study_year sy on(t.study_year=sy.year_id) left join courses c on(t.course_id=c.course_id) left join depts d on(c.dept_id=d.dept_id) left join schools s on(d.school_id=s.school_id) where d.school_id='" . $this->session->userdata('dept_id') . "' && c.status=0");
        return $query->result();
    }

    public function add_time_table($array) {
        return $this->db->insert('time_table', $array);
    }

    //check if the course has the time table
    public function check_course($array) {
        $this->db->where($array);
        $query = $this->db->get('time_table');
        return $query->num_rows();
    }

    public function fetch_details($id) {
        $this->db->where('time_table_id', $id);
        $query = $this->db->get('time_table')->row();
        return $query;
    }

    public function update_time_table($array, $course_id) {
        $this->db->where('course_id', $course_id);
        return $this->db->update('time_table', $array);
    }
  public function delete_all_timetables(){
   $this->db->truncate('time_table');
}
}
