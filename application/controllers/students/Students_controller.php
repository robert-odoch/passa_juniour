<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Students_controller
 *
 * @author abert
 */
class Students_controller extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('IntakeModel');
        $this->load->model('global/Global_model');
        $this->load->model('UniversityModel');
        $this->load->model('courses_model');
        $this->load->model('students_model');
        $this->checkSession();
         $this->load->model('CRUD_model');
    }

    public function checkSession() {
        return parent::checkSession();
    }

    function add_students() {
        $data['pageName'] = "Students";
        $data['sub_page'] = "Upload students";
        $data['content'] = $this->load->view('students/add_students', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function uploadCourseStudents() {
        $success = $this->students_model->uploadCourseStudents();
        if ($success) {
            $this->session->set_flashdata('msg', "students Uploaded successfully");
            redirect('students/Students_controller/add_students');
        }
    }
// 
    function view_students() {
        $data['students']=$this->CRUD_model->getRecords('students',array('*')," where school_id='".$this->session->userdata('USERMM_school')."'");
        $data['content'] = $this->load->view('students/view_students', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    public function add_student(){
        $data['pageName'] = "Students";
        $data['content'] = $this->load->view('students/add_student', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }


    public function test(){
    $USERMM_school=$this->session->userdata('USERMM_school');
    echo $USERMM_school;
    }
    public function insertStudent(){
        $data=array(
             'name'=>$this->input->post('student_name'),
              'email'=>$this->input->post('email'),
              'phone_number'=>$this->input->post('phone_number'),
              'parent'=>$this->input->post('parent'),
              'school_id'=>$this->session->userdata('USERMM_school'),
        );
        $this->CRUD_model->insert('students',$data);
         $this->session->set_flashdata('msg', "student added successfully");
         redirect('students/Students_controller/add_student');
    }

    function students() {
        $course_id = $this->input->post('course_id');
        $intake = $this->input->post('intake');
        $result = $this->students_model->fetch_course_students($course_id, $intake);

        $output = '';
        $output .= '<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">';
        $output .= '<thead>
            <tr>
                <th>No</th>
                <th>Reg No:</th>
                <th>Student Name</th>
                <th>Gender</th>
                <th>Phone</th>
                <th>Email</th>
                 <th>Nationality</th>
                <td>Action</td>
            </tr>
        </thead>
        <tbody>';
        $count = 1;
        foreach ($result as $row) {
            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->registration_number) . '</td>
       <td>' . ucwords($row->name) . '</td>
          <td>' . ucwords($row->gender) . '</td> 
              <td>' . ucwords($row->contact) . '</td> 
             <td>' . ucwords($row->email) . '</td> 
                 <td>' . ucwords($row->nationality) . '</td> 
         <td><a href="'.base_url("students/students_controller/edit_student/".$row->student_id).'" id="edit-button"><i class="fa fa-edit fa-fw"></i></a>
        <a href="#" onclick="delete_cat(' . $row->student_id . ')"><i class="fa fa-trash-o fa-fw"></i></a> </td>    
       </tr>
      ';
            $count++;
        }
        $output .= '</tbody>
            </table>';
        echo json_encode($output);
    }

    public function edit_student($student_id){
        $data['user']=$this->CRUD_model->getRecord('student',array('student_id','registration_number',"name",'contact','email','nationality','courses_course_id','intake_intake_id'),"where student_id='".$student_id."'");
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['intakes'] = $this->IntakeModel->fetch_intakes();
        $data['pageName'] = "Students";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('students/add_student', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function exportStudents() {
        $course_id = $this->input->post('course_exp');
        $intake = $this->input->post('intake_exp');
        $data = $this->students_model->fetch_course_students($course_id, $intake);


        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()->setCreator();
        $objPHPExcel->getProperties()->setLastModifiedBy();
        $objPHPExcel->getProperties()->setTitle();
        $objPHPExcel->getProperties()->setSubject();
        $objPHPExcel->getProperties()->setDescription();
        $objPHPExcel->setActiveSheetIndex(0);

        $objPHPExcel->getActiveSheet()->setCellValue('A1', 'No');
        $objPHPExcel->getActiveSheet()->setCellValue('B1', 'Registration Number');
        $objPHPExcel->getActiveSheet()->setCellValue('C1', 'First Name');
        $objPHPExcel->getActiveSheet()->setCellValue('D1', 'Last Name');
        $objPHPExcel->getActiveSheet()->setCellValue('E1', 'Gender');
        $objPHPExcel->getActiveSheet()->setCellValue('F1', 'Phone');
        $objPHPExcel->getActiveSheet()->setCellValue('G1', 'Email');
        $row = 2;
        $count = 1;
        foreach ($data as $value) {
            $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $count);
            $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value->registration_number);
            $objPHPExcel->getActiveSheet()->setCellValue('C' . $row, $value->firstName);
            $objPHPExcel->getActiveSheet()->setCellValue('D' . $row, $value->lastName);
            $objPHPExcel->getActiveSheet()->setCellValue('E' . $row, $value->gender);
            $objPHPExcel->getActiveSheet()->setCellValue('F' . $row, $value->contact);
            $objPHPExcel->getActiveSheet()->setCellValue('G' . $row, $value->email);
            $row++;
            $count++;
        }
        $file_name = "Students " . date("Y-m-d-H-i-s") . ".xlsx";
        $objPHPExcel->getActiveSheet()->setTitle("Students");
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $file_name . '"');
        header('Cache-Control: max-age=0');
        $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $writer->save('php://output');
        exit();
    }

}
