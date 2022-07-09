<!-- 
-----------------------------------------------------------------------
        Universidad Nacional Autonoma de Honduras (UNAH)
	            	Facultad de Ciencias Economicas
          Departamento de Informatica administrativa
         Analisis, Programacion y Evaluacion de Sistemas
                   Segundo Periodo 2022

  Equipo:
  Arnold Alexander Caballero Garcia (aacaballero@unah.hn)
  Luz Maria Montoya Medina (luz.montoya@unah.hn)
  Diana Rut Garcia Amador (drgarciaa@unah.hn)
  Any Melissa Hernandez (anyhernandez@unah.hn)
  Gissela Yamileth Diaz (gdiaza@unah.hn)
  Cesar Fernando Rovelo (Cesar.rovelo@unah.hn)

  Catedratico:
  Lic. Claudia Nuñez (Analisis)
  Lic. Giancarlo Martini Scalici Aguilar (Implementación)
  Lic. Karla Melisa Garcia Pineda (Evaluación)

---------------------------------------------------------------------
---------------------------------------------------------------------
Programa:          Pantalla que registra datos adicionales al estudiante
Fecha:             01-jan-2016
Programador:       Arnold Caballero
descripcion:       Registra los datos estudiantiles ,como ser socioeconomicos,escolares etc
-----------------------------------------------------------------------
Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion
Diana Rut               31/05/2022            Se agrego campo de sacramentos
Arnold Caballero        17/06/2022            Se valido el maximo y minimo de los inputs
----------------------------------------------------------------------->
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=20;
 $accion='Ingreso al proceso de Carga Academica';
 $descripcion= 'Usuario se autentifico ';
 bitacora($codigoObjeto, $accion,$descripcion);
?>

<?php
  //Parametro de maximo contraseña
  $max_clave = "NUM_MAX_CARACTER";
  $sentencia2 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia2->execute(array($max_clave));
  $row2=$sentencia2->fetchColumn();
  if($row2>0){
    $valor3 = $row2;
  }
?>
<?php
//Parametro de minimo contraseña
  $min_clave ="NUM_MIN_CARACTER";
  $sentencia3 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia3->execute(array($min_clave));
  $row3 = $sentencia3->fetchColumn();
  if($row1>0){
    $valor4 = $row3;
  }
