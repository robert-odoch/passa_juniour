<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Dept_model
 *
 * @author hp
 */
class Sch_model extends CI_Model {

    //put your code here
    public function fetch_depts($sch_id) {
        $query = $this->db->query("select d.*,COUNT(c.course_id) as courses  from depts d  left join courses c on(d.dept_id=c.dept_id)
            left join schools s on(d.school_id=s.school_id) where d.university_id='" . $this->session->userdata('university') . "' && d.status='0' && d.school_id='$sch_id' GROUP by d.dept_id");
        return $query->result();
    }

    public function fetch_department() {
        $query = $this->db->query("SELECT * FROM depts where university_id='" . $this->session->userdata('university') . "' && status='0' order by dept_id desc ");
        return $query->result();
    }

    public function upload_depts() {
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
                'dept' => $val['1'],
                '_who_added' => $this->session->userdata('user_id'),
                'university_id' => $this->session->userdata('university'),
                '_when_added' => date("Y-m-d-H-i-s")
            );
            $this->db->insert('depts', $data);
        }
        return TRUE;
    }

    public function dept_details($dept_id) {
        $this->db->from('depts');
        $this->db->where('dept_id', $dept_id);
        return $this->db->get()->row();
    }

    public function update_dept($data, $id) {
        $this->db->where('dept_id', $id);
        return $this->db->update('depts', $data);
    }
    public function insertDept($data){
       return $this->db->insert('depts',$data);
    }  

    public function delete_dept($dept_id) {
        $this->db->where('dept_id', $dept_id);
        return $this->db->update('depts', array('status' => 1));
    }

    public function dept_users($school_id) {
        $query = $this->db->query("SELECT * FROM dept_members m left JOIN users u on(m.user_id=u.user_id) where m.school_id='" . $school_id . "'");
        return $query->result();
    }

    public function delete_deptStaff($user_id) {
        $this->db->where('user_id', $user_id);
        return $this->db->delete('dept_members');
    }

    public function fetch_departmentalUsers() {
        $query = $this->db->query("SELECT u.user_id,u.name FROM users u left join user_groups g on(u.group_id=g.group_id) where g.group_name='Departmental' && g.university_id='" . $this->session->userdata('university') . "' && u.user_id not in (select dept_members.user_id  from dept_members)");
        return $query->result();
    }

    public function insert_staff($staff_id, $school_id) {
        $data = array(
            'user_id' => $staff_id,
            'school_id' => $school_id,
            '_who_added' => $this->session->userdata('user_id'),
            '_when_added' => date("Y-m-d-H-i-s")
        );
        return $this->db->insert('dept_members', $data);
    }

    public function fetch_Courses() {
        $query = $this->db->query("select c.course_id,c.course from  courses c where c.universities_university_id='" . $this->session->userdata('university') . "' && status=0 && c.course_id not in(select dc.course_id from dept_courses dc left join courses cs on(dc.course_id=cs.course_id) where cs.universities_university_id='" . $this->session->userdata('university') . "') ");
        return $query->result();
    }

    public function fetch_departmentalCourses($dept_id) {
        $query = $this->db->query("select * from courses where dept_id='" . $dept_id . "'");
        return $query->result();
    }

    public function deleteDepartmentCourse($course_id) {
        $this->db->where('course_id', $course_id);
        return $this->db->delete('dept_courses');
    }

    public function fetch_schools() {
        $query = $this->db->query("select s.*,COUNT(m.member_id) as staff,COUNT(d.dept_id) as dept from schools s
            left join depts d on(s.school_id=d.school_id)
         left join dept_members m on(s.school_id=m.school_id) where s.university_id='" . $this->session->userdata("university") . "' && s.status='0' group by s.school_id");
        return $query->result();
    }

    public function submit_school($array) {
        return $this->db->insert('schools', $array);
    }

    public function school_details($school_id) {
        $this->db->from('schools');
        $this->db->where('school_id', $school_id);
        $query = $this->db->get()->row();
        return $query;
    }

    public function update_school($array, $id) {
        $this->db->where('school_id', $id);
        return $this->db->update('schools', $array);
    }

    public function deleteSchool($school_id) {
        $this->db->where('school_id', $school_id);
        return $this->db->update('schools', array('status' => 1));
    }

}
