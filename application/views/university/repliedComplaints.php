<br>
<table id="table-example" class="table table-hover">
    <thead>
        <tr>
            <th>No</th>
            <th>Complaint Date</th>
            <th>Registration Number</th>
            <th>Student Name</th>
            <th>Complaint category</th>
            <th>Replied Date</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($complaints) {
            foreach ($complaints as $complaint):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td> <?php echo ucwords($complaint->_when_added); ?></td>
                    <td> <?php echo ucwords($complaint->registration_number); ?></td>
                    <td> <?php echo ucwords($complaint->firstName . " " . $complaint->lastName); ?></td>
                    <td> <?php echo ucwords($complaint->type); ?></td>
                    <td class="text-warning"> <?php echo ucwords($complaint->time_stamp); ?></td>
                    <td> <a href="#" onclick="complaintDetail(<?php echo $complaint->complaint_id; ?>)">view Details</a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
<script>
    function complaintDetail(complaint_id) {
        $.ajax({
            url: "<?php echo base_url('university/dashboard/studentComplaintReplyDetails/'); ?>/" + complaint_id,
            type: 'POST',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('#complaintDetailsModal').modal('show');
                $('.modal-title').text('Complaint Reply details');
                $('#registration_number').text(data.registration_number);
                $('#student_name').text(data.firstName + " " + data.lastName);
                $('#date').text("Complaint Date: " + data.time_stamp);
                $('#reply_date').text("Complaint Reply Date: " + data._when_added);
                $('.complaints_body').text(data.complaint);
                $('[name="complaint_id"]').val(complaint_id);
                $('[name="reply"]').val(data.complaint_reply);

                if (data.attachment != null) {
                    document.getElementById('download_btn').style.visibility = 'visible';
                    $('#download_link').text(data.attachment);
                } else {
                    document.getElementById('download_btn').style.visibility = 'hidden';
                }
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }
</script>



<div class="modal fade" id="complaintDetailsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <div  id="print_data">
                    <h4><strong><span id="registration_number"> </span> <span id="student_name"></span></strong></h4>
                    <strong><p><span class="pull-left text-info" id="date"></span></p></strong><br>
                     <strong><p><span class="pull-left text-info" id="reply_date"></span></p></strong>
                     <br>
                    <br>
                    <p class="complaints_body  text-justify"></p>
                </div>

                <form method="POST" action="" id="reply_form">
                    <div class="form-group">
                        <label class="text-warning"> complaint reply</label>
                        <textarea class="form-control" rows="7"  name="reply" placeholder=" Please enter a reply to the complaint" readonly="readonly"></textarea>
                    </div>
                    <input type="hidden" name="complaint_id" placeholder="complaint id">
                    <!--<button class="btn btn-success" onclick="sendReply()">send message</button>-->
                </form>

            </div>
            <div class="modal-footer">
                <p id="download_link" class="hidden"></p>
                <button type="button" onclick="downloadDocument()" class="btn btn-default pull-left" id="download_btn">download attachment</button>
                <button type="button" onclick="printComplaint()" class="btn btn-primary pull-right">print complaint</button>
            </div>
        </div> 
    </div> 
</div> 

<!--printing the complaint modal details-->
<script>
    function printComplaint() {
        var printContents = document.getElementById("print_data").innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }
    //downloading the student complaints document
    function downloadDocument() {
        var download_file = $("#download_link").text();
        window.location.replace("<?php echo base_url('assets/upload/complaints/') ?>/" + download_file);
    }
</script>



