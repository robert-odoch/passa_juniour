<div class="row">
    <div class="col-sm-6 card">
        <div class="panel panel-default">
            <div class="panel-heading">
                Main Menu
            </div>
            <div class="panel-body">
                <form id="form-add-menu">
                    <div class="form-group">
                        <label>Menu name :</label>
                        <input class="form-control" name="name" placeholder="menu name">
                    </div>
                    <input type="submit" class="btn btn-default"/>
                </form>
            </div>
        </div>
    </div>
    <div class="col-sm-6 card">
        <div class="panel panel-default">
            <div class="panel-heading">
                Sub Menus
            </div>
            <div class="panel-body">
                <form id="form-add-sub-menu">
                    <div class="form-group">
                        <label>Main menu</label>
                        <select id="select_menu" name="menu" class="form-control">
                            <option value="">--Select Menu--</option>
                            <?php
                            if (isset($menuselect)) {
                                foreach ($menuselect as $key) {
                                    ?>
                                    <option value="<?php echo $key->menu_id; ?>"><?php echo $key->menu_name; ?></option>
                                    <?php
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Sub Menu name :</label>
                        <input class="form-control" name="name" placeholder="menu name">
                    </div>
                    <div class="form-group">
                        <label>Sub Menu link :</label>
                        <input class="form-control" name="link" placeholder="menu name">
                    </div>
                    <input type="submit" class="btn btn-default"/>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script type ="text/javascript">
    $(document).ready(function () {
        $("#form-add-menu").submit(function (e) {
            e.preventDefault();
            $.ajax({
                url: "<?php echo base_url('developer/developer/add_main_menu') ?>",
                type: "POST",
                data: $('#form-add-menu').serialize(),
                dataType: "JSON",
                success: function (data)
                {
                    console.log(data);
                    $('#select_menu').html(data);
                    $('#form-add-menu').trigger("reset");
                    alert('Menu Added successfully');

                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                    alert(errorThrown);
                }
            });
        });

        $('#form-add-sub-menu').submit(function (e) {
            e.preventDefault();
            $.ajax({
                url: "<?php echo base_url('developer/developer/add_sub_menu') ?>",
                type: "POST",
                data: $('#form-add-sub-menu').serialize(),
                dataType: "JSON",
                success: function (data)
                {
                    console.log(data);
                    $('#select_menu').html(data);
                    $('#form-add-sub-menu').trigger("reset");
                    alert('Sub Menu  Added successfully');

                },
                error: function (jqXHR, textStatus, errorThrown)
                {
                    alert(errorThrown);
                }
            });

        });
    });
</script>
