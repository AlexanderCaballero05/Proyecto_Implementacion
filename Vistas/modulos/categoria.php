<!-----------------------------------------------------------------------
	Universidad Nacional Autonoma de Honduras (UNAH)
	  	Facultad de Ciencias Economicas
	Departamento de Informatica administrativa
     Analisis, Programacion y Evaluacion de Sistemas
             Segundo periodo 2022
Equipo:
Diana Rut .......... (drgarciaa@unah.hn)

Catedratico:
Lic. Karla Melisa Garcia Pineda 
---------------------------------------------------------------------
Programa:         Pantalla de registro de personas/usuarios
Fecha:             01-jan-2016
Programador:       Diana Rut Garcia
descripcion:       Registra las diferentes personas y usuarios involucradas al sistema
-----------------------------------------------------------------------
Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion
Diana Rut               27/05/2022            Se agregaron parametos que faltaban
Diana Rut               31/05/2022            Se agrego mas campos en el area de familiar y se quitaron campos de estudiante
Diana Rut               07/05/2022            Se validaron los campos de contraseña y nombre de usuario que sean los tamaños requeridos
----------------------------------------------------------------------->
<?php
 include "conexionpdo.php";
?>
<?php
  include_once "conexion3.php";
  $codigoObjeto=13;
  $accion='INGRESO A LA PANTALLA REGISTRO DE PERSONAS';
  $descripcion= 'USUARIO SE AUTENTIFICO';
  bitacora($codigoObjeto, $accion,$descripcion); 
?>
<?php
  // Parametro de minimo nombre usuario
  $min_usuario = "MIN_USUARIO";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($min_usuario));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor1 = $row;
  }
  ?>
  <?php
  //Parametro de maximo nombre usuario
  $max_usuario = "MAX_USUARIO";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($max_usuario));
  $row1=$sentencia1->fetchColumn();
  if($row1>0){
    $valor2 = $row1;
  }
?>
<?php
 //Parametro de maximo de contraseña
  $parametro ="NUM_MAX_CARACTER";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($parametro));
  $row3=$sentencia->fetchColumn();
  if($row3>0){
    $valor3 = $row3;
  }
?>
<?php
 //Parametro minimo de contraseña
  $parametro1 ="NUM_MIN_CARACTER";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($parametro1));
  $row4 = $sentencia1->fetchColumn();
  if($row4>0){
    $valor4 = $row4;
  }
?>
<head>
 <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><!--Para que funcione el selecrt2 -->
 <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> 
 <script src="../../js/funcionesAgregarPersonas.js"></script>
  <style type="text/css">
    /* ESTILOS PARA OCULTAR LOS INPUTS DE FORM DE REGISTRAR USUARIO*/

    .bh{
     background-color: #11DECC;
    }
  </style>
