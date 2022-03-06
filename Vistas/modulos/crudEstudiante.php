<?php
 include_once "conexion.php";
 include_once "conexion3.php";
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
           
            <button  data-toggle="modal"  href="#AGREGAR_ESTUDIANTE" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Agregar Nuevo Estudiante</button>
            
          
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Información de los Estudiantes</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_estudiantes" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">Cod Estudiante</th>
                          <th class="text-center">Grado Actual</th>
                          <th class="text-center">Pasatiempos</th>
                          <th class="text-center">Distractor Escolar</th>
                          <th class="text-center">Metas</th>
                          
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT e.CODIGO_ESTUDIANTE, p.CODIGO_PERSONA, s.CODIGO_ESTUDIANTE_SOCIOECONOMICO, e.GRADO_ACTUAL ,e.PASATIEMPOS, e.DISTRACTORES_ESCOLARES, e.METAS FROM tbl_estudiante e , tbl_persona p, tbl_estudiante_socioeconomico s WHERE e.CODIGO_PERSONA= p.CODIGO_PERSONA AND s.CODIGO_ESTUDIANTE_SOCIOECONOMICO= s.CODIGO_ESTUDIANTE_SOCIOECONOMICO;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_ESTUDIANTE'];
                            $var2 = $row['GRADO_ACTUAL'];
                            $var3 = $row['PASATIEMPOS'];
                            $var4 = $row['DISTRACTORES_ESCOLARES'];
                            $var5 = $row['METAS'];
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_ESTUDIANTE" name="ELIMINAR_ESTUDIANTE" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                                <a href="#EDITARESTUDIANTE<?php echo $var1; ?>" data-toggle="modal">
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
                         

                        <!--INICIO DEL MODAL DE EDITAR ESTUDIANTE -->
                          <div id="EDITARESTUDIANTE<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Estudiante</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_estudiante" id="id_estudiante">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Grado Actual</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="2" minlength="1" onkeypress="return solonumero(event)"  autocomplete = "off" type="text"  name="editar_estudiante" id="editar_estudiante">
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Pasatiempos</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" class="form-control"  maxlength="50"     autocomplete = "off" type="text"   name="editar_pasatiempos" id="editar_pasatiempos">
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 

                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Distractores Escolares</label>
                                          <input  type="text"  value ="<?php echo $var4; ?>" class="form-control"  maxlength="20" minlength="5"    autocomplete = "off" type="text" onkeypress="return soloLetras(event);"  name="editar_distractores" id="editar_distractores">
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Metas</label>
                                          <input  type="text"  value ="<?php echo $var5; ?>" class="form-control"  maxlength="50"     autocomplete = "off" type="text"   name="editar_metas" id="editar_metas">
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY --> 

                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_estudiante" name="editar_estudiante" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="estudiante_eliminar" id="estudiante_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar el estudiante<?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_ESTUDIANTE" id="ELIMINAR_ESTUDIANTE"  class="btn btn-primary">Si,eliminar</button>      
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

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVO ESTUDIANTE -->
  <div id="AGREGAR_ESTUDIANTE" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
                    <?php
                    include_once "conexion3.php";
                    $query= "SELECT p.CODIGO_PERSONA,p.PRIMER_NOMBRE FROM tbl_persona p WHERE p.CODIGO_TIPO_PERSONA = 4";
                    $result= $conn->query($query);
                    ?>

                    <?php
                    include_once "conexion3.php";
                    $query1= "SELECT s.CODIGO_TIPOSOCIO,s.NOMBRE_TIPO FROM tbl_contenido_socioeconomico s";
                    $result1= $conn->query($query1);
                    ?>
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Estudiante</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                        <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Nombre Estudiante</label>
                                   
                                    <select class="form-control" name="codigo_persona" id="codigo_estudiante">

                                     <option value="">Seleccionar estudiante</option>
                                     <?php
                                      if ($result->num_rows > 0){
                                        while($row = $result->fetch_assoc()){

                                        

                                       
                                      ?>
                                     <option value="<?php echo $row['CODIGO_PERSONA'];?>"><?php echo $row['PRIMER_NOMBRE'];?></option>
                                     <?php
                                      }
                                    }

                                      ?>
                                   </select>
                                </div>
                                    <!-- INICIO DEL COMBOBOX CONTENIDO SOCIOECONOMICO --> 
                                <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Contenido Socioeconomico</label>
                                   
                                    <select class="form-control" name="contenido_socio" id="contenido_socio">

                                     <option value="">Contenido</option>
                                     <?php
                                      if ($result1->num_rows > 0){
                                        while($row1 = $result1->fetch_assoc()){

                                        

                                       
                                      ?>
                                     <option value="<?php echo $row1['CODIGO_TIPOSOCIO'];?>"><?php echo $row1['NOMBRE_TIPO'];?></option>
                                     <?php
                                      }
                                    }

                                      ?>
                                   </select>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Grado Actual</label>
                                    <input  type="text"  class="form-control"  maxlength="2" minlength="1"  onKeyDown="sinespacio(this);" onkeypress="return solonumero(event)" autocomplete = "off" type="text"  placeholder="Ingrese un nombre al estudiante" name="nombre_estudiante" id="nombre_estudiante">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Pasatiempos</label>
                                    <textarea  type="text"  class="form-control"  maxlength="150"    onkeyup="mayus(this);" autocomplete = "off" type="text"  placeholder="Ingrese una descripción del Estudiante" name="pasatiempos_estudiante" id="pasatiempos_estudiante"></textarea>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 

                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Distractores Escolares</label>
                                    <input  type="text" class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese un distractor" name="distractores_estudiante" id="distractores_estudiante">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Metas</label>
                                    <textarea  type="text" class="form-control"  maxlength="150"    onkeyup="mayus(this);" autocomplete = "off" type="text"  placeholder="Ingrese una meta del Estudiante" name="metas_estudiante" id="metas_estudiante"></textarea>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 

                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="editar_estudiante" name="editar_estudiante" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO ESTUDIANTE --> 

  <!-- Button trigger modal -->


<!-- Modal -->

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_estudiantes').DataTable();
} );
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