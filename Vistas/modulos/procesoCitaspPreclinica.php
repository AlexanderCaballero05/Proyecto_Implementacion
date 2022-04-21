<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
 include "conexionpdo.php";
$codigoObjeto = 32;///CAMBIAR 
$accion = 'Ingreso a la pantalla de mantenimiento de Inscripcion Cita ';
$descripcion = 'Ver los registros de los Inscripcion Cita ';
bitacora($codigoObjeto, $accion, $descripcion);
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

    <section class="content-header text-xl-center mb-3 btn-light"> 
          <h4> REGISTRAR PRECLINICA <i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
    <section class="content">
       <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="#">personas preclinica</a>
            </li>
            <li class="nav-item" disabled="disabled">
            <a class="nav-link" style="color:#000000;" href="#">Registrar preclinica</a>
            </li>
           
          </ul>
        </div>
        <div class="card-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
            
                   
                    <!-- jquery validation -->
                    <div class="card card-primary">
                        <div class="card-header text-center" style="background-color: #F7F8F9";>
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                            <h1 class=" card-title text-center"><strong style="color:black;">Citas previas</strong></h1>
                        </div>
                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tabla_citas" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Acción</th>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">Fecha cita</th>
                                            <th class="text-center">Hora</th>
                                            <th class="text-center">Medico</th>
                                            <th class="text-center">Paciente</th>
                                            <th class="text-center">Estado cita</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                        $usuario= $_SESSION['vario'];
                                        //Consulta que trae el codigo del usuario
                                        $sentencia1 = $db->prepare("SELECT p.CODIGO_PERSONA
                                        FROM tbl_usuario u, tbl_persona p 
                                        WHERE u.CODIGO_PERSONA = p.CODIGO_PERSONA
                                        AND NOMBRE_USUARIO = (?);");
                                        $sentencia1->execute(array($usuario));
                                        $cod_usuario=$sentencia1->fetchColumn();
                                    ?>

                                        <?php
                                    
                                        $query = "SELECT  IC.CODIGO_CITA,IC.FECHA_CITA, IC.HORARIO , IC.CODIGO_PERSONA ,IC.CODIGO_ESPECIALISTA , CONCAT_WS(' ',P.PRIMER_NOMBRE, P.SEGUNDO_NOMBRE, P.PRIMER_APELLIDO,P.SEGUNDO_APELLIDO) AS 
                                        MEDICO , CONCAT_WS(' ',OT.PRIMER_NOMBRE, OT.SEGUNDO_NOMBRE, OT.PRIMER_APELLIDO,OT.SEGUNDO_APELLIDO) AS PACIENTE, IC.CODIGO_ESTADO ,est.NOMBRE as nombre_estado, ar.NOMBRE as nombre_area, espe.NOMBRE as nombre_especialidad
                                        FROM tbl_inscripcion_cita IC ,tbl_persona P ,tbl_persona_especialidad E ,tbl_persona OT, tbl_area a, tbl_estado est, tbl_area ar, tbl_especialidad espe
                                        WHERE E.CODIGO_PERSONA = P.CODIGO_PERSONA 
                                        AND ic.AREA_CITA = ar.CODIGO_AREA
                                        AND ic.CODIGO_ESTADO = est.CODIGO_ESTADO
                                        AND IC.AREA_CITA = a.CODIGO_AREA
                                        AND IC.CODIGO_ESPECIALISTA = E.CODIGO_PERSONA_ESPECIALIDAD 
                                        AND E.CODIGO_ESPECIALIDAD = espe.CODIGO_ESPECIALIDAD
                                        AND  OT.CODIGO_PERSONA = IC.CODIGO_PERSONA
                                        AND IC.AREA_CITA = '2'
                                        AND est.CODIGO_ESTADO = '9'
                                        AND IC.FECHA_CITA = CURDATE();" ;
                                      
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['CODIGO_CITA'];
                                                $var2 = $row['PACIENTE'];
                                                $var3 = $row['FECHA_CITA'];
                                                $var4 = $row['HORARIO'];
                                                $var5 = $row['nombre_estado'];
                                                $var6 = $row['CODIGO_PERSONA'];
                                                $var7 = $row['MEDICO'];
                                               
                                        ?>
                                                <tr>
                                                    <td>
                                                        <div class="text-center">
                                                            <div class="btn-group">
                                                              

                                                                  
                                                                <a href="#editar_cita<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button type='button' style="color:white;" class="form-control btn btn-warning"><span>
                                                                     <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                                                </a>

                                                              <a href="#ver_cita<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button type='button' style="color:white;" class="form-control btn btn-success"><span></span>Enviar</button>
                                                              </a>


                                                            </div>
                                                        </div><!-- final del text-center -->
                                                    </td>
                                                    <td class="text-center"><?php echo $var1; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo $var4; ?></td>
                                                    <td class="text-center"><?php echo $var7; ?></td>
                                                    <td class="text-center"><?php echo $var2; ?></td>
                                                    <td class="text-center"><?php echo $var5; ?></td>
                                                 
                                                    
                                                    <!-- editar cita editar -->
                                                    
                                                    <div  class="modal fade"  
                                                    id="editar_cita<?php echo $var1 ?>" role="dialog"  >
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content  editar-->
                                                                <form method="POST">
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Editar Cita  
                                                                    </h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <!-------------CUERPO DEL MODAL  editar--------------> 
                                                                <div class="modal-body"> 
                                                                <!-------- INICIO PRIMERA ROW editar ----------->         
                                                           <div class="row"> 
                                                                    <input type="text" value="<?php echo $var1; ?>" 
                                                                    hidden class="form-control"
                                                                    name="cod_edit_cita" id="cod_edit_cita" >
                                                                   
                                                                
                                                              
                                                                   <?php
                                                                        include "conexion1.php";
                                                                        $queryr = "SELECT es.CODIGO_ESTADO ,es.NOMBRE AS Nombre_estado
                                                                        FROM tbl_estado es
                                                                        WHERE  es.CODIGO_ESTADO = 7;";
                                                                        $resultador=$conn->query($queryr);
                                                                        ?>  


                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                          <label for="txtcodigo_persona">Estado cita:</label>
                                                                            <select class="form-control" name="MODUSUARIO" required="">
                                                                                <option selected disabled value="">Elegir...</option>
                                                                                            <?php 
                                                                                        if ($resultador->num_rows > 0) {
                                                                                            while($rowr = $resultador->fetch_assoc()) { ?>
                                                                                <option value="<?php echo $rowr['CODIGO_ESTADO'];?>"><?php echo $rowr['Nombre_estado']; ?></option>
                                                                                        <?php } 
                                                                                            }?>
                                                                            </select>
                                                                                    <div class="invalid-feedback">
                                                                                        Eliga una opción.
                                                                                    </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                        <!-- ------------------ FIN PRIMERA ROW editar---------------------- -->
                                                            <div class="modal-footer ">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="edit_cita"  id = "edit_cita" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                              
                                                            </div>
                                                                    </div><!--FIN CUERPO DEL MODAL editar --> 
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL editar -->




                                                    <div  class="modal fade"  
                                                    id="ver_cita<?php echo $var1 ?>" role="dialog"  >
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content  editar-->
                                                                <form method="POST">
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Ver Cita  
                                                                    </h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <!-------------CUERPO DEL MODAL  editar--------------> 
                                                                <div class="modal-body"> 
                                                                <!-------- INICIO PRIMERA ROW editar ----------->  
                                                                <input type="text" value="<?php echo $var1; ?>" 
                                                                        hidden class="form-control"
                                                                        name="codigo_enviar_cita" id="cod_edit_cita" >

                                                                        <input type="text" value="<?php echo $var6; ?>" 
                                                                        hidden class="form-control"
                                                                        name="codigo_persona" id="codigo_persona" >

                                                                        

                                                                        <h2 class="text-center">Información de cita</h2>
                                                                        <br>
                                                                    <div class="row"> 
                                            
                                                                        <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <p><b class="p-1">Fecha de la cita:</b> <?php echo $var3; ?></p>
                                                                                </div>
                                                                        </div>


                                                                        <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <p><b class="p-1">Hora de la cita:</b> <?php echo $var4; ?></p>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="dropdown-divider"></div>

                                                                    <div class="row"> 
                                                                            <div class="col-sm-12">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Paciente:</b> <?php echo $var2; ?></p>
                                                                                        </div>
                                                                                </div>

                                                                        
                                                                    </div>


                                                                  


                                                                    <div class="row"> 
                                                                            <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Estado: </b> <?php echo $var5; ?></p>

                                                                                        </div>
                                                                                </div>
                                                                    </div>
                                                             
                                                                </div> 
                                                        <!-- ------------------ FIN PRIMERA ROW editar---------------------- -->
                                                            <div class="modal-footer ">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="enviar_cita_medica"  id = "enviar_cita" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Enviar a preclinica</button>
                                                              
                                                            </div>
                                                                    </div><!--FIN CUERPO DEL MODAL editar --> 
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL editar -->

                                                    <!-- inicio modal eliminar  -->   
                                                    <div id="ELIMINAR<?php echo $var1 ?>"   name="eliminar_cod_cita" id="eliminar_cod_cita"class="modal fade" role="dialog">
                                                    <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="FORMEeliminar" method="POST">
                                                        <div class="modal-body">
                                                            <input type="text" 
                                                            value ="<?php echo $var1; ?>" hidden class="form-control"
                                                             name="eliminar_nue_cita" id="eliminar_nue_cita">
                                                            <h4 class="text-center">¿Esta seguro de eliminar este campo? <?php echo $var4; ?>?</h4>
                                                        </div> <!--fin el card body eliminar -->
                                                            <div class="modal-footer ">

                                                            <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                            <button type="submit"  
                                                            name="eliminar_cita" id="eliminar_cita"  class="btn btn-primary">Si,eliminar</button>      
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
                            </div>
                            <!--fin del div de responsivi -->
                        </div> <!-- /.card-body -->

                    </div><!-- fINAL DEL card PRIMARY -->
                </div>


                <!--FINAL DE COL-M12-->
            </div><!-- FINAL ROW PADRE -->
        <!-- FINAL CONTAINER FLUID -->
        <div>
        <div>
    </section><!-- FINAL SECTION -->  
    <!-- Button trigger modal -->
</div><!-- /.content-wrapper -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control Sidebar -->
</aside>
<!-- /.control-sidebar -->
</div>
</div><!-- /.content-wrapper -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control Sidebar -->
</aside>
</div><!-- ./wrapper -->

<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteCita.php','_blank');
      window.open(this.href,'_self');
    }
  </script>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_citas').DataTable({

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
        "search": "Buscar Cita:",
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



  

<!--♠DianaRut *No me quiten los creditos modificado por Gissela y Any :( -->

