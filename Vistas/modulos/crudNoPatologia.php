
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 $codigoObjeto=4;
 $accion='Ingreso a mantenimiento de No Patologia';
 $descripcion='Aqui se visualiza los registros en no patologia que se han registrado';
bitacora($codigoObjeto,$accion,$descripcion);
?>




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
                          <php
                             if ($permiso_registrar= 'ON'){

                          ?>
            <!-- <button  data-toggle="modal"  href="Vistas/modulos/procesoMatricula.php" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Agregar Matricula</button> -->
                          <php
                              }
                          ?>


          
  <section class="content">
    <div class="container-fluid">
        <div class="card">
          <div class="card-header"  style="background-color: #A8D2D0 ">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link" href="crudNoPatologia">Ver Patologia </a>
              </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body">
        


          <div class="card-body">
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
                      if($permiso_registrar = 'SI'){
                        ?> 
                        <button  data-toggle="modal"  href="#AGREGAR_NOPATOLOGIA" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Agregar Nuevo Trastorno</button>
                
                        <?php 
    
                          }
                            
                        ?> 
              
               
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #FEFEFE "><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Transtorno en los Sistemas Corporales</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_nopatologia" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th class="text-center">Acción</th>
                                            <th class="text-center">Codigo de Transtorno</th>
                                            <th class="text-center">Tipo</th>
                                            <th class="text-center">Descripcion</th>
                                        
                        </tr>
                      </thead>
                      <tbody>
                      <?php
                                        $query = "SELECT np.CODIGO_NO_PATOLOGIA, np.TIPO, np.DESCRIPCION
                                        FROM tbl_no_patologias np;";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['CODIGO_NO_PATOLOGIA'];
                                                $var2 = $row['TIPO'];
                                                $var3 = $row['DESCRIPCION'];
                                                
                                                
                                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
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
                                <php
                                    if ($permiso_registrar= 'ON'){

                                ?>
                                <button id="ELIMINAR_NOPATOLOGIA" name="ELIMINAR_NOPATOLOGIA" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               <php
                                  }
                                ?>
                               </a>
                                <a href="#EDITARNOPATOLOGIA<?php echo $var1; ?>" data-toggle="modal">
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
                                <php
                                    if ($permiso_registrar= 'ON'){

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
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    
                                                 
                         <!-- editar cita editar -->
                                                    
        <div  class="modal fade"id="EDITARNOPATOLOGIA<?php echo $var1 ?>" role="dialog"  >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal content  editar-->
                    <form method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Editar Patologia
                        </h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-------------CUERPO DEL MODAL  editar--------------> 
                    <div class="modal-body"> 
                    <!-------- INICIO PRIMERA ROW editar ----------->         
                    <div class="row"> 
                        <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" name="EDITARNOPATOLOGIA" id="EDITARNOPATOLOGIA" >
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Tipo</label>
                                <input  type="text"  value ="<?php echo $var2; ?>" class="form-control" autocomplete = "off" type="text" onkeypress="return soloLetras(event);"  name="editar_tipo" id="editar_tipo">
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Descripcion</label>
                                <input  type="text"  value ="<?php echo $var3; ?>" class="form-control" autocomplete = "off" type="text" onkeypress="return soloLetras(event);"  name="editar_descripcion" id="editar_descripcion">
                            </div>
                        </div>
      
                      </div>  
           
            <!-- ------------------ FIN PRIMERA ROW editar---------------------- -->
                <div class="modal-footer ">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                    <button type="submit" name="edit_nopatologia"  id = "edit_nopatologia" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                </div>
                        </div><!--FIN CUERPO DEL MODAL editar --> 
                    </form>
                </div>
            </div>
        </div><!-- FIN DEL MODAL editar -->
                           <!-- inicio modal eliminar  -->   
        <div id="ELIMINAR<?php echo $var1 ?>"   name="ELIMINARNOPATOLOGIA" id="ELIMINARPNOATOLOGIA" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                        <form id="FORMPatologia" method="POST">
                            <div class="modal-body">
                                <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" name="eliminarnopato" id="eliminarnopato">
                                <h4 class="text-center">¿Esta seguro de eliminar estos campos?</h4>
                            </div> <!--fin el card body eliminar -->
                            <div class="modal-footer ">
                                <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                <button type="submit" name="eliminar_nopato" id="eliminar_nopato"  class="btn btn-primary">Si,eliminar</button>      
                            </div><!--FIN DEL DIV DE BOTONES DE GUARDAR eliminar -->
                         </form>
                </div><!--fin del modal contener -->
            </div><!--fin del modal dialog -->
        </div><!--fin del modal de eliminar -->
                                                    <!--fin del modal de eliminar -->
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
                      </div>
                      </div>
  </section><!-- FINAL SECTION -->

 

  </section>
<!-- Modal -->

 <!--INICIO DEL MODAL DE AGREGAR UN NUEVO TRASTORNO -->
 <div id="AGREGAR_NOPATOLOGIA" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Trastorno</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Tipo</label>
                                    <input  type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="" name="agregar_tipo" id="agregar_tipo">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Descripción</label>
                                    <textarea  type="text"  value ="<?php echo $var3; ?>" class="form-control"  maxlength="150"    onkeyup="mayus(this);" autocomplete = "off" type="text"  placeholder="Ingrese una descripción " name="agregar_descripcion" id="agregar_descripcion"></textarea>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_patologia" name="agregar_patologia" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO TRASTORNO --> 
                
<script>
    function Descargar() {
      window.open('Vistas/modulos/reporteNoPatologia.php','_blank');
      window.open(this.href,'_self');
    }
  </script>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_nopatologia').DataTable({

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
        "search": "Buscar Patologia:",
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