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
            <th>Title</th>
            <th>Event Detail</th>
            <th>Time Stamp</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        if ($events) {
            foreach ($events as $event):
                ?>
                <tr id="table_show">
                    <td><?php echo ucwords($count); ?></td>
                    <?php
                    $title = strip_tags($event->title);
                    if (strlen($title) > 30) {
                        $stringCut = substr($title, 0, 30);
                        $title = substr($stringCut, 0, strrpos($stringCut, ' ')) . '....';
                    }
                    ?>
                    <td><?php echo ucwords($title); ?></td>

                    <?php
                    $string = strip_tags($event->event_detail);
                    if (strlen($string) > 50) {
                        $stringCut = substr($string, 0, 50);
                        $string = substr($stringCut, 0, strrpos($stringCut, ' ')) . '....';
                    }
                    ?>
                    <td><?php echo ucwords($string); ?></td>

                    <td><?php echo ucwords($event->time_stamp); ?></td>
                    <td> <a class="text-success" href="<?php echo base_url(); ?>news/events_controller/edit_event/<?php echo $event->event_id; ?>"><i class="fa fa-pencil-square-o">Edit</i></a> || <a class="text-danger" href="#" onclick="deleteEvent(<?php echo $event->event_id; ?>)"><i class="fa fa-trash">Delete</i></a></td>
                </tr>
                <?php
                $count++;
            endforeach;
        }
        ?>
    </tbody>
</table>


<script>
    $(document).ready(function () {
        //datepicker
        $('.datepicker').datepicker({
            autoclose: true,
            format: "yyyy-mm-dd",
            todayHighlight: true,
            orientation: "top auto",
            todayBtn: true,
            todayHighlight: true,
        });
    });


    function deleteEvent(event_id) {
        if (confirm("Are you sure want to delete?")) {
            $.ajax({
                url: "<?php echo base_url("news/events_controller/deleteEvent/"); ?>/" + event_id,
                type: 'POST',
                dataType: 'JSON',
                success: function (data, textStatus, jqXHR) {
                    location.reload();
                }, error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }


</script>

