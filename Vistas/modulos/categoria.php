<?php

  include_once "conexionpdo.php";
  include_once "conexion3.php";
  
  /*$codigoObjeto=13;
  $accion='Ingreso a la tabla de registro de personas';
  $descripcion= 'Usuario se autentifico';
  bitacora($codigoObjeto, $accion,$descripcion); */

?>
<head>
 <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><!--Para que funcione el selecrt2 -->
 <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> 
 <script src="../../js/funcionesAgregarPersonas.js"></script>
  <style type="text/css">
    /* ESTILOS PARA OCULTAR LOS INPUTS DE FORM DE REGISTRAR USUARIO*/
    #form_usuario{
      display:none;
      background-color: #0CCDE3;
    }
    #primera_fila{
      display:none;
    }
    #cuarta_fila{
      display:none;
    }
    #quinta_fila{
      display:none;
    }
    .bh{
     background-color: #11DECC;
      
    }
  </style>
</head>
<body oncopy="return false" onpaste="return false">
<div class="content-wrapper">
    <div class="content-header">
      <div class="container-fluid">
      </div>
    </div>
    <!-- Main content -->
    <section class="content">
    <div class="container-fluid">
      <section class="content-header text-xl-center mb-3 btn-light">
          <h1>
              <h4>AGREGAR PERSONAS</h4>
          </h1>     
      </section>
     <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
          <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="crudpersonas">Ver datos personas</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="ediusuarios">Ver datos usuarios</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="categoria">Agregar personas/usuarios</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
      <div class="container-fluid">
        <div class="row"><!-- COLUMNA PRINCIPAL -->
          <div class="col-md-12"> <!-- COLUMNA DE REGISTRO DE PERSONAS -->
            <div class="card card-primary ">
               <form method="POST" class="needs-validation" novalidate id="form">
                  <div class="card-body">
                    <div class="card-header "> <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                      <h2 class="card-title"> <strong>Datos Generales persona</strong></h2>
                    </div></br>
                    <!-- DATOS PERSONALES -->
                    <div class="row">
                      <div class="col-md-4"> <!--INICIO DNI-->
                        <label  class="control-label">Número de Identidad:</label> 
                        <div class="form-group">
                          <input onkeypress="return solonumeros(event);" class="form-control" type="text" maxlength="13" minlength="13" name="identidad" id="identidad" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);"  placeholder="Ej: 0801199716227" required="" >
                          <div class="invalid-feedback">
                              campo obligatorio.
                          </div>                     
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO 1er NOMBRE-->
                        <label  class="control-label">Primer Nombre:</label> 
                        <div class="form-group">
                          <input  id="pri_nombre" class="form-control" type="text" maxlength="13" minlength="3" name="primer_nombre"  onKeyDown="sinespacio(this);" onkeypress="return soloLetras(event);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return letrascaracter(event);" onkeyup="mayus(this);" required="">
                          <div class="invalid-feedback">
                             campo obligatorio.
                          </div>  
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO er NOMBRE-->
                        <label  class="control-label">Segundo Nombre:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="3" name="segundo_nombre" id="seg_nombre" onKeyDown="sinespacio(this);" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" > 
                        </div>
                      </div>
                    </div><!--Fin de una fila -->
                    <div class="row">
                      <div class="col-md-4"><!--INICIO 1er APELLIDO-->
                        <label  class="control-label">Pimer Apellido:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="4" name="primer_apellido" id="pri_apellido" onKeyDown="sinespacio(this);" required="" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" required="">
                          <div class="invalid-feedback">
                              campo obligatorio.
                          </div> 
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO 2er APELLIDO-->
                        <label  class="control-label">Segundo Apellido:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="4" name="segundo_apellido" id="seg_apellido" onKeyDown="sinespacio(this);" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" > 
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO FECHA NACIMIENTO-->
                        <label  class="control-label">Fecha Nacimiento:</label> 
                        <div class="form-group">
                          <input class="form-control" type="date"  name="fecha_nacimiento" max="2010-01-01" min="1950-01-01" required=""  >
                          <div class="invalid-feedback">
                            campo obligatorio.
                          </div> 
                        </div>
                      </div>
                    </div><!--Fin de otra fila :v -->

                    <div class="row">
                      <div class="col-md-4"><!--INICIO lugar de NACIMIENTO-->
                        <label  class="control-label">Lugar Nacimiento:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" id="lugar" placeholder="lugar nacimiento" name="lugar_nacimiento" onkeyup="mayus(this);" autocomplete = "off" required="">
                          <div class="invalid-feedback">
                             campo obligatorio.
                          </div> 
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO TIPO PERSONA-->
                      <?php 
                      $query = "SELECT * FROM `tbl_tipo_persona` WHERE CODIGO_TIPO_PERSONA <> 3 AND NOMBRE <> 'no definido';";
                      $resultadod=$conn->query($query);                
                      ?>
                         <label for="cbx_persona" class="control-label">Tipo Persona:</label>
                         <div class="form-group">
                            <select class="form-control"   style="width: 100%;" name="tipo_persona" id="tipo_persona" required >
                             <option selected enable  value="">--Seleccionar tipo Persona--</option>
                              <?php 
                                if ($resultadod->num_rows > 0) {
                                  while($row = $resultadod->fetch_assoc()) { 
                                  $codigo = $row['CODIGO_TIPO_PERSONA'];
                                  $nombre= $row['NOMBRE'];
                                ?>
                              <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                              <?php 
                              } 
                              }
                              ?>
                            </select>
                            <div class="invalid-feedback">
                                 Eliga una opción.
                             </div>
                         </div>
                      </div>
                      <div class="col-md-4"><!--INICIO SEXO--> 
                       <?php
                        $query = "SELECT CODIGO_SEXO, SEXO FROM TBL_SEXO;";
                        $resultado=$conn->query($query);
                       ?>
                         <label for="cbx_persona" class="control-label">Sexo:</label>
                         <div class="form-group">
                            <select class="form-control"   style="width: 100%;" name="sexo" id="TIPOPERSONA" required="">
                              <option selected disabled value="">--Seleccionar Sexo--</option>
                              <?php 
                                if ($resultado->num_rows > 0) {
                                while($row = $resultado->fetch_assoc()) { 
                                $codigo = $row['CODIGO_SEXO'];
                                $sexo = $row['SEXO'];
                                ?>
                                <option value="<?php echo $codigo?>" ><?php echo $sexo;?></option>
                                <?php 
                                 } 
                                 }
                                ?>
                            </select>
                            <div class="invalid-feedback">
                                Elija una opción.
                            </div>
                         </div>
                      </div>
                    </div><!--Fin de otra fila :v -->

                    <div class="row">
                      <div class="col-md-4"><!--telefono-->
                      <label for="" class="control-label">Telefono:</label> 
                        <div class="input-group">
                          <input class="form-control" type="text" autocomplete = "off" onkeypress="return telfono(event,this);" minlength="8" maxlength="8" id="telefono"  name="telefono"   onblur="quitarespacios(this);"  required="">
                          <div class="invalid-feedback">
                              campo obligatorio.
                          </div>
                          <div class="input-group-prepend">
                            <button  type="button"  class="btn btn-primary btn-md"><span onclick="MostrarTelefono();"  > <i class="nav-icon fa fa-plus mx-1"></i></span></button>
                          </div>
                        </div>
                      </div>
                      <div  style ="display:none;" id="telefono2" class="col-md-4"><!--INICIO FECHA DE BAJA-->
                        <label  class="control-label">Otro Telefono:</label> 
                        <div class="form-group">
                         <input class="form-control" type="text" minlength="8" maxlength="8"  name="otro_telefono"  onKeyDown="sinespacio(this);" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" >
                        </div>
                      </div>

                      <div class="col-md-4"><!--CORREO ELECTRONICO-->
                        <label  class="control-label">Correo Electrónico:</label> 
                        <div class="form-group">
                          <input class="form-control" type="email" maxlength="50"  id="correo" name="correo" autocomplete = "off"  onKeyDown="sinespacio(this);"  required=""  >
                          <div class="invalid-feedback">
                              campo obligatorio.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de otra fila :v -->
                    <div class="row"> 
                      <div class="col-md-12"><!--INICIO DIRECCION--> 
                        <label  class="control-label">Dirección:</label> <!--INICIO DIRECCION-->
                        <div class="form-group">
                          <textarea class="form-control" type="text" name="direccion"   id="direccion" onkeyup="mayus(this);"  onkeypress="" placeholder="Ingrese Direccion" required="" ></textarea>
                          <div class="invalid-feedback">
                              campo obligatorio.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de otra row -->
                    <div  style ="display:none;" id="titulo" class="card-header" id="form_estudiante">
                       <h2 class="card-title"> <strong>Agregar Sacramentos Estudiante</strong></h2>
                    </div><br>
                    <div class="row">
                      <div style ="display:none;" id="sacramentos" class="col-md-12">
                          <?php 
                          $query = "SELECT CODIGO_SACRAMENTO,NOMBRE from tbl_sacramento ";
                          $resultado=$conn->query($query);                
                          ?>
                          <?php 
                          if ($resultado->num_rows > 0) {
                          while($row = $resultado->fetch_assoc()) { 
                          $codigo = $row['CODIGO_SACRAMENTO'];
                          $nombre= $row['NOMBRE'];
                          ?>
                        <div class="icheck-yellow d-inline">
                        <input class="form-check mx-2" type="checkbox" name="sacramento[]" id="sacramento<?php echo $codigo;?>" value="<?php echo $codigo;?>">
                          <label class="form-check-label mx-2"  for="sacramento<?php echo $codigo;?>">
                            <?php echo $nombre;?>
                          </label>
                        </div>
                          <?php 
                            } 
                            }
                          ?>
                      </div>
                    </div><!--fin row -->
                   

                    <div class="card-header" id="form_usuario">
                       <h2 class="card-title"> <strong>Registrar Usuario</strong></h2>
                    </div><br>
                    <div  class="row"> 
                      <div class="col-md-4" id="primera_fila"><!--INICIO NOMBRE USUARIO-->
                        <label  class="control-label">Nombre Usuario</label>
                        <div class="form-group">
                            <input class="form-control" maxlength="15" minlength="4" onKeyDown="sinespacio(this);" type="text" name="nombre_usuario" id="nombre_usuario" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" type="text" 
                            onblur="quitarespacios(this);" placeholder="Nombre Usuario" >
                           
                        </div>
                      </div>
                    <div  class="col-sm-4 mb-2" id="cuarta_fila">
                      <label  class="control-label">Contraseña</label>
                      <div class="input-group mb-3">
                        <input class="form-control"  minlength="8" maxlength="15" onKeyDown="sinespacio(this);" type="password" id="contrasena" name="contrasena" >
                        <div class="input-group-append">
                          <button id="show_password" class="form-control btn btn-info btn-sm btn-block" onclick="mostrar1()" type="button" onKeyDown="sinespacio(this);"><span class="icon1 fa fa-eye-slash"></button></span>
                        </div>
                      </div>  
                    </div>                                   
                      
                      <div style ="display:none;"  class="col-md-4" id="especialidad_psico"><!--especialidad psicologia-->
                        <?php 
                        $query = " SELECT * FROM  tbl_especialidad WHERE CODIGO_AREA = 3;";
                        $resultadod=$conn->query($query);                
                        ?>
                         <label for="cbx_persona" class="control-label">Tipo Especialidad Psicologia:</label>
                         <div class="form-group">
                            <select class="form-control select2" style="width: 100%;" name="psicologo" >
                             <option selected disabled value="" >--Seleccionar tipo--</option>
                              <?php 
                                if ($resultadod->num_rows > 0) {
                                  while($row = $resultadod->fetch_assoc()) { 
                                  $codigo = $row['CODIGO_ESPECIALIDAD'];
                                  $nombre= $row['NOMBRE'];
                                ?>
                              <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                              <?php 
                              } 
                              }
                              ?>
                            </select>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                          </div>
                         </div>
                      </div>

                      <div  style ="display:none;" class="col-md-4" id="especialidad_medico"><!--especialidad medico-->
                        <?php 
                        $query = " SELECT * FROM  tbl_especialidad WHERE CODIGO_AREA = 2;";
                        $resultadod=$conn->query($query);                
                        ?>
                         <label for="cbx_persona" class="control-label">Tipo Especialidad Medico:</label>
                         <div class="form-group">
                            <select class="form-control select2"   style="width: 100%;" name="medico" >
                             <option selected disabled value="" >--Seleccionar tipo--</option>
                              <?php 
                                if ($resultadod->num_rows > 0) {
                                  while($row = $resultadod->fetch_assoc()) { 
                                  $codigo = $row['CODIGO_ESPECIALIDAD'];
                                  $nombre= $row['NOMBRE'];
                                ?>
                              <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                              <?php 
                              } 
                              }
                              ?>
                            </select>
                         </div>
                      </div>
                      <div  style ="display:none;" class="col-md-4" id="catequistas"><!--catequistas-->
                        <?php 
                        $query = " SELECT * FROM  tbl_especialidad WHERE CODIGO_AREA = 4;";
                        $resultadod=$conn->query($query);                
                        ?>
                         <label for="cbx_persona" class="control-label">Catequistas:</label>
                         <div class="form-group">
                            <select class="form-control select2"   style="width: 100%;" name="catequista">
                             <option selected enable value="" >--Seleccionar Catequesis--</option>
                              <?php 
                                if ($resultadod->num_rows > 0) {
                                  while($row = $resultadod->fetch_assoc()) { 
                                  $codigo = $row['CODIGO_ESPECIALIDAD'];
                                  $nombre= $row['NOMBRE'];
                                ?>
                              <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                              <?php 
                              } 
                              }
                              ?>
                            </select>
                         </div>
                      </div>
                    </div><!--Fin de otra fila :v -->
                                      
                    <button type="submit"  id="GUARDARPERSONA" name="GUARDAR" class="btn btn-success btn-lg mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                    </br> 
                  </div><!--Fin del card body del form -->
               </form> <!-- Final del form de registar persona -->
            </div>
          </div><!-- FIN DE LA COLUMNA DE REGISTRO DE PERSONAS y DE USUARIOS  -->
        </div><!-- COLUMNA PRINCIPAL -->
        </div>
        </div>
      </div>
    </div>
   
    </section> <!-- Fin del section principal -->
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
let leftWindow   = localStorage.getItem( 'leftWindow' ) || false;

} );
  </script>
  <!--fin de la funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