</head>
<body oncopy="return false" onpaste="return false">
<div class="content-wrapper">
    <div class="content-header">
    </div>
    <!-- Main content -->
    <section class="content">
    <div class="container-fluid">
      <div class="content-header text-xl-center mb-3 ">
          <h4>Agregar Personas/Usuarios</h4>
      </div>
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
               <form method="POST" class="needs-validation" novalidate id="form" enctype="multipart/form-data">
                  <div class="card-body">
                    <div class="card-header "> <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                      <h2 class="card-title"> Datos Generales persona</h2>
                    </div></br>
                    <!-- DATOS PERSONALES -->
                    <div class="row">
                      <div class="col-md-4"> <!--INICIO DNI-->
                        <label  class="control-label">Número de Identidad:</label> 
                        <div class="form-group">
                          <input required pattern="[0-9]{13,13}" onkeyup="noespacio(this, event);" onkeypress="return solonumeros(event);" class="form-control" type="text" maxlength="13" minlength="13" name="identidad" id="identidad" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);"  placeholder="Ej: 0801199716227" required="" >
                          <div class="invalid-feedback">
                              Campo obligatorio,requerido 13 caracteres.
                          </div>                     
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO 1er NOMBRE-->
                        <label  class="control-label">Primer Nombre:</label> 
                        <div class="form-group">
                          <input  id="pri_nombre" class="form-control" onkeyup="noespacio(this, event);mayus(this)" required pattern="[A-Z]{3,20}" type="text" maxlength="20" minlength="3" name="primer_nombre"  onKeyDown="sinespacio(this);" onkeypress="return soloLetras(event);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return letrascaracter(event);">
                          <div class="invalid-feedback">
                             Campo obligatorio.
                          </div>  
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO er NOMBRE-->
                        <label  class="control-label">Segundo Nombre:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text"   maxlength="20" minlength="3" name="segundo_nombre" id="seg_nombre" onKeyDown="sinespacio(this);" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" > 
                        </div>
                      </div>
                    </div><!--Fin de una fila -->
                    <div class="row">
                      <div class="col-md-4"><!--INICIO 1er APELLIDO-->
                        <label  class="control-label">Pimer Apellido:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" required pattern="[A-Z]{3,20}"  maxlength="20" minlength="4" name="primer_apellido" id="pri_apellido" onKeyDown="sinespacio(this);" required="" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" required="">
                          <div class="invalid-feedback">
                              Campo obligatorio.
                          </div> 
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO 2er APELLIDO-->
                        <label  class="control-label">Segundo Apellido:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text"  pattern="[A-Z]{3,20}"  maxlength="20" minlength="4" name="segundo_apellido" id="seg_apellido" onKeyDown="sinespacio(this);" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" > 
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO FECHA NACIMIENTO-->
                        <label  class="control-label">Fecha Nacimiento:</label> 
                        <div class="form-group">
                          <input class="form-control" type="date"  name="fecha_nacimiento" max="2010-01-01" min="1950-01-01" required  >
                          <div class="invalid-feedback">
                            Campo obligatorio.
                          </div> 
                        </div>
                      </div>
                    </div><!--Fin de otra fila :v -->

                    <div class="row">
                      <div class="col-md-4"><!--INICIO lugar de NACIMIENTO-->
                        <label  class="control-label">Lugar Nacimiento:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" id="lugar" maxlength="30" minlength="4"   name="lugar_nacimiento" onkeyup="mayus(this);"  onkeypress="return soloLetras(event);" autocomplete = "off" >
                          <div class="invalid-feedback">
                             Campo obligatorio.
                          </div> 
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO TIPO PERSONA-->
                      <?php 
                      $query = "SELECT * FROM `tbl_tipo_persona` WHERE CODIGO_TIPO_PERSONA <> 3 AND NOMBRE <> 'no definido';";
                      $resultadod=$conn->query($query);                
                      ?>
                         <label class="control-label">Tipo Persona:</label>
                         <div class="form-group">
                            <select class="form-control select2"   style="width: 100%;" name="tipo_persona" id="tipo_persona" required >
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
                         <label class="control-label">Sexo:</label>
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
                      <label class="control-label">Telefono:</label> 
                        <div class="input-group">
                          <input class="form-control" type="text" autocomplete = "off" onkeypress="return telfono(event,this);" required pattern="[0-9]{8,8}" title="Tamaño minimo de 8" maxlength="8" minlength="8" id="telefono"  name="telefono"   onblur="quitarespacios(this);" >
                          <div class="invalid-feedback">
                              Campo obligatorio valor minimo 8 caracteres .
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4"><!--CORREO ELECTRONICO-->
                        <label  class="control-label">Correo Electrónico:</label> 
                        <div class="form-group">
                          <input class="form-control" type="email" onkeyup="noespacio(this, event);" maxlength="50"  id="correo" name="correo" autocomplete = "off"  onKeyDown="sinespacio(this);"  required  >
                          <div class="invalid-feedback">
                              Campo obligatorio.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de otra fila :v -->
                    <div class="row"> 
                      <div class="col-md-12"><!--INICIO DIRECCION--> 
                        <label  class="control-label">Dirección:</label> <!--INICIO DIRECCION-->
                        <div class="form-group">
                          <textarea  maxlength="500" minlength="4" required pattern="[A-Z,0-9]{4,500}" class="form-control" type="text" name="direccion"   id="direccion" onkeyup="mayus(this);"  ></textarea>
                          <div class="invalid-feedback">
                              Campo obligatorio.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de otra row -->
                    <div style ="display:none;" id="familiares">
                      <h2 class="card-title"> Datos de familiares</h2><br><hr>
                      <div class="row"><!--Para agregar campos adicionales al familiar -->
                        <div class="col-md-3">
                          <label class="form-label">Estado civil</label>
                          <div class="form-group">
                            <input name ="estado_civil" onkeypress="return soloLetras(event);" maxlength="20" minlength="3" onkeyup="mayus(this);" placeholder="Eje: Soltero" autocomplete = "off" type="text" minlength="5" maxlength="" class="form-control">
                          </div>
                        </div>
                        <div class="col-md-3">
                          <label class="form-label">Nivel educativo</label>
                          <div class="form-group">
                            <input name ="nivel_educativo" onkeypress="return soloLetras(event);" maxlength="15" minlength="3"onkeyup="mayus(this);" placeholder="Eje: Secundaria" autocomplete = "off" type="text" minlength="5" maxlength="" class="form-control">
                            <div class="invalid-feedback">
                              Campo obligatorio.
                          </div>
                          </div>
                          
                        </div>
                        <div class="col-md-3">
                          <label class="form-label">Ingresos mensuales</label>
                          <div class="form-group">
                            <input name ="ingresos" autocomplete = "off" placeholder="Eje:5000" onkeyup="mayus(this);" onkeypress="return solonumeros(event);" type="text" minlength="3" maxlength="5" class="form-control">
                          </div>
                        </div>
                        <div class="col-md-3">
                          <label class="form-label">Iglesia que asiste</label>
                          <div class="form-group">
                            <input name ="iglesia" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" maxlength="50" minlength="5" autocomplete = "off"  type="text" minlength="5" maxlength="" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div>
                    </br>
                    <div style ="display:none;" id="usuarios"><!--Contiene los datos de usuario como los adicioneles de especialidades y los oculta -->
                       <h2 class="card-title">Registrar Usuario</h2><br><hr>
                      <div class="row"> 
                        <div class="col-md-4" ><!--INICIO NOMBRE USUARIO-->
                          <label  class="control-label">Nombre Usuario</label>
                          <div class="form-group">
                              <input class="form-control" required pattern="[A-Z]{3,20}"  minlength="<?php echo $valor1;?>" maxlength="<?php echo $valor2;?>" onKeyDown="sinespacio(this);" type="text" name="nombre_usuario" id="nombre_usuario" onkeypress="return soloLetras(event);" onkeyup="noespacio(this, event);mayus(this)" autocomplete = "off" type="text" 
                              onblur="quitarespacios(this);" placeholder="Nombre Usuario">
                          </div>
                          <div class="invalid-feedback">
                            Debe teber minimo <?php echo $valor1; ?> caracteres.
                          </div>
                        </div>
                        <div  class="col-sm-4 mb-2" >
                         <label  class="control-label">Contraseña</label>
                         <div class="input-group mb-3">
                           <input class="form-control"  required pattern="[A-Z,1-9,a-z,@$!%*?&]{<?php echo $valor4;?>,<?php echo $valor3;?>}"; minlength="<?php echo $valor4;?>"  maxlength="<?php echo $valor3?>" onKeyDown="sinespacio(this);" onkeyup="noespacio(this, event);" type="password" id="contrasena" name="contrasena" >
                             <div class="input-group-append">
                               <button id="show_password" class="form-control btn btn-info btn-sm btn-block" onclick="mostrar1()" type="button" onKeyDown="sinespacio(this);"><span class="icon1 fa fa-eye-slash"></button></span>
                             </div>
                          </div> 
                           <FONT SIZE=2>*Debe teber minimo <?php echo $valor4; ?> caracteres, numeros, mayusculas minusculas.</FONT>
                        </div>
                                                   
                       <div style ="display:none;"  class="col-md-4" id="especialidad_psico"><!--especialidad psicologia-->
                        <?php 
                        $query = " SELECT * FROM  tbl_especialidad WHERE CODIGO_AREA = 3;";
                        $resultadod=$conn->query($query);                
                        ?>
                         <label class="control-label">Tipo Especialidad Psicologia:</label>
                         <div class="form-group">
                            <select class="form-control select2" required id="psico" style="width: 100%;" name="psicologo" >
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
                      <div style ="display:none;" class="col-md-4" id="especialidad_medico"><!--especialidad medico-->
                        <?php 
                        $query = " SELECT * FROM  tbl_especialidad WHERE CODIGO_AREA = 2;";
                        $resultadod=$conn->query($query);                
                        ?>
                         <label class="control-label">Tipo Especialidad Medico:</label>
                         <div class="form-group">
                            <select class="form-control select2" required id="medico"  style="width: 100%;" name="medico" >
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
                                Elija una opción.
                            </div>
                         </div>
                      </div>
                      <div  style ="display:none;" class="col-md-4" id="catequistas"><!--catequistas-->
                        <?php 
                        $query = " SELECT * FROM  tbl_especialidad WHERE CODIGO_AREA = 4;";
                        $resultadod=$conn->query($query);                
                        ?>
                         <label class="control-label">Catequistas:</label>
                         <div class="form-group">
                            <select  required id="cate" class="form-control select2"   style="width: 100%;" name="catequista">
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
                            <div class="invalid-feedback">
                                Elija una opción.
                            </div>
                         </div>
                      </div>
                      </div> 
                    </div><!--Fin de otra fila :v -->

                    <?php
                      include "conexionpdo.php";
                      $usuario=$_SESSION['vario'];
                      //Evaluo si existe el tipo de Rol
                      $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                      $evaluar_usuario->execute(array($usuario));
                      $row=$evaluar_usuario->fetchColumn();
                      if($row > 0){
                        $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                        //llamar al procedimiento almacenado
                        $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                        $evaluar_permiso->execute(array($usuariomo, '25'));
                        $row1=$evaluar_permiso->fetchColumn();
                        $permiso_registrar =$row1;             
                      }
                    ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                      <?php 
                       if($permiso_registrar == 'SI'){
                      ?>           
                    <button type="submit"  id="GUARDARPERSONA" name="GUARDAR" class="btn btn-success btn-lg mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                    <?php 
                      }
                     ?> 
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
<script language="javascript">
  function noespacio(campo, event) {
    CadenaaReemplazar = " ";
    CadenaReemplazo = "";
    CadenaTexto = campo.value;
    CadenaTextoNueva = CadenaTexto.split(CadenaaReemplazar).join(CadenaReemplazo);
    campo.value = CadenaTextoNueva;
  }
