<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=20;
 $accion='Ingreso al proceso de Carga Academica';
 $descripcion= 'Usuario se autentifico ';
 bitacora($codigoObjeto, $accion,$descripcion);
?>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>
<body oncopy="return false" onpaste="return false">
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
              <div class="content-header text-xl-center mb-3 btn-light">
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
                <a class="nav-link "  style="color:#000000;"href="crudContenidoEconoEstudiante">Ver Datos Socioeconomicos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" style="color:#000000;" href="procesoRegistrarEstudiante">Agregar Estudiante</a>
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
                    $query = "SELECT CODIGO_PERSONA, CONCAT(DNI, ' / ',PRIMER_NOMBRE, ' ',SEGUNDO_NOMBRE,' ',PRIMER_APELLIDO, ' ',SEGUNDO_APELLIDO) AS NOMBRE
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
                             <input class="form-control" type="number" maxlength="2" minlength="1" name="GRADO" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 1" required="" >
                              <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                      </div>

                      <div class="col-md-3">
                        <label  class="control-label pl-4">¿Repitente de curso?</label>
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
                          <label for="identidad" class="control-label">Indice academico</label> 
                          <div class="form-group">
                            <input class="form-control" type="number" maxlength="2" minlength="1" name="INDICE" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 90" required="" >
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                          
                        </div>

                        <div class="col-md-3"> <!--INICIO PASATIEMPOS-->
                          <label for="MATERIAS" class="control-label">Materias con bajo rendimiento</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="MATERIAS" id="MATERIAS" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ejemplo: Español" required="" ></textarea>
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
                          <textarea class="form-control" type="textarea" name="PASATIEMPOS" id="PASATIEMPOS" onkeyup="mayus(this);" autocomplete = "off" onkeypress="return soloLetras(event);" placeholder="Ejemplo: Ver Telelevision" required="" ></textarea>
                          <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>

                        <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="DISTRACTORES" class="control-label">Distractores</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="DISTRACTORES" id="DISTRACTORES" onkeyup="mayus(this);" autocomplete = "off" onkeypress="return soloLetras(event);" placeholder="Ejemplo: Redes Sociales" required="" ></textarea>
                          <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>

                        <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="METAS" class="control-label">Metas</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="METAS" id="METAS" onkeyup="mayus(this);" autocomplete = "off" onkeypress="return soloLetras(event);" placeholder="Ejemplo: Estudiar en la universidad" required="" ></textarea>
                          <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>
                  </div><!--Cierre del row general -->
                      </br>
                      <div class="card-header "> <!-- TITULO ENCABEZADO DATOS SOCIECONOMICOS -->
                        <h2 class="card-title"> <strong>Datos socioeconomicos</strong></h2>
                    </div></br>

                <div class="row pl-3">
                     <!-- inicio del checkbox de dispositivos-->  
                <div class="col-sm-3">
                  <div class="card">
                     <div class="card-header" style="background-color:#DFD4FE;">
                             <strong>¿Con que dispositivos cuenta?</strong>
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
                             <strong>¿Servicios básicos cuenta en su casa?</strong>
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
                      <div class="card-footer pr-2">

                           <button type="submit"  id="GUARDARPERSONA" name="GUARDARPERSONA" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                      </div>
          </form>
          </div>
        </div>
   </div><!-- CIerre del container fluid-->

  </section>
</div><!-- Cierre del div wraper -->

</body>


<script src="../../js/mensajes.alerta.js"></script>

<script>
(function() {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function(form) {
            form.addEventListener('submit', function(event) {
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
window.addEventListener("beforeunload", (evento) => {
    if (true) {
        evento.preventDefault();
        evento.returnValue = "";
        return "";
    }else{
      return "";
    }
});

function window_mouseout( obj, evt, fn ) {

if ( obj.addEventListener ) {

    obj.addEventListener( evt, fn, false );
}
else if ( obj.attachEvent ) {

    obj.attachEvent( 'on' + evt, fn );
}
}

window_mouseout( document, 'mouseout', event => {

event = event ? event : window.event;

var from         = event.relatedTarget || event.toElement;

// Si quieres que solo salga una vez el mensaje borra lo comentado
// y así se guarda en localStorage

// let leftWindow   = localStorage.getItem( 'leftWindow' ) || false;

if ( /* !leftWindow  && */ (!from || from.nodeName === 'HTML') ) {

    // Haz lo que quieras aquí
    alert( 'Algunos cambios hechos pueden no ser guardados' );
    // localStorage.setItem( 'leftWindow', true );
}
} );
</script>