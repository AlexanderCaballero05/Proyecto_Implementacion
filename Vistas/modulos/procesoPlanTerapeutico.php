<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
include "conexionpdo.php";

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
  <section class="content-header text-xl-center mb-3 btn-light"> 
          <h4> CONSULTA PSICOLOGICA PROSECAR  <i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
    <section class="content">
       <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Citas Psicologicas</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Registrar expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consultas Psicologicas</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Planes terapeuticos</a>
            </li>
          </ul>
          </div><!--FIN DEL CARD HEADER -->
           <div class="card-body"><!--Cuerpo del card body principal -->
           <?php
              $usuario= $_SESSION['vario'];

              //Consulta que trae el codigo del usuario
              $sentencia1 = $db->prepare("SELECT p.CODIGO_PERSONA
              FROM tbl_usuario u, tbl_persona p 
              WHERE u.CODIGO_PERSONA = p.CODIGO_PERSONA
              AND NOMBRE_USUARIO = (?);");
              $sentencia1->execute(array($usuario));
              $cod_usuario=$sentencia1->fetchColumn();

              ?>
             <form method="POST"  class=" needs-validation" novalidate>
                    </br>
                    <strong>Datos Terapeuticos</strong>
                    <hr> <br>
                <div class= "row"> 
                    <div class="col-md-6">
                          <?php 
                          $query = "SELECT con.CODIGO_EXPEDIENTE_PSICO CODIGO_CONSULTA, con.CODIGO_CITA, CONCAT_WS(' ',pe.DNI,pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO) as PACIENTE
                          FROM tbl_expediente_psicologico_consulta con, tbl_inscripcion_cita i, tbl_persona pe    ,tbl_persona_especialidad es, tbl_estado esta
                          WHERE con.CODIGO_CITA = i.CODIGO_CITA
                          AND i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                          AND i.CODIGO_ESTADO = esta.CODIGO_ESTADO
                          AND I.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                          AND es.CODIGO_PERSONA = '$cod_usuario'
                          AND esta.CODIGO_ESTADO = '14';";
                          $resultadocon=$conn->query($query);

                          ?>
                           <?php 
                          if ($resultadocon->num_rows > 0) {
                          while($row = $resultadocon->fetch_assoc()) { 
                          $codigocon = $row['CODIGO_CONSULTA'];
                          $codigocita = $row['CODIGO_CITA'];
                          $nombrecon = $row['PACIENTE'];
                          ?>

                    <label for="" class="control-label">Paciente</label> 
                          <div class="form-group">
                            <input  readonly class="form-control" value="<?php echo $nombrecon;?>">
                          </div>

                  </div>

                  <div class="col-md-3">
                  <label for="" class="control-label">Codigo consulta</label> 
                          <div class="form-group">
                            <input readonly class="form-control" name="codigo_consulta"value="<?php echo $codigocon;?>">
                            <input  hidden name="codigo_cita" value="<?php echo $codigocita;?>">
                          </div>
                  </div>

                          <?php
                          }
                          }
                          ?>
                       
                </div>
                        
                               
                        <div class="row">

                        <div class="col-md-6">
                         <label for="" class="control-label">Actividades</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="600"  name="Actividades" id="Actividades"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->
                        <div class="col-md-6">
                         <label for="" class="control-label">Tecnicas</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="300"  name="tecnicas" id="Actividades"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.                         
                              </div>
                            </div>
                        </div><!--fin del peso -->
                      </div> 

                      <div class="row">
                        
                        <div class="col-md-6">
                         <label for="" class="control-label">Materiales</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="600"  name="Materiales" id="Materiales"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->
                 
                        <div class="col-md-6">
                         <label for="" class="control-label">Tareas</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="600"  name="Tareas" id="Tareas"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio. 
                            
                            
                              </div>
                            </div>
                        </div><!--fin del peso -->
                       </div> 
                       
                       <div class="row">
                        <div class="col-md-6">
                         <label for="" class="control-label">Resultados</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="600" onkeyup="mayus(this);" name="Resultados" id="Resultados"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>  
                      
                            </div>
                        </div><!--fin del peso -->

                      
                    </div><!--fin row -->
                 
                
                <button type="submit"  id="" name="GUARDAR_PLAN" class="btn btn-info btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar plan y finalizar consulta </button>
             </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->
          </div>
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
</div>
</div>




  <script>

$(document).ready(function() {
    $('.hb').select2();
});



    (function () { 
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
          .forEach(function (form) {
            form.addEventListener('submit', function (event) {
              if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
              }
              form.classList.add('was-validated')
            }, false)
          })
    })()
</script>