?>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>
<body oncopy="return false" onpaste="return false">
<div class="content-wrapper">
  <div class="content-header">
     <!--Aqui iba el titulo :v -->
  </div>
  <section class="content">
      <div class="content-header text-xl-center mb-3 ">
         <h4>AGREGAR ESTUDIANTE</h4>
      </div>
    <div class="container-fluid">
                <!-- Inicio del PROCESO inscripcion de estudiantes-->
        <div class="card ">
          <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
              <a class=" nav-link" style="color:#000000;" href="crudEstudiante">Ver datos Escolares</a>
            </li>
              <li class="nav-item ">
                <a class="nav-link "  style="color:#000000;"href="crudContenidoEconoEstudiante">Ver Datos socioeconómicos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" style="color:#000000;" href="procesoRegistrarEstudiante">Agregar Estudiante</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;" href="crudFamiliaresEstudiantes">Relación Estudiante-Familiar</a>
              </li>
            </ul>
          </div>
          <div class="card-body"><!--Cuerpo del card body principal -->
          <!-- TITULO ENCABEZADO DATOS PERSONALES -->
            
         <form method="POST" class="needs-validation" novalidate>
            <strong>Datos escolares</strong>
            <hr>
            </br>
            <div class="row mb-5 pl-3">
                    <?php //
                    $query = "SELECT CODIGO_PERSONA, CONCAT_WS(' ',DNI,PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO) AS NOMBRE
                    FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 4;";
                    $resultadod=$conn->query($query);                
                    ?>
             <a href="categoria">
              <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar persona</button>
              </a>
                  <div class="col-sm-10 order-2 pl-2">
                    <select  style="width: 100%;"  class="form-control select2" name="CODPERSONA" id="" type="text" required >
                    <option selected disabled value="">Buscar estudiantes...</option>
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
            </div>
                    <div class="row">
                      <div class="col-md-3"> <!--INICIO IDENTIDAD-->
                          <label for="identidad" class="control-label">Grado Actual</label> 
                          <div class="form-group">
                             <input class="form-control" type="text" name="GRADO" onkeyup="mayus(this);" autocomplete = "off" onblur="quitarespacios(this);" required pattern="[A-Z,1-9]{<?php echo $valor4;?>,<?php echo $valor3;?>}"  maxlength="15" placeholder="Ej: 2" required="" >
                              <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                      </div>
                      <div class="col-md-3">
                        <label  class="control-label pl-4">¿Repite curso?</label>
                        <br>
                        <div class="form-check form-check-inline pl-4 pr-4">
                          <input class="form-check-input" type="radio" name="REPITENTE" id="inlineRadio1" value="SI" required="">
                          <label class="form-check-label" for="inlineRadio1">SI</label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="REPITENTE" id="inlineRadio2" value="NO" required="">
                          <label class="form-check-label" for="inlineRadio2">NO</label>
                        </div>
                      </div>
                        <div class="col-md-3"> <!--INICIO INDICE ACADEMICO-->
                          <label for="identidad" class="control-label">Índice académico</label> 
                          <div class="form-group">
                            <input class="form-control" type="text" maxlength="3" minlength="2" name="INDICE" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 90" required="" >
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>

                        <div class="col-md-3"> <!--INICIO PASATIEMPOS-->
                          <label for="MATERIAS" class="control-label">Materias con bajo rendimiento</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea"  name="MATERIAS" id="MATERIAS" autocomplete = "off" onblur="quitarespacios(this);"  onkeypress="return soloLetras(event);"  maxlength="100"  minlength="<?php echo $valor4;?>" placeholder="Ejemplo: Español" required="" ></textarea>
                               <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>
                    </div>


                  <div class="row">
                        <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="PASATIEMPOS" class="control-label">Pasatiempos</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" maxlength="255" name="PASATIEMPOS" id="PASATIEMPOS" autocomplete = "off" onblur="quitarespacios(this);"  onkeypress="return soloLetras(event);"  maxlength="255"  minlength="<?php echo $valor4;?>"  placeholder="Ejemplo: Ver Telelevision" required="" ></textarea>
                          <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>

                        <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="DISTRACTORES" class="control-label">Distractores</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" maxlength="255" name="DISTRACTORES" id="DISTRACTORES" autocomplete = "off" onblur="quitarespacios(this);"  onkeypress="return soloLetras(event);"  maxlength="100"  minlength="<?php echo $valor4;?>" placeholder="Ejemplo: Redes Sociales" required="" ></textarea>
                          <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>

                        <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="METAS" class="control-label">Metas</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" maxlength="255" minlength="2" name="METAS" id="METAS" onkeyup="mayus(this);" autocomplete = "off" onkeypress="return soloLetras(event);" placeholder="Ejemplo: Estudiar en la universidad" required="" ></textarea>
                          <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>
                  </div><!--Cierre del row general -->
                  <br>
                   <!--Sacramentos -->
                    <div>
                       <h2 class="card-title"><strong>Sacramentos de Estudiante</strong></h2><br><hr>
                    <div class="row">
                      <div  id="sacramentos" class="col-md-12">
                          <?php 
                          $query = "SELECT CODIGO_SACRAMENTO,NOMBRE from tbl_sacramento ";
                          $resultado=$conn->query($query);                
                          ?>
                          <?php 
                          if ($resultado->num_rows > 0) {
                          while($row = $resultado->fetch_assoc()) { 
                          $codigo = $row['CODIGO_SACRAMENTO'];
                          $nombre= $row['NOMBRE'];
                          ?>
                        <div class="icheck-yellow d-inline">
                        <input class="form-check mx-2" type="checkbox" name="sacramento[]" id="sacramento<?php echo $codigo;?>" value="<?php echo $codigo;?>">
                          <label class="form-check-label mx-2"  for="sacramento<?php echo $codigo;?>">
                            <?php echo $nombre;?>
                          </label>
                          
                          
                        </div>
                       
                        
                          <?php 
                            } 
                            }
                          ?>
                           
                      </div>
                     
                      
                    </div><!--fin row -->
                    </div>
                      </br>
                    <div class="card-header "> <!-- TITULO ENCABEZADO DATOS SOCIECONOMICOS -->
                        <h2 class="card-title"> <strong>Datos Socioeconómicos</strong></h2>
                    </div></br>

                <div class="row md-3 ">
                     <!-- inicio del checkbox de dispositivos-->  
                 <div class="col-sm-3">
                  <div class="card">
                     <div class="card-header" style="background-color:#DFD4FE;">
                             <strong>¿Con qué dispositivos cuenta?</strong>
                          </div>
                          <div class="card-body">
                          <?php
                              include_once "conexion3.php";
                              $query1= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO FROM tbl_contenido_socioeconomico s WHERE S.CODIGO_TIPOSOCIO = 1;";
                              $result1= $conn->query($query1);
                           ?>
                     <?php 
                        if ($result1->num_rows > 0) {
                        while($row1 = $result1->fetch_assoc()) { 
                        $codigo = $row1['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                        $nombre = $row1['NOMBRE_TIPO'];
                        ?>
                        <div  class="form-check icheck-green" >
                            <input  class="form-check-input" type="checkbox" name="dispositivos[]" id="dispositivos<?php echo $codigo;?>" value="<?php echo $codigo;?>">
                            <label class="form-check-label" for="dispositivos<?php echo $codigo;?>">
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
                </div> <!-- fin del checkbox de dispositivos-->  
                        
                <div class="col-sm-3"> <!--inicio del checkbox de servicios-->
                  <div class="card">
                     <div class="card-header" style="background-color:#DFD4FE;">
                             <strong>¿Qué servicios de internet utiliza?</strong>
                          </div>
                          <div class="card-body">
                          <?php
                              include_once "conexion3.php";
                              $query2= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO FROM tbl_contenido_socioeconomico s WHERE S.CODIGO_TIPOSOCIO = 2;";
                              $result2= $conn->query($query2);
                           ?>
                             <?php 
                                    if ($result2->num_rows > 0) {
                                    while($row2 = $result2->fetch_assoc()) { 
                                    $codigo = $row2['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                                    $nombre = $row2['NOMBRE_TIPO'];
                                    ?>
                        <div  class="form-check icheck-green" >
                            <input  class="form-check-input" type="checkbox" name="servicios[]" id="servicios<?php echo $codigo;?>" value="<?php echo $codigo;?>">
                            <label class="form-check-label" for="servicios<?php echo $codigo;?>">
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
                </div> <!--fin del checkbox de servicios--> 


                <div class="col-sm-3"> <!--inicio del checkbox de proveedor-->
                  <div class="card">
                     <div class="card-header" style="background-color:#DFD4FE;">
                             <strong>¿Quién provee el ingreso familiar?</strong>
                          </div>
                          <div class="card-body">
                          <?php
                              include_once "conexion3.php";
                              $query3= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO FROM tbl_contenido_socioeconomico s WHERE S.CODIGO_TIPOSOCIO = 3;";
                              $result3= $conn->query($query3);
                           ?>
                                 <?php 
                                    if ($result3->num_rows > 0) {
                                    while($row3 = $result3->fetch_assoc()) { 
                                    $codigo = $row3['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                                    $nombre = $row3['NOMBRE_TIPO'];
                                    ?>
                        <div  class="form-check icheck-green" >
                            <input  class="form-check-input" type="checkbox" name="proveedor[]" id="proveedor<?php echo $codigo;?>" value="<?php echo $codigo;?>">
                            <label class="form-check-label" for="proveedor<?php echo $codigo;?>">
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
                </div> <!--fin del checkbox de proveedor--> 

                <div class="col-sm-3"> <!--inicio del checkbox de basicos-->
                  <div class="card">
                     <div class="card-header" style="background-color:#DFD4FE;">
                             <strong>¿Con qué servicios básicos cuenta en su casa?</strong>
                          </div>
                          <div class="card-body">
                          <?php
                              include_once "conexion3.php";
                              $query4= "SELECT s.CODIGO_CONTENIDO_SOCIOECONOMICO ,s.NOMBRE_TIPO FROM tbl_contenido_socioeconomico s WHERE S.CODIGO_TIPOSOCIO = 4;";
                              $result4= $conn->query($query4);
                           ?>
                                 <?php 
                                    if ($result4->num_rows > 0) {
                                    while($row4 = $result4->fetch_assoc()) { 
                                    $codigo = $row4['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                                    $nombre = $row4['NOMBRE_TIPO'];
                                    ?>
                        <div  class="form-check icheck-green" >
                            <input  class="form-check-input" type="checkbox" name="basicos[]" id="basicos<?php echo $codigo;?>" value="<?php echo $codigo;?>">
                            <label class="form-check-label" for="basicos<?php echo $codigo;?>">
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
                </div> <!--fin del checkbox de basicos--> 
            </div><!--FINAL DEL ROW Socieconomico-->
                      
                      </br></br></br>

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
                                $evaluar_permiso->execute(array($usuariomo, '26'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                          <?php
                             if ($permiso_registrar == 'SI'){

                          ?>
                      <div class="card-footer pr-2">

                           <button type="submit"  id="GUARDARPERSONA" name="GUARDARPERSONA" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                      </div>

                      <?php
                        }
                        ?>
                      
          </form>
          
          </div>
        </div>
   </div><!-- CIerre del container fluid-->

  </section>
</div><!-- Cierre del div wraper -->
 <!--funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
 <script>
 var isSubmitting = false

$(document).ready(function () {
    $('#form').submit(function(){
        isSubmitting = true
    })

    $('#form').data('initial-state', $('#form').serialize());

    $(window).on('beforeunload', function() {
        if (!isSubmitting && $('#form').serialize() != $('#form').data('initial-state')){
            return 'You have unsaved changes which will not be saved.'
        }
    });
})


function window_mouseout( obj, evt, fn ) {

if ( obj.addEventListener ) {

    obj.addEventListener( evt, fn, false );
}
else if ( obj.attachEvent ) {

    obj.attachEvent( 'on' + evt, fn );
}
}


  </script>
  <!--fin de la funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->

   </body>

   <script>//previene que se mantenga una tecla pulsada
      var texto=document.getElementById('bloquear');
      texto.addEventListener('keydown', function(keyboardEvent) {
        if (keyboardEvent.repeat)
            keyboardEvent.preventDefault();
      });
      var texto1 =document.getElementById('bloquear1');
      texto1.addEventListener('keydown', function(keyboardEvent) {
        if (keyboardEvent.repeat)
            keyboardEvent.preventDefault();
      });
  </script>


<script type="text/javascript"> 
  $(document).ready( function () {
      $('#tabla_seccion').DataTable({
        language: {
        "decimal": "",
        "emptyTable": "No hay información",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
        "infoEmpty": "Mostrando 0 a 0 de 0 Entradas",
        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Entradas",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar Sección:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
      },
      })
  } );
</script>

  <script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteSeccion.php','_blank');
      window.open(this.href,'_self');
    }
  </script> 
<script>
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

<script>
function soloLetrascaracteres(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " ¿áéíóúabcdefghijklmnñopqrstuvwxyz?";
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




