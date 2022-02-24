<?php
include_once "conexion.php";
include_once "conexion3.php";
?>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>

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
                        e.NOMBRE as ESTADO , r.NOMBRE as ROLL, u.CONTRASENA, u.CODIGO_TIPO_ROL,u.CODIGO_ESTADO, u.FECHA_CREACION ,u.FECHA_VENCIMIENTO , u.CREADO_POR
                        FROM tbl_usuario u ,tbl_roles r, tbl_estado e ,tbl_persona p
                        where u.CODIGO_ESTADO = e.CODIGO_ESTADO AND
                        u.CODIGO_TIPO_ROL = r.CODIGO_TIPO_ROL AND u.CODIGO_PERSONA = p.CODIGO_PERSONA;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_USUARIO'];
                            $var2 = $row['CODIGO_PERSONA'];
                            $var3 = $row['PRIMER_NOMBRE'];
                            $var4 = $row['PRIMER_APELLIDO'];
                            $var6 = $row['NOMBRE_USUARIO'];
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
                                <!--
                                <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="CODIGO_USUARIO" id="CODIGO_USUARIO">
                                <button id="ELIMINAR_USUARIO" name="ELIMINAR_USUARIO" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                                 -->
                                
                                 
                               </button>
                                <a href="#EDITARPERSONA<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar" class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var6; ?></td>
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
                                          <input type="text"  value ="<?php echo $var6; ?>" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" name="NOMUSUARIO" id="NOMUSUARIO">
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtnombre_usuario">Contraseña</label>
                                          <input type="text" class="form-control" value ="<?php echo $var9; ?>" maxlength="30"  minlength="8"  name="CONUSUARIO" id="CONUSUARIO" onKeyDown="sinespacio(this);"  onkeyup="mayus(this);" placeholder="Ingrese contraseña">
                                        </div>
                                      </div> 
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                    <div class="row"> <!-- INICIO SEGUNDO ROW --> 
                                      <?php
                                      $query = "SELECT CODIGO_TIPO_ROL,NOMBRE FROM tbl_roles;";
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
                                      <?php //--INICIO DEL ESTADO
                                      $query = "SELECT CODIGO_ESTADO,NOMBRE FROM tbl_estado;";
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
                                    </div> <!-- FIN ROW --> 

                                    <div class="row">
                                      <div class="col-sm-6">
                                         <div class="form-group">
                                            <label for="txtnombre_usuario">Fecha vencimiento</label>
                                            <input type="date" class="form-control" value ="<?php echo $var11; ?>"   name="FECHA_VENCIMIENTO" id="FECHA_VENCIMIENTO">
                                         </div>
                                      </div>
                                    </div>



                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELIMINAR" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="ACT_PERSONA" name="ACT_PERSONA" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  
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
</div><!-- ./wrapper -->


  




<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $( function() {
    $("#cbx_persona").change( function() {
        if ($(this).val() === "2") {
           document.getElementById("c").style.display="block";
        } else {
            document.getElementById("c").style.display="none";
        }
    });
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

<!--♠DianaRut *No me quiten los creditos :( -->