<?php
  $update = $this->db->get_where('notice', array('notice_id' => $param2))->result_array();
  foreach ($update as $row):
?>
<div class="row">
  <div class="col-md-12">
    <div class="panel panel-primary" data-collapsed="0">
      <div class="panel-heading">
        <div class="panel-title" >
            <i class="entypo-pencil"></i>
            Editar
        </div>
      </div>
      <div class="panel-body">

        <?php echo form_open(site_url('admin/noticeboard/edit/'. $param2), array(
            'class' => 'form-horizontal form-groups-bordered notice-edit', 'enctype' => 'multipart/form-data')); ?>

        <div class="form-group">
            <label for="field-1" class="col-sm-4 control-label"><?php echo get_phrase('title'); ?></label>
            <div class="col-sm-7">
                <div class="input-group">
                    <span class="input-group-addon"><i class="entypo-star"></i></span>
                    <input type="text" class="form-control" name="title" value="<?php echo $row['title'];?>" required>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="field-2" class="col-sm-4 control-label"><?php echo get_phrase('messages'); ?></label>

            <div class="col-sm-7">
                <div class="input-group ">
                    <span class="input-group-addon"><i class="entypo-pencil"></i></span>
                    <textarea class="form-control autogrow" name="description" style="height:48px;"><?php echo $row['description'];?></textarea>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="field-1" class="col-sm-4 control-label"><?php echo get_phrase('send_to'); ?></label>
            <div class="col-sm-7">
              <select name="visible_for" class="form-control selectboxit">
                  <option value=""><?php echo get_phrase('send_to'); ?></option>
                  <option value="staff" <?php if ($row['send_to'] == 'staff') echo 'selected';?>><?php echo get_phrase('staffs'); ?></option>
                  <option value="client" <?php if ($row['send_to'] == 'client') echo 'selected';?>><?php echo get_phrase('clients'); ?></option>
              </select>
            </div>
        </div>

        <!-- RECURRENTE -->
        <div class="form-group">
            <label for="field-1" class="col-sm-4 control-label"><?php echo get_phrase('recurrency')?></label>
            <div class="col-sm-7">
            <?php if($row['is_recurrent'] == "1"){ ?>
                <input class="is_recurrent" type="radio" value="1" name="is_recurrent" checked>
                    <label class="form-check-label" for="is_recurrent">
                        Si
                    </label><br>
                <input class="is_recurrent" type="radio" value="0" name="is_recurrent">
                    <label class="form-check-label" for="is_recurrent">
                        No
                    </label><?php
            }else{ ?>
                <input class="is_recurrent" type="radio" value="1" name="is_recurrent">
                    <label class="form-check-label" for="is_recurrent"Z>
                        Si
                    </label><br>
                <input class="is_recurrent" type="radio" value="0" name="is_recurrent" checked>
                    <label class="form-check-label" for="is_recurrent">
                        No
                    </label><?php
            }?>

            </div>
        </div><br>

        <div id="div2" style="display:none;">
        </div>

        <div id="div1" style="display:;">
            <div class="form-group">
                <div class="div_recurrency">
                    <label for="field-1" class="col-sm-4 control-label"><?php echo get_phrase('recurrent')?></label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" name="quantity"  value="<?php echo $row['quantity']; ?>" min="1" pattern="^[0-9]+" autofocus>
                    </div>
                    <div class="col-sm-5">
                    <select name="recurrency" class="form-control selectboxit">  
                        <option value="days" <?php if ($row['recurrency'] == 'days') echo 'selected';?>><?php echo get_phrase('days'); ?></option>
                        <option value="week" <?php if ($row['recurrency'] == 'weeks') echo 'selected';?>><?php echo get_phrase('weeks'); ?></option>
                        <option value="month" <?php if ($row['recurrency'] == 'months') echo 'selected';?>><?php echo get_phrase('months'); ?></option>
                        <option value="year" <?php if ($row['recurrency'] == 'years') echo 'selected';?>><?php echo get_phrase('years'); ?></option>
                    </select>
                    </div>
                </div>
            </div>
        </div>

        <!-- FINAL RECURRENTE -->

        <div class="form-group">
          <div class="col-sm-offset-4 col-sm-7">
            <button type="submit" class="btn btn-info" id="submit-button"><?php echo get_phrase('save'); ?></button>
            <span id="preloader-form"></span>
          </div>
        </div>
          <?php echo form_close(); ?>
      </div>
    </div>
  </div>
</div>
<?php endforeach; ?>

<script>
    // url for refresh data after ajax form submission
    var post_refresh_url = '<?php echo site_url('admin/reload_notice_list'); ?>';
</script>


<script type="text/javascript">
    // ajax form plugin calls at each modal loading,
$(document).ready(function() {

    <?php if($row['is_recurrent'] == "0"){ echo '$("#div1").css("display", "none");';}?>
    // $("#div1").css("display", "none");

    $(".is_recurrent").click(function(evento){
            
        var valor = $(this).val();
        
        if(valor == '0'){
            $("#div1").css("display", "none");
            $("#div2").css("display", "block");
        }else{
            $("#div1").css("display", "block");
            $("#div2").css("display", "none");
        }
    });

   //config for project milestone adding
    var options = {
        beforeSubmit: validate_expense_add,
        success: show_response_expense_add,
        resetForm: true
    };
    $('.notice-add').submit(function () {
        $(this).ajaxSubmit(options);
        return false;
    });


});

function validate_expense_add(formData, jqForm, options) {

    if (!jqForm[0].title.value)
    {
        toastr.error("Please enter title", "Error");
        return false;
    }
}

// ajax success response after form submission
function show_response_expense_add(responseText, statusText, xhr, $form)  {


    toastr.success("Notice added successfully", "Success");
    $('#modal_ajax').modal('hide');
    reload_data(post_refresh_url);
}



/*-----------------custom functions for ajax post data handling--------------------*/



// custom function for reloading table data
function reload_data(url)
{
    $.ajax({
        url: url,
        success: function(response)
        {
            // Replace new page data
            jQuery('.main_data').html(response);

        }
    });
}

</script>
