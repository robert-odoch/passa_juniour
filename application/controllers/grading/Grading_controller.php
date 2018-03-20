<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of grading_controller
 *
 * @author abert
 */
require_once APPPATH . 'core/Constants.php';
require(APPPATH . 'third_party/PHPExcel-1.8/Classes/PHPExcel.php');
require(APPPATH . 'third_party/PHPExcel-1.8/Classes/PHPExcel/Writer/Excel2007.php');

class Grading_controller extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('global/Global_model');
        $this->load->model('grade_model');
        $this->load->model('AdminModel');
        // $this->load->model('Downloads_Model');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function index() {
        $data['pageName'] = "Marks Grading";
        $data['page'] = '<a href="' . base_url("grading/grading_controller/view_grading") . '">Back</a>';
        $data['sub_page'] = "Add Grading";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('grading/add_grading', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function upload_grading() {
        $data['pageName'] = "Upload Marks Grading";
        $data['page'] = '<a href="' . base_url("grading/grading_controller/view_grading") . '">Back</a>';
        $data['sub_page'] = "Add Grading";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('grading/upload_grading', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function uploadGrading() {
        $success = $this->grade_model->upload_marks_grading();
        if ($success) {
            $this->session->set_flashdata('msg', "Grading Uploaded successfully");
            redirect('grading/grading_controller/upload_grading');
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again");
            redirect('grading/grading_controller/upload_grading');
        }
    }

    public function submitGrade() {
        $redirect;
        $success;
        $message;
        $array = array(
            'grade' => $this->input->post('grade'),
            'value_frm' => $this->input->post('mark_one'),
            'value_to' => $this->input->post('mark_two'),
            'grade_value' => $this->input->post('mark_value'),
            'progress' => $this->input->post('progress_status'),
            'university_id' => $this->session->userdata('university'),
        );
        $id = $this->input->post('id');
        if ($id != null) {
            $success = $this->grade_model->update_grade($array, $id);
            if ($success) {
                $message = "Grading submited successfully";
                $redirect = "grading/grading_controller/view_grading";
            } else {
                $message = "Error has occurried try again";
                $redirect = "grading/grading_controller/view_grading";
            }
        } else {
            $success = $this->grade_model->insertGrade($array);
            if ($success) {
                $message = "Grading submited successfully";
                $redirect = "grading/grading_controller";
            } else {
                $message = "Error has occurried try again";
                $redirect = "grading/grading_controller";
            }
        }
        $this->session->set_flashdata('msg', $message);
        redirect($redirect);
    }

    public function view_grading() {
        $data['pageName'] = "Marks Grading";
        $data['btn'] = "Add Grading";
        $data['btn_link'] = "grading/grading_controller";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('grading/view_grading', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function filter_grading($level) {
        $result = $this->grade_model->filter_grading($level);
        $output = '';
        $count = 1;
        $progress = "";
        foreach ($result as $row) {

            if ($row->progress == 0) {
                $progress = "Normal Progress";
            } else {
                $progress = "Retake";
            }

            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->grade) . '</td>
        <td>' . ucwords($row->value_frm) . '</td>
         <td>' . ucwords($row->value_to) . '</td>
          <td>' . ucwords($row->grade_value) . '</td>
          <td>' . $progress . '</td>    
         <td>
          <a class="text-success" href="' . base_url() . 'grading/grading_controller/editGrade/' . $row->grading_id . '" >  <i class="fa fa-pencil-square-o"> Edit</i></a> ||
           <a class="text-danger" href="#" onclick="deleteGrade(' . $row->grading_id . ')">  <i class="fa fa-trash"> Delete</i></a></td>
         </td>    
       </tr>
      ';
            $count++;
        }
        $export_status = false;
        if ($result != null) {
            $export_status = TRUE;
        }
        echo json_encode(array('data' => $output, 'export_btn' => $export_status, 'level' => $level));
    }

    public function download_grading($level) {
        // $data = $this->grade_model->filter_grading($level);
        // $viewData = array(
        //     'banner' => $this->AdminModel->fetch_banner($this->session->userdata('university')),
        //     'grading' => $data,
        //     'level' => $level
        // );
        // $view = 'grading/download_grading';
        // $name = 'course_units ' . date('Y-m-d H:i:s');
        // $this->Downloads_Model->printPdf($view, $viewData, $name, 'landscape'); //  
    }

    public function editGrade($grade_id) {
        $data['grading'] = $this->grade_model->fetch_single_grading($grade_id);
        $data['pageName'] = "Marks Grading";
        $data['page'] = '<a href="' . base_url("grading/grading_controller/view_grading") . '">Back</a>';
        $data['sub_page'] = "update Grding";
        $data['formBtn'] = "Update";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('grading/add_grading', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function deleteGrade($grade_id) {
        $this->grade_model->dropGrade($grade_id);
        echo json_encode(array('status' => TRUE));
    }

    public function export_grades() {
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()->setCreator();
        $objPHPExcel->getProperties()->setLastModifiedBy();
        $objPHPExcel->getProperties()->setTitle();
        $objPHPExcel->getProperties()->setSubject();
        $objPHPExcel->getProperties()->setDescription();
        $objPHPExcel->setActiveSheetIndex(0);

        $objPHPExcel->getActiveSheet()->setCellValue('A1', 'No');
        $objPHPExcel->getActiveSheet()->setCellValue('B1', 'Grade');
        $objPHPExcel->getActiveSheet()->setCellValue('C1', 'From');
        $objPHPExcel->getActiveSheet()->setCellValue('D1', 'To');
        $objPHPExcel->getActiveSheet()->setCellValue('E1', 'Grade Value');


        $data = $this->grade_model->fetch_grading();
        $row = 2;
        $count = 1;
        foreach ($data as $value) {
            $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $count);
            $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value->grade);
            $objPHPExcel->getActiveSheet()->setCellValue('C' . $row, $value->from);
            $objPHPExcel->getActiveSheet()->setCellValue('D' . $row, $value->to);
            $objPHPExcel->getActiveSheet()->setCellValue('E' . $row, $value->value);
            $row++;
            $count++;
        }
        $file_name = "Grading " . date("Y-m-d-H-i-s") . ".xlsx";
        $objPHPExcel->getActiveSheet()->setTitle("Grading");
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $file_name . '"');
        header('Cache-Control: max-age=0');
        $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $writer->save('php://output');
        exit();
    }

}
