 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
 <!-- Main content -->
 <section class="content">
    <div class="container-fluid">
    <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- jquery validation -->
            <div class="card card-primary bg-transparent">
              <!-- /.card-header -->
              <!-- form start -->
              <form id="FORMPERSONAS" method="POST">
                <div class="card-body">
        <!-- TITULO ENCABEZADO DATOS PERSONALES -->
        <div class="card-header bg-blue">
          <h2 class="card-title"> <strong>Datos Personales</strong></h2>
        </div>
         <!-- TITULO ENCABEZADO DATOS PERSONALES -->
        </br>
                  <!-- DATOS PERSONALES -->
                  <div class="row"> 
        <!--INICIO IDENTIDAD--> 
        <div class="col-md-4">  
              <label for="identidad" class="control-label">Número de Identidad</label> 
              <div class="form-group">
                <input class="form-control" type="text" maxlength="13" minlength="13" name="IDENTIDAD" id="IDENTIDAD" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 0801199716227" required="" >
              </div>
        </div>
        <!--FIN IDENTIDAD--> 
        <!--INICIO 1er NOMBRE--> 
        <div class="col-md-4">  
              <label for="nombre" class="control-label">Nombres</label> 
              <div class="form-group">
                <input class="form-control" maxlength="20" minlength="5"  name="NOMBRES" id="NOMBRES" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" required="">
              </div>
            </div>
         <!--FIN 1er NOMBRE-->
          <!--INICIO APELLIDO-->
        <div class="col-md-4">  
              <label for="identidad" class="control-label">Apellidos</label> 
              <div class="form-group">
                <input class="form-control" maxlength="20" minlength="10" name="APELLIDOS" id="APELLIDOS" onkeyup="mayus(this);"  autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese Apellido" required="" >
              </div>
            </div>
        <!--FIN 1er APELLIDO-->
         </div>
         <div class="row">  
        <!--INICIO FECHANAC-->
        <div class="col-md-4">  
            <label for="fecha" class="control-label">Fecha Nacimiento</label>  
            <div class="form-group">
                <input placeholder="Fecha" name="FECHANAC" max="2002-01-01" min="1950-01-01" id="FECHANAC" type="date" class="form-control" required="">
              </div>
         </div>
         <!--FIN  FECHANAC-->
          <!--INICIO TIPO PERSONA-->
          <div class="col-md-4">  
            <label for="cbx_persona" class="control-label">Tipo Persona</label>  
            <div class="form-group">
              <select class="form-control"   style="width: 100%;" name="TIPOPERSONA" id="TIPOPERSONA" required="">
             <option value="">--Seleccionar--</option>
              <option value="J">JURIDICA</option>
              <option  value="N">NATURAL</option>
            </select>
            </div>  
       </div>
       <!--FIN TIPO PERSONA--> 
        <!--INICIO SEXO--> 
        <div class="col-md-4">  
            <label for="cbx_persona" class="control-label">Sexo</label>  
            <div class="form-group">
            <select class="form-control"   style="width: 100%;" name="SEXO" id="SEXO" required="">
             <option value="">--Seleccionar--</option>
              <option value="F">FEMENINO</option>
              <option  value="M">MASCULINO</option>
            </select> 
             </div> 
      </div>   
      <!--FIN SEXO-->
         </div> 
       <div class="row"> 
      <!--INICIO TELEFONO-->
      <div class="col-md-4">  
              <label for="apellido" class="control-label">Número Teléfono</label> 
              <div class="form-group">
                <input class="form-control" maxlength="8" onblur="quitarespacios(this);" onKeyDown="sinespacio(this);" minlength="8" name="TELEFONO" id="TELEFONO" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return solonumeros(event);" placeholder="Ej: 88996633" required="">
              </div>
              </div>
        <!--FIN TELEFONO-->
        <!--INICIO CORREO-->
      <div class="col-md-8">  
              <label for="apellido" class="control-label">Correo Electrónico</label> 
              <div class="form-group">
                <input class="form-control" maxlength="50" onblur="quitarespacios(this);" onKeyDown="sinespacio(this);" minlength="10" type="email" name="CORREO" id="CORREO" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="" placeholder="Ej: Example@gmail.com" required="">
              </div>
              </div>
        <!--FIN CORREO-->
        </div> 
         <!--INICIO DIRECCION--> 
        <label for="apellido" class="control-label">Direccion</label> 
        <div class="form-group">
        <textarea class="form-control" type="text" name="DIRECCION" id="DIRECCION" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ingrese Direccion" required="" cols="40" rows="1"></textarea>
        </div>
        <!--FIN DIRECCION-->
        <!-- DATOS PERSONALES -->
        <br>
         <!-- ENCABEZADO DATOS USUARIO -->
        <div class="card-header bg-yellow">
        <h2 class="card-title"> <strong>Datos Usuario</strong></h2>
        </div>
        <!-- ENCABEZADO DATOS USUARIO -->
        <br>
        <!-- DATOS USUARIO -->
        <div class="row">
         <!--INICIO USUARIO--> 
         <div class="col-md-4"> 
         <label for="apellido" class="control-label">Usuario</label> 
        <div class="form-group">
        <input class="form-control" maxlength="20" minlength="8" onKeyDown="sinespacio(this);" type="text" name="USUARIO" id="USUARIO" onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="" onblur="quitarespacios(this);" placeholder="Nombre Usuario" required="">
        </div>
        </div>
        <!--FIN USUARIO-->
         <!--INICIO ROL--> 
         <?php
     include "conexionbd.php";
     $queryd = "CALL Sp_lista_roles_activos()";
     $resultadod=$conn->query($queryd);                
     ?> 
         <div class="col-md-4">  
            <label for="cbx_persona" class="control-label">Rol Usuario</label>  
            <div class="form-group">
            <select class="form-control select2 select2-primary" data-dropdown-css-class="select2-purple" style="width: 100%;" name="ROL" id="ROL" required="">
             <option value="">--Seleccionar--</option>
             <?php 
                     if ($resultadod->num_rows > 0) {
                    while($rowt = $resultadod->fetch_assoc()) { ?>
                     <option value="<?php echo $rowt['ID_ROL'];?>"><?php echo $rowt['ROL']; ?></option>
                   <?php } 
                          }?>
            </select> 
             </div> 
            </div>   
      <!--FIN ROL-->
      <!--INICIO USUARIO--> 
      <?php
        include_once "Conexionpdo.php";
        $idparametro1=5;
    $sentencia = $db->prepare("CALL Sp_num_caracteres(?);");
    // llamar al procedimiento almacenado
    $sentencia->execute(array($idparametro1));
    $row=$sentencia->fetchColumn();
      // Conexion de las tablas a las variables
      $num_min_caracteres1 = $row;
      $idparametro2=4;
      $sentencia = $db->prepare("CALL Sp_num_caracteres(?);");
      // llamar al procedimiento almacenado
      $sentencia->execute(array($idparametro2));
      $row=$sentencia->fetchColumn();
        // Conexion de las tablas a las variables
        $num_min_caracteres2 = $row;
    ?>
      <div class="col-md-4"> 
         <label for="apellido" class="control-label">Contraseña Temporal</label> 
        <div class="form-group">
        <input class="form-control" onKeyDown="sinespacio(this);" type="text" name="CONTRASENA" id="CONTRASENA" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="" onblur="quitarespacios(this);" placeholder="Ej: H@c13nD4_24P" minlength="<?php echo $num_min_caracteres1; ?>" maxlength="<?php echo $num_min_caracteres2; ?>" required="">
        </div>
        </div>
        <!--FIN USUARIO-->
        </div>  
      <!--FIN ROL-->
      <!--INICIO USUARIO--> 
        <input class="form-control" hidden  value="<?php echo $_SESSION['vario'];?>" readonly maxlength="20" minlength="8" onKeyDown="sinespacio(this);" type="text" name="USUARIOREGIS" id="USUARIOREGIS" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="" onblur="quitarespacios(this);" placeholder="Nombre Usuario" required="">
        <!--FIN USUARIO-->
        <!-- DATOS USUARIO -->
                </div>
                <!-- /.card-body -->
                <div class="card-footer justify-content bg-transparent">
                <div class="row" style="float: right;">
                <div class="col-md-6"> 
                <button type="submit" onclick="location.href='usuarios'" id="CANCELAR" name="CANCELAR"  class="btn btn-danger">Cancelar</button>
                </div>
                <div class="col-md-6"> 
               <?php
    $usuarr = $_SESSION['vario'];
    $sentencia = $db->prepare("CALL Evaluar_tipo_usuario(?);");
    // llamar al procedimiento almacenado
    $sentencia->execute(array($usuarr));
    $row=$sentencia->fetchColumn();
      // Conexion de las tablas a las variables
      $usuarimo = $row;
     $sentencia = $db->prepare("CALL Sp_permiso_insert(?,?);");
     // llamar al procedimiento almacenado
     $sentencia->execute(array($usuarimo,'4'));
     $row=$sentencia->fetchColumn();
     $permiso = $row;
    ?>
    <?php
     if ($permiso == 'ACTIVO')
     {
    ?>
    <button type="submit" id="GUARDARPERSONA" name="GUARDARPERSONA" class="btn btn-success">Guardar</button>
    <?php
     }
    ?>
     </div>
    </div>
                </div>
              </form>
            </div>
            <!-- /.card -->
            </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">

          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
    </div>
</section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
  </div>
  <!-- /.content-wrapper -->

<?php


?>