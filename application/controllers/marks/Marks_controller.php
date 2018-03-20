<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Marks_controller
 *
 * @author abert
 */
class Marks_controller extends MY_Controller {

//put your code here
    function __construct() {
        parent::__construct();
        $this->load->model('global/Global_model');
        $this->load->model('UniversityModel');
        $this->load->model('courses_model');
        $this->load->model('IntakeModel');
        $this->load->model('MarksModel');
        $this->load->model('grade_model');
        $this->load->model('students_model');
        $this->load->model('AdminModel');
        // $this->load->model('Downloads_Model');
        $this->load->model('CRUD_model');
        $this->checkSession();
    }

    public function checkSession() {
        return parent::checkSession();
    }

    function view_marks() {
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['study_years'] = $this->IntakeModel->fetch_study_years();
        $data['intakes'] = $this->IntakeModel->fetch_intakes();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['page'] = "Marks";
        $data['sub_page'] = "View Marks";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('marks/view_marks', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    function upload_marks() {
        $data['courses'] = $this->courses_model->fetch_courses();
        $data['study_year'] = $this->IntakeModel->fetch_study_years();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['pageName'] = "Marks";
        $data['page'] = "Upload semester Marks";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('marks/add_marks', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

//semester general student marks
    public function uploadAllStudentMarks() {
       
        $study_year = $this->input->post('study_year');
        $semester = $this->input->post('semester');

        $filename = $_FILES["userfile"]["tmp_name"];
        //read file from path
        $objPHPExcel = PHPExcel_IOFactory::load($filename);

//        $header = array();
//        $arr_data = array();

        foreach ($objPHPExcel->getWorksheetIterator() as $worksheet) {
            $worksheetTitle = $worksheet->getTitle();
            $highestRow = $worksheet->getHighestRow(); // e.g. 10
            $highestColumn = $worksheet->getHighestColumn(); // e.g 'F'
            $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);
            $maxCell = $worksheet->getHighestRowAndColumn();
            $data = $worksheet->rangeToArray('A1:' . $maxCell['column'] . $maxCell['row']);
            $worksheet = $objPHPExcel->getActiveSheet();

            for ($row = 1; $row <= $highestRow; ++$row) {
                for ($col = 0; $col < $highestColumnIndex; ++$col) {
                    $cell = $worksheet->getCellByColumnAndRow($col, $row);
                    $val = $cell->getValue();
                    if ($row == 2) {
                        if ($val != null) {
                            if(is_string($val)){
                                if($val !='CU'){
                                 $header[$row][$col] = $val;
                                }

                            } 
                           
                        }
                    } else {
                        if ($val == null) {
//                            $val = "0";
                        }
                        if($row>3){
                             $arr_data[$row][$col] = $val;
                        }
                       
                    }
                }
            }
        }
        
        $header= array_values($header);
        $unit_ids=array();
        foreach ($header[0] as $key) {
           $data=$this->CRUD_model->getRecords('course_units',array('course_unit','id','code'),"where code like '".$key."'");
            foreach ($data as $key_data) {
                $unit_ids[]= $key_data['id'];
            }
        }
        $data['values'] = $arr_data;

        $time_stamp = new Constants();
        $arr_data = array_values($arr_data);

        for ($i = 0; $i < sizeof($arr_data); $i++) {
            $student_row = array_values($arr_data[$i]);
            // $new_header = array_values($header[1]);
            $student_regno = $student_row[1];
            
            $std_row_count=5;
            for ($count = 0; $count < sizeof($unit_ids); $count++) {
                
                $course_unit = $new_header[$count];
                try {
                    $course_work=$student_row[$std_row_count];
                    $std_row_count+=1;
                    $exam_mark=$student_row[$std_row_count];
                    $std_row_count+=1;
                    $final_mark=$student_row[$std_row_count];
                    $std_row_count+=3;
                    
                    //insert now values in the database
                    $insert_data['reg_no'] = $student_regno;
                    $insert_data['cw'] = $course_work;
                    $insert_data['ex'] = $exam_mark;
                    $insert_data['fn'] = $final_mark;
                    $insert_data['course_unit'] = $unit_ids[$count];
                    $insert_data['semester'] = $semester;
                    $insert_data['study_year'] = $study_year;
                    if($final_mark !=null){
                    $markExists=  $this->CRUD_model->isExisting('marks',array('course_unit'=>$unit_ids[$count],'reg_no'=>$student_regno));
                    if($markExists){
                        $update_data=array("cw"=>$insert_data['cw'],"ex"=>$insert_data['ex'],"fn"=>$insert_data['fn']);
                  $this->update_mark($update_data,array('reg_no'=>$student_regno,'course_unit'=>$unit_ids[$count]));
                    }else{ 
                      $success=  $this->CRUD_model->insert('marks',$insert_data);  
                    }
                    }
                } catch (Exception $e) {
                    e . print_r($e);
                }
            }
        }
        $this->session->set_flashdata('message', 'Upload successfull');
          redirect('marks/marks_controller/upload_marks');
    }

    public function update_mark($data,$condition){
       $this->db->where($condition);
       $this->db->update('marks',$data);
    }

    public function studentMarks() {
        $course_id = $this->input->post('course_id');
        $year = $this->input->post('study_year');
        $semester = $this->input->post('semester');
        $intake = $this->input->post('intake');
        $data['r_year'] = $year;
        $data['r_sem'] = $semester;
        $level = $this->courses_model->fetchCourse($course_id);
        $course_units = $this->MarksModel->fetch_marks_semeter_units($year, $semester, $course_id);
        $regs = $this->MarksModel->fetch_reg_nos($year, $semester, $course_id, $intake);
        $marks = $this->MarksModel->fetch_marks($year, $semester, $course_id);
        $grading = $this->grade_model->filter_grading($level->level);
        $array_data = array();
        foreach ($regs as $reg) {
            $data_row = array();
            $data_row[] = $reg->reg_no;
            foreach ($course_units as $units) {
                $mark_row = $this->db->query("select * from marks where reg_number='" . $reg->reg_no . "' and course_unit='" . $units->course_unit . "' &&"
                                . "course_course_id='" . $course_id . "' && semesters_semester_id='" . $semester . "' && academic_years_year_id='" . $year . "'")->row();

                $final_mark = $mark_row->mark;

                $found = false; //boolean to track if the grade is found
//incase of null value the grade is never found

                foreach ($grading as $grade) {

                    if ($final_mark >= $grade->value_frm && $final_mark <= $grade->value_to) {
                        $found = true;
                        if ($grade->progress == 1) {
                            $data_row[] = $final_mark . " " . $grade->grade . " Retake";
                        } else {
                            $data_row[] = $final_mark . " " . $grade->grade;
                        }
                    }
                }

                if ($found == false) {
                    $data_row[] = $final_mark;
                }
            }

            $array_data[] = $data_row;
        }
        $intakes = $this->db->where('intake_id', $intake)->get('intakes')->row();
        $data['pageName'] = $intakes->intake_name;
        $academic_year = $this->db->where('year_id', $year)->get('study_year')->row();
        $sem = $this->db->where('semester_id', $semester)->get('semesters')->row();
        $course = $this->db->where('course_id', $course_id)->get('courses')->row();


        $data['page'] = '<a href="' . base_url("marks/Marks_controller/view_marks") . '">Back</a>';
        $data['sub_page'] = $course->course_code;
        $data['sub_sub_page'] = "Year " . $academic_year->year;
        $data['sub_sub_sub_page'] = "Semester " . $sem->semester;
        $data['year'] = $year;
        $data['semester'] = $semester;
        $data['course_id'] = $course_id;
        $data['intake'] = $intake;
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['course_units'] = $course_units;
        $data['array_data'] = $array_data;
        $data['content'] = $this->load->view('marks/marks', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    // public function download_marks($course_id, $semester, $year, $intake) {

    //     $level = $this->courses_model->fetchCourse($course_id);
    //     $course_units = $this->MarksModel->fetch_marks_semeter_units($year, $semester, $course_id);
    //     $regs = $this->MarksModel->fetch_reg_nos($year, $semester, $course_id, $intake);
    //     $marks = $this->MarksModel->fetch_marks($year, $semester, $course_id);
    //     $grading = $this->grade_model->filter_grading($level->level);
    //     $array_data = array();
    //     foreach ($regs as $reg) {
    //         $data_row = array();
    //         $data_row[] = $reg->reg_no;
    //         foreach ($course_units as $units) {
    //             $mark_row = $this->db->query("select * from marks where reg_number='" . $reg->reg_no . "' and course_unit='" . $units->course_unit . "' &&"
    //                             . "course_course_id='" . $course_id . "' && semesters_semester_id='" . $semester . "' && academic_years_year_id='" . $year . "'")->row();
    //             $final_mark = $mark_row->mark;
    //             $found = false;
    //             foreach ($grading as $grade) {

    //                 if ($final_mark >= $grade->value_frm && $final_mark <= $grade->value_to) {
    //                     $found = true;
    //                     if ($grade->progress == 1) {
    //                         $data_row[] = $final_mark . " " . $grade->grade . " Retake";
    //                     } else {
    //                         $data_row[] = $final_mark . " " . $grade->grade;
    //                     }
    //                 }
    //             }
    //             if ($found == false) {
    //                 $data_row[] = $final_mark;
    //             }
    //         }

    //         $array_data[] = $data_row;
    //     }
    //     $viewData = array(
    //         'banner' => $this->AdminModel->fetch_banner($this->session->userdata('university')),
    //         'array_data' => $array_data,
    //         'course_units' => $course_units,
    //         'course' => $this->db->where('course_id', $course_id)->get('courses')->row(),
    //         'intake' => $this->db->where('intake_id', $intake)->get('intakes')->row(),
    //         'academic_year' => $this->db->where('year_id', $year)->get('study_year')->row(),
    //         'semester' => $this->db->where('semester_id', $semester)->get('semesters')->row()
    //     );
    //     $view = 'marks/download_marks';
    //     $name = 'course_units ' . date('Y-m-d H:i:s');
    //     $this->Downloads_Model->printPdf($view, $viewData, $name, 'landscape');
    // }

    public function fetch_reg_nos($course_id, $intake) {
        $result = $this->MarksModel->fetch_registration_numbers($course_id, $intake);

        $option = '';
        if (count($result) === 0) {
            $option = 'Nothing to select ';
        } else {
            $option = '--Select Registration Number--';
        }

        $html = '<select id="registration_no"  name="registration_no" class="form-control selectpicker" data-live-search="true">
      <option value="">' . $option . '</option>';
        foreach ($result as $row) {
            $html .= '<option value ="' . $row->reg_number . '">' . $row->reg_number . '</option>';
        }
        $html .= '</select>';
        echo json_encode($html);
    }

    public function download_table() {
// Load the table view into a variable
        $html = $this->load->view('marks/marks');
// Put the html into a temporary file
        $tmpfile = time() . '.html';
        file_put_contents($tmpfile, $html);

// Read the contents of the file into PHPExcel Reader class
        $reader = new PHPExcel_Reader_HTML;
        $content = $reader->load($tmpfile);

// Pass to writer and output as needed
        $objWriter = PHPExcel_IOFactory::createWriter($content, 'Excel2007');
        $objWriter->save('excelfile.xlsx');

// Delete temporary file
        unlink($tmpfile);
    }

    public function generate_statement() {
        $data['page'] = '<a href="' . base_url("marks/marks_controller/fetch_statement") . '">Back</a>';
        $array = array(
            'course_course_id' => $this->input->post('course_id'),
            'academic_years_year_id' => $this->input->post('academic_year'),
            'semesters_semester_id' => $this->input->post('semester'),
            'reg_number' => $this->input->post('registration_no')
        );
        $data['r_year'] = $this->input->post('academic_year');
        $data['r_sem'] = $this->input->post('semester');
        $data['r_course'] = $this->input->post('course_id');
        $data['r_reg'] = $this->input->post('registration_no');

        $data['year'] = $this->IntakeModel->fetch_academic_year($this->input->post('academic_year'));
        $data['semester'] = $this->IntakeModel->fetch_semester($this->input->post('semester'));
        $data['student'] = $this->students_model->fetch_student_details($this->input->post('registration_no'));
        $data['grading'] = $this->grade_model->fetch_grading();
        $data['marks'] = $this->MarksModel->fetch_single_statement($array);
        $data['pageName'] = "Mini statements";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('marks/single_statement', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    // public function download($r_course, $r_year, $r_sem, $r_reg) {
    //     $array = array(
    //         'course_course_id' => $r_course,
    //         'academic_years_year_id' => $r_year,
    //         'semesters_semester_id' => $r_sem,
    //         'reg_number' => str_replace(array("-", "/"), "/", $r_reg)
    //     );
    //     $data = $this->MarksModel->fetch_single_statement($array);
    //     $level = $this->courses_model->fetchCourse($r_course);
    //     $grading = $this->grade_model->filter_grading($level->level);
    //     $viewData = array(
    //         'banner' => $this->AdminModel->fetch_banner($this->session->userdata('university')),
    //         'marks' => $data,
    //         'grading' => $grading,
    //         'semester' => $this->IntakeModel->fetch_semester($r_sem),
    //         'student' => $this->students_model->fetch_student_details(str_replace(array("-", "/"), "/", $r_reg)),
    //         'year' => $this->IntakeModel->fetch_academic_year($r_year),
    //     );
    //     $view = 'marks/download_minstatement';
    //     $name = 'course_units ' . date('Y-m-d H:i:s');
    //     $this->Downloads_Model->printPdf($view, $viewData, $name, 'landscape'); //  
    // }

    public function generateMiniStatment() {
        $data['page'] = '<a href="' . base_url("marks/mini_statement/fetch_statement") . '">Back</a>';
        $student_reg = $this->input->post('reg_no');
        $year = $this->input->post('year');
        $semester = $this->input->post('semester');
        $array = array(
            'academic_years_year_id' => $year,
            'semesters_semester_id' => $semester,
            'reg_number' => $student_reg
        );
        $course = $this->students_model->fetch_student_details($student_reg);
        $level = $this->courses_model->fetchCourse($course->courses_course_id);
        $grading = $this->grade_model->filter_grading($level->level);

        $data['year'] = $this->IntakeModel->fetch_academic_year($year);
        $data['semester'] = $this->IntakeModel->fetch_semester($semester);
        $data['student'] = $this->students_model->fetch_student_details($student_reg);
        $data['grading'] = $grading;
        $data['marks'] = $this->MarksModel->fetch_single_statement($array);
        $data['pageName'] = "Mini statements";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('marks/single_statement', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function editMark($mark_id) {
        echo 'under development....';
        exit();
        $data['marks'] = $this->MarksModel->get($mark_id);
        $data['pageName'] = "Marks";
        $data['page'] = "Update student marks";
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('marks/update_mark', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function updateMarks() {
        echo 'under development....';
        exit();
//        $data['course_unit'] = $this->input->post('course_unit');
//        $data['mark'] = $this->input->post('marks');
//        $id = $this->input->post('id');
        //$success = $this->MarksModel->insertUpdate($data, $id);
//        if ($success) {
//            redirect('marks/marks_controller/generateMiniStatment');
//        }
    }


    public function filter_marks(){
        $course=$this->input->post('course');
         $study_year=$this->input->post('study_year');
        $semester=$this->input->post('semester');
        $intake=$this->input->post('intake');
       $result= $this->CRUD_model->getRecords('assigned_units  a left join course_units b on(a.course_unit=b.id)',array('b.code as `code`','b.id'),"where a.semeter='".$semester."' and a.year_study='".$study_year."' and a.course='".$course."'");

       $output = '';
     $output .= ' <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
        <tr>
        <th></th>
        <th></th>
        ';
        $units_array=array();
        foreach ($result as $key) {
           $output.='<th colspan="3">'.$key['code'].'</th>';
           $units_array[]=$key['id'];
        }
         $output.='</tr>
       
        <tr> 
           <th>Reg No</th> 
           <th>Student Name</th>';
           foreach ($units_array as $key) {
            $output.='
            <th>CW</th>
            <th>EX</th>
            <th>FN</th>
            ';
           }
        $output.='</tr>
         </thead>
        <tbody>';
        foreach ($units_array as $row) {
            $marks_details= $this->CRUD_model->getRecords('marks',array('reg_no'),"where course_unit='".$row['id']."'");

            foreach ($marks_details as $key_row) {
               
            
                 $student=$this->CRUD_model->getRecord('student',array('registration_number','name'),"where registration_number='".$key_row['reg_no']."' and intake_intake_id='".$intake."'");
               
                $student_marks=$this->CRUD_model->getRecords('marks',array('cw','ex','fn','reg_no'),"where reg_no='".$student->registration_number."' and course_unit='".$row['id']."' group by reg_no");
                   
            
                foreach ($student_marks as $key) {
                      $output.='<tr>';
                  $output.='<td>'.$student->registration_number.'</td>';
                $output.='<td>'.$student->name.'</td>';
                $output.='<td>'.$key['cw'].'</td>';
                  $output.='<td>'.$key['ex'].'</td>';
                    $output.='<td>'.$key['fn'].'</td>';
                  $output.='</tr>';
                 
                }
            }
                
              
        }
        
        $output .= '   </tbody>
    </table>';
        echo json_encode($output);

    }

    public function single_statement(){
         $data['student'] = $this->CRUD_model->getRecords('student',array('student_id','registration_number'),"where status='0'");
        $data['study_years'] = $this->IntakeModel->fetch_study_years();
        $data['intakes'] = $this->IntakeModel->fetch_intakes();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['page'] = "Marks";
        $data['sub_page'] = "View Marks";
        $res = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['menus'] = $res;
        $data['content'] = $this->load->view('marks/student_statement', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function filter_single_statement(){
          $student=$this->input->post('student');
         $study_year=$this->input->post('study_year');
        $semester=$this->input->post('semester');

       $result= $this->CRUD_model->getRecords('marks  a left join course_units b on(a.course_unit=b.id)',array('a.marks_id','b.code as `code`','b.id','cw','ex','fn'),"where a.semester='".$semester."' and a.study_year='".$study_year."' and a.reg_no='".$student."'");

       $output = '';
     $output .= '<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

        <thead>
        <tr>
        <th>COURSE UNIT</th>
        <th>CW</th>
        <th>EX</th>
        <th>FN</th>
        <th></th>
        </tr>
         </thead>
        ';
         $output.=' <tbody>';
        foreach ($result as $key) {
            $output.='<tr>';
            $output.='<td>'.$key['code'].'</td>';
            $output.='<td>'.$key['cw'].'</td>';
            $output.='<td>'.$key['ex'].'</td>';
            $output.='<td>'.$key['fn'].'</td>';
            $output.='<td><a href="'.base_url("marks/Marks_controller/edit_mark/".$key['marks_id']).'"><i class="fa fa-edit"></i></a></td>';
            $output.='</tr>';
              
        }
        
        $output .= '</tbody>
    </table>';
        echo json_encode($output);


    }

    public function edit_mark($mark_id){
          $student=$this->CRUD_model->getRecord('marks',array('reg_no'),"where marks_id='".$mark_id."'");
        $data['student_mark']=$this->CRUD_model->getRecord('marks',array('marks_id','cw','ex','fn','semester','study_year'),"where marks_id='".$mark_id."'");
        $data['study_years'] = $this->IntakeModel->fetch_study_years();
        $data['intakes'] = $this->IntakeModel->fetch_intakes();
        $data['semesters'] = $this->UniversityModel->fetch_semesters();
        $data['page'] = "Marks";
        $data['sub_page'] = "".$student->reg_no;
        $data['menus'] = $this->Global_model->fecth_menu($this->session->userdata('user_group'));
        $data['content'] = $this->load->view('marks/edit_mark', $data, true);
        $this->load->view('layout/_layout_main', $data);
    }

    public function updatemark(){
        $id=$this->input->post('id');
        $array=array(
            'cw'=>$this->input->post('cw'),
            'ex'=>$this->input->post('ex'),
            'fn'=>$this->input->post('fn'),
            'study_year'=>$this->input->post('study_year'),
            'semester'=>$this->input->post('semester')

        );
        $this->CRUD_model->updateRecord('marks',$array,array('marks_id'=>$id));
         $this->session->set_flashdata('message', 'Mark updated successfull');
        redirect('marks/marks_controller/single_statement');

    }


    public function disableMarks(){
 $data=$this->CRUD_model->getRecords('student',array('registration_number'),"where intake_intake_id='10' and courses_course_id='10'");

   foreach ($data as $value) {
   $data2=$this->CRUD_model->getRecords('marks',array('marks_id','reg_no','fn'),"where reg_no='".$value['registration_number']."'");

   foreach ($data2 as $key) {
       $this->CRUD_model->updateRecord('marks',array('status'=>4543),array('marks_id'=>$key['marks_id']));
      // echo $key['marks_id']."<br>";
   }
   echo"success";
  

     
   }
      

    }

}
