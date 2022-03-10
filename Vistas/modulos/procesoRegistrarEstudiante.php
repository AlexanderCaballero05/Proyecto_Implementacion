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

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
              <div class="text-center font-weight-bold mb-3">
                 <h2> Registro de estudiantes</h2>
              </div>
    <div class="container-fluid">
                <!-- Inicio del PROCESO inscripcion de estudiantes-->
        <div class="card ">
          <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link active" aria-current="true" href="#">Registrar estudiantes</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="crudEstudiante">Ver datos escolares</a>
              </li>
              <li class="nav-item">
              <a class="nav-link" href="crudContenidoEconoEstudiante">Ver datos socioeconomicos</a>
              </li>
            </ul>
          </div>
          <div class="card-body"><!--Cuerpo del card body principal -->
          <div class="card-header bg-gradient-cyan"> <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                      <h2 class="card-title" > <strong>Datos escolares</strong></h2>
           </div></br>
        <form method="POST" class="needs-validation" novalidate>

            <div class="row mb-5 pl-3">
                
                    <?php //
                    $query = "SELECT CODIGO_PERSONA, CONCAT(PRIMER_NOMBRE, ' ',SEGUNDO_NOMBRE,' ',PRIMER_APELLIDO) AS NOMBRE
                    FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 4;";
                    $resultadod=$conn->query($query);                
                    ?>

                  <button  class="btn btn-secondary "  class="col-sm-1 col-form">Buscador</button>
                  <div class="col-sm-3 order-2 pl-2">
                    <select  style="width: 100%;"  class="form-control select2" name="CODPERSONA" id="" type="text" required >
                    <option selected disabled value="">Buscar estudiante...</option>
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
                          
                      <div class="invalid-feedback">
                          Agregue un nombre!
                      </div>

                      <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                </div>
            </div> 
                  <div class="row">
                      <div class="col-md-3"> <!--INICIO IDENTIDAD-->
                          <label for="identidad" class="control-label">Grado Actual</label> 
                          <div class="form-group">
                             <input class="form-control" type="number" maxlength="2" minlength="1" name="GRADO" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 1" required="" >
                              <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                      </div>

                      <div class="col-md-3">
                        <label  class="control-label pl-4">Repitente de curso</label>
                        <br>
                        <div class="form-check form-check-inline pl-4 pr-4">
                          <input class="form-check-input" type="radio" name="REPITENTE" id="inlineRadio1" value="option1" required="">
                          <label class="form-check-label" for="inlineRadio1">SI</label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="REPITENTE" id="inlineRadio2" value="option2" required="">
                          <label class="form-check-label" for="inlineRadio2">NO</label>
                          
                        </div>
                             
                       
                      </div>

                        <div class="col-md-3"> <!--INICIO INDICE ACADEMICO-->
                          <label for="identidad" class="control-label">Indice academico</label> 
                          <div class="form-group">
                            <input class="form-control" type="number" maxlength="2" minlength="1" name="INDICE" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 90" required="" >
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                          
                        </div>

                        <div class="col-md-3"> <!--INICIO PASATIEMPOS-->
                          <label for="MATERIAS" class="control-label">Materias con bajo rendimiento</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="MATERIAS" id="MATERIAS" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ejemplo: Español" required="" ></textarea>
                               <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                          
                        </div>
                  </div>


                  <div class="row">

                        <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="PASATIEMPOS" class="control-label">Pasatiempos</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="PASATIEMPOS" id="PASATIEMPOS" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ejemplo: Ver Telelevision" required="" ></textarea>
                          <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>

                        <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="DISTRACTORES" class="control-label">Distractores</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="DISTRACTORES" id="DISTRACTORES" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ejemplo: Redes Sociales" required="" ></textarea>
                          <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>

                        <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="METAS" class="control-label">Metas</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="METAS" id="METAS" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ejemplo: Estudiar en la universidad" required="" ></textarea>
                          <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>



                  </div><!--Cierre del row general -->

                      <div class="card-header bg-gradient-cyan m-2"> <!-- TITULO ENCABEZADO DATOS SOCIECONOMICOS -->
                                <h2 class="card-title"> <strong>Datos socioeconomicos</strong></h2>
                    </div></br>

                           <?php
                              include_once "conexion3.php";
                              $query1= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO
                              FROM tbl_contenido_socioeconomico s
                              WHERE S.CODIGO_TIPOSOCIO = 1;";
                              $result1= $conn->query($query1);
                           ?>

                            <?php 
                              include_once "conexion3.php";
                              $query2= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO
                              FROM tbl_contenido_socioeconomico s
                              WHERE S.CODIGO_TIPOSOCIO = 2; ";
                              $result2= $conn->query($query2);
                           ?>

                            <?php
                            
                              include_once "conexion3.php";
                              $query3= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO
                              FROM tbl_contenido_socioeconomico s
                              WHERE S.CODIGO_TIPOSOCIO = 3; ";
                              $result3= $conn->query($query3);
                           ?>
                              
                            <?php
                            
                            include_once "conexion3.php";
                            $query4= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO
                            FROM tbl_contenido_socioeconomico s
                            WHERE S.CODIGO_TIPOSOCIO = 4; ";
                            $result4= $conn->query($query4);
                         ?>
                <div class="row pl-3"><!--inicio de la fila de datos socieconomicos-->
                       <!-- <div class="col-md-3"> 
                          <label for="identidad" class="control-label">¿Con que dispositivos cuenta?</label> 
                          <br>
                          <div class="form-check form-check-inline">
                             <?php  /*
                                if ($result1->num_rows > 0){
                                    while($row1 = $result1->fetch_assoc()){

                              ?>
                            
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="<?php echo $row1['CODIGO_TIPOSOCIO'];?>">
                              <label class="form-check-label" for="inlineCheckbox1"><?php echo $row1['NOMBRE_TIPO'];?></label>

                              <?php } 
                                  }?>
                            </div>
                            <br>

                            <div class="form-check form-check-inline">
                            <?php
                                if ($result2->num_rows > 0){
                                    while($row1 = $result2->fetch_assoc()){

                              ?>
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="<?php echo $row1['CODIGO_TIPOSOCIO'];?>">
                              <label class="form-check-label" for="inlineCheckbox2"><?php echo $row1['NOMBRE_TIPO'];?></label>
                              <?php } 
                                  }?>
                            </div>
                            <br>

                            <div class="form-check form-check-inline">
                            <?php
                                if ($result3->num_rows > 0){
                                    while($row1 = $result3->fetch_assoc()){

                              ?>
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="<?php echo $row1['CODIGO_TIPOSOCIO'];?>">
                              <label class="form-check-label" for="inlineCheckbox3"><?php echo $row1['NOMBRE_TIPO'];?></label>
                              <?php } 
                                  } */?>
                            </div>
                        </div> CIERRE DEL ENCARAGADO -->

                <div class="col-sm-3">
                <label for="DISPOSITIVOS" class="control-label">¿Con que dispositivos cuenta?</label> 
                  <select  style="width: 100%;"  class="form-control select2"  name="DISPOSITIVOS" type="text" aria-placeholder="Buscar" required="" >
                     <option selected disabled value="">Elegir...</option>
                     <?php 
                        if ($result1->num_rows > 0) {
                        while($row1 = $result1->fetch_assoc()) { 
                        $codigo = $row1['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                        $nombre = $row1['NOMBRE_TIPO'];
                        ?>
                      <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                      <?php 
                      } 
                      }
                      ?>
                      
                    </select>
                    <div class="invalid-feedback">
                                  Eliga una opción.
                   </div>
                   <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                </div>
                        


                        <div class="col-md-3"> 
                          <label for="SERVICIOS" class="control-label">¿Qué servicios de internet utiliza?</label> 
                          <select  style="width: 100%;"  class="form-control select2" name="SERVICIOS"  id="SERVICIOS" type="text" aria-placeholder="Buscar" required="" >
                          <option selected disabled value="">Elegir...</option>
                                  <?php 
                                    if ($result2->num_rows > 0) {
                                    while($row2 = $result2->fetch_assoc()) { 
                                    $codigo = $row2['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                                    $nombre = $row2['NOMBRE_TIPO'];
                                    ?>
                                <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                  <?php 
                                  } 
                                  }
                                  ?>
                          </select>
                          <div class="invalid-feedback">
                                  Eliga una opción.
                   </div>
                   <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                        
                        </div><!--CIERRE DE LA TUTORIA -->


                        <div class="col-md-3"> 
                          <label for="PROVEEDOR" class="control-label">¿Quién provee el ingreso familiar?</label> 
                          <select  style="width: 100%;"  class="form-control select2" name="PROVEEDOR" id="PROVEEDOR" type="text" aria-placeholder="Buscar" required >
                          <option selected disabled value="">Elegir...</option>
                                  <?php 
                                    if ($result3->num_rows > 0) {
                                    while($row3 = $result3->fetch_assoc()) { 
                                    $codigo = $row3['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                                    $nombre = $row3['NOMBRE_TIPO'];
                                    ?>
                                <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                  <?php 
                                  } 
                                  }
                                  ?>
                          </select>
                          <div class="invalid-feedback">
                                  Eliga una opción.
                   </div>
                   <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                         </div><!--CIERRE DEL  -->

                         <div class="col-md-3"> 
                          <label for="BASICOS" class="control-label">¿Con qué servicios básicos cuenta en su casa?</label> 
                      
                          <select  stye="width: 100%;"  class="form-control select2" name="BASICOS" id="BASICOS" type="text" aria-placeholder="Buscar" required >
                          <option selected disabled value="">Elegir...</option>
                                  <?php 
                                    if ($result4->num_rows > 0) {
                                    while($row4 = $result4->fetch_assoc()) { 
                                    $codigo = $row4['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                                    $nombre = $row4['NOMBRE_TIPO'];
                                    ?>
                                <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                  <?php 
                                  } 
                                  }
                                  ?>
                          </select>

                          <div class="invalid-feedback">
                                  Eliga una opción.
                   </div>
                   <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                         </div><!--CIERRE DEL  -->
                  </div><!--FINAL DEL ROW Socieconomico-->
                      
                      </br></br></br>

                      <button type="submit"  id="GUARDARPERSONA" name="GUARDARPERSONA" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                      <button type="submit"  id="GUARDARPERSONA" name="GUARDAR" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Editar</button>
                      <button type="submit"  id="GUARDARPERSONA" name="GUARDAR" class="btn btn-danger btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Eliminar</button>

        </form>
          </div>
        </div>
   </div><!-- CIerre del container fluid--> 
  </section>
</div><!-- Cierre del div wraper -->

<script>
(function() {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function(form) {
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
})()
</script>
