<div  id="print_complaint">
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-6">
                <p>From: <span style="font-weight: 600;font-size: 15px;"><?php echo ucfirst($complaint->firstName . " " . $complaint->lastName) ?></span></p>
                <p>Registration Number: <span style="font-weight: 600;font-size: 15px;"><?php echo ucfirst($complaint->registration_number) ?></span></p>
                <p>Year of Study: <span style="font-weight: 600;font-size: 15px;"><?php echo ucfirst($complaint->year) ?></span></p>
                <p>Semester: <span style="font-weight: 600;font-size: 15px;"><?php echo ucfirst($complaint->semester) ?></span></p>
                <p> Date Sent: <span class="text-justify" style="font-weight: 600;font-size: 15px;"><?php echo ucfirst($complaint->_when_added) ?></span></p>
            </div>
            <div class="col-lg-6">
                <!-- Single button -->
<div class="btn-group pull-right">
  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Action <span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
    <li><a href="#" onclick="printContent('#print_complaint')">Print</a></li>
  </ul>
</div>
                <!-- <button class="btn btn-warning pull-right" onclick="printContent('#print_complaint')">Print Complaint</button> -->
            </div>
        </div> 
        <div class="clearfix"></div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-lg-12">
            <p><span>&nbsp;&nbsp;&nbsp;<?php echo ucfirst($complaint->complaint) ?></span></p>
        </div>
    </div>
   
</div>
<div class="clearfix"></div>
<br><br>
<div class="col-lg-12">
    <div class="col-lg-6">
        
    </div>
    <div class="col-lg-6">

    </div>
</div>
<div class="clearfix"></div>
<br>
<div class="row">
    <div class="col-lg-12">
        <form method="POST" action="<?php echo base_url(); ?>payments/payments_controller/reply_complaint">
            <div class="form-group">
                <textarea class="form-control" rows="7"  name="reply" placeholder=" Please enter a reply to complaint here"></textarea>
            </div>
            <button class="btn btn-success " type="submit">send message</button>
            <input type="hidden" name="id" value="<?php echo $complaint->complaint_id ?>">.

        </form>
    </div>
</div>

<script>
    function printContent(el) {
        var restorepage = $('body').html();
        var printcontent = $('#print_complaint' + el).clone();
        $('body').empty().html(printcontent);
        window.print();
        $('body').html(restorepage);
    }
</script>




