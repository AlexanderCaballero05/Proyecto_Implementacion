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

Programa:         Pantalla de Ingreso a de cargar academica 
Fecha:             
Programador:         
descripcion:       Pantalla que contrala cargar academica 

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

Programador               Fecha                      Descripcion
ANY HERNANDEZ           26/06/22                      NO ACEPTE LETRAS EN EL CAMPOS MESES Y ORTOGRAFIA,FECHA MINIMA Y MAXIMA
Diana Rut Garcia        03/07/2022                   Cambio en el titulo
ANY HERNANDEZ           15/07/2022                   MODIFICACION DE ORDEN DE LOS DATOS 
----------------------------------------------------------------------->


<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once  "conexionpdo.php";
 include "conexionpdo.php";
?>
<?php
  $Fechaactual ="MAX_MESES_DE_TUTURIA";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($Fechaactual));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor = $row;
  }

?>
<?php
  $horainicial="HORA_INICIO_CARGAACADEMICA";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array( $horainicial));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $horainicio = $row;
  }
?>
<?php
  $horafinal="HORA_FINAL_CARGAACADEMICA";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($horafinal));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $horafinalcarga = $row;
  }
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
    <section class="content-header text-xl-center">
      <h1>
          <h4> Agregar Carga Académica/Espiritual  <i class=" nav-icon fas  fa-graduation-cap"></i></h4>
      </h1>
    </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="crudCargaAcademica">Ver Carga Académica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="crudCargaEspiritual">Ver Carga Espiritual</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="procesoCargaAcademica">Agregar Carga</a>
            </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body"><!--Cuerpo del card body principal -->
            </br>
            <form  class=" was-validated"  id="FORMREGISTRAR" method="POST">
            <div class="row">

<div class="col-md-3 mb-3"> <!--columna para selecionar el area-->
<?php
     $query= "SELECT CODIGO_AREA ,NOMBRE  FROM tbl_area  
     where CODIGO_AREA <> 6
     AND CODIGO_AREA <> 2
     AND CODIGO_AREA <> 3  and CODIGO_ESTADO =2";
     $filas_area= $conn->query($query);
     ?>
   <div class="form-group">
   <label  class="control-label">Área de la Tutoría:</label> 
    <select class="form-control select2"  name="area_tutoria" id="area_tutoria" required>
      <option selected disable value="">--Seleccione un Área--</option>
      <?php
         if($filas_area->num_rows >0){ 
           while($filas=$filas_area->fetch_assoc()){ 
      ?>
      <option value="<?php echo $filas['CODIGO_AREA'];?>"><?php echo $filas['NOMBRE'];?></option>
       <?php
         }
       }
       ?>
    </select>
      <div class="invalid-feedback">
        Complete este campo.
       </div>
   </div>
 </div><!--fin de columna para selecionar el area-->

 <div style ="display:none;" id="tutorias_academicas" class="col-md-3"> <!--inicio seleccionar tutoria academica-->
   <?php //
   $query = "SELECT CODIGO_TUTORIA, NOMBRE
    FROM tbl_tutoria
    WHERE CODIGO_AREA = 1";
   $resultadod=$conn->query($query);                
   ?>
   <label for="identidad" class="control-label">Nombre Tutoría:</label> 
   <div class="form-group">
     <select style="width: 100%"   class="form-control select2" name="tutorias_academicas" >
       <option selected disabled value="" >--Seleccionar Tutoría--</option>
       <?php 
         if ($resultadod->num_rows > 0) {
           while($row = $resultadod->fetch_assoc()) { 
           $codigo_tutoria = $row['CODIGO_TUTORIA'];
           $nombre = $row['NOMBRE'];
         ?>
       <option value="<?php echo $codigo_tutoria?>" ><?php echo $nombre;?></option>
       <?php 
       } 
       }
       ?>
     </select> 
     <div class="invalid-feedback">
     Complete este campo.
       </div>
   </div>
 </div><!--CIERRE DE LA TUTORIAS ACADEMICAS -->

 <div style ="display:none;" id="tutorias_espirituales" class="col-md-3"> <!--inicio seleccionar tutoria espirituales-->
   <?php //
   $query = "SELECT CODIGO_TUTORIA, NOMBRE
    FROM tbl_tutoria
    WHERE CODIGO_AREA = 4";
   $resultadod=$conn->query($query);                
   ?>
   <label for="identidad" class="control-label">Nombre Tutoría:</label> 
   <div class="form-group">
     <select style="width: 100%"   class="form-control select2" name="tutorias_espirituales" >
       <option selected disabled value="" >--Seleccionar Tutoría--</option>
       <?php 
         if ($resultadod->num_rows > 0) {
           while($row = $resultadod->fetch_assoc()) { 
           $codigo_tutoria = $row['CODIGO_TUTORIA'];
           $nombre = $row['NOMBRE'];
         ?>
       <option value="<?php echo $codigo_tutoria?>" ><?php echo $nombre;?></option>
       <?php 
       } 
       }
       ?>
     </select> 
      <div class="invalid-feedback">
        Complete este campo.
       </div>
   </div>
 </div><!--CIERRE DE LA TUTORIAS ACADEMICAS -->
 
