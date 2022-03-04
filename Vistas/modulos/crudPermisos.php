<?php 
 include_once "conexion1.php";
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
                                $evaluar_permiso->execute(array($usuariomo, '1'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                    <?php 
                    if ($permiso_registrar == 'ON') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>                
           
                       <button  data-toggle="modal"  href="#agregar_permisos" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Agregar permiso</button>
                    
                    <?php
                    }
                    ?>
          
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Permisos de usuarios</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_permisos" class="table table-bordered table-striped table-hover">
                      <thead class="table-success" >
                        <tr><!--fila del encabezado de la tabla -->
                          <th class="text-center">Acción</th> 
                          <th class="text-center">ID</th> <!--encabezados de la tabla -->
                          <th class="text-center">Rol Usuario</th>
                          <th class="text-center">Permiso Objeto</th>
                          <th class="text-center">Permiso Insertar</th>
                          <th class="text-center">Permiso Eliminar</th>
                          <th class="text-center">Permiso Actualizar</th>
                          <th class="text-center">Permiso Mostrar</th>
                          <th class="text-center">Creado por</th>
                          <th class="text-center">Fecha Creación</th>
                          <th class="text-center">Modificado por</th>
                          <th class="text-center">Fecha modificación</th>                          

                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "CALL Sp_mostrar_permisos()";//Procedimiento para traer los datos de la tabla permisos
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {// if que valida que si es mayor a 0 se encontro un registro
                          while($row = $result->fetch_assoc()) {//while para capturar cada dato del registro en una variable
                            $var1 = $row['CODIGO_PERMISO'];// variable que almacena el dato capturado
                            $var2 = $row['CODIGO_TIPO_ROL'];
                            $var3 = $row['CODIGO_OBJETO'];
                            $var4 = $row['ROL'];
                            $var5 = $row['NOMBRE'];
                            $var6 = $row['INSERTAR'];
                            $var7 = $row['ELIMINAR'];
                            $var8 = $row['ACTUALIZAR'];
                            $var9 = $row['MOSTRAR'];
                            $var10 = $row['CREADO_POR'];
                            $var11 = $row['FECHA_CREACION'];
                            $var12 = $row['MODIFICADO_POR'];
                            $var13 = $row['FECHA_MODIFICACION'];   
                         
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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '1'));
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
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '1'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 



                    <tr> <!-- INICIO DE LINEA DE LOS DATOS DE LA TABLA-->
                          <td> <!-- TABLE DATA en donde estan los botones de eliminar e modificar -->
                            <div class="text-center" >
                              <div class="btn-group">

                                <?php
                                  if($permiso_eliminar == 'ON')
                                   {
                                ?>
                                
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_ROL" name="ELIMINAR_ROL" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>

                               <?php
                                  }
                                ?>


                                <?php 
                                if ($permiso_actualizar == 'ON')
                                {
                                ?>

                                <a href="#EditarPermiso<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>

                                <?php 
                                }
                                ?>

                              </div>
                            </div><!-- final del text-center -->
                          </td>

                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var5; ?></td>
                          <td class="text-center"><?php echo $var6; ?></td>
                          <td class="text-center"><?php echo $var7; ?></td>
                          <td class="text-center"><?php echo $var8; ?></td>
                          <td class="text-center"><?php echo $var9; ?></td>
                          <td class="text-center"><?php echo $var10; ?></td>
                          <td class="text-center"><?php echo $var11; ?></td>
                          <td class="text-center"><?php echo $var12; ?></td>
                          <td class="text-center"><?php echo $var13; ?></td>

                          


              <!--------------------------------------------------------------
                          INICIO DEL MODAL DE EDITAR PERMISO
               --------------------------------------------------------------->
                          <div id="EditarPermiso<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->

                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar permisos</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>

                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                       <select class="hidden" name="PERMISOU" required>
                                          <option value="<?php echo $var1 ?>"></option>
                                       </select>
                                            <!--Inicio combobox tipo de rol -->
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Rol Usuario</label>
                                            <select class="form-control" name="EDITIPO" required>
                                              <option value="<?php echo $var2?>"><?php echo $var4 ?></option>
                                            </select>
                                        </div>
                                      </div>
                                            <!--Inicio combobox objeto -->

                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Objeto</label>
                                          <select class="form-control" name="EDIOBJETO" required>
                                            <option value="<?php echo $var3?>"><?php echo $var5 ?></option>
                                          </select>
                                        </div>
                                      </div>
                                            <!--Inicio combobox insertar -->
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Insertar</label>
                                            <select class="form-control" name="ediInsertar" id="editar_descripcion">
                                                 <option value="<?php echo $var6?>"> <?php echo $var6 ?></option>
                                                 <option value="ON">ON</option>
                                                 <Option value="OFF">OFF</Option>
                                            </select>
                                        </div>
                                      </div>

                                         <!--Inicio combobox eliminar -->
                                        <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Eliminar</label>
                                            <select class="form-control" name="ediEliminar" id="editar_descripcion">
                                                 <option value="<?php echo $var7?>"> <?php echo $var7 ?></option>
                                                 <option value="ON">ON</option>
                                                 <Option value="OFF">OFF</Option>
                                            </select>
                                        </div>
                                      </div>
                                        <!--Inicio combobox Actualizar-->
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Actualizar</label>
                                            <select class="form-control" name="ediActualizar" id="editar_descripcion">
                                                 <option value="<?php echo $var8?>"> <?php echo $var8 ?></option>
                                                 <option value="ON">ON</option>
                                                 <Option value="OFF">OFF</Option>
                                            </select>
                                        </div>
                                      </div>

                                       <!--Inicio combobox Actualizar-->
                                       <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Mostrar</label>
                                            <select class="form-control" name="ediMostrar" id="editar_descripcion">
                                                 <option value="<?php echo $var8?>"> <?php echo $var8 ?></option>
                                                 <option value="ON">ON</option>
                                                 <Option value="OFF">OFF</Option>
                                            </select>
                                        </div>

                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->

                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit"  name="editarPermiso" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminarPermiso" id="rol_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar los permisos al rol <?php echo $var4; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_PERMISO" id="ELIMINAR_PERMISO"  class="btn btn-primary">Si,eliminar</button>      
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


  <!-------------------------------------------------------------------
                      ||  INICIO MODAL DIALOG INSERTAR PERMISOS ||
  --------------------------------------------------------------------->

  <!--INICIO DEL MODAL DE AGREGAR UN PERMISO -->
  <div id="agregar_permisos" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">

            <?php
            include "conexion1.php";
            $queryd = "CALL Sp_mostrar_roles_activos()";
            $resultadod=$conn->query($queryd);   

            ?>
            <?php
            include "conexion1.php";
            $queryr = "SELECT o.CODIGO_OBJETO , o.NOMBRE AS Nom_modulo
                        FROM tbl_objetos o;";
            $resultador=$conn->query($queryr);
            ?>  


           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Permisos</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                 <!--INICIO COMOBOX TIPO DE ROL-->
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Seleccionar Rol:</label>
                                    <select class="form-control" name="PERUSUARIO" required="">
                                        <option>< Seleccionar rol ></option>
                                        <?php 
                                        if ($resultadod->num_rows > 0) {
                                        while($rowt = $resultadod->fetch_assoc()) { ?>
                                        <option value="<?php echo $rowt['CODIGO_TIPO_ROL'];?>"><?php echo $rowt['NOMBRE']; ?></option>
                                      <?php } 
                                              }?>
                                    </select>
                                </div>
                            </div> <!--FIN DEL COMOBOX TIPO DE ROL-->

                                 <!--INICIO COMOBOX OBJETO-->
                                
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Seleccionar Modulo<!--  -->:</label>
                                    <select class="form-control" name="MODUSUARIO" required="">
                                        <option>< Seleccionar modulo ></option>
                                                <?php 
                                                  if ($resultador->num_rows > 0) {
                                                    while($rowr = $resultador->fetch_assoc()) { ?>
                                        <option value="<?php echo $rowr['CODIGO_OBJETO'];?>"><?php echo $rowr['Nom_modulo']; ?></option>
                                                <?php } 
                                                      }?>
                                      </select>
                                </div>
                            </div> <!--FINAL COMOBOX OBJETO-->
                            
                        
                            <div class="col-sm-12">
                                 <!--INICIO COMOBOX INSERTAR-->
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Insertar:</label>
                                    <select class="form-control" name="INSERTAR" required>
                                        <option>< Seleccionar ></option>
                                        <option value="ON">ON</option>
                                        <option value="OFF">OFF</option>
                                    </select>
                                </div>
                            </div> <!--FIN DEL COMOBOX INSERTAR-->

                                 <!--INICIO COMBOBOX ELMIMIAR-->
                                
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Eliminar:</label>
                                    <select class="form-control"name="ELIMINAR" required="">
                                        <option>< Seleccionar ></option>
                                        <option value="ON">ON</option>
                                        <option value="OFF">OFF</option>
                                    </select>
                                </div>
                            </div> <!--FINAL COMOBOX ELIMINAR-->

                            <!--INICIO COMBOBOX ACTUALIZAR -->
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Modificar:</label>
                                    <select class="form-control"name="ACTUALIZAR" required="">
                                        <option>< Seleccionar ></option>
                                        <option value="ON">ON</option>
                                        <option value="OFF">OFF</option>
                                    </select>
                                </div>
                            </div> <!--FINAL COMOBOX MODIFICAR-->

                             <!--INICIO COMBOBOX MOSTRAR -->
                             <div class="col-sm-12">
                            <label>Mostrar</label>
                                <div class="input-group">
                                <span class="input-group-append"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                                  <select class="form-control" name="MOSTRAR">
                                    <option>< Seleccionar ></option>
                                    <option value="ON">ON</option>
                                    <option value="OFF">OFF</option>
                                  </select>
                                </div>
                            </div><!--FINAL COMOBOX MOSTRAR-->
                         
                        </div> <!-- FIN DE LA PRIMERA ROW --> 
                    </div><!--FINAL DEL CARD BODY -->   
                        <div class="modal-footer ">
                            <button type="submit" name="guardarpermisos" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button> 
                            <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                   
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO ROL --> 

  <!-- Button trigger modal -->


<!-- Modal -->

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_permisos').DataTable();
} );
</script>

