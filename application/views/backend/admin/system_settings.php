<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<?php $system_currency = $this->db->get_where('settings' , array('type' =>'system_currency_id'))->row()->description; ?>
<div class="row">
    <div class="col-md-8 col-md-offset-2">

        <div class="panel panel-primary" >

            <div class="panel-heading">
                <div class="panel-title">
                    <?php echo get_phrase('system_settings'); ?>
                </div>
            </div>

            <div class="panel-body">
                <?php echo form_open(site_url('admin/system_settings/do_update'), array('class' => 'form-horizontal form-groups-bordered validate', 'target' => '_top'));
                ?>

                <div class="form-group">
                    <label  class="col-sm-3 control-label"><?php echo get_phrase('system_name'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="system_name"
                               value="<?php echo $this->db->get_where('settings', array('type' => 'system_name'))->row()->description; ?>">
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-3 control-label"><?php echo get_phrase('system_title'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="system_title"
                               value="<?php echo $this->db->get_where('settings', array('type' => 'system_title'))->row()->description; ?>">
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-3 control-label"><?php echo get_phrase('address'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="address"
                               value="<?php echo $this->db->get_where('settings', array('type' => 'address'))->row()->description; ?>">
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-3 control-label"><?php echo get_phrase('phone'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="phone"
                               value="<?php echo $this->db->get_where('settings', array('type' => 'phone'))->row()->description; ?>">
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-3 control-label"><?php echo get_phrase('system_email'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="system_email"
                               value="<?php echo $this->db->get_where('settings', array('type' => 'system_email'))->row()->description; ?>">
                    </div>
                </div>
                <div class="form-group">
                <label  class="col-sm-3 control-label"><?php echo get_phrase('system_currency');?></label>
                <div class="col-sm-7">
                    <select name="system_currency" class="form-control selectboxit">
                    	<?php $currency_array = $this->db->get('currency')->result_array();
                    		foreach ($currency_array as $currency):?>
							                   <option value="<?php echo $currency['currency_id'];?>" <?php if($currency['currency_id'] == $system_currency) echo "selected";?> ><?php echo $currency['currency_name'];?></option>
                    		<?php endforeach; ?>							?>
                     </select>
                </div>
              </div>
                <!-- <div class="form-group">
                    <label  class="col-sm-3 control-label"><?php echo get_phrase('dropbox_app_key'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="dropbox_data_app_key"
                               value="<?php echo $this->db->get_where('settings', array('type' => 'dropbox_data_app_key'))->row()->description; ?>">
                    </div>
                </div> -->

                <div class="form-group">
                    <label  class="col-sm-3 control-label"><?php echo get_phrase('language'); ?></label>
                    <div class="col-sm-7">
                        <select name="language" class="selectboxit">
                            <?php
                            foreach ($all_language as $field) {
                                if ($field == 'phrase_id' || $field == 'phrase')
                                    continue;

                                $current_default_language = $this->db->get_where('settings', array('type' => 'language'))->row()->description;
                                ?>
                                <option value="<?php echo $field; ?>"
                                        <?php if ($current_default_language == $field) echo 'selected'; ?>> <?php echo $field; ?> </option>
                                        <?php
                                    }
                                    ?>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-3 control-label"><?php echo get_phrase('text_align'); ?></label>
                    <div class="col-sm-7">
                        <select name="text_align" class="selectboxit">
                            <?php $text_align = $this->db->get_where('settings', array('type' => 'text_align'))->row()->description; ?>
                            <option value="left-to-right" <?php if ($text_align == 'left-to-right') echo 'selected'; ?>> left-to-right (LTR)</option>
                            <option value="right-to-left" <?php if ($text_align == 'right-to-left') echo 'selected'; ?>> right-to-left (RTL)</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-3 control-label"><?php echo get_phrase('purchase_code'); ?></label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="purchase_code"
                               value="<?php echo $this->db->get_where('settings', array('type' => 'purchase_code'))->row()->description; ?>">
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-5">
                        <button type="submit" class="btn btn-info">Guardar</button>
                    </div>
                </div>

                <?php echo form_close(); ?>

                <hr />

                <?php echo form_open(site_url('admin/system_settings/upload_logo'), array('class' => 'form-horizontal form-groups-bordered validate', 'target' => '_top', 'enctype' => 'multipart/form-data'));
                ?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><?php echo get_phrase('upload_light_logo'); ?></label>

                            <div class="col-sm-7">

                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;" data-trigger="fileinput">
                                        <img src="<?php echo base_url('assets/logo.png'); ?>" alt="...">
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px"></div>
                                    <div>
                                        <span class="btn btn-white btn-file">
                                            <span class="fileinput-new">Select image</span>
                                            <span class="fileinput-exists">Change</span>
                                            <input type="file" name="light_logo" accept="image/*">
                                        </span>
                                        <a href="#" class="btn btn-orange fileinput-exists" data-dismiss="fileinput">Remove</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><?php echo get_phrase('upload_dark_logo'); ?></label>

                            <div class="col-sm-7">

                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;" data-trigger="fileinput">
                                        <img src="<?php echo base_url('assets/dark-logo.png'); ?>" alt="...">
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px"></div>
                                    <div>
                                        <span class="btn btn-white btn-file">
                                            <span class="fileinput-new">Select image</span>
                                            <span class="fileinput-exists">Change</span>
                                            <input type="file" name="dark_logo" accept="image/*">
                                        </span>
                                        <a href="#" class="btn btn-orange fileinput-exists" data-dismiss="fileinput">Remove</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-5">
                        <button type="submit" class="btn btn-info"><?php echo get_phrase('upload'); ?></button>
                    </div>
                </div>

                <?php echo form_close(); ?>

            </div>

        </div>


    <div class="panel panel-primary" data-collapsed="0">
        <div class="panel-heading">
            <div class="panel-title">
                Configuración de Twilio
            </div>
        </div>
            
        <!-- WHATSAPP CONFIGURATION -->
        <div class="panel-body">
            <?php echo form_open(site_url('admin/system_settings/twilio_update'), array('class' => 'form-horizontal form-groups-bordered validate', 'target' => '_top'));
            ?>

            <div class="form-group">
                <label  class="col-sm-3 control-label">ID Cuenta Twilio</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="twilio_id"
                        value="<?php echo $this->db->get_where('settings', array('type' => 'twilio_id'))->row()->description; ?>">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-3 control-label">Token de Twilio</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="twilio_token"
                        value="<?php echo $this->db->get_where('settings', array('type' => 'twilio_token'))->row()->description; ?>">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Mensaje de cita</label>
                <div class="col-sm-7">
                    <textarea class="form-control" name="whatsapp_message"><?php echo $this->db->get_where('settings', array('type' => 'whatsapp_message'))->row()->description;?></textarea>
                    <label class="col-sm-10 control-label">No eliminar ni modificar las palabras que comiencen con '$'</label>
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-3 control-label">Dias de anticipación para cita</label>
                <div class="col-sm-7">
                    <select name="days" class="selectboxit">
                        <?php $days = $this->db->get_where('settings', array('type' => 'days'))->row()->description; ?>
                        <option value="1" <?php if ($days == '1') echo 'selected'; ?>>1</option>
                        <option value="2" <?php if ($days == '2') echo 'selected'; ?>>2</option>
                        <option value="3" <?php if ($days == '3') echo 'selected'; ?>>3</option>
                        <option value="4" <?php if ($days == '4') echo 'selected'; ?>>4</option>
                        <option value="5" <?php if ($days == '5') echo 'selected'; ?>>5</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-5">
                    <button type="submit" class="btn btn-info">Guardar</button>
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-3 control-label">Mandar mensaje de prueba</label>
                <div class="col-sm-5">
                    <input type="number" class="form-control" name="test_number" id="test_number" placeholder="Número de telefono" value="">
                </div>
                <div class="col-sm-3">
                    <button type="button" onclick="send_message()" class="btn btn-success">Test</button>
                </div>
            </div>

            <?php echo form_close(); ?>
            <hr />

        </div>
    </div>

      <!-- Updater -->
      <div class="panel panel-primary" data-collapsed="0">

                <div class="panel-heading">
                    <div class="panel-title">
                        <?php echo get_phrase('update_product');?>
                    </div>
                </div>


                <div class="panel-body form-horizontal form-groups-bordered">
                    <?php echo form_open(site_url('updater/update'), array('class' => 'form-horizontal form-groups-bordered', 'enctype' => 'multipart/form-data'));?>

                        <div class="form-group">
                            <label class="col-sm-3 control-label"><?php echo get_phrase('file'); ?></label>

                            <div class="col-sm-5">

                                <input type="file" name="file_name" class="form-control file2 inline btn btn-primary" data-label="<i class='glyphicon glyphicon-file'></i> Browse" />

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-5">
                                <input type="submit" class="btn btn-info" value="<?php echo get_phrase('install_update'); ?>" />
                            </div>
                        </div>

                    <?php echo form_close(); ?>
                </div>
            </div>
    </div>

</div>

<script>
    function send_message() {

        const phone_number = document.getElementById('test_number').value;
        if(phone_number == ""){
            document.getElementById("test_number").focus();
        }
        else{
            $.ajax({
                url: '<?php echo site_url('admin/test_send_message_base/');?>'+phone_number,
                success: function(response)
                {
                    if(response == "Entregado"){
                        swal("Entregado", "El mensaje ha sido entregado correctamente", "success");
                    }else{
                        swal("Error", "No se ha enviado el mensaje", "error");
                    }
                }
            });
        }
    }
</script>