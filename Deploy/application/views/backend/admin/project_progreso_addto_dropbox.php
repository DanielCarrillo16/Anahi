<div class="row">
    <div class="col-md-12">
        <div class="panel panel-primary" data-collapsed="0">
            <div class="panel-heading">
                <div class="panel-title" >
                    <i class="entypo-dropbox"></i>
                    <?php echo get_phrase('save_file_to_dropbox'); ?>
                </div>
            </div>
            <div class="panel-body" style="text-align:center;">
                <?php 
                $file_name  = $this->db->get_where('project_progreso' , array('project_progreso_id' => $param2))->row()->name;
                $file_link  = base_url().'uploads/project_progreso/'.$file_name;
                $file_link  = str_replace(" " , "%20" , $file_link);
                echo $file_name;
                ?>

                <hr />
               
                <div id="container_saver"></div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    
    var options_saver = {
        files: [
            {'url': '<?php echo $file_link;?>', 'filename': '<?php echo $file_name;?>'}
        ],
        success: function () {
            toastr.success("Files saved to your Dropbox.", "Success");
        },
        progress: function (progress) {},
        cancel: function () {},
        error: function (errorMessage) {
            toastr.error(errorMessage, "Error");
        }
    };
    
    var button_saver = Dropbox.createSaveButton(options_saver);
    document.getElementById("container_saver").appendChild(button_saver);

</script>