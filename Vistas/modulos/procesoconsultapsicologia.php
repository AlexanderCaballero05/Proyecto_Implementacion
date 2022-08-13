<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
 include "conexionpdo.php";

?>
<?php
  //Parametro para el minimo respuesta
  $min = "NUM_MIN_CARACTER";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($min));
  $row1=$sentencia1->fetchColumn();
  if($row1>0){
    $minimo = $row1;
  }
?>
<!DOCTYPE html>
<html>

<body >
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>

       <div class="content-header text-xl-center mb-3"> 
          <h4>Consulta Psicológica</h4>
      </div>
    <section class="content">
       <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
        <ul class="nav nav-tabs card-header-tabs">
         <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Consultas en Espera</a>
            </li>
            <li class="nav-item">
            <a class="nav-link"  style="color:#000000;" href="#">Registrar Expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Consulta Psicológica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de Consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Plan Terapéutico</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Lista de Pacientes</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
        
        
        <form method="POST" class="needs-validation" novalidate >
        <div class="alert alert" style="border-color:blue">
          <h3 class="text-center"> Paso <i class="bi bi-3-circle"></i><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-3-circle" viewBox="0 0 16 16">
            <path d="M7.918 8.414h-.879V7.342h.838c.78 0 1.348-.522 1.342-1.237 0-.709-.563-1.195-1.348-1.195-.79 0-1.312.498-1.348 1.055H5.275c.036-1.137.95-2.115 2.625-2.121 1.594-.012 2.608.885 2.637 2.062.023 1.137-.885 1.776-1.482 1.875v.07c.703.07 1.71.64 1.734 1.917.024 1.459-1.277 2.396-2.93 2.396-1.705 0-2.707-.967-2.754-2.144H6.33c.059.597.68 1.06 1.541 1.066.973.006 1.6-.563 1.588-1.354-.006-.779-.621-1.318-1.541-1.318Z"/>
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Z"/>
            </svg>
          </h3>
        </div>
            <h5>Datos del Paciente</h5>
            <hr COLOR="blue">
            <div class="row mb-8">
                                    <?php
                                        $usuario= $_SESSION['vario'];
                                        //Consulta que trae el codigo del usuario
                                        $sentencia1 = $db->prepare("SELECT p.CODIGO_PERSONA
                                        FROM tbl_usuario u, tbl_persona p 
                                        WHERE u.CODIGO_PERSONA = p.CODIGO_PERSONA
                                        AND NOMBRE_USUARIO = (?);");
                                        $sentencia1->execute(array($usuario));
                                        $cod_usuario=$sentencia1->fetchColumn();
                                    ?>   
                    <div class="col">
                    <?php 
                          $query = "SELECT i.CODIGO_CITA, i.CODIGO_PERSONA,  CONCAT_WS(' ',pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO,pe.SEGUNDO_APELLIDO) as PACIENTE ,  pe.DNI, i.FECHA_CITA, i.HORARIO, est.NOMBRE as nombre_estado
                          FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est
                                                                  WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                                                  AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                                                  AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                                                  AND es.CODIGO_PERSONA = '$cod_usuario'
                                                                  AND i.CODIGO_ESTADO = '11' 
                                                                  and i.AREA_CITA = '3'
                                                                  AND i.FECHA_CITA = CURDATE();
                           ";
                          $resul=$conn->query($query); 
                          while($row = $resul->fetch_assoc()){
                            $var1 = $row['PACIENTE'];
                            $var2 = $row['DNI'];
                            $var3 = $row['CODIGO_CITA'];
                            $codigo_paciente = $row['CODIGO_PERSONA'];
                          
                          ?>
                      <input type="text" name="codigocita3" value="<?php echo $var3?>" hidden>
                       <label for="">Nombre del Paciente</label> 
                       <input type="text" name="nombre" disabled ="disabled"class="form-control"  aria-label="nombre" onkeyup="mayus(this);" value="<?php echo $var1?>" >
                    </div>
                     <div class="col">
                         <label for="">DNI</label>
                         <input type="text" name="dni" class="form-control"  aria-label="dni"  value="<?php echo $var2 ?>" disabled ="disabled">
                    </div>
                    </div>
                    <?php
                    }
                    ?>
                    <br></br>
                    <h5>Expediente Psicológico</h5>
                    <hr COLOR="blue">
            <!--INICIO COMBOBOX -->
             <div class="form-group">
             <?php
              $query = "SELECT exp.CODIGO_EXPEDIENTE, exp.ANTECEDENTES_FAMILIARES, exp.ANTECEDENTES_PERSONALES, exp.ANTECEDENTES_CLINICOS, GROUP_CONCAT(sin.TIPO) as NEUROTICOS
              FROM tbl_expediente_psicologico_unico exp, tbl_persona per, tbl_personas_sintomas psin, tbl_sintomas_neuroticos sin            			       
              WHERE exp.CODIGO_PERSONA = per.CODIGO_PERSONA
              AND exp.CODIGO_EXPEDIENTE = psin.CODIGO_EXPEDIENTE
              AND psin.CODIGO_SINTOMA_NEUROTICO = sin.CODIGO_SINTOMA_NEUROTICO
              AND exp.CODIGO_PERSONA = '$codigo_paciente';" ;
              $resul2=$conn->query($query); 
               
              while($row2 = $resul2->fetch_assoc()){
                $var6 = $row2['ANTECEDENTES_FAMILIARES'];
                $var7 = $row2['ANTECEDENTES_PERSONALES'];
                $var9 = $row2['ANTECEDENTES_CLINICOS'];
                $var8 = $row2['NEUROTICOS'];
                $var5 = $row2['CODIGO_EXPEDIENTE'];
              ?>
                   <div class= "row">                      
                        <div class="col-md-6">
                                <input type="text" name="codigoexpediente" value="<?php echo $var5?>" Hidden> <!--CODGIO DEL EXPEDIENTE PARA Q SALGA TODA INFO  --> 
                                <label >Síntomas Neuróticos</label> 
                                <div class="form-group">
                                <textarea required class="form-control"  type="textarea" required disabled ="disabled" 
                                name="sintomasneuraticos" id="sintomasneuraticos"><?php echo $var8?></textarea>
                                </div>
                        </div><!--fin del Sintomas Neuroticos-->
                        <div  class="col-md-6">
                                <label >Antecedentes Familiares</label> 
                                    <div class="form-group">
                                <textarea required class="form-control"  type="textarea" required  disabled ="disabled"
                                 name="Familiares" id="Familiares"><?php echo $var6?></textarea>
                                    </div>
                        </div><!--fin del la Antecedentes Familiares -->   
                    </div> <!--fin del row primer de expediente  -->
                    <div class="row">
                        <div  class="col-md-6">
                            <label >Antecedentes Personales</label> 
                                <div class="form-group">
                            <textarea required class="form-control"  type="textarea" required  disabled ="disabled" name="Personales" id="Personales"><?php echo $var7?></textarea>
                                </div>
                        </div><!--fin del la Antecedentes Personales -->    
                        <div  class="col-md-6">
                            <label >Antecedentes Clínicos</label> 
                                <div class="form-group">
                            <textarea required class="form-control"  type="textarea" required disabled ="disabled" name="Clinicos" id="Clinicos"><?php echo $var9?></textarea>
                                </div>
                        </div><!--fin del la Antecedentes Personales -->       
                    </div><!--fin del row segundo de expediente -->
                    <?php
                    }
                    ?> <!--METER EL CICLO TODO LOS TEXTOS Y DENTRO DEL ROW PRINCIPAL-->
             </div><!--fin del div de row DE EXPEDIENTE-->
                    
                    <h5>Datos de Consulta</h5>
                    <hr COLOR="blue">
                    <div class="row">
                      <div class="col-md-6"> 
                        <label>Síntomas</label> 
                        <div class="form-group">
                          <textarea type="textarea"  class="form-control" maxlength="100" minlength="5" onkeyup="mayus(this);" required onkeypress="return soloLetrasnumeros(event)"  autocomplete = "off"  name="sintomas3"></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <label >Diagnóstico Ingreso</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="textarea"   required pattern="[A-Z]{5,200}" minlength="5"  maxlength="200" onkeypress="return soloLetrasnumeros(event)" onkeyup="mayus(this);"   name="Ingreso3"  autocomplete = "off" ></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de una fila -->
                             
                    <div class="row">
                      <div class="col-md-6"> 
                        <label >Diagnóstico Egreso</label> 
                        <div class="form-group">
                          <textarea type="textarea"  class="form-control"  required  minlength="4" maxlength="250"  onkeyup="mayus(this);" onkeypress="return soloLetrasnumeros(event)" name="Egreso3"  autocomplete = "off" ></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <label  >Observaciones</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="textarea"  required  minlength="4" maxlength="250"  onkeyup="mayus(this);" onkeypress="return soloLetrasnumeros(event)" name="observaciones3"   autocomplete = "off" ></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de una fila -->
                    <br>
                    <a>
                    <button type="submit"  id="Guardar_Consulta3" name="Guardar_Consulta3" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar Consulta</button>
                    </a> 
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
</body>
</html>


<script>
 function soloLetrasnumeros(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = "áéíóúabcdefghijklmnñopqrstuvw,.xyz 0123456789";
   especiales = ["8-37-39-46"];
   tecla_especial = false
   for(var i in especiales){
    if(key == especiales[i]){
      tecla_especial = true;
      break;
    }
  }
  if(letras.indexOf(tecla)==-1 && !tecla_especial){
    return false;
  }
 }
 </script>
 

 
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
