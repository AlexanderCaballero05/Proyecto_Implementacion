<?php
 include_once "conexion1.php";
 include_once "conexion3.php";
 include "conexionpdo.php";


 
 $codigoObjeto=2;
 $accion='Ingreso a la tabla de roles';
 $descripcion= 'Usuario se autentifico ';
 bitacora($codigoObjeto, $accion,$descripcion);
 
?>

<body oncopy="return false" onpaste="return false"> 
    <div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>
    <section class="content">
        <div class="container-fluid">
            <section class="content-header text-xl-center mb-3 btn-light"> 
                <h4> EXPEDIENTE MEDICO PACIENTE <i class="nav-icon fas fa-stethoscope"></i></h4>
            </section>
            <div class="card">
                <div class="card-header" style="background-color:#B3F2FF;">
                    <ul class="nav nav-tabs card-header-tabs">
                       <li class="nav-item">
                            <a class="nav-link" style="color:#000000;" href="#">Citas Medicas</a>
                        </li>
                        <li class="nav-item">
                            <a  class="nav-link " aria-current="true" href="#"  style=" color:#000000;">Pre Clinica</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" style="color:#000000;" href="#">Consultas Medicas</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link" style="color:#000000;" href="#">Recetas Medicas</a>
                        </li>
                        <li class="nav-item">
                           <a class="nav-link active" style="color:#000000;" href="#">Expedientes Medicos</a>
                        </li>
                    </ul>
                </div><!--FIN DEL CARD HEADER -->
                <div class="card-body"><!--Cuerpo del card body principal -->
                <form method="POST" >
                  </br><strong class="form-check-label" >Datos Personales  Paciente</strong>
                  <hr> 
                  <div class="row">
                     <div  class="col-sm-5 mb-3">
                         <label for="" class="control-label">Nombre Paciente</label>
                         <?php 
                           $query = "SELECT p.CODIGO_PERSONA, p.DNI, c.CODIGO_CITA as CODIGO, CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
                           as PACIENTE , p.FECHA_NACIMIENTO from tbl_inscripcion_cita c ,tbl_persona p ,tbl_area a
                           where p.CODIGO_PERSONA = c.CODIGO_PERSONA
                           AND c.CODIGO_ESTADO = '12' and  c.AREA_CITA = a.CODIGO_AREA  and a.CODIGO_AREA = 2 ";
                           $resul=$conn->query($query);                
                           ?>  
                              <?php 
                                   if ($resul->num_rows > 0) {
                                   while($row = $resul->fetch_assoc()) { 
                                    $codigo_cita = $row['CODIGO'];
                                    $persona = $row['CODIGO_PERSONA'];
                                    $nombre_pa = $row['PACIENTE'];
                                    $dni = $row['DNI'];
                                    $fecha = $row['FECHA_NACIMIENTO'];
                              ?>              
                          <label for="" class="control-label">Paciente</label> 
                          <div class="form-group">
                            <input  readonly class="form-control" value="<?php echo $nombre_pa;?>">
                            <input  hidden name="EXPEDIENTE_CITA" value="<?php echo $codigo_cita;?>">
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
                  <strong class="form-check-label" >Datos generales Expediente</strong>
                  <hr> 
                  <div class="row">
                      <?php
                       $consulta = "SELECT exp.CODIGO_EXPEDIENTE, concat(per.PRIMER_NOMBRE,' ',per.PRIMER_APELLIDO) as nombre, san.TIPO as TIPO_SANGRE, exp.TRATAMIENTOS, exp.ENFERMEDADES, ale.NOMBRE as ALERGIAS, tra.TIPO as TRASTORNOS, apa.TIPO as APARIENCIA
                       FROM tbl_expediente_medico exp, tbl_persona per, tbl_personas_alergias alep, tbl_personas_transtornos trap, tbl_personas_apariencia apap, tbl_alergias ale, tbl_transtornos_corporales tra, tbl_apariencia_fisica apa, tbl_tipo_sangre san
                       WHERE exp.CODIGO_PERSONA = per.CODIGO_PERSONA
                       AND exp.CODIGO_EXPEDIENTE = alep.CODIGO_EXPEDIENTE_PERSONA
                       AND exp.CODIGO_EXPEDIENTE = trap.CODIGO_EXPEDIENTE
                       AND exp.CODIGO_EXPEDIENTE = apap.CODIGO_EXPEDIENTE
                       AND alep.CODIGO_ALERGIAS = ale.CODIGO_ALERGIAS
                       AND trap.CODIGO_TRANSTORNO = tra.CODIGO_TRANSTORNO
                       AND apap.CODIGO_APARIENCIA = apa.CODIGO_APARIENCIA
                       AND exp.CODIGO_TIPO_SANGRE = san.CODIGO_TIPO_SANGRE and exp.CODIGO_PERSONA = '$persona'";
                       $resul=$conn->query($consulta);
                      ?>
                      <?php 
                         if ($resul->num_rows > 0) {
                         while($row = $resul->fetch_assoc()) { 
                         $sangre = $row['TIPO_SANGRE'];
                         $tratamientos = $row['TRATAMIENTOS'];
                         $enfermedades = $row['ENFERMEDADES'];
                         $alergias = $row['ALERGIAS'];
                         $trastornos = $row['TRASTORNOS'];
                         $apariencia = $row['APARIENCIA'];
                        ?>   
                     <div class="col-sm-2 mb-3">
                         <label for="" class="control-label">Tipo Sangre</label>
                          <div class="form-group">
                             <input  readonly class="form-control" value="<?php echo $sangre; ?>">
                          </div>
                     </div>
                     <div  class="col-sm-5 mb-3">
                         <label  class="form-label">Tratamientos que toma actualmente</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $tratamientos ;?></textarea>
                          </div>
                     </div>
                     <div  class="col-sm-5 mb-3">
                         <label  class="form-label">Enfermedad que padece</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $enfermedades;?></textarea>
                          </div>
                     </div>
                  </div>
                  <strong class="form-check-label" >Datos generales Expediente</strong>
                  <hr> 
                  <div class="row">
                       <div class="col-sm-4 mb-3">
                            <label  class="form-label">Alergias</label>
                            <div class="form-group">
                                <textarea  readonly class="form-control" ><?php echo $alergias;?></textarea>
                            </div>
                       </div>
                       <div class="col-sm-4 mb-3">
                            <label  class="form-label">Trastornos</label>
                            <div class="form-group">
                                <textarea  readonly class="form-control" ><?php echo $trastornos;?></textarea>
                            </div>
                       </div>
                       <div class="col-sm-4 mb-3">
                            <label  class="form-label">Apariencia fisica</label>
                            <div class="form-group">
                                <textarea  readonly class="form-control" ><?php echo $apariencia;?></textarea>
                            </div>
                       </div>
                       <?php
                       }
                       }
                      ?>
                  </div><!--fin row -->
                  <strong class="form-check-label">Información de la consulta</strong>
                  <hr> 
                  <div class="row">
                      <?php
                       $codigo='12';
                       $area='2';
                       $consultar = $db->prepare("SELECT c.CODIGO_CITA  from tbl_inscripcion_cita c  ,tbl_area a
                       where  c.CODIGO_ESTADO = (?) and  c.AREA_CITA = a.CODIGO_AREA  and a.CODIGO_AREA = (?);");
                       $consultar->execute(array($codigo,$area));
                       $row=$consultar->fetchColumn();
                       if($row >0 ){
                          $cita = $row;
                       }
                       $consulti ="SELECT * FROM tbl_consulta_medica cm ,tbl_inscripcion_cita c
                       where 	cm.CODIGO_CITA = c.CODIGO_CITA and  cm.CODIGO_CITA = '$cita'";
                        $resul=$conn->query($consulti);
                      ?>
                      <?php 
                         if ($resul->num_rows > 0) {
                         while($row = $resul->fetch_assoc()) { 
                         $sintomas = $row['SINTOMAS'];
                         $diagnostico_ingreso = $row['DIAGNOSTICO_INGRESO'];
                         $evolucion = $row['EVOLUCION'];
                         $diagnostico_egreso = $row['DIAGNOSTICO_EGRESO'];
                         
                        ?> 
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Sintomas</label>
                          <div class="form-group">
                             <textarea  type="textarea" readonly class="form-control" ><?php echo $sintomas;?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Diagnostico Ingreso</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $diagnostico_ingreso ; ?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Evolución</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $evolucion; ?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Diagnostico de egreso</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $diagnostico_egreso; ?></textarea>
                          </div>
                      </div>
                      <?php
                       }
                       }
                      ?>
                  </div><!-- fin row-->
                  <strong class="form-check-label">Información de la receta</strong>
                  <hr> 
                  <div class="row">
                      <?php
                       $consulta = "SELECT per.CODIGO_PERSONA, per.PRIMER_NOMBRE, GROUP_CONCAT(me.NOMBRE_MEDICAMENTO) as medicamentos, GROUP_CONCAT(re.INDICACIONES_RECETA) as indicaciones
                       FROM tbl_persona per, tbl_inscripcion_cita cita, tbl_consulta_medica consu, tbl_receta_medica re, tbl_medicamento me
                       WHERE per.CODIGO_PERSONA = cita.CODIGO_PERSONA
                       AND cita.CODIGO_CITA = consu.CODIGO_CITA
                       AND consu.CODIGO_CONSULTA = re.CODIGO_CONSULTA
                       AND re.CODIGO_MEDICAMENTO = me.CODIGO_MEDICAMENTO and cita.CODIGO_PERSONA ='$persona'";
                       $resul=$conn->query($consulta);
                      ?>
                      <?php
                       if ($resul->num_rows > 0) {
                         while($row = $resul->fetch_assoc()) { 
                         $medicamentos = $row['medicamentos'];
                         $indicaciones = $row['indicaciones'];
                        ?> 
                     <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Medicamentos recetados</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control"><?php echo $medicamentos;  ?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Observaciones medicamentos</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $indicaciones;?></textarea>
                          </div>
                      </div>
                      <?php
                       }
                       }
                      ?>
                  </div>
                  
                  <button type="submit"  id="" name="FINALIZAR_EXPEDIENTE" class="btn btn-info btn mx-1"><span><i class="nav-icon fas fa-arrow-right mx-1"></i></span>Cierre</button>
                  
                   
                  <button onclick="Descargar();"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger "> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
                </form>
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
      window.open('Reportes_Prosecar/reporteCitaMedica.php','_blank');
      window.open(this.href,'_self');
    }
  </script> 

