<br />
<div class="table-responsive">
<table class="table  datatable" id="table-1">
    <thead>
        <tr>
            <th><?php echo get_phrase('type'); ?></th>
            <th><?php echo get_phrase('name') ?></th>
            <th><?php echo get_phrase('uploaded_by'); ?></th>
            <th><?php echo get_phrase('action'); ?></th>

        </tr>
    </thead>
    <tbody>
        <?php
        $project_id = $this->db->get_where('project', array('project_code' => $project_code))->row()->project_id;

        $this->db->order_by('project_progreso_id', 'desc');
        $project_files = $this->db->get_where('project_progreso', array('project_id' => $project_id))->result_array();
        //print_r($project_files);
        foreach ($project_files as $row1):
            ?>
            <tr class="odd gradeX">
                <td>
                    <?php if ($row1['file_type'] == 'jpg' || $row1['file_type'] == 'jpeg' || $row1['file_type'] == 'png' || $row1['file_type'] == 'gif') { ?>
                        <img src="<?php echo base_url('assets/images/image.png');?>"  style="max-height:40px;"/>
                    <?php } ?>
                    <?php if ($row1['file_type'] == 'txt') { ?>
                        <img src="<?php echo base_url('assets/images/text.png');?>"  style="max-height:40px;"/>
                    <?php } ?>
                    <?php if ($row1['file_type'] == 'pdf') { ?>
                        <img src="<?php echo base_url('assets/images/pdf.jpg');?>"  style="max-height:40px;"/>
                    <?php } ?>
                    <?php if ($row1['file_type'] == 'docx') { ?>
                        <img src="<?php echo base_url('assets/images/doc.jpg');?>"  style="max-height:40px;"/>
                    <?php } ?>

                </td>
                <td><?php echo $row1['name']; ?></td>
                <td>
                    <?php
                    $type = $row1['uploader_type'];
                    $id = $row1['uploader_id'];
                    $name = $this->db->get_where($type, array($type . '_id' => $id))->row()->name;
                    echo $name . '<br>' . date('d M Y', $row1['timestamp_upload']);
                    ?>
                </td>
                <td>
                    <?php if ($row1['description'] != ''): ?>
                        <a class="tooltip-default" style="color:#aaa;" data-toggle="tooltip" 
                           data-placement="top" data-original-title="<?php echo $row1['description']; ?>"
                           href="#">
                            <i class="entypo-info"></i>
                        </a>
                    <?php endif; ?>
                    <a class="tooltip-default" style="color:#aaa;" data-toggle="tooltip" 
                       data-placement="top" data-original-title="<?php echo get_phrase('download'); ?>"
                       href="<?php echo site_url('admin/project_progreso/download/' . $row1['project_progreso_id']); ?>">
                        <i class="entypo-download"></i>
                    </a>

                    <a class="tooltip-default" style="color:#aaa;cursor:pointer;" data-toggle="tooltip" 
                       data-placement="top" data-original-title="<?php echo get_phrase('save_to_dropbox'); ?>"
                       onclick="showAjaxModal('<?php echo site_url('modal/popup/project_progreso_addto_dropbox/' . $row1['project_progreso_id']); ?>')">

                        <i class="entypo-dropbox"></i>
                    </a>
                    <!-- DROPBOX SAVER BUTTON -->
                    <!--<div id="container_saver_<?php echo $row1['project_progreso_id']; ?>"></div>-->

                    <a class="tooltip-default" style="color:#aaa;cursor:pointer;" data-toggle="tooltip"
                       data-placement="top" data-original-title="<?php echo get_phrase('delete'); ?>"
                       onclick="confirm_modal('<?php echo site_url('admin/project_progreso/delete/' . $row1['project_progreso_id']); ?>', '<?php echo site_url('admin/reload_projectroom_progreso_list/' . $project_code); ?>');">
                        <i class="entypo-trash"></i>
                    </a>

                    <!--DROPBOX SAVER DYNAMIC SCRIPT -->
                    <script type="text/javascript">

                        var options_saver_<?php echo $row1['project_progreso_id']; ?> = {
                            files: [
                                {'url': 'https://dl.dropboxusercontent.com/s/deroi5nwm6u7gdf/advice.png', 'filename': 'koala.png'}
                            ],
                            success: function () {
                                toastr.success("Files saved to your Dropbox.", "Success");
                            },
                            progress: function (progress) {
                            },
                            cancel: function () {
                            },
                            error: function (errorMessage) {
                            }
                        };

                        //var button_saver_<?php echo $row1['project_progreso_id']; ?> = Dropbox.createSaveButton(options_saver_<?php echo $row1['project_progreso_id']; ?>);
                        //document.getElementById("container_saver_<?php echo $row1['project_progreso_id']; ?>").appendChild(button_saver_<?php echo $row1['project_progreso_id']; ?>);

                    </script>

                </td>

            </tr>
        <?php endforeach; ?>
    </tbody>

</table>

</div>

<script type="text/javascript">
    var responsiveHelper;
    var breakpointDefinition = {
        tablet: 1024,
        phone: 480
    };
    var tableContainer;

    jQuery(document).ready(function ($)
    {
        
        $("#table-1").dataTable();

        $(".dataTables_wrapper select").select2({
            minimumResultsForSearch: -1
        });
       
    });
</script>

<br />