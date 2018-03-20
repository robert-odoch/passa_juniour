<div class="row"> 
    <div class="col-md-12">
        <?php
        $msg = $this->session->flashdata('msg');
        if ((isset($msg)) && (!empty($msg))) :
            ?>

            <div class="alert alert-success col-md-6"> <?php echo $msg ?>. </div>

        <?php endif; ?>



    </div>
    <div class="col-md-6">
        <form action="<?php echo base_url() ?>news/news_controller/submitCategory" method="POST" enctype="multipart/form-data">

            <div class="form-group"> 
                <label for="group">News category</label>
                <input type="hidden" value="<?php echo ((isset($intake)) ? $intake->intake_id : "") ?>" name="id">
                <input  value="<?php echo ((isset($intake)) ? $intake->intake_name : "") ?>" class="form-control m-t-xxs" id="category"  name="category" placeholder="Enter category here" type="text">
            </div>
            <label for="group">Featured Image</label>
            <div id="wrapper">
                <input id="fileUpload" type="file" name="userfile">
                <br />

                <div id="image-holder" style="height: 120px;width: 100px;"></div>
            </div> 

            <div class="form-group">
                <button type="submit" class="btn green m-t-xs bottom15-xs"><?php echo ((isset($formBtn)) ? $formBtn : "add News category") ?></button>
            </div>
        </form>
    </div>
</div>
<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script>

    $("#fileUpload").on('change', function () {

        var imgPath = $(this)[0].value;
        var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();

        if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
            if (typeof (FileReader) != "undefined") {

                var image_holder = $("#image-holder");
                image_holder.empty();

                var reader = new FileReader();
                reader.onload = function (e) {
                    $("<img />", {
                        "src": e.target.result,
                        "class": "thumb-image"
                    }).appendTo(image_holder);

                }
                image_holder.show();
                reader.readAsDataURL($(this)[0].files[0]);
            } else {
                alert("This browser does not support FileReader.");
            }
        } else {
            alert("Pls select only images");
        }
    });

</script>



