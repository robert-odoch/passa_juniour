<div class="row">
    <div class="col-lg-12">
        <div class="col-lg-6">
            <p>From: <span style="font-weight: 600;font-size: 15px;"><?php echo ucfirst($suggestion->firstName . " " . $suggestion->lastName) ?></span></p>
            <p>Sent Date: <span class="text-justify" style="font-weight: 600;font-size: 15px;"><?php echo ucfirst($suggestion->sent_time) ?></span></p>
        </div>
        <div class="col-lg-6">
            <button class="btn btn-success pull-right ">Print</button>
        </div>
    </div> 
    <div class="clearfix"></div>

</div>
<div class="clearfix"></div>
<div class="row">
    <div class="col-lg-12">
        <p><?php echo ucfirst($suggestion->suggestion) ?></p>
    </div>
</div>
<div class="clearfix"></div>
<div class="row">
    <div class="col-lg-12">
        <form method="POST" action="<?php echo base_url(); ?>suggestions/suggestion_controller/reply_suggesstion">
            <div class="form-group">
                <?php
                $reply = $suggestion->suggestion_reply;
                if ($reply != null) {
                    echo ' <textarea class="form-control" rows="7" readonly="readonly"  name="reply" placeholder=" Please enter a reply to the suggestion">' . $reply . '</textarea>';
                }else{
                         echo ' <textarea class="form-control" rows="7"   name="reply" placeholder=" Please enter a reply to the suggestion"></textarea>';   
                }
                ?>


            </div>
            <?php
            if ($reply != null) {
                
            } else {
                echo ' <button class="btn btn-success " type="submit">send message</button>';
            }
            ?>
            <input type="hidden" name="suggestion_id" value="<?php echo $suggestion->suggestion_box_id ?>">

        </form>
    </div>
</div>



