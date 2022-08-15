<!-- 
-----------------------------------------------------------------------
Universidad Nacional Autonoma de Honduras (UNAH)
		Facultad de Ciencias Economicas
Departamento de Informatica administrativa
Analisis, Programacion y Evaluacion de Sistemas
           Primer Periodo 2016

Equipo:


Catedratico:
Lic. Claudia Nuñez (Analisis)
Lic. Giancarlo Martini Scalici Aguilar (Implementación)
Lic. Karla Melisa Garcia Pineda (Evaluación)

---------------------------------------------------------------------

Programa:         Pantalla de Ingreso a mantenimiento modalidad
Fecha:             01-jan-2016
Programador:       Gissela Diaz Y ANY HERNANDEZ
descripcion:       Pantalla que contrala la modalidad de las tutorias 

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

Programador               Fecha                      Descripcion
Diana Rut Garcia         30/06/2022                  Cambios en el titulo
Diana Rut Garcia         20/07/2022                  Cambios en el ortografia
----------------------------------------------------------------------->
<?php
include_once "conexion.php";
include_once "conexion3.php";
include "conexionpdo.php";
include "conexionpdo.php";
$codigoObjeto = 32;///CAMBIAR 
$accion = 'INGRESO A LA PANTALLA DE PROCESO CITAS';
$descripcion = 'REGISTRA UNA CITA DE LAS DIFERENTES AREAS ';
bitacora($codigoObjeto, $accion, $descripcion);
?>
<!-- Selecciona el prametro de la base de datos para la fecha y hora de la cita  :v-->
<?php
  $Fechaactual ="FECHAINICIAL";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($Fechaactual));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor = $row;
  }
?>
<?php
  $hora ="HORA_INICIO_ATENCIONCITA";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($hora));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor1 = $row;
  }
?>
<?php
  $hora1 ="HORA_FINAL_ATENCIONCITA";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($hora1));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor2 = $row;
  }
?>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> 
<style type="text/css">
  #es_medico{
      display:none;
      
    }
</style>
</head>


<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
<!-- trae los query los especialiastas por area,ya por especialidad es vanidad :v-->
<?php
$query= "SELECT concat_ws (' ',tp.PRIMER_NOMBRE,tp.PRIMER_APELLIDO, ' , ' 'ESPECIALIDAD:', te.NOMBRE )  
as ESPECIALISTA ,tpe.CODIGO_PERSONA_ESPECIALIDAD 
from tbl_persona tp ,
tbl_persona_especialidad tpe,
tbl_especialidad  te 
where  tp.CODIGO_PERSONA = tpe.CODIGO_PERSONA
AND te.CODIGO_ESPECIALIDAD= tpe.CODIGO_ESPECIALIDAD and te.CODIGO_AREA = 2
";
$result1= $conn->query($query);
?>

<?php
$query= "SELECT concat_ws (' ',tp.PRIMER_NOMBRE,tp.PRIMER_APELLIDO, ' , ' 'ESPECIALIDAD:', te.NOMBRE )  
as ESPECIALISTA ,tpe.CODIGO_PERSONA_ESPECIALIDAD 
from tbl_persona tp ,
tbl_persona_especialidad tpe,
tbl_especialidad  te 
where  tp.CODIGO_PERSONA = tpe.CODIGO_PERSONA
AND te.CODIGO_ESPECIALIDAD= tpe.CODIGO_ESPECIALIDAD and te.CODIGO_AREA = 3
";
$result2= $conn->query($query);
?>

