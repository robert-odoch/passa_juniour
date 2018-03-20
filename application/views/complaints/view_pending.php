<?php
require(APPPATH . 'helpers/helper_class.php');
require_once(APPPATH . 'core/functions.php');
$api = new DbHelper();

$api2 = new core_func();
?>
<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>

        <div id="message2">
            
        </div>

</div>


<div class="clearfix"></div>
<br><br>
<br>
<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

    <thead>
        <tr>
            <th>Message Status</th>
            <th>Complaint</th>
            <th>Posted Date</th>
            <!-- <td>Action</td> -->
        </tr>
    </thead>
    <tbody id="complaints_table">
        <?php
        $count = 1;
        $message_status="";
        if ($complaints) {
            foreach ($complaints as $row):
               $status= $api2->get_position_complaints($row['category']);
                foreach ($status as $key):

                   if($key !=0):
              
                   $user_school= $api2->user_school($row['school_id']);
                    // echo count($user_school->user);
                     if($key==1 && $user_school->user !=0){
                        foreach ($user_school as  $value) {
                        if($value>=1){?>

                         <tr>
                    <td><?php if($row['viewed_status'] ==""){
                         echo "<span class=\"text-danger\">"."Unread"."</span>";
                      }else{
                       echo "<span class=\"text-success\">".$row['viewed_status']."</span>";
                   } ?></td>
                    <td><?php echo ucwords(substr($row['message'], 0, 100) . '... <span class="text-success"><a href="'.base_url().'complaints/complaint_controller/complaint_detail/'.$row['id'].'">Read More</a></span>'); ?></td>
                    <td><?php echo ucwords($row['_when_added']); ?></td>
                </tr>

                        <?php }
                     }
                     }else{?>


                      <tr>
                    <td><?php if($row['viewed_status'] ==""){
                         echo "<span class=\"text-danger\">"."Unread"."</span>";
                      }else{
                       echo "<span class=\"text-success\">".$row['viewed_status']."</span>";
                   } ?></td>
                    <td><?php echo ucwords(substr($row['message'], 0, 100) . '... <span class="text-success"><a href="'.base_url().'complaints/complaint_controller/complaint_detail/'.$row['id'].'">Read More</a></span>'); ?></td>
                    <td><?php echo ucwords($row['_when_added']); ?></td>
                </tr>


                     <?php }

                ?>
               
                <?php
                $count++;

                  endif;
                  endforeach;
            endforeach;
        }
        ?>
    </tbody>
</table>

<script>
    var complaint_id;
    function complaint_details(id) {
        $.ajax({
            url: "<?php echo base_url("complaints/complaint_controller/complaint_detail"); ?>/" + id,
            type: 'POST',
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                $('#modal_form').modal('show');
                $('#message').text(data.message);
                $('#complaint_id').text(data.id);
                $('#student_details').text(data.name + " " + data.reg_no);
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
        fetch_remarks(id);

    }

  function  fetch_remarks(complaint_id){
        $.ajax({
            url: "<?php echo base_url("complaints/complaint_controller/complaint_remarks"); ?>/" + complaint_id,
            type: 'POST',
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
               $('#remarks').html(data);

            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
    
    function replyComplaint(){
    
        var complaint_id=$('#complaint_id').text();
        $('#reply_complaint_id').val(complaint_id);
        
        $('#modal_form').modal('hide');
        $('#reply_form').modal('show');
    }
    
    function forwardComplaint(){
        var complaint_id=$('#complaint_id').text();
        $('#forward_complaint_id').val(complaint_id);
        
       $('#modal_form').modal('hide');
       $('#forward_form').modal('show'); 
    }
    
    function forward(){
        var complaint_id=$('#forward_complaint_id').val();
        var to_position=$('#forward_position').val();
       
       
        $.ajax({
            url: "<?php echo base_url("complaints/complaint_controller/forward_complaint"); ?>/" +complaint_id+"/"+to_position,
            type: 'POST',
            dataType: 'json',
            data:$('#forward_form_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                 locatio.reload();
                $('#message2').html("<div class='alert alert-success col-md-6'>Complaint forwarded Success fully.</div> ");
                $('#forward_form').modal('hide'); 
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
        
    }
    
    function reply(){
        var id=$("#reply_complaint_id").val();
        $.ajax({
            url:"<?php echo base_url('complaints/complaint_controller/save_reply')?>/"+id,
            type:"POST",
            data:$("#reply_form_form").serialize(),
            success:function(data, textStatus, jqXHR){
                locatio.reload();
                $('#message2').html("<div class='alert alert-success col-md-6'>Complaint reply Success fully saved.</div> ");
                $('#reply_form').modal('hide');
            },error:function(jqXHR, textStatus, errorThrown){
                 alert(errorThrown);
            }
        });
    }

</script>





<div class="modal fade" id="modal_form" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">COMPLAINT DETAILS</h3>
            </div>
            <div class="modal-body form">
                <div class="btn-group pull-right">
                    <button class="btn btn-success" type="button">Action</button>
                    <button data-toggle="dropdown" class="btn btn-success dropdown-toggle" type="button" aria-expanded="false"> <i class="fa fa-angle-down"></i> </button>
                    <ul role="menu" class="dropdown-menu">
                        <li> <a href="#" onclick="replyComplaint()"> Reply </a> </li>
                        <li> <a href="#" onclick="forwardComplaint()"> Forward </a> </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h3>Student Name: <span id="student_details"></span></h3>
                        <p id="message"></p>
                        <h4><strong>Complaint Remarks</strong></h4>
                        <p id="complaint_id" class="hidden"></p>
                        <div id="remarks">
                        </div>

                    </div>
                </div>




            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="reply_form" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Reply Complaint</h3>
            </div>
            <div class="modal-body">
               
                <div class="row">
                    <div class="col-md-12">
                        <form method="post" action="#" id="reply_form_form">
                            <textarea class="form-control" style="min-height: 100px;" name="reply"></textarea>
                            <input type="hidden" name="reply_complaint_id" id="reply_complaint_id" class="form-control" />
                        </form>

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success"  onclick="reply()">Reply</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="forward_form" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Forward Compliant</h3>
            </div>
            <div class="modal-body">
               
                <div class="row">
                    <div class="col-md-12">
                        <form method="post" action="#" id="forward_form_form">
                            <div class="form-group">
                                <label>Select Position To Forward To</label>
                                <select name="position" id="forward_position" class="form-control" required="">
                                    <option value="">--select position to forward to--</option>
                                    <?php foreach($positions as $position): ?>
                                    <option value="<?=$position["id"]?>"><?=$position["pos_name"]?></option>
                                    <?php endforeach; ?>
                                    <input type="hidden" name="forward_complaint_id" id="forward_complaint_id" class="form-control" />
                                </select>
                            </div>
                            <div class="form-group">
                                 <label>Comment</label>
                                <textarea class="form-control" style="min-height: 100px;" name="forward_comment" id="forward_comment" required=""></textarea>
                                
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success"  onclick="forward()">Forward</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

