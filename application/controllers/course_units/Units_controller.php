<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Units_controller
 *
 * @author abert
 */
class Units_controller extends MY_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('global/Global_model');
        $this->load->model('UniversityModel');
        $this->load->model('UnitsModel');
        $this->load->model('courses_model');
        $this->load->model('IntakeModel');
        // $this->load->model('Downloads_Model');
        $this->load->model('AdminModel');
        $this->checkSession();
        $this->load->model('CRUD_model');
       
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function course_units(){
        $data["pageName"]="View Class";
        $data['sub_page'] = "All school classes";
        $data['classes']=$this->CRUD_model->getRecords('`classes` a left join school_classes b on(a.id=b.class_id) left join class_subjects c on(b.id=c.class_id)',array('b.id as `id`','b._when_added','a.name','count(c.id) as count_subjects'),"where b.school_id='".$this->session->userdata("USERMM_school")."' and a._status='1' group by a.id");
        
     $data['content'] = $this->load->view('course_units/general_course_units', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

  public function class_subjects($class_id){
    $res=$this->CRUD_model->getRecord('classes',array('name'),"where id='".$class_id."'");
         $data['pageName'] = "".$res->name." Subjects";
        $data['sub_page'] = "Subjects";
        $data['page'] = '<a href="' . base_url("course_units/units_controller/course_units") . '">Back</a>';
         $data['subjects']=$this->CRUD_model->getRecords('subjects a left join class_subjects b on(a.id=b.subject_id)',array('*'),"where b.class_id='".$class_id."'");
        $data['content'] = $this->load->view('course_units/class_subjects', $data, true);
        $this->load->view('layout/_layout_main', $data);
  }

    public function addCourseUnit(){
        $data['pageName'] = "Course Units";
        $data['sub_page'] = "Add course unit";
        $data['page'] = '<a href="' . base_url("course_units/units_controller/course_units") . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('course_units/add_unit', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }
    public function editUnit($id){
     $data['unit']= $this->CRUD_model->getRecord('course_units',array('id','code','course_unit','cu'),"where id='".$id."'");
      $data['pageName'] = "Course Units";
        $data['sub_page'] = "Update course unit";
        $data['page'] = '<a href="' . base_url("course_units/units_controller/course_units") . '">Back</a>';
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('course_units/add_unit', $data, true);
        $this->load->view('layout/_layout_main', $data);

    }

    function add_courseUnits() {
        $data['pageName'] = "Course Units";
        $data['sub_page'] = "Upload course units";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('course_units/add_courseUnits', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function uploadCourseUnits() {
            $success = $this->UnitsModel->upload_courseUnits();
            if ($success) {
                $this->session->set_flashdata('msg', "course Units Uploaded successfully");
                redirect('course_units/units_controller/view_units');
            } else {
                $this->session->set_flashdata('msg', "Error has occurried, please upload with course units template !!");
                redirect('course_units/units_controller/add_courseUnits');
            }
    }

    function view_units() {
        $data['pageName'] = "Course Units";
        $data['sub_page'] = "View Assigned Course Units";
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['study_years'] = $this->IntakeModel->fetch_study_years();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('course_units/view_courseUnits', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    function fetch_course_units() {
        $course_id = $this->input->post('course');
        $semester = $this->input->post('semester');
        $study_year = $this->input->post('study_year');
        $result = $this->courses_model->fetch_course_units($course_id,$semester,$study_year);
        $output = '';
        $output .= ' <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
            <tr>
                <th>No</th>
                <th>Course Unit Code</th>
                <th>Course Unit</th>
                <th>Credit Unit</th>
                <td>Action</td>
            </tr>
        </thead>
        <tbody>';
        $count = 1;
        foreach ($result as $row) {
            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->code) . '</td>
       <td>' . ucwords($row->course_unit) . '</td>
         <td>' . ucwords($row->cu) . '</td> 
         <td>
        <a href="#" class="text-danger" onclick="delete_Unit('.$row->_id.')"><i class="fa fa-trash-o fa-fw "></i>Delete</a> </td>    
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
        echo json_encode(array('data' => $output, 'course_id' => $course_id, 'export_btn' => $export_status));
    }

    public function deassignUnit($id){
   $this->CRUD_model->updateRecord('assigned_units',array('_status'=>1),array('id'=>$id));
     echo json_encode(array('status'=>true));
    }

    public function export_units($course_id) {
        $data = $this->courses_model->fetch_course_units($course_id);
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()->setCreator();
        $objPHPExcel->getProperties()->setLastModifiedBy();
        $objPHPExcel->getProperties()->setTitle();
        $objPHPExcel->getProperties()->setSubject("All course units");
        $objPHPExcel->getProperties()->setDescription("I have attached all course units");
        $objPHPExcel->setActiveSheetIndex(0);

        $objPHPExcel->getActiveSheet()->setCellValue('A1', 'CODE');
        $objPHPExcel->getActiveSheet()->setCellValue('B1', 'COURSE UNITS');
        $objPHPExcel->getActiveSheet()->setCellValue('C1', 'CU');
        $row = 2;
        foreach ($data as $value) {
            $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $value->course_unit_code);
            $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value->course_unit);
            $objPHPExcel->getActiveSheet()->setCellValue('C' . $row, $value->cu);
            $row++;
        }
        $file_name = "CourseUnits " . date("Y-m-d-H-i-s") . ".xlsx";

        $objPHPExcel->getActiveSheet()->setTitle('course units');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $file_name . '"');
        header('Cache-Control: max-age=0');
        $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $writer->save('php://output');
        exit();
    }

    public function download_all_units($course_id) {
        // $data = $this->courses_model->fetch_course_units($course_id);
        // $viewData = array(
        //     'course_name' => $this->courses_model->fetchCourse($course_id),
        //     'banner' => $this->AdminModel->fetch_banner($this->session->userdata('university')),
        //     'course_units' => $data
        // );
        // $view = 'course_units/download_all';
        // $name = 'course_units ' . date('Y-m-d H:i:s');
        // $this->Downloads_Model->printPdf($view, $viewData, $name, 'protrait'); //landscape
    }
    public function deleteCourseUnit($unit_id){
         $this->UnitsModel->deleteCourseUnit($unit_id);
        echo json_encode(array('status' => TRUE));
    }

    public function deleteUnit($unit_id) {
        $this->UnitsModel->deleteUnit($unit_id);
        echo json_encode(array('status' => TRUE,'data'=>$unit_id));
    }

    public function editCourseUnit($unit_id) {
        $data['unit'] = $this->UnitsModel->fetch_unit($unit_id);
        $data['pageName'] = "Course Units";
        $data['page'] = '<a href="' . base_url("course_units/Units_controller/view_units") . '">Back</a>';
        $data['sub_page'] = "Update Course Unit";
        $data['formBtn'] = "Update";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('course_units/addUnit', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitUnit() {
        $id = $this->input->post('id');
       $code= $this->input->post('code');
        $data = array(
            'code' =>$code ,
            'course_unit' => $this->input->post('course_unit'),
            'cu' => $this->input->post('cu'),
            'university_id'=>$this->session->userdata('university')
        );
        if($id !=null){
            $this->CRUD_model->updateRecord('course_units',$data,array('id'=>$id));
               $this->session->set_flashdata('msg', "Record updated successfully");
        }else{

       $status= $this->CRUD_model->insert('course_units',$data );
       if($status){
         $this->session->set_flashdata('msg', "Record added successfully");
     }else{
         $this->session->set_flashdata('msg', "OOps Error has occurried");
     }
    }
       redirect('course_units/Units_controller/course_units');
    }
    public function courseUnits() {
        $course_id = $this->input->post('course');
        $data['course_units'] = $this->UniversityModel->fetch_courseUnits($course_id);
    }

    public function exportCourseUnits($course_id) {
        $data = $this->UniversityModel->fetch_courseUnits($course_id);
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()->setCreator();
        $objPHPExcel->getProperties()->setLastModifiedBy();
        $objPHPExcel->getProperties()->setTitle();
        $objPHPExcel->getProperties()->setSubject("All course units");
        $objPHPExcel->getProperties()->setDescription("I have attached all course units");
        $objPHPExcel->setActiveSheetIndex(0);

        $objPHPExcel->getActiveSheet()->setCellValue('A1', 'CODE');
        $objPHPExcel->getActiveSheet()->setCellValue('B1', 'COURSE UNITS');
        $row = 2;
        foreach ($data as $value) {
            $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $value->course_unit_code);
            $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value->course_unit);
            $row++;
        }
        $file_name = "CourseUnits " . date("Y-m-d-H-i-s") . ".xlsx";
        $result = $this->db->from('courses')->where('course_id', $course_id)->get()->row();

        $objPHPExcel->getActiveSheet()->setTitle($result->course);
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $file_name . '"');
        header('Cache-Control: max-age=0');
        $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $writer->save('php://output');
        exit();
    }

    //assigned course units  to academic years
    public function assigned_units() {
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['acad_years'] = $this->IntakeModel->fetch_academic_years();
        $data['study_years'] = $this->IntakeModel->fetch_study_years();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['pageName'] = "Assigned Course Units";
        $data['btn'] = "Assign Course Units";
        $data['btn_link'] = "course_units/units_controller/assign_Units";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('course_units/assigned_course_units', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function fetch_sem_units() {
        $course_id = $this->input->post('course_id');
        $academic_year = $this->input->post('academic_year');
        $semester = $this->input->post('semester');
        $year_study = $this->input->post("year_study");
        $res['course_course_id'] = $course_id;
        $res['academic_academic_year_id'] = $academic_year;
        $res['semester_semester_id'] = $semester;
        $res['year_study'] = $year_study;


        $result = $this->UnitsModel->fetch_assigned_units($res);
        $output = '';
        $count = 1;
        foreach ($result as $row) {
            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->course_unit_code) . '</td>
       <td>' . ucwords($row->course_unit) . '</td>
         <td>' . ucwords($row->cu) . '</td> 
        <td><a href="" onclick="un_assign(' . $row->assigned_units_id . ')">Un-assign</a> </td>    
       </tr>
      ';
            $count++;
        }
        $export_status = false;
        if ($result != null) {
            $export_status = TRUE;
        }
        echo json_encode(
                array(
                    'units' => $output,
                    'export_btn' => $export_status,
                    'course_id' => $course_id,
                    'academic_year' => $academic_year,
                    'semester' => $semester)
        );
    }

    //export assigned course units
    public function export_assigned($semester, $academic_year, $course_id) {
        $res['course_course_id'] = $course_id;
        $res['academic_academic_year_id'] = $academic_year;
        $res['semester_semester_id'] = $semester;
        $data = $this->UnitsModel->fetch_assigned_units($res);

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()->setCreator();
        $objPHPExcel->getProperties()->setLastModifiedBy();
        $objPHPExcel->getProperties()->setTitle();
        $objPHPExcel->getProperties()->setSubject("course units");
        $objPHPExcel->getProperties()->setDescription("assigned course units");
        $objPHPExcel->setActiveSheetIndex(0);

        $objPHPExcel->getActiveSheet()->setCellValue('A1', 'CODE');
        $objPHPExcel->getActiveSheet()->setCellValue('B1', 'COURSE UNIT');
        $row = 2;
        foreach ($data as $value) {
            $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $value->course_unit_code);
            $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value->course_unit);
            $row++;
        }
        $file_name = "CourseUnits " . date("Y-m-d-H-i-s") . ".xlsx";
//        $result = $this->db->from('courses')->where('course_id', $course_id)->get()->row();

        $objPHPExcel->getActiveSheet()->setTitle('COURSE UNITS');
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $file_name . '"');
        header('Cache-Control: max-age=0');
        $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $writer->save('php://output');
        exit();
    }

    //download pdf

    // public function download_assigned($semester, $academic_year, $course_id) {
    //     $res['course_course_id'] = $course_id;
    //     $res['academic_academic_year_id'] = $academic_year;
    //     $res['semester_semester_id'] = $semester;
    //     $data = $this->UnitsModel->fetch_assigned_units($res);

    //     $viewData = array(
    //         'course_name' => $this->courses_model->fetchCourse($course_id),
    //         'banner' => $this->AdminModel->fetch_banner($this->session->userdata('university')),
    //         'course_units' => $data,
    //         'semester' => $this->UniversityModel->single_semester($semester),
    //         'academic_year' => $this->IntakeModel->fetch_academic_year($academic_year),
    //     );
    //     //Downloads_Model

    //     $view = 'course_units/download_units';
    //     $name = 'course_units ' . date('Y-m-d H:i:s');
    //     $this->Downloads_Model->printPdf($view, $viewData, $name, 'protrait'); //landscape
    // }

    public function un_assign_unit($unit_id) {
        $this->UnitsModel->remove_unit($unit_id);
        echo json_encode(array('status' => TRUE));
    }

    public function assign_Units() {
        $data['pageName'] = "Course Units";
        $data['page'] = "Assign Course Units To semester";
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['study_years'] = $this->IntakeModel->fetch_study_years();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        // $data['output']=$this->CRUD_Model->get("course_units",array('id','code','course_unit '),"where _status='0' and university_id='".$this->session->userdata("university")."'");
        $data['content'] = $this->load->view('course_units/assgin_units', $data, true);
       
        $this->load->view('layout/_layout_main', $data);
    }
    public function submitSelectedUnits(){
      
    $selected_units = json_decode(stripslashes($_POST['items']));
      foreach ($selected_units as $value) {
        $data['course']=$value[0];
        $data['year_study']=$value[2];
         $data['semeter']=$value[3];
        $data['course_unit']=$value[4];
       $this->CRUD_model->insert('assigned_units',$data);
      }
      echo json_encode(array("data"=>$data));
    }

    public function fetch_unassigned($course_id){
         // $result = $this->CRUD_model->getRecords("course_units",array('id','code','course_unit '),"where _status='0'and  university_id='".$this->session->userdata("university")."' and id not in(select course_unit from assigned_units where course='".$course_id."') ");

            $result = $this->CRUD_model->getRecords("course_units",array('id','code','course_unit '),"where _status='0'and  university_id='".$this->session->userdata("university")."' ");

            $option = '';
        if (count($result) === 0) {
            $option = 'Nothing to select ';
        } else {
            $option = '--Select Course Unit--';
        }
        $html = '';
        foreach ($result as $row) {
            $html .= '<option value ="' . $row['id'] . '">' . $row['code'] . '</option>';
        }
        echo json_encode($html);




    //     $output = '';
    //     $output .= ' <table>

    //     <thead>
    //         <tr>
    //             <th>Code</th>
    //             <th>Course Unit</th>
    //             <td>Action</td>
    //         </tr>
    //     </thead>
    //     <tbody>';
    //     $count = 1;
    //     foreach ($result as $row) {
    //         $output .= '
    //    <tr>
    //     <td>' . ucwords($row->code) . '</td>
    //    <td>' . ucwords($row->course_unit." ".$row->id) . '</td> 
    //    <td><input type="checkbox" name="checkbox[]" value="'.$row->id.'"/></td>
    //    </tr>
    //   ';
    //         $count++;
    //     }
    //     $output .= '   </tbody>
    // </table>';
       
    //     echo json_encode($output);
    }

    public function all_units() {
        $course_id = $this->input->post('course');
        $year = $this->input->post('year');
        $semester = $this->input->post('semester');

        $result = $this->courses_model->fetch_courseUnits($year, $semester, $course_id);
        $html = '';

        $html = '<select multiple="multiple" id="my-select" name="my-select[]">';
        foreach ($result as $row) {
            $html .= '<option value ="' . $row->course_unit_id . '">' . $row->course_unit . '</option>';
        }
        $html .= '</select>';
        echo json_encode($html);
    }

    public function submitYearUnits() {
        $units = $this->input->post('my-select[]');
        foreach ($units as $value) {
            $data['academic_academic_year_id'] = $this->input->post('year');
            $data['semester_semester_id'] = $this->input->post('semester');
            $data['course_course_id'] = $this->input->post('course');
            $data['year_study'] = $this->input->post("study_year");
            $data['course_unit_unit_id'] = $value;
            $this->db->insert('assigned_units', $data);
        }
        $this->session->set_flashdata('msg', "course Units assigned successfully");
        redirect('course_units/units_controller/assign_Units');
    }

}
