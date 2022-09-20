<?php



$historia_clinica = $this->db->get_where('project_historia_clinica', array('project_historia_clinica_id' => $param2))->result_array();

foreach ($historia_clinica as $row):

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

                &nbsp;

                &nbsp;

                    <i class="entypo-calendar" style="color: #ccc;"></i>

                    <?php echo date("d M Y", $row['timestamp']); ?>


                

        </div>

    </div>



<?php endforeach; ?>