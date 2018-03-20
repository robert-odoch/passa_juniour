<?php
/*
 * Function requested by Ajax
 */

class core_func{

   function get_position_complaints($category){
         $CI = & get_instance();
         $data=array();
        $mod = $CI->load->model('CRUD_model');
          $status = $CI->CRUD_model->getRecord('positions a left join user_position b on(a.id=b.pos_name)',array('a.id','allow_exam_complaints','allow_fees_complaints'),"where user='".$CI->session->userdata('user_id')."'");
        if($category=="1" && ($status->allow_exam_complaints=="yes")){
            $data[]= 1;
        }else if($category=="0" && ($status->allow_fees_complaints=="yes")){
              $data[]= 1;
        }else{
             $data[]= 0;
        }
        return $data;
   }

   function exam_complaint($complaint_id){
      $CI = & get_instance();
     $mod = $CI->load->model('CRUD_model');
          $result = $CI->CRUD_model->getRecords('complaints_details a left join course_units b on(a.course_unit_id=b.id) ',array('lecture','b.course_unit'),"where a.complaint_id='".$complaint_id."'");
     return $result;
   }
   function complaint_response($complaint_id){
     $CI = & get_instance();
     $mod = $CI->load->model('CRUD_model');
          $result = $CI->CRUD_model->getRecords('complaint_response a left join users b on(a._who_added=b.user_id)',array('message','name'),"where complaint='".$complaint_id."' ");
     return $result;
   }

   function user_school($school_id){
    $CI = & get_instance();
     $mod = $CI->load->model('CRUD_model');
          $result = $CI->CRUD_model->getRecord('dept_members',array('count(*) as `user`'),"where school_id='".$school_id."' and user_id='".$CI->session->userdata('user_id')."' ");
     return $result;
   }

}
?>