<div style="display:none" id="tutores_academicos" class="col-md-6 mb-3"> <!--Fila para tutores academicos-->
 <?php 
 $query = "SELECT CODIGO_PERSONA, CONCAT_WS(' ',DNI,PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO,SEGUNDO_APELLIDO) as NOMBRE
 FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 2;";
 $resultadod=$conn->query($query);                
 ?>
 <div class="form-group">
   <label  class="control-label">Encargado-Tutor:</label>
   <select  class="form-control select2"  style="width: 100%;"  name="tutor_academico" >
     <option selected disabled value="">--Seleccionar Tutor--</option>
     <?php 
       if ($resultadod->num_rows > 0) {
         while($row = $resultadod->fetch_assoc()) { 
         $codigo_tutor = $row['CODIGO_PERSONA'];
         $nombre = $row['NOMBRE'];
       ?>
     <option value="<?php echo $codigo_tutor?>" ><?php echo $nombre;?></option>
     <?php 
     } 
     }
     ?>
   </select> 
    <div class="invalid-feedback">
     Complete este campo.
    </div>
 </div>
</div><!--CIERRE DE tutores academico-->

 
<div style="display:none" id="tutores_espirituales" class="col-md-6 mb-3"> <!--Fila para tutores_espirituales-->
 <?php 
 $query = "SELECT CODIGO_PERSONA, CONCAT_WS(' ',DNI,PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO,SEGUNDO_APELLIDO) as NOMBRE
 FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 8;";
 $resultadod=$conn->query($query);                
 ?>
 <div class="form-group">
   <label  class="control-label">Catequista/ Asesor Espiritual:</label>
   <select  class="form-control select2"  style="width: 100%;"  name="tutor_espiritual" id="tutor" >
     <option selected disabled value="">--Seleccionar Catequista o Asesor Espiritual--</option>
     <?php 
       if ($resultadod->num_rows > 0) {
         while($row = $resultadod->fetch_assoc()) { 
         $codigo_tutor = $row['CODIGO_PERSONA'];
         $nombre = $row['NOMBRE'];
       ?>
     <option value="<?php echo $codigo_tutor?>" ><?php echo $nombre;?></option>
     <?php 
     } 
     }
     ?>
   </select> 
    <div class="invalid-feedback">
     Complete este campo.
    </div>
 </div>
