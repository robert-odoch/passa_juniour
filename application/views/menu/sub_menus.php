<div class="row">
    <div class="col-sm-3 card">
        <div class="panel panel-default">
            <div class="panel-heading">
                Assigning sub Menus
            </div>
            <div class="panel-body">
                <form id="form-assign-menu" action="#" method="post">
                    <div class="form-group">
                        <label>Sub Menu :</label>
                        <select id="select_sub_menu" name="sub_menu" class="form-control">
                            <option value="">--Select sub Menu--</option>
                            <?php
                            if (isset($unassigned_sub_menu)) {
                                foreach ($unassigned_sub_menu as $key) {
                                    ?>
                                    <option value="<?php echo $key->sub_menu_id; ?>"><?php echo $key->sub_menu_name; ?></option>
                                    <?php
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <div>
                        <input type="hidden" name="group_id" value="<?php echo $group_id ?>"/>
                    </div>
                    <div>
                        <input type="hidden" name="assignment_id" value="<?php echo $assignment_id ?>"/>
                    </div>
                    <input type="submit" class="btn btn-default"/>
                </form>
            </div>
        </div>
    </div>
    <div class="col-sm-9 card">
        <div class="panel panel-default">
            <div class="panel-heading">
                Assigned User Menu
            </div>
            <div class="panel-body">
                <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>No</th>
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
                                    <td><?php echo ucwords($row->sub_menu_name); ?></td>

                                    <td>
                                        <a href="#" onclick="unassign_menu(<?php echo $row->group_menu_id . "," . $row->assignmet_id; ?>)"><i class="fa fa-trash-o fa-fw"></i></a>
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
    </div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script type ="text/javascript">
                                            $(document).ready(function () {

                                                $('#form-assign-menu').submit(function (e) {
                                                    e.preventDefault();
                                                    if (!$('#select_sub_menu').val()) {
                                                        alert('please select subMenu');
                                                    } else {
                                                        assign_menu_to_user();
                                                    }

                                                });
                                            });

                                            function assign_menu_to_user() {
                                                $.ajax({
                                                    url: "<?php echo base_url('menu/menu_controller/assign_submenu_to_user') ?>",
                                                    type: "POST",
                                                    data: $('#form-assign-menu').serialize(),
                                                    dataType: "JSON",
                                                    success: function (data)
                                                    {
                                                        console.log(data);
                                                        // $('#users_table').html(data);
                                                        form_reset();
                                                        location.reload();
                                                        alert("User Assigned submenu successfully");

                                                    },
                                                    error: function (jqXHR, textStatus, errorThrown)
                                                    {
                                                        alert(errorThrown);
                                                    }
                                                });
                                            }

                                            function unassign_menu(id, assign_id) {
                                                if (confirm("Are you sure what to un assign submenu from user group?")) {
                                                    $.ajax({
                                                        url: "<?php echo base_url('menu/menu_controller/unassign_submenu_from_users/'); ?>" + id + "/" + assign_id,
                                                        type: 'POST',
                                                        dataType: 'JSON',
                                                        success: function (data, textStatus, jqXHR) {
                                                            console.log(data);
                                                            // $('#users_table').html(data);
                                                            form_reset();
                                                            location.reload();
                                                        }, error: function (jqXHR, textStatus, errorThrown) {
                                                            alert(errorThrown);
                                                        }
                                                    });
                                                }

                                            }

                                            function form_reset() {
                                                $('#form-assign-menu').trigger("reset");
                                                $('#select_menu').prop('disabled', true);
                                                $('#select_menu').html("");
                                            }
</script>
