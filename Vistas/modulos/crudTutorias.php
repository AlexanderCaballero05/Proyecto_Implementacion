<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=22;
 $accion='Ingreso a la tabla de Tutorias';
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
          $usuario=$_SESSION['vario'];
           //Evaluo si existe el tipo de Rol
           $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL  FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
           $evaluar_usuario->execute(array($usuario));
           $row=$evaluar_usuario->fetchColumn();
           if($row > 0){
             $usuariomo = $row;
             $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
             $evaluar_permiso->execute(array($usuariomo, '22'));
             $row1=$evaluar_permiso->fetchColumn();
             $permiso_registrar =$row1;             
            }
          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->   
           <?php
           if($permiso_registrar == 'ON' ){
           ?>       
            <button  data-toggle="modal"  href="#AGREGAR_TUTORIA" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Agregar Tutoria</button>
           <?php
            }
           ?>
          <!-- Inicio del card -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Información de Tutorias</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_tutoria" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">ID</th>
                          <th class="text-center">Nombre</th>
                          <th class="text-center">Area</th>
                          <th class="text-center">Fecha Creación</th>
                          <th class="text-center">Fecha Modificación</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT CODIGO_TUTORIA,t.CODIGO_AREA, t.NOMBRE , a.NOMBRE as AREA, t.FECHA_CREACION, t.CREADO_POR, t.FECHA_MODIFICACION, t.MODIFICADO_POR
                        FROM tbl_tutoria t, tbl_area a
                        WHERE  a.CODIGO_AREA = t.CODIGO_AREA ORDER BY  CODIGO_TUTORIA ASC ;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_TUTORIA'];
                            $var2 = $row['NOMBRE'];
                            $var3 = $row['AREA'];
                            $var4 = $row['FECHA_CREACION'];
                            $var5 = $row['FECHA_MODIFICACION'];
                            $var6 = $row['CODIGO_AREA'];
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                              <?php
                                $usuario=$_SESSION['vario'];
                                //Evaluo si existe el tipo de Rol
                                $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario  WHERE NOMBRE_USUARIO = (?);");
                                $evaluar_usuario->execute(array($usuario));
                                $row=$evaluar_usuario->fetchColumn();
                                if($row > 0){
                                  $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                  $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                  $evaluar_permiso_eliminar->execute(array($usuariomo, '22'));
                                  $row1=$evaluar_permiso_eliminar->fetchColumn();
                                  $permiso_eliminar =$row1; 
                                }
                             ?>    
                             <?php
                             if($permiso_eliminar == 'ON'){
                             ?>                           
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="eliminar" name="eliminar" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                              <?php
                               }
                              ?>
                               <?php
                                $usuario=$_SESSION['vario'];
                                //Evaluo si existe el tipo de Rol
                                $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario  WHERE NOMBRE_USUARIO = (?);");
                                $evaluar_usuario->execute(array($usuario));
                                $row=$evaluar_usuario->fetchColumn();
                                if($row > 0){
                                  $usuariomo = $row;
                                  $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                  $evaluar_permiso_actualizar->execute(array($usuariomo, '22'));
                                  $row1=$evaluar_permiso_actualizar->fetchColumn();
                                  $permiso_actualizar =$row1; 
                                }
                               ?>
                               <?php
                                if($permiso_actualizar == 'ON' ){
                               ?>
                                <a href="#EDITARTUTORIA<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>
                                <?php
                                 }
                                ?><!--Fin del if de permitir permiso de actualizar -->
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var5; ?></td>

                        <!--INICIO DEL MODAL DE EDITAR TUTORIA -->
                          <div id="EDITARTUTORIA<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Tutoria</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_tutoria" id="id_tutoria">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre</label>
                                          <input required type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="20" minlength="5" onkeyup="mayus(this);"   autocomplete = "off" type="text" onkeypress="return soloLetras(event);"  name="editar_nombre" id="editar_nombre">
                                        </div>
                                      </div>

                                      <div class="col-sm-12">
                                        <?php //--INICIO DEL ESTADO
                                        $query = "SELECT  CODIGO_AREA,NOMBRE FROM tbl_area";
                                        $resultadod=$conn->query($query);                
                                       ?>
                                       <label  class="control-label">Area</label>  
                                       <div class="form-group">
                                         <select class="form-control select2 select2-primary"   style="width: 100%;" name="editar_area" id="editar_area" required>
                                         <option value="<?php echo $var6?>"><?php echo $var3;?></option>
                                          <?php 
                                          if ($resultadod->num_rows > 0) {
                                          while($row = $resultadod->fetch_assoc()) { 
                                          $codigo = $row['CODIGO_AREA'];
                                          $area = $row['NOMBRE'];
                                          ?>
                                        <option value="<?php echo $codigo?>" ><?php echo $area;?></option>
                                        <?php } 
                                         }?>
                                        </select> 
                                       </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_tutoria" name="editar_tutoria" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="tutoria_eliminar" id="tutoria_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar la tutoria <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_TUTORIA" id="ELIMINAR_TUTORIA"  class="btn btn-primary">Si,eliminar</button>      
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

  <!--INICIO DEL MODAL DE AGREGAR UNA NUEVA TUTORIA -->
  <div id="AGREGAR_TUTORIA" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Tutoria</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Nombre</label>
                                    <input  required type="text"  value ="" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese un nombre a la tutoria" name="nombre_tutoria" id="nombre_tutoria">
                                </div>
                            </div>
                            <div class="col-sm-12">
                              <?php //--INICIO DEL ESTADO
                                $query = "SELECT  CODIGO_AREA,NOMBRE FROM tbl_area";
                                $resultadod=$conn->query($query);                
                               ?>
                              <label  class="control-label">Area</label>  
                                <div class="form-group">
                                    <select class="form-control select2 select2-primary"   style="width: 100%;" name="codigo_area" id="codigo_area" required>
                                      <option > --Seleccione-- </option>
                                      <?php 
                                       if ($resultadod->num_rows > 0) {
                                       while($row = $resultadod->fetch_assoc()) { 
                                       $codigo_area = $row['CODIGO_AREA'];
                                       $area = $row['NOMBRE'];
                                       ?>
                                      <option value="<?php echo $codigo_area?>" ><?php echo $area;?></option>
                                      <?php } 
                                      }?>
                                    </select> 
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="nueva_tutoria" name="nueva_tutoria" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO TUTORIA Elaborado por Diana Rut --> 
  
   <!--Funcion de la datatable -->
<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_tutoria').DataTable();
} );
</script>