<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Course_controller
 *
 * @author abert
 */
class Course_controller extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('global/Global_model');
        $this->load->model('UniversityModel');
        $this->load->model('courses_model');
        $this->load->model('Sch_model');
         $this->load->model('CRUD_model');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    function add_course() {
        $data['pageName'] = "Subject";
        $data['sub_page'] = "Upload courses";
        $data['content'] = $this->load->view('courses/add_course', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    
    public function singleCourse(){
         $data['pageName'] = "Add Subject";
        $data['content'] = $this->load->view('courses/register_course', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function uploadCourses() {
        $level = $this->input->post("level");
        $dept = $this->input->post('dept');
        if ($level != "null" && $dept != "null") {
            $success = $this->courses_model->upload_courses();
            if ($success) {
                $this->session->set_flashdata('msg', "<div class=\"alert alert-success col-md-6\">courses Uploaded successfully</div>");
                redirect('courses/course_controller/courses');
            } else {
                $this->session->set_flashdata('msg', "<div class=\"alert alert-danger col-md-6\">Error has occurried,please upload using courses template</div>");
                redirect('courses/course_controller/add_course');
            }
        } else {
            $this->session->set_flashdata('msg', "<div class=\"alert alert-danger col-md-6\">please select both the department and the graduate level</div>");
            redirect('courses/course_controller/add_course');
        }
    } 

    public function courses() {
         $data['btn'] = "Add Subject";
        $data['btn_link'] = "courses/Course_controller/singleCourse";
                $data['courses'] = $this->CRUD_model->getRecords('subjects',array('*'),"where _status='1'");
        $data['pageName'] = "Subjects";
        $data['content'] = $this->load->view('courses/view_courses', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function filter_courses($level) {
        $result = $this->courses_model->filter_courses($level);
        $output = '';
        $count = 1;
        $progress = "";
        foreach ($result as $row) {
            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->course_code) . '</td>
        <td>' . ucwords($row->course) . '</td>  
         <td>
          <a class="text-success" href="' . base_url() . 'courses/course_controller/editCourse/' . $row->course_id . '" >  <i class="fa fa-pencil-square-o"> Edit</i></a> ||
           <a class="text-danger" href="#" onclick="deleteCourse(' . $row->course_id . ')">  <i class="fa fa-trash"> Delete</i></a></td>
         </td>    
       </tr>
      ';
            $count++;
        }
        echo json_encode($output);
    }

    public function editCourse($course_id) {
        $data['course'] = $this->courses_model->fetchCourse($course_id);
        $data['depts'] = $this->Sch_model->fetch_department();
        $data['pageName'] = "Courses";
        $data['page'] = '<a href="' . base_url("courses/course_controller/courses") . '">Back</a>';
        $data['sub_page'] = "Update Course";
        $data['formBtn'] = "update";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('courses/register_course', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitCourse() {
        $id = $this->input->post('id');
        $array = array(
            'name' => $this->input->post('courseName')
        );
        if ($id != null) {
            $this->CRUD_model->updateRecord('subjects',$array, $id);
            $this->session->set_flashdata('msg', "course updated successfully");
        }else{
             $this->CRUD_model->insert('subjects',$array); 
             $this->session->set_flashdata('msg', "subject inserted successfully");
        }
        redirect('courses/Course_controller/courses');
    }

    public function exportCourses() {
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()->setCreator();
        $objPHPExcel->getProperties()->setLastModifiedBy();
        $objPHPExcel->getProperties()->setTitle();
        $objPHPExcel->getProperties()->setSubject();
        $objPHPExcel->getProperties()->setDescription();
        $objPHPExcel->setActiveSheetIndex(0);

        $objPHPExcel->getActiveSheet()->setCellValue('A1', 'CODE');
        $objPHPExcel->getActiveSheet()->setCellValue('B1', 'COURSE');
        $data = $this->courses_model->fetch_courses();
        $row = 2;
        foreach ($data as $value) {
            $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $value->course_code);
            $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value->course);
            $row++;
        }
        $file_name = "Courses " . date("Y-m-d-H-i-s") . ".xlsx";
        $objPHPExcel->getActiveSheet()->setTitle("All courses");
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $file_name . '"');
        header('Cache-Control: max-age=0');
        $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $writer->save('php://output');
        exit();
    }

}
