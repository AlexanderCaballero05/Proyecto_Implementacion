<?php
 include_once "conexion1.php";
 include_once "conexion3.php";
?>
<head>

</head>

</head>
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">
      
      <div class="card ">
        <div class="card-header">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
              <a class=" nav-link active" href="#">Ver carga</a>
            </li>
            <li class="nav-item">
             <a class="nav-link"  href="procesoCargaAcademica">Carga Academica</a>
            </li>

            <li class="nav-item">
             <a class="nav-link"  href="procesoBuscarCarga">Editar Carga</a>
            </li>
          </ul>
        </div>
        <div class="card-body"> 
          <div class="row">
            <div class="col-md-12">
                <a href="procesoCargaAcademica" >
                <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-info mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Carga</button>
                </a>
                <a href="procesoBuscarCarga" >
                <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  class="btn btn-warning mb-3"><span> <i class="nav-icon  fas fa-edit mx-1"></i></span>Editar Carga</button>
                </a>
                
                <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>
                <button hidden  onclick="Descargar1()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>PDF estudiantes</button>
              
              <!-- jquery validation -->
              <div class="card card-primary">
                <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
                  <h1 class=" card-title text-center"><strong style="color:black;">Carga Academica</strong></h1>
                </div>
                <form  method="POST"><!-- form start -->
                  <div class="card-body">
                    <div class="table-responsive">
                      <table id="#example1" class="table table-bordered table-striped">
                          <thead>
                            <tr>
                              <th class="text-center">Modalidad</th>
                              <th class="text-center">tutoria</th>
                              <th class="text-center">Tutor</th>
                              <th class="text-center">Seccion</th>
                              <th class="text-center">Hora</th>
                              <th class="text-center">Fecha inicio</th>
                              <th class="text-center">Fecha Final</th>
                              <th class="text-center">Creado por Usuario</th>
                              <th class="text-center">Fecha creacion</th>
                              <th class="text-center">Modificado por</th>
                              <th class="text-center">fecha Modificacion</th>
                            </tr>
                          </thead>
                          <tbody>
                            <?php
                            $query = "SELECT c.CODIGO_CARGA,t.NOMBRE as TUTORIA,  CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
                            as NOMBRE_COMPLETO  ,m.TIPO as MODALIDAD, c.SECCION, c.HORA, c.FECHA_INICIO, c.FECHA_FINAL, c.CREADO_POR_USUARIO, c.FECHA_CREACION, c.MODIFICADO_POR, c.FECHA_MODIFICACION
                            FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m 
                            WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA
                            AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA";

                            $result = $conn->query($query);
                            if ($result->num_rows > 0) {
                              while($row = $result->fetch_assoc()) {
                                $var2 = $row['MODALIDAD'];
                                $var3 = $row['TUTORIA'];
                                $var4 = $row['NOMBRE_COMPLETO'];
                                $var5 = $row['SECCION'];
                                $var6 = $row['HORA'];
                                $var7 = $row['FECHA_INICIO'];
                                $var8 = $row['FECHA_FINAL'];
                                $var9 = $row['CREADO_POR_USUARIO'];
                                $var10 = $row['FECHA_CREACION'];
                                $var11= $row['MODIFICADO_POR'];
                                $var12= $row['FECHA_MODIFICACION'];
                            ?>
                            <tr>
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
            
        </div><!--Fin del card body general -->
      </div><!--Fin del card general --> 

    </div><!-- FINAL CONTAINER FLUID --> 
  </section><!-- FINAL SECTION -->
 
                  
  <script>
    function Descargar() {
      window.open('Vistas/modulos/reporte.php','_blank');
      window.open(this.href,'_self');
    }
  </script>

<script>
    function Descargar1() {
      window.open('Vistas/modulos/reporteEstudiante.php','_blank');
      window.open(this.href,'_self');
    }
  </script>



<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
    $(document).ready( function () {
        $('#tabla_carga').DataTable();
    } );
</script>
<script>
$(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": true, "autoWidth": false,
      "buttons": [                    
        {
            extend: 'excelHtml5',
            exportOptions: {
            columns: [ 1, 2, 3, 4, 5, 6]
                }
        },  
        {
            extend: 'pdfHtml5',
            exportOptions: {
            columns: [ 1, 2, 3, 4, 5, 6 ]
                }
        },          
        {
            extend: 'print',
            exportOptions: {
            columns: [ 1, 2, 3, 4, 5, 6  ]
                }
        }
      ]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
  });
</script>