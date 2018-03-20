<div class="row"> 
    <div class="col-md-12">
        <?php
        $msg = $this->session->flashdata('msg');
        if ((isset($msg)) && (!empty($msg))) :
            ?>

            <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

        <?php endif; ?>



    </div>
    <div class="col-md-6">
        <form action="<?php echo base_url() ?>course_units/units_controller/submitUnit" method="POST">

            <div class="form-group"> 
                <label for="group">Code</label>
                <input class="form-control m-t-xxs" id="code"  name="code" value="<?php echo ((isset($unit)) ? $unit->code : "") ?>" placeholder="Enter Course Unit Code" type="text">

            </div>
            <div class="form-group"> 
                <label for="group">Course Unit</label>
                <input type="hidden" value="<?php echo ((isset($unit)) ? $unit->course_unit_id : "") ?>" name="id">
                <input class="form-control m-t-xxs" id="course_unit"  name="course_unit" value="<?php echo ((isset($unit)) ? $unit->course_unit : "") ?>" placeholder="Enter Course Unit Name" type="text">

            </div>
            <div class="form-group"> 
                <label for="group">Credit Unit</label>
                <input class="form-control m-t-xxs" id="cu"  name="cu" value="<?php echo ((isset($unit)) ? $unit->cu : "") ?>" placeholder="Enter Credit Unit here" type="text">

            </div>
            <input type="hidden" value="<?php echo ((isset($unit)) ? $unit->id : "") ?>"  name="id">

            <div class="form-group">
                <button type="submit" class="btn btn-primary m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add Course Unit") ?></button>
            </div>
        </form>
    </div>
</div>
<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script type="text/javascript">
    var id = null;
    $(document).ready(function () {
        $.ajax({
            url: "<?php echo base_url("course_units/units_controller/editUnit/");?>/"+<?php echo $_GET['pk'];?>,
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                   $('[name="code"]').val(data.code);
                    $('[name="course_unit"]').val(data.course_unit);
                    $('[name="cu"]').val(data.cu);
                     $('[name="id"]').val(data.id);
             
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });

    });
</script>



