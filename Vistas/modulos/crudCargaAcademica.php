<?php
 include_once "conexion1.php";
 include_once "conexion3.php";
?>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
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
              <a class="nav-link"  href="procesoCargaAcademica">Carga Academica</a>
            </li>
            <li class="nav-item">
              <a class=" nav-link active" href="#">Ver carga</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled">Otros</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-12">
                <a href="procesoCargaAcademica">
                <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Agregar Nueva Carga</button>
                </a>
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
                              <th class="text-center">ID</th>
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
                            $query = "SELECT c.CODIGO_CARGA, c.CODIGO_TUTORIA, t.NOMBRE, c.CODIGO_PERSONA_TUTOR, p.PRIMER_NOMBRE ,c.CODIGO_MODALIDAD, c.SECCION, c.HORA, c.FECHA_INICIO, c.FECHA_FINAL, c.CREADO_POR_USUARIO, c.FECHA_CREACION, c.MODIFICADO_POR, c.FECHA_MODIFICACION
                            FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m 
                            WHERE c.CODIGO_PERSONA_TUTOR= p.CODIGO_PERSONA AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA
                            AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA;";
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
                                $var9 = $row['CREADO_POR_USUARIO'];
                                $var10 = $row['FECHA_CREACION'];
                                $var11= $row['MODIFICADO_POR'];
                                $var12= $row['FECHA_MODIFICACION'];
                            ?>
                            <tr>
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
 
                  


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_carga').DataTable();
} );
</script>

<script>
$(document).ready(function() {
 $('#buscador').select2();
       
 });
 </script>