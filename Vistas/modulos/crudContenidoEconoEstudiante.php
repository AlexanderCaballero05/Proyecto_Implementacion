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
  <div class="content-header text-xl-center mb-3 btn-light">
              <h4>VER DATOS SOCIO-ECONOMICOS </h4>
  </div>
  <section class="content">
    <div class="container-fluid">
      <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link " style="color:#000000;" href="crudEstudiante">Ver Estudiantes</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="procesoRegistrarEstudiante">Registrar Estudiantes</a>
            </li>
              <li class="nav-item ">
              <a class="nav-link active"  style="color:#000000;"href="crudContenidoEconoEstudiante">Ver Datos Socioeconomicos</a>
              </li>
          </ul>
        </div>
        <div class="card-body">
      <div class="row">
        <div class="col-md-12">
          </br>
          <!-- card de la tabla-->
          <div class="card "> 
            <div class="card-header text-center" ><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">Información de los Estudiantes</strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_estudiantes" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">ACCION</th>
                          <th class="text-center">ID</th>
                          <th class="text-center">NOMBRE ESTUDIANTE</th>
                          <th class="text-center">CONTENIDO SOCIO-ECONOMICO</th>
                          <th class="text-center">NOMBRE TIPO CONTENIDO</th>
                          
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT es.CODIGO_ESTUDIANTE_SOCIOECONOMICO as codigo_tabla, es.CODIGO_CONTENIDO_SOCIOECONOMICO as codigo_contenido, es.CODIGO_ESTUDIANTE as codigo_estudiante , p.PRIMER_NOMBRE as nombre_estudiante, t.TIPO as Contenido_Socieconomico ,c.NOMBRE_TIPO as nombre_tipo_contenido
                        FROM tbl_tipo_socioeconomico t, tbl_contenido_socioeconomico c, tbl_estudiante_socioeconomico es, tbl_estudiante e , tbl_persona p
                        WHERE es.CODIGO_ESTUDIANTE = e.CODIGO_ESTUDIANTE
                        AND es.CODIGO_CONTENIDO_SOCIOECONOMICO = c.CODIGO_CONTENIDO_SOCIOECONOMICO
                        AND t.CODIGO_TIPOSOCIO = c.CODIGO_TIPOSOCIO
                        AND e.CODIGO_PERSONA = p.CODIGO_PERSONA
                        ORDER BY codigo_tabla asc;";


                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['codigo_contenido'];
                            $var2 = $row['codigo_estudiante'];
                            $var3 = $row['nombre_estudiante'];
                            $var4 = $row['Contenido_Socieconomico'];
                            $var5 = $row['nombre_tipo_contenido'];
                            $var6 = $row['codigo_tabla'];
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
                          <td class="text-center"><?php echo $var6; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var5; ?></td>
                         
                          <!-- Traer los datos socioeconimicos de las tablas-->
                          <?php
                              include_once "conexion3.php";
                              $query1= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO
                              FROM tbl_contenido_socioeconomico s
                              WHERE S.CODIGO_TIPOSOCIO = 1;";
                              $result1= $conn->query($query1);
                           ?>

                            <?php 
                              include_once "conexion3.php";
                              $query2= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO
                              FROM tbl_contenido_socioeconomico s
                              WHERE S.CODIGO_TIPOSOCIO = 2; ";
                              $result2= $conn->query($query2);
                           ?>

                            <?php
                            
                              include_once "conexion3.php";
                              $query3= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO
                              FROM tbl_contenido_socioeconomico s
                              WHERE S.CODIGO_TIPOSOCIO = 3; ";
                              $result3= $conn->query($query3);
                           ?>
                              
                            <?php
                            
                            include_once "conexion3.php";
                            $query4= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO
                            FROM tbl_contenido_socioeconomico s
                            WHERE S.CODIGO_TIPOSOCIO = 4; ";
                            $result4= $conn->query($query4);
                         ?>



                        <!--INICIO DEL MODAL DE EDITAR CONTENIDO SOCIECONOMICO ESTUDIANTE -->
                          <div id="EDITARESTUDIANTE<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Contenido socieconomico</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                    <input type="text" value ="<?php echo $var1;?>" hidden class="form-control" name="id_contenido" id="id_contenido">
                                      <input type="text" value ="<?php echo $var2;?>" hidden class="form-control" name="id_estudiante_conte" id="id_estudiante">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre_Estudiante</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" class="form-control"  maxlength="2" minlength="1" onkeypress="return solonumero(event)"  autocomplete = "off" type="text"  name="editar_estudiante" id="editar_estudiante" disabled>
                                        </div>
                                      </div>



                                      <?php
                                      if ($var4 == 'DISPOSITIVO ELECTRONICO')
                                      { 

                                      ?>

                                      <div class="col-sm-12">
                                          <label for="DISPOSITIVOS" class="control-label">¿Con que dispositivos cuenta?</label> 
                                            <select  style="width: 100%;"  class="form-control select2"  name="EDITDISPOSITIVOS" type="text" aria-placeholder="Buscar" required="" >
                                              <option hidden value="<?php echo $var5?>"> <?php echo $var5 ?></option>
                                            
                                                <?php 
                                                session_start();
                                                $_SESSION['codigo'] = $var5;
                                                    if ($result1->num_rows > 0) {
                                                    while($row1 = $result1->fetch_assoc()) { 
                                                    $codigo = $row1['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                                                    $nombre = $row1['NOMBRE_TIPO'];
                                                    ?>
                                                  <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                                  <?php 
                                                  } 
                                                  }
                                                  ?>
                                                  
                                                </select>
                                      </div>

                                      <?php
                                      }elseif($var4 == 'SERVICIOS DE INTERNET')
                                      {
                                    ?>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">¿Qué servicios de internet utiliza?</label>
                                           <select  style="width: 100%;"  class="form-control select2" name="EDITSERVICIOS"  id="EDITSERVICIOS" type="text" aria-placeholder="Buscar" required="" >
                                            <option hidden value="<?php echo $var5?>"> <?php echo $var5 ?></option>

                                                      <?php 
                                                        if ($result2->num_rows > 0) {
                                                        while($row2 = $result2->fetch_assoc()) { 
                                                        $codigo = $row2['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                                                        $nombre = $row2['NOMBRE_TIPO'];
                                                        ?>
                                                    <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                                      <?php 
                                                      } 
                                                      }
                                                      ?>
                                           </select>
                                        </div>
                                      </div>

                                      <?php
                                      }elseif($var4 == 'PROVEEDOR DE INGRESO')
                                      {
                                    ?>

                                      <div class="col-sm-12">
                                        <div class="form-group">
                                         <label for="EDITPROVEEDOR" class="control-label">¿Quién provee el ingreso familiar?</label> 
                                          <select  style="width: 100%;"  class="form-control select2" name="EDITPROVEEDOR" id="EDITPROVEEDOR" type="text" aria-placeholder="Buscar" required >
                                           <option hidden value="<?php echo $var5?>"> <?php echo $var5 ?></option>

                                                  <?php 
                                                    if ($result3->num_rows > 0) {
                                                    while($row3 = $result3->fetch_assoc()) { 
                                                    $codigo = $row3['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                                                    $nombre = $row3['NOMBRE_TIPO'];
                                                    ?>
                                                <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                                  <?php 
                                                  } 
                                                  }
                                                  ?>
                                          </select>
                                        </div>
                                      </div>

                                      <?php
                                      }elseif($var4 == 'SERVICIOS BASICOS')
                                      {
                                    ?>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                         <label for="BASICOS" class="control-label">¿Con qué servicios básicos cuenta en su casa?</label> 
                                          <select  stye="width: 100%;"  class="form-control select2" name="EDITBASICOS" id="EDITBASICOS" type="text" aria-placeholder="Buscar" required >
                                          <option hidden value="<?php echo $var5?>"> <?php echo $var5 ?></option>
                                                  <?php 
                                                    if ($result4->num_rows > 0) {
                                                    while($row4 = $result4->fetch_assoc()) { 
                                                    $codigo = $row4['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                                                    $nombre = $row4['NOMBRE_TIPO'];
                                                    ?>
                                                <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                                  <?php 
                                                  } 
                                                  }
                                                  ?>
                                          </select>
                                        </div>
                                      </div>

                                      <?php
                                      }
                                      
                                    ?>
                                      

                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY --> 

                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_contenidoSocio" name="editar_contenidoSocio" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                    <h4 class="text-center">¿Esta seguro de eliminar el estudiante<?php echo $var3; ?>?</h4>
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
    </div>
    </div><!--fin del card del menu -->
  </section>
















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



<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_estudiantes').DataTable({

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
        "search": "Buscar Registro:",
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