</body>

<script> //previene que se deje la tecla como loca pulsada
  var texto=document.getElementById('identidad');
  texto.addEventListener('keydown', function(keyboardEvent) {
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
  });
  var pri_nom=document.getElementById('pri_nombre');
  pri_nom.addEventListener('keydown', function(keyboardEvent) {
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
  });
  var seg_nom=document.getElementById('seg_nombre');
  seg_nom.addEventListener('keydown', function(keyboardEvent) {
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
  });
  var telefono =document.getElementById('telefono');
  telefono.addEventListener('keydown', function(keyboardEvent) {
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
  });
  var pri_ape =document.getElementById('pri_apellido');
  pri_ape.addEventListener('keydown', function(keyboardEvent) {
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
  });
  var seg_ape =document.getElementById('seg_apellido');
  seg_ape.addEventListener('keydown', function(keyboardEvent) {
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
  });
</script>




<!--funciones de mostrar y no imputs como contraseña y telefono -->
<script type="text/javascript">
  function mostrar1(){//funcion que muestra la contraseña :)
  var cambio1 = document.getElementById("contrasena");
  if(cambio1.type == "password"){
      cambio1.type = "text";
  $('.icon1').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
  }else{
      cambio1.type = "password";
  $('.icon1').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
  }        
  }
