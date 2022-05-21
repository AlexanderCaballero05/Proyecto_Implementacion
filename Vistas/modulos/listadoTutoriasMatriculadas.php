<?php
session_start();
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
?>
<head>

</head>
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div>
      <section class="content">
        <section class="content-header text-xl-center mb-3 btn-light">
              <h4> LISTADO DE TUTORIAS-SECCIONES<i class=" nav-icon fas  fa-graduation-cap"></i> </h4>
        </section>
      <div class="card"> <!--card del menu-->
        <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link"  style="color:#000000;" href="crudMatricula">Ver Matricula</a>
              </li>
              <li class="nav-item">
                <a class="nav-link " style="color:#000000;" aria-current="true" href="procesoMatricula">Matricula</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" style="color:#000000;" aria-current="true" href="procesoMatricula">Lista de clases</a>
              </li>
            </ul>
        </div>
        <div class="card-body">
            <br>
            <div class="row">
                <label class=" col-sm-1 control-label" style="text-align: right; width: 150px;">Buscar por:</label>
                <div class="col-sm-3">
                  <select class="form-control" id="buscar">
                   <option selected disabled value="">--Seleccione--</option>
                     <option value="1">Tutorias</option>
                     <option value="2">Sección</option>
                  </select>
                </div>
                <!--Tutorias -->
                <div class="col-sm-3">
                  <form method="POST" action="listadoTutoriasMatriculadas">
                    <div id="ocultar">
                        <select style="width: 100%" class="form-control select2"  name ="tutoria" >
                            <option selected enable value="" >--Seleccionar--</option>
                        </select>
                     </div>
                    <div style="display: none;" id="tutorias">
                        <?php 
                            $query = "SELECT * FROM tbl_tutoria";
                            $resultadod=$conn->query($query);                
                            ?>
                        <select style="width: 100%" class="form-control select2"  name ="tutoria" >
                            <option selected enable value="" >--Seleccionar Tutoria--</option>
                                <?php 
                                if ($resultadod->num_rows > 0) {
                                    while($row = $resultadod->fetch_assoc()) { 
                                    $codigo_tutoria = $row['CODIGO_TUTORIA'];
                                    $nombre = $row['NOMBRE'];
                                ?>
                                <option value="<?php echo $codigo_tutoria?>" ><?php echo $nombre;?></option>
                                <?php 
                                } 
                                }
                                ?>
                        </select>
                     </div>
                     <div style="display: none;" id="secciones">
                        <?php 
                            $query1 = "SELECT * FROM  tbl_seccion";
                            $resulta=$conn->query($query1);                
                            ?>
                        <select style="width: 100%" class="form-control select2"  name ="seccion" >
                            <option selected enable value="" >--Seleccionar Grado--</option>
                                <?php 
                                if ($resulta->num_rows > 0) {
                                    while($row = $resulta->fetch_assoc()) { 
                                    $codigo_seccion = $row['CODIGO_SECCION'];
                                    $nombre1 = $row['NOMBRE'];
                                ?>
                                <option value="<?php echo $codigo_seccion?>" ><?php echo $nombre1;?></option>
                                <?php 
                                } 
                                }
                                ?>
                        </select>
                     </div>

                     </div><!--fin del div de busqueda -->
                     <div class="col-md-1">
                      <button type="submit"  name="MANDAR_TUTORIA" class=" form-control btn btn-info b"> Generar</button>
                     </div>
                     
                  </form>
            </div>
            <br>
            <?php
              if(isset($_POST['MANDAR_TUTORIA']) && !Empty($_POST['tutoria']) ){
                $tutoria= $_POST["tutoria"];
                $_SESSION['clase'] = $tutoria;
                $consulta = $db->prepare("SELECT ma.CODIGO_MATRICULA,  tu.NOMBRE as ASIGNATURA
                FROM tbl_matricula_academica ma, tbl_carga_academica ca,tbl_tutoria tu
                WHERE ma.CODIGO_CARGA = ca.CODIGO_CARGA
                AND tu.CODIGO_TUTORIA = ca.CODIGO_TUTORIA
                AND tu.CODIGO_TUTORIA = (?)");
                $consulta->execute(array($tutoria));
                $row=$consulta->fetchColumn();
                if($row>0){

                ?>
                <button  onclick="Descargar()"href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
                <div class="table-responsive">
                 <table id="tabla" class="table table-bordered table-striped">
                   <thead>
                       <tr>
                          <th class="text-center">Tutoria</th>
                          <th class="text-center">Nombre tutor</th>
                          <th class="text-center">Nombre del estudiante</th> 
                          <th class="text-center">Modalidad</th>
                          <th class="text-center">Grado</th>
                          <th class="text-center">Hora</th> 
                        </tr>
                   </thead>
                   <tbody>
                     <?php 
                     $query = "SELECT ma.CODIGO_MATRICULA, concat_ws (' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as ESTUDIANTE,
                     (select concat_ws (' ', tp2.PRIMER_NOMBRE, tp2.SEGUNDO_NOMBRE,tp2.PRIMER_APELLIDO,tp2.SEGUNDO_APELLIDO) from tbl_persona tp2
                      where ca.CODIGO_PERSONA = tp2.CODIGO_PERSONA) as NOMBRE_TUTOR, tu.NOMBRE as ASIGNATURA,
                      mo.TIPO as MODALIDAD,  se.NOMBRE as SECCION, ca.HORA
                     FROM tbl_matricula_academica ma, tbl_carga_academica ca, tbl_seccion se, tbl_tutoria tu, 
                     tbl_modalidad mo, tbl_estudiante es, tbl_persona p
                    WHERE ma.CODIGO_CARGA = ca.CODIGO_CARGA
                    AND se.CODIGO_SECCION = ca.CODIGO_SECCION
                    AND tu.CODIGO_TUTORIA = ca.CODIGO_TUTORIA
                    AND mo.CODIGO_MODALIDA = ca.CODIGO_MODALIDAD
                    AND es.CODIGO_ESTUDIANTE = ma.CODIGO_ESTUDIANTE
                    AND p.CODIGO_PERSONA = es.CODIGO_PERSONA
                    AND tu.CODIGO_TUTORIA = '$tutoria';";
                    $result = $conn->query($query);
                    if ($result->num_rows > 0) {
                      while($row = $result->fetch_assoc()) {
                        $var2 = $row['ESTUDIANTE'];
                        $var3 = $row['NOMBRE_TUTOR'];
                        $var4 = $row['ASIGNATURA'];
                        $var5 = $row['MODALIDAD'];
                        $var6 = $row['GRADO_ACTUAL'];
                        $var7 = $row['SECCION'];
                        $var8 = $row['HORA'];
                     ?>
                     <tr>
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var5; ?></td>
                          <td class="text-center"><?php echo $var7; ?></td>
                          <td class="text-center"><?php echo $var8; ?></td>
                     </tr>

                   </tbody>
                    <?php
                      }
                      }
                     ?>
                 </table>
              </div>
                <?php
                 }else{
                ?>
                <p >No se enconto informacion </p>
                <?php
                 }
                }
                ?>

            <?php
              if(isset($_POST['MANDAR_TUTORIA']) && !Empty($_POST['seccion']) ){
                $seccion= $_POST["seccion"];
                $_SESSION['seccion'] = $seccion;
                $consulta = $db->prepare("SELECT ma.CODIGO_MATRICULA,se.NOMBRE as SECCION
                FROM tbl_matricula_academica ma, tbl_carga_academica ca, tbl_seccion se, tbl_tutoria tu, 
                tbl_modalidad mo, tbl_estudiante es, tbl_persona p
               WHERE ma.CODIGO_CARGA = ca.CODIGO_CARGA
               AND se.CODIGO_SECCION = ca.CODIGO_SECCION
               AND tu.CODIGO_TUTORIA = ca.CODIGO_TUTORIA
               AND mo.CODIGO_MODALIDA = ca.CODIGO_MODALIDAD
               AND es.CODIGO_ESTUDIANTE = ma.CODIGO_ESTUDIANTE
               AND p.CODIGO_PERSONA = es.CODIGO_PERSONA
               AND se.CODIGO_SECCION = (?) ");
                $consulta->execute(array($seccion));
                $row=$consulta->fetchColumn();
                if($row>0){

                ?>
                <button  onclick="Descargar1()"href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
                <div class="table-responsive">
                 <table id="tabla" class="table table-bordered table-striped">
                   <thead>
                       <tr>
                          <th class="text-center">Tutoria</th>
                          <th class="text-center">Nombre tutor</th>
                          <th class="text-center">Nombre del estudiante</th> 
                          <th class="text-center">Modalidad</th>
                          <th class="text-center">Grado</th>
                          <th class="text-center">Hora</th> 
                        </tr>
                   </thead>
                   <tbody>
                     <?php 
                     $query = "SELECT ma.CODIGO_MATRICULA, concat_ws (' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as ESTUDIANTE,
                     (select concat_ws (' ', tp2.PRIMER_NOMBRE, tp2.SEGUNDO_NOMBRE,tp2.PRIMER_APELLIDO,tp2.SEGUNDO_APELLIDO) from tbl_persona tp2
                      where ca.CODIGO_PERSONA = tp2.CODIGO_PERSONA) as NOMBRE_TUTOR, tu.NOMBRE as ASIGNATURA,
                      mo.TIPO as MODALIDAD,  se.NOMBRE as SECCION, ca.HORA
                     FROM tbl_matricula_academica ma, tbl_carga_academica ca, tbl_seccion se, tbl_tutoria tu, 
                     tbl_modalidad mo, tbl_estudiante es, tbl_persona p
                    WHERE ma.CODIGO_CARGA = ca.CODIGO_CARGA
                    AND se.CODIGO_SECCION = ca.CODIGO_SECCION
                    AND tu.CODIGO_TUTORIA = ca.CODIGO_TUTORIA
                    AND mo.CODIGO_MODALIDA = ca.CODIGO_MODALIDAD
                    AND es.CODIGO_ESTUDIANTE = ma.CODIGO_ESTUDIANTE
                    AND p.CODIGO_PERSONA = es.CODIGO_PERSONA
                    AND se.CODIGO_SECCION ='$seccion'";
                    $result = $conn->query($query);
                    if ($result->num_rows > 0) {
                      while($row = $result->fetch_assoc()) {
                        $var2 = $row['ESTUDIANTE'];
                        $var3 = $row['NOMBRE_TUTOR'];
                        $var4 = $row['ASIGNATURA'];
                        $var5 = $row['MODALIDAD'];
                        $var6 = $row['GRADO_ACTUAL'];
                        $var7 = $row['SECCION'];
                        $var8 = $row['HORA'];
                     ?>
                     <tr>
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var5; ?></td>
                          <td class="text-center"><?php echo $var7; ?></td>
                          <td class="text-center"><?php echo $var8; ?></td>
                     </tr>

                   </tbody>
                    <?php
                      }
                      }
                     ?>
                 </table>
              </div>
                <?php
                 }else{
                ?>
                <p >No se encontro informació de la sección </p>
                <?php
                 }
                }
                ?>
        </div> 
        <br><br>
      </div><!-- card del menu-->
      
     </section>
  </div> 
</div>   
<div>
</div>

 <script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteTutorias.php','_blank');
      window.open(this.href,'_self');
    }
  </script>
  <script>
    function Descargar1() {
      window.open('Reportes_Prosecar/reportePorSeccion.php','_blank');
      window.open(this.href,'_self');
    }
  </script>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla').DataTable({
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
        "search": "Buscar:",
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
<script type="text/javascript">
 $( function() {
    $("#buscar").change( function() {
        if ($(this).val() === "1"  ) {//si es tutorias
          document.getElementById('secciones').style.display = "none";
          document.getElementById('ocultar').style.display = "none";
           document.getElementById('tutorias').style.display = "block";

        } else if ($(this).val() === "2" ){// si es seccion
           document.getElementById('tutorias').style.display = "none";
           document.getElementById('ocultar').style.display = "none";
           document.getElementById('secciones').style.display = "block";
        }
    });
  }); 
</script>

<!-- Elaborado por Diana Rut  -->
