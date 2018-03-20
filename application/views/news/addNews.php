
<div class="row"> 
    <div class="col-md-12">
        <?php
        $msg = $this->session->flashdata('msg');
        if ((isset($msg)) && (!empty($msg))) :
            ?>

            <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

        <?php endif; ?>



    </div>
    <div class="col-md-8">
        <form enctype = "multipart/form-data" action="<?php echo base_url() ?>news/news_controller/submitNews" method="POST">
           
            <div class="form-group"> 
                <label for="group">Title</label>
                <input class="form-control m-t-xxs" id="title" value="<?php echo ((isset($news)) ? $news->title : "") ?>"  name="title" placeholder="Enter title here" type="text">
                <input type="hidden" value="<?php echo ((isset($news)) ? $news->news_id : "") ?>" name="id">
            </div>
            <div class="form-group"> 
                <label for="group">News Detail</label>
                <textarea id="text" name="news_detail">
                    <?php echo ((isset($news)) ? $news->news_detail : "") ?>
                </textarea>

            </div>
            <div class="form-group"> 
                <label for="group">Attach Image</label>
                <input type="file" name="photo">

            </div>
            <div class="fileinput fileinput-new" data-provides="fileinput">
  <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
  <div>
    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span>
    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
  </div>
</div>

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "Add News") ?></button>
            </div>
        </form>
    </div>
</div>










<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script type="text/javascript">
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


    function add_cat() {
        $('#cat_form')[0].reset();
        $('#catModal').modal('show');
    }
    function save_cat() {
        $.ajax({
            url: "<?php echo base_url('news/news_controller/addNewsCategory'); ?>",
            type: 'POST',
            dataType: '',
            data: $('#cat_form').serialize(),
            success: function (data, textStatus, jqXHR) {
                location.reload();
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }

</script>
<div class="modal fade" id="catModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Add news category</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="post" action="" id="cat_form">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Category Name</label>
                        <input type="text" name="cat_name" id="cat_name" class="form-control">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="save_cat()">Save changes</button>
            </div>
        </div> 
    </div> 
</div> 