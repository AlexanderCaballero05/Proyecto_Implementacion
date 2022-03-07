<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=20;
 $accion='Ingreso al proceso de Carga Academica';
 $descripcion= 'Usuario se autentifico ';
 bitacora($codigoObjeto, $accion,$descripcion);
?>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>

<body>
  
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">
        <div class="card">
          <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link active" aria-current="true" href="#">Carga academica</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="crudCargaAcademica">Ver carga</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled">Otros</a>
              </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body"><!--Cuerpo del card body principal -->
            </br>
            <form method="POST">

              <div class="row mb-4">
                 <?php //
                  $query = "SELECT CODIGO_PERSONA, CONCAT(PRIMER_NOMBRE, ' ',SEGUNDO_NOMBRE,' ',PRIMER_APELLIDO) AS NOMBRE
                  FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 2;";
                  $resultadod=$conn->query($query);                
                  ?>
                <button  class="btn btn-info"  class="col-sm-1 col-form">Buscador</button>
                <div class="col-sm-4">
                  <select   style="width: 100%;"  class="form-control select2"  id="" type="text" required >
                      <option>Buscar tutor</option>
                      <?php 
                        if ($resultadod->num_rows > 0) {
                        while($row = $resultadod->fetch_assoc()) { 
                        $codigo = $row['CODIGO_PERSONA'];
                        $nombre = $row['NOMBRE'];
                        ?>
                      <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                      <?php 
                      } 
                      }
                      ?>
                    </select>
                </div>
                
              </div>
              <div class="row">
              <div class="col-md-4 mb-3"> <!--HORA-->
                  <label  class="control-label">Hora de clase:</label> 
                  <div class="form-group">
                    <input class="form-control" type="time" maxlength="13" minlength="13" name="hora" id=""   >
                  </div>
                </div>
                <div class="col-md-4 mb-3"> <!--FECHA INICIO-->
                  <label  class="control-label">Fecha Inicio:</label> 
                  <div class="form-group">
                    <input class="form-control" type="date" maxlength="13" minlength="13" name="fecha_inicio" id=""    >
                  </div>
                </div>
                <div class="col-md-4 mb-3"> <!--FECHA FINAL-->
                  <label  class="control-label">Fecha final:</label> 
                  <div class="form-group">
                    <input class="form-control" type="date" maxlength="13" minlength="13" name="fecha_final" id=""   >
                  </div>
                </div>
              </div><!--Cierre del row general -->

              <div class="row">
                <div class="col-md-4 mb-3 "> 
                  <?php //
                  $query = "SELECT CODIGO_PERSONA, CONCAT(PRIMER_NOMBRE, ' ',SEGUNDO_NOMBRE,' ',PRIMER_APELLIDO) AS NOMBRE
                  FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 2;";
                  $resultadod=$conn->query($query);                
                  ?>
                   
                  <div class="form-group">
                    <label  class="control-label">Encargado:</label>
                    <select class="form-control select2"  style="width: 100%;"  name="tutor" id="tutor" required>
                      <option>--Seleccione--</option>
                      <?php 
                        if ($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo_tutor = $row['CODIGO_PERSONA'];
                          $nombre = $row['NOMBRE'];
                        ?>
                      <option value="<?php echo $codigo_tutor?>" ><?php echo $nombre;?></option>
                      <?php 
                      } 
                      }
                      ?>
                    </select> 
                  </div>
                </div><!--CIERRE DEL ENCARAGADO -->

                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_tutoria";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Tutoria:</label> 
                  <div class="form-group">
                    <select style="width: 100%" class="form-control select2"   style="width: 100%;" name="tutoria" id="editar_area" required>
                      <option>--Seleccione--</option>
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
                </div><!--CIERRE DE LA TUTORIA -->


                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_modalidad";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Modalidad:</label> 
                  <div class="form-group">
                    <select class="form-control select2 " id="modalidad" style="width: 100%;"  name="modalidad"  required>
                      <option>--Seleccione--</option>
                      <?php 
                        if($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo_modalidad = $row['CODIGO_MODALIDA'];
                          $nombre = $row['TIPO'];
                        ?>
                      <option value="<?php echo $codigo_modalidad?>" ><?php echo $nombre;?></option>
                      <?php 
                      } 
                      }
                      ?>
                    </select> 
                  </div>
                </div><!--CIERRE DEL  -->
              </div><!--FINAL DEL ROW -->
              <div class="row">
                <div class="col-md-4"><!--CORREO ELECTRONICO-->
                    <label for="identidad" class="control-label">Sección:</label> 
                    <div class="form-group">
                      <input class="form-control" type="text" maxlength="50"  name="seccion" id="" onKeyDown="sinespacio(this);"   required="" >
                    </div>
                  </div>
              </div><!--Fin del row -->
              </br></br></br>
              <button type="submit"  id="" name="GUARDAR_CARGA" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
              <button type="submit"  id="" name="EDITAR_CARGA" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Editar</button>

              <a href="#ELIMINAR" data-toggle="modal">
              <button type="submit"  id="" name="eli" class="btn btn-danger btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Eliminar</button>
              </a> 

            </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->
 <!--INICIO DEL MODAL ELIMINAR   -->
          <div id="ELIMINAR"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                  <?php //
                               
                  ?>
              <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form id="FORMEeliminar" method="POST">
                      <div class="modal-body">
                        <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="rol_eliminar" id="rol_eliminar">
                        <h4 class="text-center">¿Esta seguro de eliminar la carga academica <?php  ?>?</h4>
                      </div> <!--fin el card body -->
                      <div class="modal-footer ">
                        <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button type="submit"  name="ELIMINAR_CARGA" id="ELIMINAR_CARGA"  class="btn btn-primary">Si,eliminar</button>      
                      </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                    </form>
                  </div><!--fin del modal contener -->
              </div><!--fin del modal dialog -->
          </div><!--fin del modal de eliminar -->          













        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
<!-- Cierre del div wraper -->
<!--Diana Rut -->

<script>
$(document).ready(function() {
 $('#buscador').select2();
       
 });
 </script>
                    


