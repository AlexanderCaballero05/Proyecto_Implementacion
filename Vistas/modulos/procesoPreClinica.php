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
          <h4> REGISTRO DE PRECLINICA PROSECAR  <i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Citas Medicas</a>
            </li>
            <li class="nav-item" disabled="disabled">
            <a class="nav-link active" style="color:#000000;" href="#">Pre Clinica</a>
            </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
           <div class="card-body"><!--Cuerpo del card body principal -->
             <form method="POST"  class=" needs-validation" novalidate>
                    </br>
                    <strong>Datos generales  Paciente Pre-Clinica</strong>
                    <hr> <br>
                    <div class= "row"> 
                       <div  class="col-sm-6 mb-3">
                          <?php 
                           $query = "SELECT c.CODIGO_CITA as CODIGO, CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
                           as PACIENTE  from tbl_inscripcion_cita c ,tbl_persona p
                           where p.CODIGO_PERSONA = c.CODIGO_PERSONA
                           AND c.CODIGO_ESTADO = '10'";
                           $resul=$conn->query($query);                
                           ?>  
                              <?php 
                                   if ($resul->num_rows > 0) {
                                   while($row = $resul->fetch_assoc()) { 
                                    $codigo = $row['CODIGO'];
                                    $nombre_pa = $row['PACIENTE'];
                              ?>              
                          <label for="" class="control-label">Paciente</label> 
                          <div class="form-group">
                            <input  readonly class="form-control" value="<?php echo $nombre_pa;?>">
                            <input  hidden name="codigo_paciente" value="<?php echo $codigo;?>">
                          </div>
                          <?php
                          }
                          }
                          ?>
                        </div><!--fin del paciente -->

                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Peso</label> 
                          <div class="input-group ">
                            <input  maxlength="6"  type="text" class="form-control" autocomplete = "off" placeholder=" Ej: 130.5 " name="peso" required >
                            <div class="input-group-append">
                              <span class="input-group-text">Lb</span>
                            </div>
                             <div class="invalid-feedback">
                                 Llene este campo.
                              </div>
                          </div>
                        </div>

                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Estatura</label> 
                          <div class="input-group ">
                            <input type="text" placeholder=" Ej:1.82"   maxlength="5" autocomplete = "off" required class="form-control"  name="estatura" required >
                            <div class="input-group-append">
                              <span class="input-group-text">M</span>
                            </div>
                            <div class="invalid-feedback">
                              Llene este campo.
                            </div>
                          </div>
                        </div>  
                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Temperatura</label> 
                          <div class="input-group ">
                            <input type="text"  placeholder=" Ej:37.2"  autocomplete = "off" required class="form-control"  name="temperatura" required>
                            <div class="input-group-append">
                              <span class="input-group-text">°C</span>
                            </div>
                              <div class="invalid-feedback">
                                 Llene este campo.
                              </div>
                          </div>
                        </div>  
                    </div> <!--fin del row -->
                    <div class="row">
                      <div  class="col-sm-4 mb-3">
                          <div class="form-group">
                            <label for="" class="control-label">Estatus de desnutrición</label>
                            <select class="form-control " required name="desnutricion" required> 
                             <option  value="">--Seleccione--</option>
                              <option  value="No tiene">No tiene</option>
                              <option   value="Moderado">Moderado</option>
                              <option  value="Grave">Grave</option>
                            </select>
                            <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                          </div>
                        </div>
                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Presión Arterial</label> 
                          <div class="input-group ">
                            <input type="text"  maxlength="5"  name="FC" placeholder=" Ej: 70/80"  autocomplete = "off" required class="form-control" required>
                            <div class="input-group-append">
                              <span class="input-group-text">mm Hg</span>
                            </div>
                            <div class="invalid-feedback">
                              Llene este campo.
                              </div>
                          </div>
                        </div> 
                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Nivel Respiración</label> 
                          <div class="input-group ">
                            <input type="text"  onkeypress="return solonumeros(event);" maxlength="2" name="FR" placeholder="Ej: 12"  autocomplete = "off" required class="form-control" required>
                            <div class="input-group-append">
                              <span class="input-group-text">FR</span>
                            </div>
                            <div class="invalid-feedback">
                              Llene este campo.
                            </div>
                          </div>
                        </div>                 
                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Pulso</label> 
                          <div class="input-group ">
                            <input type="text"  onkeypress="return solonumeros(event);" maxlength="3" name="pulso" placeholder=" Ej:70"  autocomplete = "off" required class="form-control" required>
                            <div class="input-group-append">
                              <span class="input-group-text">lpm</span>
                            </div>
                            <div class="invalid-feedback">
                              Llene este campo.
                              </div>
                          </div>
                        </div> 
                        <div class="col-sm-2 mb-3">
                          <label for="" class="control-label">Indice masa corporal</label> 
                          <div class="input-group ">
                            <input type="text"  maxlength="4"  name="masa_corporal" placeholder=" Ej:18.5"  autocomplete = "off" required class="form-control" required>
                            <div class="input-group-append">
                              <span class="input-group-text">IMC</span>
                            </div>
                            <div class="invalid-feedback">
                              Llene este campo.
                              </div>
                          </div>
                        </div> 
                    </div><!--fin row -->
                    <br>
                 </br></br>
                <button type="submit"  id="" name="Guardar_PreClinica" class="btn btn-info btn mx-1"><span><i class="nav-icon fas fa-arrow-right mx-1"></i></span>Registrar pre-clinica</button>
             </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
</div>
</div>
</body>


<script type="text/javascript">
  function filterFloat(evt,input){
      // Backspace = 8, Enter = 13, ‘0′ = 48, ‘9′ = 57, ‘.’ = 46, ‘-’ = 43
      var key = window.Event ? evt.which : evt.keyCode;   
      var chark = String.fromCharCode(key);
      var tempValue = input.value+chark;
      var isNumber = (key >= 48 && key <= 57);
      var isSpecial = (key == 8 || key == 13 || key == 0 ||  key == 46);
      if(isNumber || isSpecial){
          return filter(tempValue);
      }        
      return false;    
  }
  function filter(__val__){
      var preg = /[1-3]{1}(\.[0-9]{1,2})/; 
      return (preg.test(__val__) === true);
  }
</script>

<script type="text/javascript">
  function estatura(e) {
tecla = (document.all) ? e.keyCode : e.which;
       if (tecla==8) return true;
       else if (tecla==0||tecla==9 )  return true;
          // patron =/[0-9\s]/;// -> solo letras
          patron =/[1-3]{1}(\.[0-9]{1,2})/;// -> solo numeros
          te = String.fromCharCode(tecla);
          return patron.test(te);
        }
      </script>



<script type="text/javascript">
   function TEMPE(evt,input){
      var key = window.Event ? evt.which : evt.keyCode;   
      var chark = String.fromCharCode(key);
      var tempValue = input.value+chark;
      var isNumber = (key >= 48 && key <= 57);
      var isSpecial = (key == 8 || key == 13 || key == 0 ||  key == 46);
      if(isNumber || isSpecial){
          return filter1(tempValue);
      }        
      return false;    
  }
  function filter1(__val__){
      var preg = /^([3-4]{1}\.?[0-9]{0,2})$/; 
      return (preg.test(__val__) === true);
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

