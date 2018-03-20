<div class="row">
    <div class="col-sm-12">
        <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User Group</th>
                    <th>Menu</th>
                    <th>Sub Menu</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="users_table">

                <?php
                $count = 1;
                if (isset($menudata)) {
                    foreach ($menudata as $row) {
                        ?>

                        <tr>
                            <td><?php echo ucwords($count); ?></td>
                            <td><a href="<?php echo base_url();?>menu/menu_controller/group_menu/<?php echo $row->group_id; ?>"><?php echo ucwords($row->group_name); ?></a></td>
                            <td><?php echo ucwords($row->menu_name); ?></td>
                            <td><a href="<?php echo base_url(); ?>menu/menu_controller/sub_menus/<?php echo $row->assignmet_id ?>/<?php echo $row->ugid."/".$row->mid?>">Sub Menus</a></td>

                            <td>
                                <a href="#" onclick="unassign_menu(<?php echo $row->assignmet_id; ?>)"><i class="fa fa-trash-o fa-fw"></i></a>
                            </td>
                        </tr>
                        <?php
                        $count++;
                    }
                }
                ?>
            </tbody>
        </table>

    </div>
</div>

<!--<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>-->
<script type ="text/javascript">

    function unassign_menu(id) {
        if (confirm("Are you sure what to un assign menu from user group?")) {
            $.ajax({
                url: "<?php echo base_url('menu/menu_controller/unassign_menu_from_users/'); ?>" + id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $('#users_table').html(data);
                    form_reset();
                    toastr.info('Operatin successfull', 'Success Alert', {timeOut: 2000});
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }

    }
</script>
