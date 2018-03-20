<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UnitsModel
 *
 * @author abert
 */
class UnitsModel extends CI_Model {

//put your code here

    public function fetch_assigned_units($data) {
        $this->db->from('assigned_units');
        $this->db->join('course_units', 'assigned_units.course_unit_unit_id=course_units.course_unit_id', 'left');
        $this->db->where($data);
        return $this->db->get()->result();
    }

    public function remove_unit($unit_id) {
        $this->db->where('assigned_units_id', $unit_id);
        $this->db->delete('assigned_units');
    }

    //upload course units
    public function upload_courseUnits() {
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
               $unit_exits= $this->checkUnitExists($val['0']);
               if($unit_exits<=0){
                  if($val['0'] !=null){
                    $data = array(
                    'code' => $val['0'],
                    'course_unit' => $val['1'],
                    'cu' => $val['2'],
                    '_who_added' => $this->session->userdata('user_id')
                   );
                  $this->db->insert('course_units', $data);
                 }
               }
               
            }
            return TRUE;
       
    }


    public function checkUnitExists($code){
        $this->db->where('code',$code);
        $count=$this->db->get('course_units');
        return $count->num_rows();
    }

    public function fetch_unit($unit_id) {
        $this->db->where('id', $unit_id);
        $query = $this->db->get('course_units')->row();
        return $query;
    }

    public function update_courseUnit($array, $unit_id) {
        $this->db->where('course_unit_id', $unit_id);
        return $this->db->update('course_units', $array);
    }

    public function deleteUnit($unit_id) {
        $this->db->where('id', $unit_id);
        return $this->db->update('course_units', array('_status' => 1));
    }
      public function deleteCourseUnit($unit_id){
          $this->db->where('course_unit',$unit_id);
        return $this->db->update('assigned_units', array('_status'=>1));
    }

}
