<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>
<div class="clearfix"></div>
<div class="row">
<div class="col-md-8">

    <form class="form-inline center" method="post" action="#">
        <div class="form-group col-md-6">
            <label>Filter Graduate grading</label>
            <select name="level" id="level" class="form-control">
                <option value="null">---select graduate level--</option>
                <option value="0">Under graduate level</option>
                <option value="1">Post graduate level</option>
            </select>
        </div>
    </form>
</div>

<div class="col-md-4 " id="test">
    <div class="col-lg-6 pull-right" id="word"></div>
</div>
</div>
<div class="clearfix"></div>

<div class="row">
    <div class="col-md-12">
        <br>
        <br><br>
<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">

    <thead>
        <tr>
            <th>No</th>
            <th>Grade</th>
            <th>From</th>
            <th>To</th>
            <th>Grade Value</th>
            <th>Progress Status</th>
            <td>Action</td>
        </tr>
    </thead>
    <tbody id="grading_table">
        <?php
        $count = 1;
        if (isset($grading)) {
            foreach ($grading as $row):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <td><?php echo ucwords($row->grade); ?></td>
                    <td><?php echo ucwords($row->value_frm); ?></td>
                    <td><?php echo ucwords($row->value_to); ?></td>
                    <td><?php echo ucwords($row->grade_value); ?></td>
                    <td><?php
                        if ($row->progress == 0) {
                            echo ucwords("Normal Progress");
                        } else {
                            echo ucwords("Retake");
                        }
                        ?></td>
                    <td> <a class="text-success" href="<?php echo base_url(); ?>grading/grading_controller/editGrade/<?php echo $row->grading_id; ?>" >  <i class="fa fa-pencil-square-o"> Edit</i></a> ||
                        <a class="text-danger" href="#" onclick="deleteGrade(<?php echo $row->grading_id; ?>)">  <i class="fa fa-trash"> Delete</i></a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>
    </div>
</div>
<script>
    function deleteGrade(grade_id) {
        if (confirm("Are you sure want to delete")) {
            $.ajax({
                url: "<?php echo base_url('grading/grading_controller/deleteGrade'); ?>/" + grade_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                    alert('Grade deleted successfully');
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
</script>


<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script>
    $('#level').change(function () {
        var id = $(this).val();
        if (id == "") {
        } else {
            fetch_grading(id);
        }
    });
    function fetch_grading(id) {
        $.ajax({
            url: "<?php echo base_url("grading/grading_controller/filter_grading") ?>/" + id,
            type: 'POST',
            dataType: 'JSON',
            success: function (data, textStatus, jqXHR) {
                $('#grading_table').html(data.data);
                if (data.export_btn == true) {
                    $('#export_Btn').show();
                    $('#word').html("<a href=\"<?php echo base_url(); ?>grading/grading_controller/download_grading/" + data.level + "\" class=\"btn btn-warning\" id=\"download_Btn\">Pdf Download</a>");
                } else {
                    $('#download_Btn').hide()
                }
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown)
            }
        });
    }

</script>

