<div class="row">
    <div class="col-sm-3 card">
        <div class="panel panel-default">
            <div class="panel-heading">
                Assigning Menus
            </div>
            <div class="panel-body">
                <form id="form-assign-menu">
                    <div class="form-group">
                        <label>User Groups :</label>
                        <select id="select_user_group" name="user_group" class="form-control">
                            <option value="">--Select User Group--</option>
                            <?php if (isset($usergroups)) {
                                foreach ($usergroups as $key) {
                                    ?>
                                    <option value="<?php echo $key->group_id; ?>"><?php echo $key->group_name; ?></option>
                                    <?php
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Menu :</label>
                        <select id="select_menu" name="menu" class="form-control">
                        </select>
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
                            <th>User Group</th>
                            <th>Menu</th>
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
                                    <td><?php echo ucwords($row->group_name); ?></td>
                                    <td><?php echo ucwords($row->menu_name); ?></td>

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
    </div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script type ="text/javascript">
                                    $(document).ready(function () {
                                        $('#select_menu').prop('disabled', true);
                                        $('#select_user_group').change(function () {
                                            var id = $(this).val();
                                            if (id == "") {
                                                $('#select_menu').prop('disabled', true);
                                                $('#select_menu').empty();
                                            } else {
                                                $('#select_menu').prop('disabled', false);
                                                populate_menu(id);
                                            }

                                        });
                                        $('#form-assign-menu').submit(function (e) {
                                            e.preventDefault();
                                            if (!$('#select_menu').val()) {
                                                toastr.error('Please select menu ', 'Error Alert', {timeOut: 2000});
                                            } else {
                                                assign_menu_to_user();
                                            }

                                        });
                                    });

                                    function populate_menu(id) {
                                        $.ajax({
                                            url: "<?php echo base_url('menu/menu_controller/load_user_unassigned') ?>/" + id,
                                            type: "POST",
                                            dataType: "JSON",
                                            success: function (data)
                                            {
                                                console.log(data);
                                                $('#select_menu').html(data);

                                            },
                                            error: function (jqXHR, textStatus, errorThrown)
                                            {
                                                alert(errorThrown);
                                            }
                                        });
                                    }

                                    function assign_menu_to_user() {
                                        $.ajax({
                                            url: "<?php echo base_url('menu/menu_controller/assign_menu_to_user') ?>",
                                            type: "POST",
                                            data: $('#form-assign-menu').serialize(),
                                            dataType: "JSON",
                                            success: function (data)
                                            {
                                                console.log(data);
                                                $('#users_table').html(data);
                                                form_reset();
                                                alert("User Assigned menu successfully");

                                            },
                                            error: function (jqXHR, textStatus, errorThrown)
                                            {
                                                alert(errorThrown);
                                            }
                                        });
                                    }

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

                                    function form_reset() {
                                        $('#form-assign-menu').trigger("reset");
                                        $('#select_menu').prop('disabled', true);
                                        $('#select_menu').html("");
                                    }
</script>
