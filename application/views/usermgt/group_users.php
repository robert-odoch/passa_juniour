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
            <th>Name</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        foreach ($group_users as $row):
            ?>
            <tr>
                <td><?php echo ucwords($count); ?></td>
                <td><?php echo ucwords($row['name']); ?></td>
                <td><a class="text-danger" href="#" onclick="delete_user_in_group(<?php echo $row['group_id']?>,<?php echo $row['user_id']?>)">  <i class="fa fa-trash"> Delete</i></a>
                </td>
            </tr>
            <?php
            $count++;
        endforeach;
        ?>
    </tbody>
</table>
    
<script>
    function delete_user_in_group(group_id,user_id){
        var values=group_id+"/"+user_id;
        if(confirm("Are you sure you want to remove user from this group?")){
        $.ajax({
            url:"<?php echo base_url();?>usermgt/users_controller/delete_from_group/"+values,
            type:"POST",
            dataType:"JSON",
            success:function(data,textStatus, jqXHR){
                 location.reload();
                 alert('User removed from group successfully');
            },
            error:function(jqXHR, textStatus, errorThrown){
                
            }
                    
        });
        }//end if 
    }
    
    
</script>