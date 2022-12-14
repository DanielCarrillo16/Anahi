<div class="row" style="margin-left: 0px; margin-right: 0px;">
    <!-- SOFTWARE TITLE -->
    <div class="col-md-12 col-sm-12 clearfix" style="background-color:#ffffff; box-shadow: 0px 10px 30px 0px rgba(82,63,105,0.08); border-radius: 5px;">
        <ul class="list-inline links-list pull-left" style="padding-top:5px; padding-bottom:0px;">
            
            <!-- UNREAD MESSAGES NOTIFICATIONS -->
            <!-- Message Notifications -->
            <li class="notifications dropdown tooltip-primary" data-toggle="tooltip" data-original-title="<?php echo get_phrase('message');?>"
                data-placement="right" style="padding: 0px;">
                <?php
                $total_unread_message_number        =   0;
                $current_user                       =   $this->session->userdata('login_type').'-'.$this->session->userdata('login_user_id');

                $this->db->where('sender' , $current_user);
                $this->db->or_where('reciever' , $current_user);
                $message_threads                    =   $this->db->get('message_thread')->result_array();
                foreach($message_threads as $row) {
                    $unread_message_number          =   $this->crud_model->count_unread_message_of_thread($row['message_thread_code']);
                    $total_unread_message_number    +=  $unread_message_number;
                }
                ?>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                    <i class="entypo-mail" style="color: #ccc;"></i>
                    <?php if ($total_unread_message_number >0 ):?>
                        <span class="badge badge-danger" style="background-color: #ff700b;"><?php echo $total_unread_message_number;?></span>
                    <?php endif;?>
                </a>

                <ul class="dropdown-menu">
                    <li>
                        <ul class="dropdown-menu-list scroller">


                            <?php
                            $current_user               =   $this->session->userdata('login_type').'-'.$this->session->userdata('login_user_id');
                            $this->db->where('sender' , $current_user);
                            $this->db->or_where('reciever' , $current_user);
                            $message_threads            =   $this->db->get('message_thread')->result_array();
                            foreach($message_threads as $row):

                                // defining the user to show
                                if ($row['sender'] == $current_user)
                                    $user_to_show       =   explode('-' , $row['reciever']);
                                if ($row['reciever'] == $current_user)
                                    $user_to_show       =   explode('-' , $row['sender']);
                                $user_to_show_type      =   $user_to_show[0];
                                $user_to_show_id        =   $user_to_show[1];
                                $unread_message_number  =   $this->crud_model->count_unread_message_of_thread($row['message_thread_code']);
                                if ($unread_message_number == 0)
                                    continue;

                                // the last sent message from the opponent user
                                $this->db->order_by('timestamp' , 'desc');
                                $last_message_row       =   $this->db->get_where('message',array('message_thread_code' => $row['message_thread_code']) )->row();
                                $last_unread_message    =   $last_message_row->message;
                                $last_message_timestamp =   $last_message_row->timestamp;

                            ?>
                            <li class="active">
                                <a href="<?php echo site_url($this->session->userdata('login_type') . '/message/message_read/' . $row['message_thread_code']);?>">
                                    <span class="image pull-right">
                                        <img src="<?php echo $this->crud_model->get_image_url($user_to_show_type , $user_to_show_id);?>" height="48" class="img-circle" />
                                    </span>

                                    <span class="line">
                                        <strong>
                                            <?php echo $this->db->get_where($user_to_show_type , array($user_to_show_type.'_id' => $user_to_show_id))->row()->name;?>
                                        </strong>
                                        - <?php echo date("d M, Y" , $last_message_timestamp);?>
                                    </span>

                                    <span class="line desc small">
                                        <!-- preview of the last unread message substring -->
                                        <?php
                                            echo substr($last_unread_message , 0 , 50);
                                        ?>
                                    </span>
                                </a>
                            </li>
                            <?php endforeach;?>
                        </ul>
                    </li>

                    <li class="external">
                        <a href="<?php echo site_url($this->session->userdata('login_type') . '/message');?>">
                            <?php echo get_phrase('view_all_messages');?>
                        </a>
                    </li>
                </ul>


            </li>


            <!-- Project status // shown to admin only-->
            <?php
                if ($this->session->userdata('login_type') == 'admin'):

                $this->db->where('progress_status <' , 100);
                $this->db->where('project_status' , 1);
                $this->db->order_by('project_id' , 'desc');
                $projects   =   $this->db->get('project' )->result_array();
                ?>
                <li class="notifications dropdown tooltip-primary" data-toggle="tooltip" data-original-title="<?php echo get_phrase('running_projects');?>"
                data-placement="right" style="padding: 0px;">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                        <i class="entypo-paper-plane" style="color: #ccc;"></i>
                        <?php if (count($projects) > 0):?>
                            <span class="badge badge-info" style="background-color: #5d78ff;"><?php echo count($projects);?></span>
                        <?php endif;?>
                    </a>

                    <ul class="dropdown-menu">
                        <li class="top">
                            <p style="font-size: 14px; font-weight: 500;"><?php echo get_phrase('running_projects');?></p>
                        </li>

                        <li>
                            <ul class="dropdown-menu-list scroller">


                                <?php
                                foreach($projects as $row):
                                    $status = 'info';
                                    if ($row['progress_status'] == 100)$status = 'success';
                                    if ($row['progress_status'] < 50)$status = 'danger';
                                    ?>
                                    <li>
                                        <a href="<?php echo site_url('admin/projectroom/dashboard/' . $row['project_code']);?>">
                                            <span class="task">
                                                <span class="desc"><?php echo $row['title'];?></span>
                                                <span class="percent"><?php echo $row['progress_status'];?>%</span>
                                            </span>

                                            <span class="progress progress-striped active" role="progressbar" >
                                                <span style="width: <?php echo $row['progress_status'];?>%;"
                                                    class="progress-bar progress-bar-<?php echo $status;?>">
                                                        <span class="sr-only"><?php echo $row['progress_status'];?>% Complete</span>
                                                </span>
                                            </span>
                                        </a>
                                    </li>
                                <?php endforeach;?>
                            </ul>
                        </li>

                        <li class="external">
                            <a href="<?php echo site_url('admin/project');?>">
                                <?php echo get_phrase('view_all_projects');?>
                            </a>
                        </li>
                    </ul>
                </li>
            <?php endif;?>


             <!-- timer status shown to admin-->
            <?php
                $timer_status = $this->db->get_where('project' , array('timer_status' => 1));
                if ($this->session->userdata('login_type') == 'admin' && $timer_status->num_rows() > 0):
                    $running_timers = $timer_status->result_array();

                ?>
                <li class="notifications dropdown tooltip-primary" data-toggle="tooltip" data-original-title="<?php echo get_phrase('running_timers');?>"
                data-placement="top" style="padding: 0px;">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                        <i style="color: #ccc;" class="entypo-back-in-time"></i>
                        <?php if (count($running_timers) > 0):?>
                            <span class="badge badge-success"><?php echo count($running_timers);?></span>
                        <?php endif;?>
                    </a>

                    <ul class="dropdown-menu">
                        <li class="top">
                            <p><strong><?php echo get_phrase('timers_switched_on');?></strong></p>
                        </li>

                        <li>
                            <ul class="dropdown-menu-list scroller">
                                <?php
                                foreach($running_timers as $row):
                                ?>
                                    <li>
                                        <a href="<?php echo site_url('admin/projectroom/timesheet/' . $row['project_code']);?>">
                                            <span class="task">
                                                <span class="desc"><?php echo $row['title'];?></span>
                                                <span class="percent"><i style="font-size: 16px;" class="fa fa-clock-o fa-spin"></i></span>
                                            </span>
                                        </a>
                                    </li>
                                <?php endforeach;?>
                            </ul>
                        </li>
                    </ul>
                </li>
                <?php endif;?>
                
                </ul>
            </li>
        </ul>


        <!-- Profile Info -->
        <ul class="user-info pull-right pull-none-xsm" style="padding-top:10px; padding-bottom:0px;">
            <li class="profile-info dropdown pull-right" style="padding-bottom:0px; margin-top: -5px;"><!-- add class "pull-right" if you want to place this from right -->
                
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="margin-top: -10px;">

                    <?php if(file_exists('uploads/'.$this->session->userdata('login_type').'_image/'.$this->session->userdata('login_user_id').'.jpg')): ?>
                        <img src="<?php echo base_url('uploads/'.$this->session->userdata('login_type').'_image/'.$this->session->userdata('login_user_id').'.jpg'); ?>" alt="" class="img-circle" width="50" height="50">
                    <?php else: ?>
                        <img src="<?php echo base_url('uploads/user.jpg'); ?>" alt="" class="img-circle" width="50" height="50">
                    <?php endif; ?>
                    <?php
                        echo $this->session->userdata('name');
                    ?>
                    <p style="padding: 0px; text-align: left; margin-left: 60px; margin-top: -16px;"><?php echo $this->session->userdata('login_type');?></p>
                </a>
                
                <ul class="dropdown-menu">
                    <li>
                        <a href="<?php echo site_url($this->session->userdata('login_type') . '/manage_profile');?>">
                            <i class="entypo-pencil"></i>
                            <span><?php echo get_phrase('edit_profile');?></span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo site_url($this->session->userdata('login_type') . '/manage_profile');?>">
                            <i class="entypo-key"></i>
                            <span><?php echo get_phrase('change_password');?></span>
                        </a>
                    </li>
                    <!-- Reverse Caret -->
                    <li class="caret"></li>
                    <li>
                        <a href="<?php echo site_url('login/logout');?>">
                            <i class="entypo-logout"></i>
                            <span><?php echo get_phrase('logout');?></span>
                        </a>
                    </li>
                </ul>
            </li>
        
        </ul>

        
    </div>

</div>

<hr style="margin-top:0px;" />

<script type="text/javascript">


            </script>
