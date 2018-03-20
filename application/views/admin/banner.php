<style type="text/css">
    .btn-file {
        position: relative;
        overflow: hidden;
    }
    .btn-file input[type=file] {
        position: absolute;
        top: 0;
        right: 0;
        min-width: 100%;
        min-height: 100%;
        font-size: 100px;
        text-align: right;
        filter: alpha(opacity=0);
        opacity: 0;
        outline: none;
        background: white;
        cursor: inherit;
        display: block;
    }

    #img-upload{
        width: 100%;
    }
</style>


<?php
if ($banner->banner != null) {
    echo '<img src="' . base_url("upload/banners/") . $banner->banner . '">';
    echo '<br><br> <form enctype = "multipart/form-data" action="' . base_url() . 'admin/dashboard/upload_banner" method="POST">'
    . '<div class="col-lg-3"><input type="file" name="userfile">'
    . ' <input type="hidden" value="' . $university_id . '" name="university_id"></div>'
    . '<input type="submit" value="change banner">'
    . '</div>';
} else {
    echo '
        
<div class="container">
    <form enctype = "multipart/form-data" action="' . base_url() . 'admin/dashboard/upload_banner" method="POST">
        <div class="col-md-6">
            <div class="form-group">
                <label>Attach university banner</label>
                <div class="input-group">
                    <span class="input-group-btn">
                        <span class="btn btn-default btn-file">
                            Browse… <input type="file" id="imgInp" name="userfile">
                        </span>
                    </span>
                    <input type="text" class="form-control" readonly>
                </div>
                <img id=\'img-upload\'/>
            </div>
        </div> 
        <div class="col-md-6">
            <input type="hidden" value="' . $university_id . '" name="university_id">
            <label></label> <label></label>
            <div class="form-group">
                <input type="submit" value="upload banner" class="btn btn-primary">
            </div>
        </div>
    </form>
</div>

     ';
}
?>


<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $(document).on('change', '.btn-file :file', function () {
            var input = $(this),
                    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
            input.trigger('fileselect', [label]);
        });

        $('.btn-file :file').on('fileselect', function (event, label) {

            var input = $(this).parents('.input-group').find(':text'),
                    log = label;

            if (input.length) {
                input.val(log);
            } else {
                if (log)
                    alert(log);
            }

        });
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#img-upload').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#imgInp").change(function () {
            readURL(this);
        });
    });
</script>