<?php



$historia_clinica = $this->db->get_where('project_historia_clinica', array('project_historia_clinica_id' => $param2))->result_array();

foreach ($historia_clinica as $row):

    ?>



    <div class="row">

        <div class="col-md-12">

            <blockquote class="blockquote-default">

                <p>
                    <strong><?php echo $row['title']; ?></strong>
                </p><br>

                <p>
                    <small><?php echo $row['nombre_completo']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['numero_expediente']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['creacion']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['nacimiento']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['edad']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['sexo']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['telefono']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['direccion']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['talla']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['peso']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['glucosa']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['motivo_consulta']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['alergias']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['alergias_notas']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['farmacos_actuales']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['farmacos_actuales_notas']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['procedimientos_quirurjicos']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['quirurjicos_fecha']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['alcohol']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['tabaco']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['sustancias']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['glogau']; ?></small>
                </p><br>
                <p>
                    <small><?php echo $row['fitz']; ?></small>
                </p><br>

                &nbsp;

                &nbsp;

                    <i class="entypo-calendar" style="color: #ccc;"></i>

                    <?php echo date("d M Y", $row['timestamp']); ?>


                

        </div>

    </div>



<?php endforeach; ?>