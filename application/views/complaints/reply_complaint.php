<div class="mail-box">
      <div style="margin-left: 10px;margin-bottom: 10px;">
          <h4>Compose Reply Below: </h4><br><br>
          <p>Student will get the response in his/her inbox</p>
           <p><strong>Student: </strong><?php echo $complaint->name;?></p>
          <p><strong>Complaint summary:</strong><?php echo $complaint->message;?> </p>
             </div>
             <br>
              <div class="mail-text">
                <form class="form-horizontal form-bordered" method="post" action="<?php echo base_url();?>complaints/complaint_controller/send_reply">
                   <textarea name="reply" style="height: 300px;width: 100%;margin-left: 5px;background-color: #f7f2f2" placeholder="Enter complaint Reply here"></textarea>
                   <input type="hidden" value="<?php echo $id;?>" name="id">
                    <div class="mail-body text-right tooltip-demo">
                     <button title="Send" data-placement="top" data-toggle="tooltip" class="btn green  btn-sm btn-primary" type="submit"><i class="fa fa-reply"></i> Send</button>
                      <a title="Discard email" data-placement="top" data-toggle="tooltip" class="btn btn-white btn-sm" href="#"><i class="fa fa-times"></i> Discard</a> <a title="Move to draft folder" data-placement="top" data-toggle="tooltip" class="btn btn-white btn-sm" href="#"><i class="fa fa-pencil"></i> Draft</a> </div>
                </form>
              </div>
             
              <div class="clearfix"></div>
            </div>