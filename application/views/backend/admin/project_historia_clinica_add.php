<div class="row">
    <div class="col-md-12">
        <div class="panel panel-primary" data-collapsed="0">
            <div class="panel-heading">
                <div class="panel-title" >
                    <i class="entypo-plus-circled"></i>
                    <?php echo get_phrase('add_project_historia_clinica'); ?>
                </div>
            </div>
            <div class="panel-body">

                <?php echo form_open(site_url('admin/project_historia_clinica/create/'.$param2), array('class' => 'form-horizontal form-groups-bordered validate project-historia_clinica-add', 'enctype' => 'multipart/form-data')); ?>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Título'); ?>*</label>

                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="title" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
                </div>

                <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Nombre_completo')?>*</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="nombre_completo" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                </div>
            </div>
        

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número_de_expediente')?>*</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="numero_expediente" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Fecha_de_creacion')?>*</label>
                <div class="col-sm-7">
                <input type="date" class="form-control" name="creacion" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Fecha_de_nacimiento')?>*</label>
                <div class="col-sm-7">
                <input type="date" class="form-control" name="nacimiento" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('edad')?>*</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="edad" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('sexo'); ?>*</label>
                <div class="col-sm-5">
                    <select name="sexo" class="form-control selectboxit" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>">
                        <option value="" disabled selected><?php echo get_phrase('seleccionar'); ?></option>
                        <option value="0" data-iconurl=""><?php echo get_phrase('masculino'); ?></option>
                        <option value="1"><?php echo get_phrase('femenino'); ?></option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Número_de_teléfono')?>*</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="telefono" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('direccion')?>*</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="direccion" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Talla')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="talla" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Peso_(Kg)')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="peso" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Glucosa')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="glucosa" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Motivo_de_consulta')?>*</label>
                <div class="col-sm-7">
                <input type="text" class="form-control" name="motivo_consulta" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Alergias')?></label>
                <div class="col-sm-7">
                <input class="alergias" type="radio" value="1" name="alergias">
                    <label class="form-check-label" for="alergias">
                        Si
                    </label><br>
                <input class="alergias" type="radio" value="0" name="alergias">
                    <label class="form-check-label" for="alergias">
                        No
                    </label>
                </div>
            </div><br>

            <div id="div2" style="display:none;">
            </div>

            <div id="div1" style="display:;">
                <div class="form-group">
                    <div class="div_alergias">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Cuales(alergias)')?></label>
                        <div class="col-sm-7">
                        <input type="text" class="form-control" name="alergias_notas"  value="" autofocus>
                        </div>
                    </div>
                </div>
            </div>


            
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('farmacos_actuales')?></label>
                <div class="col-sm-7">
                    <input class="farmacos_actuales" type="radio" value="1" name="farmacos_actuales">
                    <label class="form-check-label" for="farmacos_actuales">
                        Si
                    </label><br>
                    <input class="farmacos_actuales" type="radio" value="0" name="farmacos_actuales">
                    <label class="form-check-label" for="farmacos_actuales">
                        No
                    </label>
                </div>
            </div>
            <br>

            <div id="div4" style="display:none;">
            </div>
            
            <div id="div3" style="display:;">
                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Cuales(farmacos_actuales)')?></label>
                    <div class="col-sm-7">
                    <input type="text" class="form-control" name="farmacos_actuales_notas"  value="" autofocus>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Antecedentes_de_procedimientos_quirurjicos_o_estéticos)')?></label>
                <div class="col-sm-7">
                <input class="procedimientos_quirurjicos" type="radio" value="1"  name="procedimientos_quirurjicos">
                    <label class="form-check-label" for="procedimientos_quirurjicos">
                        Si
                    </label><br>
                <input class="procedimientos_quirurjicos" type="radio" value="0"  name="procedimientos_quirurjicos">
                    <label class="form-check-label" for="procedimientos_quirurjicos">
                        No
                    </label>
                </div>
            </div>

            <div id="div6" style="display:none;">
            </div>

            <div id="div5" style="display:;">
                <div class="form-group" id="quirurjicos">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Cuando')?>*</label>
                    <div class="col-sm-7">
                    <input type="date" class="form-control" name="quirurjicos_fecha" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
                </div><br>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Antecedentes_personales_no_patologicos')?></label>
                <div class="col-sm-7">
                <input class="form-check-input" type="checkbox" value="1" name="alcohol">
                    <label class="form-check-label" for="alcohol">
                        Alcoholismo
                    </label><br>
                    <input class="form-check-input" type="checkbox" value="1" name="tabaco">
                    <label class="form-check-label" for="tabaco">
                        Tabaquismo
                    </label><br>
                    <input class="form-check-input" type="checkbox" value="1" name="sustancias">
                    <label class="form-check-label" for="sustancias">
                        Toxicomanias
                    </label>
                </div>
            </div><br>


            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Escala_de_Glogau'); ?></label>
                <div class="col-sm-6">
                    <select name="glogau" class="form-control selectboxit">
                        <option value="0"><?php echo get_phrase('Tipo 1 - Leve (20 a 30 años)'); ?></option>
                        <option value="1"><?php echo get_phrase('Tipo 2 - Moderado (30 a 40 años)'); ?></option>
                        <option value="2"><?php echo get_phrase('Tipo 3 - Avanzado (Arriba de 50 años)'); ?></option>
                        <option value="3"><?php echo get_phrase('Tipo 4 - Severo (Arriba de 60 años)'); ?></option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Fitzpatrck'); ?></label>
                <div class="col-sm-6">
                    <select name="fitz" class="form-control selectboxit">
                        <option value="0"><?php echo get_phrase('Tipo I - Albina, caucásica'); ?></option>
                        <option value="1"><?php echo get_phrase('Tipo II - Blanca, Clara'); ?></option>
                        <option value="2"><?php echo get_phrase('Tipo III - Piel europea oscura'); ?></option>
                        <option value="3"><?php echo get_phrase('Tipo IV - Piel moreno clara'); ?></option>
                        <option value="4"><?php echo get_phrase('Tipo V - Piel moreno oscura'); ?></option>
                        <option value="5"><?php echo get_phrase('Tipo VI - Piel negra'); ?></option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('Notas_agregadas')?></label>
                <div class="col-sm-7">
                <textarea class="form-control" name="notas"></textarea>
                </div>
            </div>

            <div class="form-group">
                <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('assign_staff'); ?></label>

                <div class="col-sm-5">
                    <select name="assigned_staff" class="select2">
                        <option selected="true" value=""><?php echo get_phrase('ninguno'); ?></option>

                        <?php
                        $assigned_staffs = $this->db->get_where('project', array('project_code' => $param2))->row()->staffs;
                        $staffs = ( explode(',', $assigned_staffs));
                        $number_of_staffs = count($staffs) - 1;
                        if ($number_of_staffs > 0):
                            for ($i = 0; $i < $number_of_staffs; $i++):
                                $staff_data = $this->db->get_where('staff', array('staff_id' => $staffs[$i]))->result_array();
                                foreach ($staff_data as $row):
                                ?>
                                    <option value="<?php echo $row['staff_id']; ?>"> <?php echo $row['name']; ?></option>
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
                        <button type="submit" class="btn btn-info" id="submit-button"><?php echo get_phrase('submit'); ?></button>
                        <span id="preloader-form"></span>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>

