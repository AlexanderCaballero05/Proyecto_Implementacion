<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once  "conexionpdo.php";
?>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><!--Para que funcione el selecrt2 -->
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
           <div class="alert alert" role="alert">
            <h4>Registrar Carga Academica</h4>
          </div>
        <div class="card">
          <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                 <a class="nav-link" href="crudCargaAcademica">Ver carga academica</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="true" href="#">Carga academica</a>
              </li>
              <li class="nav-item">
                 <a class="nav-link" href="procesoBuscarCarga">Editar Carga</a>
              </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body"><!--Cuerpo del card body principal -->
            </br>
            <form  class=" needs-validation" novalidate id="FORMREGISTRAR" method="POST">
              <div class="row">
                <div class="col-md-4 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora Inicio:</label> 
                    <div class="form-group">
                      <input class="form-control"  type="time"  name="hora" id="" required >
                        <div class="invalid-feedback">
                        Llene este campo.
                        </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora Final:</label> 
                    <div class="form-group">
                      <input class="form-control"  type="time"  name="hora_final"  required >
                        <div class="invalid-feedback">
                        Llene este campo.
                        </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3"> <!--FECHA INICIO-->
                    <label  class="control-label">Fecha Inicio:</label> 
                    <div class="form-group">
                      <input class="form-control" type="date"  name="fecha_inicio" required>
                       <div class="invalid-feedback">
                         Llene este campo.
                        </div>
                    </div>
                  </div>
              </div><!--Cierre del row general -->
              <div class="row">

                 <div class="col-md-4 mb-3"> <!--FECHA FINAL-->
                    <label  class="control-label">Fecha final:</label> 
                    <div class="form-group">
                      <input class="form-control" type="date"  name="fecha_final" required>
                       <div class="invalid-feedback">
                         Llene este campo.
                        </div>
                    </div>
                  </div>
                <div class="col-md-4 mb-3"> <!--Fila para el encargado-->
                  <?php 
                  $query = "SELECT CODIGO_PERSONA, CONCAT_WS(' ',PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO,SEGUNDO_APELLIDO) as NOMBRE
                  FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 2;";
                  $resultadod=$conn->query($query);                
                  ?>
                  <div class="form-group">
                    <label  class="control-label">Encargado:</label>
                    <select  class="form-control select2"  style="width: 100%;"  name="tutor" id="tutor" required >
                      <option selected disabled value="">Seleccione</option>
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
                     <div class="invalid-feedback">
                         Llene este campo.
                     </div>
                  </div>
                </div><!--CIERRE DEL ENCARAGADO -->

                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_tutoria";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Tutoria:</label> 
                  <div class="form-group">
                    <select style="width: 100%"   class="form-control select2" required name="tutoria"   >
                      <option selected disabled value="" >--Seleccione--</option>
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
                     <div class="invalid-feedback">
                        Llene este campo.
                      </div>
                  </div>
                </div><!--CIERRE DE LA TUTORIA -->
              </div><!--FINAL DEL ROW -->

              <div class="row">
                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_modalidad";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Modalidad:</label> 
                  <div class="form-group">
                    <select  class="form-select select2 " id="modalidad" style="width: 100%;"  name="modalidad"  required>
                      <option selected disabled value="" >--Seleccione--</option>
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
                     <div class="invalid-feedback">
                        Llene este campo.
                      </div> 
                  </div>
                </div><!--cierre de la modalidad  -->
                <div class="col-md-4"><!--CORREO ELECTRONICO-->
                    <label for="identidad" class="control-label">Sección:</label> 
                    <div class="form-group">
                      <select class="form-control select2" id="" name="seccion" required >
                       <option  selected disabled value="">--Seleccione</option>
                       <option value="SECCIONA">SECCION A</option>
                       <option value="SECCIONB">SECCION B </option>
                       <option value ="SECCIONC">SECCION C </option>
                       <option value ="SECCIOND">SECCION D </option>
                       <option value ="SECCIONE">SECCION E </option>
                       <option value ="SECCIONF">SECCION F </option>
                      </select>
                      <div class="invalid-feedback">
                        Llene este campo.
                      </div>
                    </div>
                  </div>
              </div><!--Fin del row -->
              </br></br></br>
              <button type="submit"  id="" name="GUARDAR_CARGA" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar Carga Academica</button>
            </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->

        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
</div>
</div>

 <script>
    (function () { 
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
          .forEach(function (form) {
            form.addEventListener('submit', function (event) {
              if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
              }
              form.classList.add('was-validated')
            }, false)
          })
    })()
</script>

<!-- Elaborado por Diana Rut y Jose Guifarro :) -->
                    


