<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once 'conexionpdo.php';
 include "conexionpdo.php";
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
        <h4>Historial de Tutorías del Estudiante </h4>
    </div>
    <section class="content">
       <div class="card"> 
       <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link " style="color:#000000;" href="matriculaestudiantes">Tutorías Actuales</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="">Historial Tutorías</a>
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
                         <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
                        <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                        </div>
                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                            <table id="tabla_citas" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th class="text-center">Fecha Matrícula</th>
                                            <th class="text-center">Tutoría</th>
                                            <th class="text-center">Área</th>
                                            <th class="text-center">Hora Inicio</th>
                                            <th class="text-center">Hora Final</th>
                                            <th class="text-center">Fecha Inicio</th>
                                            <th class="text-center">Fecha Final</th>
                                            <th class="text-center">Modalidad</th>
                                            <th class="text-center">Grado</th>
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
                                        $query =  "SELECT tma.FECHA_MATRICULA , 
                                        tca.HORA as inicial , 
                                        tca.HORA_FINAL , 
                                        tca.FECHA_INICIO ,
                                        tca.FECHA_FINAL , 
                                        tt.NOMBRE as tutoria,
                                        ta.NOMBRE  as area, 
                                        tm.TIPO as modalidad,
                                        ts.NOMBRE  as seccion
                                        from  tbl_matricula_academica tma 
                                        left join tbl_carga_academica tca                 on tca.CODIGO_CARGA = tma.CODIGO_CARGA 
                                        left join tbl_estudiante te                       on te.CODIGO_ESTUDIANTE = tma.CODIGO_ESTUDIANTE
                                        left join tbl_persona tp                          on te.CODIGO_PERSONA   = tp.CODIGO_PERSONA 
                                        left join tbl_tutoria tt                          on tt.CODIGO_TUTORIA  = tca.CODIGO_TUTORIA 
                                        left join tbl_area ta                             on ta.CODIGO_AREA  = tt.CODIGO_AREA 
                                        left join tbl_modalidad tm                        on tm.CODIGO_MODALIDA = tca.CODIGO_MODALIDAD 
                                        left join tbl_seccion ts                          on ts.CODIGO_SECCION  = tca.CODIGO_SECCION 
                                        where tp.CODIGO_PERSONA  = '$cod_usuario' ";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            $contador = 0;
                                            while ($row = $result->fetch_assoc()) {
                                                $contador = ($contador+1);
                                                $var1 = $row['FECHA_MATRICULA'];
                                                $var2 = $row['tutoria'];
                                                $var3 = $row['area'];
                                                $var4 = $row['inicial'];
                                                $var5 = $row['HORA_FINAL'];
                                                $var6 = $row['FECHA_INICIO'];
                                                $var7 = $row['FECHA_FINAL'];
                                                $var8 = $row['modalidad'];
                                                $var9 = $row['seccion'];
                                                 ?>
                                                <tr>
                                                    <td class="text-center"><?php echo $contador; ?></td>
                                                    <td class="text-center"><?php echo $var1; ?></td>
                                                    <td class="text-center"><?php echo $var2; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo $var4; ?></td>
                                                    <td class="text-center"><?php echo $var5; ?></td>
                                                    <td class="text-center"><?php echo $var6; ?></td>
                                                    <td class="text-center"><?php echo $var7; ?></td>
                                                    <td class="text-center"><?php echo $var8; ?></td>
                                                    <td class="text-center"><?php echo $var9; ?></td>   
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
      window.open('Reportes_Prosecar/Reportehistoricotutorias.php','_blank');
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
        "search": "Buscar Tutoria:",
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