<?php

	$current_project = $this->db->get_where('project' , array(

		'project_code' => $project_code

	))->result_array();

	foreach ($current_project as $row):

?>

 <div class="col-md-6">

        <br><br>

        <a href="#" class="btn btn-info pull-right tooltip-primary"

           onclick="showAjaxModal('<?php echo site_url('modal/popup/project_historia_clinica_add/' . $project_code); ?>');">

            <i class="entypo-plus"></i> Agregar Nota

        </a>

        <br><br><br><br>



        <!-- task accordion -->





        <div class="panel panel-primary main_data">

            <div class="panel-heading">

                <div class="panel-title">Nota</div>



            </div>



            <table class="table  table-responsive">

                <thead>

                    <tr>

                        <th>Titulo</th>

                        <th>Nombre</th>

                        <th>Fecha</th>

                        <th>Staff asignado</th>

                        <th><?php echo get_phrase('actions') ?></th>

                    </tr>

                </thead>



                <tbody>

                    <?php

                    $this->db->order_by('project_historia_clinica_id', 'desc');

                    $historia_clinica = $this->db->get_where('project_historia_clinica', array('project_code' => $project_code))->result_array();

                    foreach ($historia_clinica as $row1):

                        ?>

                        <tr>

                            <td><?php echo $row1['title']; ?></td>

                            
                            <td><?php echo $row1['nombre_completo'];  ?></td>

                            <td style="width: 20%"><?php echo date('d M Y', $row1['timestamp']); ?></td>

                            <td>

                                <?php

                                    $staff = $this->db->get_where('staff',array('staff_id'=>$row1['assigned_staff']));

                                    if($staff->num_rows()>0)

                                    echo $staff->row()->name;

                                ?>

                            </td>


                            

                            <td style="width: 20%">

                                <a class="tooltip-default" style="color:#aaa;" data-toggle="tooltip"

                                   data-placement="top" data-original-title="<?php echo get_phrase('view');?>"

                                   href="#" onclick="showAjaxModal('<?php echo site_url('modal/popup/project_historia_clinica_view/' . $row1['project_historia_clinica_id']); ?>')">

                                            <i class="entypo-info"></i>

                                </a>

                                <a class="tooltip-default" style="color:#aaa;cursor:pointer;" data-toggle="tooltip"

                                       data-placement="top" data-original-title="<?php echo get_phrase('edit'); ?>"

                                       onclick="showAjaxModal('<?php echo site_url('modal/popup/project_historia_clinica_edit/' . $row1['project_historia_clinica_id'] . '/' . $project_code); ?>');">

                                        <i class="entypo-pencil"></i>

                                </a>

                                <a class="tooltip-default" style="color:#aaa;cursor:pointer;" data-toggle="tooltip"

                                       data-placement="top" data-original-title="<?php echo get_phrase('delete'); ?>"

                                       onclick="confirm_modal('<?php echo site_url('admin/project_historia_clinica/delete/' . $row1['project_historia_clinica_id']); ?>', '<?php echo site_url('admin/reload_projectroom_historia_clinica/' . $project_code); ?>');">

                                        <i class="entypo-trash"></i>

                                </a>

                            </td>

                        </tr>

                    <?php endforeach; ?>



                </tbody>

            </table>

        </div>



    </div>



