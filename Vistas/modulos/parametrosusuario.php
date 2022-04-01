<?php
include_once "conexion.php";
include_once "conexion3.php";
?>
      <!--llamada de la fuction bitacora -->
     <?php 
      $codigoObjeto=1;
      $accion='Parametros Usuarios';
      $descripcion= 'Ver los parametros de los usuarios';
      bitacora($codigoObjeto, $accion,$descripcion);
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
               <h1 class=" card-title text-center"><strong style="color:black;">Parametros Usuarios</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_parametrosusu" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th>EDITAR</th>
                          <th>CODIGO PARAM USUARIO</th>
                          <th>CODIGO USUARIO</th>
                          <th>NOMBRE USUARIO</th>
                          <th>CODIGO PARAMETRO</th>
                          <th>PARAMETRO</th>
                          <th>PAR VALOR</th>
                          <th>CREADO POR USUARIO</th>
                          <th>FECHA CREACION</th>
                          <th>MODIFICADO POR</th>
                          <th>FECHA MODIFICACION</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT a.CODIGO_PARAM_USUARIO, a.CODIGO_USUARIO, u.NOMBRE_USUARIO,a.CODIGO_PARAMETRO, p.PARAMETRO,a.PAR_VALOR, a.CREADO_POR_USUARIO, a.FECHA_CREACION, a.MODIFICADO_POR, a.FECHA_MODIFICACION 
                        FROM tbl_parametros_usuarios a ,tbl_parametros p, tbl_usuario u WHERE a.CODIGO_USUARIO = u.CODIGO_USUARIO AND a.CODIGO_PARAMETRO = p.CODIGO_PARAMETRO
                        ORDER BY a.CODIGO_PARAM_USUARIO;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_PARAM_USUARIO'];
                            $var2 = $row['CODIGO_USUARIO'];
                            $var3 = $row['NOMBRE_USUARIO'];
                            $var4 = $row['CODIGO_PARAMETRO'];
                            $var5 = $row['PARAMETRO'];
                            $var6 = $row['PAR_VALOR'];
                            $var7 = $row['CREADO_POR_USUARIO'];
                            $var8 = $row['FECHA_CREACION'];
                            $var9 = $row['MODIFICADO_POR'];
                            $var10 = $row['FECHA_MODIFICACION']; 
                        ?>

<?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                            FROM tbl_usuario 
                                                            WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '9'));
                                $row1=$evaluar_permiso_actualizar->fetchColumn();
                                $permiso_actualizar =$row1; 
                                
                                
                               
                            }
                            ?> 

<?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                            FROM tbl_usuario 
                                                            WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '9'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">

                                

                                <?php
                                 if($permiso_eliminar == 'ON')
                                 {
                                ?>
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_PARAMETROUSUARIO" name="ELIMINAR_PARAMETROUSUARIO" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>

                                  <?php
                                  }
                                  ?>
 
                                
                                <?php 
                                if ($permiso_actualizar == 'ON')
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
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var5; ?></td>
                          <td class="text-center"><?php echo $var6; ?></td>
                          <td class="text-center"><?php echo $var7; ?></td>
                          <td class="text-center"><?php echo $var8; ?></td>
                          <td class="text-center"><?php echo $var9; ?></td>
                          <td class="text-center"><?php echo $var10; ?></td>
                     
                          
                          <!--INICIO DEL MODAL DE EDITAR PAR VALOR -->
                          <div id="EDITARROL<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Parametro Usuario</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_paramusu" id="id_paramusu">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txt_parvalor">Par Valor</label>
                                          <input  type="text"  value ="<?php echo $var6; ?>" class="form-control"  maxlength="2" minlength="1"    autocomplete = "off" type="text" onkeypress="return solonumero(event)" name="editar_parvalor" id="editar_parvalor">
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                       
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_paramusu" name="editar_paramusu" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  


                          <div id="ELIMINAR<?php echo $var1 ?>"  name="paramusuario_eli" id="paramusuario_eli"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="paramusuario_eli" id="paramusuario_eli">
                                    <h4 class="text-center">¿Esta seguro de eliminar este campo? <?php echo $var1; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">

                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_PARAMETROUSUARIO" id="ELIMINAR_PARAMETROUSUARIO"  class="btn btn-primary">Si,eliminar</button>      
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

  <!-- Button trigger modal -->


<!-- Modal -->



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
$( function() {
    $("#ESTADOUSUARIO").change( function() {
        if ($(this).val() === "4") {
          document.getElementById('CONUSUARIO').disable = true;
        
        } else{
          document.getElementById('CONUSUARIO').disable = false;
         
        }
    });
 }); 

</script>



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

<script type="text/javascript"> function solonumero(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla==8) return true;
        else if (tecla==0||tecla==9)  return true;
       // patron =/[0-9\s]/;// -> solo letras
        patron =/[0-9\s]/;// -> solo numeros
        te = String.fromCharCode(tecla);
        return patron.test(te);
    }
	</script>
 <!--Funcion de la datatable -->
 <script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_parametrosusu').DataTable({
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
        "search": "Buscar Parametros:",
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
