<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once  "conexionpdo.php";
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
          <h4> Registrar Preclínica <i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Citas Medicas</a>
            </li>
            <li class="nav-item" disabled="disabled">
            <a class="nav-link active" style="color:#000000;" href="#">Preclínica</a>
            </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
           <div class="card-body"><!--Cuerpo del card body principal -->
             <form method="POST" class=" needs-validation" novalidate id="form">
                    </br>
                    <H5>Datos Generales Paciente Preclínica</H5>
                    <hr COLOR="blue"> <br>
                    <div class= "row"> 
                       <div  class="col-sm-6 mb-3">
                          <?php 
                           $query = "SELECT c.CODIGO_CITA as CODIGO, CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
                           as PACIENTE  from tbl_inscripcion_cita c ,tbl_persona p
                           where p.CODIGO_PERSONA = c.CODIGO_PERSONA
                           AND c.CODIGO_ESTADO = '10'";
                           $resul=$conn->query($query);                
                           ?>  
                              <?php 
                                   if ($resul->num_rows > 0) {
                                   while($row = $resul->fetch_assoc()) { 
                                    $codigo = $row['CODIGO'];
                                    $nombre_pa = $row['PACIENTE'];
                              ?>              
                          <label for="" class="control-label"> Nombre del Paciente</label> 
                          <div class="form-group">
                            <input  readonly class="form-control" value="<?php echo $nombre_pa;?>">
                            <input  hidden name="codigo_paciente" value="<?php echo $codigo;?>">
                          </div>
                          <?php
                          }
                          }
                          ?>
                        </div><!--fin del paciente -->

                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Peso</label> 
                          <div class="input-group ">
                            <input  required pattern="[.,0-9]{2,6}" onKeyDown="sinespacio(this);" onkeyup="noespacio(this, event);" onkeypress="return soloLetrasnumeros(event);" minlength="2" maxlength="6"  type="text" class="form-control" autocomplete = "off" placeholder=" Ej: 130.5 " name="peso" >
                            <div class="input-group-append">
                              <span class="input-group-text">Lb</span>
                            </div>
                             <div class="invalid-feedback">
                                 Llene este campo.
                              </div>
                          </div>
                        </div>

                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Estatura</label> 
                          <div class="input-group ">
                            <input required pattern="[.,0-9]{4,4}" type="text" onKeyDown="sinespacio(this);" onkeyup="noespacio(this, event);" onkeypress="return soloLetrasnumeros(event);" placeholder=" Ej:1.82" minlength="4"  maxlength="4" autocomplete = "off" required class="form-control"  name="estatura" required >
                            <div class="input-group-append">
                              <span class="input-group-text">M</span>
                            </div>
                            <div class="invalid-feedback">
                              Llene este campo.
                            </div>
                          </div>
                        </div>  
                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Temperatura</label> 
                          <div class="input-group ">
                            <input  required pattern="[.,0-9]{2,5}" type="text" onKeyDown="sinespacio(this);" onkeyup="noespacio(this, event);" onkeypress="return soloLetrasnumeros(event);" minlength="2" maxlength="5" placeholder=" Ej:37.2"  autocomplete = "off" required class="form-control"  name="temperatura" required>
                            <div class="input-group-append">
                              <span class="input-group-text">°C</span>
                            </div>
                              <div class="invalid-feedback">
                                 Llene este campo.
                              </div>
                          </div>
                        </div>  
                    </div> <!--fin del row -->
                    <div class="row">
                      <div  class="col-sm-4 mb-3">
                          <div class="form-group">
                            <label for="" class="control-label">Estatus de Desnutrición</label>
                            <select class="form-control " required name="desnutricion" required> 
                             <option  value="">--Seleccione--</option>
                              <option  value="No tiene">No tiene</option>
                              <option   value="Moderado">Moderado</option>
                              <option  value="Grave">Grave</option>
                            </select>
                            <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                          </div>
                        </div>
                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Presión Arterial</label> 
                          <div class="input-group ">
                            <input required pattern="[/,0-9]{2,5}"  type="text"  onKeyDown="sinespacio(this);" onkeyup="noespacio(this, event);"  minlength="2" maxlength="5"  name="FC" onkeypress="return letranumero(event);" placeholder=" Ej: 70/80"  autocomplete = "off" required class="form-control" required>
                            <div class="input-group-append">
                              <span class="input-group-text">mm Hg</span>
                            </div>
                            <div class="invalid-feedback">
                              Llene este campo.
                              </div>
                          </div>
                        </div> 
                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Nivel Respiración</label> 
                          <div class="input-group ">
                            <input required pattern="[0-9]{2,2}"  type="text" onKeyDown="sinespacio(this);" onkeyup="noespacio(this, event);"  onkeypress="return solonumeros(event);" minlength="2" maxlength="2" name="FR" placeholder="Ej: 12"  autocomplete = "off" required class="form-control" required>
                            <div class="input-group-append">
                              <span class="input-group-text">FR</span>
                            </div>
                            <div class="invalid-feedback">
                              Llene este campo.
                            </div>
                          </div>
                        </div>                 
                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Pulso</label> 
                          <div class="input-group ">
                            <input required pattern="[0-9]{2,3}"  type="text" onKeyDown="sinespacio(this);" onkeyup="noespacio(this, event);"  onkeypress="return solonumeros(event);" minlength="2" maxlength="3" name="pulso" placeholder=" Ej:70"  autocomplete = "off" required class="form-control" required>
                            <div class="input-group-append">
                              <span class="input-group-text">lpm</span>
                            </div>
                            <div class="invalid-feedback">
                              Llene este campo.
                              </div>
                          </div>
                        </div> 
                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Índice Masa Corporal</label> 
                          <div class="input-group ">
                            <input required pattern="[.,0-9]{2,5}"   onKeyDown="sinespacio(this);" onkeyup="noespacio(this, event);" type="text" minlength="2"  maxlength="5" onkeypress="return soloLetrasnumeros(event);"  name="masa_corporal" placeholder=" Ej:18.5"  autocomplete = "off" required class="form-control" required>
                            <div class="input-group-append">
                              <span class="input-group-text">IMC</span>
                            </div>
                            <div class="invalid-feedback">
                              Llene este campo.
                              </div>
                          </div>
                        </div> 
                    </div><!--fin row -->
                    <br>
                 </br></br>
                <button type="submit"  id="" name="Guardar_PreClinica" class="btn btn-info btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar Preclínica</button>
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
} );
  </script>
  <!--fin de la funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
</body>

<script language="javascript">
  function noespacio(campo, event) {
    CadenaaReemplazar = " ";
    CadenaReemplazo = "";
    CadenaTexto = campo.value;
    CadenaTextoNueva = CadenaTexto.split(CadenaaReemplazar).join(CadenaReemplazo);
    campo.value = CadenaTextoNueva;
  }
</script>

<script>
 function soloLetrasnumeros(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = ". 0123456789";
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

 function letranumero(e){ // es solo para el campo que acepte diagonla ,osea esto / ,si eso
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = "/ 0123456789";
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
    (function () { 
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
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
</script>

