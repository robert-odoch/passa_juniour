<div class="row"> 
    <div class="col-md-12">
        <?php
        $msg = $this->session->flashdata('msg');
        if ((isset($msg)) && (!empty($msg))) :
            ?>

            <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

        <?php endif; ?>



    </div>
    <div class="col-md-8">
        <form action="<?php echo base_url() ?>news/events_controller/submitEvent" method="POST">
            <input type="hidden" value="<?php echo ((isset($event)) ? $event->event_id : "") ?>" name="id">
            <div class="form-group"> 
                <label for="group">Event Name</label>
                <input class="form-control m-t-xxs" id="title" value="<?php echo ((isset($event)) ? $event->title : "") ?>"  name="title" placeholder="Enter title here" type="text">

            </div>
             <div class="form-group"> 
                <label for="group">Venue</label>
                <input class="form-control m-t-xxs" id="venue" value="<?php echo ((isset($event)) ? $event->venue : "") ?>"  name="venue" placeholder="Enter venue" type="text">

            </div>
             <div class="form-group"> 
                <label for="group">Event Time</label>
                <input class="form-control m-t-xxs" id="title" value="<?php echo ((isset($event)) ? $event->time : "") ?>"  name="time" placeholder="Enter Event time" type="text">

            </div>
            <div class="form-group">
                <label for="dtp_input2" class=" control-label">Event Date</label>
                <input type="text" name="time_stamp" class="form-control mb-2 mr-sm-2 mb-sm-0 datepicker" id="inlineFormInput" placeholder="Event Date" required=""  value="<?php echo ((isset($event)) ? $event->time_stamp : "") ?>">
            </div>

            <div class="form-group"> 
                <label for="group">Event Detail</label>
                <textarea id="text" name="detail">
                    <?php echo ((isset($event)) ? $event->event_detail : "") ?>
                </textarea>

            </div>

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add Event") ?></button>
            </div>
        </form>
    </div>
</div>


<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //datepicker
        $('.datepicker').datepicker({
            autoclose: true,
            format: "yyyy-MM-dd",
            todayHighlight: true,
            orientation: "top auto",
            todayBtn: true,
            todayHighlight: true,
        });
    });
</script>



