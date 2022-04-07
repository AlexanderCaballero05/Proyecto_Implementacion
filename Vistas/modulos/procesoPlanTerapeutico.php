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
  <section class="content-header text-xl-center mb-3 btn-light"> 
          <h4> CONSULTA PSICOLOGICA PROSECAR  <i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
    <section class="content">
       <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Citas Psicologicas</a>
            </li>  
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="procesoconsultapsicologia">Consultas Psicologicas</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Expedientes Psicologicos</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" aria-current="true" href="">Planes Terapeuticos</a>
            </li>
           
            </ul>
          </div><!--FIN DEL CARD HEADER -->
           <div class="card-body"><!--Cuerpo del card body principal -->
             <form method="POST"  class=" needs-validation" novalidate>
                    </br>
                    <strong>Datos Terapeuticos</strong>
                    <hr> <br>
                <div class= "row"> 
                    <div class="col-md-6">
                          <?php 
                          $query = "SELECT pt.CODIGO_PLAN, CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as PACIENTE, p.DNI, pt.ACTIVIDAD, pt.TECNICA, pt.MATERIALES, pt.TAREAS, pt.RESULTADOS
                          FROM tbl_plan_terapeutico pt, tbl_persona p
                          WHERE p.CODIGO_PERSONA = pt.CODIGO_PERSONA;";
                          $resul=$conn->query($query);
                          while($row = $resul->fetch_assoc()){   
                            $var1 = $row['CODIGO_PLAN'];
                            $var2 = $row['PACIENTE'];
                            $var3 = $row['DNI'];
                            $var4 = $row['ACTIVIDAD']; 
                            $var5 = $row['TECNICA'];
                            $var6 = $row['MATERIALES'];
                            $var7 = $row['TAREAS']; 
                            $var8 = $row['RESULTADOS'];             
                          ?>
                            <input type="text" name="codigocita3" value="<?php echo $var1?>" hidden>
                       <label for="">Nombre del paciente:</label> 
                       <input type="text" name="nombre" disabled ="disabled"class="form-control"  aria-label="nombre" onkeyup="mayus(this);" value="<?php echo $var2?>" >
                    </div>
                     <div class="col">
                         <label for="">DNI:</label>
                         <input type="text" name="dni" class="form-control"  aria-label="dni"  value="<?php echo $var3 ?>" disabled ="disabled">
                    </div>
                    </div>
                        
                                <?php 
                          
                                }
                                ?>
                            </select>
                            <hr> <br>
                        <div class="row">

                        <div class="col-md-6">
                         <label for="" class="control-label">Actividades</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="600"  name="Actividades" id="Actividades"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->
                        <div class="col-md-6">
                         <label for="" class="control-label">Tecnicas</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="300"  name="Actividades" id="Actividades"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.                         
                              </div>
                            </div>
                        </div><!--fin del peso -->
                      </div> 

                      <div class="row">
                        
                        <div class="col-md-6">
                         <label for="" class="control-label">Materiales</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="600"  name="Materiales" id="Materiales"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->
                 
                        <div class="col-md-6">
                         <label for="" class="control-label">Tareas</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="600"  name="Tareas" id="Tareas"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio. 
                            
                            
                              </div>
                            </div>
                        </div><!--fin del peso -->
                       </div> 
                       
                       <div class="row">
                        <div class="col-md-6">
                         <label for="" class="control-label">Resultados</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" maxlength="600" onkeyup="mayus(this);" name="Resultados" id="Resultados"  autocomplete = "off" required ></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>  
                      
                            </div>
                        </div><!--fin del peso -->

                      
                    </div><!--fin row -->
                 
                
                <button type="submit"  id="" name="GUARDAR_PLAN" class="btn btn-info btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar </button>
             </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->
          </div>
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
</div>
</div>




  <script>

$(document).ready(function() {
    $('.hb').select2();
});



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
