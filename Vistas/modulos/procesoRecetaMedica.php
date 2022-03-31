<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once 'conexionpdo.php';
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

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
            
    <div class="container-fluid">
                <!-- Inicio del PROCESO inscripcion de estudiantes-->
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
                <a  class="nav-link" aria-current="true" href="#"  style=" color:#000000;">Pre Clinica</a>
              </li>
              <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consultas Medicas</a>
            </li>

            <li class="nav-item">
            <a  class="nav-link active" style="color:#000000;" href="#">Recetas Medicas</a>
            </li>
            </ul>
          </div><
          <div class="card-body"><!--Cuerpo del card body principal -->
          <div class="card-header bg-gradient-cyan"> <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                      <h2 class="card-title" > <strong>Registro de recetas medicas</strong></h2>
           </div></br>
         <form method="POST" class="needs-validation" novalidate>

            <div class="row pl-3 mb-3">
              <div class="col-sm-3">
                <label for="" class="form-label">Fecha de receta</label>
                 <input class="form-control" type="date" min="<?= date("Y-m-d")?>" max="<?= date("Y-m-d")?>"  name="telefono" id="" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);">
              </div>
            </div>

            <div class="row mb-5 pl-3">

            <?php
              $usuario= $_SESSION['vario'];

              //Consulta que trae el codigo del usuario
              $sentencia1 = $db->prepare("SELECT p.CODIGO_PERSONA
              FROM tbl_usuario u, tbl_persona p 
              WHERE u.CODIGO_PERSONA = p.CODIGO_PERSONA
              AND NOMBRE_USUARIO = (?);");
              $sentencia1->execute(array($usuario));
              $cod_usuario=$sentencia1->fetchColumn();

              ?>
                
                    <?php   
                
                 

                    $query = "SELECT con.CODIGO_CONSULTA, concat(pe.DNI, ' ', pe.PRIMER_NOMBRE, ' ', pe.PRIMER_APELLIDO) as PACIENTE
                    FROM tbl_consulta_medica con, tbl_inscripcion_cita i, tbl_persona pe , tbl_usuario u, tbl_persona_especialidad es
                    WHERE con.CODIGO_CITA = i.CODIGO_CITA
                    AND i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                    AND I.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                    AND u.CODIGO_PERSONA = pe.CODIGO_PERSONA
                    AND con.FECHA_CREACION = CURDATE()
                    AND es.CODIGO_PERSONA = '$cod_usuario';";
                    $resultadod=$conn->query($query);                
                    ?>

                    <?php
                      $query1 = "SELECT me.CODIGO_MEDICAMENTO , me.NOMBRE_MEDICAMENTO
                      FROM tbl_medicamento me; ";
                      $resultado2=$conn->query($query1);
                    ?>

                  <!--<button  class="btn btn-secondary "  class="col-sm-1 col-form mt-3">Buscador</button>-->
                <div class="col-sm-6 order-2 pl-2 mt-3 mb-3">
                  <label for="identidad" class="control-label">Nombre del paciente</label> 
                    <select  style="width: 100%;"  class="form-control select2" name="CODpFAMILIAR" id="" type="text" required >
                    <option selected disabled value="">Buscar paciente...</option>
                        <?php 
                          if ($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo = $row['CODIGO_CONSULTA'];
                          $nombre = $row['PACIENTE'];
                          
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

                <!--Datalist para agregar el medicamento-->
                <div class="col-sm-6 order-2 pl-2 mt-3 mb-3">
                  <label for="identidad" class="control-label">Medicamento</label> 
                    <select  style="width: 100%;"  class="form-control select2" name="CODpFAMILIAR" id="" type="text" required >
                    <option selected disabled value="">Buscar medicamento...</option>
                        <?php 
                          if ($resultado2->num_rows > 0) {
                          while($row1 = $resultado2->fetch_assoc()) { 
                          $codigo1 = $row1['CODIGO_MEDICAMENTO'];
                          $nombre1 = $row1['NOMBRE_MEDICAMENTO'];
                         
                          ?>
                        <option value="<?php echo $codigo1?>" ><?php echo $nombre1;?></option>
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
                </div> <!--fin de Datalist para agregar el medicamento-->
            </div> 

                  <div class="row pl-3">
                        <div class="col-md-6"> <!--INICIO INDICE ACADEMICO-->
                          <label for="identidad" class="control-label">Indicacione de receta</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="direccion" id="DIRECCION" onkeyup="mayus(this);" autocomplete = "off" onkeypress=""></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                          
                        </div>

                        <div class="col-md-6"> <!--INICIO PASATIEMPOS-->
                          <label for="MATERIAS" class="control-label">Observaciones</label> 
                          <div class="form-group">
                          <textarea class="form-control" type="textarea" name="direccion" id="DIRECCION" onkeyup="mayus(this);" autocomplete = "off" onkeypress=""></textarea>
                               <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                          
                        </div>

                        
                  </div>


                     
                
                      </br></br></br>
                      <div class="card-footer mb-2 pr-2">

                           <button type="submit"  id="GUARDARPERSONA" name="GUARDARFAMILIAR" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                      </div>
          </form>
          </div>
        </div>
   </div><!-- CIerre del container fluid--> 
  </section>
</div><!-- Cierre del div wraper -->

<script type="text/javascript">// funcion que convierte en mayuscula lo que se vaya ingresando.

function mayus(e) {
 e.value = e.value.toUpperCase();
}

function mostrar_clave(){ //funcion para ver visualizar las contraseñas al mismo tiempo
 var cla = document.getElementById("clave_nueva");//se debe de crear un variable que recoja el id del input donde se quiera ver la clave.
 var cla1 = document.getElementById("confirmar_clave");
    if(cla.type==="password" && cla1.type==="password"){
       cla.type="text";
        cla1.type="text";
    }else{
        cla.type="password";
        cla1.type="text";
    }
}

</script>


<!-- funciones del sistema -->
<script>
function soloLetras(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
    especiales = ["8-37-39-46"];
    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }
    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        return false;
    }
}
//funcion para solu numeros ingresar en el campo
function soloNumeros_tel(e) {
    var teclaPulsada = window.event ? window.event.keyCode : e.which;
    // capturamos el contenido del input
    var valor = document.getElementById("tele").value;
    if (valor.length < 9) {
        if (teclaPulsada == 9) {
            return true;
        }
        // devolvemos true o false dependiendo de si es numerico o no
        return /\d/.test(String.fromCharCode(teclaPulsada));
    } else {
        return false;
    }
}





//funcion para quitar espacios
function quitarespacios(e) {
    var cadena = e.value;
    cadena = cadena.trim();
    e.value = cadena;
};
//funcion para poner mayusculas
function mayus(e) {
    e.value = e.value.toUpperCase();
}
//funcion sin espacios 
function sinespacio(e) {
    var cadena = e.value;
    var limpia = "";
    var parts = cadena.split(" ");
    var length = parts.length;
    for (var i = 0; i < length; i++) {
        nuevacadena = parts[i];
        subcadena = nuevacadena.trim();
        if (subcadena != "") {
            limpia += subcadena + " ";
        }
    }
    limpia = limpia.trim();
    e.value = limpia;
};
//otra funcion para quitar espacios :V
function quitarespacios(e) {
    var cadena = e.value;
    cadena = cadena.trim();
    e.value = cadena;
};
</script>

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
