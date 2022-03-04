<?php 
     $codigoObjeto=1;
     $accion='Ingreso a Matricula';
     $descripcion= 'Aqui se pueden realizar el proceso de matricula';
    bitacora($codigoObjeto, $accion,$descripcion);
?>

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
                      <h1 class="card-title"> <strong>MATRICULA</strong></h1>
                    </div></br>

                    <!-- INICIO -->
                    <div class="row mb-4">
                    <div class="col">
                       <label for="identidad" class="control-label">Estudiante:</label> 
                       <input type="text" name="nombre1" class="form-control" placeholder="Nombre" aria-label=" nombre" onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required="">
                    </div>
                     <div class="col">
                        <label for="identidad" class="control-label">Grado:</label> 
                         <input type="text" name="nombre2" class="form-control" placeholder="6to grado" aria-label="6to grado" onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required="">
                    </div>
                    </div>
                   

                    <div class="card-header" id="form_usuario">
                       <h2 class="card-title"> <strong>Carga Académica</strong></h2>
                    </div><br>
                    <div class="row mb-4">
                    <div class="col">
                       <label for="identidad" class="control-label">Area:</label> 
                       <input type="text" name="nombre1" class="form-control" placeholder="Académica" aria-label="Académica" onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required="">
                    </div>
                     <div class="col">
                        <label for="identidad" class="control-label">Tutoria: </label> 
                         <input type="text" name="nombre2" class="form-control" placeholder="Matemáticas" aria-label="Matemáticas" onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required="">
                    </div>
                    </div>

                    <div class="row"  >
                      <div class="col-md-4" id="cuarta_fila" ><!--INICIO contraseña-->
                        <label for="apellido" class="control-label">Tutor</label>

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