<div class="col-md-3">





    <!-- client -->

    <div class="panel panel-primary" data-collapsed="0">

        <div class="panel-heading">

            <div class="panel-title">

                <i class="entypo-user"></i> <?php echo get_phrase('client');?>

            </div>

            <div class="panel-options">

            </div>

        </div>

        <div class="panel-body">

             <?php

                if ($row['client_id'] < 1):

                    ?>

                    <center>

                        <?php echo get_phrase('no_client_added_yet');?>

                    </center>

            <?php endif; ?>

            <table width="100%" border="0">

            <tbody>

                <?php

                if ($row['client_id'] > 0):

                    $client_data = $this->db->get_where('client', array('client_id' => $row['client_id']))->result_array();

                    foreach ($client_data as $row3):

                        ?>

                <tr>

                    <td rowspan="2" width="60">

                        <img src="<?php echo $this->crud_model->get_image_url('client', $row3['client_id']); ?>"

                            alt="" class="img-circle" width="44">

                    </td>

                    <td>

                        <h4 style="font-weight: 200;"><?php echo $row3['name'];?></h4>

                    </td>

                </tr>

                <tr>

                    <td>

                        <?php if ($row3['skype_id'] != ''): ?>

                            <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                               data-original-title="<?php echo get_phrase('call_skype'); ?>"

                               href="skype:<?php echo $row3['skype_id']; ?>?chat" style="color:#bbb;">

                                <i class="entypo-skype"></i>

                            </a>

                        <?php endif; ?>

                        <?php if ($row3['email'] != ''): ?>

                            <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                               data-original-title="<?php echo get_phrase('send_email'); ?>"

                               href="mailto:<?php echo $row3['email']; ?>" style="color:#bbb;">

                                <i class="entypo-mail"></i>

                            </a>

                        <?php endif; ?>

                        <?php if ($row3['phone'] != ''): ?>

                            <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                               data-original-title="<?php echo get_phrase('call_phone'); ?>"

                               href="tel:<?php echo $row3['phone']; ?>" style="color:#bbb;">

                                <i class="entypo-phone"></i>

                            </a>

                        <?php endif; ?>

                        <?php if ($row3['facebook_profile_link'] != ''): ?>

                            <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                               data-original-title="<?php echo get_phrase('facebook_profile'); ?>"

                               href="<?php echo $row3['facebook_profile_link']; ?>" style="color:#bbb;" target="_blank">

                                <i class="entypo-facebook"></i>

                            </a>

                        <?php endif; ?>

                        <?php if ($row3['twitter_profile_link'] != ''): ?>

                            <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                               data-original-title="<?php echo get_phrase('twitter_profile'); ?>"

                               href="<?php echo $row3['twitter_profile_link']; ?>" style="color:#bbb;" target="_blank">

                                <i class="entypo-twitter"></i>

                            </a>

                        <?php endif; ?>

                        <?php if ($row3['whatsapp_profile_link'] != ''): ?>

                            <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                               data-original-title="<?php echo get_phrase('whatsapp_profile'); ?>"

                               href="<?php echo $row3['whatsapp_profile_link']; ?>" style="color:#bbb;" target="_blank">

                                <i class="entypo-linkedin"></i>

                            </a>

                        <?php endif; ?>

                    </td>

                </tr>

            <?php endforeach;?>

        <?php endif;?>

            </tbody>

            </table>

        </div>

    </div>



    <!-- staff -->

    <?php

        $staffs = ( explode(',', $row['staffs']));

        $number_of_staffs = count($staffs) - 1;

    ?>

        <div class="panel panel-primary" data-collapsed="0">

            <div class="panel-heading">

                <div class="panel-title">

                    <i class="entypo-users"></i> Staff asignado

                </div>

            </div>

            <div class="panel-body">

                 <?php

                    if ($number_of_staffs < 1):

                        ?>



                        <center>

                            <?php echo get_phrase('no_staff_assigned_yet');?>

                        </center>

                    <?php endif; ?>

                <?php

                    if ($number_of_staffs > 0):

                        for ($i = 0; $i < $number_of_staffs; $i++):

                            $staff_data = $this->db->get_where('staff', array('staff_id' => $staffs[$i]))->result_array();

                            foreach ($staff_data as $row2):

                                ?>

                                <table width="100%" border="0">

                                    <tr>

                                        <td rowspan="2" width="60">

                                            <img src="<?php echo $this->crud_model->get_image_url('staff', $row2['staff_id']); ?>"

                                                 alt="" class="img-circle" width="44">

                                        </td>

                                        <td>

                                            <h4 style="font-weight: 200;"><?php echo $row2['name']; ?></h4>

                                        </td>

                                    </tr>

                                    <tr>

                                        <td>

                                            <?php if ($row2['skype_id'] != ''): ?>

                                                <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                                                   data-original-title="<?php echo get_phrase('call_skype'); ?>"

                                                   href="skype:<?php echo $row2['skype_id']; ?>?chat" style="color:#bbb;">

                                                    <i class="entypo-skype"></i>

                                                </a>

                                            <?php endif; ?>

                                            <?php if ($row2['email'] != ''): ?>

                                                <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                                                   data-original-title="<?php echo get_phrase('send_email'); ?>"

                                                   href="mailto:<?php echo $row2['email']; ?>" style="color:#bbb;">

                                                    <i class="entypo-mail"></i>

                                                </a>

                                            <?php endif; ?>

                                            <?php if ($row2['phone'] != ''): ?>

                                                <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                                                   data-original-title="<?php echo get_phrase('call_phone'); ?>"

                                                   href="tel:<?php echo $row2['phone']; ?>" style="color:#bbb;">

                                                    <i class="entypo-phone"></i>

                                                </a>

                                            <?php endif; ?>

                                            <?php if ($row2['facebook_profile_link'] != ''): ?>

                                                <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                                                   data-original-title="<?php echo get_phrase('facebook_profile'); ?>"

                                                   href="<?php echo $row2['facebook_profile_link']; ?>" style="color:#bbb;" target="_blank">

                                                    <i class="entypo-facebook"></i>

                                                </a>

                                            <?php endif; ?>

                                            <?php if ($row2['twitter_profile_link'] != ''): ?>

                                                <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                                                   data-original-title="<?php echo get_phrase('twitter_profile'); ?>"

                                                   href="<?php echo $row2['twitter_profile_link']; ?>" style="color:#bbb;" target="_blank">

                                                    <i class="entypo-twitter"></i>

                                                </a>

                                            <?php endif; ?>

                                            <?php if ($row2['whatsapp_profile_link'] != ''): ?>

                                                <a class="tooltip-primary" data-toggle="tooltip" data-placement="top"

                                                   data-original-title="<?php echo get_phrase('whatsapp_profile'); ?>"

                                                   href="<?php echo $row2['whatsapp_profile_link']; ?>" style="color:#bbb;" target="_blank">

                                                    <i class="entypo-linkedin"></i>

                                                </a>

                                            <?php endif; ?>



                                        </td>

                                    </tr>

                                </table>

                                <br>

                                <?php

                            endforeach;

                        endfor;

                    endif;

                    ?>

            </div>

        </div>



