<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once 'conexionpdo.php';
  include "conexionpdo.php";

 
 $codigoObjeto=2;
 
?>

<body> 
    <div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>
    <section class="content">
        <div class="container-fluid">
          
            <section class="content-header text-xl-center mb-3 "> 
                <h4> Informe de Consulta</h4>
            </section>
            <div class="card">
                <div class="card-header" style="background-color:#B3F2FF;">
                <ul class="nav nav-tabs card-header-tabs">
         <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Citas en Espera</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Registrar Expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consulta Espiritual</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Informe de Consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Lista de Personas</a>
            </li>
          </ul>
                </div><!--FIN DEL CARD HEADER -->
                <div class="card-body"><!--Cuerpo del card body principal -->

                <div class="alert alert" style="border-color:blue">
                  <h3 class="text-center"> Paso <i class="bi bi-4-circle"></i><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-4-circle" viewBox="0 0 16 16">
                      <path d="M7.519 5.057c.22-.352.439-.703.657-1.055h1.933v5.332h1.008v1.107H10.11V12H8.85v-1.559H4.978V9.322c.77-1.427 1.656-2.847 2.542-4.265ZM6.225 9.281v.053H8.85V5.063h-.065c-.867 1.33-1.787 2.806-2.56 4.218Z"/>
                      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Z"/>
                      </svg>
                  </h3>
                </div>
               
                
                <!--Form del archivo expediente -->
                <form method="POST" id="form">

                <div>
                      <h5>Datos Personales</h5>
                  </div>
                  <hr color= "blue"> 
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
                           $query = "SELECT i.CODIGO_CITA as CODIGO_CITA, i.CODIGO_PERSONA, CONCAT_WS(' ',pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO) as PACIENTE,  pe.DNI, pe.FECHA_NACIMIENTO
                           FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est
                                                                   WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                                                   AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                                                   AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                                                   AND es.CODIGO_PERSONA = '$cod_usuario'
                                                                   AND i.CODIGO_ESTADO = '12' 
                                                                   and  i.AREA_CITA = '4'
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
                          <label for="" class="control-label">Paciente</label> 
                          <div class="form-group">
                            <input  readonly class="form-control" value="<?php echo $nombre_pa;?>">
                            <input  hidden name="EXPEDIENTE_CITA_ESPIRITUAL" value="<?php echo $codigo_cita;?>">
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
                  <HR>
                  <div >
                      <h5>Expediente Paciente</h3>
                  </div>
                  <hr color="blue">

                  <div class="form-group">
             <?php
              $query = "SELECT exp.CODIGO_EXPEDIENTE, exp.NOMBRE_IGLESIA, exp.GRUPO_IGLESIA, exp.TIEMPO_ASISTIR_IGLESIA, exp.MOTIVACION_IGLESIA
              FROM tbl_expediente_espiritual exp
              WHERE CODIGO_PERSONA = '$persona';" ;
              $resul2=$conn->query($query); 
               
              while($row2 = $resul2->fetch_assoc()){
                $var6 = $row2['NOMBRE_IGLESIA'];
                $var7 = $row2['GRUPO_IGLESIA'];
                $var9 = $row2['TIEMPO_ASISTIR_IGLESIA'];
                $var8 = $row2['MOTIVACION_IGLESIA'];
                $var5 = $row2['CODIGO_EXPEDIENTE'];
              ?>
                   <div class= "row">                      
                        <div class="col-md-6">
                                <input type="text" name="codigoexpediente" value="<?php echo $var5?>" Hidden> <!--CODGIO DEL EXPEDIENTE PARA Q SALGA TODA INFO  --> 
                                <label for="" class="control-label">Nombre Iglesia</label> 
                                <div class="form-group">
                                <textarea required class="form-control"  type="textarea" required value=""disabled ="disabled" 
                                name="sintomasneuraticos" id="sintomasneuraticos"><?php echo $var6?></textarea>
                                </div>
                        </div><!--fin del Sintomas Neuroticos-->
                        <div  class="col-md-6">
                                <label for="" class="control-label">Grupo de Iglesia</label> 
                                    <div class="form-group">
                                <textarea required class="form-control"  type="textarea" required value="" disabled ="disabled"
                                 name="Familiares" id="Familiares"><?php echo $var7?></textarea>
                                    </div>
                        </div><!--fin del la Antecedentes Familiares -->   
                    </div> <!--fin del row primer de expediente  -->
                    <div class="row">
                        <div  class="col-md-6">
                            <label for="" class="control-label">Tiempo de Asistir a la Iglesia</label> 
                                <div class="form-group">
                            <textarea required class="form-control"  type="textarea" required  disabled ="disabled" name="Personales" id="Personales"><?php echo $var9?></textarea>
                                </div>
                        </div><!--fin del la Antecedentes Personales -->    
                        <div  class="col-md-6">
                            <label for="" class="control-label">Motivación en la Iglesia</label> 
                                <div class="form-group">
                            <textarea required class="form-control"  type="textarea" required value="" disabled ="disabled" name="Clinicos" id="Clinicos"><?php echo $var8?></textarea>
                                </div>
                        </div><!--fin del la Antecedentes Personales -->       
                    </div><!--fin del row segundo de expediente -->
                    <?php
                    }
                    ?> <!--METER EL CICLO TODO LOS TEXTOS Y DENTRO DEL ROW PRINCIPAL-->
             </div><!--fin del div de row DE EXPEDIENTE-->

                  <hr>
                  <div>
                     <h5>Datos de Consulta</h5> 
                  </div>
                  <hr color="blue"> 

                  <div class="row">
                      <?php
                       $consulti ="SELECT con.CODIGO_CITA, con.MOTIVO_CONSULTA, con.OBSERVACIONES
                       FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est, tbl_consulta_espiritual con
                                           WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                              AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                                AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                                  AND con.CODIGO_CITA = i.CODIGO_CITA
                                                    AND es.CODIGO_PERSONA = '$cod_usuario'
                                                      AND i.CODIGO_ESTADO = '12' 
                                                        AND  i.AREA_CITA = '4'
                                                          AND con.CODIGO_CITA = '$codigo_cita'
                                                            AND i.FECHA_CITA = CURDATE();";
                        $resul=$conn->query($consulti);
                      ?>
                      <?php 
                         if ($resul->num_rows > 0) {
                         while($row = $resul->fetch_assoc()) { 
                         $motivo_consulta = $row['MOTIVO_CONSULTA'];
                         $observaciones_espiritual = $row['OBSERVACIONES'];
                        
                         
                        ?> 
                      <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Motivo Consulta</label>
                          <div class="form-group">
                             <textarea  type="textarea" readonly class="form-control" ><?php echo $motivo_consulta;?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-6 mb-3">
                         <label  class="form-label">Observaciónes</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $observaciones_espiritual ; ?></textarea>
                          </div>
                      </div>
                      
                      <?php
                       }
                       }
                      ?>
                   </div><!-- fin row-->
                
                  <div class="modal-footer justify-content-start">
                 <button style="color:#ffff;" type="submit"   name="FINALIZAR_CITA_ESPIRITUAL" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Finalizar Consulta</button>
                 </form><!--fin form del archivo expediente-->
                 <!--form para el reporte de la consulta-->
                  <form action="Reportes_Prosecar/reporteConsultaEspiritual.php" method="POST"> 
                  <div class="row"> 
                    <input hidden name="codigo_cita_reporte" value="<?php echo $codigo_cita;?>">  
                    <input type="text" name="id_persona"  hidden value="<?php echo $persona ?>">
                    <input type="hidden" name="id_usuario" value="<?php echo $cod_usuario ?>">
                  </div>
                      <button type="submit" name ="reporte_consulta_psicologica"  style="color:white; background-color:#FA0079"class="btn btn-danger btn mx-1 "> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
                  </form>

                
                </div> 

                <!--fin form para el reporte de la consulta-->
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
      window.open('Reportes_Prosecar/reporteConsultaEspiritual.php','_blank');
      window.open(this.href,'_self');
    }
  </script> 

