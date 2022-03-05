<?php

  include_once "conexionpdo.php";
  include_once "conexion3.php";
  include_once 'function_bitacora.php';
  $codigoObjeto=13;
  $accion='Ingreso a la tabla de registro de personas';
  $descripcion= 'Usuario se autentifico';
  bitacora($codigoObjeto, $accion,$descripcion);

  $parametro ="NUM_MAX_CARACTER"; //traer el valor delparametro
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($parametro));
  $row=$sentencia->fetchColumn();
  
  if($row>0){
    $valor = $row;
  }
  
?>

<head>
  <style type="text/css">
    /* ESTILOS PARA OCULTAR LOS INPUTS DE FORM DE REGISTRAR USUARIO*/
    #form_usuario{
      display:none;
      background-color: #0CCDE3;
    }
    #primera_fila{
      display:none;
    }
    #segunda_fila{
      display:none;
    }
    #tercera_fila{
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
      <div class="container-fluid">
        <div class="row"><!-- COLUMNA PRINCIPAL -->
          <div class="col-md-12"> <!-- COLUMNA DE REGISTRO DE PERSONAS -->
            <div class="card card-primary bg-transparent">
               <form id="FORMPERSONAS" method="POST" >
                  <div class="card-body">
                    <div class="card-header bh"> <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                      <h2 class="card-title"> <strong>Generales persona</strong></h2>
                    </div></br>
                    <!-- DATOS PERSONALES -->
                    <div class="row">
                      <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                        <label for="identidad" class="control-label">Número de Identidad</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="13" name="identidad" id="identidad" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 0801199716227" required="" >
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO 1er NOMBRE-->
                        <label for="identidad" class="control-label">Primer Nombre:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="3" name="primer_nombre" id="" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" required="" >
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO er NOMBRE-->
                        <label for="identidad" class="control-label">Segundo Nombre:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="3" name="segundo_nombre" id="" onKeyDown="sinespacio(this);" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off">
                        </div>
                      </div>
                    </div><!--Fin de una fila -->

                    <div class="row">
                      <div class="col-md-4"><!--INICIO 1er APELLIDO-->
                        <label for="identidad" class="control-label">Pimer Apellido:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="4" name="primer_apellido" id="" onKeyDown="sinespacio(this);" required="" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" >
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO 2er APELLIDO-->
                        <label for="identidad" class="control-label">Segundo Apellido:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" maxlength="13" minlength="4" name="segundo_apellido" id="" onKeyDown="sinespacio(this);" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" >
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO FECHA NACIMIENTO-->
                        <label for="identidad" class="control-label">Fecha Nacimiento:</label> 
                        <div class="form-group">
                          <input class="form-control" type="date" placeholder="Fecha" name="fecha_nacimiento" max="2010-01-01" min="1950-01-01" required="" >
                        </div>
                      </div>
                    </div><!--Fin de otra fila :v -->

                    <div class="row">
                      <div class="col-md-4"><!--INICIO lugar de NACIMIENTO-->
                        <label for="identidad" class="control-label">Lugar Nacimiento:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" placeholder="lugar nacimiento" name="lugar_nacimiento" max="2002-01-01" min="1950-01-01" required="" >
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO TIPO PERSONA-->
                         <label for="cbx_persona" class="control-label">Tipo Persona</label>
                         <div class="form-group">
                            <select class="form-control"   style="width: 100%;" name="tipo_persona" id="tipo_persona"   required="">
                            <option value="">--Seleccionar--</option>
                              <option  value="1">Administrador</option>
                              <option   value="2">Tutor</option>
                              <option   value="3">Estudiante</option>
                            </select>
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
                         </div>
                      </div>
                    </div><!--Fin de otra fila :v -->

                    <div class="row">
                      <div class="col-md-4"><!--telefono-->
                        <label for="identidad" class="control-label">Número Teléfono:</label> 
                        <div class="form-group">
                          <input class="form-control" type="text" minlength="8" maxlength="8"  name="telefono" id="" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" >
                        </div>
                      </div>
                      <div class="col-md-4"><!--CORREO ELECTRONICO-->
                        <label for="identidad" class="control-label">Correo Electrónico:</label> 
                        <div class="form-group">
                          <input class="form-control" type="email" maxlength="50"  name="correo" id="" onKeyDown="sinespacio(this);"   required="" >
                        </div>
                      </div>
                      <div class="col-md-4"><!--INICIO FECHA DE BAJA-->
                        <label for="identidad" class="control-label">Fecha Baja:</label> 
                        <div class="form-group">
                          <input readonly class="form-control" type="date" placeholder="Fecha" name="fecha_baja" max="2002-01-01" min="1950-01-01">
                        </div>
                      </div>
                    </div><!--Fin de otra fila :v -->

                    <div class="row"> 
                      <div class="col-md-12"><!--INICIO DIRECCION--> 
                        <label for="apellido" class="control-label">Direccion</label> <!--INICIO DIRECCION-->
                        <div class="form-group">
                          <textarea class="form-control" type="text" name="direccion" id="DIRECCION" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ingrese Direccion" required="" ></textarea>
                        </div>
                      </div>
                    </div><!--Fin de otra fila :v -->

                    <div class="card-header" id="form_usuario">
                       <h2 class="card-title"> <strong>Registrar Usuario</strong></h2>
                    </div><br>
                    <div  class="row"> 
                      <div class="col-md-4" id="primera_fila"><!--INICIO NOMBRE USUARIO-->
                        <label for="apellido" class="control-label">Nombre Usuario</label>
                        <div class="form-group">
                            <input class="form-control" maxlength="15" minlength="4" onKeyDown="sinespacio(this);" type="text" name="nombre_usuario" id="nombre_usuario" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" type="text" 
                            onblur="quitarespacios(this);" placeholder="Nombre Usuario" >
                        </div>
                      </div>
                      <div class="col-md-4" id="segunda_fila"><!--INICIO SEXO--> 
                         <label for="cbx_persona" class="control-label">Estado</label>
                         <div class="form-group">
                          <input class="form-control" readonly value="NUEVO"></input>
                         </div>
                      </div>
                      <div class="col-md-4" id="tercera_fila"><!--INICIO ROL--> 
                        <label for="" class="control-label">Rol</label>
                         <div class="form-group">
                          <input class="form-control" readonly value="Indefinido"></input>
                         </div>
                      </div>
                    </div><!--Fin de otra fila :v -->

                    <div class="row"  >
                      <div class="col-md-4" id="cuarta_fila" ><!--INICIO contraseña-->
                        <label for="apellido" class="control-label">Contraseña</label>

                        <div class="form-group">
                            <input class="form-control"  minlength="5" maxlength="<?php echo "$valor"?>" onKeyDown="sinespacio(this);" type="text" name="contrasena" >
                        </div>
                      </div>
                      
                    </div>
                    <button type="submit"  id="GUARDARPERSONA" name="GUARDAR" class="btn btn-success btn-lg mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                    
                  </div><!--Fin del card body del form -->
               </form> <!-- Final del form de registar persona -->
            </div>
          </div><!-- FIN DE LA COLUMNA DE REGISTRO DE PERSONAS y DE USUARIOS  -->
        </div><!-- COLUMNA PRINCIPAL -->
      </div>

    </section> <!-- Fin del section principal -->
</div><!-- Fin del conten wrapeer -->
<!-- divs que agrego que no se para que son :V-->
<aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
  <!-- /.control-sidebar -->
</div>
  </div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
</div><!-- ./wrapper -->



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
  $( function() {
    $("#tipo_persona").change( function() {
        if ($(this).val() === "1" || $(this).val() === "2" ) {
          document.getElementById('form_usuario').style.display = "block";
          document.getElementById('primera_fila').style.display = "block";
          document.getElementById('segunda_fila').style.display = "block";
          document.getElementById('tercera_fila').style.display = "block";
          document.getElementById('cuarta_fila').style.display = "block";
           document.getElementById('quinta_fila').style.display = "block";
        } else{
          document.getElementById('form_usuario').style.display = "none";
          document.getElementById('primera_fila').style.display = "none";
           document.getElementById('segunda_fila').style.display = "none";
           document.getElementById('tercera_fila').style.display = "none";
           document.getElementById('cuarta_fila').style.display = "none";
           document.getElementById('quinta_fila').style.display = "none";
        }
    });
  }); //este codigo si me costo 
</script>