<script src="<?php echo base_url(); ?>assets/js/custom/jquery.min.js"></script>
<?php 
//include_once('functions.php'); 
// include '../../core/functions.php';
 require_once APPPATH . 'views/university/functions.php';
 
// echo base_url('');
?>
<div id="calendar_div">
    <?php echo getCalender(); ?>
</div>