<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
 include "conexionpdo.php";

 
 $codigoObjeto=2;
 $accion='Ingreso a la tabla de expediente medico';
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
            <div class="content-header text-xl-center mb-3 "> 
                <h4> Informe de Consulta<i class="nav-icon fas fa-stethoscope"></i></h4>
            </div>
            <div class="card">
                <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
                <li class="nav-item">
                <a class=" nav-link" style="color:#000000;" href="#">Personas Consulta Médica</a>
                </li>
                <li class="nav-item">
                <a class=" nav-link" style="color:#000000;" href="#">Registrar Expediente</a>
                </li>

                <li class="nav-item">
                <a class="nav-link" style="color:#000000;" href="#">Consulta Médica</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" style="color:#000000;" href="#">Recetas Medicas</a>
                </li>
                </li>
                <li class="nav-item">
                <a class="nav-link active" style="color:#000000;" href="#">Informe de Consulta</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" style="color:#000000;" href="#">Lista de Pacientes</a>
                </li>
            </ul>
                </div><!--FIN DEL CARD HEADER -->
                <div class="card-body"><!--Cuerpo del card body principal -->
                <form method="POST" id="form" >
                  <div>
                       <H5>Datos del Paciente</h5><hr color="blue">
                  </div>
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
                         <?php //Sentencia que trae los datos personales del paciente,con el estado 12 
                           $query = "SELECT i.CODIGO_CITA as CODIGO, i.CODIGO_PERSONA, CONCAT_WS(' ',pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO) as PACIENTE,  pe.DNI, i.FECHA_CITA, i.HORARIO, est.NOMBRE as nombre_estado, pe.FECHA_NACIMIENTO
                           FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est
                           WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                           AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                           AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                           AND es.CODIGO_PERSONA = '$cod_usuario'
                           AND i.CODIGO_ESTADO = '12' 
                           AND  i.AREA_CITA = '2'
                           AND i.FECHA_CITA = CURDATE();";
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
                         <label for="" class="control-label">Nombre del Paciente</label> 
                          <div class="form-group">
                            <input  readonly class="form-control" value="<?php echo $nombre_pa;?>">
                            <input  hidden name="EXPEDIENTE_CITA" value="<?php echo $codigo_cita;?>">
                          </div>
                      </div>
                     <div class="col-sm-4 mb-3">
                         <label for="" class="control-label">DNI</label>
                          <div class="form-group">
                             <input  readonly class="form-control" value="<?php echo $dni;?>">
                          </div>
                     </div>
                     <div class="col-sm-3 mb-3">
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
                  <div>
                      <h5>Expediente del Paciente</h5>
                  </div>
                  <hr color="blue"> 
                  <div class="row">
                      <?php //Sentencia que trae los datos que han sido creados del paciente del expediente medico
                       $consulta = "SELECT exp.CODIGO_EXPEDIENTE, concat(per.PRIMER_NOMBRE,' ',per.PRIMER_APELLIDO) as nombre, san.TIPO as TIPO_SANGRE, exp.TRATAMIENTOS, exp.ENFERMEDADES, ale.NOMBRE as ALERGIAS, tra.TIPO as TRASTORNOS, apa.TIPO as APARIENCIA
                       FROM tbl_expediente_medico exp, tbl_persona per, tbl_personas_alergias alep, tbl_personas_transtornos trap, tbl_personas_apariencia apap, tbl_alergias ale, tbl_transtornos_corporales tra, tbl_apariencia_fisica apa, tbl_tipo_sangre san
                       WHERE exp.CODIGO_PERSONA = per.CODIGO_PERSONA
                       AND exp.CODIGO_EXPEDIENTE = alep.CODIGO_EXPEDIENTE_PERSONA
                       AND exp.CODIGO_EXPEDIENTE = trap.CODIGO_EXPEDIENTE
                       AND exp.CODIGO_EXPEDIENTE = apap.CODIGO_EXPEDIENTE
                       AND alep.CODIGO_ALERGIAS = ale.CODIGO_ALERGIAS
                       AND trap.CODIGO_TRANSTORNO = tra.CODIGO_TRANSTORNO
                       AND apap.CODIGO_APARIENCIA = apa.CODIGO_APARIENCIA
                       AND exp.CODIGO_TIPO_SANGRE = san.CODIGO_TIPO_SANGRE and exp.CODIGO_PERSONA = '$persona'
                       GROUP by exp.CODIGO_PERSONA ";
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
                         <label  class="form-label">Tratamientos que Toma Actualmente</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $tratamientos ;?></textarea>
                          </div>
                       </div>
                       <div  class="col-sm-5 mb-3">
                         <label  class="form-label">Enfermedad que Padece</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $enfermedades;?></textarea>
                          </div>
                       </div>
                   </div>
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
                            <label  class="form-label">Apariencia Física</label>
                            <div class="form-group">
                                <textarea  readonly class="form-control" ><?php echo $apariencia;?></textarea>
                            </div>
                       </div>
                       <?php
                       }
                       }
                      ?>
                   </div><!--fin row -->
                  <div>
                      <h5>Información de la Consulta</h5>
                  </div>
                  <hr color="blue"> 
                  <div class="row">
                    <?php //consulta que trae los datos de la consulta,el codigo etc
                      $consulti ="SELECT CON.CODIGO_CONSULTA, con.CODIGO_CITA, con.SINTOMAS, con.DIAGNOSTICO_INGRESO, con.EVOLUCION, con.DIAGNOSTICO_EGRESO
                      FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est, tbl_consulta_medica con
                      WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                        AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                          AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                            AND con.CODIGO_CITA = i.CODIGO_CITA
                              AND es.CODIGO_PERSONA = '$cod_usuario'
                                AND i.CODIGO_ESTADO = '12' 
                                  AND  i.AREA_CITA = '2'
                                    AND con.CODIGO_CITA = '$codigo_cita'
                                      AND i.FECHA_CITA = CURDATE();";
                        $resul=$conn->query($consulti);
                      ?>
                      <?php 
                         if ($resul->num_rows > 0) {
                         while($row = $resul->fetch_assoc()) { 
                         $codigo_consulta = $row['CODIGO_CONSULTA'];
                         $sintomas = $row['SINTOMAS'];
                         $diagnostico_ingreso = $row['DIAGNOSTICO_INGRESO'];
                         $evolucion = $row['EVOLUCION'];
                         $diagnostico_egreso = $row['DIAGNOSTICO_EGRESO']
                        ?> 
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Síntomas</label>
                          <div class="form-group">
                             <textarea  type="textarea" readonly class="form-control" ><?php echo $sintomas;?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Diagnóstico Ingreso</label>
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
                         <label  class="form-label">Diagnóstico de Egreso</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $diagnostico_egreso; ?></textarea>
                          </div>
                      </div>
                      <?php
                       }
                       }
                      ?>
                  </div><!-- fin row-->
                  <div>
                      <h5>Información de Receta</h5>
                  </div>
                  <hr color="blue"> 
                  <div class="row">
                    <?php //Consulta que trae los medicamentos y examenes recetados del paciente
                       $consulta = "SELECT rec.CODIGO_CONSULTA, GROUP_CONCAT('/ ',med.NOMBRE_MEDICAMENTO) as medicamentos, GROUP_CONCAT('/ ',rec.INDICACIONES_RECETA) as indicaciones, GROUP_CONCAT('/ ',exa.EXAMEN_MEDICO) as examenes, GROUP_CONCAT('/ ',exap.INDICACIONES) as indicaciones_examen
                       FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est, tbl_consulta_medica con, tbl_receta_medica rec, tbl_medicamento med, tbl_examenes_medicos exa, tbl_examenes_pacientes exap
                       WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                       AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                       AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                       AND con.CODIGO_CITA = i.CODIGO_CITA
                       AND con.CODIGO_CONSULTA = rec.CODIGO_CONSULTA
                       AND rec.CODIGO_MEDICAMENTO = med.CODIGO_MEDICAMENTO
                       AND exap.CODIGO_CONSULTA = con.CODIGO_CONSULTA
                       AND exap.CODIGO_EXAMEN_MEDICO = exa.CODIGO_EXAMEN_MEDICO
                       AND es.CODIGO_PERSONA = '$cod_usuario'
                       AND i.CODIGO_ESTADO = '12' 
                       AND  i.AREA_CITA = '2'
                       AND con.CODIGO_CITA = '$codigo_cita' 
                       AND rec.CODIGO_CONSULTA = '$codigo_consulta'
                       AND i.FECHA_CITA = CURDATE(); ";
                       $resul=$conn->query($consulta);
                    ?>
                      <?php
                       if ($resul->num_rows > 0) {
                         while($row = $resul->fetch_assoc()) { 
                         $medicamentos = $row['medicamentos'];
                         $indicaciones = $row['indicaciones'];
                         $examenes = $row['examenes'];
                         $indicaciones_examen = $row['indicaciones_examen'];
                         //Estas son variables establecidas con sus datos
                         $medicamento = 'Nombre medicamento(s)';
                         $examen = 'Nombre examen(es)';
                        ?> 
                        <!--Codigo para mostrar los medicamentos en el expediente-->
                        <?php 
                          if($medicamentos == '' && $indicaciones == '') {
                            $ninguno = 'Ninguno';
                        ?>
                        <div class="col-sm-3 mb-3">
                            <label class="form-label">Medicamentos Recetados</label>
                            <div class="form-group">
                              <textarea  readonly class="form-control"><?php echo $ninguno;  ?></textarea>
                            </div>
                        </div>
                        <div class="col-sm-3 mb-3">
                            <label  class="form-label">Indicaciones Medicamentos</label>
                            <div class="form-group">
                                <textarea  readonly class="form-control" ><?php echo $ninguno;?></textarea>
                            </div>
                        </div>
                         <?php
                          }else{
                        ?>
                        <div class="col-sm-3 mb-3">
                            <label class="form-label">Medicamentos Recetados</label>
                            <div class="form-group">
                                <textarea  readonly class="form-control"><?php echo $medicamento.': '.$medicamentos;  ?></textarea>
                            </div>
                        </div>
                        <div  class="col-sm-3 mb-3">
                            <label class="form-label">Indicaciones Medicamentos</label>
                            <div class="form-group">
                                <textarea  readonly class="form-control" ><?php echo $indicaciones;?></textarea>
                           </div>
                        </div>
                        <?php
                             }
                        ?>
                        <!--fin deCodigo para mostrar los medicamentos en el expediente-->
                        <!--Inicio de Codigo para mostrar los examenes en el expediente-->
                        <?php
                        if($examenes == '' && $indicaciones_examen == ''){
                            $ninguno = 'Ninguno';
                        ?>
                        <div class="col-sm-3 mb-3">
                            <label class="form-label">Examenes Recetados</label>
                            <div class="form-group">
                                <textarea  readonly class="form-control"><?php echo $ninguno;  ?></textarea>
                            </div>
                        </div>
                        <div class="col-sm-3 mb-3">
                            <label class="form-label">Indicaciones Examnes</label>
                            <div class="form-group">
                                <textarea  readonly class="form-control" ><?php echo $ninguno;?></textarea>
                            </div>
                        </div>
                        <?php
                            }else{ 
                         ?>
                        <div class="col-sm-3 mb-3">
                            <label class="form-label">Examenes Eecetados</label>
                            <div class="form-group">
                                <textarea  readonly class="form-control"><?php echo $examen.': '.$examenes;  ?></textarea>
                            </div>
                        </div>
                        <div class="col-sm-3 mb-3">
                            <label class="form-label">Indicaciones Examenes</label>
                            <div class="form-group">
                                 <textarea  readonly class="form-control" ><?php echo $indicaciones_examen;?></textarea>
                            </div>
                        </div>
                        <?php
                         }
                        ?>
                        <?php
                          }
                          }
                        ?>
                  </div><a >
                  <button type="submit"  id="" name="FINALIZAR_EXPEDIENTE" class="btn btn-success"><span><i class="nav-icon fas fa-save mx-1"></i></span>Finalizar Consulta</button>
                  
                    <form method="POST"  action="Vistas/reporte_medico.php" target="_blank"> 
                     <input type="hidden" name="persona" value="<?php echo $persona?>">
                     <input type="hidden" name="codigo_cita" value="<?php echo $codigo_cita?>">
                     <input type="hidden" name="consulta" value="<?php echo $codigo_consulta?>">
                     <button  onclick="Descargar1()" type="submit" id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger "> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte Consulta</button>
                     <button  onclick="Descargar2()" type="submit"   style="color:white; background-color:#FA0079"class="btn btn-danger "> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte Recetas</button>
                    </form>
                  </a>
                </form>
                </div><!--fin card body -->
            </div><!-- FINAL cad genera -->
        </div><!-- FINAL CONTAINER FLUID --> 
    </section><!-- FINAL SECTION -->