<?php
$query= "SELECT concat_ws (' ',tp.PRIMER_NOMBRE,tp.PRIMER_APELLIDO, ' , ' 'ESPECIALIDAD:', te.NOMBRE )  
as ESPECIALISTA ,tpe.CODIGO_PERSONA_ESPECIALIDAD 
from tbl_persona tp ,
tbl_persona_especialidad tpe,
tbl_especialidad  te 
where  tp.CODIGO_PERSONA = tpe.CODIGO_PERSONA
AND te.CODIGO_ESPECIALIDAD= tpe.CODIGO_ESPECIALIDAD and te.CODIGO_AREA = 4
";
$result3= $conn->query($query);
?>
<body>
    <section class="content">
    <div class="container-fluid">
        <section class="content-header text-xl-center mb-3 ">
              <h4> Registrar Citas Generales
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="crudcitasgenerales">Citas Generales</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="crudinscripcioncita">Citas Hoy</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Agregar Cita</a>
            </li>
          </ul>
          </div>
          <div class="card-body">  
          <div class="row">
              <div class="col-md-12 col-md-offset-2">
              <button onclick="location.href='ediusuariosestudiantes'"  type="button"  style="color:white;"class="btn btn- lg btn-success float-right"><span><i class="nav-icon fa fa-arrow-left mx-2 "></i></span> Regresar </button>
              </div>
            </div><hr>
            <form method="POST" class="was-validated" >
                <div class="row">
                 <?php
                 if(isset($_POST['ingresarCitaEstudiante'])) {
                  $persona =($_POST['ingresarCitaEstudiante']);
                   }  
                  ?>              
                 <div class="col-sm-12">  
                    <?php
                      $query = "SELECT p.CODIGO_PERSONA, CONCAT_WS(' ', p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO) AS NOMBRE
                      FROM tbl_persona p 
                      WHERE p.CODIGO_PERSONA = '$persona'";
                    $resul=$conn->query($query);  
                    if($resul->num_rows > 0){
                      while($row = $resul->fetch_assoc()){
                        $codigo_estudiante =  $row['CODIGO_PERSONA'];
                        $nombreEstudiante = $row['NOMBRE'];
                      }
                    }
                    ?>   
                   <label for="" class="control-label">Nombre del Estudiante</label>
                   <div class="form-group">
                      <input  hidden name="CODPACIENTE" value="<?php echo $codigo_estudiante;?>">
                      <input  readonly class="form-control" value="<?php echo $nombreEstudiante;?>">
                   </div>
                  </div>
                </div> 
               
                <div class="row">
                   <div class="col-sm-3 mb-3">
                     <?php
                      $query= "SELECT CODIGO_AREA ,NOMBRE  FROM tbl_area  where CODIGO_AREA <> 1 and CODIGO_ESTADO = 2 ";
                      $filas_area= $conn->query($query);
                      ?>
                            <label for="txtcodigo_especialista">Área de la Cita</label>
                            <select class="form-control select2" name="area_cita" id="area_cita" required>
                            <option selected disabled value= "">--Seleccione un Área--</option>
                                <?php
                                if ($filas_area->num_rows > 0){
                                while($row = $filas_area->fetch_assoc()){ 
                                ?>
                                <option value="<?php echo $row['CODIGO_AREA'];?>"><?php echo $row['NOMBRE'];?></option>
                                <?php
                                  }
                                  }
                                ?>
                            </select>
                            <div class="invalid-feedback">
                            Complete este campo.
                            </div>  
                    </div>
                    <div style ="display:none;" id="es_medico" class="col-sm-4  mb-3">
                        <?php
                        $query= "SELECT  CODIGO_ESPECIALIDAD,NOMBRE FROM tbl_especialidad where CODIGO_AREA =2 and CODIGO_ESTADO = 2 ";
                        $resultado= $conn->query($query);
                        ?> 
                        <div class="form-group">
                            <label for="txtcodigo_especialista">Especialidad Cita Medica</label><!-- cita medica-->
                            <select class="form-control select2" name="es_medico"  >
                            <option value= "">--Selecione Especialidad--</option>
                                <?php
                                if ($resultado->num_rows > 0){
                                while($row = $resultado->fetch_assoc()){ 
                                  $codigo_medico = $row['CODIGO_PERSONA'];
                                ?>
                                <option value="<?php echo $row['CODIGO_ESPECIALIDAD'];?>"><?php echo $row['NOMBRE'];?></option>
                                <?php
                                  }
                                  }
                                ?>
                            </select>
                            <div class="invalid-feedback">
                            Complete este campo.
                            </div>
                        </div>
                    </div>
                    
                    <div  style ="display:none;" id="es_psico" class="col-sm-4  mb-3">
                        <?php
                        $query= "SELECT  CODIGO_ESPECIALIDAD,NOMBRE FROM tbl_especialidad where CODIGO_AREA = 3 and CODIGO_ESTADO = 2";
                        $resultado= $conn->query($query);
                        ?> 
                        <div class="form-group">
                            <label for="txtcodigo_especialista">Especialidad Cita Psicologica</label><!-- cita medica-->
                            <select class="form-control select2" name="es_psico"   >
                            <option value= "">--Selecione Especialidad Psicologica--</option>
                                <?php
                                if ($resultado->num_rows > 0){
                                while($row = $resultado->fetch_assoc()){ 
                                ?>
                                <option value="<?php echo $row['CODIGO_ESPECIALIDAD'];?>"><?php echo $row['NOMBRE'];?></option>
                                <?php
                                  }
                                  }
                                ?>
                            </select>
                            <div class="invalid-feedback">
                            Complete este campo.
                            </div>
                        </div>
                    </div>
                    <div  style ="display:none;" id="es_espiritual" class="col-sm-4  mb-3">
                        <?php
                        $query= "SELECT  CODIGO_ESPECIALIDAD,NOMBRE FROM tbl_especialidad where CODIGO_AREA = 4 and CODIGO_ESTADO = 2 ";
                        $resultado= $conn->query($query);
                        ?> 
                        <div class="form-group">
                            <label for="txtcodigo_especialista">Tipos de Catequesis</label><!-- cita medica-->
                            <select class="form-control select2" name="es_espiritual"  >
                            <option value= "">--Selecione Catequesis--</option>
                                <?php
                                if ($resultado->num_rows > 0){
                                while($row = $resultado->fetch_assoc()){ 
                                ?>
                                <option value="<?php echo $row['CODIGO_ESPECIALIDAD'];?>"><?php echo $row['NOMBRE'];?></option>
                                <?php
                                  }
                                  }
                                ?>
                            </select>
                            <div class="invalid-feedback">
                            Complete este campo.
                            </div>
                        </div>
                    </div>
         <!--     </div>fin row -->        
                   <!--Solo esta para ver de forma visual,no se manda insertar ni nada -->
                    <div  id="mostrar_ecita" class="col-sm-5 mb-3">
                        <div class="form-group">
                            <label for="txtcodigo_especialista">Encargados Citas</label>
                            <select class="form-control select2"  >
                            <option value= "">--Seleccione Encargado--</option>
                            </select>
                           
                        </div>
                    </div>
                    <div style ="display:none;" id="encargado_medico" class="col-sm-5 mb-3">
                        <div class="form-group">
                            <label for="txtcodigo_especialista">Encargados de cita Medica</label>
                            <select class="form-control select2" name="encargado_medico"   >
                            <option value= "">--Seleccione Encargado--</option>
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
                            Complete este campo.
                            </div>
                        </div>
                    </div>
                    <div style ="display:none;" id="encargado_psico" class="col-sm-5 mb-3">
                        <div class="form-group">
                            <label for="txtcodigo_especialista">Encargados de citas Psicologica</label>
                            <select class="form-control select2" name="encargado_psicologo"  >
                            <option value= "">--Seleccione Encargado--</option>
                                <?php
                                if ($result2->num_rows > 0){
                                while($row = $result2->fetch_assoc()){ 
                                ?>
                                <option value="<?php echo $row['CODIGO_PERSONA_ESPECIALIDAD'];?>"><?php echo $row['ESPECIALISTA'];?></option>
                                <?php
                                  }
                                  }
                                ?>
                            </select>
                            <div class="invalid-feedback">
                            Complete este campo.
                            </div>
                        </div>
                    </div>
                    <div style ="display:none;" id="encargado_catequesis" class="col-sm-5 mb-3"><!-- area espiritual-->
                        <div class="form-group">
                            <label for="txtcodigo_especialista">Encargados de Catequesis</label>
                            <select class="form-control select2" name="encargado_catequesis"  >
                            <option value= "">--Seleccione Encargado--</option>
                                <?php
                                if ($result3->num_rows > 0){
                                while($row = $result3->fetch_assoc()){ 
                                ?>
                                <option value="<?php echo $row['CODIGO_PERSONA_ESPECIALIDAD'];?>"><?php echo $row['ESPECIALISTA'];?></option>
                                <?php
                                  }
                                  }
                                ?>
                            </select>
                            <div class="invalid-feedback">
                            Complete este campo.
                            </div>
                        </div>
                    </div>
                   <div class="col-sm-3  mb-3">
                      <div class="form-group">
                        <label for="txtcodigo_persona"> Hora </label>
                        <input type="time"  min= "<?= ($valor1)?>" step="1800"   max= "<?= ($valor2)?>" 
                         class="form-control" name="agregar_hora" id="agregar_hora" required>
                        <div class="invalid-feedback">
                        Complete este campo con una hora valida.
                        </div>
                     </div>
                    
                   </div>
                   <?php  

                        date_default_timezone_set("America/Guatemala"); /* Establece una zona horaria para la fecha actual  */
                        $Fechaactual=  date('Y-m-d');
                        $fechamaxima= date("Y-m-d",strtotime($Fechaactual."+ 2 month"));/* para la fecha maxima le sumo dos meses a la fecha actual */
                   ?>

                   <div class="col-sm-3 mb-3">
                        <div class="form-group">

                            <label for="fecha" class="form-label">Fecha de la Cita </label>
                            <input type="date" min= "<?= date ($Fechaactual)?>" 
                            max="<?= date($fechamaxima)?>"                             
                            class="form-control" 
                            name="agregar_fecha_cita" id="agregar_fecha_cita" required>
                            <div class="invalid-feedback">
                            Complete este campo con una fecha valida.
                            </div>
                        </div>
                      </div>
                 </div> <!-- fin de algo--> 
              </br>
              <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                            FROM tbl_usuario 
                                                            WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                //llamar al procedimiento almacenado
                                $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                                $evaluar_permiso->execute(array($usuariomo, '32'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->       
                     <?php 
                      if($permiso_registrar == 'SI'){
                     ?>
              <button type="submit"  id="GUARDARCITA_GENERAL" name="GUARDARCITA_GENERAL" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
              <?php
                    }
                    ?>
               <br><br>
            </form>
          </div><!--fin del modal de eliminar -->          
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
  </div><!--fin del form group -->
<!-- Cierre del div wraper -->


</body>

 <script>
    $( function() {
        $("#area_cita").change( function() {
        if ($(this).val() === "2") {//area medica
          document.getElementById('es_psico').style.display = "none";
          document.getElementById('encargado_catequesis').style.display = "none";
          document.getElementById('es_espiritual').style.display = "none";
          document.getElementById('mostrar_ecita').style.display = "none";
          document.getElementById('encargado_psico').style.display = "none";
          document.getElementById('es_medico').style.display = "block";
          document.getElementById('encargado_medico').style.display = "block";

        }else if($(this).val() === "3"){//area psicologia
          document.getElementById('encargado_medico').style.display = "none";
          document.getElementById('encargado_catequesis').style.display = "none";
          document.getElementById('es_medico').style.display = "none";
          document.getElementById('mostrar_ecita').style.display = "none";
          document.getElementById('es_espiritual').style.display = "none";
          document.getElementById('es_psico').style.display = "block";
          document.getElementById('encargado_psico').style.display = "block";

        }else if($(this).val() === "4"){//area espiritual ,el area olvidada :v
          document.getElementById('encargado_medico').style.display = "none";
          document.getElementById('es_medico').style.display = "none";
          document.getElementById('es_psico').style.display = "none";
          document.getElementById('mostrar_ecita').style.display = "none";
          document.getElementById('encargado_psico').style.display = "none";
          document.getElementById('es_espiritual').style.display = "block";
          document.getElementById('encargado_catequesis').style.display = "block";

        }else if($(this).val() === "10"){
          document.getElementById('es_psico').style.display = "none";
          document.getElementById('encargado_catequesis').style.display = "none";
          document.getElementById('es_espiritual').style.display = "none";
          document.getElementById('encargado_psico').style.display = "none";
          document.getElementById('es_medico').style.display = "none";
          document.getElementById('encargado_medico').style.display = "none";
          document.getElementById('mostrar_ecita').style.display = "block";

        }
    });
  }); // 
</script>

<script>
  (function () {
    'use strict'
    var forms = document.querySelectorAll('.was-validated')
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