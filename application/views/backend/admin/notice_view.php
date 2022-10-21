<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<?php
  $info = $this->db->get_where('notice', array('notice_id' => $param2))->result_array();
  foreach ($info as $row):
?>
<div class="row">
  <div class="col-md-12">
    <div class="tile-block btn-success">
      <div class="tile-header">
				<i class="glyphicon glyphicon-bullhorn"></i>
        <?php echo $row['title'];?>
			</div>
      <div class="tile-content">
        <p><?php echo $row['description'];?></p>
      </div>
      <div class="tile-footer">
        <span><b><?php echo get_phrase('published_by'); ?></b> : <?php echo $this->db->get_where('admin', array('admin_id' => $row['published_by']))->row()->name;?></span>
        <br>
        <span><b><?php echo get_phrase('date_added'); ?></b> : <?php echo date('jS F Y' , $row['date_added']);?></span>
        <br>
        <span><b><?php echo get_phrase('last_modified'); ?></b> : <?php echo date('jS F Y' , $row['last_modified']);?></span>
			</div>
    </div>
  </div>
</div>

<?php
  if($row['is_recurrent'] == '1'){
?>
  <div class="row">
    <div class="col-md-12">
      <div class="tile-block btn-primary">
        <div class="tile-header">
          <i class="glyphicon glyphicon-calendar"></i>
          Siguiente fecha de entrega: <?php echo $row['next_date'];?>
        </div>
      </div>
    </div>
  </div>
<?php
  }
?>

<button type="button" onclick="send_message()" class="btn btn-success btn-lg btn-block">Enviar mensajes <i class="entypo-paper-plane"></i></button>

<?php endforeach; ?>

<script type="text/javascript">
  function send_message(){
    swal({
      title: "Estás a punto de mandar multiples mensajes por WhatsApp",
      text: "Esta acción será irreversible",
      icon: "info",
      buttons: {
        cancel: "Cancelar",
        catch: {
          text: "Enviar",
          value: "send",
        }
      } 
    })
    .then((value) => {
      switch (value) {
        case "send":

          $.ajax({
            url: '<?php echo site_url('admin/send_messages_noticeboard/' . $row['notice_id']);?>',
            success: function(response)
            {
              console.log(response);
              location.reload();
            }
          });

          break;
      }
    }); 
  }
</script>
