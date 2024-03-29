<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Crud_model extends CI_Model
{

    function __construct()
    {
        parent::__construct();
    }

    function getvalues($key)
    {
        $number_of_rows = $this->db->get_where('settings', array(
            'type' => $key
        ))->num_rows();
        if ($number_of_rows > 0) {
            $query = $this->db->get_where('settings', array(
                'type' => $key
            ))->row_array();
            return json_decode($query['description']);
        } else {
            return '';
        }
    }
    function addvalues($data)
    {
        $this->db->insert('settings', $data);
    }
    function updatevalues($key, $data)
    {
        $this->db->update('settings', $data, array(
            'type' => $key
        ));
    }
    function get_type_name_by_id($type, $type_id = '', $field = 'name')
    {
        $this->db->where($type . '_id', $type_id);
        $query  = $this->db->get($type);
        $result = $query->result_array();
        foreach ($result as $row)
            return $row[$field];
        //return    $this->db->get_where($type,array($type.'_id'=>$type_id))->row()->$field;
    }

    function curl_request($code = ''){

        $product_code = $code;

        $personal_token = "FkA9UyDiQT0YiKwYLK3ghyFNRVV9SeUn";
        $url = "https://api.envato.com/v3/market/author/sale?code=" . $product_code;
        $curl = curl_init($url);

        //setting the header for the rest of the api
        $bearer   = 'bearer ' . $personal_token;
        $header   = array();
        $header[] = 'Content-length: 0';
        $header[] = 'Content-type: application/json; charset=utf-8';
        $header[] = 'Authorization: ' . $bearer;

        $verify_url = 'https://api.envato.com/v1/market/private/user/verify-purchase:' . $product_code . '.json';
        $ch_verify = curl_init($verify_url . '?code=' . $product_code);

        curl_setopt($ch_verify, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch_verify, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch_verify, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch_verify, CURLOPT_CONNECTTIMEOUT, 5);
        curl_setopt($ch_verify, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13');

        $cinit_verify_data = curl_exec($ch_verify);
        curl_close($ch_verify);

        $response = json_decode($cinit_verify_data, true);

        if (count($response['verify-purchase']) > 0) {
            return true;
        } else {
            return false;
        }
    }

    ////////private message//////
    ////////private message//////
    function send_new_private_message()
    {

        $message     = $this->input->post('message');
        $timestamp   = strtotime(date("Y-m-d H:i:s"));
        $sender_type = $this->session->userdata('login_type');
        if ($this->input->post('receiver') != "") {
            $data['receiver'] = $this->input->post('receiver');

            $reciever = $this->input->post('receiver');

            $sender = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');

            //check if the thread between those 2 users exists, if not create new thread
            $num1 = $this->db->get_where('message_thread', array(
                'sender' => $sender,
                'reciever' => $reciever
            ))->num_rows();
            $num2 = $this->db->get_where('message_thread', array(
                'sender' => $reciever,
                'reciever' => $sender
            ))->num_rows();

            if ($num1 == 0 && $num2 == 0) {
                $message_thread_code                        = substr(md5(rand(100000000, 20000000000)), 0, 15);
                $data_message_thread['message_thread_code'] = $message_thread_code;
                $data_message_thread['sender']              = $sender;
                $data_message_thread['reciever']            = $reciever;
                $this->db->insert('message_thread', $data_message_thread);
            }
            if ($num1 > 0)
                $message_thread_code = $this->db->get_where('message_thread', array(
                    'sender' => $sender,
                    'reciever' => $reciever
                ))->row()->message_thread_code;
            if ($num2 > 0)
                $message_thread_code = $this->db->get_where('message_thread', array(
                    'sender' => $reciever,
                    'reciever' => $sender
                ))->row()->message_thread_code;


            $data_message['message_thread_code'] = $message_thread_code;
            $data_message['message']             = $message;
            $data_message['sender']              = $sender;
            $data_message['timestamp']           = $timestamp;
            $this->db->insert('message', $data_message);
        }
        // notify email to email reciever
        $this->email_model->notify_email('new_message_notification', $this->db->insert_id());

        return $message_thread_code;
    }
    function send_reply_message($message_thread_code)
    {
        $message   = $this->input->post('message');
        $timestamp = strtotime(date("Y-m-d H:i:s"));
        $sender    = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');


        $data_message['message_thread_code'] = $message_thread_code;
        $data_message['message']             = $message;
        $data_message['sender']              = $sender;
        $data_message['timestamp']           = $timestamp;
        $this->db->insert('message', $data_message);

        // notify email to email reciever
        $this->email_model->notify_email('new_message_notification', $this->db->insert_id());
    }

    function mark_thread_messages_read($message_thread_code)
    {
        // mark read only the oponnent messages of this thread, not currently logged in user's sent messages
        $current_user = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');
        $this->db->where('sender !=', $current_user);
        $this->db->where('message_thread_code', $message_thread_code);
        $this->db->update('message', array(
            'read_status' => 1
        ));
    }

    function count_unread_message_of_thread($message_thread_code)
    {
        $unread_message_counter = 0;
        $current_user           = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');
        $messages               = $this->db->get_where('message', array(
            'message_thread_code' => $message_thread_code
        ))->result_array();
        foreach ($messages as $row) {
            if ($row['sender'] != $current_user && $row['read_status'] == '0')
                $unread_message_counter++;
        }
        return $unread_message_counter;
    }

    ////////support ticket/////
    function create_support_ticket()
    {
        $data['title']       = $this->input->post('title');
        $data['ticket_code'] = substr(md5(rand(100000000, 20000000000)), 0, 15);
        $data['status']      = 'opened';
        $data['priority']    = $this->input->post('priority');
        $data['project_id']  = $this->input->post('project_id');

        $login_type = $this->session->userdata('login_type');
        if ($login_type == 'client')
            $data['client_id'] = $this->session->userdata('login_user_id');
        else
            $data['client_id'] = $this->input->post('client_id');

        $data['timestamp'] = date("d M,Y");

        $this->db->insert('ticket', $data);

        // email notification check
        $this->email_model->notify_email('new_support_ticket_notify_admin', $data['ticket_code']);

        //creating ticket message

        $data2['ticket_code'] = $data['ticket_code'];
        $data2['message']     = $this->input->post('description');
        $data2['timestamp']   = date("d M,Y");
        $data2['sender_type'] = $this->session->userdata('login_type');
        $data2['sender_id']   = $this->session->userdata('login_user_id');
        if ($_FILES['file']['name'] != '')
            $data2['file'] = $_FILES['file']['name'];

        $this->db->insert('ticket_message', $data2);
        move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/ticket_file/' . $_FILES['file']['name']);
    }

    function delete_support_ticket($ticket_code)
    {
        $this->db->where('ticket_code', $ticket_code);
        $this->db->delete('ticket');
    }

    function post_ticket_reply($ticket_code)
    {
        $data['ticket_code'] = $ticket_code;
        $data['message']     = $this->input->post('message');
        $data['timestamp']   = date("d M,Y");
        $data['sender_type'] = $this->session->userdata('login_type');
        $data['sender_id']   = $this->session->userdata('login_user_id');

        if (isset($_FILES['file']['name']))
            $data['file'] = $_FILES['file']['name'];

        $this->db->insert('ticket_message', $data);

        if (isset($_FILES['file']['name'])){
            move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/ticket_file/' . $_FILES['file']['name']);
        }
    }

    function support_ticket_assign_staff($ticket_code)
    {
        $data['assigned_staff_id'] = $this->input->post('staff_id');
        $this->db->where('ticket_code', $ticket_code);
        $this->db->update('ticket', $data);

        // email notification check
        if ($this->input->post('notify_check') == 'yes')
            $this->email_model->notify_email('support_ticket_assign_staff', $ticket_code, $data['assigned_staff_id']);
    }

    function support_ticket_update_status($ticket_code)
    {
        $data['status'] = $this->input->post('status');
        $this->db->where('ticket_code', $ticket_code);
        $this->db->update('ticket', $data);
    }
    function create_support_canned_message()
    {
        $data['title']       = $this->input->post('title');
        $data['description'] = $this->input->post('description');
        $this->db->insert('support_canned_message', $data);
        return $this->db->insert_id();
    }
    function update_support_canned_message($support_canned_message_id = '')
    {
        $data['title']       = $this->input->post('title');
        $data['description'] = $this->input->post('description');
        $this->db->where('support_canned_message_id', $support_canned_message_id);
        $this->db->update('support_canned_message', $data);
    }
    ////////note/////////
    function create_note()
    {
        $data['user_type']        = $this->session->userdata('login_type');
        $data['user_id']          = $this->session->userdata('login_user_id');
        $data['timestamp_create'] = strtotime(date("d-m-Y H:i:s"));
        $this->db->insert('note', $data);

        echo $this->db->insert_id();
    }

    function save_note($note_id = '')
    {

        $data['title']                 = $this->input->post('title');
        $data['note']                  = $this->input->post('note');
        $data['user_type']             = $this->session->userdata('login_type');
        $data['user_id']               = $this->session->userdata('login_user_id');
        $data['timestamp_last_update'] = strtotime(date("d-m-Y H:i:s"));
        $this->db->where('note_id', $note_id);
        $this->db->update('note', $data);
    }

    ////////note/////////
    function delete_note($note_id = '')
    {
        $this->db->where('note_id', $note_id);
        $this->db->delete('note');

        // if note table becmoe blank, create a new note
        $this->db->where('user_type', $this->session->userdata('login_type'));
        $this->db->where('user_id', $this->session->userdata('login_user_id'));
        $this->db->from('note');
        $total_notes_of_current_user = $this->db->count_all_results();
        if ($total_notes_of_current_user == 0) {
            $this->create_note();
        }
    }

    ////////invoices/////////////
    function create_invoice()
    {
        $data['title']              = $this->input->post('title');
        $data['invoice_number']     = $this->input->post('invoice_number');
        $data['client_id']          = $this->input->post('client_id');
        $data['project_id']         = $this->input->post('project_id');
        $data['creation_timestamp'] = $this->input->post('creation_timestamp');
        $data['due_timestamp']      = $this->input->post('due_timestamp');
        $data['vat_percentage']     = $this->input->post('vat_percentage');
        $data['discount_amount']    = $this->input->post('discount_amount');
        $data['status']             = $this->input->post('status');

        $invoice_entries   = array();
        $descriptions      = $this->input->post('entry_description');
        $amounts           = $this->input->post('entry_amount');
        $number_of_entries = sizeof($descriptions);
        for ($i = 0; $i < $number_of_entries; $i++) {
            if ($descriptions[$i] != "" && $amounts[$i] != "") {
                $new_entry = array(
                    'description' => $descriptions[$i],
                    'amount' => $amounts[$i]
                );
                array_push($invoice_entries, $new_entry);
            }
        }
        $data['invoice_entries'] = json_encode($invoice_entries);

        $this->db->insert('invoice', $data);
    }

    function update_invoice($invoice_id)
    {
        $data['title']              = $this->input->post('title');
        $data['invoice_number']     = $this->input->post('invoice_number');
        $data['client_id']          = $this->input->post('client_id');
        $data['project_id']         = $this->input->post('project_id');
        $data['creation_timestamp'] = $this->input->post('creation_timestamp');
        $data['due_timestamp']      = $this->input->post('due_timestamp');
        $data['vat_percentage']     = $this->input->post('vat_percentage');
        $data['discount_amount']    = $this->input->post('discount_amount');
        $data['status']             = $this->input->post('status');

        $invoice_entries   = array();
        $descriptions      = $this->input->post('entry_description');
        $amounts           = $this->input->post('entry_amount');
        $number_of_entries = sizeof($descriptions);
        for ($i = 0; $i < $number_of_entries; $i++) {
            if ($descriptions[$i] != "" && $amounts[$i] != "") {
                $new_entry = array(
                    'description' => $descriptions[$i],
                    'amount' => $amounts[$i]
                );
                array_push($invoice_entries, $new_entry);
            }
        }
        $data['invoice_entries'] = json_encode($invoice_entries);

        $this->db->where('invoice_id', $invoice_id);
        $this->db->update('invoice', $data);
    }

    function delete_invoice($invoice_id)
    {
        $this->db->where('invoice_id', $invoice_id);
        $this->db->delete('invoice');
    }

    function calculate_invoice_total_amount($invoice_number)
    {
        $total_amount = 0;
        $invoice      = $this->db->get_where('invoice', array(
            'invoice_number' => $invoice_number
        ))->result_array();
        foreach ($invoice as $row) {
            $invoice_entries = json_decode($row['invoice_entries']);
            foreach ($invoice_entries as $invoice_entry)
                $total_amount += $invoice_entry->amount;

            $vat_amount  = $total_amount * $row['vat_percentage'] / 100;
            $grand_total = $total_amount + $vat_amount - $row['discount_amount'];
        }

        return $grand_total;
    }

    ////////projects/////////////
    function create_project()
    {
        $data['title']           = $this->input->post('title');
        $data['project_code']    = substr(md5(rand(100000000, 200000000)), 0, 10);
        $data['description']     = $this->input->post('description');
        // $data['project_category_id'] = $this->input->post('project_category_id');
        $data['budget']          = $this->input->post('budget');
        $data['timestamp_start'] = $this->input->post('timestamp_start');
        $data['timestamp_end']   = $this->input->post('timestamp_end');
        $data['demo_url']        = $this->input->post('demo_url');
        $data['progress_status'] = $this->input->post('progress_status');
        $data['client_id']       = $this->input->post('client_id');
        $data['influencer_id']       = $this->input->post('influencer_id');
        $data['company_id']      = $this->input->post('company_id');
        $data['project_status']  = 1;
        $data['staffs']          = '';
        if ($this->input->post('staffs') != "")
            foreach ($this->input->post('staffs') as $row)
                $data['staffs'] .= $row . ',';
        if ($this->input->post('servicios') != "")
            foreach ($this->input->post('servicios') as $row)
                $data['servicios'] .= $row . ',';

        $this->db->insert('project', $data);
        $project_code = $this->db->get_where('project', array(
            'project_id' => $this->db->insert_id()
        ))->row()->project_code;

        // email notification check
        if ($this->input->post('notify_check') == 'yes')
            $this->email_model->notify_email('new_project_opening', $project_code);

        return $project_code;
    }

    function update_project($project_code)
    {
        $data['title']           = $this->input->post('title');
        $data['description']     = $this->input->post('description');
        // $data['project_category_id'] = $this->input->post('project_category_id');
        $data['budget']          = $this->input->post('budget');
        $data['timestamp_start'] = $this->input->post('timestamp_start');
        $data['timestamp_end']   = $this->input->post('timestamp_end');
        $data['demo_url']        = $this->input->post('demo_url');
        $data['project_status']  = $this->input->post('project_status');
        $data['progress_status'] = $this->input->post('progress_status');
        $data['client_id']       = $this->input->post('client_id');
        $data['influencer_id']       = $this->input->post('influencer_id');
        $data['company_id']      = $this->input->post('company_id');
        $data['staffs']          = '';
        if ($this->input->post('staffs') != "")
            foreach ($this->input->post('staffs') as $row)
                $data['staffs'] .= $row . ',';

        if ($this->input->post('servicios') != "")
            foreach ($this->input->post('servicios') as $row)
                $data['servicios'] .= $row . ',';

        $this->db->where('project_code', $project_code);
        $this->db->update('project', $data);
    }

    function get_amount_service($id)
    {
        $this->db->select('*');
        $this->db->from('servicios');
        $this->db->where('servicios_id', $id);
        $amount = $this->db->get();

        return $amount;
    }

    function get_clients()
    {
        $this->db->select('*');
        $this->db->from('client');
        $clients = $this->db->get();

        return $clients;
    }

    function get_staff()
    {
        $this->db->select('*');
        $this->db->from('staff');
        $staff = $this->db->get();

        return $staff;
    }

    function get_clients_by_id($id)
    {
        $this->db->select('*');
        $this->db->from('client');
        $this->db->where('client_id', $id);
        $client = $this->db->get();

        return $client;
    }

    function update_status_message($team_task_id){
        $data['send_message'] = "1";

        $this->db->where('team_task_id', $team_task_id);
        $this->db->update('team_task', $data);

        return true;
    }

    function get_team_tasks()
    {
        $this->db->select('*');
        $this->db->from('team_task');
        $tasks = $this->db->get();

        return $tasks;
    }

    function get_all_notices()
    {
        $this->db->select('*');
        $this->db->from('notice');
        $notices = $this->db->get();

        return $notices;
    }

    function create_db_log($log){
        $data['description'] = $log;
        $data['date'] = date("Y-m-d H:i:s");

        $this->db->insert('logs', $data);
    }

    function delete_project($project_code)
    {
        $project_milestone_id = $this->db->get_where('project_milestone', array(
            'project_code' => $project_code,
            'status' => 0
        ))->row()->project_milestone_id;
        $this->db->where('project_milestone_id', $project_milestone_id);
        $this->db->delete('project_milestone');
        $this->db->where('project_code', $project_code);
        $this->db->delete('project');
    }

    function create_project_task($project_code = '')
    {
        $data['title']           = $this->input->post('name');
        $data['description']     = $this->input->post('description');
        $data['staff_id']        = $this->input->post('staff_id');
        $data['complete_status'] = $this->input->post('complete_status');
        $data['timestamp_start'] = strtotime($this->input->post('timestamp_start'));
        $data['timestamp_end']   = strtotime($this->input->post('timestamp_end'));
        $data['project_id']      = $this->db->get_where('project', array(
            'project_code' => $project_code
        ))->row()->project_id;
        $data['task_color']      = $this->input->post('task_color');

        $this->db->insert('project_task', $data);
    }

    function update_project_task($project_task_id)
    {
        $data['title']           = $this->input->post('name');
        $data['description']     = $this->input->post('description');
        $data['staff_id']        = $this->input->post('staff_id');
        $data['complete_status'] = $this->input->post('complete_status');
        $data['timestamp_start'] = strtotime($this->input->post('timestamp_start'));
        $data['timestamp_end']   = strtotime($this->input->post('timestamp_end'));
        $data['task_color']      = $this->input->post('task_color');

        $this->db->where('project_task_id', $project_task_id);
        $this->db->update('project_task', $data);
    }

    function create_project_message($project_code = '')
    {
        $data['message']    = $this->input->post('message');
        $data['project_id'] = $this->db->get_where('project', array(
            'project_code' => $project_code
        ))->row()->project_id;
        $data['date']       = date("d M Y");
        $data['user_type']  = $this->session->userdata('login_type');
        $data['user_id']    = $this->session->userdata('login_user_id');
        if ($_FILES['userfile']['name'] != '')
            $data['message_file_name'] = $_FILES['userfile']['name'];
        $this->db->insert('project_message', $data);
        if ($_FILES['userfile']['name'] != ''){
            move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/project_message_file/' . $_FILES['userfile']['name']);
        }
    }

    function delete_project_task($project_task_id = '')
    {
        $this->db->where('project_task_id', $project_task_id);
        $this->db->delete('project_task');
    }

    function upload_project_file($project_code = '')
    {
        $data['description'] = $this->input->post('description');
        $data['project_id']  = $this->db->get_where('project', array(
            'project_code' => $project_code
        ))->row()->project_id;

        $data['timestamp_upload'] = strtotime(date("d M,Y"));
        $data['uploader_type']    = $this->session->userdata('login_type');
        $data['uploader_id']      = $this->session->userdata('login_user_id');

        // upload the files
        $files = $_FILES['userfile'];
        $this->load->library('upload');
        $config['upload_path']          = 'uploads/project_file/';
        $config['allowed_types']        = '*';
        $_FILES['userfile']['name']     = $files['name'];
        $_FILES['userfile']['type']     = $files['type'];
        $_FILES['userfile']['tmp_name'] = $files['tmp_name'];
        $_FILES['userfile']['size']     = $files['size'];
        $this->upload->initialize($config);
        $this->upload->do_upload('userfile');
        $file_name         = $this->upload->data();
        $name              = $file_name['file_name'];
        $data['name']      = $name;
        $ext               = end((explode(".", $name)));
        $data['file_type'] = $ext;
        $this->db->insert('project_file', $data);

        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/project_file/' . $_FILES['userfile']['name']);
    }

    function dropzone_upload($project_code = '')
    {
        ini_set("memory_limit", "-1");
        $data['timestamp_upload'] = strtotime(date("d M,Y"));
        $data['uploader_type']    = $this->session->userdata('login_type');
        $data['uploader_id']      = $this->session->userdata('login_user_id');

        // upload the files

        for ($i = 0; $i < count($_FILES['userfile']['name']); $i++) {
            $data['name'] = $_FILES['userfile']['name'][$i];
            if ($data['name'] != "") {
                $files = $_FILES['userfile'][$i];
                $this->load->library('upload');
                $config['upload_path']            = 'uploads/project_file/';
                $config['allowed_types']          = '*';
                $_FILES['userfile[]']['name']     = $files['name'][$i];
                $_FILES['userfile[]']['type']     = $files['type'][$i];
                $_FILES['userfile[]']['tmp_name'] = $files['tmp_name'][$i];
                $_FILES['userfile[]']['size']     = $files['size'][$i];
                $this->upload->initialize($config);
                //$this->upload->do_upload('userfile');
                $name               = $_FILES['userfile']['name'][$i];
                $data['name']       = $name;
                $ext                = end((explode(".", $name)));
                $data['file_type']  = $ext;
                $data['project_id'] = $this->db->get_where('project', array(
                    'project_code' => $project_code
                ))->row()->project_id;
                $this->db->insert('project_file', $data);
                move_uploaded_file($_FILES['userfile']['tmp_name'][$i], 'uploads/project_file/' . $_FILES['userfile']['name'][$i]);
            }
        }
        $this->db->insert('project_file', $data);
    }

    function dropbox_upload($project_code = '')
    {

        $dropbox_file_link = $this->input->post('dropbox_file_link');
        $dropbox_file_name = $this->input->post('dropbox_file_name');

        $dropbox_file_url = explode('/', $dropbox_file_link);
        $dropbox_file_id  = $dropbox_file_url[4];

        $file_download_url     = 'https://dl.dropboxusercontent.com/s/' . $dropbox_file_id . '/' . $dropbox_file_name;
        $file_content          = file_get_contents(str_replace(" ", "%20", $file_download_url));
        $file_saving_directory = 'uploads/project_file/';
        $handle                = fopen($file_saving_directory . $dropbox_file_name, "w");
        fwrite($handle, $file_content);
        fclose($handle);

        $data['name']       = $dropbox_file_name;
        $data['project_id'] = $this->db->get_where('project', array(
            'project_code' => $project_code
        ))->row()->project_id;
        $this->db->insert('project_file', $data);
    }

    function download_project_file($project_file_id = '')
    {
        $file_name = $this->db->get_where('project_file', array(
            'project_file_id' => $project_file_id
        ))->row()->name;
        $this->load->helper('download');
        $data = file_get_contents("uploads/project_file/" . $file_name);
        $name = $file_name;

        force_download($name, $data);
    }

    function download_project_message_file($project_message_id = '')
    {
        $file_name = $this->db->get_where('project_message', array(
            'project_message_id' => $project_message_id
        ))->row()->message_file_name;
        $this->load->helper('download');
        $data = file_get_contents("uploads/project_message_file/" . $file_name);
        $name = $file_name;

        force_download($name, $data);
    }

    function delete_project_file($project_file_id = '')
    {

        $file_name = $this->db->get_where('project_file', array(
            'project_file_id' => $project_file_id
        ))->row()->name;
        $this->db->where('project_file_id', $project_file_id);
        $this->db->delete('project_file');

        unlink("uploads/project_file/" . $file_name);
    }

    //project progreso model
    function upload_project_progreso($project_code = '')
    {
        $data['description'] = $this->input->post('description');
        $data['project_id']  = $this->db->get_where('project', array(
            'project_code' => $project_code
        ))->row()->project_id;

        $data['timestamp_upload'] = strtotime(date("d M,Y"));
        $data['uploader_type']    = $this->session->userdata('login_type');
        $data['uploader_id']      = $this->session->userdata('login_user_id');

        // upload the files
        $files = $_FILES['userfile'];
        $this->load->library('upload');
        $config['upload_path']          = 'uploads/project_progreso/';
        $config['allowed_types']        = '*';
        $_FILES['userfile']['name']     = $files['name'];
        $_FILES['userfile']['type']     = $files['type'];
        $_FILES['userfile']['tmp_name'] = $files['tmp_name'];
        $_FILES['userfile']['size']     = $files['size'];
        $this->upload->initialize($config);
        $this->upload->do_upload('userfile');
        $file_name         = $this->upload->data();
        $name              = $file_name['file_name'];
        $data['name']      = $name;
        $ext               = end((explode(".", $name)));
        $data['file_type'] = $ext;
        $this->db->insert('project_progreso', $data);

        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/project_progreso/' . $_FILES['userfile']['name']);
    }

    function dropzone_upload_progreso($project_code = '')
    {
        ini_set("memory_limit", "-1");
        $data['timestamp_upload'] = strtotime(date("d M,Y"));
        $data['uploader_type']    = $this->session->userdata('login_type');
        $data['uploader_id']      = $this->session->userdata('login_user_id');

        // upload the files

        for ($i = 0; $i < count($_FILES['userfile']['name']); $i++) {
            $data['name'] = $_FILES['userfile']['name'][$i];
            if ($data['name'] != "") {
                $files = $_FILES['userfile'][$i];
                $this->load->library('upload');
                $config['upload_path']            = 'uploads/project_progreso/';
                $config['allowed_types']          = '*';
                $_FILES['userfile[]']['name']     = $files['name'][$i];
                $_FILES['userfile[]']['type']     = $files['type'][$i];
                $_FILES['userfile[]']['tmp_name'] = $files['tmp_name'][$i];
                $_FILES['userfile[]']['size']     = $files['size'][$i];
                $this->upload->initialize($config);
                //$this->upload->do_upload('userfile');
                $name               = $_FILES['userfile']['name'][$i];
                $data['name']       = $name;
                $ext                = end((explode(".", $name)));
                $data['file_type']  = $ext;
                $data['project_id'] = $this->db->get_where('project', array(
                    'project_code' => $project_code
                ))->row()->project_id;
                $this->db->insert('project_progreso', $data);
                move_uploaded_file($_FILES['userfile']['tmp_name'][$i], 'uploads/project_progreso/' . $_FILES['userfile']['name'][$i]);
            }
        }
        $this->db->insert('project_progreso', $data);
    }

    function dropbox_upload_progreso($project_code = '')
    {

        $dropbox_progreso_link = $this->input->post('dropbox_progreso_link');
        $dropbox_progreso_name = $this->input->post('dropbox_progreso_name');

        $dropbox_progreso_url = explode('/', $dropbox_progreso_link);
        $dropbox_progreso_id  = $dropbox_progreso_url[4];

        $file_download_url     = 'https://dl.dropboxusercontent.com/s/' . $dropbox_progreso_id . '/' . $dropbox_progreso_name;
        $file_content          = file_get_contents(str_replace(" ", "%20", $file_download_url));
        $file_saving_directory = 'uploads/project_file/';
        $handle                = fopen($file_saving_directory . $dropbox_progreso_name, "w");
        fwrite($handle, $file_content);
        fclose($handle);

        $data['name']       = $dropbox_progreso_name;
        $data['project_id'] = $this->db->get_where('project', array(
            'project_code' => $project_code
        ))->row()->project_id;
        $this->db->insert('project_progreso', $data);
    }

    function download_project_progreso($project_progreso_id = '')
    {
        $file_name = $this->db->get_where('project_progreso', array(
            'project_progreso_id' => $project_progreso_id
        ))->row()->name;
        $this->load->helper('download');
        $data = file_get_contents("uploads/project_progreso/" . $file_name);
        $name = $file_name;

        force_download($name, $data);
    }

    function delete_project_progreso($project_progreso_id = '')
    {

        $file_name = $this->db->get_where('project_progreso', array(
            'project_progreso_id' => $project_progreso_id
        ))->row()->name;
        $this->db->where('project_progreso_id', $project_progreso_id);
        $this->db->delete('project_progreso');

        unlink("uploads/project_progreso/" . $file_name);
    }

    //Project lab
    function upload_project_lab($project_code = '')
    {
        $data['description'] = $this->input->post('description');
        $data['project_id']  = $this->db->get_where('project', array(
            'project_code' => $project_code
        ))->row()->project_id;

        $data['timestamp_upload'] = strtotime(date("d M,Y"));
        $data['uploader_type']    = $this->session->userdata('login_type');
        $data['uploader_id']      = $this->session->userdata('login_user_id');

        // upload the files
        $files = $_FILES['userfile'];
        $this->load->library('upload');
        $config['upload_path']          = 'uploads/project_lab/';
        $config['allowed_types']        = '*';
        $_FILES['userfile']['name']     = $files['name'];
        $_FILES['userfile']['type']     = $files['type'];
        $_FILES['userfile']['tmp_name'] = $files['tmp_name'];
        $_FILES['userfile']['size']     = $files['size'];
        $this->upload->initialize($config);
        $this->upload->do_upload('userfile');
        $file_name         = $this->upload->data();
        $name              = $file_name['file_name'];
        $data['name']      = $name;
        $ext               = end((explode(".", $name)));
        $data['file_type'] = $ext;
        $this->db->insert('project_lab', $data);

        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/project_lab/' . $_FILES['userfile']['name']);
    }

    function dropzone_upload_lab($project_code = '')
    {
        ini_set("memory_limit", "-1");
        $data['timestamp_upload'] = strtotime(date("d M,Y"));
        $data['uploader_type']    = $this->session->userdata('login_type');
        $data['uploader_id']      = $this->session->userdata('login_user_id');

        // upload the files

        for ($i = 0; $i < count($_FILES['userfile']['name']); $i++) {
            $data['name'] = $_FILES['userfile']['name'][$i];
            if ($data['name'] != "") {
                $files = $_FILES['userfile'][$i];
                $this->load->library('upload');
                $config['upload_path']            = 'uploads/project_lab/';
                $config['allowed_types']          = '*';
                $_FILES['userfile[]']['name']     = $files['name'][$i];
                $_FILES['userfile[]']['type']     = $files['type'][$i];
                $_FILES['userfile[]']['tmp_name'] = $files['tmp_name'][$i];
                $_FILES['userfile[]']['size']     = $files['size'][$i];
                $this->upload->initialize($config);
                //$this->upload->do_upload('userfile');
                $name               = $_FILES['userfile']['name'][$i];
                $data['name']       = $name;
                $ext                = end((explode(".", $name)));
                $data['file_type']  = $ext;
                $data['project_id'] = $this->db->get_where('project', array(
                    'project_code' => $project_code
                ))->row()->project_id;
                $this->db->insert('project_lab', $data);
                move_uploaded_file($_FILES['userfile']['tmp_name'][$i], 'uploads/project_lab/' . $_FILES['userfile']['name'][$i]);
            }
        }
        $this->db->insert('project_lab', $data);
    }

    function dropbox_upload_lab($project_code = '')
    {

        $dropbox_lab_link = $this->input->post('dropbox_lab_link');
        $dropbox_lab_name = $this->input->post('dropbox_lab_name');

        $dropbox_lab_url = explode('/', $dropbox_lab_link);
        $dropbox_lab_id  = $dropbox_lab_url[4];

        $file_download_url     = 'https://dl.dropboxusercontent.com/s/' . $dropbox_lab_id . '/' . $dropbox_lab_name;
        $file_content          = file_get_contents(str_replace(" ", "%20", $file_download_url));
        $file_saving_directory = 'uploads/project_file/';
        $handle                = fopen($file_saving_directory . $dropbox_lab_name, "w");
        fwrite($handle, $file_content);
        fclose($handle);

        $data['name']       = $dropbox_lab_name;
        $data['project_id'] = $this->db->get_where('project', array(
            'project_code' => $project_code
        ))->row()->project_id;
        $this->db->insert('project_lab', $data);
    }

    function download_project_lab($project_lab_id = '')
    {
        $file_name = $this->db->get_where('project_lab', array(
            'project_lab_id' => $project_lab_id
        ))->row()->name;
        $this->load->helper('download');
        $data = file_get_contents("uploads/project_lab/" . $file_name);
        $name = $file_name;

        force_download($name, $data);
    }

    function delete_project_lab($project_lab_id = '')
    {

        $file_name = $this->db->get_where('project_lab', array(
            'project_lab_id' => $project_lab_id
        ))->row()->name;
        $this->db->where('project_lab_id', $project_lab_id);
        $this->db->delete('project_lab');

        unlink("uploads/project_lab/" . $file_name);
    }
   

    /// historia clinica


    function create_project_historia_clinica($project_code = ''){
        $data['project_code']                 = $project_code;
        $data['title']                        = $this->input->post('title');
        $data['nombre_completo']              = $this->input->post('nombre_completo');
        $data['nacimiento']                   = $this->input->post('nacimiento');
        $data['sexo']                         = $this->input->post('sexo');
        $data['talla']                        = $this->input->post('talla');
        $data['peso']                         = $this->input->post('peso');
        $data['glucosa']                      = $this->input->post('glucosa');
        $data['motivo_consulta']              = $this->input->post('motivo_consulta');
        $data['alergias']                     = $this->input->post('alergias');
        $data['farmacos_actuales']            = $this->input->post('farmacos_actuales');
        $data['alcohol']                      = $this->input->post('alcohol');
        $data['tabaco']                       = $this->input->post('tabaco');
        $data['sustancias']                   = $this->input->post('sustancias'); 
        $data['glogau']                       = $this->input->post('glogau'); 
        $data['fitz']                         = $this->input->post('fitz'); 
        $data['notas']                        = $this->input->post('notas');
        $data['assigned_staff']               = $this->input->post('assigned_staff');
        $data['timestamp']                    = strtotime(date("d M,Y"));

        //NEW DATA
        $data['num_expendiente']              = $this->input->post('numero_expediente');
        $data['creacion']                   = $this->input->post('creacion');
        $data['edad']                   = $this->input->post('edad');
        $data['telefono']                   = $this->input->post('telefono');
        $data['direccion']                   = $this->input->post('direccion');
        $data['alergias_notas']                   = $this->input->post('alergias_notas');
        $data['farmacos_actuales_notas']            = $this->input->post('farmacos_actuales_notas');
        $data['procedimientos_quirurjicos']            = $this->input->post('procedimientos_quirurjicos');
        $data['quirurjicos_fecha']            = $this->input->post('quirurjicos_fecha');
        
        
        $this->db->insert('project_historia_clinica', $data);

    }

    function update_project_historia_clinica($project_historia_clinica_id = '')
    {
        $id_botulinica_array = $this->db->get_where('project_toxina_botulinica' , array('id_historial_clinico' => $project_historia_clinica_id))->result_array();

        foreach($id_botulinica_array as $row){
            $id_botulinica = $row['project_toxina_botulinica_id'];
        }

        $data['title']                        = $this->input->post('title');
        $data['nombre_completo']              = $this->input->post('nombre_completo');
        $data['nacimiento']                   = $this->input->post('nacimiento');
        $data['sexo']                         = $this->input->post('sexo');
        $data['talla']                        = $this->input->post('talla');
        $data['peso']                         = $this->input->post('peso');
        $data['glucosa']                      = $this->input->post('glucosa');
        $data['motivo_consulta']              = $this->input->post('motivo_consulta');
        $data['alergias']                     = $this->input->post('alergias');
        $data['farmacos_actuales']            = $this->input->post('farmacos_actuales');
        $data['alcohol']                      = $this->input->post('alcohol');
        $data['tabaco']                       = $this->input->post('tabaco');
        $data['sustancias']                   = $this->input->post('sustancias'); 
        $data['glogau']                       = $this->input->post('glogau'); 
        $data['fitz']                         = $this->input->post('fitz'); 
        $data['notas']                        = $this->input->post('notas');
        $data['assigned_staff']               = $this->input->post('assigned_staff');
        $data['timestamp']                    = strtotime(date("d M,Y"));

        //NEW DATA
        $data['num_expendiente']              = $this->input->post('numero_expediente');
        $data['creacion']                   = $this->input->post('creacion');
        $data['edad']                   = $this->input->post('edad');
        $data['telefono']                   = $this->input->post('telefono');
        $data['direccion']                   = $this->input->post('direccion');
        $data['alergias_notas']                   = $this->input->post('alergias_notas');
        $data['farmacos_actuales_notas']            = $this->input->post('farmacos_actuales_notas');
        $data['procedimientos_quirurjicos']            = $this->input->post('procedimientos_quirurjicos');
        $data['quirurjicos_fecha']            = $this->input->post('quirurjicos_fecha');

        if ($_FILES['userfile']['name'] != '') {
            $data['file'] = $_FILES['userfile']['name'];
        }

        $this->db->where('project_historia_clinica_id', $project_historia_clinica_id);
        $this->db->update('project_historia_clinica', $data);
        
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/bug_file/' . $_FILES['userfile']['name']);

    }
    
        function delete_project_historia_clinica($project_historia_clinica_id = '', $project_toxina_botulinica_id='')
        {
            $this->db->where('project_historia_clinica_id', $project_historia_clinica_id);
            $this->db->delete('project_historia_clinica');
            $this->db->where('project_toxina_botulinica_id', $project_toxina_botulinica_id);
            $this->db->delete('project_toxina_botulinica');
        }
    ///

    ///Funcion para manejar los fillers
    function create_project_filler($project_code = ''){
        $data['project_code']           = $project_code;
        $data['title']                  = $this->input->post('title');
        $data['aplicacion']     	    = $this->input->post('aplicacion'); 
        $data['valoracion']     	    = $this->input->post('valoracion'); 
        $data['relleno']         	    = $this->input->post('relleno'); 
        $data['procedimiento']     	    = $this->input->post('procedimiento'); 
        $data['lote']            	    = $this->input->post('lote'); 
        $data['cantidad_producto']     	= $this->input->post('cantidad_producto'); 
        $data['propuesta']     	        = $this->input->post('propuesta'); 
        $data['user_type']              = $this->session->userdata('login_type');
        $data['user_id']                = $this->session->userdata('login_user_id');
        $data['assigned_staff']         = $this->input->post('assigned_staff');
        $data['timestamp']              = strtotime(date("d M,Y"));

        $this->db->insert('project_filler', $data);
    }

    function update_project_filler($project_filler_id = '')
    {
        $data['title']                  = $this->input->post('title');
        $data['aplicacion']     	    = $this->input->post('aplicacion'); 
        $data['valoracion']     	    = $this->input->post('valoracion'); 
        $data['relleno']         	    = $this->input->post('relleno'); 
        $data['procedimiento']     	    = $this->input->post('procedimiento'); 
        $data['lote']            	    = $this->input->post('lote'); 
        $data['cantidad_producto']     	= $this->input->post('cantidad_producto'); 
        $data['propuesta']     	        = $this->input->post('propuesta'); 
        $data['user_type']              = $this->session->userdata('login_type');
        $data['user_id']                = $this->session->userdata('login_user_id');
        $data['assigned_staff']         = $this->input->post('assigned_staff');
        if ($_FILES['userfile']['name'] != '') {
            $data['file'] = $_FILES['userfile']['name'];
        }

        $this->db->where('project_filler_id', $project_filler_id);
        $this->db->update('project_filler', $data);
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/bug_file/' . $_FILES['userfile']['name']);

    }

    function delete_project_filler($project_filler_id = '')
    {
        $this->db->where('project_filler_id', $project_filler_id);
        $this->db->delete('project_filler');
    }


        ///Funcion para manejar las toxinas botulinicas
        function create_project_toxina_botulinica($project_code = ''){
            $data['project_code']                 = $project_code;
            $data['title']                        = $this->input->post('title');
            $data['id_historial_clinico']         = $this->input->post('id_historial_clinico');
            $data['zona_frontal_cantidad']        = $this->input->post('zona_frontal_cantidad'); 
            $data['zona_corrugador_cantidad']     = $this->input->post('zona_corrugador_cantidad');
            $data['zona_proceus_cantidad']        = $this->input->post('zona_proceus_cantidad');
            $data['zona_ojo_cantidad']            = $this->input->post('zona_ojo_cantidad');
            $data['zona_subpalpebral_cantidad']   = $this->input->post('zona_subpalpebral_cantidad');
            $data['zona_nariz_cantidad']          = $this->input->post('zona_nariz_cantidad'); 
            $data['zona_boca_cantidad']           = $this->input->post('zona_boca_cantidad');
            $data['zona_masetero_cantidad']       = $this->input->post('zona_masetero_cantidad');
            $data['zona_mentoniano_cantidad']     = $this->input->post('zona_mentoniano_cantidad');
            $data['zona_otros_cantidad']          = $this->input->post('zona_otros_cantidad');
            $data['assigned_staff']               = $this->input->post('assigned_staff');
            $data['timestamp']                    = strtotime(date("d M,Y"));
    
            $this->db->insert('project_toxina_botulinica', $data);
        }
    
        function update_project_toxina_botulinica($project_toxina_botulinica_id = '')
        {
            $data['title']                        = $this->input->post('title');
            $data['id_historial_clinico']         = $this->input->post('id_historial_clinico');
            $data['zona_frontal_cantidad']        = $this->input->post('zona_frontal_cantidad'); 
            $data['zona_corrugador_cantidad']     = $this->input->post('zona_corrugador_cantidad');
            $data['zona_proceus_cantidad']        = $this->input->post('zona_proceus_cantidad');
            $data['zona_ojo_cantidad']            = $this->input->post('zona_ojo_cantidad');
            $data['zona_subpalpebral_cantidad']   = $this->input->post('zona_subpalpebral_cantidad');
            $data['zona_nariz_cantidad']          = $this->input->post('zona_nariz_cantidad'); 
            $data['zona_boca_cantidad']           = $this->input->post('zona_boca_cantidad');
            $data['zona_masetero_cantidad']       = $this->input->post('zona_masetero_cantidad');
            $data['zona_mentoniano_cantidad']     = $this->input->post('zona_mentoniano_cantidad');
            $data['zona_otros_cantidad']          = $this->input->post('zona_otros_cantidad');
            $data['assigned_staff']               = $this->input->post('assigned_staff');
            if ($_FILES['userfile']['name'] != '') {
                $data['file'] = $_FILES['userfile']['name'];
            }
    
            $this->db->where('project_toxina_botulinica_id', $project_toxina_botulinica_id);
            $this->db->update('project_toxina_botulinica', $data);
            move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/bug_file/' . $_FILES['userfile']['name']);
    
        }
    
        function delete_project_toxina_botulinica($project_toxina_botulinica_id = '')
        {
            $this->db->where('project_toxina_botulinica_id', $project_toxina_botulinica_id);
            $this->db->delete('project_toxina_botulinica');
        }

    //Nota de evolucion
    function create_project_nota_evolucion($project_code = ''){
        $data['project_code']           = $project_code;
        $data['title']                  = $this->input->post('title');
        $data['nombre_completo']        = $this->input->post('nombre_completo');
        $data['comentarios_paciente']   = $this->input->post('comentarios_paciente');
        $data['observaciones']          = $this->input->post('observaciones');
        $data['assigned_staff']         = $this->input->post('assigned_staff');
        $data['siguiente_cita']          = $this->input->post('siguiente_cita');
        $data['timestamp']              = strtotime(date("d M,Y"));

        $this->db->insert('project_nota_evolucion', $data);
    }

    function update_project_nota_evolucion($project_nota_evolucion_id = '')
    {
        $data['title']                  = $this->input->post('title');
        $data['nombre_completo']        = $this->input->post('nombre_completo');
        $data['comentarios_paciente']   = $this->input->post('comentarios_paciente');
        $data['observaciones']          = $this->input->post('observaciones');
        $data['assigned_staff']         = $this->input->post('assigned_staff');
        $data['siguiente_cita']          = $this->input->post('siguiente_cita');
        if ($_FILES['userfile']['name'] != '') {
            $data['file'] = $_FILES['userfile']['name'];
        }

        $this->db->where('project_nota_evolucion_id', $project_nota_evolucion_id);
        $this->db->update('project_nota_evolucion', $data);
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/bug_file/' . $_FILES['userfile']['name']);

    }

    function delete_project_nota_evolucion($project_nota_evolucion_id = '')
    {
        $this->db->where('project_nota_evolucion_id', $project_nota_evolucion_id);
        $this->db->delete('project_nota_evolucion');
    }

    function create_project_bug($project_code = '')
    {
        $data['project_code']   = $project_code;
        $data['title']          = $this->input->post('title');
        $data['description']    = $this->input->post('description');
        $data['status']         = $this->input->post('status');
        $data['user_type']      = $this->session->userdata('login_type');
        $data['user_id']        = $this->session->userdata('login_user_id');
        $data['assigned_staff'] = $this->input->post('assigned_staff');
        $data['timestamp']      = strtotime(date("d M,Y"));
        if ($_FILES['userfile']['name'] != '') {
            $data['file'] = $_FILES['userfile']['name'];
        }
        $this->db->insert('project_bug', $data);
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/bug_file/' . $_FILES['userfile']['name']);

    }

    function update_project_bug($project_bug_id = '')
    {
        $data['title']          = $this->input->post('title');
        $data['description']    = $this->input->post('description');
        $data['status']         = $this->input->post('status');
        $data['assigned_staff'] = $this->input->post('assigned_staff');
        if ($_FILES['userfile']['name'] != '') {
            $data['file'] = $_FILES['userfile']['name'];
        }
        $this->db->where('project_bug_id', $project_bug_id);
        $this->db->update('project_bug', $data);
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/bug_file/' . $_FILES['userfile']['name']);

    }
    function save_project_note($project_code = '')
    {
        $data['project_note'] = $this->input->post('project_note');
        $this->db->where('project_code', $project_code);
        $this->db->update('project', $data);
    }
    function delete_project_bug($project_bug_id = '')
    {
        $file_name = $this->db->get_where('project_bug', array(
            'project_bug_id' => $project_bug_id
        ))->row()->file;
        if (file_exists('uploads/bug_file/' . $file_name)) {
            unlink('uploads/bug_file/' . $file_name);
        }
        $this->db->where('project_bug_id', $project_bug_id);
        $this->db->delete('project_bug');
    }
    function update_project_timer($timer_status, $project_id)
    {
        $data['timer_status'] = $timer_status;

        //timer starting, save the timer starting moment timestamp
        if ($timer_status == 1) {
            $data['timer_starting_timestamp'] = strtotime(date("d-m-y H:i:s"));
        }

        //timer stopping, creating timesheet entry to project_timesheet table
        else if ($timer_status == 0) {
            $current_moment_timestamp        = strtotime(date("d-m-y H:i:s"));
            $timer_starting_moment_timestamp = $this->db->get_where('project', array(
                'project_id' => $project_id
            ))->row()->timer_starting_timestamp;

            $data2['start_timestamp'] = $timer_starting_moment_timestamp;
            $data2['end_timestamp']   = $current_moment_timestamp;
            $data2['project_id']      = $project_id;
            $this->db->insert('project_timesheet', $data2);

            $second_to_append = $current_moment_timestamp - $timer_starting_moment_timestamp;
            $this->db->set('total_time_spent', 'total_time_spent+' . $second_to_append, FALSE);
        }

        $this->db->where('project_id', $project_id);
        $this->db->update('project', $data);
    }

    function delete_project_timer($project_timesheet_id = '')
    {
        $this->db->where('project_timesheet_id', $project_timesheet_id);
        $this->db->delete('project_timesheet');
    }

    function add_project_milestone($project_code = '')
    {
        $data['project_code'] = $project_code;
        $data['title']        = $this->input->post('title_input');
        $data['id_servicio']     = $this->input->post('title_service');
        $data['amount']       = $this->input->post('amount');
        $data['timestamp']    = strtotime($this->input->post('timestamp'));
        $data['status']       = $this->input->post('status');
        $data['note']         = $this->input->post('note');
        $products	=	json_decode($this->input->post('realProducts'));
        $data['client_id']    = $this->db->get_where('project', array(
            'project_code' => $project_code
        ))->row()->client_id;
        $data['company_id']   = $this->db->get_where('project', array(
            'project_code' => $project_code
        ))->row()->company_id;
        $idx =$this->input->post('title_service');
        
        if($data['status'] == 1){
            foreach($products as $producto){
                if($producto->id_service == $this->input->post('title_service'))
                {
                    $this->db->where('product_id', $producto->id_product);
                    $dataP['existencia'] = $producto->quantity;
                    $this->db->update('product', $dataP);
                }
            }
        }
        $this->db->insert('project_milestone', $data);
    }

    function edit_project_milestone($project_milestone_id = '')
    {
        $data['title']     = $this->input->post('title_input');
        $data['id_servicio']     = $this->input->post('title_service');
        $data['amount']    = $this->input->post('amount');
        $data['timestamp'] = strtotime($this->input->post('timestamp'));
        $data['status']    = $this->input->post('status');
        $data['note']      = $this->input->post('note');
        $products	=	json_decode($this->input->post('realProducts'));

        if($data['status'] == 1){
            foreach($products as $producto){
                if($producto->id_service == $this->input->post('title_service'))
                {
                    $this->db->where('product_id', $producto->id_product);
                    $dataP['existencia'] = $producto->quantity;
                    $this->db->update('product', $dataP);
                }
            }
        }

        $this->db->where('project_milestone_id', $project_milestone_id);
        $this->db->update('project_milestone', $data);

    }

    function delete_project_milestone($project_milestone_id = '')
    {
        $this->db->where('project_milestone_id', $project_milestone_id);
        $this->db->delete('project_milestone');
    }

    function take_project_milestone_manual_payment($project_milestone_id = '')
    {
        $data['project_code']   = $this->db->get_where('project_milestone', array(
            'project_milestone_id' => $project_milestone_id
        ))->row()->project_code;
        $data['type']           = 'income';
        $data['amount']         = $this->input->post('amount');
        $data['title']          = $this->db->get_where('project_milestone', array(
            'project_milestone_id' => $project_milestone_id
        ))->row()->title;
        $data['description']    = $this->input->post('description');
        $data['payment_method'] = $this->input->post('payment_method');
        $data['timestamp']      = strtotime(date("d-m-Y H:i:s"));
        $data['milestone_id']   = $project_milestone_id;
        $data['client_id']      = $this->db->get_where('project_milestone', array(
            'project_milestone_id' => $project_milestone_id
        ))->row()->client_id;
        
        $data['influencer_id']     = $this->db->get_where('project_milestone', array(
            'project_milestone_id' => $project_milestone_id
        ))->row()->company_id;
        $this->db->insert('payment', $data);

        $this->db->where('project_milestone_id', $project_milestone_id);
        $this->db->update('project_milestone', array(
            'status' => 1
        ));
        $this->email_model->notify_email('payment_completion_notification', $data['project_code'], $project_milestone_id);
    }
    function create_project_expense($project_code = '')
    {
        $data['project_code'] = $project_code;
        $data['title']        = $this->input->post('title');
        $data['amount']       = $this->input->post('amount');
        $data['type']         = 'expense';
        $data['timestamp']    = strtotime(date("d M,Y"));
        $this->db->insert('payment', $data);
    }

    function update_project_expense($payment_id = '')
    {
        $data['title']  = $this->input->post('title');
        $data['amount'] = $this->input->post('amount');
        $this->db->where('payment_id', $payment_id);
        $this->db->update('payment', $data);
    }
    function delete_project_expense($payment_id = '')
    {
        $this->db->where('payment_id', $payment_id);
        $this->db->delete('payment');
    }
    ////////project_categories/////////////
    function create_project_category()
    {
        $data['name']        = $this->input->post('name');
        $data['description'] = $this->input->post('description');
        $this->db->insert('project_category', $data);
    }

    function update_project_category($project_category_id)
    {
        $data['name']        = $this->input->post('name');
        $data['description'] = $this->input->post('description');

        $this->db->where('project_category_id', $project_category_id);
        $this->db->update('project_category', $data);
    }

    function delete_project_category($project_category_id)
    {
        $this->db->where('project_category_id', $project_category_id);
        $this->db->delete('project_category');
    }

    function create_project_quote()
    {

        $data['title']       = $this->input->post('name');
        $data['description'] = $this->input->post('description');
        $data['user_id']     = $this->session->userdata('login_user_id');
        $data['timestamp']   = strtotime($this->input->post('timestamp'));
        $data['amount']      = $this->input->post('amount');

        $this->db->insert('quote', $data);
        $quote_id           = $this->db->insert_id();
        $data2['quote_id']  = $quote_id;
        $data2['message']   = $this->input->post('description');
        $data2['timestamp'] = date("d M,Y");
        $data2['user_type'] = $this->session->userdata('login_type');
        $data2['user_id']   = $this->session->userdata('login_user_id');
        if (isset($_FILES['userfile']['name'])){
            $data2['file'] = $_FILES['userfile']['name'];
        }
        $this->db->insert('quote_message', $data2);
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/quote_file/' . $_FILES['userfile']['name']);
    }

    function create_project_quote_public()
    {
        $data['name']        = $this->input->post('name');
        $data['email']       = $this->input->post('email');
        $data['phone']       = $this->input->post('phone');
        $data['title']       = $this->input->post('title');
        $data['description'] = $this->input->post('description');
        $data['timestamp']   = strtotime($this->input->post('timestamp'));
        $data['amount']      = $this->input->post('amount');
        $this->db->insert('quote', $data);

    }
    function post_quote_reply($quote_id)
    {
        $data['quote_id']  = $quote_id;
        $data['message']   = $this->input->post('message');
        $data['timestamp'] = date("d M,Y");
        $data['user_type'] = $this->session->userdata('login_type');
        $data['user_id']   = $this->session->userdata('login_user_id');

        if (isset($_FILES['file']['name']))
            $data['file'] = $_FILES['file']['name'];

        $this->db->insert('quote_message', $data);

        if (isset($_FILES['file']['name'])){
            move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/quote_file/' . $_FILES['file']['name']);
        }
    }

    function archive_project_quote($quote_id)
    {
        $this->db->set('status', 1);
        $this->db->where('quote_id', $quote_id);
        $this->db->update('quote');
    }

    function unarchive_project_quote($quote_id)
    {
        $this->db->set('status', 0);
        $this->db->where('quote_id', $quote_id);
        $this->db->update('quote');
    }
    function delete_project_quote($quote_id)
    {
        $this->db->where('quote_id', $quote_id);
        $this->db->delete('quote');
    }
    ///// ACCOUNTING EXPENSE MANAGEMENT /////

    function expense_add()
    {
        $data['title']               = $this->input->post('title');
        $data['description']         = $this->input->post('description');
        $data['expense_category_id'] = $this->input->post('expense_category_id');
        $data['amount']              = $this->input->post('amount');
        $data['timestamp']           = strtotime($this->input->post('timestamp'));
        $data['type']                = 'expense';
        $this->db->insert('payment', $data);
    }

    function expense_edit($payment_id = '')
    {
        $data['title']               = $this->input->post('title');
        $data['description']         = $this->input->post('description');
        $data['expense_category_id'] = $this->input->post('expense_category_id');
        $data['amount']              = $this->input->post('amount');
        $data['timestamp']           = strtotime($this->input->post('timestamp'));
        $this->db->where('payment_id', $payment_id);
        $this->db->update('payment', $data);
    }

    function expense_delete($payment_id = '')
    {
        $this->db->where('payment_id', $payment_id);
        $this->db->delete('payment');
    }

    function expense_category_add()
    {
        $data['title']       = $this->input->post('title');
        $data['description'] = $this->input->post('description');
        $this->db->insert('expense_category', $data);
    }

    function expense_category_edit($expense_category_id = '')
    {
        $data['title']       = $this->input->post('title');
        $data['description'] = $this->input->post('description');
        $this->db->where('expense_category_id', $expense_category_id);
        $this->db->update('expense_category', $data);
    }

    function expense_category_delete($expense_category_id = '')
    {
        $this->db->where('expense_category_id', $expense_category_id);
        $this->db->delete('expense_category');
    }

    /////// TEAM TASK /////////
    function add_new_team_task()
    {
        $data['task_title']         = "Cita de: ".$this->input->post('task_title');
        $data['creation_timestamp'] = strtotime($this->input->post('creation_timestamp'));
        $data['due_timestamp']      = strtotime($this->input->post('due_timestamp'));
        $data['task_status']        = $this->input->post('task_status');
        $data['client_id']        = $this->input->post('client_id');
        $data['task_note']        = "[". date("d-m-Y") ."] - Se creó la cita";
        $data['assigned_staff_ids'] = '';
        if ($this->input->post('assigned_staff_ids') != "")
            foreach ($this->input->post('assigned_staff_ids') as $row)
                $data['assigned_staff_ids'] .= $row . ',';
        $this->db->insert('team_task', $data);
        $team_task_id = $this->db->insert_id();
        return $team_task_id;
    }

    function edit_team_task($team_task_id)
    {
        $data['task_title']         = $this->input->post('task_title');
        $data['creation_timestamp'] = strtotime($this->input->post('creation_timestamp'));
        $data['due_timestamp']      = strtotime($this->input->post('due_timestamp'));
        $data['assigned_staff_ids'] = '';
        if ($this->input->post('assigned_staff_ids') != "")
            foreach ($this->input->post('assigned_staff_ids') as $row)
                $data['assigned_staff_ids'] .= $row . ',';
        $this->db->where('team_task_id', $team_task_id);
        $this->db->update('team_task', $data);
    }

    function upload_team_task_file($team_task_id = '')
    {
        $data['team_task_id'] = $team_task_id;
        $data['name']         = $_FILES['userfile']['name'];
        $this->db->insert('team_task_file', $data);
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/team_task_file/' . $_FILES['userfile']['name']);
    }

    function download_team_task_file($team_task_file_id = '')
    {
        $file_name = $this->db->get_where('team_task_file', array(
            'team_task_file_id' => $team_task_file_id
        ))->row()->name;
        $this->load->helper('download');
        $data = file_get_contents("uploads/team_task_file/" . $file_name);
        $name = $file_name;

        force_download($name, $data);
    }

    function delete_team_task_file($team_task_file_id = '')
    {

        $file_name = $this->db->get_where('team_task_file', array(
            'team_task_file_id' => $team_task_file_id
        ))->row()->name;
        $this->db->where('team_task_file_id', $team_task_file_id);
        $this->db->delete('team_task_file');

        unlink("uploads/team_task_file/" . $file_name);
    }

    ////////CLIENTS/////////////
    function create_client()
    {

        $data['name']                  = $this->input->post('name');
        $data['email']                 = $this->input->post('email');
        $data['password']              = sha1($this->input->post('password'));
        $data['address']               = $this->input->post('address');
        $data['phone']                 = $this->input->post('phone');
        $data['website']               = $this->input->post('website');
        $data['skype_id']              = $this->input->post('skype_id');
        $data['facebook_profile_link'] = $this->input->post('facebook_profile_link');
        $data['linkedin_profile_link'] = $this->input->post('linkedin_profile_link');
        $data['twitter_profile_link']  = $this->input->post('twitter_profile_link');
        $data['short_note']            = $this->input->post('short_note');

        $this->db->insert('client', $data);
        $client_id = $this->db->insert_id();

        // email notification check
        // if ($this->input->post('notify_check') == 'yes')
        //     $this->email_model->notify_email('new_client_account_opening', $client_id, $this->input->post('password'));

        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/client_image/' . $client_id . '.jpg');

        // CLEAR CACHE
        // $this->output->delete_cache();
        // $this->clear_cache();
    }

    function update_client($client_id)
    {
        $data['name']                  = $this->input->post('name');
        $data['email']                 = $this->input->post('email');
        $data['address']               = $this->input->post('address');
        $data['phone']                 = $this->input->post('phone');
        $data['website']               = $this->input->post('website');
        $data['skype_id']              = $this->input->post('skype_id');
        $data['facebook_profile_link'] = $this->input->post('facebook_profile_link');
        $data['linkedin_profile_link'] = $this->input->post('linkedin_profile_link');
        $data['twitter_profile_link']  = $this->input->post('twitter_profile_link');
        $data['short_note']            = $this->input->post('short_note');

        $this->db->where('client_id', $client_id);
        $this->db->update('client', $data);
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/client_image/' . $client_id . '.jpg');

        // CLEAR CACHE
        // $this->output->delete_cache();
        // $this->clear_cache();
    }

    function delete_client($client_id)
    {
        $this->db->where('client_id', $client_id);
        $this->db->delete('client');
    }

    function approve_pending_client_info($client_pending_id)
    {
        $pending_client = $this->db->get_where('client_pending', array(
            'client_pending_id' => $client_pending_id
        ))->result_array();
        foreach ($pending_client as $row) {
            $data['name']     = $row['name'];
            $data['email']    = $row['email'];
            $data['password'] = $row['password'];
            $this->db->insert('client', $data);
            $client_id = $this->db->insert_id();

            // sending email notification to client upon account confirmation
            $this->email_model->notify_email('new_client_account_confirm', $client_id);
        }

        $this->db->where('client_pending_id', $client_pending_id);
        $this->db->delete('client_pending');
    }

    function delete_pending_client_info($client_pending_id)
    {
        $this->db->where('client_pending_id', $client_pending_id);
        $this->db->delete('client_pending');
    }

  
///INFLUNCERS///

function create_influencer()
    {

        $data['name']                  = $this->input->post('name');
        $data['email']                 = $this->input->post('email');
        $data['password']              = sha1($this->input->post('password'));
        $data['address']               = $this->input->post('address');
        $data['phone']                 = $this->input->post('phone');
        $data['website']               = $this->input->post('website');
        $data['skype_id']              = $this->input->post('skype_id');
        $data['facebook_profile_link'] = $this->input->post('facebook_profile_link');
        $data['linkedin_profile_link'] = $this->input->post('linkedin_profile_link');
        $data['twitter_profile_link']  = $this->input->post('twitter_profile_link');
        $data['short_note']            = $this->input->post('short_note');

        $this->db->insert('influencer', $data);
        $influencer_id = $this->db->insert_id();

        // email notification check
        if ($this->input->post('notify_check') == 'yes')
            $this->email_model->notify_email('new_client_account_opening', $influencer_id, $this->input->post('password'));

        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/influencer_image/' . $influencer_id . '.jpg');

        // CLEAR CACHE
        // $this->output->delete_cache();
        // $this->clear_cache();
    }

   function update_influencer($influencer_id)
    {
        $data['name']                  = $this->input->post('name');
        $data['email']                 = $this->input->post('email');
        $data['address']               = $this->input->post('address');
        $data['phone']                 = $this->input->post('phone');
        $data['website']               = $this->input->post('website');
        $data['skype_id']              = $this->input->post('skype_id');
        $data['facebook_profile_link'] = $this->input->post('facebook_profile_link');
        $data['linkedin_profile_link'] = $this->input->post('linkedin_profile_link');
        $data['twitter_profile_link']  = $this->input->post('twitter_profile_link');
        $data['short_note']            = $this->input->post('short_note');

        $this->db->where('influencer_id', $influencer_id);
        $this->db->update('influencer', $data);
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/influencer_image/' . $influencer_id . '.jpg');

        // CLEAR CACHE
        // $this->output->delete_cache();
        // $this->clear_cache();
    }

    function delete_influencer($influencer_id)
    {
        $this->db->where('influencer_id', $influencer_id);
        $this->db->delete('influencer');
    }



    function create_company()
    {
        $data['name']      = $this->input->post('name');
        $data['address']   = $this->input->post('address');
        $data['phone']     = $this->input->post('phone');
        $data['email']     = $this->input->post('email');
        $data['website']   = $this->input->post('website');
        $data['client_id'] = $this->input->post('client_id');
        $this->db->insert('company', $data);
        $insert_id = $this->db->insert_id();
        move_uploaded_file($_FILES['company_logo']['tmp_name'], 'uploads/company_logo/' . $insert_id . '.jpg');
    }

    function edit_company($company_id)
    {
        $data['name']      = $this->input->post('name');
        $data['address']   = $this->input->post('address');
        $data['phone']     = $this->input->post('phone');
        $data['email']     = $this->input->post('email');
        $data['website']   = $this->input->post('website');
        $data['client_id'] = $this->input->post('client_id');
        $this->db->where('company_id', $company_id);
        $this->db->update('company', $data);
        move_uploaded_file($_FILES['company_logo']['tmp_name'], 'uploads/company_logo/' . $company_id . '.jpg');
    }

    function delete_company($company_id)
    {
        unlink(base_url('uploads/company_logo/'.$company_id.'.jpg'));
        $this->db->where('company_id', $company_id);
        $this->db->delete('company');
    }

    ////////staffS/////////////
    function create_staff()
    {
        $data['name']                  = $this->input->post('name');
        $data['account_role_id']       = $this->input->post('account_role_id');
        $data['email']                 = $this->input->post('email');
        $data['password']              = sha1($this->input->post('password'));
        $data['phone']                 = $this->input->post('phone');
        $data['skype_id']              = $this->input->post('skype_id');
        $data['facebook_profile_link'] = $this->input->post('facebook_profile_link');
        $data['linkedin_profile_link'] = $this->input->post('linkedin_profile_link');
        $data['twitter_profile_link']  = $this->input->post('twitter_profile_link');

        $this->db->insert('staff', $data);
        $staff_id = $this->db->insert_id();

        // email notification check
        if ($this->input->post('notify_check') == 'yes')
            $this->email_model->notify_email('new_staff_account_opening', $staff_id, $this->input->post('password'));

        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/staff_image/' . $staff_id . '.jpg');
    }

    function update_staff($staff_id)
    {
        $data['name']                  = $this->input->post('name');
        $data['account_role_id']       = $this->input->post('account_role_id');
        $data['email']                 = $this->input->post('email');
        $data['phone']                 = $this->input->post('phone');
        $data['skype_id']              = $this->input->post('skype_id');
        $data['facebook_profile_link'] = $this->input->post('facebook_profile_link');
        $data['linkedin_profile_link'] = $this->input->post('linkedin_profile_link');
        $data['twitter_profile_link']  = $this->input->post('twitter_profile_link');

        $this->db->where('staff_id', $staff_id);
        $this->db->update('staff', $data);
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/staff_image/' . $staff_id . '.jpg');
    }

    function delete_staff($staff_id)
    {
        $this->db->where('staff_id', $staff_id);
        $this->db->delete('staff');
    }

    function staff_permission($account_permission_id = '')
    {
        $current_staff_account_role_id = $this->db->get_where('staff', array(
            'staff_id' => $this->session->userdata('login_user_id')
        ))->row()->account_role_id;

        $current_staff_account_permissions = $this->db->get_where('account_role', array(
            'account_role_id' => $current_staff_account_role_id
        ))->row()->account_permissions;

        if (in_array($account_permission_id, explode(',', $current_staff_account_permissions))) {
            return true;
        } else {
            return false;
        }
    }

    // admins ///
    function create_admin()
    {
        $data['name']         = $this->input->post('name');
        $data['email']        = $this->input->post('email');
        $data['password']     = sha1($this->input->post('password'));
        $data['phone']        = $this->input->post('phone');
        $data['address']      = $this->input->post('address');
        $data['owner_status'] = $this->input->post('owner_status');
        $this->db->insert('admin', $data);
        $new_admin_id = $this->db->insert_id();
        $this->email_model->notify_email('new_admin_account_creation', $new_admin_id, $this->input->post('password'));

        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/admin_image/' . $new_admin_id . '.jpg');
    }

    function edit_admin($admin_id)
    {
        $data['name']         = $this->input->post('name');
        $data['email']        = $this->input->post('email');
        $data['phone']        = $this->input->post('phone');
        $data['address']      = $this->input->post('address');
        $data['owner_status'] = $this->input->post('owner_status');
        $this->db->where('admin_id', $admin_id);
        $this->db->update('admin', $data);
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/admin_image/' . $admin_id . '.jpg');
    }

    function delete_admin($admin_id)
    {
        $this->db->where('admin_id', $admin_id);
        $this->db->delete('admin');
    }

    ////////account_roles/////////////
    function create_account_role()
    {
        $checked_permissions  = $this->input->post('permission');
        $total_checked_values = count($checked_permissions);
        $permissions          = '';
        for ($i = 0; $i < $total_checked_values; $i++) {
            $permissions .= $checked_permissions[$i] . ",";
        }

        $data['account_permissions'] = $permissions;
        $data['name']                = $this->input->post('name');
        $this->db->insert('account_role', $data);
    }

    function update_account_role($account_role_id)
    {
        $checked_permissions  = $this->input->post('permission');
        $total_checked_values = count($checked_permissions);
        $permissions          = '';
        for ($i = 0; $i < $total_checked_values; $i++) {
            $permissions .= $checked_permissions[$i] . ",";
        }

        $data['account_permissions'] = $permissions;
        $data['name']                = $this->input->post('name');

        $this->db->where('account_role_id', $account_role_id);
        $this->db->update('account_role', $data);
    }

    function delete_account_role($account_role_id)
    {
        $this->db->where('account_role_id', $account_role_id);
        $this->db->delete('account_role');
    }

    ///// CALENDAR EVENTS //////
    function calendar_event_add()
    {
        $data['title']           = $this->input->post('title');
        $data['description']     = $this->input->post('description');
        $data['colour']          = $this->input->post('colour');
        $data['start_timestamp'] = strtotime($this->input->post('start_timestamp'));
        $data['end_timestamp']   = strtotime($this->input->post('end_timestamp'));
        $data['user_type']       = $this->session->userdata('login_type');
        $data['user_id']         = $this->session->userdata('login_user_id');
        $this->db->insert('calendar_event', $data);
    }

    function calendar_event_edit($calendar_event_id = '')
    {
        $data['title']           = $this->input->post('title');
        $data['description']     = $this->input->post('description');
        $data['colour']          = $this->input->post('colour');
        $data['start_timestamp'] = strtotime($this->input->post('start_timestamp'));
        $data['end_timestamp']   = strtotime($this->input->post('end_timestamp'));
        $this->db->where('calendar_event_id', $calendar_event_id);
        $this->db->update('calendar_event', $data);
    }

    function calendar_event_delete($calendar_event_id = '')
    {
        $this->db->where('calendar_event_id', $calendar_event_id);
        $this->db->delete('calendar_event');
    }

    //////system settings//////
    function update_system_settings()
    {
        $data['description'] = $this->input->post('system_name');
        $this->db->where('type', 'system_name');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('system_title');
        $this->db->where('type', 'system_title');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('address');
        $this->db->where('type', 'address');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('phone');
        $this->db->where('type', 'phone');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('system_email');
        $this->db->where('type', 'system_email');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('system_currency');
        $this->db->where('type', 'system_currency_id');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('dropbox_data_app_key');
        $this->db->where('type', 'dropbox_data_app_key');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('language');
        $this->db->where('type', 'language');
        $this->db->update('settings', $data);
        $this->session->set_userdata('current_language', $this->input->post('language'));

        $data['description'] = $this->input->post('text_align');
        $this->db->where('type', 'text_align');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('purchase_code');
        $this->db->where('type', 'purchase_code');
        $this->db->update('settings', $data);

        /*$data['description'] = $this->input->post('paypal_type');
        $this->db->where('type', 'paypal_type');
        $this->db->update('settings', $data);*/

        $data['description'] = $this->input->post('theme');
        $this->db->where('type', 'theme');
        $this->db->update('settings', $data);

        // TWILIO

        $data['description'] = $this->input->post('twilio_id');
        $this->db->where('type', 'twilio_id');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('twilio_token');
        $this->db->where('type', 'twilio_token');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('whatsapp_message');
        $this->db->where('type', 'whatsapp_message');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('days');
        $this->db->where('type', 'days');
        $this->db->update('settings', $data);
    }

    function update_twilio_settings()
    {
        // TWILIO

        $data['description'] = $this->input->post('twilio_id');
        $this->db->where('type', 'twilio_id');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('twilio_token');
        $this->db->where('type', 'twilio_token');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('whatsapp_message');
        $this->db->where('type', 'whatsapp_message');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('days');
        $this->db->where('type', 'days');
        $this->db->update('settings', $data);
    }

    /////email template settings////
    function save_email_template($email_template_id)
    {
        $data['subject'] = $this->input->post('subject');
        $data['body']    = $this->input->post('body');

        $this->db->where('email_template_id', $email_template_id);
        $this->db->update('email_template', $data);
    }

    /////creates log/////
    function create_log($data)
    {
        $data['timestamp'] = strtotime(date('Y-m-d') . ' ' . date('H:i:s'));
        $data['ip']        = $_SERVER["REMOTE_ADDR"];
        $location          = new SimpleXMLElement(file_get_contents('http://freegeoip.net/xml/' . $_SERVER["REMOTE_ADDR"]));
        $data['location']  = $location->City . ' , ' . $location->CountryName;
        $this->db->insert('log', $data);
    }

    ////////BACKUP RESTORE/////////
    function create_backup($type)
    {
        $this->load->dbutil();


        $options = array(
            'format' => 'txt', // gzip, zip, txt
            'add_drop' => TRUE, // Whether to add DROP TABLE statements to backup file
            'add_insert' => TRUE, // Whether to add INSERT data to backup file
            'newline' => "\n" // Newline character used in backup file
        );


        if ($type == 'all') {
            $tables    = array(
                ''
            );
            $file_name = 'system_backup';
        } else {
            $tables    = array(
                'tables' => array(
                    $type
                )
            );
            $file_name = 'backup_' . $type;
        }

        $backup =& $this->dbutil->backup(array_merge($options, $tables));


        $this->load->helper('download');
        force_download($file_name . '.sql', $backup);
    }

    /////////RESTORE TOTAL DB/ DB TABLE FROM UPLOADED BACKUP SQL FILE//////////
    function restore_backup()
    {
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/backup.sql');
        $this->load->dbutil();


        $prefs = array(
            'filepath' => 'uploads/backup.sql',
            'delete_after_upload' => TRUE,
            'delimiter' => ';'
        );
        $restore =& $this->dbutil->restore($prefs);
        unlink($prefs['filepath']);
    }

    /////////DELETE DATA FROM TABLES///////////////
    function truncate($type)
    {
        if ($type == 'all') {
            $this->db->truncate('student');
            $this->db->truncate('mark');
            $this->db->truncate('teacher');
            $this->db->truncate('subject');
            $this->db->truncate('class');
            $this->db->truncate('exam');
            $this->db->truncate('grade');
        } else {
            $this->db->truncate($type);
        }
    }

    ////////IMAGE URL//////////
    function get_image_url($type = '', $id = '')
    {
        if (file_exists('uploads/' . $type . '_image/' . $id . '.jpg'))
            $image_url = base_url('uploads/' . $type . '_image/' . $id . '.jpg');
        else
            $image_url = base_url('uploads/user.jpg');

        return $image_url;
    }

    function add_todo()
    {
        $data['title'] = $this->input->post('title');
        $data['user']  = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');

        $this->db->insert('todo', $data);
        $todo_id = $this->db->insert_id();

        $data['order'] = $todo_id;
        $this->db->where('todo_id', $todo_id);
        $this->db->update('todo', $data);
    }

    function mark_todo_as_done($todo_id = '')
    {
        $data['status'] = 1;
        $this->db->where('todo_id', $todo_id);
        $this->db->update('todo', $data);
    }

    function mark_todo_as_undone($todo_id = '')
    {
        $data['status'] = 0;
        $this->db->where('todo_id', $todo_id);
        $this->db->update('todo', $data);
    }

    function swap_todo($todo_id = '', $swap_with = '')
    {
        $counter    = 0;
        $temp_order = $this->db->get_where('todo', array(
            'todo_id' => $todo_id
        ))->row()->order;
        $user       = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');

        // Move current todo up.
        if ($swap_with == 'up') {

            // Fetch all todo lists of current user in ascending order.
            $this->db->order_by('order', 'ASC');
            $todo_lists   = $this->db->get_where('todo', array(
                'user' => $user
            ))->result_array();
            $array_length = count($todo_lists);

            // Create separate array for orders and todo_id's from above array.
            foreach ($todo_lists as $todo_list) {
                $id_list[]    = $todo_list['todo_id'];
                $order_list[] = $todo_list['order'];
            }
        }

        // Move current todo down.
        if ($swap_with == 'down') {

            // Fetch all todo lists of current user in descending order.
            $this->db->order_by('order', 'DESC');
            $todo_lists   = $this->db->get_where('todo', array(
                'user' => $user
            ))->result_array();
            $array_length = count($todo_lists);

            // Create separate array for orders and todo_id's from above array.
            foreach ($todo_lists as $todo_list) {
                $id_list[]    = $todo_list['todo_id'];
                $order_list[] = $todo_list['order'];
            }
        }

        // Swap orders between current and next/previous todo.
        for ($i = 0; $i < $array_length; $i++) {
            if ($temp_order == $order_list[$i]) {
                if ($counter > 0) {
                    $swap_order = $order_list[$i - 1];
                    $swap_id    = $id_list[$i - 1];

                    // Update order of current todo.
                    $data['order'] = $swap_order;
                    $this->db->where('todo_id', $todo_id);
                    $this->db->update('todo', $data);

                    // Update order of next/previous todo.
                    $data['order'] = $temp_order;
                    $this->db->where('todo_id', $swap_id);
                    $this->db->update('todo', $data);
                }
            } else
                $counter++;
        }
    }

    function delete_todo($todo_id = '')
    {
        $this->db->where('todo_id', $todo_id);
        $this->db->delete('todo');
    }

    function get_incomplete_todo()
    {
        $user = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');
        $this->db->where('user', $user);
        $this->db->where('status', 0);
        $query = $this->db->get('todo');
        //return $query->num_rows();


        $incomplete_todo_number = $query->num_rows();
        if ($incomplete_todo_number > 0) {
            echo '<span class="badge badge-info" style="background-color: #5d78ff;">';
            echo $incomplete_todo_number;
            echo '</span>';
        }
    }

    function get_currency()
    {
        $system_currency_id = $this->db->get_where('settings', array(
            'type' => 'system_currency_id'
        ))->row()->description;
        $currency_symbol    = $this->db->get_where('currency', array(
            'currency_id' => $system_currency_id
        ))->row()->currency_symbol;
        return $currency_symbol;
    }

    function create_notice()
    {
        $today = date("Y-m-d");
        $quantity = $this->input->post('quantity');
        $recurrency = $this->input->post('recurrency');

        $data['title']        = $this->input->post('title');
        $data['description']  = $this->input->post('description');
        $data['visible_for']  = '1';
        $data['send_to']      = $this->input->post('visible_for');
        $data['published_by'] = $this->session->userdata('login_user_id');
        $data['date_added']   = strtotime(date("Y-m-d H:i:s"));
        $data['is_recurrent'] = $this->input->post('is_recurrent');
        $data['quantity']     = $quantity;
        $data['recurrency']   = $recurrency;

        if($data['is_recurrent'] == '1'){
            $data['next_date'] = date("Y-m-d",strtotime($today."+ $quantity $recurrency"));
        }

        $this->db->insert('notice', $data);
    }

    function edit_notice($notice_id)
    {
        $data['title']         = $this->input->post('title');
        $data['description']   = $this->input->post('description');
        $data['visible_for']   = '1';
        $data['send_to']      = $this->input->post('visible_for');
        $data['published_by']  = $this->session->userdata('login_user_id');
        $data['last_modified'] = strtotime(date("Y-m-d H:i:s"));
        $data['is_recurrent'] = $this->input->post('is_recurrent');
        $data['quantity']     = $this->input->post('quantity');
        $data['recurrency']   = $this->input->post('recurrency');

        $this->db->where('notice_id', $notice_id);
        $this->db->update('notice', $data);
    }

    function delete_notice($notice_id)
    {
        $this->db->where('notice_id', $notice_id);
        $this->db->delete('notice');
    }


    function create_product()
    {

        $data['Nombre']                  = $this->input->post('name');
        $data['descripcion']                 = $this->input->post('description');
        $data['marca']                 = $this->input->post('marca');
        $data['costo']                 = $this->input->post('costo');
        $data['precio']                 = $this->input->post('precio');
        $data['existencia']                 = $this->input->post('existencia');
        $data['categories']          = $this->input->post('categories');
        $data['date_added']          = strtotime(date("Y-m-d H:i:s"));
        $data['caducidad'] = $this->input->post('caducidad'); 
        $data['visible_for']          = '';
        $data['publicado_por']          =  $this->session->userdata('login_user_id');
        $data['file'] = $_FILES['userfile']['name'];

          
        $this->db->insert('product', $data);
        $recipe_id = $this->db->insert_id();
    move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/product_file/' . $_FILES['userfile']['name']);

        // email notification check


        // CLEAR CACHE
        // $this->output->delete_cache();
        // $this->clear_cache();
    }

    function edit_product($product_id)
    {
        $data['Nombre']         = $this->input->post('title');
        $data['descripcion']   = $this->input->post('description');
        $data['existencia']    = $this->input->post('existencia'); 
        $data['costo']         = $this->input->post('costo');
        $data['precio']         = $this->input->post('precio');
        $data['visible_for']   = $this->input->post('visible_for');
        $data['publicado_por']  = $this->session->userdata('login_user_id');
        $data['last_modified'] = strtotime(date("Y-m-d H:i:s"));
        $data['caducidad'] = $this->input->post('caducidad');

        $this->db->where('product_id', $product_id);
        $this->db->update('product', $data);
    }
 
    function delete_product($product_id)
    {
        $this->db->where('product_id', $product_id);
        $this->db->delete('product');
    }

    // Servicios
    function create_servicios()
    {

        $data['nombre']                  = $this->input->post('name');
        $data['descripcion']                 = $this->input->post('description');
        $data['precio']                 = $this->input->post('precio');
        $data['date_added']          = strtotime(date("Y-m-d H:i:s"));
        $data['visible_for']          = '';
        $data['publicado_por']          =  $this->session->userdata('login_user_id');
        $data['file'] = $_FILES['userfile']['name'];
        $services  = json_decode($this->input->post('serviceProducts'));
        // $productos = json_decode($this->input->post('productsUpdate'));
        $this->db->insert('servicios', $data);
        $idx = $this->db->insert_id();
        foreach($services as $service){
            $data2['id_service'] = $idx;
            $data2['id_product'] = $service->id_product;
            $data2['quantity'] = $service->quantity;
            $data2['left_quantity'] = $service->left_quantity;
            $this->db->insert('service_products', $data2);    
        }
        // foreach($productos as $producto){
        //     $this->db->where('product_id', $producto->id);
        //     $dataP['existencia'] = $producto->quantity;
        //     $this->db->update('product', $dataP);
        // }
        $recipe_id = $this->db->insert_id();
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/servicios_file/' . $_FILES['userfile']['name']);

        // email notification check


        // CLEAR CACHE
        // $this->output->delete_cache();
        // $this->clear_cache();
    }

    function edit_servicios($servicios_id)
    {
        $data['nombre']         = $this->input->post('name');
        $data['descripcion']   = $this->input->post('description');
        $data['precio']         = $this->input->post('precio');
        $data['visible_for']   = $this->input->post('visible_for');
        $data['publicado_por']  = $this->session->userdata('login_user_id');
        $data['last_modified'] = strtotime(date("Y-m-d H:i:s"));

        $this->db->where('servicios_id', $servicios_id);
        $this->db->update('servicios', $data);
    }
 
    function delete_servicios($servicios_id)
    {
        $this->db->where('servicios_id', $servicios_id);
        $this->db->delete('servicios');
    }


    

    function get_settings($type)
    {
        $des = $this->db->get_where('settings', array('type' => $type))->row()->description;
        return $des;
    }

    // update stripe keys
    function update_stripe_keys() {
        $info = array();

        $stripe['active'] = $this->input->post('stripe_active');
        $stripe['testmode'] = $this->input->post('testmode');
        $stripe['public_key'] = $this->input->post('public_key');
        $stripe['secret_key'] = $this->input->post('secret_key');
        $stripe['public_live_key'] = $this->input->post('public_live_key');
        $stripe['secret_live_key'] = $this->input->post('secret_live_key');

        array_push($info, $stripe);

        $data['description']    =   json_encode($info);
        $this->db->where('type', 'stripe_keys');
        $this->db->update('settings', $data);
    }

    // update paypal keys
    function update_paypal_keys() {
        $info = array();

        $paypal['active'] = $this->input->post('paypal_active');
        $paypal['mode'] = $this->input->post('paypal_mode');
        $paypal['sandbox_client_id'] = $this->input->post('sandbox_client_id');
        $paypal['production_client_id'] = $this->input->post('production_client_id');

        array_push($info, $paypal);

        $data['description']    =   json_encode($info);
        $this->db->where('type', 'paypal');
        $this->db->update('settings', $data);
    }

    // update SMTP settings
    function update_smtp_settings() {

        $data['description'] = sanitizer($this->input->post('smtp_protocol'));
        $this->db->where('type', 'protocol');
        $this->db->update('settings', $data);

        $data['description'] = sanitizer($this->input->post('smtp_user'));
        $this->db->where('type', 'smtp_user');
        $this->db->update('settings', $data);

        $data['description'] = sanitizer($this->input->post('smtp_pass'));
        $this->db->where('type', 'smtp_pass');
        $this->db->update('settings', $data);

        $data['description'] = sanitizer($this->input->post('smtp_host'));
        $this->db->where('type', 'smtp_host');
        $this->db->update('settings', $data);

        $data['description'] = sanitizer($this->input->post('smtp_port'));
        $this->db->where('type', 'smtp_port');
        $this->db->update('settings', $data);

    }

    //application detail
    function get_application_details() {
        $purchase_code = get_settings('purchase_code');
        $returnable_array = array(
        'purchase_code_status' => get_phrase('not_found'),
        'support_expiry_date'  => get_phrase('not_found'),
        'customer_name'        => get_phrase('not_found')
        );

        $personal_token = "gC0J1ZpY53kRpynNe4g2rWT5s4MW56Zg";
        $url = "https://api.envato.com/v3/market/author/sale?code=".$purchase_code;
        $curl = curl_init($url);

        //setting the header for the rest of the api
        $bearer   = 'bearer ' . $personal_token;
        $header   = array();
        $header[] = 'Content-length: 0';
        $header[] = 'Content-type: application/json; charset=utf-8';
        $header[] = 'Authorization: ' . $bearer;

        $verify_url = 'https://api.envato.com/v1/market/private/user/verify-purchase:'.$purchase_code.'.json';
        $ch_verify = curl_init( $verify_url . '?code=' . $purchase_code );

        curl_setopt( $ch_verify, CURLOPT_HTTPHEADER, $header );
        curl_setopt( $ch_verify, CURLOPT_SSL_VERIFYPEER, false );
        curl_setopt( $ch_verify, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt( $ch_verify, CURLOPT_CONNECTTIMEOUT, 5 );
        curl_setopt( $ch_verify, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13');

        $cinit_verify_data = curl_exec( $ch_verify );
        curl_close( $ch_verify );

        $response = json_decode($cinit_verify_data, true);

        if (count($response['verify-purchase']) > 0) {

          //print_r($response);
          $item_name                = $response['verify-purchase']['item_name'];
          $purchase_time            = $response['verify-purchase']['created_at'];
          $customer                 = $response['verify-purchase']['buyer'];
          $licence_type             = $response['verify-purchase']['licence'];
          $support_until            = $response['verify-purchase']['supported_until'];
          $customer                 = $response['verify-purchase']['buyer'];

          $purchase_date            = date("d M, Y", strtotime($purchase_time));

          $todays_timestamp         = strtotime(date("d M, Y"));
          $support_expiry_timestamp = strtotime($support_until);

          $support_expiry_date  = date("d M, Y", $support_expiry_timestamp);

          if ($todays_timestamp > $support_expiry_timestamp)
          $support_status       = get_phrase('expired');
          else
          $support_status       = get_phrase('valid');

          $returnable_array = array(
            'purchase_code_status' => $support_status,
            'support_expiry_date'  => $support_expiry_date,
            'customer_name'        => $customer
          );
        }
        else {
          $returnable_array = array(
            'purchase_code_status' => 'invalid',
            'support_expiry_date'  => 'invalid',
            'customer_name'        => 'invalid'
          );
        }

        return $returnable_array;
    }
}
