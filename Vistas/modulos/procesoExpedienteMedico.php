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
        <section class="content-header text-xl-center mb-3 "> 
          <h4>Registro Expediente Médico<i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Personas Consulta Médica</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="#">Registrar Expediente</a>
            </li>

            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consulta Médica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Recetas Médicas</a>
            </li>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de Consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Lista de Pacientes</a>
            </li>
          </ul>
          </div><!--FIN DEL CARD HEADER -->
           <div class="card-body"><!--Cuerpo del card body principal -->
             <form method="POST" class="needs-validation" novalidate id="form">
                    <H5>Datos Generales del Expediente</H5>
                    <hr color="blue">
                    <div class= "row"> 
                        <div  class="col-sm-4">
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

                        $query2 = "SELECT i.CODIGO_CITA, i.CODIGO_PERSONA, CONCAT_WS (' ',DNI,pe.PRIMER_NOMBRE, ' ',pe.SEGUNDO_NOMBRE,' ',pe.PRIMER_APELLIDO) AS PACIENTE, i.FECHA_CITA, i.HORARIO, est.NOMBRE as nombre_estado
                        FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est
                                                                WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                                                AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                                                AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                                                AND es.CODIGO_PERSONA = '$cod_usuario'
                                                                AND i.CODIGO_ESTADO = '15' 
                                                                and  i.AREA_CITA = '2'
                                                                AND i.FECHA_CITA = CURDATE();";
                       
                        $resul2=$conn->query($query2);                
                        ?>
                        
                                <?php 
                                    if ($resul2->num_rows > 0) {
                                    while($row2 = $resul2->fetch_assoc()) { 
                                    $codigo2 = $row2['CODIGO_PERSONA'];
                                    $nombre2 = $row2['PACIENTE'];
                                    ?>
                                 <label for="" class="control-label">Nombre delPaciente</label> 
                          <div class="form-group">
                            <input  readonly class="form-control" value="<?php echo $nombre2;?>">
                            <input  hidden name="codigo_paciente_expediente" value="<?php echo $codigo2;?>">
                          </div>
                                <?php 
                                } 
                                }
                                ?>
                             
                        </div><!--fin del paciente -->

                        <div  class="col-sm-2">
                            <?php 
                            $queryTipo = "SELECT CODIGO_TIPO_SANGRE ,TIPO from tbl_tipo_sangre ";
                            $resultadotipo=$conn->query($queryTipo);                
                            ?>
                          <label for="" class="control-label">Tipo Sangre</label> 
                           <div class="form-group">
                             <select class="form-control select2" tyle="width: 100%;"  name ="tipo_sangre"> 
                                <option selected >--Seleccione tipo--</option>
                                <?php 
                                    if ($resultadotipo->num_rows > 0) {
                                    while($rowtipo = $resultadotipo->fetch_assoc()) { 
                                    $codigo_tipo = $rowtipo['CODIGO_TIPO_SANGRE'];
                                    $tipo_sangre= $rowtipo['TIPO'];
                                    ?>
                                <option value="<?php echo $codigo_tipo; ?>" ><?php echo $tipo_sangre;?></option>
                                <?php 
                                } 
                                }
                                ?>
                                 <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                             </select>
                            
                            </div>
                        </div><!--fin del tipo sangre -->

                        <div class="col-sm-3">
                         <label for="" class="control-label">Tratamientos que Toma Actualmente</label> 
                            <div class="form-group">
                            <textarea onkeypress="return soloLetrasnumeros(event)" class="form-control" type="textarea" name="tratamientos"></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->

                        <div  class="col-sm-3">
                          <label for="" class="control-label">¿Padece de alguna enfermedad?</label> 
                            <div class="form-group">
                            <textarea class="form-control" onkeypress="return soloLetrasnumeros(event)" type="textarea" name="enfermedades"  autocomplete = "off" ></textarea>
                            </div>
                        </div><!--fin del la estatura -->


                    </div> <!--fin del row -->
                    </br>
                    <h5>Otros Datos del Paciente</h5>
                    <hr color="blue">
                    <br>
                    <div class="row">
                     
                  <div class="col-md-3">
                       <div class="card">
                          <div class="card-header" style="background-color:#DFD4FE;">
                             <strong>Alergias</strong>
                          </div>
                       <div class="card-body">
                        <?php 
                          $queryALE = "SELECT CODIGO_ALERGIAS,NOMBRE from tbl_alergias ";
                          $resultadodALE=$conn->query($queryALE);                
                          ?>
                          <?php 
                          if ($resultadodALE->num_rows > 0) {
                            while($rowALE = $resultadodALE->fetch_assoc()) { 
                            $codigoALE = $rowALE['CODIGO_ALERGIAS'];
                            $nombreALE= $rowALE['NOMBRE'];
                          ?>
                        <div  class="form-check icheck-green" >
                            <input  class="form-check-input" type="checkbox" name="alergia[]" id="alergia<?php echo $codigoALE;?>" value="<?php echo $codigoALE;?>">
                            <label class="form-check-label" for="alergia<?php echo $codigoALE;?>">
                              <?php echo $nombreALE;?>
                            </label>
                            </br>
                            
                          </div>
                          <?php 
                          } 
                          }
                          ?>
                         </div>
                         </div>
                  </div>
                      <!-- End: checkbox -->
                      <div class="col-md-3">
                        <div class="card">
                            <div class="card-header" style="background-color:#DFD4FE;">
                              <strong>Transtornos Sistemas Corporales</strong>
                            </div>
                        <div class="card-body">
                        
                            <?php 
                                $query = "SELECT CODIGO_TRANSTORNO ,TIPO from `TBL_TRANSTORNOS_CORPORALES` ";
                                $resultadod=$conn->query($query);                
                                ?>
                                <?php 
                                if ($resultadod->num_rows > 0) {
                                while($row = $resultadod->fetch_assoc()) { 
                                $codigo = $row['CODIGO_TRANSTORNO'];
                                $nombre= $row['TIPO'];
                                ?>
                            <div  class="form-check icheck-pink" >
                                <input  class="form-check-input" type="checkbox" name="transtornos[]" id="transtornos<?php echo $codigo;?>" value="<?php echo $codigo;?>">
                                <label class="form-check-label" for="transtornos<?php echo $codigo;?>">
                                    <?php echo $nombre;?>
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


                      <div class="col-md-3">
                        <div class="card">
                            <div class="card-header" style="background-color:#DFD4FE;">
                              <strong>Apariencia Física</strong>
                            </div>
                        <div class="card-body">
                        
                            <?php 
                                $query1 = "SELECT CODIGO_APARIENCIA ,TIPO from TBL_APARIENCIA_FISICA  ";
                                $resultadod1=$conn->query($query1);                
                                ?>
                                <?php 
                                if ($resultadod1->num_rows > 0) {
                                while($row1 = $resultadod1->fetch_assoc()) { 
                                $codigo1 = $row1['CODIGO_APARIENCIA'];
                                $nombre1= $row1['TIPO'];
                                ?>
                            <div  class="form-check icheck-pink" >
                                <input  class="form-check-input" type="checkbox" name="apariencia[]" id="apariencia<?php echo $codigo1;?>" value="<?php echo $codigo1;?>">
                                <label class="form-check-label" for="apariencia<?php echo $codigo1;?>">
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

 <!--funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
 <script>
function soloLetrasnumeros(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = "áéíóúabcdefghijklmnñopqrstuvwxyz,. 0123456789";
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
if (  !leftWindow  &&  (!from || from.nodeName === 'HTML') ) {
    alert( '!Estas a punto de salir!' );
    // localStorage.setItem( 'leftWindow', true );
}
} );
  </script>
  <!--fin de la funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
</body>



  <script>
(function() {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
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

