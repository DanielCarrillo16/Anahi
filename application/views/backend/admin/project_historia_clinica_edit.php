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



                <?php echo form_open(site_url('admin/project_historia_clinica/edit/' . $param2), array(

                    'class' => 'form-horizontal form-groups-bordered validate project-historia_clinica-edit', 'enctype' => 'multipart/form-data')); ?>

                


                    <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Título'); ?>*</label>

                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="title" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['title']; ?>" autofocus>
                    </div>
                </div>

                <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Nombre_completo')?>*</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="nombre_completo" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['nombre_completo']; ?>" autofocus>
                </div>
            </div>
        

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número_de_expediente')?>*</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="numero_expediente" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['num_expendiente']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Fecha_de_creacion')?>*</label>
                <div class="col-sm-7">
                <input type="date" class="form-control" name="creacion" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['creacion']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Fecha_de_nacimiento')?>*</label>
                <div class="col-sm-7">
                <input type="date" class="form-control" name="nacimiento" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['nacimiento']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('edad')?>*</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="edad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['edad']; ?>" autofocus>
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
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número_de_teléfono')?>*</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="telefono" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['telefono']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('direccion')?>*</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="direccion" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['direccion']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Talla')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="talla" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['talla']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Peso_(Kg)')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="peso" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['peso']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Glucosa')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="glucosa" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['glucosa']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Motivo_de_consulta')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="motivo_consulta" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['motivo_consulta']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Alergias')?></label>
                <div class="col-sm-7">
                <input class="form-check-input" type="checkbox" value="1"  name="alergias">
                    <label class="form-check-label" for="alergias">
                        Si
                    </label><br>
                    <input class="form-check-input" type="checkbox" value="0"  name="alergias">
                    <label class="form-check-label" for="alergias">
                        No
                    </label>
                </div>
            </div><br>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Cuales(alergias)')?></label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="alergias_notas"  value="<?php echo $row['alergias_notas']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('farmacos_actuales')?></label>
                <div class="col-sm-7">
                <input class="form-check-input" type="checkbox" value="1"  name="farmacos_actuales">
                    <label class="form-check-label" for="farmacos_actuales">
                        Si
                    </label><br>
                    <input class="form-check-input" type="checkbox" value="0"  name="farmacos_actuales">
                    <label class="form-check-label" for="farmacos_actuales">
                        No
                    </label>
                </div>
            </div><br>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Cuales(farmacos_actuales)')?></label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="farmacos_actuales_notas"  value="<?php echo $row['farmacos_actuales_notas']; ?>" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Antecedentes_de_procedimientos_quirurjicos_o_estéticos)')?></label>
                <div class="col-sm-7">
                <input class="form-check-input" type="checkbox" value="1"  name="procedimientos_quirurjicos" id="quirurjicos1">
                    <label class="form-check-label" for="procedimientos_quirurjicos">
                        Si
                    </label><br>
                <input class="form-check-input" type="checkbox" value="0"  name="procedimientos_quirurjicos">
                    <label class="form-check-label" for="procedimientos_quirurjicos">
                        No
                    </label>
                </div>
            </div>

            <div class="form-group" id="quirurjicos">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Cuando')?>*</label>
                <div class="col-sm-7">
                <input type="date" class="form-control" name="quirurjicos_fecha" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="<?php echo $row['quirurjicos_fecha']; ?>" autofocus>
                </div>
            </div><br>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Antecedentes_personales_no_patologicos')?></label>
                <div class="col-sm-7">
                <input class="form-check-input" type="checkbox" value="1"  name="alcohol">
                    <label class="form-check-label" for="alcohol">
                        Alcoholismo
                    </label><br>
                    <input class="form-check-input" type="checkbox" value="1"  name="tabaco">
                    <label class="form-check-label" for="tabaco">
                        Tabaquismo
                    </label><br>
                    <input class="form-check-input" type="checkbox" value="1"  name="sustancias">
                    <label class="form-check-label" for="sustancias">
                        Toxicomanias
                    </label>
                </div>
            </div><br>


                
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Glogau'); ?></label>
                <div class="col-sm-5">
                    <select name="glogau" class="form-control selectboxit" value="<?php echo $row['glogau']; ?>">
                        <option value="0" data-iconurl=""><?php echo get_phrase('Tipo 1-  Leve (20 a 30 años)'); ?></option>
                        <option value="1"><?php echo get_phrase('Tipo 2-  Moderado (30 a 40 años)'); ?></option>
                        <option value="2" data-iconurl=""><?php echo get_phrase('Tipo 3 - Avanzado (Arriba de 50 años)'); ?></option>
                        <option value="3"><?php echo get_phrase('Tipo 4 -  Severo (Arriba de 60 años)'); ?></option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Fitzpatrck'); ?></label>
                <div class="col-sm-5">
                    <select name="fitz" class="form-control selectboxit" value="<?php echo $row['fitz']; ?>">
                        <option value="0" data-iconurl=""><?php echo get_phrase('Tipo I-  Albina, caucásica'); ?></option>
                        <option value="1"><?php echo get_phrase('Tipo II-  Blanca, Clara'); ?></option>
                        <option value="2" data-iconurl=""><?php echo get_phrase('Tipo III - Piel europea oscura'); ?></option>
                        <option value="3"><?php echo get_phrase('Tipo IV -  Piel moreno clara'); ?></option>
                        <option value="4"><?php echo get_phrase('Tipo V -  Piel moreno oscura'); ?></option>
                        <option value="5"><?php echo get_phrase('Tipo VI -  Piel negra'); ?></option>
                    </select>
                </div>
            </div>


            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Notas_agregadas')?></label>
                <div class="col-sm-7">
                <textarea class="form-control" name="notas"><?php echo $row['notas']; ?></textarea>
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