</div><!--CIERRE DE tutores academico-->
</div><!--FINAL DEL ROW -->
              <div class="row">
                <div class="col-md-3 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora Inicio Tutoría:</label> 
                    <div class="form-group">
                    <input class="form-control"  type="time" min="<?php echo $horainicio ?>"  max="<?php echo $horafinalcarga ?>"    name="hora"  required >
                        <div class="invalid-feedback">
                        Complete este campo con una hora valida dentro de los margenes de <?php echo $horainicio ?> a <?php echo $horafinalcarga ?> .
                        </div>
                    </div>
                  </div>
                  <div class="col-md-3 mb-3"> <!--HORA-->
                    <label for="validationCustom03"  class="control-label">Hora Final Tutoría:</label> 
                    <div class="form-group">
                    <input class="form-control"  type="time"  name="hora_final" min="<?php echo $horainicio ?>"  max="<?php echo $horafinalcarga ?>"  required >
                        <div class="invalid-feedback">
                        Complete este campo con una hora valida dentro de los margenes de <?php echo $horainicio ?> a <?php echo $horafinalcarga ?> .
                        </div>
                    </div>
                  </div>
                  <?php  
                        date_default_timezone_set("America/Guatemala");/* Establece una zona horaria para la fecha actual  */
                        $Fechaactual=  date("Y-m-d"); /* Asigno la variable valor del parametro que contiene la fecha actual*/
                        $fechamaxima= date("Y-m-d",strtotime($Fechaactual."+ $valor month")); /* para la fecha maxima le sumo seis meses a la fecha actual */
                  ?>
                  <div class="col-md-3 mb-3"> <!--FECHA INICIO-->
                    <label  class="control-label">Fecha Inicio:</label> 
                    <div class="form-group">
                    <input class="form-control"  type="date" min= "<?php $MI=date("Y-m-d"); echo $MI;?>"   max ="<?php echo $fechamaxima?>"  
                       name="fecha_inicio" required>
                        <div class="invalid-feedback">
                         Complete este campo con una fecha valida.
                        </div>
                    </div>
                  </div>
                  <?php  
                        date_default_timezone_set("America/Guatemala");
                        $Fechaactual1=  date("Y-m-d"); 
                        $fechamaxima1= date("Y-m-d",strtotime($Fechaactual1."+ $valor month"));
                  ?>

                  <div class="col-md-3 mb-3"> <!--FECHA FINAL-->
                    <label  class="control-label">Fecha Final:</label> 
                    <div class="form-group">
                    <input class="form-control" type="date" min="<?php $MIN=date("Y-m-d"); echo $MIN;?>" max = "<?php echo $fechamaxima1 ?>"  
                      name="fecha_final" required>
                        <div class="invalid-feedback">
                          Complete este campo con una fecha valida.
                        </div>
                    </div>
                  </div>
              </div><!--Cierre del row general -->

              <div class="row"> 
                <div class="col-md-4"> 
                  <?php //
                  $query = "SELECT * FROM tbl_modalidad";
                  $resultadod=$conn->query($query);                
                  ?>
                  <label for="identidad" class="control-label">Modalidad:</label> 
                  <div class="form-group">
                    <select  class="form-select select2 " id="modalidad" style="width: 100%;"  name="modalidad"  required>
                      <option selected disabled value="" >--Seleccione Modalidad--</option>
                      <?php 
                        if($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo_modalidad = $row['CODIGO_MODALIDA'];
                          $nombre = $row['TIPO'];
                        ?>
                      <option value="<?php echo $codigo_modalidad?>" ><?php echo $nombre;?></option>
                      <?php 
                      } 
                      }
                      ?>
                    </select>
                     <div class="invalid-feedback">
                       Complete este campo.
                      </div> 
                  </div>
                </div><!--cierre de la modalidad  -->
                <div class="col-md-4">
                  <?php //
                  $query = "SELECT * FROM tbl_seccion";
                  $resultadod=$conn->query($query);                
                  ?>
                    <label class="control-label">Sección:</label> 
                    <div class="form-group">
                    <select style="width: 100%"   class="form-control select2" name="seccion" required>
                        <option selected disabled value="" >--Seleccionar Sección--</option>
                        <?php 
                          if ($resultadod->num_rows > 0) {
                            while($row = $resultadod->fetch_assoc()) { 
                            $codigo = $row['CODIGO_SECCION'];
                            $nombre = $row['NOMBRE'];
                          ?>
                        <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
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
                  <div class="col-sm-2 mb-3"> 
                    <?php //
                    $query = "SELECT * FROM tbl_tutoria";
                    $resultadod=$conn->query($query);                
                    ?>
                    <label for="identidad" class="control-label">Período:</label> 
                     <div class="input-group ">
                        <input  maxlength="6"  type="text" class="form-control" autocomplete = "off" onkeypress="return solonumeros(event);" placeholder=" Ej: 3 " name="periodo" required >
                        <div class="input-group-append">
                          <span class="input-group-text">Meses</span>
                        </div>
                        <div class="invalid-feedback">
                          Complete este campo.
                        </div>
                    </div>
                  </div><!--CIERRE DEL PERIODO -->
              </div><!--Fin del row -->

              <?php
                include "conexionpdo.php";
                 $usuario=$_SESSION['vario'];
                //Evaluo si existe el tipo de Rol
                 $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                 $evaluar_usuario->execute(array($usuario));
                $row=$evaluar_usuario->fetchColumn();
                if($row > 0){
                  $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                  //llamar al procedimiento almacenado
                  $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                  $evaluar_permiso->execute(array($usuariomo, '20'));
                  $row1=$evaluar_permiso->fetchColumn();
                  $permiso_registrar =$row1;             
                }
              ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
              <?php 
               if ($permiso_registrar == 'SI'){ // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                ?>  
              </br>
              <button type="submit"  id="" name="GUARDAR_CARGA" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
              <?php
                }
              ?>
            </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->

        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
</div>
</div>
</body>

    <script>
      $(function(){//inicio de primera llave
        $("#area_tutoria").change(function(){//inicio de segunda llave
          if($(this).val() == "1"){//para seleccionar el area academica
            document.getElementById('tutorias_academicas').style.display ="block";
            document.getElementById('tutores_academicos').style.display ="block";
            document.getElementById('tutorias_espirituales').style.display ="none";
            document.getElementById('tutores_espirituales').style.display ="none";

          }else if($(this).val() ==="4"){
            document.getElementById('tutorias_espirituales').style.display ="block";
            document.getElementById('tutores_espirituales').style.display ="block";
            document.getElementById('tutorias_academicas').style.display ="none";
            document.getElementById('tutores_academicos').style.display ="none";

          }
        });//cierre de segunda llave
      });//cierre primera llave
    </script>


 <script>
    (function () { 
        'use strict'
        var forms = document.querySelectorAll('.was-validated')
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

<script type="text/javascript"> function solonumeros(e) {
       tecla = (document.all) ? e.keyCode : e.which;
       if (tecla==8) return true;
       else if (tecla==0||tecla==9)  return true;
          // patron =/[0-9\s]/;// -> solo letras
          patron =/[0-9\s]/;// -> solo numeros
          te = String.fromCharCode(tecla);
          return patron.test(te);
        }
      </script>

                    
  
