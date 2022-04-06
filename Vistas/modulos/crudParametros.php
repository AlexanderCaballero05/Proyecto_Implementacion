<?php
include_once "conexion.php";
include_once "conexion3.php";

?>
      <!--llamada de la fuction bitacora -->
     <?php 
      $codigoObjeto=3;
      $accion='Ingreso a la pantalla de mantenimiento parámetros';
      $descripcion= 'Aqui se visualiza los registros existentes de la tabla parámetros';
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
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                            FROM tbl_usuario 
                                                            WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                //llamar al procedimiento almacenado
                                $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                                $evaluar_permiso->execute(array($usuariomo, '3'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                    <?php 
                    if ($permiso_registrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>      

                    <button  data-toggle="modal"  href="#agregar_param" type='button' id="btnNuevo"  style="color:white;"class="btn btn-primary mb-3">Agregar Parametro</button>


                   <?php
                    }
                    ?>
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">PARÁMETROS</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_parametros" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th>Acción</th>
                          <th>ID</th>
                          <th>Parametro</th>
                          <th>Valor</th>
                          <th>Creado por</th>
                          <th>Fecha de creación</th>
                          <th>Modificado por</th>
                          <th>Fecha de Modificación</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT CODIGO_PARAMETRO, PARAMETRO, VALOR, CREADO_POR_USUARIO, FECHA_CREACION, MODIFICADO_POR, FECHA_MODIFICACION
                                   FROM TBL_PARAMETROS;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_PARAMETRO'];
                            $var2 = $row['PARAMETRO'];
                            $var3 = $row['VALOR'];
                            $var4 = $row['CREADO_POR_USUARIO'];
                            $var5 = $row['FECHA_CREACION'];
                            $var6 = $row['MODIFICADO_POR'];
                            $var7 = $row['FECHA_MODIFICACION'];

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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '3'));
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
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '3'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 
                            
                       
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                              <?php
                              if($permiso_eliminar == 'SI')
                               {
                            ?>

                               <a href="#ELIMINARPARAMETRO<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINARPARAM" name="ELIMINARPARAM" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>


                               <?php
                                }
                               ?>


                               <?php 
                                if ($permiso_actualizar == 'SI')
                                {
                                ?>

                                <a href="#EDITARPARAMETRO<?php echo $var1; ?>" data-toggle="modal">
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
                        
                        <!--INICIO DEL MODAL DE EDITAR -->
                          <div id="EDITARPARAMETRO<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITPARAMETROS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Parámetros</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_param" id="id_param">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_parametro">Parámetro</label>
                                          <input  type="text" disabled = "disabled" value ="<?php echo $var2; ?>" class="form-control"  maxlength="50" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese el parámetro" name="Edit_nomparam" id="Edit_nomparam">
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtnombre_usuario">Valor</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" class="form-control"  maxlength="100"     autocomplete = "off" type="text"   name="Edit_valor" id="Edit_valor">
                                        </div>
                                      </div> 
                                      </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="Edit_parametro" name="Edit_parametro" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  


                          <!--MODAL ELIMINAR -->
                          <div id="ELIMINARPARAMETRO<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="param_eliminar" id="param_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar el Parámetro? <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINARPARAM" id="ELIMINARPARAM"  class="btn btn-primary">Si,eliminar</button>      
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

  <!--INICIO DEL MODAL DE AGREGAR PARAMETRO -->
  <div id="agregar_param" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Parámetro</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtparametro">Parámetro</label>
                                    <input  type="text"  class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese el parámetro" name="parametro" id="parametro">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtvalor">Valor</label>
                                    <textarea  type="text"   class="form-control"  maxlength="100"    onkeyup="mayus(this);" autocomplete = "off" type="text"  placeholder="Ingrese el valor del parámetro" name="valor_param" id="valor_param"></textarea>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_param" name="agregar_param" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO PARAMETRO -->

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
 }); //este codigo si me costo 

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

<!--♠DianaRut *No me quiten los creditos :( -->