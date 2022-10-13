<div class="row">
    <div class="col-md-12">
        <div class="panel panel-primary" data-collapsed="0">
            <div class="panel-heading">
                <div class="panel-title" >
                    <i class="entypo-plus-circled"></i>
                    <?php echo get_phrase('add_new_team_task'); ?>
                </div>
            </div>
            <div class="panel-body">

                <?php echo form_open(site_url('admin/team_task/create'), array('class' => 'form-horizontal form-groups-bordered validate', 'enctype' => 'multipart/form-data')); ?>

                <input type="hidden" class="form-control" name="task_title" id="task_title" value="">

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label">Paciente</label>
                    <div class="col-sm-7">
                        <select class="selectboxit" name="client_id" id="client_id">
                            <option value="" selected disabled hidden>Seleccione un cliente</option>
                            <?php 
                                $clients = $this->db->get('client')->result_array();
                                foreach ($clients as $row): ?>
                                    <option value="<?php echo $row['client_id'];?>"><?php echo $row['name'];?></option> <?php
                                endforeach;
                            ?>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('creation_date');?></label>
                    
                    <div class="col-sm-8">
                    <div class="input-group">
                            <span class="input-group-addon"><i class="entypo-calendar"></i></span>
                            <input type="text" class="form-control datepicker" name="creation_timestamp"  
                                value="" >
                     </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('due_date');?></label>
                    
                    <div class="col-sm-8">
                    <div class="input-group">
                            <span class="input-group-addon"><i class="entypo-calendar"></i></span>
                            <input type="text" class="form-control datepicker" name="due_timestamp"  
                                value="" >
                     </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('assign_staff');?></label>
                    
                    <div class="col-sm-8">
                        <select multiple="multiple" name="assigned_staff_ids[]" class="form-control multi-select">
                            
                        <?php 
                                $staffs     =   $this->db->get('staff')->result_array();
                                foreach ($staffs as $row):
                                ?>
                                <option value="<?php echo $row['staff_id'];?>"><?php echo $row['name'];?></option>
                            <?php endforeach;?>
                    </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('task_status');?></label>
                    <div class="col-sm-7">
                      <select class="selectboxit" name="task_status">
                            <option value="1"><?php echo get_phrase('running');?></option>
                            <option value="0"><?php echo get_phrase('archived');?></option>
                    </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-7">
                        <button type="submit" class="btn btn-info" id="submit-button"><?php echo get_phrase('add_team_task'); ?></button>
                        <span id="preloader-form"></span>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {

        $(document).on('change', '#client_id', function(event) {
            var id = document.getElementById('client_id').value;

            var first_select = document.getElementById('client_id');
            var selected = first_select.options[first_select.selectedIndex].text;

            document.getElementById("task_title").value = selected;
        });
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
</script>

