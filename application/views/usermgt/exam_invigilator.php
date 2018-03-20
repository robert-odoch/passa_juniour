<div class="clearfix"></div>
<button class="btn btn-primary pull-right" type="button" onclick="addInvigilatot()">Add Exam invigilator</button>
<div class="clearfix"></div>
<br>
<table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Name</th>
             <th>Email</th>
              <th>Contact</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        foreach ($exam_invigilators as $row):
            ?>
            <tr>
                <td><?php echo ucwords($row['name']); ?></td>
                 <td><?php echo ucwords($row['email']); ?></td>
                  <td><?php echo ucwords($row['contact']); ?></td>
                <td><a class="text-danger" href="#" onclick="deleteUser(<?php echo $row['id']?>)">  <i class="fa fa-trash"> Delete</i></a>
                </td>
            </tr>
            <?php
            $count++;
        endforeach;
        ?>
    </tbody>
</table>
<script type="text/javascript">
    function addInvigilatot(){
        $('#modal_form').modal('show');
    }
     function save()
    {
         $.ajax({
                    url: "<?php echo base_url("usermgt/users_controller/save_invigilator");?>",
                    type: "POST",
                    data: $('#form').serialize(),
                    dataType: "JSON",
                    success: function (data)
                    {
                    alert(data.status);
                    location.reload();      
                    },
                    error: function (jqXHR, textStatus, errorThrown)
                    {
                        alert(errorThrown);
                       
                    }
                });
    }

    function deleteUser(id){
        if(confirm("Do you want to remove the Inviglator?")){
             $.ajax({
                    url: "<?php echo base_url("usermgt/users_controller/removeInvigilator/");?>"+id,
                    type: "POST",
                    dataType: "JSON",
                    success: function (data)
                    {
                    alert(data.status);
                    location.reload();      
                    },
                    error: function (jqXHR, textStatus, errorThrown)
                    {
                        alert(errorThrown);
                       
                    }
                });
    }
        
    }
</script>




<div class="modal fade" id="modal_form" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Add New  exam Inviglator</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal" data-parsley-validate>
                    <input type="hidden" value="" name="id"/>
                    <div class="form-body">

                        <div class="form-group">
                            <label for="exampleInputEmail1 " class="col-lg-12">Users</label>
                            <select name="user" class="selectpicker col-lg-12"  data-live-search="true">
                                <?php
                                if (isset($users)) {
                                    foreach ($users as $row) {
                                        echo '<option value="' . $row->user_id . '">' . $row->name . '</option>';
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>