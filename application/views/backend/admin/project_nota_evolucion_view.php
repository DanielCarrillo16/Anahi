<?php



$nota_evolucion = $this->db->get_where('project_nota_evolucion', array('project_nota_evolucion_id' => $param2))->result_array();

foreach ($nota_evolucion as $row):

    ?>



    <div class="row">

        <div class="col-md-12">

            <blockquote class="blockquote-default">

                <p>

                    <strong><?php echo $row['title']; ?></strong>

                </p>

                <p>

                    <small><?php echo $row['nombre_completo']; ?></small>

                    

                </p>

                <p>
                    <small><?php echo $row['comentarios_paciente']; ?></small>
                </p>

                <p>
                    <small><?php echo $row['observaciones']; ?></small>
                </p>

                <p>
                    <small><?php echo $row['siguiente_cita']; ?></small>
                </p>

                &nbsp;

                &nbsp;

                    <i class="entypo-calendar" style="color: #ccc;"></i>

                    <?php echo date("d M Y", $row['timestamp']); ?>


                

        </div>

    </div>



<?php endforeach; ?>