<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of payments_controller
 *
 * @author hp
 */
class Payments_controller extends MY_Controller {

    //put your code here
    function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->model('global/Global_model');
        $this->load->model('UniversityModel');
        $this->load->model('courses_model');
        $this->load->model('IntakeModel');
        $this->load->model('Payments_model');
        $this->load->model('AdminModel');
        $this->load->model('Downloads_Model');
        $this->load->model('Complaints_model');
        $this->load->model('Users_model');
        $this->checkSession();
        $this->load->model('CRUD_model');
    }

    public function checkSession() {
        return parent::checkSession();
    }

    public function activated_students() {
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['study_year'] = $this->IntakeModel->fetch_study_years();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['intakes'] = $this->IntakeModel->fetch_intakes();
        $data['pageName'] = "Student Activation";
        $data['page'] = "Student registration Activation";
        $data['sub_page'] = "Activated students";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/activated', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

      
    public function filter_activated() {
        $course_id = $this->input->post('course_id');
        $study_year = $this->input->post('study_year');
        $semester = $this->input->post('semester');
        $intake_id = $this->input->post('intake_id');

        $result = $this->Payments_model->filter_activated($course_id, $semester, $study_year, $intake_id);
        $output = '';
        $output .= '<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
            <th>No</th>
            <th>Registration Number</th>
            <th>Student Name</th>
            
            <th>Activate</th>
        </thead>
        <tbody>';
        $count = 1;
        foreach ($result as $row) {
            $status = '';
            if ($row->_status == 1) {
                $status = ' <a class="text-success" href="#" onclick="blockUser(' . $row->registered_academic_years_id . ')" > 
                            <i class="fa fa-eye"> Deactivate</i></a> ';
            } else {
                $status = '<a class="text-danger" href="#"  onclick="UnblockUser(' . $row->registered_academic_years_id . ')"> 
                            <i class="fa fa-eye-slash"> Activate</i></a> ';
            }
            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->registration_number) . '</td>
       <td>' . ucwords($row->name) . '</td>
          <td>' . $status . '</td>   
     </tr>
      ';
            $count++;
        }
        $output .= '   </tbody>
    </table>';

        echo json_encode($output);
    }

    public function deactivate($registration_id) {
        $success = $this->Payments_model->deactivate($registration_id);
        if ($success) {
            echo json_encode(array('status' => TRUE));
        }
    }

    public function activate_student($registration_id) {
        $success = $this->Payments_model->activate($registration_id);
        if ($success) {
            echo json_encode(array('status' => TRUE));
        }
    }

    public function tuition() {
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['pageName'] = "Fees Structure";
        $data['sub_page'] = "All Programs Fees Structure";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/fees_structure', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function course_frees($course_id) {
        $row = $this->db->where('course_id', $course_id)->get('courses')->row();
        $data['study_year'] = $this->IntakeModel->fetch_study_years();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['pageName'] = $row->course;
        $data['amount'] = $this->Payments_model->course_fees($course_id);
        $data['page'] = '<a href="' . base_url("payments/payments_controller/tuition") . '">Back</a>';
        $data['sub_page'] = "Fees Structure";
        $data['btn'] = "Add Fees Structure";
        $data['btn_link'] = "payments/payments_controller/add_fees/" . $course_id;
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/course_fees_structure', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_fees($course_id) {
        $university_id = $this->session->userdata('university');
        $row = $this->db->where('course_id', $course_id)->get('courses')->row();
        $data['pageName'] = $row->course;
        $data['categories'] = $this->Payments_model->fetch_assigned_fees($course_id, $university_id);
        $data['page'] = '<a href="' . base_url("payments/payments_controller/course_frees/" . $course_id) . '">Back</a>';
        $data['sub_page'] = "Add Fees Structure";
        $data['course_id'] = $course_id;
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/add_fees_structure', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitStucture() {
        $id = $this->input->post('id');
        $course_id = $this->input->post('course_id');
        $study_year = $this->input->post('category');
        $array = array(
            'fees_category' => $study_year,
            'course_id' => $course_id,
            'amount' => $this->input->post('amount'),
            '_when_added' => date('Y-m-d'),
            '_who_added' => $this->session->userdata('user_id')
        );

        if ($id != null) {
            $success = $this->Payments_model->update_fees($id, $array);
            if ($success) {
                $this->session->set_flashdata('msg', "Fees updated successfully");
                redirect('payments/payments_controller/course_frees/' . $course_id);
            } else {
                $this->session->set_flashdata('msg', "Error Has Occudied try again");
                redirect('payments/payments_controller/add_fees/' . $course_id);
            }
        } else {

            $success = $this->Payments_model->insert_fees($array);
            if ($success) {
                $this->session->set_flashdata('msg', "Fees Added successfully");
                redirect('payments/payments_controller/course_frees/' . $course_id);
            } else {
                $this->session->set_flashdata('msg', "Error Has Occudied try again");
                redirect('payments/payments_controller/add_fees/' . $course_id);
            }
        }
    }

    public function editFees($fees_id) {
        $data['fees'] = $this->Payments_model->editFees($fees_id);
        $row = $this->db->where('fees_id', $fees_id)->get('fees_Structure')->row();
        $row2 = $this->db->where('course_id', $row->course_id)->get('courses')->row();
        $data['pageName'] = $row2->course;
        $data['study_year'] = $this->IntakeModel->fetch_study_years();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['page'] = '<a href="' . base_url("payments/payments_controller/course_frees/" . $row->course_id) . '">Back</a>';
        $data['sub_page'] = "Edit Fees Structure";
        $data['course_id'] = $row->course_id;
        $data['formBtn'] = "Update Frees Structure";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/add_fees_structure', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function deleteFees($fees_id) {
        $success = $this->Payments_model->delete_fees($fees_id);
        if ($success) {
            echo json_encode(array('status' => TRUE));
        }
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
           
         </td>    
       </tr>
      ';
            $count++;
        }
        echo json_encode($output);
    }

    public function student_paid() {
        $data['btn'] = "Download PDF";
        $data['btn_link'] = "payments/payments_controller/download_paid";
        $data['pageName'] = "Paid Students";
        $data['sub_page'] = "Students' payments";
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['intakes'] = $this->IntakeModel->fetch_intakes();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['study_years'] = $this->IntakeModel->fetch_study_years();
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/paid_students', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function students_permits(){
        
        $data['pageName'] = "Students' Permits";
        $data['sub_page'] = "Print students' permits";
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['intakes'] = $this->IntakeModel->fetch_intakes();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['study_years'] = $this->IntakeModel->fetch_study_years();
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/students_permits', $data, true);
        $this->load->view('layout/_layout_main', $data);    
    }
    
    public function get_students_for_permits(){
       
        $program_id=  $this->input->post("course_id");
        $intake=  $this->input->post("intake");
        $year_of_study=  $this->input->post("year_of_study");
        $semester=  $this->input->post("semester");
        
       $students=  $this->CRUD_model->getRecords("student st",array("st.student_id, st.registration_number, st.name"),"WHERE st.courses_course_id=".$program_id." AND st.intake_intake_id=".$intake);
        
        $table_string='<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Registration Number</th>
                                <th>Student Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>';
        

        $count=1;
        foreach ($students as $student):
        $table_string.="<tr>
                      <td>".$count."</td>
                      <td>".$student["registration_number"]."</td>
                      <td>".$student["name"]."</td>
                      <td><a href='#' onclick='get_print_data(".$student["student_id"].",".$year_of_study.",".$semester.")'>Print Permit</a></td>
                      </tr>";
        $count++;
        endforeach;
        
        $table_string.='</tbody>
                        </table>';
        
        echo json_encode(array("result"=>$table_string));
    }
    
    public function generate_single_permit($std_id,$year_of_study,$semester){
//       st.registration_number as reg_no,
//       st.name,c.course_code as prog_code ,
//       c.course as prog_name,
//       u.university
        
        $out_put_string="";
        
        $top_records=$this->CRUD_model->getRecord("student st LEFT JOIN courses c on (st.courses_course_id=c.course_id) LEFT JOIN universities u on (u.university_id=st.universities_university_id)",array("st.registration_number as reg_no,st.name,c.course_code as prog_code ,c.course as prog_name,u.university"),"WHERE st.student_id=".$std_id);
        
        $top_info="<center><h4>EXAMINATION PERMIT FOR ".  strtoupper($top_records->name)."</h4></center>";
        
        $top_info_table='<table cellspacing="0" border="0" width="100%">
                         <tbody>';
        
        $top_info_table.="<tr><td><b>Registration Number.</b> ".strtoupper($top_records->reg_no)."</td><td><b>Semester.</b> ".$semester."</td></tr>";
        $top_info_table.="<tr><td><b>Student Name.</b> ".strtoupper($top_records->name)."</td><td><b>Year Of Study.</b> ".$year_of_study."</td></tr>";
        $top_info_table.="<tr><td><b>Program.</b> ".strtoupper($top_records->prog_name)."</td><td><b>Program Code.</b> ".strtoupper($top_records->prog_code)."</td></tr>";
        
        
        $top_info_table.="</tbody></table>";
        
        $table_heading="<br><h3>Registered Course Units</h3>";
        
        $course_units=  $this->CRUD_model->getRecords("registered_academic_years ry INNER JOIN registered_course_units ru on (ru.registered_academic_years_id=ry.registered_academic_years_id) LEFT JOIN course_units cus on (ru.course_units_units_id=cus.id)",array("cus.id,cus.code,cus.course_unit,cus.cu "),"WHERE (ry.year_study=".$year_of_study." AND ry.student_student_id=".$std_id." AND ry.semester_semester_id=".$semester.")");
        
        $course_units_table='<table id="example2" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
                            
                            <thead>
                                <tr>
                                    <th>Course Code</th>
                                    <th>Course Name</th>
                                    <th>Cu</th>
                                </tr>
                            </thead>
                            <tbody>';
        
        foreach($course_units as $course_unit):
            
           $course_units_table.="
                                <tr>
                                <td>".$course_unit["code"]."</td>
                                <td>".$course_unit["course_unit"]."</td>
                                <td>".$course_unit["cu"]."</td>
                                </tr>
                                "; 
        endforeach;
        
        $course_units_table.="</tbody></table>";
        
        //add the data to the out put string
        $out_put_string.=$top_info;
        $out_put_string.=$top_info_table;
        $out_put_string.=$table_heading;
        $out_put_string.=$course_units_table;
        

        $name = $top_records->name.'Examination Permit' . date('Y-m-d H:i:s');
        $view = 'payments/download_permit';
        $balance=$this->Payments_model->get_std_bal($std_id)->amount;

        $account_status="<center><h3>ACCOUNT STATUS</h3> <b>TOTAL :</b> ".$balance." ".(($balance<0)?"CREDIT":"DEBIT")."</center>";
        $out_put_string.=$account_status;
        
        $out_put_string.="<div class='' ><center>Print Date: ".date('Y-m-d')."</center></div>";

        $viewData=array();
        $viewData["banner"]=$this->AdminModel->fetch_banner($this->session->userdata('university'));
        $viewData["content"]=$out_put_string;
        $this->Downloads_Model->printPdf($view, $viewData, $name, 'landscape');
        //echo json_encode(array("data"=>$out_put_string));
    }
    
    
    public function download_reciepts(){
        
        $intake=$this->session->userdata('my_intake');
        $semester=$this->session->userdata('my_semester');
        $study_year=$this->session->userdata('my_study_yr');
        $student_id=$this->session->userdata('student_id');
        
        $course_id=$this->session->userdata('my_course_id');
        $university_id=$this->session->userdata('university');
        
        $row = $this->db->where('student_id', $student_id)->get('student')->row();
        $row1 = $this->db->where('year_id', $study_year)->get('study_year')->row();
        $row2 = $this->db->where('semester_id', $semester)->get('semesters')->row();
        
        $result = $this->Payments_model->filter_paid_student($intake, $study_year, $semester, $course_id);
        $structure_array = $this->Payments_model->fetch_courseSemesterStructure($course_id,$university_id);
        $fees=  $this->calculate_fees($structure_array,$semester);
        
        $balance=$this->Payments_model->get_std_bal($student_id)->amount;
        $names = $row->name;
        $student_recepts = $this->Payments_model->student_recepts($intake, $study_year, $semester, $student_id);
      
        $viewData = array(
            'banner' => $this->AdminModel->fetch_banner($this->session->userdata('university')),
            'student_recepts'=>$student_recepts,
            'fees'=>$fees,
            'balance'=>$balance,
            'names'=>$names,
            'course' => $this->db->where('course_id', $course_id)->get('courses')->row(),
            'intake' => $this->db->where('intake_id', $intake)->get('intakes')->row(),
            'academic_year' => $this->db->where('year_id', $study_year)->get('study_year')->row(),
            'semester' => $this->db->where('semester_id', $semester)->get('semesters')->row()
        );
          
        $name = 'Student Reciepts ' . date('Y-m-d H:i:s');
        $view = 'payments/download_reciepts';
        $this->Downloads_Model->printPdf($view, $viewData, $name, 'landscape');
       
//                  
//        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
//        $data['content'] = $this->load->view('payments/download_reciepts', $viewData, true);
//        $this->load->view('layout/_layout_main', $data);
//   

    }
    
    public function download_paid() {
        
        //set session data to use for downloading 
        $intake=$this->session->userdata('my_intake');
        $semester=$this->session->userdata('my_semester');
        $study_year=$this->session->userdata('my_study_yr');
        $course_id=$this->session->userdata('my_course_id');
        
        $university_id=$this->session->userdata('university');
        
        $result = $this->Payments_model->filter_paid_student($intake, $study_year, $semester, $course_id);
        $structure_array = $this->Payments_model->fetch_courseSemesterStructure($course_id,$university_id);
        $fees=  $this->calculate_fees($structure_array,$semester);
        
        
        $viewData = array(
            'banner' => $this->AdminModel->fetch_banner($this->session->userdata('university')),
            'table_content' => $result,
            'fees'=>$fees,
            'out_put'=>$out_put,
            'course' => $this->db->where('course_id', $course_id)->get('courses')->row(),
            'intake' => $this->db->where('intake_id', $intake)->get('intakes')->row(),
            'academic_year' => $this->db->where('year_id', $study_year)->get('study_year')->row(),
            'semester' => $this->db->where('semester_id', $semester)->get('semesters')->row()
        );
        
           
          
//        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
//        $data['content'] = $this->load->view('payments/download_payments', $viewData, true);
//        $this->load->view('layout/_layout_main', $data);
//        
        
        $name = 'Student Payments ' . date('Y-m-d H:i:s');
        $view = 'payments/download_payments';
        $this->Downloads_Model->printPdf($view, $viewData, $name, 'landscape');
        
    }
    
    public function fetchPaid() {
 
        $intake = $this->input->post('intake');
        $semester = $this->input->post('semester');
        $study_year = $this->input->post("year_of_study");
        $course_id = $this->input->post('course_id');
         
        //set session data to use for downloading 
        $this->session->set_userdata('my_semester', $semester);
        $this->session->set_userdata('my_study_yr', $study_year);
        $this->session->set_userdata('my_course_id', $course_id);
        
        $university_id=$this->session->userdata('university');
        
        $result = $this->Payments_model->filter_paid_student($intake,$study_year, $semester, $course_id);
        
        $structure_array = $this->Payments_model->fetch_courseSemesterStructure($course_id,$university_id);

        $fees=  $this->calculate_fees($structure_array,$semester);
        
        
        $output .= ' <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
            <tr>
            <th>No</th>
            <th>Registration Number</th>
            <th>Student Name</th>
            <th>Paid Amount</th>
            <th>Balance</th>
            <th>Payment Times</th>
            <th>Recept No</th>
            <th>Action</th>
            </tr>
        </thead>
        <tbody>';
            
        $count = 1;
        foreach ($result as $row) {//total_fees
            $per = "";
            $details_link = "";
            //active status 
           $payments_status= $this->Payments_model->filter_activated($row->student_id,$course_id, $semester, $study_year, $intake_id);

            $status = '';
            if ($payments_status->_status == 1) {
                $status = ' <a class="text-success" href="#" onclick="blockUser(' . $payments_status->registered_academic_years_id . ')" > 
                            <i class="fa fa-eye"> Deactivate</i></a> ';
            } else {
                $status = '<a class="text-danger" href="#"  onclick="UnblockUser(' . $payments_status->registered_academic_years_id . ')"> 
                            <i class="fa fa-eye-slash"> Activate</i></a> ';
            }
            
            $details_link = '<a href="' . base_url("payments/payments_controller/receipts/" . $row->student_id . "/" . $intake . "/" . $study_year . "/" . $semester) . '">View Receipts</a>';
       
            $balance = $this->Payments_model->get_std_bal($row->student_id)->amount;
            
            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->registration_number) . '</td>
       <td>' . ucwords($row->name) . '</td>
         <td>' . ucwords(number_format($row->amount)) . '</td> 
       <td>' . ucwords($balance) . '</td> 
       <td>' . ucwords($row->paid_times) . '</td>
        <td>' . ucwords($details_link) . '</td> 
        <td class="active_status">'.ucwords($status).'</td>
         </tr>
      ';
            $count++;
        }
        $output .= '   </tbody>
    </table>';
       
        
        echo json_encode(array('data' => $output));
        
    }
    public function payments_reload(){
        $intake = $this->session->userdata('my_intake');
        $semester = $this->session->userdata('my_semester');
        $study_year = $this->session->userdata('my_study_yr');
        $course_id = $this->session->userdata('my_course_id');

        //set session data to use for downloading 
        $this->session->set_userdata('my_intake', $intake);
        $this->session->set_userdata('my_semester', $semester);
        $this->session->set_userdata('my_study_yr', $study_year);
        $this->session->set_userdata('my_course_id', $course_id);
        
        $university_id=$this->session->userdata('university');
        
        $result = $this->Payments_model->filter_paid_student($intake, $study_year, $semester, $course_id);
        $structure_array = $this->Payments_model->fetch_courseSemesterStructure($course_id,$university_id);

        $fees=  $this->calculate_fees($structure_array,$semester);
        

        $output .= ' <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
            <tr>
            <th>No</th>
            <th>Registration Number</th>
            <th>Student Name</th>
            <th>Paid Amount</th>
            <th>Balance</th>
            <th>Payment Times</th>
            <th>Recept No</th>
            <th>Action</th>
            </tr>
        </thead>
        <tbody>';
            
        $count = 1;
        foreach ($result as $row) {//total_fees
            $per = "";
            $details_link = "";
            //active status 
           $payments_status= $this->Payments_model->filter_activated($row->student_id,$course_id, $semester, $study_year, $intake_id);

            $status = '';
            if ($payments_status->_status == 1) {
                $status = ' <a class="text-success" href="#" onclick="blockUser(' . $payments_status->registered_academic_years_id . ')" > 
                            <i class="fa fa-eye"> Deactivate</i></a> ';
            } else {
                $status = '<a class="text-danger" href="#"  onclick="UnblockUser(' . $payments_status->registered_academic_years_id . ')"> 
                            <i class="fa fa-eye-slash"> Activate</i></a> ';
            }
            
            $details_link = '<a href="' . base_url("payments/payments_controller/receipts/" . $row->student_id . "/" . $intake . "/" . $study_year . "/" . $semester) . '">View Receipts</a>';
       

            $balance = $this->Payments_model->get_std_bal($row->student_id)->amount;;

            $output .= '
       <tr>
        <td>' . ucwords($count) . '</td>
        <td>' . ucwords($row->registration_number) . '</td>
       <td>' . ucwords($row->name) . '</td>
         <td>' . ucwords(number_format($row->amount)) . '</td> 
       <td>' . ucwords($balance) . '</td> 
       <td>' . ucwords($row->paid_times) . '</td>
        <td>' . ucwords($details_link) . '</td> 
        <td class="active_status">'.ucwords($status).'</td>
         </tr>
      ';
            $count++;
        }
        $output .= '   </tbody>
    </table>';
       
        
        echo json_encode(array('data' => $output));


    }


    public function calculate_fees($structure_array,$sem){
        $total=0;
        foreach ($structure_array as $fees_item):
            $times=$fees_item->paid_times;
            $amount=$fees_item->amount;
            
            switch ($times):
                case "Per Semester":
                     $total+=$amount;
                    break;
                case "Per Year":
                    if($sem==1){
                       $total+=$amount;
                    }
                    break;
            
                default:
                    break;
            endswitch;
            
            
        endforeach;
        
        return  $total;
        
    }
    
    public function receipts($student_id, $intake, $study_year, $semester) {
        
        $data['btn'] = "Download PDF";
        $data['btn_link'] = "payments/payments_controller/download_reciepts";
        
        $row = $this->db->where('student_id', $student_id)->get('student')->row();
        $row1 = $this->db->where('year_id', $study_year)->get('study_year')->row();
        $row2 = $this->db->where('semester_id', $semester)->get('semesters')->row();
        
        $this->session->set_userdata('my_intake', $intake);
        $this->session->set_userdata('my_semester', $semester);
        $this->session->set_userdata('my_study_yr', $study_year);
        $this->session->set_userdata('student_id', $student_id);
        
        $course_id=$this->session->userdata('my_course_id');
        $university_id=$this->session->userdata('university');
        
        
        // 
        $result = $this->Payments_model->filter_paid_student($intake, $study_year, $semester, $course_id);
        $structure_array = $this->Payments_model->fetch_courseSemesterStructure($course_id,$university_id);
        
        $fees=  $this->calculate_fees($structure_array,$semester);
        
        $data["balance"]=$this->Payments_model->get_std_bal($student_id)->amount;
        $data['pageName'] = $row->name;
        $data['page'] = '<a href="' . base_url("payments/payments_controller/student_paid") . '">Back</a>';
        $data['sub_page'] = "Year " . $row1->year;
        $data['sub_sub_page'] = 'Semester ' . $row2->semester;
        $data['fees'] = $this->Payments_model->fetch_courseSemesterStructure($study_year, $semester, $row->course_course_id);
        $data['student_recepts'] = $this->Payments_model->student_recepts($intake, $study_year, $semester, $student_id);
        
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/payment_receipts', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function complaints() {
        $data['pageName'] = "Payment Complaints";
        $data['page'] = "pending Complaints";
        $data['complaints'] = $this->Complaints_model->fetch_paymentComplaints();
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/complaints', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function pending_details($comlaint_id) {
        $data['pageName'] = "Payment Complaints";
        $data['page'] = "Reply Complaint";
        $data['complaint'] = $this->Payments_model->pending_complaint_details($comlaint_id);
        $remark=$this->Payments_model->complaint_remarks($comlaint_id);
        $user='';
       $comment_info=array();
        foreach ($remark as $row) {
            $data_row=array();
         if($row->user_group=='staff'){
             $data_row[]=$row->reply;
           $user=$this->Users_model->getStaffInfo($row->_who_replied);
         }else if($row->user_group=='student'){
             $user=$this->Users_model->getStudentInfo($row->_who_replied);
         }
     //       $data_row=array(
     //        'sender'=>$user->firstName." ".$user->lastName,
     //        'comment'=>

     // );   
        }
           $comment_info[]=$data_row;
        $data['infor_comment']=$comment_info;
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/pending_complaint', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function reply_complaint() {
        $data = array(
            'reply' => $this->input->post('reply'),
            'complaint_id' => $this->input->post('id'),
            '_who_replied' => $this->session->userdata('user_id'),
            '_when_replied' => date('Y-m-d'),
            'user_group'=>'staff'
        );
        $success = $this->Payments_model->reply_complaint($data);
        if ($success) {
            //now date the status for complaint
            $this->db->where('complaint_id', $this->input->post('id'));
            $this->db->update('tuition_complaints', array('status' => 1));

            $this->session->set_flashdata('msg', "Replied  successfully");
            redirect('payments/payments_controller/complaints');
        } else {
            $this->session->set_flashdata('msg', "Error Has Occudied try again");
            redirect('payments/payments_controller/complaints');
        }
    }

    public function fees_categories() {
        $data['pageName'] = "Fees Structure";
        $data['page'] = "Fees Categories";
        $data['categories'] = $this->CRUD_model->getRecords('fees_categories',array('cat_id','name','paid_times'),"where status='0' and university_id='".$this->session->userdata('university')."'");
//                $this->Payments_model->fetch_paymentCategories();
        $data['btn'] = "Add Fees Category";
        $data['btn_link'] = "payments/payments_controller/add_category";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/fees_categories', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function add_category() {
        $data['pageName'] = "Fees Structure";
        $data['page'] = '<a href="' . base_url("payments/payments_controller/fees_categories") . '">Back</a>';
        $data['sub_page'] = "Add Fees Category";
        $data['btn_link'] = "payments/payments_controller/add_category";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/add_category', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function submitCategory() {
        $data['paid_times'] = $this->input->post('times');
        $data['name'] = $this->input->post('category');
        $data['_who_added'] = $this->session->userdata('user_id');
        $data['university_id'] = $this->session->userdata('university');
        $data['_when_added'] = date('Y-m-d');

        $id = $this->input->post('id');
        if ($id != null) {
            $result = $this->Payments_model->update_category($data, $id);
        } else {
            $result = $this->Payments_model->insert_category($data);
        }
        if ($result) {
            $this->session->set_flashdata('msg', "Category added successfully");
        } else {
            $this->session->set_flashdata('msg', "Error has occurred");
        }
        redirect('payments/payments_controller/fees_categories');
    }

    public function edit_category($category_id) {
        $data['pageName'] = "Fees Structure";
        $data['page'] = '<a href="' . base_url("payments/payments_controller/fees_categories") . '">Back</a>';
        $data['sub_page'] = "Update Fees Category";
        $data['category'] = $this->Payments_model->fetch_category($category_id);
        $data['formBtn'] = "Update Category";
        $data['btn_link'] = "payments/payments_controller/add_category";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('payments/add_category', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function delete_category($category_id) {
        $success = $this->Payments_model->delete_category($category_id);
        if ($success) {
            $this->session->set_flashdata('msg', "Category Delete successfully");
        } else {
            $this->session->set_flashdata('msg', "Error has occurried try again");
        }

        redirect('payments/payments_controller/fees_categories');
    }

}
