<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of grade_model
 *
 * @author abert
 */
class grade_model extends CI_Model {

    //put your code here
    public function fetch_grading() {
        $this->db->from('grading');
        $this->db->where('university_id', $this->session->userdata('university'));
        $query = $this->db->get()->result();
        return $query;
    }

    public function filter_grading($level) {
        $this->db->from('grading');
        $this->db->where('university_id', $this->session->userdata('university'));
        $this->db->where('level', $level);
        $query = $this->db->get()->result();
        return $query;
    }

    public function insertGrade($array) {
        return $this->db->insert('grading', $array);
    }

    public function fetch_single_grading($grade_id) {
        $this->db->from('grading');
        $this->db->where('grading_id', $grade_id);
        $query = $this->db->get()->row();
        return $query;
    }

    public function update_grade($array, $id) {
        $this->db->where('grading_id', $id);
        return $this->db->update('grading', $array);
    }

    public function dropGrade($grade_id) {
        $this->db->where('grading_id', $grade_id);
        return $this->db->delete('grading');
    }

    public function upload_marks_grading() {
        $filename = $_FILES["userfile"]["tmp_name"];
        $level = $this->input->post("level");
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
                    if ($val != null || $val =="0") {
                        $dataArr[$row][$col] = $val;
                    }
                }
            }
        }
        unset($dataArr[1]); // since in our example the first row is the header and not the actual data
        foreach ($dataArr as $val) {
            $data = array(
                'grade' => $val['0'],
                'value_frm' => $val['1'],
                'value_to' => $val['2'],
                'grade_value' => $val['3'],
                'progress' => $val['4'],
                'level' => $level,
                'university_id' => $this->session->userdata('university')
            );
            $this->db->insert('grading', $data);
        }
        return TRUE;
    }

}
