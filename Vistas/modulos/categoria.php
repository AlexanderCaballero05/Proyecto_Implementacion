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
<div class="content-wrapper">
    <div class="content-header">
      <div class="container-fluid">
      </div>
    </div>
    <!-- Main content -->
    <section class="content">
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
               <form id="FORMPERSONAS" method="POST" class="needs-validation" novalidate >
                  <div class="card-body">
                    <div class="card-header "> <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                      <h2 class="card-title"> <strong>Datos Generales persona</strong></h2>
                    </div></br>
                    <!-- DATOS PERSONALES -->
                    <div class="row">
                      <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                        <label for="identidad" class="control-label">Número de Identidad</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="13" name="identidad" id="identidad" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 0801199716227" required="" >
                          <div class="invalid-feedback">
                                  campo obligatorio.
                          </div>                     
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO 1er NOMBRE-->
                        <label for="identidad" class="control-label">Primer Nombre</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="3" name="primer_nombre" id="" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" required="">
                          <div class="invalid-feedback">
                                  campo obligatorio.
                          </div>  
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO er NOMBRE-->
                        <label for="identidad" class="control-label">Segundo Nombre</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="3" name="segundo_nombre" id="" onKeyDown="sinespacio(this);" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" required="">
                          <div class="invalid-feedback">
                          campo obligatorio.
                          </div> 
                        </div>
                      </div>
                    </div><!--Fin de una fila -->


                    <div class="row">
                      <div class="col-md-4"><!--INICIO 1er APELLIDO-->
                        <label  class="control-label">Pimer Apellido</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="4" name="primer_apellido" id="" onKeyDown="sinespacio(this);" required="" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" required="">
                          <div class="invalid-feedback">
                                  campo obligatorio.
                          </div> 
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO 2er APELLIDO-->
                        <label  class="control-label">Segundo Apellido</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="4" name="segundo_apellido" id="" onKeyDown="sinespacio(this);" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" required="">
                          <div class="invalid-feedback">
                                  campo obligatorio.
                          </div> 
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO FECHA NACIMIENTO-->
                        <label  class="control-label">Fecha Nacimiento</label> 
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
                        <label for="identidad" class="control-label">Lugar Nacimiento:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" placeholder="lugar nacimiento" name="lugar_nacimiento" max="2002-01-01" min="1950-01-01" required="">
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
                         <label for="cbx_persona" class="control-label">Tipo Persona</label>
                         <div class="form-group">
                            <select class="form-control"   style="width: 100%;" name="tipo_persona" id="tipo_persona" required >
                             <option selected >--Seleccione tipo--</option>
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
                            <div class="invalid-feedback">
                                  Elija una opcion
                            </div>
                   
                            
                         </div>
                      </div>
                      <div class="col-md-4"><!--INICIO SEXO--> 
                         <label for="cbx_persona" class="control-label">Sexo</label>
                         <div class="form-group">
                            <select class="form-control"   style="width: 100%;" name="sexo" id="TIPOPERSONA" required="">
                              <option value="">--Seleccionar--</option>
                              <option value="1">FEMENINO</option>
                              <option  value="2">MASCULINO</option>
                            </select>
                            <div class="invalid-feedback">
                                  Elija una opción.
                            </div>
                         </div>
                      </div>
                    </div><!--Fin de otra fila :v -->

                    <div class="row">
                      <div class="col-md-4"><!--telefono-->
                      <label for="" class="control-label">Telefono</label> 
                        <div class="input-group">
                          <input class="form-control" type="text" minlength="8" maxlength="8"  name="telefono"  onKeyDown="sinespacio(this);"   onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" required="">
                          <div class="invalid-feedback">
                                  campo obligatorio.
                          </div>
                          <div class="input-group-prepend">
                            <button  type="button"  class="btn btn-primary btn-md"><span onclick="MostrarTelefono();"  > <i class="nav-icon fa fa-plus mx-1"></i></span></button>
                          </div>
                        </div>
                      </div>
                      <div  style ="display:none;" id="telefono2" class="col-md-4"><!--INICIO FECHA DE BAJA-->
                        <label for="identidad" class="control-label">Otro Telefono</label> 
                        <div class="form-group">
                         <input class="form-control" type="text" minlength="8" maxlength="8"  name="otro_telefono"  onKeyDown="sinespacio(this);" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" >

                        </div>
                      </div>

                      <div class="col-md-4"><!--CORREO ELECTRONICO-->
                        <label  class="control-label">Correo Electrónico:</label> 
                        <div class="form-group">
                          <input class="form-control" type="email" maxlength="50"  name="correo"  onKeyDown="sinespacio(this);"  required=""  >
                          <div class="invalid-feedback">
                                  campo obligatorio.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de otra fila :v -->

                    

                    <div class="row"> 
                      <div class="col-md-12"><!--INICIO DIRECCION--> 
                        <label  class="control-label">Direccion</label> <!--INICIO DIRECCION-->
                        <div class="form-group">
                          <textarea class="form-control" type="text" name="direccion" id="DIRECCION" onkeyup="mayus(this);"  onkeypress="" placeholder="Ingrese Direccion" required="" ></textarea>
                          <div class="invalid-feedback">
                                  campo obligatorio.
                          </div>
                        </div>
                      </div>

                    </div><!--Fin de otra fila :v -->

                    <div class="card-header" id="form_usuario">
                       <h2 class="card-title"> <strong>Registrar Usuario</strong></h2>
                    </div><br>
                    <div  class="row"> 
                      
                      <div class="col-md-4" id="primera_fila"><!--INICIO NOMBRE USUARIO-->
                        <label  class="control-label">Nombre Usuario</label>
                        <div class="form-group">
                            <input class="form-control" maxlength="15" minlength="4" onKeyDown="sinespacio(this);" type="text" name="nombre_usuario" id="nombre_usuario" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" type="text" 
                            onblur="quitarespacios(this);" placeholder="Nombre Usuario" >
                            <div class="invalid-feedback">
                                  campo obligatorio.
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4" id="cuarta_fila" ><!--INICIO contraseña-->
                        <label  class="control-label">Contraseña</label>
                        <div class="form-group">
                            <input class="form-control"  minlength="8"  maxlength="<?php echo $max; ?>" onKeyDown="sinespacio(this);" type="text" id="contrasena" name="contrasena" >
                            <div class="invalid-feedback">
                                  campo obligatorio.
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
                             <option selected >--Seleccione tipo--</option>
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
                             <option selected >--Seleccione tipo--</option>
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
                      <div  style ="display:none;" class="col-md-4" id="catequistas"><!--catequistas-->
                        <?php 
                        $query = " SELECT * FROM  tbl_especialidad WHERE CODIGO_AREA = 4;";
                        $resultadod=$conn->query($query);                
                        ?>
                         <label for="cbx_persona" class="control-label">Catequistas:</label>
                         <div class="form-group">
                            <select class="form-control select2"   style="width: 100%;" name="catequista">
                             <option selected enable value="" >--Seleccione Catequesis--</option>
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
                    </div><!--Fin de otra fila :v -->
                    </br>                    
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
    </section> <!-- Fin del section principal -->
