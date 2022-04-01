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
        <section class="content-header text-xl-center mb-3 btn-light"> 
          <h4> REGISTRO DE EXPEDIENTE MEDICO  <i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                 <a class="nav-link" style="color:#000000;" href="crudPreClinica">  Ver Expedientes</a>
              </li>
              <li class="nav-item">
                <a  class="nav-link active" aria-current="true" href="#"  style=" color:#000000;">Registrar expediente</a>
              </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
           <div class="card-body"><!--Cuerpo del card body principal -->
             <form method="POST">
                    <strong>Datos generales de expedientes</strong>
                    <hr>
                    <div class= "row"> 
                        <div  class="col-sm-4">
                        <?php 

                        // AND i.FECHA_CITA = CURDATE();";

                        $query2 = "SELECT i.CODIGO_CITA as CITA, concat(pe.DNI, ' ', pe.PRIMER_NOMBRE, ' ', pe.PRIMER_APELLIDO) as PACIENTE
                        FROM tbl_inscripcion_cita i, tbl_persona pe 
                        WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                        AND I.CODIGO_ESTADO = '9';";
                       
                        $resul2=$conn->query($query2);                
                        ?>
                        <label for="" class="control-label">Paciente</label> 
                        <div class="form-group">
                            <select class="form-control select2" name="codigo_paciente_expediente"> 
                                <option selected disabled value="">--Buscar Paciente--</option>
                                <?php 
                                    if ($resul2->num_rows > 0) {
                                    while($row2 = $resul2->fetch_assoc()) { 
                                    $codigo2 = $row2['CITA'];
                                    $nombre2 = $row2['PACIENTE'];
                                    ?>
                                <option value="<?php echo $codigo2?>" ><?php echo $nombre2;?></option>
                                <?php 
                                } 
                                }
                                ?>
                            </select>
                        </div>
                        </div><!--fin del paciente -->

                        <div  class="col-sm-2">
                            <?php 
                            $queryTipo = "SELECT CODIGO_TIPO_SANGRE ,TIPO from tbl_tipo_sangre ";
                            $resultadotipo=$conn->query($queryTipo);                
                            ?>
                          <label for="" class="control-label">Tipo Sangre</label> 
                           <div class="form-group">
                             <select class="form-control select2" tyle="width: 100%;"  name ="tipo_sangre"> 
                                <option selected >--Seleccione tipo--</option>
                                <?php 
                                    if ($resultadotipo->num_rows > 0) {
                                    while($rowtipo = $resultadotipo->fetch_assoc()) { 
                                    $codigo_tipo = $rowtipo['CODIGO_TIPO_SANGRE'];
                                    $tipo_sangre= $rowtipo['TIPO'];
                                    ?>
                                <option value="<?php echo $codigo_tipo; ?>" ><?php echo $tipo_sangre;?></option>
                                <?php 
                                } 
                                }
                                ?>
                             </select>
                            </div>
                        </div><!--fin del tipo sangre -->

                        <div class="col-sm-3">
                         <label for="" class="control-label">Tratamientos que toma actualmente</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="textarea" name="tratamientos" id="DIRECCION" autocomplete = "off" onkeypress=""></textarea>
                            </div>
                        </div><!--fin del peso -->

                        <div  class="col-sm-3">
                          <label for="" class="control-label">¿Padece de alguna enfermedad?</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="textarea" name="enfermedades"  autocomplete = "off" onkeypress=""></textarea>
                            </div>
                        </div><!--fin del la estatura -->


                    </div> <!--fin del row -->
                    </br>
                    <strong>Otros Datos Paciente</strong>
                    <hr>
                    <br>
                    <div class="row">
                     
                      <div class="col-md-3">
                       <div class="card">
                          <div class="card-header" style="background-color:#DFD4FE;">
                             <strong>ALERGIAS </strong>
                          </div>
                       <div class="card-body">
                        <?php 
                          $queryALE = "SELECT CODIGO_ALERGIAS,NOMBRE from tbl_alergias ";
                          $resultadodALE=$conn->query($queryALE);                
                          ?>
                          <?php 
                          if ($resultadodALE->num_rows > 0) {
                            while($rowALE = $resultadodALE->fetch_assoc()) { 
                            $codigoALE = $rowALE['CODIGO_ALERGIAS'];
                            $nombreALE= $rowALE['NOMBRE'];
                          ?>
                        <div  class="form-check icheck-green" >
                            <input  class="form-check-input" type="checkbox" name="alergia[]" id="alergia<?php echo $codigoALE;?>" value="<?php echo $codigo;?>">
                            <label class="form-check-label" for="alergia<?php echo $codigoALE;?>">
                              <?php echo $nombreALE;?>
                            </label>
                            </br>
                            
                          </div>
                          <?php 
                          } 
                          }
                          ?>
                      </div>
                     </div>
                      </div>
                      <!-- End: checkbox -->
                      <div class="col-md-3">
                        <div class="card">
                            <div class="card-header" style="background-color:#DFD4FE;">
                              <strong>Transtornos sistemas corporales</strong>
                            </div>
                        <div class="card-body">
                        
                            <?php 
                                $query = "SELECT CODIGO_TRANSTORNO ,TIPO from `TBL_TRANSTORNOS_CORPORALES` ";
                                $resultadod=$conn->query($query);                
                                ?>
                                <?php 
                                if ($resultadod->num_rows > 0) {
                                while($row = $resultadod->fetch_assoc()) { 
                                $codigo = $row['CODIGO_TRANSTORNO'];
                                $nombre= $row['TIPO'];
                                ?>
                            <div  class="form-check icheck-pink" >
                                <input  class="form-check-input" type="checkbox" name="antecedentes[]" id="antecedente<?php echo $codigo;?>" value="<?php echo $codigo;?>">
                                <label class="form-check-label" for="antecedente<?php echo $codigo;?>">
                                    <?php echo $nombre;?>
                                </label>
                                </br>
                                
                                </div>
                                <?php 
                                } 
                                }
                                ?>
                      </div><!--fin otros antecedentes--> 
                      </div>
                      </div>


                      <div class="col-md-3">
                        <div class="card">
                            <div class="card-header" style="background-color:#DFD4FE;">
                              <strong>Apariencia fisica</strong>
                            </div>
                        <div class="card-body">
                        
                            <?php 
                                $query1 = "SELECT CODIGO_APARIENCIA ,TIPO from TBL_APARIENCIA_FISICA  ";
                                $resultadod1=$conn->query($query1);                
                                ?>
                                <?php 
                                if ($resultadod1->num_rows > 0) {
                                while($row1 = $resultadod1->fetch_assoc()) { 
                                $codigo1 = $row1['CODIGO_APARIENCIA'];
                                $nombre1= $row1['TIPO'];
                                ?>
                            <div  class="form-check icheck-pink" >
                                <input  class="form-check-input" type="checkbox" name="apariencia[]" id="apariencia<?php echo $codigo;?>" value="<?php echo $codigo;?>">
                                <label class="form-check-label" for="antecedente<?php echo $codigo1;?>">
                                    <?php echo $nombre1;?>
                                </label>
                                </br>
                                
                                </div>
                                <?php 
                                } 
                                }
                                ?>
                      </div><!--fin otros antecedentes--> 
                      </div>
                      </div>
                     
                    </div><!--div del row -->  

                 </br></br>
                <button type="submit"  id="" name="expediente_medico" class="btn btn-info btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar </button>
             </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->
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

