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
        </tr>
    </thead>
    <tbody>
        <?php
        $count = 1;
        foreach ($suggestions as $row):
            ?>
            <tr>
                <td><?php echo ucwords($count); ?></td>
                <td><a href="<?php echo base_url();?>suggestions/suggestion_controller/view_suggestion/<?php echo $row->suggestion_box_id?>" class="text-primary"><?php echo ucwords(substr($row->suggestion, 0, 100) . '... <span class="text-success">Read More</span>'); ?></a></td>
                <td><?php echo ucwords($row->sent_time); ?></td>
            </tr>
            <?php
            $count++;
        endforeach;
        ?>
    </tbody>
</table>

