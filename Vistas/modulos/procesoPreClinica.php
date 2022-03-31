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
          <h4> REGISTRO DE PRECLINICA PROSECAR  <i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                 <a class="nav-link" style="color:#000000;" href="#">Citas Medicas</a>
              </li>
              <li class="nav-item">
                <a  class="nav-link active" aria-current="true" href="#"  style=" color:#000000;">Pre Clinica</a>
              </li>
              <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consultas Medicas</a>
            </li>

            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Recetas Medicas</a>
            </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
           <div class="card-body"><!--Cuerpo del card body principal -->
             <form method="POST"  class=" needs-validation" novalidate>
                    </br>
                    <strong>Datos generales  Paciente Pre-Clinica</strong>
                    <hr>
                    <br>
                    <div class= "row"> 
                        <div  class="col-sm-6 mb-3">
                        <?php 
                        $query = "SELECT c.CODIGO_CITA as CODIGO, CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
                        as PACIENTE  from tbl_inscripcion_cita c ,tbl_persona p
                        where p.CODIGO_PERSONA = c.CODIGO_PERSONA
                        AND c.CODIGO_ESTADO = '10'";
                        $resul=$conn->query($query);                
                        ?>
                        <label for="" class="control-label">Paciente</label> 
                        <div class="form-group">
                            <select class="form-control select2" required name="codigo_paciente" required > 
                                <option selected disabled value="">--Buscar Paciente--</option>
                                <?php 
                                    if ($resul->num_rows > 0) {
                                    while($row = $resul->fetch_assoc()) { 
                                    $codigo = $row['CODIGO'];
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

                        <div class="col-sm-2 mb-3">
                         <label for="" class="control-label">Peso</label> 
                            <div class="form-group">
                                <input type="text" placeholder=" Ej:60 kg" required class="form-control" name="peso" required >
                                <div class="invalid-feedback">
                                 Llene este campo.
                                </div>
                            </div>
                        </div><!--fin del peso -->

                        <div  class="col-sm-2 mb-3">
                          <label for="" class="control-label">Estatura</label> 
                            <div class="form-group">
                                <input type="text" placeholder=" Ej:1.82 cm" required class="form-control"  name="estatura" required >
                                <div class="invalid-feedback">
                                 Llene este campo.
                                </div>
                            </div>
                        </div><!--fin del la estatura -->

                        <div  class="col-sm-2 mb-3">
                          <label for="" class="control-label">Frecuencia Cardiaca</label> 
                           <div class="form-group">
                             <input class="form-control" type="text" name="FC" required> 
                              <div class="invalid-feedback">
                              Llene este campo.
                              </div>
                            </div>
                        </div><!--fin del tipo sangre -->
                    </div> <!--fin del row -->
                    <div class="row">
                      <div class="col-md-2 mb-3"> <!--HORA-->
                        <label for="validationCustom03"  class="control-label">Frecuencia Respiratoria:</label> 
                        <div class="form-group">
                          <input class="form-control"  type="text"  name="FR" id="" required >
                            <div class="invalid-feedback">
                            Llene este campo.
                            </div>
                        </div>
                      </div>

                    </div>
                  
                    <br>
                    
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