</script>


<script type="text/javascript">
  //FUNCIONES PARA MOSTRAR LOS CAMPOS DE USUARIOS (Se puede optimizar,pero hasta en evaluacion creo :v)
 $( function() {
    $("#tipo_persona").change( function() {//tutor administrador ,enfermero y estudiante
        if ($(this).val() === "1" || $(this).val() === "2"  || $(this).val() === "9" || $(this).val() === "4" ) {
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('familiares').style.display = "none";
          document.getElementById('usuarios').style.display = "block";
          document.getElementById('medico').required = false;
          document.getElementById('cate').required = false;
          document.getElementById('psico').required = false;
          document.getElementById('contrasena').required = true; 
          document.getElementById('nombre_usuario').required = true; 
        }else if ($(this).val() === "7"){ //es para un familiar
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('usuarios').style.display = "none";
          document.getElementById('familiares').style.display = "block";
          document.getElementById('medico').required = false;
          document.getElementById('cate').required = false;
          document.getElementById('psico').required = false;
          document.getElementById('contrasena').required = false; 
          document.getElementById('nombre_usuario').required = false; 
        }else if($(this).val() ===  "5" ){//para medico
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('familiares').style.display = "none";
          document.getElementById('especialidad_medico').style.display = "block";
          document.getElementById('usuarios').style.display = "block";
          document.getElementById('cate').required = false;
          document.getElementById('psico').required = false;
          document.getElementById('medico').required = true;
          document.getElementById('contrasena').required = true; 
          document.getElementById('nombre_usuario').required = true;
        }else if($(this).val() ===  "6" ){// para psicologo
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('familiares').style.display = "none";
          document.getElementById('especialidad_psico').style.display = "block";
          document.getElementById('usuarios').style.display = "block";
          document.getElementById('medico').required = false;
          document.getElementById('cate').required = false;
          document.getElementById('contrasena').required = true; 
          document.getElementById('nombre_usuario').required = true;
        }else if($(this).val() ===  "8"){//para catequista
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('familiares').style.display = "none";
          document.getElementById('catequistas').style.display = "block";
          document.getElementById('usuarios').style.display = "block";
          document.getElementById('psico').required = false;
          document.getElementById('medico').required = false;
          document.getElementById('cate').required = true;
          document.getElementById('contrasena').required = true; 
          document.getElementById('nombre_usuario').required = true;
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
  //Toda la pantalla elaborada por Diana Rut ,algunas cosas agregadas por terceros : )
</script>

