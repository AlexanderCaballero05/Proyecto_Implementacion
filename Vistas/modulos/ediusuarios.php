<?php
include_once "conexion.php";
include_once "conexion3.php";
?>
      <!--llamada de la fuction bitacora -->
     <?php 
      $codigoObjeto=1;
      $accion='Ingreso a la pantalla de mantenimiento usuarios';
      $descripcion= 'Ver los registros de los usuarios';
      bitacora($codigoObjeto, $accion,$descripcion);
      ?>
      
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>
<style>
  /*Para que el div que tiene las contraseñas se muestren por default en none,osea que no se pueda ver
  hasta que se le de click,que esta en la funcion js de abajo */
  #Mostrar_reseteo{
    display: none;
  }
  #Mostrar_reseteo1{
    display: none;
  }
</style>

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Información del Usuario</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="example1" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th>Acción</th>
                          <th>ID</th>
                          <th>Primer nombre</th>
                          <th>Primer Apellido</th>
                          <th>Nombre Usuario</th>
                          <th>Correo</th>
                          <th>Estado</th>
                          <th>Rol</th>
                          <th>Contraseña</th>
                          <th>Fecha creacion</th>
                          <th>Fecha Vencimiento</th>
                          <th>Creado por</th>
                          
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT u.CODIGO_USUARIO,p.CODIGO_PERSONA, u.USUARIO, u.NOMBRE_USUARIO , p.PRIMER_NOMBRE, p.PRIMER_APELLIDO,
                        e.NOMBRE as ESTADO , r.NOMBRE as ROLL, u.CONTRASENA, u.CODIGO_TIPO_ROL,u.CODIGO_ESTADO, c.correo_persona, u.FECHA_CREACION ,u.FECHA_VENCIMIENTO , u.CREADO_POR
                        FROM tbl_usuario u ,tbl_roles r, tbl_estado e ,tbl_persona p, tbl_correo_electronico c
                        where u.CODIGO_ESTADO = e.CODIGO_ESTADO AND
                        u.CODIGO_TIPO_ROL = r.CODIGO_TIPO_ROL AND u.CODIGO_PERSONA = p.CODIGO_PERSONA AND  p.CODIGO_PERSONA = c.CODIGO_PERSONA
                        ORDER BY CODIGO_USUARIO ASC;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_USUARIO'];
                            $var2 = $row['CODIGO_PERSONA'];
                            $var3 = $row['PRIMER_NOMBRE'];
                            $var4 = $row['PRIMER_APELLIDO'];
                            $var6 = $row['NOMBRE_USUARIO'];
                            $var15 = $row['correo_persona'];
                            $var7 = $row['ESTADO'];
                            $var8 = $row['ROLL'];
                            $var9 = $row['CONTRASENA'];
                            $var10 = $row['FECHA_CREACION']; 
                            $var11= $row['FECHA_VENCIMIENTO']; 
                            $var12 = $row['CREADO_POR']; 
                            $var13 = $row['CODIGO_ESTADO']; 
                            $var14 = $row['CODIGO_TIPO_ROL']; 
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_USUARIO" name="ELIMINAR_USUARIO" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                                <a href="#EDITARPERSONA<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var6; ?></td>
                          <td class="text-center"><?php echo $var15; ?></td>
                          <td class="text-center"><?php echo $var7; ?></td>
                          <td class="text-center"><?php echo $var8; ?></td>
                          <td class="text-center"><?php echo $var9; ?></td>
                          <td class="text-center"><?php echo $var10; ?></td>
                          <td class="text-center"><?php echo $var11; ?></td>
                          <td class="text-center"><?php echo $var12; ?></td>
                        <!--INICIO DEL MODAL DE EDITAR -->
                          <div id="EDITARPERSONA<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-lg">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar informacion del usuario</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="CODUSUARIO" id="CODUSUARIO">
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre Usuario</label>
                                          <input  type="text"  value ="<?php echo $var6; ?>" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" name="NOMUSUARIO" id="NOMUSUARIO">
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Primer nombre</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" name="primer_nombre" id="primer_nombre">
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Primer Apellido</label>
                                          <input  type="text"  value ="<?php echo $var4; ?>" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" name="primer_apellido" id="primer_apellido">
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Correo</label>
                                          <input  type="text"  value ="<?php echo $var15; ?>" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);"  autocomplete = "off" type="text"   name="correo" id="correo">
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                    <div class="row"> <!-- INICIO SEGUNDO ROW --> 
                                      
                                      <?php //--INICIO DEL ESTADO
                                      $query = "SELECT * FROM tbl_estado WHERE  NOMBRE <>'NUEVO'  AND NOMBRE <> 'INDEFINIDO'  AND NOMBRE <> 'PENDIENTE' and NOMBRE <>'BLOQUEADO' ";
                                      $resultadod=$conn->query($query);                
                                      ?> 
                                      <div class="col-sm-6">
                                        <label for="cbx_persona" class="control-label">Estado</label>  
                                        <div class="form-group">
                                          <select class="form-control select2 select2-primary"   style="width: 100%;" name="ESTADOUSUARIO" id="ESTADOUSUARIO" required="">
                                            <option value="<?php echo $var13?>"><?php echo $var7;?></option>
                                            <?php 
                                              if ($resultadod->num_rows > 0) {
                                                while($row = $resultadod->fetch_assoc()) { 
                                                $codigo_estado = $row['CODIGO_ESTADO'];
                                                $estado = $row['NOMBRE'];
                                              ?>
                                              <option value="<?php echo $codigo_estado?>"><?php echo $estado;?></option>
                                              <?php } 
                                              }?>
                                          </select> 
                                        </div>  
                                      </div> <!--FIN DE ESTADO--> 
                                      <div class="col-sm-6">
                                         <div class="form-group">
                                            <label for="txtnombre_usuario">Fecha vencimiento</label>
                                            <input type="date" class="form-control" value ="<?php echo $var11; ?>"   name="FECHA_VENCIMIENTO" id="FECHA_VENCIMIENTO">
                                         </div>
                                      </div>
                                    </div> <!-- FIN ROW --> 
                                     <div class="row">
                                        <?php
                                        $query = "SELECT CODIGO_TIPO_ROL,NOMBRE FROM tbl_roles WHERE NOMBRE <>'Indefinido' and NOMBRE <>'INDEFINIDO' ;";
                                        $resultadod=$conn->query($query);                
                                        ?> 
                                        <div class="col-sm-6">
                                          <label for="cbx_persona" class="control-label">Rol</label>  
                                          <div class="form-group">
                                            <select class="form-control select2 select2-primary"   style="width: 100%;" name="ROLUSUARIO" id="ROLUSUARIO" required="">
                                              <option value="<?php echo $var14?>"><?php echo $var8;?></option>
                                              <?php 
                                                if ($resultadod->num_rows > 0) {
                                                  while($row = $resultadod->fetch_assoc()) { 
                                                  $codigo_estado = $row['CODIGO_TIPO_ROL'];
                                                  $estado = $row['NOMBRE'];
                                                ?>
                                                <option value="<?php echo $codigo_estado?>"><?php echo $estado;?></option>
                                                <?php } 
                                                }?>
                                            </select> 
                                          </div>  
                                        </div> <!--FIN ROL--> 
                                      </div>
                                    <div class="row">
                                      <div class="col-sm-6">
                                        <button type="button"  class="btn btn-primary" onclick="Mostar_div()">Resetear Contraseña</button>
                                      </div>
                                    </div>
                                    <div  class="row">
                                      <div id="Mostrar_reseteo" class="col-sm-6">
                                       <label for="" class="control-label">Cambiar Contraseña</label> 
                                        <div class="input-group" >
                                          <div  class="input-group-prepend">
                                            <div id="mostrar"  class="input-group-text"><span class="nav-icon fas fa-eye-slash ojo1 "></span></div>
                                          </div>
                                          <input type="password" class="form-control" id="contrasena" name="contrasena" >
                                        </div>
                                      </div><!--fin del col -->
                                      <div id="Mostrar_reseteo1" class="col-sm-6">
                                        <label for="" class="control-label">Confirmar Contraseña</label> 
                                        <div class="input-group" >
                                          <div  class="input-group-prepend">
                                            <div class="input-group-text"><span class="nav-icon fas fa-eye-slash ojo "></span></div>
                                          </div>
                                          <input type="password" class="form-control" id="confirmar_contra" name="confirmar_contra" >
                                        </div>
                                      </div><!--fin del col -->

                                    </div>
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="ACT_PERSONA" name="ACT_PERSONA" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  

                          <div id="ELIMINAR<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="usuario_eliminar" id="usuario_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar el usuario <?php echo $var1; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR" id="ELIMINAR"  class="btn btn-primary">Si,eliminar</button>      
                                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                               </form>
                               </div><!--fin del modal contener -->
                            </div><!--fin del modal dialog -->
                          </div><!--fin del modal de eliminar -->
                      </tr>             
                        <?php
                        }
                        }
                        ?>
                      </tbody>
                  </table>
                </div><!--fin del div de responsivi -->
              </div> <!-- /.card-body -->
            </form>
          </div><!-- fINAL DEL card PRIMARY -->
        </div><!--FINAL DE COL-M12-->
      </div><!-- FINAL ROW PADRE -->
    </div><!-- FINAL CONTAINER FLUID --> 
  </section><!-- FINAL SECTION -->
