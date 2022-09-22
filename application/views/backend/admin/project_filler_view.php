<?php



$filler = $this->db->get_where('project_filler', array('project_filler_id' => $param2))->result_array();

foreach ($filler as $row):

    ?>



    <div class="row">

        <div class="col-md-12">

            <blockquote class="blockquote-default">

                <p>
                    <strong>Título: </strong><br><?php echo $row['title']; ?><br>
                    <strong>Aplicación: </strong><br><?php echo $row['aplicacion']; ?><br>
                    <strong>Valoración: </strong><br><?php echo $row['valoracion']; ?><br>
                    <strong>Relleno: </strong><br><?php echo $row['relleno']; ?><br>
                    <strong>Procedimiento: </strong><br><?php echo $row['procedimiento']; ?><br>
                    <strong>Lote: </strong><br><?php echo $row['lote']; ?><br>
                    <strong>Cantidad de producto: </strong><br><?php echo $row['cantidad_producto']; ?><br>
                    <strong>Propuesta: </strong><br><?php echo $row['propuesta']; ?>

                </p>

                

                <i class="entypo-user" style="color: #ccc;"></i>

                <?php

                $type = $row['user_type'];

                $id = $row['user_id'];

                $name = $this->db->get_where($type, array($type . '_id' => $id))->row()->name;

                echo $name;

                ?>

                &nbsp;

                &nbsp;

                <i class="entypo-calendar" style="color: #ccc;"></i>

    <?php echo date("d M Y", $row['timestamp']); ?>

                &nbsp;

                &nbsp;

                

                </p>



            </blockquote>



        </div>

    </div>



<?php endforeach; ?>