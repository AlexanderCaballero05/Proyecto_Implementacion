<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=2;
 $accion='Ingreso a la tabla de roles';
 $descripcion= 'Usuario se autentifico ';
 bitacora($codigoObjeto, $accion,$descripcion);
 
?>

<head>
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
        <?php
         include "conexionpdo.php";
         $usuario=$_SESSION['vario'];
          //Evaluo si existe el tipo de Rol
          $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
          $evaluar_usuario->execute(array($usuario));
          $row=$evaluar_usuario->fetchColumn();
          if($row > 0){
           $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
           $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
           $evaluar_permiso->execute(array($usuariomo, '2'));
           $row1=$evaluar_permiso->fetchColumn();
            $permiso_registrar =$row1;             
           }
          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->          
          <?php
          if($permiso_registrar == 'SI'){
          ?>
          
          <button  data-toggle="modal"  href="#AGREGAR_ROL" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Nuevo Rol</button>
          <?php
           }
          ?>
          
          <!-- Inicios del card -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Información de los roles</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_roles" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">ACCION</th>
                          <th class="text-center">ID</th>
                          <th class="text-center">NOMBRE</th>
                          <th class="text-center">DESCRIPCION</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT * FROM `tbl_roles`
                        ORDER BY  CODIGO_TIPO_ROL ASC ;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_TIPO_ROL'];
                            $var2 = $row['NOMBRE'];
                            $var3 = $row['DESCRIPCION'];
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">

                              <!-- Codigo de permiso para Eliminar -->
                              <?php
                                $usuario=$_SESSION['vario'];
                                //Evalua si existe el tipo de Rol
                                $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL  FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                                $evaluar_usuario->execute(array($usuario));
                                $row=$evaluar_usuario->fetchColumn();
                                if($row > 0){
                                  $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                  $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                  $evaluar_permiso_eliminar->execute(array($usuariomo, '2'));
                                  $row1=$evaluar_permiso_eliminar->fetchColumn();
                                  $permiso_eliminar =$row1; 
                                }
                              ?> 
                               <?php
                                 if($permiso_eliminar == 'SI'){
                               ?>                            
                                <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_ROL" name="ELIMINAR_ROL" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                               <?php
                                }
                               ?><!--Fin del boton de eliminar -->
                              <!--Codigo para asignar permiso del boton de editar -->
                              <?php
                               $usuario=$_SESSION['vario'];
                               //Evaluo si existe el tipo de Rol
                               $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                               $evaluar_usuario->execute(array($usuario));
                               $row=$evaluar_usuario->fetchColumn();
                               if($row > 0){
                                  $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                  //llamar al procedimiento almacenado
                                  $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                  $evaluar_permiso_actualizar->execute(array($usuariomo, '2'));
                                  $row2=$evaluar_permiso_actualizar->fetchColumn();
                                  $permiso_actualizar =$row2; 
                               }
                              ?>
                              <?php
                                if($permiso_actualizar == 'SI')
                                {
                              ?>
                                <a href="#EDITARROL<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>
                              <?php
                                }
                              ?>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                        <!--INICIO DEL MODAL DE EDITAR ROL -->
                          <div id="EDITARROL<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar roles</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_rol" id="id_rol">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="40" minlength="5"  onkeyup="mayus(this);"  autocomplete = "off" type="text" onkeypress="return soloLetras(event);"  name="editar_nombre" id="editar_nombre">
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Descripción</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" class="form-control"  maxlength="100"  onkeyup="mayus(this);"   autocomplete = "off" type="text"   name="editar_descripcion" id="editar_descripcion">
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_rol" name="editar_rol" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  
                            
                          <!--INICIO DEL MODAL ELIMINAR   -->
                          <div id="ELIMINAR<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="rol_eliminar" id="rol_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar el rol <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_ROL" id="ELIMINAR_ROL"  class="btn btn-primary">Si,eliminar</button>      
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

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVO ROL -->
    <div id="AGREGAR_ROL" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form  method="POST"  class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Rol</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Nombre</label>
                                    <input  type="text"  class="form-control"  maxlength="40" minlength="5"  onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese un nombre al rol" name="nombre_rol" id="nombre_rol" required="">
                                    <div class="invalid-feedback">
                                  campo obligatorio.
                                   </div>

                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Descripción</label>
                                    <textarea  type="text"   class="form-control"  maxlength="100"    onkeyup="mayus(this);" autocomplete = "off" type="text"  placeholder="Ingrese una descripción del rol" name="descripcion_rol" id="descripcion_rol" required=""></textarea>
                                    <div class="invalid-feedback">
                                  campo obligatorio.
                                   </div>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_rol" name="agregar_rol" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO ROL --> 
   <!--Elaborado por Diana Rut -->
  
   <!--Funcion de la datatable -->
<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_roles').DataTable({
        language: {
        "decimal": "",
        "emptyTable": "No hay información",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
        "infoEmpty": "Mostrando 0 a 0 de 0 Entradas",
        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Entradas",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar Rol:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
      },
        
      })
  } );
</script>

<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'
  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')
  // Loop over them and prevent submission
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

                                  
<!-- funciones del sistema -->
<script>
  function soloLetras(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " áéíóúabcdefghijklmnñopqrstuvwxyz_-";
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
  //otra funcion para quitar espacios 
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
</script>