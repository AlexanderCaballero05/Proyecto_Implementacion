<?php
include_once "conexion.php";
include_once "conexion3.php";
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
    <div class="content-header text-xl-center mb-3 btn-light">
              <h4>CITAS GENERALES PROSECAR </h4>
    </div>
    <section class="content">
       <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="#">Citas Medicas</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="procesocita">Registar Cita</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <a href="procesocita" >
                    <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-info mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Registrar Cita</button>
                    </a>
                    <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>
                    </br></br>
                    <div class="row">
                        <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Desde:</label>
                        <div class="col-sm-2">
                        <input class="form-control" type="date" id="bd-desde" name="desde" value="" />
                        </div>
                        <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Hasta:</label>
                        <div class="col-sm-2">
                        <input class="form-control" type="date" id="bd-desde" name="desde" value="" />
                        </div>
                        <button type="submit" class="btn btn-primary"  name="filtrartutor" class="col-sm-1 col-form"><span> <i class="nav-icon fa fa-search mx-1"></i></span>Generar</button>  
                   </div><!--fin de row -->
                   </br></br>
                    <!-- Codigo de permiso de insertar -->
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
                      if($permiso_registrar = 'ON'){
                     ?>
                    <?php 
                      }
                     ?>
                   
                    <div class="card ">
                        <div class="card-header text-center" style="background-color: #F7F8F9";>
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                            <h1 class=" card-title text-center"><strong style="color:black;">Registro de citas previas</strong></h1>
                        </div>
                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tabla_citas" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">ACCION</th>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">FECHA CITA</th>
                                            <th class="text-center">HORA</th>
                                            <th class="text-center">BENEFICIARIO</th>
                                            <th class="text-center">ENCARGADO DE CITA</th>
                                            <th class="text-center">ESPECIALIDAD</th>
                                            <th class="text-center">AREA</th>
                                            <th class="text-center">ESTADO DE CITA</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                    
                                        $query = "SELECT  IC.CODIGO_CITA,IC.FECHA_CITA,IC.HORARIO , IC.CODIGO_PERSONA ,IC.CODIGO_ESPECIALISTA , CONCAT_WS(' ',P.PRIMER_NOMBRE, P.SEGUNDO_NOMBRE, P.PRIMER_APELLIDO,P.SEGUNDO_APELLIDO) AS 
                                        MEDICO , CONCAT_WS(' ',OT.PRIMER_NOMBRE, OT.SEGUNDO_NOMBRE, OT.PRIMER_APELLIDO,OT.SEGUNDO_APELLIDO) AS PACIENTE, IC.CODIGO_ESTADO ,est.NOMBRE as nombre_estado, ar.NOMBRE as nombre_area, espe.NOMBRE as nombre_especialidad
                                        FROM tbl_inscripcion_cita IC ,tbl_persona P ,tbl_persona_especialidad E ,tbl_persona OT, tbl_area a, tbl_estado est, tbl_area ar, tbl_especialidad espe
                                        WHERE E.CODIGO_PERSONA = P.CODIGO_PERSONA 
                                        AND ic.AREA_CITA = ar.CODIGO_AREA
                                        AND ic.CODIGO_ESTADO = est.CODIGO_ESTADO
                                        AND IC.AREA_CITA = a.CODIGO_AREA
                                        AND IC.CODIGO_ESPECIALISTA = E.CODIGO_PERSONA_ESPECIALIDAD 
                                        AND E.CODIGO_ESPECIALIDAD = espe.CODIGO_ESPECIALIDAD
                                        AND  OT.CODIGO_PERSONA = IC.CODIGO_PERSONA
                                        AND est.CODIGO_ESTADO = '5' ;
                                        ";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['CODIGO_CITA'];
                                                $var2 = $row['FECHA_CITA'];
                                                $var3 = $row['HORARIO'];
                                                $var4 = $row['PACIENTE'];
                                                $var5 = $row['MEDICO'];
                                                $var6 = $row['nombre_estado'];
                                                $var7 = $row['nombre_area'];
                                                $var8 = $row['nombre_especialidad'];
                                        ?>
                                                <tr>
                                                    <td>
                                                        <div class="text-center">
                                                            <div class="btn-group">
                                                               <!-- Codigo de permiso para Eliminar -->

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
                                                                        $evaluar_permiso_actualizar->execute(array($usuariomo, '1'));
                                                                        $row1=$evaluar_permiso_actualizar->fetchColumn();
                                                                        $permiso_actualizar =$row1; 
                                                                    
                                                                    }
                                                                    ?>  <!-- fin del codigo para sustraer el permiso de actualizar-->
                                                                     <?php 
                                                                    if($permiso_actualizar= 'ON'){
                                                                    ?>
                                                                <a href="#editar_cita<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button type='button' style="color:white;" class="btn btn-warning"><span>
                                                                     <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                                                </a>

                                                                    <?php 
                                                                        }
                                                                        ?>


                                                              <a href="#ver_cita<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button type='button' style="color:white; background-color:#3DC2F6;" class="btn "><span>
                                                                     <i class="nav-icon fas fa-eye mx-1"></i></span></button>
                                                              </a>


                                                            </div>
                                                        </div><!-- final del text-center -->
                                                    </td>
                                                    <td class="text-center"><?php echo $var1; ?></td>
                                                    <td class="text-center"><?php echo $var2; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo $var4; ?></td>
                                                    <td class="text-center"><?php echo $var5; ?></td>
                                                    <td class="text-center"><?php echo $var8; ?></td>
                                                    <td class="text-center"><?php echo $var7; ?></td>
                                                    <td class="text-center"><?php echo $var6; ?></td>
                                                    
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
                                                                    <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="fecha" class="form-label">Fecha de la cita: </label>
                                                                        <input type="date" value="<?php echo $var2; ?>" 
                                                                        required max="<?php $hoy=date("Y"); echo $hoy;?>"  
                                                                        class="form-control" 
                                                                        name="edit_fecha_cita" id="edit_fecha_cita">
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="txtcodigo_persona"> Hora: </label>
                                                                            <input type="time"  value="<?php echo $var3; ?>" 
                                                                            required min="09:00" step="900" max= "17:00" step="1700"
                                                                            class="form-control" 
                                                                            name="edit_hora" id="edit_hora">
                                                                        </div>
                                                                </div>
                                                                </div> 
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


                                                                <div class="row">
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
                                                                        name="cod_enviar_cita" id="cod_edit_cita" >

                                                                        <input type="text" value="<?php echo $var6; ?>" 
                                                                        hidden class="form-control"
                                                                        name="estado_cita" id="cod_edit_cita" >

                                                                        <h2 class="text-center">Informacion de cita</h2>
                                                                        <br>
                                                                    <div class="row"> 
                                            
                                                                        <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <p><b class="p-1">Fecha de la cita:</b> <?php echo $var2; ?></p>
                                                                                </div>
                                                                        </div>


                                                                        <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <p><b class="p-1">Hora de la cita:</b> <?php echo $var3; ?></p>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="dropdown-divider"></div>

                                                                    <div class="row"> 
                                                                            <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Beneficiario:</b> <?php echo $var4; ?></p>
                                                                                        </div>
                                                                                </div>

                                                                        
                                                                    </div>


                                                                    <div class="row"> 
                                                                            <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Servicio:</b> <?php echo $var7; ?></p>

                                                                                        </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Especialidad: </b> <?php echo $var8; ?></p>

                                                                                        </div>
                                                                                </div>
                                                                        
                                                                    </div>


                                                                    <div class="row"> 
                                                                            <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Encargado: </b> <?php echo $var5; ?></p>

                                                                                        </div>
                                                                                </div>

                                                                        
                                                                    </div>
                                                             
                                                                </div> 
                                                        <!-- ------------------ FIN PRIMERA ROW editar---------------------- -->
                                                            <div class="modal-footer ">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="enviar_cita"  id = "enviar_cita" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Enviar cita</button>
                                                              
                                                            </div>
                                                                    </div><!--FIN CUERPO DEL MODAL editar --> 
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL editar -->

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
                    </div><!-- fINAL DEL card de la tabla-->
                </div>

                <!--FINAL DE COL-M12-->
            </div><!-- FINAL ROW PADRE -->
        <!-- FINAL CONTAINER FLUID -->
       </div>
     </div>
    </section><!-- FINAL SECTION -->  
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

