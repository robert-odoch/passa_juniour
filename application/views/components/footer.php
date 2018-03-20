
<a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>
<!-- Go top -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.min.js"></script>
<!-- bootstrap js -->
<script src="<?php echo base_url(); ?>assets/js/vendor/bootstrap.min.js"></script>
<!--  chartJs js  -->
<script src="<?php echo base_url(); ?>assets/js/vendor/chartJs/Chart.bundle.js"></script>
<!--timeline_horizontal-->
<script src="<?php echo base_url(); ?>assets/js/vendor/jquery.mobile.custom.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vendor/hTimeline.js"></script>
<!-- amcharts -->
<script src="<?php echo base_url(); ?>assets/js/vendor/amcharts/amcharts.js"></script>

<script src="<?php echo base_url(); ?>assets/js/vendor/amcharts/serial.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vendor/amcharts/pie.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vendor/amcharts/gantt.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vendor/amcharts/funnel.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vendor/amcharts/radar.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vendor/amcharts/amstock.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vendor/amcharts/ammap.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vendor/amcharts/worldLow.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vendor/amcharts/light.js"></script>
<!-- Peity -->
<script src="<?php echo base_url(); ?>assets/js/vendor/peityJs/jquery.peity.min.js"></script>
<!-- fullcalendar -->
<script src='<?php echo base_url(); ?>assets/js/vendor/lib/moment.min.js'></script>
<script src='<?php echo base_url(); ?>assets/js/vendor/lib/jquery-ui.custom.min.js'></script>
<script src='<?php echo base_url(); ?>assets/js/vendor/fullcalendar.min.js'></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/bootstrap-wysiwyg.js" charset="UTF-8"></script>
<!-- icheck -->
<script src="<?php echo base_url(); ?>assets/js/vendor/icheck.js"></script>
<!-- dataTables-->
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/jquery.dataTables.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/dataTables.bootstrap.min.js"></script>
<!-- js for print and download -->
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/buttons.flash.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/jszip.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/pdfmake.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/vfs_fonts.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/buttons.html5.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/buttons.print.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/dataTables.responsive.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/dataTables.fixedHeader.min.js"></script>
<!-- slimscroll js -->
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/jquery.slimscroll.js"></script>
<!-- dashboard1 js -->
<script src="<?php echo base_url(); ?>assets/js/dashboard1.js"></script>
<!-- pace js -->
<script src="<?php echo base_url(); ?>assets/js/vendor/pace/pace.min.js"></script>
<!-- main js -->
<script src="<?php echo base_url(); ?>assets/js/main.js"></script>
<!-- adminbag demo js-->
<script src="<?php echo base_url(); ?>assets/js/adminbagdemo.js"></script>
<script src="<?php echo base_url(); ?>assets/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script src="<?php echo base_url(); ?>assets/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/vendor/jquery.multi-select.js" charset="UTF-8"></script>
<script src="<?php echo base_url(); ?>assets/js/bootstrap-datepicker.min.js"></script>


 <script src="https://cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.1/bootstrap3-editable/js/bootstrap-editable.js"></script>

<script>

    $(document).ready(function () {
        $('#example').DataTable();
        
        $(".nav-tabs a").click(function () {
            $(this).tab('show');
        });
    });
</script>
<script>
    CKEDITOR.replace('text');
</script>
<script>
    $('.form_date').datetimepicker({
        // language:  'fr',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

</script>

<script>
    $(function () {
        $('#my-select').multiSelect()
        $('#pre-selected-options').multiSelect();
        $('#callbacks').multiSelect({
            afterSelect: function (values) {
                alert("Select value: " + values);
            },
            afterDeselect: function (values) {
                alert("Deselect value: " + values);
            }
        });
        $('#optgroup').multiSelect({selectableOptgroup: true});
    });
</script>
<script>
    window.setTimeout(function () {
        $(".alert").fadeTo(500, 0).slideUp(500, function () {
            $(this).remove();
        });
    }, 4000);
</script>
<script>
    $('.stats-number').each(function () {
        $(this).prop('Counter', 0).animate({
            Counter: $(this).text()
        }, {
            duration: 4000,
            easing: 'swing',
            step: function (now) {
                $(this).text(Math.ceil(now));
            }
        });
    });
// myVar = setTimeout(showPage, 3000);

    $(window).on('load', function () {
        setTimeout(removeLoader, 2000); //wait for page load PLUS two seconds.
    });
    function removeLoader() {
        $(".loader").fadeOut(500, function () {
            // fadeOut complete. Remove the loading div
            $(".loader").remove(); //makes page more lightweight 
        });
    }


</script>

</body>
</html>
