

<div class="row">
  <div class="col-md-12">
    <a href="javascript:;" onclick="showAjaxModal('<?php echo site_url('modal/popup/notice_add');?>');" class="btn btn-primary pull-right btn-adding">
        <i class="entypo-plus-circled"></i>
        <?php echo get_phrase('add_notice');?>
    </a>
  </div>
</div>
<br><br><button class="btn btn-primary pull-right btn-adding" onclick="cron_job()">Simulador Cron Job</button>
<div class="main_data">
	<?php include 'notice_list.php';?>
</div>

<script>
    function cron_job(){
        $.ajax({
            url: '<?php echo site_url('admin/check_notice/');?>',
            success: function(response)
            {
              console.log(response);
            }
        });
    }
</script>