<?php
 include_once "conexion1.php";
 include_once "conexion3.php";
?>
<head>

</head>

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
           
            <button  data-toggle="modal"  href="#Agregar_carga" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Agregar Nueva Carga</button>
            
          
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Carga Academica</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="#tabla_Carga" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">Codigo Carga</th>
                          <th class="text-center">codigo Modalidad</th>
                          <th class="text-center">codigo tutoria</th>
                          <th class="text-center">Nombre</th>
                          <th class="text-center">seccion</th>
                          <th class="text-center">hora</th>
                          <th class="text-center">Fecha inicio</th>
                          <th class="text-center">Fecha Final</th>
                          <th class="text-center">Creado por</th>
                          <th class="text-center">Fecha creacion</th>
                          <th class="text-center">Modificado por</th>
                          <th class="text-center">fecha Modificacion</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT c.CODIGO_CARGA, c.CODIGO_TUTORIA, t.NOMBRE, c.CODIGO_PERSONA, p.PRIMER_NOMBRE ,c.CODIGO_MODALIDAD, c.SECCION, c.HORA, c.FECHA_INICIO, c.FECHA_FINAL, c.CREADO_POR, c.FECHA_CREACION, c.MODIFICADO_POR, c.FECHA_MODIFICACION FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDAD;";

                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_CARGA'];
                            $var2 = $row['CODIGO_MODALIDAD'];
                            $var3 = $row['CODIGO_TUTORIA'];
                            $var4 = $row['PRIMER_NOMBRE'];
                            $var5 = $row['SECCION'];
                            $var6 = $row['HORA'];
                            $var7 = $row['FECHA_INICIO'];
                            $var8 = $row['FECHA_FINAL'];
                            $var9 = $row['CREADO_POR'];
                            $var10 = $row['FECHA_CREACION'];
                            $var11= $row['MODIFICADO_POR'];
                            $var12= $row['FECHA_MODIFICACION'];
                           
                           
                           
                           
                           
                         
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                



                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_CARGA" name="ELIMINAR_CARGA" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>




                               
                                <a href="#EDITARCARGA<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>



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
                          <td class="text-center"><?php echo $var11; ?></td>
                          <td class="text-center"><?php echo $var12; ?></td>

                        <!--INICIO DEL MODAL DE EDITAR ROL -->
                          <div id="EDITARCARGA<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Carga</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_rol" id="id_rol">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre</label>
                                          <input  type="text"  value ="<?php echo $var4; ?>" class="form-control"  maxlength="20" minlength="5"    autocomplete = "off" type="text" onkeypress="return soloLetras(event);"  name="editar_nombre" id="editar_nombre">
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Seccion</label>
                                          <input  type="text"  value ="<?php echo $var5; ?>" class="form-control"  maxlength="150"     autocomplete = "off" type="text"   name="editar_carga" id="editar_carga">
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_Carga" name="editar_Carga" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="ELIMINAR_CARGA" id="ELIMINAR_CARGA">
                                    <h4 class="text-center">¿Esta seguro de eliminar la carga Academica <?php echo $var1; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_CARGA" id="ELIMINAR_CARGA"  class="btn btn-primary">Si,eliminar</button>      
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
   <div id="AGREGAR_carga" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRCARGA" method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Carga</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtSeccion">PRIMER_NOMBRE</label>
                                    <input  type="text"  value ="<?php echo $var1; ?>" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese un nombre al ala carga" name="nombre_carga" id="nombre_carga">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtHora">SECCION</label>
                                    <textarea  type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="150"    onkeyup="mayus(this);" autocomplete = "off" type="text"  placeholder="Ingrese la hora" name="Hora" id="Hora"></textarea>
                                </div>
                                </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtCREADO_POR">HORA</label>
                                    <textarea  type="text"  value ="<?php echo $var3; ?>" class="form-control"  maxlength="150"    onkeyup="mayus(this);" autocomplete = "off" type="text"  placeholder="Ingrese el usuario" name="editar_Usuario" id="editar_Usuario"></textarea>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_carga" name="agregar_carga" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEV --> 

  <!-- Button trigger modal -->


<!-- Modal -->

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_carga').DataTable();
} );
</script>
