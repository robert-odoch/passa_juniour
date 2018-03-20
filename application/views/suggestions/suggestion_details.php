<?php
require_once(APPPATH . 'core/functions.php');
$api = new core_func();
?>
<div class="row">
 <div class=" col-lg-12">
            <div class="mail-box-header">
              <div class="pull-right tooltip-demo"> <a title="" data-placement="top" data-toggle="tooltip" class="btn btn-white btn-sm" href="#" data-original-title="Print email"><i class="fa fa-print"></i> </a>  </div>
              <h3> View New Suggestion </h3>
              <div class="mail-tools tooltip-demo ">
               
                <h5> <span class="pull-right font-noraml"><span style="color:#2B3643;font-size: 13px;"><?php echo $suggestion->sent_time;?></span></span> </h5>
                 
              </div>
            </div>
              <br>  <br>
            <div class="mail-box">
              <div class="mail-body">

                <p style="font-size: 15px;"><?php echo $suggestion->suggestion;?></p>
               
              </div>
            
              <div class="mail-body text-right tooltip-demo">
                <button class="btn btn-sm btn-white" data-original-title="Print" type="button" data-toggle="tooltip" data-placement="top" title=""><i class="fa fa-print"></i> Print</button>
               
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
      </div>

          