</div>





<!-- custom styling for project calendar -->

<style>

    /*h2{font-weight: 200; font-size: 16px;}*/

    .fc-header-left{padding:4px !important;}

    .fc-header-right{padding:4px !important;}

</style>





<!-- calling ajax form submission plugin for specific form -->

<script src="<?php echo base_url('assets/js/jquery.form.js');?>"></script>



<script type="text/javascript">

    // ajax form plugin calls at each modal loading,





// custom function for data deletion by ajax and post refreshing call

function delete_data(delete_url , post_refresh_url)

{

    // showing user-friendly pre-loader image

    $('#preloader-delete').html('<img src="assets/images/preloader.gif" style="height:15px;margin-top:-10px;" />');



    // disables the delete and cancel button during deletion ajax request

    document.getElementById("delete_link").disabled=true;

    document.getElementById("delete_cancel_link").disabled=true;



    $.ajax({

        url: delete_url,

        success: function(response)

        {

            // remove the preloader

            $('#preloader-delete').html('');



            // show deletion success msg.

            toastr.info("Data deleted successfully.", "Success");



            // hide the delete dialog box

            $('#modal_delete').modal('hide');



            // enables the delete and cancel button after deletion ajax request success

            document.getElementById("delete_link").disabled=false;

            document.getElementById("delete_cancel_link").disabled=false;



            // reload the table

            reload_data(post_refresh_url);

        }

    });

}



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

<script src="<?php echo base_url('assets/js/neon-custom-ajax.js');?>"></script>

<?php endforeach;?>

