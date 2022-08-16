<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
 include "conexionpdo.php";
?>
<head>
<script languaje="javascript">
                                        function verificar_uno(){
                                        var suma = 0;
                                        var checks = document.getElementsByName('alergia[]');
                                        for (var i = 0, j = checks.length; i < j; i++) {
                                            if(checks[i].checked == true){
                                            suma++;
                                            }
                                        }
                                        
                                        if(suma == 0){
                                            alert('Debes seleccionar un registro');
                                            return false;
                                        }
                                        
                                        }
                                        
                                      </script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><!--Para que funcione el selecrt2 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> 

</head>

<body oncopy="return true" onpaste="return true">
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
          <br>
          <div class="alert alert" style="border-color:blue">
              <h3 class="text-center"> Paso <i class="bi bi-2-circle"></i><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-2-circle" viewBox="0 0 16 16">
                <path d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM6.646 6.24v.07H5.375v-.064c0-1.213.879-2.402 2.637-2.402 1.582 0 2.613.949 2.613 2.215 0 1.002-.6 1.667-1.287 2.43l-.096.107-1.974 2.22v.077h3.498V12H5.422v-.832l2.97-3.293c.434-.475.903-1.008.903-1.705 0-.744-.557-1.236-1.313-1.236-.843 0-1.336.615-1.336 1.306Z"/>
              </svg>
              </h3>
            </div>
           <div class="card-body"><!--Cuerpo del card body principal -->
             <form method="POST" class="needs-validation" novalidate id="form" >
                    <H5>Datos Generales del Expediente</H5>
                    <hr color="blue">
                    <div class= "row"> 
                        <div  class="col-sm-6">
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
                                    
                                 <label for="" class="control-label">Nombre del Paciente</label> 
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
                            $queryTipo = "SELECT CODIGO_TIPO_SANGRE ,TIPO, CODIGO_ESTADO from tbl_tipo_sangre ";
                            $resultadotipo=$conn->query($queryTipo);                
                            ?>
                            <button  data-toggle="modal"  href="#AGREGAR_TIPOSANGRE" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-1"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span></button>
                          <label for="" class="control-label">Tipo de Sangre</label> 
                           <div class="form-group">
                             <select class="form-control select2" tyle="width: 100%;"  name ="tipo_sangre"required> 
                                <option selected enable  value="">-- Seleccione --</option>
                                <?php 
                                    if ($resultadotipo->num_rows > 0) {
                                      while($rowtipo = $resultadotipo->fetch_assoc()) { 
                                        $codigo_tipo = $rowtipo['CODIGO_TIPO_SANGRE'];
                                        $tipo_sangre= $rowtipo['TIPO'];
                                        $estado=$rowtipo['CODIGO_ESTADO']
                                        ?>
                                        <?php 
                                        if ($estado==2) {
                                          ?>
                                            <option value="<?php echo $codigo_tipo; ?>" ><?php echo $tipo_sangre;?></option>
                                          <?php 
                                        }
                                      } 
                                      
                                    }
                                  ?></select>
                                 <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                             
                            
                            </div>
                        </div><!--fin del tipo sangre -->
                           </br>                   
                        <div class="col-sm-6">
                        
                         <label for="" class="control-label">Tratamientos que Toma Actualmente</label> 
                            <div class="form-group">
                            <textarea minlength="5" maxlength="150"onkeyup="mayus(this);"  onkeypress="return soloLetrasnumeros(event)" onkeyup="this.value=this.value.replace(/^\s+/,'');"  class="form-control" type="textarea" name="tratamientos" onblur="quitarespacios(this);" required></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                            
                        </div><!--fin del peso -->

                        <div  class="col-sm-6">
                          <label for="" class="control-label">¿Padece de Alguna Enfermedad?</label> 
                            <div class="form-group">
                            <textarea class="form-control"minlength="5" maxlength="150"onkeyup="mayus(this);" onkeypress="return soloLetrasnumeros(event)" onkeyup="this.value=this.value.replace(/^\s+/,'');"  type="textarea" name="enfermedades"  autocomplete = "off" onblur="quitarespacios(this);" required></textarea>
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
                          <div class="card-header text-center" style="background-color:#DFD4FE;">
                          <button  data-toggle="modal"  href="#AGREGAR_ALERGIA" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-1"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span></button>
                          <strong>Alergias</strong>
                          </div>
                       <div class="card-body">
                        <?php 
                          $queryALE = "SELECT CODIGO_ALERGIAS,NOMBRE,CODIGO_ESTADO from tbl_alergias ";
                          $resultadodALE=$conn->query($queryALE);                
                          ?>
                          <?php 
                            if ($resultadodALE->num_rows > 0) {
                              while($rowALE = $resultadodALE->fetch_assoc()) { 
                                $codigoALE = $rowALE['CODIGO_ALERGIAS'];
                                $nombreALE= $rowALE['NOMBRE'];
                                $estad2=$rowALE['CODIGO_ESTADO']
                         ?>
                                  <?php 
                                  
                                  if ($estad2==2) {
                                    ?>
                                      <div  class="form-check icheck-pink" >
                                      <input  class="form-check-input" type="checkbox" name="alergia[]" id="alergia<?php echo $codigoALE;?>" value="<?php echo $codigoALE;?>" >
                                      <label class="form-check-label" for="alergia<?php echo $codigoALE;?>"> <?php echo $nombreALE;?></label>
                                      </br>
                                    </div> 
                                      <?php 
                                  }
                              } 
                          }
                          ?>
                         </div>
                         </div>
                  </div>
                      <!-- End: checkbox -->
                      <div class="col-md-4">
                        <div class="card">
                            <div class="card-header text-center" style="background-color:#DFD4FE;">
                            <button  data-toggle="modal"  href="#AGREGAR_NOPATOLOGIA" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-1"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span></button>
                            <strong>Trastornos Sistemas Corporales</strong>
                            </div>
                        <div class="card-body">
                        
                            <?php 
                                $query = "SELECT CODIGO_TRANSTORNO ,TIPO,CODIGO_ESTADO from `TBL_TRANSTORNOS_CORPORALES` ";
                                $resultadod=$conn->query($query);                
                            ?>
                                <?php 
                                  if ($resultadod->num_rows > 0) {
                                    while($row = $resultadod->fetch_assoc()) { 
                                      $codigo = $row['CODIGO_TRANSTORNO'];
                                      $nombre= $row['TIPO'];
                                      $estado3=$row['CODIGO_ESTADO'];
                                ?>
                                      <?php 
                                      if ($estado3==2) {
                                        ?>
                                          <div  class="form-check icheck-pink" >
                                            <input  class="form-check-input" type="checkbox" name="transtornos[]" id="transtornos<?php echo $codigo;?>" value="<?php echo $codigo;?>">
                                            <label class="form-check-label" for="transtornos<?php echo $codigo;?>"><?php echo $nombre;?> </label>
                                            </br>
                                          </div>
                                        <?php 
                                      }
                                    } 
                                  }
                                ?>
                      </div><!--fin otros antecedentes--> 
                      </div>
                      </div>


                      <div class="col-md-3">
                        <div class="card">
                            <div class="card-header text-center" style="background-color:#DFD4FE;">
                            <button  data-toggle="modal"  href="#AGREGAR" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-1"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span></button>  
                            <strong>Apariencia Física</strong>
                            </div>
                        <div class="card-body">
                        
                            <?php 
                                $query1 = "SELECT CODIGO_APARIENCIA ,TIPO,CODIGO_ESTADO from TBL_APARIENCIA_FISICA  ";
                                $resultadod1=$conn->query($query1);                
                                ?>
                                <?php 
                                  if ($resultadod1->num_rows > 0) {
                                    while($row1 = $resultadod1->fetch_assoc()) { 
                                      $codigo1 = $row1['CODIGO_APARIENCIA'];
                                      $nombre1= $row1['TIPO'];
                                      $estado4=$row1['CODIGO_ESTADO']
                                      ?>
                                      <?php 
                                      if ($estado4==2) {
                                        ?>
                                          <div  class="form-check icheck-pink" >
                                            <input  class="form-check-input" type="checkbox" name="apariencia[]" id="apariencia<?php echo $codigo1;?>" value="<?php echo $codigo1;?>">
                                            <label class="form-check-label" for="apariencia<?php echo $codigo1;?>">
                                            <?php echo $nombre1;?></label>
                                            </br>
                                          </div>
                                        <?php
                                      }
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
 <!--INICIO DEL MODAL DE AGREGAR UN NUEVo TIPO DE SANGRE -->
 <div id="AGREGAR_TIPOSANGRE" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Tipo de Sangre</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_pregunta">Tipo de Sangre</label>
                                    <input  type="text"  onkeyup="mayus(this);" class="form-control" pattern=".{6,8}"  maxlength="8" oninput="this.value = this.value.replace(/[^a-z,A-Z-,+ ]/,'')" onkeyup="this.value=this.value.replace(/^\s+/,'');" autocomplete = "off" type="text" name="tiposangre" id="sangretipo"onblur="quitarespacios(this);" required>
                                    <div class="invalid-feedback">
                                       Campo Obligatorio.
                                   </div>
                                </div>
                            </div>
                            
                          
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_tiposangre" name="agregar_tiposangre" class="btn btn-success" ><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO TIPO DE SANGRE -->
     <!--INICIO DEL MODAL DE AGREGAR UNA NUEVA ALERGIA -->
     <div id="AGREGAR_ALERGIA" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form  method="POST"  class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Alergia</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Nombre Alergia</label>
                                    <input  type="text"  class="form-control" pattern=".{6,35}"maxlength="35"onkeyup="mayus(this);" onkeypress="return soloLetras(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');" autocomplete = "off" type="text" placeholder="Ingrese un tipo de alergia" name="nombre_alergia" onblur="quitarespacios(this);" required>
                                     <div class="invalid-feedback">
                                       Campo Obligatorio.
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Descripción Alergia</label>
                                    <input  type="text"   class="form-control"  pattern=".{6,100}"maxlength="100"onkeyup="mayus(this);" onkeypress="return soloLetrasnumeros(event)" onkeyup="this.value=this.value.replace(/^\s+/,'');" autocomplete = "off" type="text"  placeholder="Ingrese una descripción de la alergia" name="descripcion_alergia" onblur="quitarespacios(this);" required>
                                    <div class="invalid-feedback">
                                       Campo Obligatorio.
                                   </div>
                                </div>
                            </div>
                            
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="AGREGAR_ALERGIAS" name="AGREGAR_ALERGIAS" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVA ALERGIA--> 
    <!--INICIO DEL MODAL DE AGREGAR UN NUEVO TRASNTORNO -->
  <div id="AGREGAR_NOPATOLOGIA" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                      <h4 class="text-center">Agregar Trastorno</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Tipo</label>
                                    <input  type="text"  class="form-control"  pattern=".{5,50}" maxlength="50"onkeyup="mayus(this);" onkeypress="return soloLetras(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');" autocomplete = "off" type="text" name="agregar_tipo" onblur="quitarespacios(this);" required>
                                    <div class="invalid-feedback">
                                     Campo obligatorio.
                                   </div>

                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                     
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_patologia" name="agregar_patologia" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO TRANSTORNO -->
   <!--INICIO DEL MODAL DE AGREGAR UN NUEVA APARIENCIA FISICA -->
  <div id="AGREGAR" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITARMODA" method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Apariencia Física</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                          <div class="col-sm-12">
                              <div class="form-group">
                                  <label >Nombre Apariencia Física</label>
                                    <input  type="text"  class="form-control"  pattern=".{5,50}" maxlength="50" onkeyup="mayus(this);" onkeypress="return soloLetras(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');"  autocomplete = "off" type="text" placeholder="Ingrese la apariencia fisica" name="apariencia" id="apariencia" onblur="quitarespacios(this);" required="">
                                <div class="invalid-feedback">
                                  Campo obligatorio.
                                </div>
                          </div> 
                          
                    </div><!--FINAL DEL CARD BODY --> 
                    </div>                      
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="nuevo" name="nuevo" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR APARIENCIA FISICA --> 
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
<script>
function validar_checkbox() {
   // Obtener hijos dentro de etiqueta <div>
   var cont = document.getElementsByClassName('form-check');
   var i = 0;
   var al_menos_uno = false;
   //Recorrido de checkbox's
   while (i < cont.length) {
      // Verifica si el elemento es un checkbox
      if (cont[i].tagName == 'INPUT' && cont[i].type == 'checkbox') {
         // Verifica si esta checked
         if (cont[i].checked) {
               al_menos_uno = true;
         }
      }
      i++
    }                 
    //Valida si al menos un checkbox es checked
    if (!al_menos_uno) {
        alert('Seleccione al menos uno');
        if (e.preventDefault) {
            e.preventDefault();
        } else {
          e.returnValue = false;
        }
    }
}
</script>
<script>
    
    //funcion para poner mayusculas
  function mayus(e) {
    e.value = e.value.toUpperCase();
  }
  </script>
