<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
 include "conexionpdo.php";
$codigoObjeto = 32;///CAMBIAR 
$accion = 'Ingreso a la pantalla de mantenimiento de Inscripcion Cita ';
$descripcion = 'Ver los registros de los Inscripcion Cita ';
bitacora($codigoObjeto, $accion, $descripcion);
?>

<head>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>
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
            <a class="nav-link active" style="color:#000000;" href="#">Consultas Psicologicas</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Planes terapeuticos</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
        <body oncopy="return false" onpaste="return false" >
        <form method="POST" class="needs-validation" novalidate >
            
            <h5>Datos del Paciente</h5>
            <hr>
                      
            <div class="row mb-8">
                    <div class="col">
                    <?php 
                          $query = "SELECT  CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as PACIENTE, p.DNI, C.CODIGO_CITA
                          from tbl_inscripcion_cita c ,tbl_persona p
                          where p.CODIGO_PERSONA = c.CODIGO_PERSONA
                          AND c.CODIGO_ESTADO = '11'
                           ";
                          $resul=$conn->query($query); 
                          while($row = $resul->fetch_assoc()){
                            $var1 = $row['PACIENTE'];
                            $var2 = $row['DNI'];
                            $var3 = $row['CODIGO_CITA'];
                          
                          ?>
                      <input type="text" name="codigocita3" value="<?php echo $var3?>" hidden>
                       <label for="">Nombre del paciente:</label> 
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
                    <br></br>
                    <h5>Expediente Psicologico</h5>
                    <hr>
            <!--INICIO COMBOBOX -->
             <div class="form-group">
             <?php
              $query = "SELECT tepu.ANTECEDENTES_FAMILIARES ,tepu.ANTECEDENTES_PERSONALES,tepu.ANTECEDENTES_CLINICOS,  
              group_concat(tsn.TIPO) as NEUROTICOS , tepu.CODIGO_EXPEDIENTE 
              from tbl_expediente_psicologico_unico tepu 
              left join tbl_personas_sintomas   tps    on tps.CODIGO_EXPEDIENTE  =  tepu.CODIGO_EXPEDIENTE 
              left join tbl_sintomas_neuroticos tsn    on tsn.CODIGO_SINTOMA_NEUROTICO = tps.CODIGO_SINTOMA_NEUROTICO 
              left join tbl_persona             tp     on tepu.CODIGO_PERSONA =tp.CODIGO_PERSONA 
              left join tbl_inscripcion_cita    tic    on tp.CODIGO_PERSONA  = tic.CODIGO_PERSONA 
              left join tbl_expediente_psicologico_consulta tepc  on tepc.CODIGO_CITA = tic.CODIGO_CITA ";
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
                                <label for="" class="control-label">Sintomas Neuroticos</label> 
                                <div class="form-group">
                                <textarea required class="form-control"  type="textarea" required value=""disabled ="disabled" 
                                name="sintomasneuraticos" id="sintomasneuraticos"><?php echo $var8?></textarea>
                                </div>
                        </div><!--fin del Sintomas Neuroticos-->
                        <div  class="col-md-6">
                                <label for="" class="control-label">Antecedentes Familiares</label> 
                                    <div class="form-group">
                                <textarea required class="form-control"  type="textarea" required value="" disabled ="disabled"
                                 name="Familiares" id="Familiares"><?php echo $var6?></textarea>
                                    </div>
                        </div><!--fin del la Antecedentes Familiares -->   
                    </div> <!--fin del row primer de expediente  -->
                    <div class="row">
                        <div  class="col-md-6">
                            <label for="" class="control-label">Antecedentes Personales</label> 
                                <div class="form-group">
                            <textarea required class="form-control"  type="textarea" required  disabled ="disabled" name="Personales" id="Personales"><?php echo $var7?></textarea>
                                </div>
                        </div><!--fin del la Antecedentes Personales -->    
                        <div  class="col-md-6">
                            <label for="" class="control-label">Antecedentes Clinicos</label> 
                                <div class="form-group">
                            <textarea required class="form-control"  type="textarea" required value="" disabled ="disabled" name="Clinicos" id="Clinicos"><?php echo $var9?></textarea>
                                </div>
                        </div><!--fin del la Antecedentes Personales -->       
                    </div><!--fin del row segundo de expediente -->
                    <?php
                    }
                    ?> <!--METER EL CICLO TODO LOS TEXTOS Y DENTRO DEL ROW PRINCIPAL-->
             </div><!--fin del div de row DE EXPEDIENTE-->
                    
                    <h5>Consulta</h5>
                    <hr>
                    <div class="row">
                      <div class="col-md-6"> 
                        <label for="identidad" class="control-label">Sintomas:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text" maxlength="100" minlength="5" onkeyup="mayus(this);" name="sintomas3" id="sintomas3"   autocomplete = "off" required></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <label for="identidad" class="control-label">Diagnóstico Ingreso:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text" maxlength="200" minlength="5" onkeyup="mayus(this);" name="Ingreso3" id="Ingreso3"  autocomplete = "off" required ></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de una fila -->
                             
                    <div class="row">
                      <div class="col-md-6"> 
                        <label for="identidad" class="control-label">Diagnóstico Egreso:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text" maxlength="200" minlength="5" onkeyup="mayus(this);" name="Egreso3" id="Egreso3" autocomplete = "off" required></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <label for="identidad" class="control-label">Observaciónes:</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text" maxlength="600" minlength="5" onkeyup="mayus(this);" name="observaciones3" id="observaciones3"  autocomplete = "off" required></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de una fila -->
                    <br>
                    <a>
                    <button type="submit"  id="Guardar_Consulta3" name="Guardar_Consulta3" class="btn btn-info btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar consulta</button>
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

 

 
  <script>

$(document).ready(function() {
    $('.hb').select2();
});

//funcion para poner mayusculas
function mayus(e) {
        e.value = e.value.toUpperCase();
    }

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



    var observaciones=document.getElementById("observaciones"); //el nombre del id del campo y cambiar la variable 
    observaciones.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });

    var Egreso=document.getElementById("Egreso"); //el nombre del id del campo y cambiar la variable 
    Egreso.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });

    var Ingreso=document.getElementById("Ingreso"); //el nombre del id del campo y cambiar la variable 
    Ingreso.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });

    var sintomas=document.getElementById("sintomas"); //el nombre del id del campo y cambiar la variable 
    sintomas.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });
</script>
