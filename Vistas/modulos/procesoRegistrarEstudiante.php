<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=20;
 $accion='Ingreso al proceso de Carga Academica';
 $descripcion= 'Usuario se autentifico ';
 bitacora($codigoObjeto, $accion,$descripcion);
?>

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
        <form method="POST">

                <div class="row m-4">
                    <label>Buscar estudiante</label>
                    <br>
                      <div class="col-md-3 mb-3">
                        <input type="text" id="buscar" class="form-control" >
                     </div>
                </div>
                  <div class="row">
                      <div class="col-md-3"> <!--INICIO IDENTIDAD-->
                          <label for="identidad" class="control-label">Grado Actual</label> 
                          <div class="form-group">
                            <input class="form-control" type="number" maxlength="2" minlength="1" name="GRADO" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 1" required="" >
                          </div>
                        </div>

                      <div class="col-md-3">
                        <label  class="control-label pl-4">Repitente de curso</label>
                        <br>
                        <div class="form-check form-check-inline pl-4 pr-4">
                          <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                          <label class="form-check-label" for="inlineRadio1">SI</label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                          <label class="form-check-label" for="inlineRadio2">NO</label>
                        </div>
                       
                      </div>

                        <div class="col-md-3"> <!--INICIO INDICE ACADEMICO-->
                          <label for="identidad" class="control-label">Indice academico</label> 
                          <div class="form-group">
                            <input class="form-control" type="number" maxlength="2" minlength="1" name="indice" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 90" required="" >
                          </div>
                        </div>

                        <div class="col-md-3"> <!--INICIO PASATIEMPOS-->
                          <label for="identidad" class="control-label">Materias con bajo rendimiento</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="materias" id="PASATIEMPOS" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ejemplo: Español" required="" ></textarea>
                          </div>
                        </div>
                  </div>


                  <div class="row">

                        <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="identidad" class="control-label">Pasatiempos</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="PASATIEMPOS" id="PASATIEMPOS" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ejemplo: Ver Telelevision" required="" ></textarea>
                          </div>
                        </div>

                        <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="DISTRACTORES" class="control-label">Distractores</label> 
                          <div class="form-group">
                            <textarea class="form-control" type="text" name="DISTRACTORES" id="DISTRACTORES" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ejemplo: Ver Telelevision"  required="" > </textarea>
                          </div>
                        </div>
                        <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="DISTRACTORES" class="control-label">METAS</label> 
                          <div class="form-group">
                            <textarea class="form-control" type="text" name="DISTRACTORES" id="DISTRACTORES" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ejemplo: Ver Telelevision"  required="" > </textarea>
                          </div>
                        </div>



                  </div><!--Cierre del row general -->

                      <div class="card-header bg-gradient-cyan m-2"> <!-- TITULO ENCABEZADO DATOS SOCIECONOMICOS -->
                                <h2 class="card-title"> <strong>Datos socioeconomicos</strong></h2>
                    </div></br>

                    <?php
                              include_once "conexion3.php";
                              $query1= "SELECT s.CODIGO_TIPOSOCIO ,s.NOMBRE_TIPO
                              FROM tbl_contenido_socioeconomico s
                              WHERE S.CODIGO_TIPOSOCIO = 1";
                              $result1= $conn->query($query1);
                              ?>

                <div class="row pl-3"><!--inicio de la fila de datos socieconomicos-->
                        <div class="col-md-3"> 
                          <label for="identidad" class="control-label">¿Con que dispositivos cuenta?</label> 
                          <br>
                          <div class="form-check form-check-inline">
                              <?php
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
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                              <label class="form-check-label" for="inlineCheckbox2">Celular</label>
                            </div>
                            <br>
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" disabled>
                              <label class="form-check-label" for="inlineCheckbox3">Tablet(disabled)</label>
                            </div>
                        </div><!--CIERRE DEL ENCARAGADO -->

                        <div class="col-md-3"> 
                          <label for="identidad" class="control-label">¿Qué servicios de internet utiliza?</label> 
                          <br>
                          <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                              <label class="form-check-label" for="inlineCheckbox1">Internet residencial</label>
                          </div>
                            <br>
                          <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                              <label class="form-check-label" for="inlineCheckbox2">Datos moviles</label>
                          </div>
                        
                        </div><!--CIERRE DE LA TUTORIA -->


                        <div class="col-md-3"> 
                          <label for="identidad" class="control-label">¿Quién provee el ingreso familiar?</label> 
                          <br>
                          <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                              <label class="form-check-label" for="inlineCheckbox1">Padre</label>
                            </div>
                            <br>
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                              <label class="form-check-label" for="inlineCheckbox2">Madre</label>
                            </div>
                            <br>
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                              <label class="form-check-label" for="inlineCheckbox3">Ambos</label>
                            </div>
                            <br>
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                              <label class="form-check-label" for="inlineCheckbox3">Remesas</label>
                            </div>
                         </div><!--CIERRE DEL  -->

                         <div class="col-md-3"> 
                          <label for="identidad" class="control-label">¿Con qué servicios básicos cuenta en su casa?</label> 
                          <br>
                          <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                              <label class="form-check-label" for="inlineCheckbox1">Energía eléctrica </label>
                            </div>
                            <br>
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                              <label class="form-check-label" for="inlineCheckbox2">Agua Potable</label>
                            </div>
                            <br>
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                              <label class="form-check-label" for="inlineCheckbox3">Alcantarillado</label>
                            </div>
                            <br>
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                              <label class="form-check-label" for="inlineCheckbox3">Cable internet</label>
                            </div>
                         </div><!--CIERRE DEL  -->
                  </div><!--FINAL DEL ROW Socieconomico-->
                      
                      </br></br></br>

                      <button type="submit"  id="GUARDARPERSONA" name="GUARDAR" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                      <button type="submit"  id="GUARDARPERSONA" name="GUARDAR" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Editar</button>
                      <button type="submit"  id="GUARDARPERSONA" name="GUARDAR" class="btn btn-danger btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Eliminar</button>
                      
                    


        </form>
          </div>
        </div>
   </div><!-- CIerre del container fluid--> 
  </section>
</div><!-- Cierre del div wraper -->


