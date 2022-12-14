<?php
  $info = $this->db->get_where('servicios', array('servicios_id' => $param2))->result_array();
  foreach ($info as $row):
?>
<div class="row">
  <div class="col-md-12">
    <div class="tile-block tile-aqua">
      <div class="tile-header">
				<i class="glyphicon glyphicon-bullhorn"></i>
        <?php echo $row['nombre'];?>
			</div>
      <div class="tile-content">
        <p><?php echo $row['description'];?></p>
      </div>

      <div class="tile-footer">
      <span><b><?php echo get_phrase('precio'); ?></b> : <?php echo ($row['precio']);?></span>
        <br>
        <span><b><?php echo get_phrase('publicado_por'); ?></b> : <?php echo $this->db->get_where('admin', array('admin_id' => $row['publicado_por']))->row()->name;?></span>
        <br>
        <span><b><?php echo get_phrase('date_added'); ?></b> : <?php echo date('jS F Y' , $row['date_added']);?></span>
        <br>
        <span><b><?php echo get_phrase('last_modified'); ?></b> : <?php echo date('jS F Y' , $row['last_modified']);?></span>
        <br>
        <span><b><?php echo get_phrase('descripcion'); ?></b> : <?php echo ($row['descripcion']);?></span>
			</div>
    </div>
  </div>
</div>
<?php endforeach; ?>
