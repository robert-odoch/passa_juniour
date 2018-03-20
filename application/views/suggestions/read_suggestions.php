<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>

        <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

    <?php endif; ?>



</div>
<div class="clearfix"></div>

<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>No</th>
            <th>Suggestion</th>
            <th>Sent Date</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        foreach ($suggestions as $row):
            ?>
            <tr>
                <td><?php echo ucwords($count); ?></td>
                <td><?php echo ucwords(substr($row->suggestion, 0, 70) . '... <span class="text-success">Read More</span>'); ?></td>
                <td><?php echo ucwords($row->sent_time); ?></td>
                <td><a href="<?php echo base_url() ?>suggestions/suggestion_controller/read_suggestion_detail/<?php echo $row->suggestion_box_id; ?>" class="text-success">
                        <i class="fa fa-eye"> view</i></a> ||
                    <a href="#" class="text-danger" onclick="delete_suggestion(<?= $row->suggestion_box_id; ?>)">
                        <i class="fa fa-trash"> Delete</i></a>
                </td>
            </tr>
            <?php
            $count++;
        endforeach;
        ?>
    </tbody>
</table>
<script>
    function delete_suggestion(sug_id){
        var id=sug_id;
        if(confirm("Are sure you want to delete this suggestion?")){
            
            $.ajax({
                url:"<?php echo base_url("suggestions/suggestion_controller/delete_suggestion/")?>"+id,
                type:"POST",
                dataType:"JSON",
                success:function(data,textStatus, jqXHR){
                    location.reload();
                    alert("suggestion deleted successfully");
                },
                error:function(jqXHR, textStatus, errorThrown){
                    alert(errorThrown);   
                }
            });
        }
    }
</script>


