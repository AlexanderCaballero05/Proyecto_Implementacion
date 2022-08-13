<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
 include "conexionpdo.php";
$codigoObjeto = 32;///CAMBIAR 
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
    <div class="content-header text-xl-center mb-3 "> 
          <h4>Consultas en Espera</h4>
    </div>
    <section class="content">
       <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
        <ul class="nav nav-tabs card-header-tabs">
         <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="ProcesoCitasPsicologicas">Consultas en Espera</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Registrar Expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consulta Psicológica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de Consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Plan Terapéutico</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="crudPacientesPsicologicos">Lista de Pacientes</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card ">
                        <div class="card-header text-center" style="background-color: #F7F8F9";>
                        </div>
                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tabla_citas" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Acción</th>
                                            <th class="text-center">Código</th>
                                            <th class="text-center">Fecha Cita</th>
                                            <th class="text-center">Hora</th>
                                            <th class="text-center">Nombre Paciente</th>
                                            <th class="text-center">Estado de Cita</th>
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
                                        $query = "SELECT i.CODIGO_CITA, i.CODIGO_PERSONA , CONCAT_WS (' ',DNI,pe.PRIMER_NOMBRE, ' ',pe.SEGUNDO_NOMBRE,' ',pe.PRIMER_APELLIDO,pe.SEGUNDO_APELLIDO) AS PACIENTE, i.FECHA_CITA, i.HORARIO, est.NOMBRE as nombre_estado
                                        FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est
                                        WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                        AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                        AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                        AND es.CODIGO_PERSONA = '$cod_usuario'
                                        AND i.CODIGO_ESTADO = '9' 
                                        AND i.AREA_CITA = '3'
                                        AND I.FECHA_CITA = CURDATE();" ;
                                      
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                            $var1 = $row['CODIGO_CITA'];
                                            $var2 = $row['PACIENTE'];
                                            $var3 = $row['FECHA_CITA'];
                                            $var4 = $row['HORARIO'];
                                            $var5 = $row['nombre_estado'];
                                            $var6 = $row['CODIGO_PERSONA'];
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
                                                                    <button type='button' style="color:white;" class=" form-control btn btn-success"><span>
                                                                     Atender</span></button>
                                                                </a>
                                                            </div>
                                                        </div><!-- final del text-center -->
                                                    </td>
                                                    <td class="text-center"><?php echo $var1; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo $var4; ?></td>
                                                    <td class="text-center"><?php echo $var2; ?></td>
                                                    <td class="text-center"><?php echo $var5; ?></td>
                                                 
                                                    <!-- editar cita editar -->
                                                    <div  class="modal fade" id="editar_cita<?php echo $var1 ?>" role="dialog"  >
                                                        <div class="modal-dialog modal-md">
                                                            <div class="modal-content">
                                                               <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Editar Cita</h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <!-- Modal content  editar-->
                                                                <form method="POST">
                                                                  <!---CUERPO DEL MODAL  editar---> 
                                                                  <div class="modal-body"> 
                                                                       <div class="row"> <!--INICIO PRIMERA ROW editar --> 
                                                                         <input type="text" value="<?php echo $var1; ?>" hidden class="form-control"  name="cod_edit_cita" id="cod_edit_cita" >
                                                                           <?php
                                                                            include "conexion1.php";
                                                                            $queryr = "SELECT es.CODIGO_ESTADO ,es.NOMBRE AS Nombre_estado
                                                                            FROM tbl_estado es
                                                                            WHERE  es.CODIGO_ESTADO <> 1 
                                                                            and es.CODIGO_ESTADO <> 2 
                                                                            and es.CODIGO_ESTADO <> 3 
                                                                            and es.CODIGO_ESTADO <> 4
                                                                            and es.CODIGO_ESTADO <> 6
                                                                            and es.CODIGO_ESTADO <> 8;";
                                                                            $resultador=$conn->query($queryr);
                                                                            ?>  
                                                                         <div class="col-sm-12">
                                                                            <div class="form-group">
                                                                              <label for="txtcodigo_persona">Estado cita</label>
                                                                              <select class="form-control" name="MODUSUARIO" required="">
                                                                                <option selected disabled value="">--Seleccione--</option>
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
                                                               <div class="modal-footer">
                                                                 <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                 <button type="submit" name="enviar_cita_psicologica"  id = "enviar_cita_psicologica" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                               </div>
                                                                    </div><!--FIN CUERPO DEL MODAL editar --> 
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL editar -->

                                                    <div  class="modal fade" id="ver_cita<?php echo $var1 ?>" role="dialog">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Ver cita  Paso <i class="bi bi-1-circle"></i> <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-1-circle" viewBox="0 0 16 16">
                                                                      <path d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM9.283 4.002V12H7.971V5.338h-.065L6.072 6.656V5.385l1.899-1.383h1.312Z"/>
                                                                </svg></h4>
                                                                    
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <form method="POST"><!-- Modal content  editar-->
                                                                   <!---CUERPO DEL MODAL  editar---> 
                                                                   <div class="modal-body"> 
                                                                     <input type="text" value="<?php echo $var1; ?>" hidden class="form-control"
                                                                      name="codigo_cita_psicologica" id="codigo_cita_psicologica" >
                                                                     <input type="text" value="<?php echo $var6; ?>" hidden class="form-control"
                                                                      name="codigo_persona" id="codigo_persona">
                                                                        <h2 class="text-center">Información de Cita</h2><hr><br>
                                                                     <div class="row"> 
                                                                        <div class="col-sm-6">
                                                                            <div class="form-group">
                                                                                <p><b class="p-1">Fecha de la Cita:</b> <?php echo $var3; ?></p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <div class="form-group">
                                                                              <p><b class="p-1">Hora de la Cita:</b> <?php echo $var4; ?></p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="row"> 
                                                                        <div class="col-sm-12">
                                                                            <div class="form-group">
                                                                              <p><b class="p-1">Beneficiario:</b> <?php echo $var2; ?></p>
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
                                                             <div class="modal-footer ">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="enviar_cita_psicologica"  class="btn btn-success"><span></span>Atender Consulta</button>
                                                             </div>
                                                                </div><!--FIN CUERPO DEL MODAL editar --> 
                                                            </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL editar -->


                                        
                                                    <!-- INICIO DEL MODAL ELIMINAR -->   
                                                    <div id="ELIMINAR<?php echo $var1 ?>"   name="eliminar_cod_cita" id="eliminar_cod_cita"class="modal fade" role="dialog"><div class="modal-dialog">
                                                      <div class="modal-content">
                                                        <div class="modal-header">
                                                          <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="FORMEeliminar" method="POST">
                                                         <div class="modal-body">
                                                            <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control"
                                                             name="eliminar_nue_cita" id="eliminar_nue_cita">
                                                            <h4 class="text-center">¿Esta seguro de eliminar este campo? <?php echo $var4; ?>?</h4>
                                                         </div> <!--fin el card body eliminar -->
                                                         <div class="modal-footer ">
                                                            <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                            <button type="submit" name="eliminar_cita" id="eliminar_cita"  class="btn btn-primary">Si,eliminar</button>      
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

