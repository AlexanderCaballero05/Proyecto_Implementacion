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

                        

                        $query = "SELECT con.CODIGO_CONSULTA, concat(pe.DNI, ' ', pe.PRIMER_NOMBRE, ' ', pe.PRIMER_APELLIDO) as PACIENTE
                        FROM tbl_consulta_medica con, tbl_inscripcion_cita i, tbl_persona pe 
                        WHERE con.CODIGO_CITA = i.CODIGO_CITA
                        AND i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                        AND con.FECHA_CREACION = CURDATE();";
                        $resul=$conn->query($query);                
                        ?>
                        <label for="" class="control-label">Paciente</label> 
                        <div class="form-group">
                            <select class="form-control select2" required name="codigo_paciente" > 
                                <option selected disabled value="">--Buscar Paciente--</option>
                                <?php 
                                    if ($resul->num_rows > 0) {
                                    while($row = $resul->fetch_assoc()) { 
                                    $codigo = $row['CODIGO_CONSULTA'];
                                    $nombre = $row['PACIENTE'];
                                    ?>
                                <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                <?php 
                                } 
                                }
                                ?>
                            </select>
                        </div>
                        </div><!--fin del paciente -->

                        <div  class="col-sm-2">
                            <?php 
                            $query = "SELECT CODIGO_TIPO_SANGRE,TIPO from tbl_tipo_sangre ";
                            $resultadod=$conn->query($query);                
                            ?>
                          <label for="" class="control-label">Tipo Sangre</label> 
                           <div class="form-group">
                             <select class="form-control select2" tyle="width: 100%;"  name ="tipo_sangre"  required > 
                                <option selected >--Seleccione tipo--</option>
                                <?php 
                                    if ($resultadod->num_rows > 0) {
                                    while($row = $resultadod->fetch_assoc()) { 
                                    $codigo = $row['CODIGO_TIPO_SANGRE'];
                                    $tipo_sangre= $row['TIPO'];
                                    ?>
                                <option value="<?php echo $codigo; ?>" ><?php echo $tipo_sangre;?></option>
                                <?php 
                                } 
                                }
                                ?>
                             </select>
                            </div>
                        </div><!--fin del tipo sangre -->

                        <div class="col-sm-3">
                         <label for="" class="control-label">Antecedentes padre</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="textarea" name="direccion" id="DIRECCION" onkeyup="mayus(this);" autocomplete = "off" onkeypress=""></textarea>
                            </div>
                        </div><!--fin del peso -->

                        <div  class="col-sm-3">
                          <label for="" class="control-label">Antecedentes madre</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="textarea" name="direccion" id="DIRECCION" onkeyup="mayus(this);" autocomplete = "off" onkeypress=""></textarea>
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
                          $query = "SELECT CODIGO_ALERGIAS,NOMBRE from tbl_alergias ";
                          $resultadod=$conn->query($query);                
                          ?>
                          <?php 
                          if ($resultadod->num_rows > 0) {
                            while($row = $resultadod->fetch_assoc()) { 
                            $codigo = $row['CODIGO_ALERGIAS'];
                            $nombre= $row['NOMBRE'];
                          ?>
                        <div  class="form-check icheck-green" >
                            <input  class="form-check-input" type="checkbox" name="alergia[]" id="alergia<?php echo $codigo;?>" value="<?php echo $codigo;?>">
                            <label class="form-check-label" for="alergia<?php echo $codigo;?>">
                              <?php echo $nombre;?>
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
                              <strong>ANTECEDENTES PATALOGICOS</strong>
                            </div>
                        <div class="card-body">
                        
                            <?php 
                                $query = "SELECT CODIGO_OA,NOMBRE from `tbl_otros_antecedentes` ";
                                $resultadod=$conn->query($query);                
                                ?>
                                <?php 
                                if ($resultadod->num_rows > 0) {
                                while($row = $resultadod->fetch_assoc()) { 
                                $codigo = $row['CODIGO_OA'];
                                $nombre= $row['NOMBRE'];
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
                              <strong>ANTECEDENTES NO-PATALOGICOS</strong>
                            </div>
                        <div class="card-body">
                        
                            <?php 
                                $query = "SELECT CODIGO_OA,NOMBRE from `tbl_otros_antecedentes` ";
                                $resultadod=$conn->query($query);                
                                ?>
                                <?php 
                                if ($resultadod->num_rows > 0) {
                                while($row = $resultadod->fetch_assoc()) { 
                                $codigo = $row['CODIGO_OA'];
                                $nombre= $row['NOMBRE'];
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
                     
                    </div><!--div del row -->  

                 </br></br>
                <button type="submit"  id="" name="Guardar_PreClinica" class="btn btn-info btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar </button>
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

