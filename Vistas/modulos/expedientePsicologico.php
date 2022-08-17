<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once 'conexionpdo.php';
  include "conexionpdo.php";

?>

<body oncopy="return false" onpaste="return false"> 
    <div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>
    <section class="content">
        <div class="container-fluid">
            <section class="content-header text-xl-center mb-3 "> 
                <h4> Informe de Consulta </h4>
            </section>
            <div class="card">
                <div class="card-header" style="background-color:#B3F2FF;">
                <ul class="nav nav-tabs card-header-tabs">
         <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Consultas en Espera</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Registrar Expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consulta Psicológica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Informe de Consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Plan Terapéutico</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Lista de Pacientes</a>
            </li>
          </ul>
                </div><!--FIN DEL CARD HEADER -->
                <div class="card-body"><!--Cuerpo del card body principal -->
                <!--Form del archivo expediente -->
                <form method="POST" id="form">
                <div class="alert alert" style="border-color:blue">
                  <h3 class="text-center"> Paso <i class="bi bi-4-circle"></i><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-4-circle" viewBox="0 0 16 16">
                      <path d="M7.519 5.057c.22-.352.439-.703.657-1.055h1.933v5.332h1.008v1.107H10.11V12H8.85v-1.559H4.978V9.322c.77-1.427 1.656-2.847 2.542-4.265ZM6.225 9.281v.053H8.85V5.063h-.065c-.867 1.33-1.787 2.806-2.56 4.218Z"/>
                      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Z"/>
                      </svg>
                  </h3>
                </div>

                  <h5>Datos del Paciente</h5>
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
                                                                   AND i.CODIGO_ESTADO = '12' 
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
                      <h5>Expediente Paciente</h3>
                  </div>
                  <hr color="blue">

                  <div class="row">
                      <?php
                       $consulta = "SELECT exp.CODIGO_EXPEDIENTE, concat(per.PRIMER_NOMBRE,' ',per.PRIMER_APELLIDO) as nombr, exp.ANTECEDENTES_FAMILIARES, exp.ANTECEDENTES_PERSONALES, exp.ANTECEDENTES_CLINICOS, GROUP_CONCAT(sin.TIPO) as TIPO
                       FROM tbl_expediente_psicologico_unico exp, tbl_persona per, tbl_personas_sintomas psin, tbl_sintomas_neuroticos sin            			       
                       WHERE exp.CODIGO_PERSONA = per.CODIGO_PERSONA
                       AND exp.CODIGO_EXPEDIENTE = psin.CODIGO_EXPEDIENTE
                       AND psin.CODIGO_SINTOMA_NEUROTICO = sin.CODIGO_SINTOMA_NEUROTICO
                       AND exp.CODIGO_PERSONA = '$persona'";
                       $resul=$conn->query($consulta);
                      ?>
                      <?php 
                         if ($resul->num_rows > 0) {
                         while($row = $resul->fetch_assoc()) { 
                         $sangre = $row['ANTECEDENTES_FAMILIARES'];
                         $tratamientos = $row['ANTECEDENTES_PERSONALES'];
                         $enfermedades = $row['ANTECEDENTES_CLINICOS'];
                         $alergias = $row['TIPO'];
                         
                        ?>  
                         <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Síntomas Neuróticos</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $alergias;?></textarea>
                          </div>
                     </div> 
                     <div class="col-sm-6 mb-3">
                         <label for="" class="control-label">Antecedentes Familiares</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $sangre ;?></textarea>
                          </div>
                     </div>
                    

                  </div><!--fin row -->

                  <div class="row">

                     <div class="col-sm-6 mb-3">
                         <label  class="form-label">Antecedentes Personales</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $tratamientos ;?></textarea>
                          </div>
                     </div>

                     <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Antecedentes Clínicos</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $enfermedades;?></textarea>
                          </div>
                     </div>
                    
                
                       
                       <?php
                       }
                       }
                      ?>
                  </div>

                  <hr>
                  <div >
                     <h5>Datos de Consulta</h5> 
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
                                                      AND i.CODIGO_ESTADO = '12' 
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
                    
                  </div><!-- fin row-->

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

                  </div>
                 
              <div class="modal-footer justify-content-start">
                <button style="color:#ffff;" type="submit"   name="FINALIZAR_EXPEDIENTE_PSICOLOGICO" class="btn btn-success btn "><span> <i class="nav-icon fas fa-save mx-1"></i></span>Finalizar</button>
                <button type="submit"  id="" name="Crear_plan_terapeutico" class="btn btn-primary"><span><i class="nav-icon fa fa-plus-square mx-1"></i></span>
                  Crear Plan Terapéutico
                </button>

                </form><!--fin form del archivo expediente-->
                <!--form para el reporte de la consulta-->
                <form action="Reportes_Prosecar/reporteConsultaPsicologica.php" method="POST"> 
                  <div class="row"> 
                    <input hidden name="codigo_cita_reporte" value="<?php echo $codigo_cita;?>">  
                    <input type="text" name="id_persona"  hidden value="<?php echo $persona ?>">
                    <input type="hidden" name="id_usuario" value="<?php echo $cod_usuario ?>">
                  </div>
                      <button  type="submit" name ="reporte_consulta_psicologica"  style="color:white; background-color:#FA0079" class="btn btn-danger btn"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
                  </form>
                   <!--fin form para el reporte de la consulta-->
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

