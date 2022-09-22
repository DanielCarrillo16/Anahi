<?php



$toxina_botulinica = $this->db->get_where('project_toxina_botulinica', array('project_toxina_botulinica_id' => $param2))->result_array();

foreach ($toxina_botulinica as $row):

    ?>



    <div class="row">

        <div class="col-md-12">

            <blockquote class="blockquote-default">

                <h4>Zona Frontal</h4>
                <p>
                    <strong><?php echo $row['zona_frontal_cantidad']; ?></strong>
                </p>
                <br>
                <h4>Zona corrugador</h4>
                <p>
                    <strong><?php echo $row['zona_corrugador_cantidad']; ?></strong>
                </p>
                <br>
                <h4>Zona proceus</h4>
                <p>
                    <strong><?php echo $row['zona_proceus_cantidad']; ?></strong>
                </p>
                <br>
                <h4>Zona del ojo</h4>
                <p>
                    <strong><?php echo $row['zona_ojo_cantidad']; ?></strong>
                </p>
                <br>
                <h4>Zona subpalpebral</h4>
                <p>
                    <strong><?php echo $row['zona_subpalpebral_cantidad']; ?></strong>
                </p>
                <br>
                <h4>Zona de la Nariz</h4>
                <p>
                    <strong><?php echo $row['zona_nariz_cantidad']; ?></strong>
                </p>
                <br>
                <h4>Zona Boca</h4>
                <p>
                    <strong><?php echo $row['zona_boca_cantidad']; ?></strong>
                </p>
                <br>
                <h4>Zona del masetero</h4>
                <p>
                    <strong><?php echo $row['zona_masetero_cantidad']; ?></strong>
                </p>
                <br>
                <h4>Zona del mentoniano</h4>
                <p>
                    <strong><?php echo $row['zona_mentoniano_cantidad']; ?></strong>
                </p>
                <br>
                <h4>Otros</h4>
                <p>
                    <strong><?php echo $row['zona_otros_cantidad']; ?></strong>
                </p>
                <br>
                <h4>Notas</h4>
                <p>
                    <strong><?php echo $row['notas']; ?></strong>
                </p>


                &nbsp;

                &nbsp;

                    <i class="entypo-calendar" style="color: #ccc;"></i>

                    <?php echo date("d M Y", $row['timestamp']); ?>


                

        </div>

    </div>



<?php endforeach; ?>