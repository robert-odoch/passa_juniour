<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of RegistrationController
 *
 * @author abert
 */
class Registrationcontroller extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('UniversityModel');
        $this->load->model('global/Global_model');
        $this->load->model('RegistrationModel');
        $this->load->model('courses_model');
        $this->load->model('IntakeModel');
        $this->load->model('CRUD_model');
        $this->checkSession();
    }
    public function checkSession() {
        return parent::checkSession();
    }

    public function index() {
        $data['btn'] = "Register Student";
        $data['btn_link'] = "registration/Registrationcontroller/registerStudent";
        $data['courses'] = $this->courses_model->fetch_courses();
        //$data['acad_years'] = $this->IntakeModel->fetch_academic_years();
        $data["intakes"]=  $this->CRUD_model->getRecords("intakes",array("intake_id,intake_name"),'where status=0 && university_university_id='.$this->session->userdata("university"));
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['study_years'] = $this->IntakeModel->fetch_study_years();
        $data['pageName'] = "Student Registration";
        $data['sub_page'] = "View Registered Students";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('registration/view_registered', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    
    public function registerStudent($message=null){
        $data['message'] =$message;
        $data["page"]="<a href='".  base_url("registration/Registrationcontroller")."' >Back</a>";
        $data['sub_page'] = "Register Student";
        $data['programs'] = $this->CRUD_model->getRecords("courses",array("course_id,course_code,course"),"where universities_university_id=".$this->session->userdata('university')." && status=0");
        $data['pageName'] = "Register Student";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('registration/register_student', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
     
    public function getstudents(){
        
        $course_id = $this->input->post('course_id');
        $students= $this->CRUD_model->getRecords("student",array("student_id,registration_number,name"),"where courses_course_id=".$course_id);
        $course_units= $this->CRUD_model->getRecords("assigned_units au LEFT JOIN course_units cu on (cu.id=au.course_unit) LEFT JOIN courses cs on (au.course=cs.course_id)",array("cu.id,cu.code,cu.course_unit"),"where cs.course_id=".$course_id);
  
        
        $output1="<option >--Select Student--</option>";
        $output2="<option >--Select Student--</option>";
        
        foreach($students as $student):
            $output1.="<option value='".$student["student_id"]."' >".$student["registration_number"]."- ".$student["name"]."</option>";
        endforeach;
        
        foreach($course_units as $cu):
            $output2.="<option value='".$cu["id"]."' >".$cu["code"]."</option>";
        endforeach;
         
         
         echo json_encode(array("students"=>$output1,"course_units"=>$output2));
     }
     
     public function save_student_registration(){
         
        $data=array(
             "student_student_id"=>  $this->input->post("student"),
             "year_study"=>  $this->input->post("year"),
             "semester_semester_id"=>  $this->input->post("sem"),
            "_when_added"=>date("Y-m-d H:i:s")
        );
         
        $return_id=$this->CRUD_model->insert("registered_academic_years",$data);
            
        $reg_course_units=$this->input->post("course_units");
       
        foreach ($reg_course_units as $unit):
            $temp_arr=array(
               "course_units_units_id"=>$unit,
               "student_student_id"=>$this->input->post("student"),
               "registered_academic_years_id"=>$return_id
            );
        
        $this->CRUD_model->insert("registered_course_units",$temp_arr);
        endforeach;
        
        $this->registerStudent("Student Registered Successfully");
        
     }
     
     
    public function fetchRegistered() {
        $intake = $this->input->post('intake');
        $semester = $this->input->post('semester');
        $study_year = $this->input->post("year_of_study");
       
        $array['semester_semester_id'] = $semester;
        $array['year_study'] = $study_year;
        $course_id = $this->input->post('course_id');
        $result = $this->RegistrationModel->fetch_registerdStudents($array, $course_id,$intake);
        
        $output = '';
        $output .= ' <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
            <tr>
             <th>No</th>
            <th>Registration Number</th>
            <th>Student Name</th>
            <th>Registered</th>
            <th>View Course Units</th>
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
       <td>' . ucwords($row->time_stamp) . '</td> 
       <td><a class="text-success" href="' . base_url("registration/registrationcontroller/registeredUnits/" . $row->registered_academic_years_id) . '">Registered Course units</a></td>    
         </tr>
      ';
            $count++;
        }
        $output .= '   </tbody>
    </table>';
        $export_status = false;
        if ($result != null) {
            $export_status = TRUE;
        }
        echo json_encode(array('data' => $output, 'course_id' => $course_id, 'intake' => $intake, 'study_year' => $study_year, 'semester' => $semester, 'export_btn' => $export_status));
    }

    public function exportRegistered($course_id, $intake, $study_year, $semester) {

        $array['semester_semester_id'] = $semester;
        $array['year_study'] = $study_year;
        $data = $this->RegistrationModel->fetch_registerdStudents($array, $course_id,$intake);
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()->setCreator();
        $objPHPExcel->getProperties()->setLastModifiedBy();
        $objPHPExcel->getProperties()->setTitle();
        $objPHPExcel->getProperties()->setSubject("All registered students");
        $objPHPExcel->getProperties()->setDescription("All registered students");
        $objPHPExcel->setActiveSheetIndex(0);

        $objPHPExcel->getActiveSheet()->setCellValue('A1', 'NO');
        $objPHPExcel->getActiveSheet()->setCellValue('B1', 'REG NO');
        $objPHPExcel->getActiveSheet()->setCellValue('C1', 'STUDENT NAME');
        $objPHPExcel->getActiveSheet()->setCellValue('D1', 'STUDENT REGISTERED COURSE UNITS');
        $header1 = $objPHPExcel->getActiveSheet()->mergeCells('D1:G1')->getStyle('D1');
        $header1->getFont()->setSize(12)->setBold(true);


        if ($data) {
            $current_col = 0;
            $current_row = 2;
            $count = 1;

            foreach ($data as $value) {
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($current_col, $current_row, $count);
                //move to next column
                $current_col++;
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($current_col, $current_row, $value->registration_number);
                //move to next column
                $current_col++;
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($current_col, $current_row, $value->name);

                $current_col++;
                $row = $this->RegistrationModel->registerdCourseUnit($value->registered_academic_years_id);

                foreach ($row as $unit) {
                    //determining a retake
                    if ($unit->_status == 1) {
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($current_col, $current_row, $unit->course_unit_code . " " . $unit->course_unit);
//                        $objPHPExcel->getActiveSheet()->getStyle($current_col)->getFill()
//                                ->setFillType(PHPExcel_Style_Fill::FILL_SOLID)
//                                ->getStartColor()
//                                ->setRGB('D3D3D3'); //i.e,colorcode=D3D3D3
                    } else {
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($current_col, $current_row, $unit->course_unit_code . " " . $unit->course_unit);
                    }
                    $current_col++;
                }

                //move to next row
                $current_row++;
                //reset column back to A
                $current_col = 0;
                $count++;
            }
        }




        $file_name = "studentsRegistered " . date("Y-m-d-H-i-s") . ".xlsx";

        $objPHPExcel->getActiveSheet()->setTitle("students registered");
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $file_name . '"');
        header('Cache-Control: max-age=0');
        $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $writer->save('php://output');
        exit();
    }

    function registeredUnits($registerd_year_id) {
        $data['registeredUnits'] = $this->RegistrationModel->fetch_registerdCourseUnits($registerd_year_id);
        $args = $this->RegistrationModel->studenRegistredDetails($registerd_year_id);
        $data['sub_page'] = $args->academic_year . " Semester " . $args->semester;
        $data['pageName'] = $args->firstName . " " . $args->lastName;
        $data['page'] = '<a href="' . base_url("registration/registrationcontroller") . '">Back</a>';
        $data['sub_sub_page'] = "Registered course units";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('registration/registered_units', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

}
