<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
include "conexionpdo.php";
?>
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

<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><!--Para que funcione el selecrt2 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> 
</head>

<body oncopy="return false" onpaste="return false">
 <div class="content-wrapper">
   <div class="content-header">
      <div class="container-fluid">
      </div> <!-- container-fluid -->
   </div> <!-- content-header-->
        <section class="content-header text-xl-center mb-3 btn-light"> 
          <h4> CONSULTA PSICOLOGICA PROSECAR<i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
    <section class="content">
      <div class="card">
        <div class="card-header" style="background-color:#B3F2FF;">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Consultas en espera</a>
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
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Lista de pacientes</a>
            </li>
          </ul>
        </div><!--CARD HEADER-->
        <div class="card-body">
        <form method="POST"  class=" needs-validation" novalidate id="form">
            <div style="background:#E4F8F3" class="pt-2 pb-2 px-2">
               <strong class="form-check-label pt-2 pb-2 px-2" >Datos paciente</strong>
            </div>
            <hr> 
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
                    </div> <!--COL MD 6-->
                    <div class="col-md-3">
                      <label for="" class="control-label">Codigo consulta</label> 
                        <div class="form-group">
                          <input readonly class="form-control" name="codigo_consulta"value="<?php echo $codigocon;?>">
                          <input  hidden name="codigo_cita" value="<?php echo $codigocita;?>">
                        </div>
                    </div> <!--COL MD 3-->
                       <?php
                          }
                          }
                        ?>
               </div> <!--ROW-->
               <hr>
            <div class="row">
                      <div class="col-md-6">
                         <label for="" class="control-label">Actividades</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="600"  name="Actividades" id="Actividades"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin de ACTIVIDADES -->
                        <div class="col-md-6">
                         <label for="" class="control-label">Tecnicas</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="300"  name="tecnicas" id="Actividades"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.                         
                              </div>
                            </div>
                        </div><!--fin  DE TECNICAS -->
            </div> <!--ROW  2 -->
              <div class="row">
                <div class="col-md-6">
                  <label for="" class="control-label">Materiales</label> 
                    <div class="form-group">
                    <textarea class="form-control" type="text" maxlength="600"  name="Materiales" id="Materiales"  autocomplete = "off" required ></textarea>
                    <div class="invalid-feedback">
                          campo obligatorio.
                      </div>
                    </div> 
                </div> <!--fin de MATERIALES --> 
                <div class="col-md-6">
                    <label for="" class="control-label">Tareas</label> 
                    <div class="form-group">
                    <textarea class="form-control" type="text" maxlength="600"  name="Tareas" id="Tareas"  autocomplete = "off" required ></textarea>
                    <div class="invalid-feedback">
                          campo obligatorio. 
                      </div>
                    </div> 
                </div> <!--fin de TAREAS -->                 
              </div> <!--ROW  3 -->
             <div class="row">
             <div class="col-md-6">
              <label for="" class="control-label">Resultados</label> 
                <div class="form-group">
                <textarea class="form-control" type="text" maxlength="600"  name="Resultados" id="Resultados"  autocomplete = "off" required ></textarea>
                <div class="invalid-feedback">
                      campo obligatorio.
                </div>  
                </div>
            </div> <!--COL MD 6-->
            <div class="col-md-6">
             <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>      
             <button type="submit"  id="" name="GUARDAR_PLAN" class="btn btn-info btn mb-3"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar plan</button>
             <button style="color:#ffff;" type="submit"   name="cancelar_plan" class="btn btn-danger  mb-3"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cancelar</button>
            </div> <!--COL MD 6-->
            </div>  <!--ROW  4 -->
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
              if ($resultadocon->num_rows > 0) {
              while($row = $resultadocon->fetch_assoc()) { 
              $codigocon = $row['CODIGO_CONSULTA'];
              $codigocita = $row['CODIGO_CITA'];
              $nombrecon = $row['PACIENTE'];
              ?>
                <input  hidden name="codigo_cita" value="<?php echo $codigocita;?>">
              <?php
              }
              }
              ?>
        </form>
        </div>  <!--CARD BODY-->
      </div> <!--CARD-->
    </section>
 </div><!-- content-wrapper-->    
</body> 
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

let leftWindow   = localStorage.getItem( 'leftWindow' ) || false;

if (!leftWindow  && (!from || from.nodeName === 'HTML') ) {

    // Haz lo que quieras aquí
    alert( '!Estas a punto de salir!' );
     localStorage.setItem( 'leftWindow', true );
}
} );
  
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

    function Descargar() {
      window.open('Reportes_Prosecar/reporteplanterapeutica.php','_blank');
      window.open(this.href,'_self');
    }
</script>