<script>
    // url for refresh data after ajax form submission
    var post_refresh_url = '<?php echo site_url('admin/reload_projectroom_historia_clinica/' . $param2); ?>';
</script>

<script type="text/javascript">
    // ajax form plugin calls at each modal loading,
    $(document).ready(function() {
    //config for project task adding

        //OCULTAMOS LOS DIV DE SI/NO
        $("#div1").css("display", "none");
        $("#div3").css("display", "none");
        $("#div5").css("display", "none");

        //LISTENER DE ALERGIAS
        $(".alergias").click(function(evento){
            
            var valor = $(this).val();
            
            if(valor == '0'){
                $("#div1").css("display", "none");
                $("#div2").css("display", "block");
            }else{
                $("#div1").css("display", "block");
                $("#div2").css("display", "none");
            }
        });

        //LISTENER DE FARMACOS ACTUALES
        $(".farmacos_actuales").click(function(evento){
            
            var valor = $(this).val();
            
            if(valor == '0'){
                $("#div3").css("display", "none");
                $("#div4").css("display", "block");
            }else{
                $("#div3").css("display", "block");
                $("#div4").css("display", "none");
            }
        });

        //LISTENER DE PROCEDIMIENTOS QUIRURJICOS
        $(".procedimientos_quirurjicos").click(function(evento){
            
            var valor = $(this).val();
            
            if(valor == '0'){
                $("#div5").css("display", "none");
                $("#div6").css("display", "block");
            }else{
                $("#div5").css("display", "block");
                $("#div6").css("display", "none");
            }
        });

        var options = {
            beforeSubmit: validate_project_historia_clinica_add,
            success: show_response_project_historia_clinica_add,
            resetForm: true
        };
        $('.project-historia_clinica-add').submit(function () {
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

    function showContent() {
        element = document.getElementById("content");
        check = document.getElementById("check");
        if (check.checked) {
            element.style.display='block';
        }
        else {
            element.style.display='none';
        }
    }

    function validate_project_historia_clinica_add(formData, jqForm, options) {

        if (!jqForm[0].title.value)
        {
            toastr.error("Please enter a title", "Error");
            return false;
        }

        if (!jqForm[0].nacimiento.value)
        {
            toastr.error("Please enter your birthday", "Error");
            return false;
        }

        if (!jqForm[0].sexo.value)
        {
            toastr.error("Please enter your sex", "Error");
            return false;
        }

        if (!jqForm[0].peso.value)
        {
            toastr.error("Please enter your weight", "Error");
            return false;
        }

        if (!jqForm[0].motivo_consulta.value)
        {
            toastr.error("Please enter a reason for your consultation", "Error");
            return false;
        }
    }

    // ajax success response after form submission
    function show_response_project_historia_clinica_add(responseText, statusText, xhr, $form)  {
        toastr.success("Project historia clinica added successfully", "Success");
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

