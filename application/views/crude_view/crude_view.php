<?php
$api=new CRUD_model();
echo $api->get_table();
?>
<div class="col-md-12">
    <?php
    $msg = $this->session->flashdata('msg');
    if (isset($msg)):
        ?>
           <div class="alert alert-success col-md-6"> <?= $msg ?>. </div>
        <!-- <?= $msg ?> -->
    <?php endif; ?>



</div>


<div class="clearfix"></div>
  <?php 
 
  if (isset($add_record_links)  != "") { ?>
<div class="btn-group">
    <button class="btn btn-primary" type="button">Select Action</button>
                      <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button"> <i class="fa fa-angle-down"></i> </button>
                      
     <ul role="menu" class="dropdown-menu">
        <?php if (isset($add_record_links)) { ?>
           <?php
           foreach ($add_record_links as $key => $value) {

            ?>
            <li><a href="<?php echo $value;?>"><?php echo isset($key) ? $key : 'Add New Record'; ?></a></li>

           <?php
           
           }
           ?>
           
        <?php } ?>
    </ul>
</div>
<?php } ?>
<div class="clearfix"></div>
<br></br>
<div class="panel">
    <table id="example" class="table  responsive nowrap table-bordered table-striped" cellspacing="0" width="100%">
        <thead>
            <tr>
                <?php
                $keys = array_keys($output[0]);
                foreach ($keys as $header) {
                    ?>
                    <th><?php echo $header; ?></th>
                    <?php
                }
                ?>
                <th>ACTION</th>
            </tr>
        </thead>
        <tbody id="courses_table">
            <?php
            foreach ($output as $record) {
                $pk = $record['_id'];
                ?>
                <tr id="row">
                    <?php foreach ($record as $record_item) { ?>
                        <td><?php echo $record_item; ?></td>
                    <?php } ?>
                    <td>

                        <a href="<?php echo $add_record_links['Add Record'];?>?pk=<?php echo $pk; ?>" class="edit_record"><span class="fa fa-edit"></span></a>
                        &nbsp;
                        <a href="#" class="fa fa-trash" width="20" height="20" alt="Delete Record" onClick="clear_record('<?php echo $pk; ?>')"></td>

                <?php } ?>

            </tr>
            <?php
            ?>
        </tbody>
    </table>
</div>