</div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
  <!-- /.control-sidebar -->
</div>
  </div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
</div><!--  -->



<script>
  $(document).ready( function () {
    $('#myTable').DataTable();
} );
</script>
<script>
  function Mostar_div(){
    var x = document.getElementById("Mostrar_reseteo");
    var y = document.getElementById("Mostrar_reseteo1");
    if(x.style.display === "none" && y.style.display === "none"){
      x.style.display = "block";
      y.style.display = "block";
    }else{
      x.style.display = "none";
      y.style.display = "none";
    }
  }
</script>

<script>
  // Mostrar y ocultar contraseña para el input de confirmar contraseña
  const mostrar_cla = document.querySelector(".ojo");
  mostrar_cla.addEventListener('click',function(){
    var cla = document.getElementById("confirmar_contra");
    if(cla.type === "password"){
       cla.type = "text";
       $('.ojo').removeClass('nav-icon fas fa-eye-slash').addClass('nav-icon fas fa-eye');
    }else{
      cla.type ="password";
      $('.ojo').removeClass('nav-icon fas fa-eye').addClass('nav-icon fas fa-eye-slash');
    }
  });
</script>
<script>
  //Mostrar y ocultar la clave para el input de contrasena ,es lo mismo que arriba,pero no podian estar juntos,porque? pues solo se que no se puede :v
  const mostrar = document.querySelector(".ojo1");
  mostrar.addEventListener('click',function(){
    var cla1 = document.getElementById("contrasena");
    if(cla1.type === "password"){
       cla1.type = "text";
       $('.ojo1').removeClass('nav-icon fas fa-eye-slash').addClass('nav-icon fas fa-eye');
    }else{
      cla1.type ="password";
      $('.ojo1').removeClass('nav-icon fas fa-eye').addClass('nav-icon fas fa-eye-slash');
    }
  });
