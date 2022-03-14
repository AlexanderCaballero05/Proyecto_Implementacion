<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 $codigoObjeto=12;
 $accion='Ingreso a mantenimiento preguntas';
 $descripcion='Pregunta realizadas al usuario para cambio de contraseña';
bitacora($codigoObjeto,$accion,$descripcion);
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
        <div class="col-md-8">
           
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
                                $evaluar_permiso->execute(array($usuariomo, '12'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                            <php
                             if ($permiso_registrar == 'SI'){

                          ?>

            <button  data-toggle="modal"  href="#AGREGAR_TIPOPER" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Agregar Pregunta</button>
                            <php
                              }
                            ?>
          
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">TABLA TIPO DE PERSONAS</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_preguntas" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th>Acción</th>
                          <th>Codigo</th>
                          <th>Nombre</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT CODIGO_TIPO_PERSONA, NOMBRE from tbl_tipo_persona;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_TIPO_PERSONA'];
                            $var2 = $row['NOMBRE'];
                           
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                               
                               <!-- Codigo de permiso para Eliminar -->

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
                                      $evaluar_permiso_eliminar->execute(array($usuariomo, '12'));
                                      $row1=$evaluar_permiso_eliminar->fetchColumn();
                                      $permiso_eliminar =$row1; 
                                  }
                                  ?>  
                                  <php
                                    if ($permiso_registrar == 'SI'){

                                  ?>
                               <button id="ELIMINAR_PREGUNTA" name="ELIMINAR_PREGUNTA" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                                 <php
                                  }
                                 ?>
                                </a>
                                <a href="#EDITARPREGUNTA<?php echo $var1; ?>" data-toggle="modal">
                                 <!-- Codigo de permiso para Actualizar -->
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
                                      $evaluar_permiso_actualizar->execute(array($usuariomo, '12'));
                                      $row1=$evaluar_permiso_actualizar->fetchColumn();
                                      $permiso_actualizar =$row1; 
                                    
                                  }
                                  ?>
                                 <php
                                    if ($permiso_registrar == 'SI'){

                                  ?>
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                <php
                                  }
                                 ?>
                              
                              </a>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
    

                        <!--INICIO DEL MODAL DE EDITAR PREGUNTA -->
                        
                          <div id="EDITARPREGUNTA<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Tipo de Persona</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_editar" id="id_editar">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Tipo de Persona</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="60" minlength="5"  onkeypress="return soloLetras(event);"  autocomplete = "off" type="text"  name="editar_persona" id="editar_persona">
                                        </div>
                          </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar" name="editar" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  
                            
                          <!--INCICIO DEL MODAL ELIMINAR   -->
                          <div id="ELIMINAR<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="persona_eliminar" id="persona_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar la pregunta <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_PERSONA" id="ELIMINAR_PERSONA"  class="btn btn-primary">Si,eliminar</button>      
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

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVA PREGUNTAL -->
  <div id="AGREGAR_TIPOPER" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">AGREGAR TIPO DE PERSONA</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_pregunta">Nombre Tipo de personas</label>
                                    <input  type="text"    class="form-control"  maxlength="50" minlength="5"   autocomplete = "off" type="text"  onkeypress="return soloLetras(event);" placeholder="Ingrese la pregunta" name="TIPO_PERSONA" id="TIPO_PERSONA">
                                </div>
                            </div>
                          
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_persona" name="agregar_persona" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO PREGUNTA --> 

  <!-- Button trigger modal -->


<!-- Modal -->

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_roles').DataTable();
} );
</script>