</script>
 <script>
   function MostrarTelefono(){
    let x = document.getElementById('telefono2');
    if(x.style.display === "none" ){
      x.style.display = "block";
    }else{
      x.style.display = "none";
    }
   }
 </script>

 <script type="text/javascript">//para validar que solo ingrese un numero al inicio 8,93
    function telfono(evt,input){
        var key = window.Event ? evt.which : evt.keyCode;   
        var chark = String.fromCharCode(key);
        var tempValue = input.value+chark;
        var isNumber = (key >= 48 && key <= 57);
        var isSpecial = (key == 8 || key == 13 || key == 0 ||  key == 46);
        if(isNumber || isSpecial){
            return filter(tempValue);
        }        
        return false;    
    }
    function filter(__val__){
        var preg = /^([9,3,8]{1}[0-9]{0,7})$/; 
        return (preg.test(__val__) === true);
    }
</script>


<script type="text/javascript">
  //FUNCIONES PARA MOSTRAR LOS CAMPOS DE USUARIOS (Se puede optimizar,pero hata implementacion)
 $( function() {
    $("#tipo_persona").change( function() {//tutor administrador y enfermero
        if ($(this).val() === "1" || $(this).val() === "2"  || $(this).val() === "9"  ) {
          document.getElementById('titulo').style.display = "none";
           document.getElementById('sacramentos').style.display = "none";

          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('form_usuario').style.display = "block";
          document.getElementById('primera_fila').style.display = "block";
          document.getElementById('cuarta_fila').style.display = "block";
        } else if ($(this).val() === "4" ){//estudiante
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('form_usuario').style.display = "none";
          document.getElementById('primera_fila').style.display = "none";
           document.getElementById('cuarta_fila').style.display = "none";
           document.getElementById('titulo').style.display = "block";
           document.getElementById('sacramentos').style.display = "block";
        }else if ($(this).val() === "7"){ //es para un familiar
          document.getElementById('titulo').style.display = "none";
           document.getElementById('sacramentos').style.display = "none";
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('form_usuario').style.display = "none";
          document.getElementById('primera_fila').style.display = "none";
          document.getElementById('cuarta_fila').style.display = "none";

        }else if($(this).val() ===  "5" ){//para medico
          document.getElementById('titulo').style.display = "none";
           document.getElementById('sacramentos').style.display = "none";
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('especialidad_medico').style.display = "block";
          document.getElementById('form_usuario').style.display = "block";
          document.getElementById('primera_fila').style.display = "block";
          document.getElementById('cuarta_fila').style.display = "block";

        }else if($(this).val() ===  "6" ){// para psicologo
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('sacramentos').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('especialidad_psico').style.display = "block";
          document.getElementById('form_usuario').style.display = "block";
          document.getElementById('primera_fila').style.display = "block";
          document.getElementById('cuarta_fila').style.display = "block";
          
        }else if($(this).val() ===  "8"){//para catequista
          document.getElementById('titulo').style.display = "none";
           document.getElementById('sacramentos').style.display = "none";
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('catequistas').style.display = "block";
          document.getElementById('form_usuario').style.display = "block";
          document.getElementById('primera_fila').style.display = "block";
          document.getElementById('cuarta_fila').style.display = "block";
          
        }
    });
  }); 
</script>
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
  //Toda la pantalla elaborada por Diana Rut ,lo que este medio desastre,yo no lo hice : )
</script>