</div>
</div>


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

<script type="text/javascript">
  var dni = document.getElementById('identidad');
  identidad.addEventListener("keyup", function(e) {
  var key = e.keyCode || e.charCode;
  // si la tecla es un cero y el segundo carácter es un cero
  if (key == 48 && this.value[1] == "0") {
    // se eliminan los ceros delanteros
    this.value = this.value.replace(/^0+/, '');
  }
  });

  //Funcion para habilitar los campos del form de usuario,solo si es administrador o tutor
 //Funcion para habilitar los campos del form de usuario,dependiendo el tipo personas,
 //es larguito ,no saber un metodo para acortarlo,existe pero pues lo importante es que de :v
 $( function() {
    $("#tipo_persona").change( function() {
        if ($(this).val() === "1" || $(this).val() === "2" ) {
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('form_usuario').style.display = "block";
          document.getElementById('primera_fila').style.display = "block";
          document.getElementById('cuarta_fila').style.display = "block";

           
        } else if ($(this).val() === "4" || $(this).val() === "7"){
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('form_usuario').style.display = "none";
          document.getElementById('primera_fila').style.display = "none";
           document.getElementById('cuarta_fila').style.display = "none";

           
        }else if($(this).val() ===  "5" ){
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('especialidad_medico').style.display = "block";
          document.getElementById('form_usuario').style.display = "block";
          document.getElementById('primera_fila').style.display = "block";
          document.getElementById('cuarta_fila').style.display = "block";

        }else if($(this).val() ===  "6" ){
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('catequistas').style.display = "none";
          document.getElementById('especialidad_psico').style.display = "block";
          document.getElementById('form_usuario').style.display = "block";
          document.getElementById('primera_fila').style.display = "block";
          document.getElementById('cuarta_fila').style.display = "block";
          
        }else if($(this).val() ===  "8"){
          document.getElementById('especialidad_medico').style.display = "none";
          document.getElementById('especialidad_psico').style.display = "none";
          document.getElementById('catequistas').style.display = "block";
          document.getElementById('form_usuario').style.display = "block";
          document.getElementById('primera_fila').style.display = "block";
          document.getElementById('cuarta_fila').style.display = "block";
          
        }
    });
  }); // 
</script>
<script>
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
