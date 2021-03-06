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

<body oncopy="return false" onpaste="return false">
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">
        <section class="content-header text-xl-center mb-3 btn-light"> 
          <h4> Registro de Expediente Espiritual  <i></i></h4>
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
         <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Citas en Espera</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="#">Registrar Expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consulta Espiritual</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de Consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Lista de Personas</a>
            </li>
          </ul>
          </div><!--FIN DEL CARD HEADER -->
           <div class="card-body"><!--Cuerpo del card body principal -->
             <form method="POST" class="needs-validation" novalidate id="form">
                    <strong>Datos Generales de Expediente</strong>
                    <hr>
                    <div class= "row"> 
                        <div  class="col-sm-8">
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

                        // AND i.FECHA_CITA = CURDATE();";

                        $query2 = "SELECT i.CODIGO_CITA, i.CODIGO_PERSONA, CONCAT_WS (' ',DNI,pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO,pe.SEGUNDO_APELLIDO) AS PACIENTE, i.FECHA_CITA, i.HORARIO, est.NOMBRE as nombre_estado
                        FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est
                                                                WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                                                AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                                                AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                                                AND es.CODIGO_PERSONA = '$cod_usuario'
                                                                AND i.CODIGO_ESTADO = '11' 
                                                                and  i.AREA_CITA = '4'
                                                                AND i.FECHA_CITA = CURDATE()
                      
                        ;";
                       
                        $resul2=$conn->query($query2);                
                        ?>
                        
                                <?php 
                                    if ($resul2->num_rows > 0) {
                                    while($row2 = $resul2->fetch_assoc()) { 
                                    $codigo2 = $row2['CODIGO_PERSONA'];
                                    $nombre2 = $row2['PACIENTE'];
                                    ?>
                                     <label for="" class="control-label">Persona</label> 
                          <div class="form-group">
                            <input  readonly class="form-control" value="<?php echo $nombre2;?>">
                            <input  hidden name="codigo_paciente_expediente_espiritual" value="<?php echo $codigo2;?>">
                          </div>
                                <?php 
                                } 
                                }
                                ?>
                               
                        </div><!--fin del paciente -->

                       

                        <div class="col-sm-4">
                         <label for="nombre_iglesia" class="control-label">Nombre de iglesia a la que asiste:</label> 
                            <div class="form-group">
                            <input class="form-control" type="text" name="nombre_iglesia" id="nombre_iglesia" minlength="5" maxlength="50" autocomplete = "off" required>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->
                    </div> <!--fin del row -->
                    </br>
                   
                    <br>
                    <div class="row">
                     
                    <div class="col-sm-4">
                         <label for="grupo_iglesia" class="control-label">??Est?? involucrado en alg??n grupo de la iglesia? </label> 
                            <div class="form-group">
                            <input class="form-control" type="text" name="grupo_iglesia" id="grupo_iglesia" minlength="2" maxlength="50" placeholder="Escriba el nombre del grupo" autocomplete = "off" required>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->
                      <!-- End: checkbox -->
                      <div class="col-sm-4">
                         <label for="tiempo_iglesia" class="control-label">??Hace cu??nto tiempo asiste a la iglesia</label> 
                            <div class="form-group">
                            <input class="form-control" type="text" name="tiempo_iglesia" id="tiempo_iglesia" minlength="2" maxlength="50" placeholder="Ejemplo: desde hace 1 a??o" autocomplete= "off" required>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->

                        <div class="col-sm-4">
                         <label for="motivacion_iglesia" class="control-label">??Qu?? le motiva a estar involucrado en la iglesia?</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" onkeypress="return soloLetrasComa(event);"  name="motivacion_iglesia" id="motivacion_iglesia" autocomplete= "off" required></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->
                     
                    </div><!--div del row -->  
                    <hr><br>
                    <!--Sacramentos realizados por el estudiante-->
                        <div class="row mb-3 pl-3">
                           <h5>Sacramentos realizados</h5> 
                        </div>

                    <div class="row mb-5 pl-3">
                        <?php //
                        $query = "SELECT GROUP_CONCAT(sac.NOMBRE) AS sacramentos
                        FROM tbl_sacramento sac, tbl_estudiante es, tbl_sacramento_estudiante se
                        WHERE es.CODIGO_ESTUDIANTE = se.CODIGO_ESTUDIANTE
                        AND   se.CODIGO_SACRAMENTO = sac.CODIGO_SACRAMENTO
                        AND   se.CODIGO_ESTUDIANTE = '$codigo2';";
                        $resultSacramentos=$conn->query($query); 

                        ?>
                        <?php 
                            if ($resultSacramentos->num_rows > 0) {
                            while($row2 = $resultSacramentos->fetch_assoc()) { 
                            $nombre_sacramentos = $row2['sacramentos'];
                            ?>
                        <div class="col-sm-10 order-2 pl-2">
                        <input  readonly class="form-control" value="<?php echo $nombre_sacramentos;?>">                       
                        </div>
                        <?php 
                                } 
                                }
                                ?>
                    </div> 

                 </br></br>
                <button type="submit"  id="" name="registrar_expediente_espiritual" class="btn btn-info btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar</button>
             </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
</div>
</div>
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
// y as?? se guarda en localStorage

// let leftWindow   = localStorage.getItem( 'leftWindow' ) || false;

if ( /* !leftWindow  && */ (!from || from.nodeName === 'HTML') ) {

    // Haz lo que quieras aqu??
    alert( '!Estas a punto de salir!' );
    // localStorage.setItem( 'leftWindow', true );
}
} );
  </script>
  <!--fin de la funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
</body>





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
<script>
      function soloLetrasComa(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " ??????????abcdefghijklmn??opqrstuvwxyz ,.";
       especiales = ["8-37-39-46"];
       tecla_especial = false
       for(var i in especiales){
        if(key == especiales[i]){
          tecla_especial = true;
          break;
        }
      }
      if(letras.indexOf(tecla)==-1 && !tecla_especial){
        return false;
      }
    }
  </script>
