<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once 'conexionpdo.php';
  include "conexionpdo.php";

?>

<body> 
    <div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>
    <section class="content">
        <div class="container-fluid">
            <div class="content-header text-xl-center mb-3"> 
                <h4>Informe Plan Terapéutico</h4>
            </div>
            <div class="card">
                <div class="card-header" style="background-color:#B3F2FF;">
                <ul class="nav nav-tabs card-header-tabs">
         <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Consultas en Espera</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Registrar Expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consulta Psicológica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de Consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Plan Terapéutico</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Informe Plan Terapéutico</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Lista de Pacientes</a>
            </li>
          </ul>
                </div><!--FIN DEL CARD HEADER -->
                <div class="card-body"><!--Cuerpo del card body principal -->

                <form method="POST"id="form">
                <div class="alert alert" style="border-color:blue">
                  <h3 class="text-center"> Paso <i class="bi bi-6-circle"></i><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-6-circle" viewBox="0 0 16 16">
                    <path d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM8.21 3.855c1.612 0 2.515.99 2.573 1.899H9.494c-.1-.358-.51-.815-1.312-.815-1.078 0-1.817 1.09-1.805 3.036h.082c.229-.545.855-1.155 1.98-1.155 1.254 0 2.508.88 2.508 2.555 0 1.77-1.218 2.783-2.847 2.783-.932 0-1.84-.328-2.409-1.254-.369-.603-.597-1.459-.597-2.642 0-3.012 1.248-4.407 3.117-4.407Zm-.099 4.008c-.92 0-1.564.65-1.564 1.576 0 1.032.703 1.635 1.558 1.635.868 0 1.553-.533 1.553-1.629 0-1.06-.744-1.582-1.547-1.582Z"/>
                    </svg>   
                  </h3>
                </div>
               
                  <h5>Datos Generales del Paciente</h5>
                  <hr color="blue"> 
                  <div class="row">
                     <div  class="col-sm-5 mb-3">
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
                         <?php 
                           $query = "SELECT i.CODIGO_CITA as CODIGO_CITA, i.CODIGO_PERSONA, CONCAT_WS(' ',pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO,pe.SEGUNDO_APELLIDO) as PACIENTE,  pe.DNI, pe.FECHA_NACIMIENTO
                           FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est
                                                                   WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                                                   AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                                                   AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                                                   AND es.CODIGO_PERSONA = '$cod_usuario'
                                                                   AND i.CODIGO_ESTADO = '16' 
                                                                   and  i.AREA_CITA = '3'
                                                                   AND i.FECHA_CITA = CURDATE();";
                           $resul=$conn->query($query);                
                           ?>  
                              <?php 
                                   if ($resul->num_rows > 0) {
                                   while($row = $resul->fetch_assoc()) { 
                                    $codigo_cita = $row['CODIGO_CITA'];
                                    $persona = $row['CODIGO_PERSONA'];
                                    $nombre_pa = $row['PACIENTE'];
                                    $dni = $row['DNI'];
                                    $fecha = $row['FECHA_NACIMIENTO'];
                              ?>              
                          <label for="" class="control-label">Nombre del Paciente</label> 
                          <div class="form-group">
                            <input  readonly class="form-control" value="<?php echo $nombre_pa;?>">
                            <input  hidden name="EXPEDIENTE_CITA_PSICOLOGICO" value="<?php echo $codigo_cita;?>">
                          </div>
                     </div>
                     <div  class="col-sm-4 mb-3">
                         <label for="" class="control-label">DNI</label>
                          <div class="form-group">
                             <input  readonly class="form-control" value="<?php echo $dni;?>">
                          </div>
                     </div>
                     
                     <div  class="col-sm-3 mb-3">
                         <label for="" class="control-label">Fecha Nacimiento</label>
                          <div class="form-group">
                             <input  readonly class="form-control" value="<?php echo $fecha;?>">
                          </div>
                     </div>
                  <?php
                    }
                    }
                 ?>
                  </div><!--fin row -->
            

                  <hr>
                  <div >
                     <h5>Información de la Consulta</h5> 
                  </div>
                  <hr color="blue"> 

                  <div class="row">
                      <?php
                       $consulti ="SELECT con.CODIGO_EXPEDIENTE_PSICO, con.CODIGO_CITA, con.SINTOMAS, con.DIAGNOSTICO_INGRESO, con.DIAGNOSTICO_EGRESO, con.OBSEVARCIONES
                       FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est, tbl_expediente_psicologico_consulta con
                                           WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                              AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                                AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                                  AND con.CODIGO_CITA = i.CODIGO_CITA
                                                    AND es.CODIGO_PERSONA = '$cod_usuario'
                                                      AND i.CODIGO_ESTADO = '16' 
                                                        AND  i.AREA_CITA = '3'
                                                          AND con.CODIGO_CITA = '$codigo_cita'
                                                            AND i.FECHA_CITA = CURDATE();";
                        $resul=$conn->query($consulti);
                      ?>
                      <?php 
                         if ($resul->num_rows > 0) {
                         while($row = $resul->fetch_assoc()) { 
                         $sintomas = $row['SINTOMAS'];
                         $diagnostico_ingreso = $row['DIAGNOSTICO_INGRESO'];
                         $evolucion = $row['OBSEVARCIONES'];
                         $diagnostico_egreso = $row['DIAGNOSTICO_EGRESO'];
                         $codigo_consulta = $row['CODIGO_EXPEDIENTE_PSICO'];
                         
                        ?> 
                      <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Síntomas</label>
                          <div class="form-group">
                             <textarea  type="textarea" readonly class="form-control" ><?php echo $sintomas;?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Diagnóstico Ingreso</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $diagnostico_ingreso ; ?></textarea>
                          </div>
                      </div>
                    </div>

                      <div class="row">
                      
                      <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Diagnóstico Egreso</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $diagnostico_egreso; ?></textarea>
                          </div>
                      </div>

                      <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Observaciones</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $evolucion; ?></textarea>
                          </div>
                      </div>
                      <?php
                       }
                       }
                      ?>
                  </div><!-- fin row-->
                 
                  <hr>
                  <div>
                     <h5>Información del Plan Terapéutico</h5> 
                  </div>
                  <hr color="blue"> 
                    
                  <div class="row">
                      <?php
                       $consulti ="SELECT plan.CODIGO_CONSULTA , plan.ACTIVIDAD, plan.TECNICA, plan.MATERIALES, plan.TAREAS, plan.RESULTADOS
                       FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est, tbl_expediente_psicologico_consulta con, tbl_plan_terapeutico plan
                                             WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                               AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                                 AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                                   AND con.CODIGO_CITA = i.CODIGO_CITA
                                                    AND con.CODIGO_EXPEDIENTE_PSICO = plan.CODIGO_CONSULTA
                                                        AND es.CODIGO_PERSONA = '$cod_usuario'
                                                          AND i.CODIGO_ESTADO = '16' 
                                                            AND  i.AREA_CITA = '3'
                                                              AND con.CODIGO_CITA = '$codigo_cita' 
                                                                AND plan.CODIGO_CONSULTA = '$codigo_consulta'
                                                                  AND i.FECHA_CITA = CURDATE();";
                        $resul=$conn->query($consulti);
                      ?>
                      <?php 
                         if ($resul->num_rows > 0) {
                         while($row = $resul->fetch_assoc()) { 
                         $actividad = $row['ACTIVIDAD'];
                         $tecnica = $row['TECNICA'];
                         $materiales = $row['MATERIALES'];
                         $tareas = $row['TAREAS'];
                         $resultados = $row['RESULTADOS'];
                         
                        ?> 
                      <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Actividades</label>
                          <div class="form-group">
                             <textarea  type="textarea" readonly class="form-control" ><?php echo $actividad;?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Técnicas</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $tecnica ; ?></textarea>
                          </div>
                      </div>

               </div> <!--fin del row-->
               
               <div class="row">
                      <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Materiales</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $materiales; ?></textarea>
                          </div>
                  
                 
                      </div>
                      <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Tareas</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $tareas; ?></textarea>
                          </div>
                      </div>

              </div><!-- fin row-->

                    <div class="row">
                      <div  class="col-sm-12 mb-3">
                         <label  class="form-label">Resultados</label>
                          <div class="form-group">
                             <textarea  type="textarea" readonly class="form-control" ><?php echo $resultados;?></textarea>
                          </div>
                      </div>

                      
                     
                  </div>
                  <?php
                       }
                       }
                      ?>
                <div class="modal-footer justify-content-start">
                 <button style="color:#ffff;" type="submit"   name="FINALIZAR_EXPEDIENTE_PSICOLOGICO" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Finalizar Consulta</button>
                </form>

                  <form action="Reportes_Prosecar/reporteConsultaPlanTerapeutico.php" method="POST"> <!--form para el reporte de la consulta-->
                  
                    <input hidden name="codigo_cita_reporte_Plan" value="<?php echo $codigo_cita;?>">  
                    <input type="text" name="id_persona_plan"  hidden value="<?php echo $persona ?>">
                    <input type="hidden" name="id_usuario_plan" value="<?php echo $cod_usuario ?>">
                    <input type="hidden" name="codigo_consulta_reporte_Plan" value="<?php echo $codigo_consulta ?>">

                      <button  type="submit" name ="reporte_consulta_psicologica_plan"  style="color:white; background-color:#FA0079"class="btn btn-danger btn mx-1  "> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
                  </form><!--fin form para el reporte de la consulta-->
                </div>
                </div><!--fin card body -->
            </div><!-- FINAL cad genera -->
        </div><!-- FINAL CONTAINER FLUID --> 
    </section><!-- FINAL SECTION -->


</body>

   <script>//previene que se mantenga una tecla pulsada
      var texto=document.getElementById('bloquear');
      texto.addEventListener('keydown', function(keyboardEvent) {
        if (keyboardEvent.repeat)
            keyboardEvent.preventDefault();
      });
      var texto1 =document.getElementById('bloquear1');
      texto1.addEventListener('keydown', function(keyboardEvent) {
        if (keyboardEvent.repeat)
            keyboardEvent.preventDefault();
      });
  </script>

  <script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteRol.php','_blank');
      window.open(this.href,'_self');
    }
  </script> 

