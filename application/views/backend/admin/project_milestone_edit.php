<?php 
    $edit = $this->db->get_where('project_milestone' , array('project_milestone_id' => $param2))->result_array();
    foreach ($edit as $row):
?>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-primary" data-collapsed="0">
            <div class="panel-heading">
                <div class="panel-title" >
                    <i class="entypo-plus-circled"></i>
                    <?php echo get_phrase('edit_project_milestone'); ?>
                </div>
            </div>
            <div class="panel-body">

                <?php echo form_open(site_url('admin/project_milestone/edit/' . $param2), array(
                    'class' => 'form-horizontal form-groups-bordered project-milestone-edit', 'enctype' => 'multipart/form-data')); ?>

                <input hidden value="<?php echo $row['title'];?>" name="title_input" id="title_input">
                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('title'); ?></label>

                    <div class="col-sm-7">
                    <select name="title_service" id="title_service" class="form-control selectboxit">
                        <option value="<?= $row['id_servicio'] ?>"><?= $row['title'] ?></option>
                        <?php 
                            $service_products = $this->db->get('service_products')->result_array();
                            $products = $this->db->get('product')->result_array();
                            $services_list = $this->db->get('servicios');
                            
                            foreach ($services_list->result() as $servicios){
                                if($servicios->servicios_id == $row['id_servicio']){
                                    //Nada jjajajaj
                                }else{
                                    echo '<option value="'.$servicios->servicios_id.'">'.$servicios->nombre.'</option>';
                                }
                            }
                        ?>
                </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('amount'); ?></label>

                    <div class="col-sm-7">
                        <input type="number" class="form-control" name="amount" id="amount" value="<?php echo $row['amount'];?>" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('status'); ?></label>

                    <div class="col-sm-5">
                        <select name="status" class="form-control selectboxit">
                            <option value="0" <?php if ($row['status'] == 0) echo 'selected';?>><?php echo get_phrase('unpaid'); ?></option>
                            <option value="1" <?php if ($row['status'] == 1) echo 'selected';?>><?php echo get_phrase('paid'); ?></option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('date'); ?></label>

                    <div class="col-sm-5">
                        <div class="date">
                            <input type="text" name="timestamp" class="form-control datepicker" placeholder="due date"
                                value="<?php echo date("d M Y" , $row['timestamp']);?>">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('note'); ?></label>

                    <div class="col-sm-7">
                        <textarea class="form-control" name="note"><?php echo $row['note'];?></textarea>
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
    var post_refresh_url = '<?php echo site_url('admin/reload_projectroom_payment/' . $project_code); ?>';
</script>

<?php endforeach;?>


<script type="text/javascript">
    let servicesProducts = [];
    let products = [];
    let realProducts = [];

    <?php foreach ($service_products as $product) : ?>
        servicesProducts.push(<?php echo json_encode($product); ?>);
    <?php endforeach; ?>

    <?php foreach ($products as $product) : ?>
        products.push(<?php echo json_encode($product); ?>);
    <?php endforeach; ?>
    changeSelect();
    function changeSelect(){
        var idx = document.getElementById('title_service').value;
        realProducts = servicesProducts.filter(i => i.id_service == idx);
        
        for(let i = 0; i < realProducts.length; i++)
        {
            var aux = realProducts[i].id_product;
            var id = products.findIndex(i => i.product_id == aux);
            var left = products[id].existencia - realProducts[i].quantity;
            realProducts[i].quantity = left;
        }
    }
    $('form').submit(function() {

        let sanitizeProducts = JSON.stringify(realProducts).replace(/'/g, '"');
        $('form').append(`<input hidden name="realProducts" value='${sanitizeProducts}' /> `);

        return true;
    });


    // ajax form plugin calls at each modal loading,
$(document).ready(function() {

    $(document).on('change', '#title_service', function(event) {
        var id = document.getElementById('title_service').value;

        var first_select = document.getElementById('title_service');
        var selected = first_select.options[first_select.selectedIndex].text;

        document.getElementById("title_input").value = selected;

        $.ajax({
            url: '<?php echo site_url('admin/project_milestone_services/');?>'+id,
            success: function(response){
                document.getElementById("amount").value = response;
            }
        });
    });

   //config for project milestone adding
    var options = {
        beforeSubmit: validate_project_milestone_edit,
        success: show_response_project_milestone_edit,
        resetForm: true
    };
    $('.project-milestone-edit').submit(function () {
        $(this).ajaxSubmit(options);
        return false;
    });

     // Datepicker
        if($.isFunction($.fn.datepicker))
        {
            $(".datepicker").each(function(i, el)
            {
                var $this = $(el),
                    opts = {
                        format: attrDefault($this, 'format', 'mm/dd/yyyy'),
                        startDate: attrDefault($this, 'startDate', ''),
                        endDate: attrDefault($this, 'endDate', ''),
                        daysOfWeekDisabled: attrDefault($this, 'disabledDays', ''),
                        startView: attrDefault($this, 'startView', 0),
                        rtl: rtl()
                    },
                    $n = $this.next(),
                    $p = $this.prev();
                                
                $this.datepicker(opts);
                
                if($n.is('.input-group-addon') && $n.has('a'))
                {
                    $n.on('click', function(ev)
                    {
                        ev.preventDefault();
                        
                        $this.datepicker('show');
                    });
                }
                
                if($p.is('.input-group-addon') && $p.has('a'))
                {
                    $p.on('click', function(ev)
                    {
                        ev.preventDefault();
                        
                        $this.datepicker('show');
                    });
                }
            });
        }
    
    
});

function validate_project_milestone_edit(formData, jqForm, options) {

    if (!jqForm[0].title_service.value)
    {
        toastr.error("Please enter a title", "Error");
        return false;
    }
}

// ajax success response after form submission
function show_response_project_milestone_edit(responseText, statusText, xhr, $form)  {

    
    toastr.success("Milestone edited successfully", "Success");
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

