<?php 

    $edit = $this->db->get_where('project_historia_clinica' , array('project_historia_clinica_id' => $param2))->result_array();

    foreach ($edit as $row):

?>

<div class="row">

    <div class="col-md-12">

        <div class="panel panel-primary" data-collapsed="0">

            <div class="panel-heading">

                <div class="panel-title" >

                    <i class="entypo-plus-circled"></i>

                    <?php echo get_phrase('edit_project_historia_clinica'); ?>

                </div>

            </div>

            <div class="panel-body">

                <?php 

                    $edit_botulinica = $this->db->get_where('project_toxina_botulinica' , array('id_historial_clinico' => $param2))->result_array();

                    foreach ($edit_botulinica as $row2):

                ?>



                <?php echo form_open(site_url('admin/project_historia_clinica/edit/' . $param2), array(

                    'class' => 'form-horizontal form-groups-bordered validate project-historia_clinica-edit', 'enctype' => 'multipart/form-data')); ?>

                

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('title'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="title" value="<?php echo $row['title']; ?>" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
                </div>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('nombre_completo'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="nombre_completo" value="<?php echo $row['nombre_completo']; ?>" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
                </div>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('nacimiento'); ?></label>
                    <div class="col-sm-7">
                        <input type="date" class="form-control" name="nacimiento" value="<?php echo $row['nacimiento']; ?>" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
                </div>

                <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('sexo'); ?>*</label>
                <div class="col-sm-5">
                    <select name="sexo" class="form-control selectboxit" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>">
                        <option value="" disabled selected><?php echo $row['sexo']; ?></option>
                        <option value="0" data-iconurl=""><?php echo get_phrase('masculino'); ?></option>
                        <option value="1"><?php echo get_phrase('femenino'); ?></option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Talla'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="talla" value="<?php echo $row['talla']; ?>" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
            </div>

            <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('peso'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="peso" value="<?php echo $row['peso']; ?>" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
            </div>

            <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('glucosa'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="glucosa" value="<?php echo $row['glucosa']; ?>" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
            </div>

            <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('motivo_consulta'); ?></label>
                    <div class="col-sm-7">
                    <input type="text" class="form-control" name="motivo_consulta" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['motivo_consulta']; ?>" autofocus>
                    </div>
            </div>

            <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('alergias'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="alergias" value="<?php echo $row['alergias']; ?>" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
            </div>

            <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('farmacos_actuales'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="farmacos_actuales" value="<?php echo $row['farmacos_actuales']; ?>" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('alcohol'); ?></label>
                <div class="col-sm-5">
                    <select name="alcohol" class="form-control selectboxit" value="<?php echo $row['alcohol']; ?>">
                        <option value="0" data-iconurl=""><?php echo get_phrase('no'); ?></option>
                        <option value="1"><?php echo get_phrase('si'); ?></option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Desde_cuando / Notas')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="alcohol_notas" value="<?php echo $row['alcohol_notas']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('tabaco'); ?></label>
                <div class="col-sm-5">
                    <select name="tabaco" class="form-control selectboxit" value="<?php echo $row['tabaco']; ?>">
                        <option value="0" data-iconurl=""><?php echo get_phrase('no'); ?></option>
                        <option value="1"><?php echo get_phrase('si'); ?></option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Desde_cuando / Notas')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="tabaco_notas" value="<?php echo $row['tabaco_notas']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('sustancias'); ?></label>
                <div class="col-sm-5">
                    <select name="sustancias" class="form-control selectboxit" value="<?php echo $row['sustancias']; ?>">
                        <option value="0" data-iconurl=""><?php echo get_phrase('no'); ?></option>
                        <option value="1"><?php echo get_phrase('si'); ?></option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Desde_cuando / Notas')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="sustancias_notas" value="<?php echo $row['sustancias_notas']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Glogau'); ?></label>
                <div class="col-sm-5">
                    <select name="glogau" class="form-control selectboxit" value="<?php echo $row['glogau']; ?>">
                        <option value="0" data-iconurl=""><?php echo get_phrase('tipo_1'); ?></option>
                        <option value="1"><?php echo get_phrase('tipo_2'); ?></option>
                        <option value="2" data-iconurl=""><?php echo get_phrase('tipo_3'); ?></option>
                        <option value="3"><?php echo get_phrase('tipo_4'); ?></option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Fitzpatrck'); ?></label>
                <div class="col-sm-5">
                    <select name="fitz" class="form-control selectboxit" value="<?php echo $row['fitz']; ?>">
                        <option value="0" data-iconurl=""><?php echo get_phrase('tipo_1'); ?></option>
                        <option value="1"><?php echo get_phrase('tipo_2'); ?></option>
                        <option value="2" data-iconurl=""><?php echo get_phrase('tipo_3'); ?></option>
                        <option value="3"><?php echo get_phrase('tipo_4'); ?></option>
                        <option value="4"><?php echo get_phrase('tipo_5'); ?></option>
                        <option value="5"><?php echo get_phrase('tipo_6'); ?></option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Zona frontal')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="zona_frontal_cantidad" value="<?php echo $row2['zona_frontal_cantidad']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Zona corrugador')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="zona_corrugador_cantidad" value="<?php echo $row2['zona_corrugador_cantidad']; ?>" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Zona proceus')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="zona_proceus_cantidad" value="<?php echo $row2['zona_proceus_cantidad']; ?>" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Zona ojo')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="zona_ojo_cantidad" value="<?php echo $row2['zona_ojo_cantidad']; ?>" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Zona subpalpebral')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="zona_subpalpebral_cantidad" value="<?php echo $row2['zona_subpalpebral_cantidad']; ?>" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Zona nariz')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="zona_nariz_cantidad" value="<?php echo $row2['zona_nariz_cantidad']; ?>" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Zona boca')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="zona_boca_cantidad" value="<?php echo $row2['zona_boca_cantidad']; ?>" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Zona masetero')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="zona_masetero_cantidad" value="<?php echo $row2['zona_masetero_cantidad']; ?>" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Zona mentoniano')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="zona_mentoniano_cantidad" value="<?php echo $row2['zona_mentoniano_cantidad']; ?>" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Zona otros')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="zona_otros_cantidad" value="<?php echo $row2['zona_otros_cantidad']; ?>" autofocus>
                </div>
            </div>


            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Notas_agregadas')?></label>
                <div class="col-sm-7">
                <textarea class="form-control" name="notas" value="<?php echo $row['notas']; ?>"></textarea>
                </div>
            </div>


                <div class="form-group">

                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('asignar_staff'); ?></label>
                
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
                        <button type="submit" class="btn btn-info" visible="true" id="submit-button"><?php echo get_phrase('update'); ?></button>
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

    var post_refresh_url = '<?php echo site_url('admin/reload_projectroom_historia_clinica/' . $project_code); ?>';

</script>



<?php endforeach;?>

<?php endforeach;?>





<script type="text/javascript">

    // ajax form plugin calls at each modal loading,

$(document).ready(function() {



   //config for project historia_clinica adding

    var options = {

        beforeSubmit: validate_project_historia_clinica_edit,

        success: show_response_project_historia_clinica_edit,

        resetForm: true

    };

    $('.project-historia_clinica-edit').submit(function () {

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



function validate_project_historia_clinica_edit(formData, jqForm, options) {



    if (!jqForm[0].title.value)

    {

        toastr.error("Please enter a title", "Error");

        return false;

    }

}



// ajax success response after form submission

function show_response_project_historia_clinica_edit(responseText, statusText, xhr, $form)  {



    

    toastr.success("historia_clinica edited successfully", "Success");

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





