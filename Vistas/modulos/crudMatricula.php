<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 $codigoObjeto=4;
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
          <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link active" aria-current="true" href="#">Ver Matricula</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="procesoMatricula">Matricula</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled">Otros</a>
              </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body">
          <div class="row">
            <div class="col-md-12">
                <a href="procesoMatricula">
                <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Agregar Nueva matricula</button>
                </a>
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Matricula Academica </strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_preguntas" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th>Acción</th>
                          <th>Codigo Matricula</th>
                          <th>Asignatura </th>
                          <th>Seccion</th>
                          <th>Hora</th>
                          <th>Modalidad</th>
                          <th>Nombre del Tutor</th>
                          <th>Estudiante</th>
                          <th>Grado Actual</th>
                          <th>Creado Por</th>
                          <th>Fecha de Creación</th>
                          <th>Modificado Por</th>
                          <th>Fecha de Modificacion</th>
                      
                        </tr>
                      </thead>
                      <tbody>
                        <?php                      
               $query = "SELECT  tma.CODIGO_MATRICULA, concat_ws (' ',tp.PRIMER_NOMBRE,' ',tp.PRIMER_APELLIDO) as ESTUDIANTE ,
               (select concat_ws (' ', tp2.PRIMER_NOMBRE,' ',tp.PRIMER_APELLIDO) from tbl_persona tp2
               where tca.CODIGO_PERSONA_TUTOR = tp2.CODIGO_PERSONA) as NOMBRE_TUTOR, tt.NOMBRE as ASIGNATURA, tm.TIPO as MODALIDAD ,te.GRADO_ACTUAL,tca.SECCION,tca.HORA , tma.CREADO_POR_USUARIO, tma.FECHA_CREACION,tma.MODIFICADO_POR,tma.FECHA_MODIFICACION
                from tbl_matricula_academica tma 
               left join tbl_carga_academica tca on tma.CODIGO_CARGA = tca.CODIGO_CARGA 
               left join tbl_tutoria tt on tt.CODIGO_TUTORIA = tca.CODIGO_TUTORIA 
               left join tbl_modalidad tm on tm.CODIGO_MODALIDA =tca.CODIGO_MODALIDAD
               left join tbl_estudiante te on te.CODIGO_ESTUDIANTE = tma.CODIGO_ESTUDIANTE 
                left join tbl_persona tp on tp.CODIGO_PERSONA = te.CODIGO_PERSONA where te.CODIGO_PERSONA = tp.CODIGO_PERSONA;";
              $result = $conn->query($query);
              if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                  $var1 = $row['CODIGO_MATRICULA'];
                  $var2 = $row['ESTUDIANTE'];
                  $var3 = $row['NOMBRE_TUTOR'];
                  $var4 = $row['ASIGNATURA'];
                  $var5 = $row['MODALIDAD'];
                  $var6 = $row['GRADO_ACTUAL'];
                  $var7 = $row['SECCION'];
                  $var8 = $row['HORA'];
                  $var9 = $row['CREADO_POR_USUARIO'];
                  $var10 = $row['FECHA_CREACION'];
                  $var11 = $row['MODIFICADO_POR'];
                  $var12 = $row['FECHA_MODIFICACION'];
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
                                <button id="ELIMINAR_MATRICULA" name="ELIMINAR_MATRICULA" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               <php
                                  }
                                ?>
                               </a>
                                <a href="#EDITARMATRICULA<?php echo $var1; ?>" data-toggle="modal">
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
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var7; ?></td>
                          <td class="text-center"><?php echo $var8; ?></td>
                          <td class="text-center"><?php echo $var5; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var6; ?></td>
                          <td class="text-center"><?php echo $var9; ?></td>
                          <td class="text-center"><?php echo $var10; ?></td>
                          <td class="text-center"><?php echo $var11; ?></td>
                          <td class="text-center"><?php echo $var12; ?></td>
                        <!--INICIO DEL MODAL DE EDITAR PREGUNTA -->
                          <div id="EDITARMATRICULA<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITARMATRICULA" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Matricula Academica </h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_Matricula" id="id_matricula">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_matricula">Matricula Academica</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="60" minlength="5"    autocomplete = "off" type="text"  name="editar_pregunta" id="editar_pregunta">
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
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="pregunta_eliminar" id="pregunta_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar la matricula academica  <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_PREGUNTA" id="ELIMINAR_PREGUNTA"  class="btn btn-primary">Si,eliminar</button>      
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
                      </div>
                      </div>
  </section><!-- FINAL SECTION -->

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVA PREGUNTAL -->
  <div id="AGREGAR_MATRICULA" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Matricula Academica</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_pregunta">Matricula Academica</label>
                                    <input  type="text"   class="form-control"  maxlength="50" minlength="5"   autocomplete = "off" type="text"  placeholder="Ingrese Matricula academica" name="matricula" id="matricula">
                                </div>
                            </div>
                          
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_matricula" name="agregar_matricula" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO PREGUNTA --> 

  <!-- Button trigger modal -->

  </section>
<!-- Modal -->

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_preguntas').DataTable();
} );
</script>
