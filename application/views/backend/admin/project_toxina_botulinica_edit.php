<?php 

    $edit = $this->db->get_where('project_toxina_botulinica' , array('project_toxina_botulinica_id' => $param2))->result_array();

    foreach ($edit as $row):

?>

<div class="row">

    <div class="col-md-12">

        <div class="panel panel-primary" data-collapsed="0">

            <div class="panel-heading">

                <div class="panel-title" >

                    <i class="entypo-plus-circled"></i>

                    <?php echo get_phrase('edit_project_toxina_botulinica'); ?>

                </div>

            </div>

            <div class="panel-body">



                <?php echo form_open(site_url('admin/project_toxina_botulinica/edit/' . $param2), array(

                    'class' => 'form-horizontal form-groups-bordered validate project-bug-edit', 'enctype' => 'multipart/form-data')); ?>



                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Título'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="title" value="<?php echo $row['title']; ?>" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
                </div>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número de expediente'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="id_historial_clinico" value="<?php echo $row['id_historial_clinico']; ?>" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" autofocus>
                    </div>
                </div>


                <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número aplicaciones en la zona frontal'); ?></label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="zona_frontal_cantidad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['zona_frontal_cantidad']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número aplicaciones en la zona corrugador'); ?></label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="zona_corrugador_cantidad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['zona_corrugador_cantidad']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número aplicaciones en la zona proceus'); ?></label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="zona_proceus_cantidad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['zona_proceus_cantidad']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número aplicaciones en la zona ojo'); ?></label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="zona_ojo_cantidad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['zona_ojo_cantidad']; ?>" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número aplicaciones en la zona subpalpebral'); ?></label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="zona_subpalpebral_cantidad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['zona_subpalpebral_cantidad']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número aplicaciones en la zona nariz'); ?></label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="zona_nariz_cantidad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['zona_nariz_cantidad']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número aplicaciones en la zona boca'); ?></label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="zona_boca_cantidad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['zona_boca_cantidad']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número aplicaciones en la zona masetero'); ?></label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="zona_masetero_cantidad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['zona_masetero_cantidad']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número aplicaciones en la zona mentoniano'); ?></label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="zona_mentoniano_cantidad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['zona_mentoniano_cantidad']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número aplicaciones en la zona otros'); ?></label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="zona_otros_cantidad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['zona_otros_cantidad']; ?>" autofocus>
                </div>
            </div>




                 <div class="form-group">

                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('assign_staff'); ?></label>



                    <div class="col-sm-5">

                        <select name="assigned_staff" class="select2">

                            <option><?php echo get_phrase('select_staff'); ?></option>

                            <?php

                            $assigned_staffs = $this->db->get_where('project', array('project_code' => $param3))->row()->staffs;

                            $staffs = ( explode(',', $assigned_staffs));

                            $number_of_staffs = count($staffs) - 1;

                            if ($number_of_staffs > 0):

                                for ($i = 0; $i < $number_of_staffs; $i++):

                                    $staff_data = $this->db->get_where('staff', array('staff_id' => $staffs[$i]))->result_array();

                                    foreach ($staff_data as $row1):

                                        ?>

                            <option value="<?php echo $row1['staff_id']; ?>" <?php if($row['assigned_staff'] == $row1['staff_id']) echo 'selected'; ?>>

                                            <?php echo $row1['name']; ?></option>

                                        <?php

                                    endforeach;

                                endfor;

                            endif;

                            ?>

                        </select>

                    </div>

                </div>

               



                <div class="form-group">

                    <div class="col-sm-offset-3 col-sm-7">

                        <button type="submit" class="btn btn-info" id="submit-button"><?php echo get_phrase('update'); ?></button>

                        <span id="preloader-form"></span>

                    </div>

                </div>

                <?php echo form_close(); ?>

            </div>

        </div>

    </div>

</div>



<?php 

    $project_code = $row['project_code'];

?>



<script>

    // url for refresh data after ajax form submission

    var post_refresh_url = '<?php echo site_url('admin/reload_projectroom_toxina_botulinica/' . $project_code); ?>';

</script>



<?php endforeach;?>





<script type="text/javascript">

    // ajax form plugin calls at each modal loading,

$(document).ready(function() {



   //config for project bug adding

    var options = {

        beforeSubmit: validate_project_bug_edit,

        success: show_response_project_bug_edit,

        resetForm: true

    };

    $('.project-bug-edit').submit(function () {

        $(this).ajaxSubmit(options);

        return false;

    });



     if ($.isFunction($.fn.select2))

        {

            $(".select2").each(function (i, el)

            {

                var $this = $(el),

                        opts = {

                            allowClear: attrDefault($this, 'allowClear', false)

                        };



                $this.select2(opts);

                $this.addClass('visible');



                //$this.select2("open");

            });

        }

    

});



function validate_project_bug_edit(formData, jqForm, options) {



    if (!jqForm[0].title.value)

    {

        toastr.error("Please enter a title", "Error");

        return false;

    }

}



// ajax success response after form submission

function show_response_project_bug_edit(responseText, statusText, xhr, $form)  {



    

    toastr.success("Bug edited successfully", "Success");

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



            



            // calls the tooltip again on ajax success

            $('[data-toggle="tooltip"]').each(function(i, el)

            {

                var $this = $(el),

                    placement = attrDefault($this, 'placement', 'top'),

                    trigger = attrDefault($this, 'trigger', 'hover'),

                    popover_class = $this.hasClass('tooltip-secondary') ? 'tooltip-secondary' : ($this.hasClass('tooltip-primary') ? 'tooltip-primary' : ($this.hasClass('tooltip-default') ? 'tooltip-default' : ''));

                

                $this.tooltip({

                    placement: placement,

                    trigger: trigger

                });



                $this.on('shown.bs.tooltip', function(ev)

                {

                    var $tooltip = $this.next();

                    

                    $tooltip.addClass(popover_class);

                });

            });





               

        }

    });

}



</script>





