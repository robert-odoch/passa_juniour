<div class="row"> 
    <div class="col-md-12">
        <?php
        $msg = $this->session->flashdata('msg');
        if ((isset($msg)) && (!empty($msg))) :
            ?>

            <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

        <?php endif; ?>
         
            <?php   
        if ((isset($message))) :
            ?>
                
            <div class="alert alert-success col-md-6"> <?php echo $message ?>. </div>

        <?php endif; ?>    

    </div>
    <div class="col-md-6">
        <?php echo $values; ?>
        <form action="<?php echo base_url() ?>registration/Registrationcontroller/save_student_registration" method="POST">

           
            <div class="form-group"> 
                <label for="group">Select Program</label>
                <select class="form-control m-t-xxs selectpicker " data-live-search="true" name="program"  id="program" onchange="changeStudents()">
                    <option value="null">--Select Program--</option>
                    <?php foreach ($programs as $program): ?>
                        <option value="<?php echo $program['course_id']?>"><?=$program['course_code']?>-&nbsp <?php echo $program['course']?></option>
                    <?php endforeach; ?>  
                </select>
            </div>
            <div class="form-group"> 
                <label for="group">Student</label>
                <select class="form-control m-t-xxs" data-live-search="true" id="student" name="student" required="">
                    <option value="null">--select student--</option>
                </select>
            </div>
            
            <div class="form-group"> 
                <label for="group">Select Year of Study</label>
                <select class="form-control m-t-xxs selectpicker" name="year" data-live-search="true" required="">
                    <option value="">--select Study Year --</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                    <option value="4">Four</option>
                    <option value="5">Five</option>
                </select>
            </div>
            
            <div class="form-group"> 
                <label for="group">Select Semester</label>
                <select class="form-control m-t-xxs" name="sem" required="">
                    <option value="">--select Semester--</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                </select>
            </div>
            
            <div class="form-group"> 
                <label for="group">Select Course Units</label>
                <select class="form-control m-t-xxs" id="course_units" name="course_units[]" multiple="multiple" required="">
                
                </select>
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Register Student") ?></button>
            </div>
            
        </form>
    </div>
</div>


<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>

<script>
    function changeStudents(){
        var selcourse=$("#program").val();
        
        $.ajax({
            url:"<?php echo base_url("registration/registrationcontroller/getstudents"); ?>",
            type:"POST",
            dataType: 'json',
            data: {course_id:""+selcourse},
            success:function(data){
                
                $("#student").html(data.students);
                //$('#student').addClass('selectpicker');
                $("#course_units").html(data.course_units);
                
            }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
            }
        });
    }
    
</script>


