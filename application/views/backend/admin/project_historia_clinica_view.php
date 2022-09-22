<?php



$historia_clinica = $this->db->get_where('project_historia_clinica', array('project_historia_clinica_id' => $param2))->result_array();

foreach ($historia_clinica as $row):

    ?>



    <div class="row">

        <div class="col-md-12">

            <blockquote class="blockquote-default">

                <p>
                    Titulo: <strong><?php echo $row['title']; ?></strong>
                </p><br>

                <p>
                    Nombre: <small><?php echo $row['nombre_completo']; ?></small>
                </p><br>
                <p>
                    Número de expediente: <small><?php echo $row['num_expendiente']; ?></small>
                </p><br>
                <p>
                    Fecha de creación: <small><?php echo $row['creacion']; ?></small>
                </p><br>
                <p>
                    Fecha de nacimiento: <small><?php echo $row['nacimiento']; ?></small>
                </p><br>
                <p>
                    Edad: <small><?php echo $row['edad']; ?></small>
                </p><br>
                <p>
                    Sexo: <small><?php if($row['sexo'] == 0){ ?> Hombre <?php } else { ?> Mujer <?php } ?></small>
                </p><br>
                <p>
                    Teléfono: <small><?php echo $row['telefono']; ?></small>
                </p><br>
                <p>
                    Dirección: <small><?php echo $row['direccion']; ?></small>
                </p><br>
                <p>
                    Talla: <small><?php echo $row['talla']; ?></small>
                </p><br>
                <p>
                    Peso: <small><?php echo $row['peso']; ?></small>
                </p><br>
                <p>
                    Glucosa<small><?php echo $row['glucosa']; ?></small>
                </p><br>
                <p>
                    Motivo de consulta<small><?php echo $row['motivo_consulta']; ?></small>
                </p><br>
                <p>
                    Alergias: <small><?php if($row['alergias'] == 0){ ?> No <?php } else { ?> Si <?php } ?></small>
                </p><br>
                <p>
                    Cuales alergias:<small><?php echo $row['alergias_notas']; ?></small>
                </p><br>
                <p>
                    Farmacos actuales: <small><?php if($row['farmacos_actuales'] == 0){ ?> No <?php } else { ?> Si <?php } ?></small>
                </p><br>
                <p>
                    Cuales: <small><?php echo $row['farmacos_actuales_notas']; ?></small>
                </p><br>
                <p>
                    Antecedentes de proc. quirurjicos: <small><?php if($row['procedimientos_quirurjicos'] == 0){ ?> No <?php } else { ?> Si <?php } ?></small>
                </p><br>
                <p>
                    Fecha de antecedente: <small><?php echo $row['quirurjicos_fecha']; ?></small>
                </p><br>
                <p>
                    Alcohol: <small><?php if($row['alcohol'] == 0){ ?> No <?php } else { ?> Si <?php } ?></small>
                </p><br>
                <p>
                    Tabaco: <small><?php if($row['tabaco'] == 0){ ?> No <?php } else { ?> Si <?php } ?></small>
                </p><br>
                <p>
                    Sustancias: <small><?php if($row['sustancias'] == 0){ ?> No <?php } else { ?> Si <?php } ?></small>
                </p><br>
                <p>
                    Glogau: <small><?php 
                        if($row['glogau'] == 0){ 
                            ?>
                            Tipo 1 - Leve (20 a 30 años)
                            <?php 
                        } else if($row['glogau'] == 1) { 
                            ?>
                            Tipo 2 - Moderado (30 a 40 años)
                            <?php
                        } else if($row['glogau'] == 2) { 
                            ?>
                            Tipo 3 - Avanzado (Arriba de 50 años)
                            <?php
                        } else if($row['glogau'] == 3) { 
                            ?>
                            Tipo 4 - Severo (Arriba de 60 años)
                            <?php
                        } ?>
                    </small>
                </p><br>
                <p>
                    Fitzpatrck: <small><?php 
                        if($row['fitz'] == 0){ 
                            ?>
                            Tipo I-  Albina, caucásica
                            <?php 
                        } else if($row['fitz'] == 1) { 
                            ?>
                            Tipo II-  Blanca, Clara
                            <?php
                        } else if($row['fitz'] == 2) { 
                            ?>
                            Tipo III - Piel europea oscura
                            <?php
                        } else if($row['fitz'] == 3) { 
                            ?>
                            Tipo IV -  Piel moreno clara
                            <?php
                        } else if($row['fitz'] == 4) { 
                            ?>
                            Tipo V -  Piel moreno oscura
                            <?php
                        } else if($row['fitz'] == 5) { 
                            ?>
                            Tipo VI -  Piel negra
                            <?php
                        } ?>
                    </small>
                </p><br>

                &nbsp;

                &nbsp;

                    <i class="entypo-calendar" style="color: #ccc;"></i>

                    <?php echo date("d M Y", $row['timestamp']); ?>


                

        </div>

    </div>



<?php endforeach; ?>