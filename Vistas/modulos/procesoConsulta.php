<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=23;
 $accion='Ingreso Matricula';
 $descripcion= 'Ingreso al proceso/registros de matricula ';
 bitacora($codigoObjeto, $accion,$descripcion);
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

    <section class="content">
    <div class="container-fluid">
      
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link " style="color:#000000;" href="#">Citas Medicas</a>
            </li>
            <li class="nav-item" disabled="disabled">
            <a class="nav-link" style="color:#000000;" href="#">Pre Clinica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Consultas Medicas</a>
            </li>
            <li class="nav-item">
            <a class="nav-link " style="color:#000000;" href="#">Recetas Medicas</a>
            </li>
          </ul>
          </div>
          <div class="card-body"><!--Cuerpo del card body principal -->
          <form class=" needs-validation" novalidate method="POST">
            
            <h5>Datos del Paciente</h5>
            <hr>
            
            
            <div class="row mb-8">
                    <div class="col">
                    <?php 
                          $query = "SELECT  CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as PACIENTE, p.DNI, C.CODIGO_CITA
                          from tbl_inscripcion_cita c ,tbl_persona p
                          where p.CODIGO_PERSONA = c.CODIGO_PERSONA
                          AND c.CODIGO_ESTADO = '11';";
                          $resul=$conn->query($query);    
                           
                          while($row = $resul->fetch_assoc()){
                            $var1 = $row['PACIENTE'];
                            $var2 = $row['DNI'];
                            $var3 = $row['CODIGO_CITA'];
                          
                          ?>
                      
                      <label for="">Nombre del paciente:</label>
                      <input type="text" name="codigocita2" value="<?php echo $var3?>" hidden>
                       <input type="text" name="nombre" disabled ="disabled"class="form-control"  aria-label="nombre" onkeyup="mayus(this);" value="<?php echo $var1?>" >
                    </div>
                     <div class="col">
                         <label for="">DNI:</label>
                         <input type="text" name="dni" class="form-control"  aria-label="dni"  value="<?php echo $var2 ?>" disabled ="disabled">
                    </div>
                    </div>
                    <?php
                    }
                    ?>
           
            
                    </br>
                    <h5>Preclinica</h5>
                    <hr>
                    
            
            <!--INICIO COMBOBOX -->
            <div class="form-group">
              <?php
              $query = "SELECT pr.PESO, pr.ESTATURA, pr.TEMPERATURA, pr.DESNUTRICION, pr.FRECUENCIA_CARDIACA,pr.FRECUENCIA_RESPIRATORIA, pr.PULSO, pr.MASA_CORPORAL, pr.CODIGO_PRECLINICA
              FROM tbl_preclinica pr, tbl_inscripcion_cita c
              WHERE pr.CODIGO_CITA = c.CODIGO_CITA 
              AND c.CODIGO_ESTADO = '11'
              AND C.AREA_CITA = '2';
              ";
              $resul=$conn->query($query); 
               
              while($row = $resul->fetch_assoc()){
                $var1 = $row['PESO'];
                $var2 = $row['ESTATURA'];
                $var3 = $row['TEMPERATURA'];
                $var4 = $row['DESNUTRICION'];
                $var5 = $row['FRECUENCIA_CARDIACA'];
                $var6 = $row['FRECUENCIA_RESPIRATORIA'];
                $var7 = $row['PULSO'];
                $var8 = $row['MASA_CORPORAL'];
                $var9 = $row['CODIGO_PRECLINICA'];
              ?>
            <div class= "row">                      
            <div class="col-sm-2 mb-3">
            <input type="text" name="codigopre" value="<?php echo $var9 ?>" Hidden>
                         <label for="" class="control-label">Peso</label> 
                         <div class="input-group ">
                            <input  maxlength="6"  type="text" class="form-control" autocomplete = "off" value="<?php echo  $var1 ?>" name="peso" disabled ="disabled" required >
                            <div class="input-group-append">
                              <span class="input-group-text">Lb</span>
                            </div>
                          </div>
                        </div><!--fin del peso -->

                        <div  class="col-sm-2 mb-3">
                          <label for="" class="control-label">Estatura</label> 
                          <div class="input-group ">
                            <input type="text"   maxlength="5" autocomplete = "off" required class="form-control" value="<?php echo  $var2 ?>"  name="estatura" disabled ="disabled" required >
                            <div class="input-group-append">
                              <span class="input-group-text">M</span>
                            </div>
                          </div>
                        </div><!--fin del la estatura -->
                        <div  class="col-sm-2 mb-3">
                          <label for="" class="control-label">temperatura</label> 
                          <div class="input-group ">
                            <input type="text"  value="<?php echo $var3 ?>" onkeypress="return TEMPE(event,this);" autocomplete = "off" required class="form-control"  name="temperatura" disabled ="disabled" required>
                            <div class="input-group-append">
                              <span class="input-group-text">°C</span>
                            </div>
                          </div>
                        </div><!--fin del temperatura -->
                        <div  class="col-sm-4 mb-3">
                          <div class="form-group">
                            <label for="" class="control-label">Estatus de desnutrición</label>
                            <select class="form-control " required name="desnutricion" required disabled ="disabled"> 
                             <option  value=""><?php echo $var4 ?></option>
                              <option  value="No tiene">No tiene</option>
                              <option   value="Moderado">Moderado</option>
                              <option  value="Grave">Grave</option>
                            </select>
                          </div>
                        </div>
                    </div> <!--fin del row -->
                    <div class="row">
                     
                       <div  class="col-sm-2 mb-3">
                          <label for="" class="control-label">Presión Arterial</label> 
                          <div class="input-group ">
                            <input type="text"  maxlength="5"  name="FC"  value="<?php echo $var5 ?>"  autocomplete = "off" required class="form-control" disabled ="disabled" required>
                            <div class="input-group-append">
                              <span class="input-group-text">mm Hg</span>
                            </div>
                          </div>
                        </div><!--fin de presion -->
                        <div class="col-md-2 mb-3"> <!--Nivel de respiracion-->
                          <label for="validationCustom03"  class="control-label">Nivel Respiración</label> 
                          <div class="input-group ">
                            <input type="text"  onkeypress="return solonumeros(event);" maxlength="2" name="FR" value="<?php echo $var6 ?>"  autocomplete = "off" required class="form-control" disabled ="disabled" required>
                            <div class="input-group-append">
                              <span class="input-group-text">FR</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-2 mb-3"> <!--PULSO-->
                          <label for="validationCustom03"  class="control-label">Pulso</label> 
                          <div class="input-group ">
                            <input type="text"  onkeypress="return solonumeros(event);" maxlength="3" name="pulso" value="<?php echo $var7 ?>"  autocomplete = "off" required class="form-control" disabled ="disabled" required>
                            <div class="input-group-append">
                              <span class="input-group-text">lpm</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4 mb-3"> <!--masica corporal-->
                          <label for="validationCustom03"  class="control-label">Indice masa corporal</label> 
                          <div class="input-group ">
                            <input type="text"  maxlength="4"  name="masa_corporal" value="<?php echo $var8 ?>"  autocomplete = "off" required class="form-control" disabled ="disabled" required>
                            <div class="input-group-append">
                              <span class="input-group-text">IMC</span>
                            </div>
                          </div>
                        </div>
                      </div><!--fin del div de form-group-->
                      <?php
                    }
                    ?> 
                    
                    </div><!--fin del div de row-->
                    
                    <h5>Consulta</h5>
                    <hr>
                    <div class="row">
                      <div class="col-md-6"> 
                        <label for="identidad" class="control-label">Sintomas:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text" name="sintomas2" id="sintomas2"   autocomplete = "off" required></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <label for="identidad" class="control-label">Diagnóstico:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text"  name="diagnostico1" id="diagnostico1"  autocomplete = "off" required ></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de una fila -->
                             
                    <div class="row">
                      <div class="col-md-6"> 
                        <label for="identidad" class="control-label">Evolución:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text"  name="evolucion" id="evolucion"   autocomplete = "off" required></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <label for="identidad" class="control-label">Diagnóstico de egreso/ Hallazgos importantes:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text"  name="diagnostico2" id="diagnostico2"  autocomplete = "off" required></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de una fila -->
                    <br>
                    <button type="submit"  id="Guardar_Consulta2" name="Guardar_Consulta2" class="btn btn-info btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar </button>
                    </form>   
                </div><!--fin del div de responsivi -->
              </div> <!-- /.card-body -->
            </form>
          </div><!-- fINAL DEL card PRIMARY -->
        </div><!--FINAL DE COL-M12-->
      </div><!-- FINAL ROW PADRE -->
    </div><!-- FINAL CONTAINER FLUID --> 
                      </div>
                      </div>
  </section><!-- FINAL SECTION -->

 

 
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
