<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once  "conexionpdo.php";
?>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><!--Para que funcione el selecrt2 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>

<body oncopy="return false" onpaste="return false">
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">
    <section class="content-header text-xl-center mb-3 btn-light">
      <h1>
          <h4> REGISTRAR CARGA ACADEMICA <i class=" nav-icon fas  fa-graduation-cap"></i></h4>
      </h1>
    </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                 <a class="nav-link"  style="color:#000000;" href="crudCargaAcademica">Ver carga academica</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" style="color:#000000;" aria-current="true" href="#">Carga academica</a>
              </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body"><!--Cuerpo del card body principal -->
            </br>
            <form  class=" needs-validation" novalidate id="FORMREGISTRAR" method="POST">
              <div class="row">
                <div class="col-md-4 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora Inicio Tutoria:</label> 
                    <div class="form-group">
                      <input oninvalid="this.setCustomValidity('Ingrese una hora correcta')" class="form-control" required  type="time"  name="hora"  required >
                        <div class="invalid-feedback">
                          Ingrese una hora correcta
                        </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora Final Tutoria:</label> 
                    <div class="form-group">
                      <input  class="form-control" required min="08:00" max= "17:00"  type="time"  name="hora_final"  required >
                        <div class="invalid-feedback">
                        Llene este campo.
                        </div>
                    </div>
                  </div>
                  <?php
                        date_default_timezone_set("America/Guatemala");
                        $Fechaactual=  date('Y-m-d'); 
                        $fechamaxima= date("Y-m-d",strtotime($Fechaactual."+ 3 month"));
                        ?>
                  <div class="col-md-4 mb-3"> <!--FECHA INICIO-->
                    <label  class="control-label">Fecha Inicio:</label> 
                    <div class="form-group">
                      <input class="form-control" min= "<?= $Fechaactual?>"   max= "<?=  $fechamaxima?>"  type="date"  name="fecha_inicio" required>
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
                    <label  class="control-label">Encargado-Tutor:</label>
                    <select  class="form-control select2"  style="width: 100%;"  name="tutor" id="tutor" required >
                      <option selected disabled value="">--Seleccionar Tutor--</option>
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
                        <option selected disabled value="" >--Seleccionar Tutoria--</option>
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
                      <option selected disabled value="" >--Seleccione Modalidad--</option>
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
                <div class="col-md-4">
                  <?php //
                  $query = "SELECT * FROM tbl_seccion";
                  $resultadod=$conn->query($query);                
                  ?>
                    <label for="identidad" class="control-label">Sección:</label> 
                    <div class="form-group">
                    <select style="width: 100%"   class="form-control select2" required name="seccion" >
                        <option selected disabled value="" >--Seleccionar Seccion--</option>
                        <?php 
                          if ($resultadod->num_rows > 0) {
                            while($row = $resultadod->fetch_assoc()) { 
                            $codigo = $row['CODIGO_SECCION'];
                            $nombre = $row['NOMBRE'];
                          ?>
                        <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                        <?php 
                        } 
                        }
                        ?>
                      </select>
                      <div class="invalid-feedback">
                        Llene este campo.
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-2 mb-3"> 
                    <?php //
                    $query = "SELECT * FROM tbl_tutoria";
                    $resultadod=$conn->query($query);                
                    ?>
                    <label for="identidad" class="control-label">Periodo:</label> 
                    <div class="input-group ">
                            <input  maxlength="6"  type="text" class="form-control" autocomplete = "off" placeholder=" Ej: 3 " name="periodo" required >
                            <div class="input-group-append">
                              <span class="input-group-text">Meses</span>
                            </div>
                             <div class="invalid-feedback">
                                 Llene este campo.
                              </div>
                          </div>
                  </div><!--CIERRE DEL PERIODO -->
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
</body>

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


                    
  
