<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once 'conexionpdo.php';
 include "conexionpdo.php";
$codigoObjeto = 64;///cambiar
$accion = 'INGRESO A PANTALLA DE MANTENIMIENTO CITAS PSICOLÓGICAS ESTUDIANTES ';
$descripcion = 'MANTENIMIENTO A LAS CITAS PSICOLOGICAS ESTUDIANTES ';
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
              <h4>Citas Psocológicas Pendientes Estudiantes Proseca</h4>
    </div>
    <section class="content">
       <div class="card"> 
       <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link " style="color:#000000;" href="citasestudiantes">Citas Médicas</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="">Citas Psicológicas</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="citasespiritualesestudiante">Citas Espirituales</a>
            </li>
          </ul>
        </div>

        <div class="card-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card ">
                    <div class="modal-header" >
                        <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"
                         style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> 
                         <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                        </div>
                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                            <table id="tabla_citas" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Numero</th>
                                            <th class="text-center">Fecha cita</th>
                                            <th class="text-center">Hora</th>
                                            <th class="text-center">Beneficiario</th>
                                            <th class="text-center">Encargado cita</th>
                                            <th class="text-center">Especialidad</th>
                                            <th class="text-center">Área</th>
                                            <th class="text-center">Estado cita</th>
                                            <th class="text-center">Detalle de citas</th>
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
                                        $query = "SELECT  IC.CODIGO_CITA,IC.FECHA_CITA,IC.HORARIO , IC.CODIGO_PERSONA ,IC.CODIGO_ESPECIALISTA , CONCAT_WS(' ',P.PRIMER_NOMBRE, P.SEGUNDO_NOMBRE, P.PRIMER_APELLIDO,P.SEGUNDO_APELLIDO) AS 
                                        MEDICO , CONCAT_WS(' ',OT.PRIMER_NOMBRE, OT.SEGUNDO_NOMBRE, OT.PRIMER_APELLIDO,OT.SEGUNDO_APELLIDO) AS PACIENTE, IC.CODIGO_ESTADO ,est.NOMBRE as nombre_estado, ar.NOMBRE as nombre_area, espe.NOMBRE as nombre_especialidad
                                        FROM tbl_inscripcion_cita IC 
                                      left join tbl_persona_especialidad E   on IC.CODIGO_ESPECIALISTA = E.CODIGO_PERSONA_ESPECIALIDAD 
                                      left join  tbl_persona P               on P.CODIGO_PERSONA = E.CODIGO_PERSONA
                                      left join tbl_persona OT               on OT.CODIGO_PERSONA = IC.CODIGO_PERSONA 
                                      left join tbl_area a                   on IC.AREA_CITA = a.CODIGO_AREA 
                                      left join tbl_estado est               on IC.CODIGO_ESTADO = est.CODIGO_ESTADO
                                      left join tbl_area ar                  on IC.AREA_CITA = ar.CODIGO_AREA 
                                      left join tbl_especialidad espe        on E.CODIGO_ESPECIALIDAD = espe.CODIGO_ESPECIALIDAD   
                                      where   IC.CODIGO_PERSONA = '$cod_usuario' AND  IC.CODIGO_ESTADO =5 and IC.AREA_CITA =3;
                                        ";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            $contador = 0;
                                            while ($row = $result->fetch_assoc()) {
                                                $contador = ($contador+1);
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
                                                    <td class="text-center"><?php echo $contador; ?></td>
                                                    <td class="text-center"><?php echo $var2; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo ucwords(strtolower($var4)); ?></td>
                                                    <td class="text-center"><?php echo ucwords(strtolower($var5));?></td>
                                                    <td class="text-center"><?php echo $var8; ?></td>
                                                    <td class="text-center"><?php echo $var7; ?></td>
                                                    <td class="text-center"><?php echo $var6; ?></td>
                                                    <td>
                                                    <div class="text-center">
                                                        <div class="btn-group">
                                                            <!--Codigo para asignar permiso del boton de editar -->        
                                                            <a>
                                                                <form method="POST"
                                                                 action="Reportes_Prosecar/reporteindividualpsicologicas.php"
                                                                  target="_blank"> 
                                                                <input type="hidden"  name="reporte" 
                                                                value="<?php echo $var1?>">
                                                                <button type='submit'   
                                                                style="color:white;" class="btn btn-success mb-3">
                                                                <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Detalle</button>
                                                                </form>
                                                                </a>
                                                        </div>
                                                    </div><!--fin del text-center -->
                                                    </td>
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
      window.open('Reportes_Prosecar/reportecitaspsicologicas.php','_blank');
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

