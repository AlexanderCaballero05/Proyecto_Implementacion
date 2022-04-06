<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once  "conexionpdo.php";
?>
<head>
 
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><!--Para que funcione el selecrt2 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> 
</head>

<body>
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">
        <section class="content-header text-xl-center mb-3 btn-light"> 
          <h4> REGISTRO DE EXPEDIENTE PSICOLOGICO  <i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Citas Psicologicas</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="#">Registrar expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consultas Psicologicas</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Planes terapeuticos</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Expedientes Psicologicos</a>

            </li>
          </ul>
          </div><!--FIN DEL CARD HEADER -->
           <div class="card-body"><!--Cuerpo del card body principal -->
             <form method="POST" class="needs-validation" novalidate>
                    <strong>Datos generales de expediente</strong>
                    <hr>
                    <div class= "row"> 
                        <div  class="col-sm-8">
                        <?php 

                        // AND i.FECHA_CITA = CURDATE();";

                        $query2 = "SELECT pe.CODIGO_PERSONA, CONCAT_WS(' ',pe.DNI,pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO,pe.SEGUNDO_APELLIDO) as PACIENTE
                        FROM tbl_inscripcion_cita i, tbl_persona pe
                        WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                        AND I.CODIGO_ESTADO = '11'
                        AND i.AREA_CITA = '3'
                      
                        ;";
                       
                        $resul2=$conn->query($query2);                
                        ?>
                        <label for="" class="control-label">Nombre Paciente</label> 
                        <div class="form-group">
                            <select class="form-control select2" name="codigo_paciente_expediente_psicologico"> 
                                <option selected disabled value="">--Buscar Paciente--</option>
                                <?php 
                                    if ($resul2->num_rows > 0) {
                                    while($row2 = $resul2->fetch_assoc()) { 
                                    $codigo2 = $row2['CODIGO_PERSONA'];
                                    $nombre2 = $row2['PACIENTE'];
                                    ?>
                                <option value="<?php echo $codigo2?>" ><?php echo $nombre2;?></option>
                                <?php 
                                } 
                                }
                                ?>
                                <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </select>
                            
                        </div>
                        </div><!--fin del paciente -->

                       

                        <div class="col-sm-4">
                         <label for="antecedentes_familiares" class="control-label">Antecedentes Psicologicos familiares</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="textarea" name="antecedentes_familiares" id="antecedentes_familiares" autocomplete = "off">  </textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->

                        


                    </div> <!--fin del row -->
                    </br>
                    <hr>
                    <br>
                    <div class="row">
                     
                    <div class="col-sm-4">
                         <label for="antecedentes_personales" class="control-label">Antecedentes Psicologicos personales</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="textarea" name="antecedentes_personales" id="antecedentes_personales" autocomplete = "off"> </textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->
                      <!-- End: checkbox -->
                      <div class="col-sm-4">
                         <label for="antecedentes_clinicos" class="control-label">Antecedentes clinicos</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="textarea" name="antecedentes_clinicos" id="antecedentes_clinicos" autocomplete= "off"></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->

                      <div class="col-md-4">
                        <div class="card">
                            <div class="card-header" style="background-color:#DFD4FE;">
                              <strong>Sintomas neuroticos</strong>
                            </div>
                        <div class="card-body">
                        
                            <?php 
                                $query1 = "SELECT CODIGO_SINTOMA_NEUROTICO ,TIPO from tbl_sintomas_neuroticos  ";
                                $resultadod1=$conn->query($query1);                
                                ?>
                                <?php 
                                if ($resultadod1->num_rows > 0) {
                                while($row1 = $resultadod1->fetch_assoc()) { 
                                $codigo1 = $row1['CODIGO_SINTOMA_NEUROTICO'];
                                $nombre1= $row1['TIPO'];
                                ?>
                            <div  class="form-check icheck-pink" >
                                <input  class="form-check-input" type="checkbox" name="neuroticos[]" id="neuroticos<?php echo $codigo1;?>" value="<?php echo $codigo1;?>">
                                <label class="form-check-label" for="neuroticos<?php echo $codigo1;?>">
                                    <?php echo $nombre1;?>
                                </label>
                                </br>
                                
                                </div>
                                <?php 
                                } 
                                }
                                ?>
                      </div><!--fin otros antecedentes--> 
                      </div>
                      </div>
                     
                    </div><!--div del row -->  

                 </br></br>
                <button type="submit"  id="" name="expediente_medico" class="btn btn-info btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar </button>
             </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
</div>
</div>




  <script>

$(document).ready(function() {
    $('.hb').select2();
});




(function() {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function(form) {
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
})()

</script>

