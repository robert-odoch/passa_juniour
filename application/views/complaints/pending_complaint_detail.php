<?php
require_once(APPPATH . 'core/functions.php');
$api = new core_func();
?>
<div class="row">
 <div class=" col-lg-12">
            <div class="mail-box-header">
              <div class="pull-right tooltip-demo"> <a title="Reply" data-placement="top" data-toggle="tooltip" class="btn btn-white btn-sm" href="<?php echo base_url();?>complaints/complaint_controller/reply_complaint/<?php echo $complaint->id; ?>"><i class="fa fa-reply"></i> Reply</a> <a title="" data-placement="top" data-toggle="tooltip" class="btn btn-white btn-sm" href="#" data-original-title="Print email"><i class="fa fa-print"></i> </a>  </div>
              <h2> View Message </h2>
              <div class="mail-tools tooltip-demo ">
                <h3> <span class="font-noraml">Subject: </span><?php
                  if($complaint->category=="1"){
                        echo"Results Complaint";
                  }else{
                    echo"Titution Complaint";
                  }
                ?> </h3>
                <h5> <span class="pull-right font-noraml">10:15AM 02 FEB 2014</span> <span class="font-noraml">From: </span><?php echo $complaint->name." <span style=\"color:blue\"> ".$complaint->reg_no."</span>";?> </h5>
                 <h3> <span class="font-noraml">Details:</span> Year:<span style="color:blue"><?php echo $complaint->study_year;?></span> Semester:<span style="color:blue"><?php echo $complaint->semester;?></span></h3>
              </div>
            </div>
            <div class="mail-box">
              <div class="mail-body">
                <p><?php echo $complaint->message;?></p>
               <?php
               if($complaint->category=="1"):
                $result=$api->exam_complaint($complaint->id);
                foreach ($result as $value):?>
                    
                 <h5>Lecturer:  <span><?php echo $value['lecture']?></span></h5>
                 <p>Course Unit: <span ><strong><?php echo $value['course_unit'];?></strong></span></p>
                  


                 <?php 
             endforeach;
             endif;
               ?>
               <br>
               <h4>Response</h4>
               <?php
               $reply=$api->complaint_response($complaint->id);
               if(count($reply)>0){
                 foreach ($reply as $key) {
                     echo "<p><span>".$key['message']."</span><br>
                     <strong>Response by:</strong> <span style=\"color:#c11bb1;\">".$key['name']."</span>
                     </p>";
                 }

               }else{
                echo"<span>No response yet!!</span>";
               }

               ?>
               
              </div>
              <?php
              if($complaint->attachment):
              ?>
              <div class="mail-attachment">
                <p> <span><i class="fa fa-paperclip"></i> 1 attachments - </span> <a href="<?php echo base_url();?>upload/complaints/<?php echo $complaint->attachment;?>">Download attachment</a> </p>
                <div class="attachment">
                  <div class="file-box">
                    <div class="file"> <a href="#"> <span class="corner"></span>
                      <div class="icon"> <i class="fa fa-file"></i> </div>
                      <div class="file-name"><?php echo $complaint->attachment ?><br>
                        <small>Added: <?php echo $complaint->_when_added;?></small> </div>
                      </a> </div>
                  </div>
                  <div class="clearfix"></div>
                </div>
              </div>
          <?php endif;?>
              <div class="mail-body text-right tooltip-demo"> <a href="<?php echo base_url();?>complaints/complaint_controller/reply_complaint/<?php echo $complaint->id; ?>" class="btn btn-sm btn-white"><i class="fa fa-reply"></i> Reply</a>
                <button class="btn btn-sm btn-white" data-original-title="Print" type="button" data-toggle="tooltip" data-placement="top" title=""><i class="fa fa-print"></i> Print</button>
               
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
      </div>

          