<?php
include_once "conexion.php";
include_once "conexion3.php";
include "conexionpdo.php";
$codigoObjeto = 32;///CAMBIAR 
$accion = 'Ingreso a la pantalla de mantenimiento de Inscripcion Cita ';
$descripcion = 'Ver los registros de los Inscripcion Cita ';
bitacora($codigoObjeto, $accion, $descripcion);
?>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><!--Para que funcione el selecrt2 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>


<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <?php
include_once "conexion3.php";
$query= "SELECT concat_ws (' ',tp.PRIMER_NOMBRE,tp.PRIMER_APELLIDO, ' , ' 'espeecialialidad:', te.NOMBRE )  
as ESPECIALISTA ,tpe.CODIGO_PERSONA_ESPECIALIDAD 
from tbl_persona tp ,
tbl_persona_especialidad tpe,
tbl_especialidad  te 
where  tp.CODIGO_PERSONA = tpe.CODIGO_PERSONA
AND te.CODIGO_ESPECIALIDAD= tpe.CODIGO_ESPECIALIDAD";
$result1= $conn->query($query);
?>

<?php
include_once "conexion3.php";
$query= "SELECT concat_ws (' ' ,tp.PRIMER_NOMBRE, tp.PRIMER_APELLIDO ) 
as PACIENTE  , tp.CODIGO_PERSONA 
from tbl_persona tp ";
$result3= $conn->query($query);
?>
<?php
include_once "conexion3.php";
$query= "SELECT  concat_ws( ' ', ta.NOMBRE , te.NOMBRE  )  as NOMBRE , te.CODIGO_ESPECIALIDAD 
from tbl_area ta, tbl_especialidad  te,  where ta.CODIGO_AREA  = te.CODIGO_AREA ";
$result4= $conn->query($query);
?> 
<?php
include_once "conexion3.php";
$query= "SELECT ta.CODIGO_AREA , ta.NOMBRE 
from tbl_area ta ";
$result5= $conn->query($query);
?> 
    <section class="content">
    <div class="container-fluid">
        <section class="content-header text-xl-center mb-3 btn-light">
              <h4> REGISTRAR CITA MEDICA <i class=" nav-icon fas  fa-hospital"></i></h4>
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;"  href="crudinscripcioncita">Ver Cita</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active"  style="color:#000000;" aria-current="true" href="procesocita">Registrar Cita </a>
              </li>
            </ul>
          </div>
          <div class="card-body">  
            <form id="formcita" action="procesocita" method="POST" class=" needs-validation">

              <div class="row">
                <div class="col-sm-4 mb-3">
                    <?php 
                    $query = "SELECT CODIGO_PERSONA, CONCAT(PRIMER_NOMBRE, ' ',SEGUNDO_NOMBRE,' ',PRIMER_APELLIDO) AS NOMBRE
                    FROM `tbl_persona` ";
                    $resultadod=$conn->query($query);                
                    ?>
                   <label for="txtcodigo_cita">Paciente</label>
                    <select  style="width: 100%;"  class="form-control select2" name="CODPACIENTE" id="" type="text" required >
                      <option selected disabled value="">Buscar Paciente...</option>
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
                  <div class="col-sm-5">
                        <div class="form-group">
                            <label for="txtcodigo_especialista">Especialista </label>
                            <select class="form-control select2" name="agregar_especialista" id="agregar_especialista" required="">
                            <option value= "">Agregar Especialista</option>
                                <?php
                                if ($result1->num_rows > 0){
                                while($row = $result1->fetch_assoc()){ 
                                ?>
                                <option value="<?php echo $row['CODIGO_PERSONA_ESPECIALIDAD'];?>"><?php echo $row['ESPECIALISTA'];?></option>
                                <?php
                                  }
                                  }
                                ?>
                            </select>
                            <div class="invalid-feedback">
                             Llene este campo.
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="fecha" class="form-label">Fecha de la cita </label>
                            <input type="date"  
                            required max="<?php $hoy=date("Y"); echo $hoy;?>"  
                            class="form-control" 
                            name="agregar_fecha_cita" id="agregar_fecha_cita">
                        </div>
                      </div>
              </div><!--fin row -->        
                 <div class="row"> 
                   <div class="col-sm-4">
                      <div class="form-group">
                        <label for="txtcodigo_persona"> Hora </label>
                        <input type="time" required min="09:00:00"  step="1800" max= "17:00:00"  step="1800"class="form-control" name="agregar_hora" id="agregar_hora">
                     </div>
                   </div>
                 </div>  
              </br></br></br>
              <button type="submit"  id="GUARDARCITA" name="GUARDARCITA" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
               <br><br>
            </form>
          </div><!--fin del modal de eliminar -->          
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
  </div><!--fin del form group -->
<!-- Cierre del div wraper -->


 <script>
    (function () { //todavia no esta lo del validation :v
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

<script>

// Example starter JavaScript for disabling form submissions if there are invalid fields

(function () {
  'use strict'
  var forms = document.querySelectorAll('.needs-validation')
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
<!-- Creado por Gissela y Any :( -->