</script>
                                  
<!-- funciones del sistema -->
<script>
  function soloLetras(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
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
 //funcion para solu numeros ingresar en el campo
 function soloNumeros_tel(e){
   var teclaPulsada=window.event ? window.event.keyCode:e.which;
    // capturamos el contenido del input
    var valor=document.getElementById("tele").value;
    if(valor.length<9){
      if(teclaPulsada==9){
        return true;
      }
    // devolvemos true o false dependiendo de si es numerico o no
    return /\d/.test(String.fromCharCode(teclaPulsada));
    }else{
    return false;
    }
  }
   //funcion para quitar espacios
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
  //funcion para poner mayusculas
  function mayus(e) {
    e.value = e.value.toUpperCase();
  }
   //funcion sin espacios 
  function sinespacio(e) {
    var cadena =  e.value;
    var limpia = "";
    var parts = cadena.split(" ");
    var length = parts.length;
    for (var i = 0; i < length; i++) {
     nuevacadena = parts[i];
     subcadena = nuevacadena.trim();
     if(subcadena != "") {
       limpia += subcadena + " ";
      }
    }
   limpia = limpia.trim();
   e.value = limpia;
  };
  //otra funcion para quitar espacios :V
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
</script>
<!--Ordenado y comentado para su mejor compresion -->
<!-- Elaborado  y modificado  unicamente por ♠Diana Rut  -->