<script>// Codigo para descargar los reportes en pdf :3 ,el otro codigo de abajo no lo hice asi que no toquen :)
    function Descargar1() {
      window.open('Vistas/reporte_medico.php','_blank');
      window.open(this.href,'_self');
    }
    function Descargar2() {
      window.open('Reportes_Prosecar/reporteRecetas.php','_blank');
      window.open(this.href,'_self');
    }
</script>





 <!--funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
 <script>
 var isSubmitting = false
$(document).ready(function () {
    $('#form').submit(function(){
        isSubmitting = true
    })
    $('#form').data('initial-state', $('#form').serialize());
    $(window).on('beforeunload', function() {
        if (!isSubmitting && $('#form').serialize() != $('#form').data('initial-state')){
            return 'You have unsaved changes which will not be saved.'
        }
    });
})
function window_mouseout( obj, evt, fn ) {
if ( obj.addEventListener ) {
    obj.addEventListener( evt, fn, false );
}
else if ( obj.attachEvent ) {
    obj.attachEvent( 'on' + evt, fn );
}
}
window_mouseout( document, 'mouseout', event => {
event = event ? event : window.event;
var from = event.relatedTarget || event.toElement;
// Si quieres que solo salga una vez el mensaje borra lo comentado
// y así se guarda en localStorage
// let leftWindow   = localStorage.getItem( 'leftWindow' ) || false;

if (  !leftWindow  &&  (!from || from.nodeName === 'HTML') ) {
    // Haz lo que quieras aquí
    alert( '!Estas a punto de salir!' );
    // localStorage.setItem( 'leftWindow', true );
}
} );
  </script>
  <!--fin de la funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
</body>


