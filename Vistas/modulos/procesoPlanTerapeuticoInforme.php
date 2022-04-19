<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once 'conexionpdo.php';
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
                <h4> EXPEDIENTE PSICOLOGICO PACIENTE <i class="nav-icon fas fa-stethoscope"></i></h4>
            </section>
            <div class="card">
                <div class="card-header" style="background-color:#B3F2FF;">
                <ul class="nav nav-tabs card-header-tabs">
         <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Consultas en espera</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Registrar expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consultas Psicologicas</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Planes terapeuticos</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Informe de plan</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Lista de pacientes</a>
            </li>
          </ul>
                </div><!--FIN DEL CARD HEADER -->
                <div class="card-body"><!--Cuerpo del card body principal -->

                <form method="POST"id="form">
               

                <div style="background:#E4F8F3" class="pt-2 pb-2 px-2">
                      <h5>Datos de paciente</h5>
                  </div>
                  <hr> 
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
                          <label for="" class="control-label">Paciente</label> 
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
                  <div  style="background:#E4F8F3" class="pt-2 pb-2 px-2">
                     <h5>Informacion de consulta</h5> 
                  </div>
                  <hr> 

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
                         <label  class="form-label">Observaciones</label>
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
                 
                  <hr>
                  <div  style="background:#E4F8F3" class="pt-2 pb-2 px-2">
                     <h5>Informacion de plan terapéutico</h5> 
                  </div>
                  <hr> 
                    
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
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Actividades</label>
                          <div class="form-group">
                             <textarea  type="textarea" readonly class="form-control" ><?php echo $actividad;?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Tecnicas</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $tecnica ; ?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Materiales</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $materiales; ?></textarea>
                          </div>
                      </div>
                      <div  class="col-sm-3 mb-3">
                         <label  class="form-label">Tareas</label>
                          <div class="form-group">
                             <textarea  readonly class="form-control" ><?php echo $tareas; ?></textarea>
                          </div>
                      </div>

                    </div><!-- fin row-->

                    <div class="row">
                      <div  class="col-sm-3 mb-3">
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
               <button style="color:#ffff;" type="submit"   name="FINALIZAR_EXPEDIENTE_PSICOLOGICO" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Finalizar consulta</button>

                </form>

                 <!--form para el reporte de la consulta-->
                 <a> 
                  <form action="Reportes_Prosecar/reporteConsultaPlanTerapeutico.php" method="POST"> 
                  <div class="row"> 
                    <input hidden name="codigo_cita_reporte_Plan" value="<?php echo $codigo_cita;?>">  
                    <input type="text" name="id_persona_plan"  hidden value="<?php echo $persona ?>">
                    <input type="hidden" name="id_usuario_plan" value="<?php echo $cod_usuario ?>">
                    <input type="hidden" name="codigo_consulta_reporte_Plan" value="<?php echo $codigo_consulta ?>">
                  </div>
                      <button  type="submit" name ="reporte_consulta_psicologica_plan"  style="color:white; background-color:#FA0079"class="btn btn-danger btn mx-1 mb-3 "> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
                  </form>

                </a>
                <!--fin form para el reporte de la consulta-->
                </div><!--fin card body -->
            </div><!-- FINAL cad genera -->
        </div><!-- FINAL CONTAINER FLUID --> 
    </section><!-- FINAL SECTION -->

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

var from         = event.relatedTarget || event.toElement;

// Si quieres que solo salga una vez el mensaje borra lo comentado
// y así se guarda en localStorage

// let leftWindow   = localStorage.getItem( 'leftWindow' ) || false;

if ( /* !leftWindow  && */ (!from || from.nodeName === 'HTML') ) {

    // Haz lo que quieras aquí
    alert( '!Estas a punto de salir!' );
    // localStorage.setItem( 'leftWindow', true );
}
} );
  </script>
  <!--fin de la funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
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

