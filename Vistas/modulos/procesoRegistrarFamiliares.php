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
    <div class="container-fluid">
    <section class="content-header text-xl-center mb-3 btn-light">
          <h1>
              <h4>AGREGAR FAMILIARES</h4>
          </h1>     
      </section>
        <div class="card ">
        <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;" aria-current="true" href="crudfamiliares"> Ver Familiares </a>
              </li>
              <li class="nav-item">
                <a class="nav-link active"  style="color:#000000;" href="procesoRegistrarFamiliares"> Agregar Familiar </a>
              </li>
              <li class="nav-item">
                <a class="nav-link "  style="color:#000000;" href="crudFamiliaresEstudiantes"> Agregar relación Familiar-Estudiante </a>
              </li>
              <li class="nav-item">
                <a class="nav-link "  style="color:#000000;" href="crudParentesco"> Parentesco </a>
              </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body"><!--Cuerpo del card body principal -->
          <div class="card-header"> <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                      <h2 class="card-title" > <strong>Datos de familiares</strong></h2>
           </div></br>
         <form method="POST" class="needs-validation" novalidate id="form">

            <div class="row mb-5 pl-3">
                
                    <?php //
                    $query = "SELECT CODIGO_PERSONA, CONCAT_WS(' ',DNI,PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO, SEGUNDO_APELLIDO) AS NOMBRE
                    FROM tbl_persona WHERE CODIGO_TIPO_PERSONA = 7;";
                    $resultadod=$conn->query($query);                
                    ?>

             <a href="categoria">
              <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3 mt-2"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar persona</button>
              </a>
                  <div class="col-sm-8 order-2 pl-2 mt-2 mb-2">
                    <select  style="width: 100%;"  class="form-control select2" name="CODpFAMILIAR" id="" type="text" required >
                    <option selected disabled value=""> Buscar familiares...</option>
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
                      <div class="col-md-4"> <!--INICIO IDENTIDAD-->
                          <label for="identidad" class="control-label">Estado civil</label> 
                          <div class="form-group">
                             <input class="form-control" type="text" maxlength="15" minlength="5" name="CIVIL" onkeyup="mayus(this);" placeholder="Ejem: Soltero" onkeypress="return soloLetras(event);" placeholder="Ej: 1" required="" >
                              <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                      </div>

                    
                        <div class="col-md-4"> <!--INICIO INDICE ACADEMICO-->
                          <label for="identidad" class="control-label">Nivel educativo</label> 
                          <div class="form-group">
                            <input class="form-control" type="text" maxlength="15" minlength="5" name="NIVEL" onkeyup="mayus(this);" placeholder="Ejem: Primaria" autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return soloLetras(event);" required="" >
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                          
                        </div>

                        <div class="col-md-3"> <!--INICIO PASATIEMPOS-->
                          <label for="MATERIAS" class="control-label">Ingresos mensuales</label> 
                          <div class="input-group">
                          <input class="form-control" type="text" minlength="2" maxlength="6"  name="INGRESOS" id="" onKeyDown="sinespacio(this);" placeholder="Ejemplo: 5000" autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);">
                          <div class="input-group-append">
                              <span class="input-group-text">Lps</span>
                            </div>
                               <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                          
                        </div>
                  </div>

                  <div class="row">
                        <div class="col-md-6 mt-2"> <!--INICIO IDENTIDAD-->
                          <label for="PASATIEMPOS" class="control-label">Nombre de iglesia</label> 
                          <div class="form-group">
                          <input class="form-control" type="text" name="IGLESIA" id="PASATIEMPOS" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="" required="" ></textarea>
                          <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                          </div>
                        </div>
                  </div>

                     
                
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
                      if($permiso_registrar == 'SI'){
                     ?>
               
                      <div class="card-footer mb-2 pr-2">

                           <button type="submit"  id="GUARDARPERSONA" name="GUARDARFAMILIAR" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
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

window_mouseout( document, 'mouseout', event => {

event = event ? event : window.event;

var from         = event.relatedTarget || event.toElement;

// Si quieres que solo salga una vez el mensaje borra lo comentado
// y así se guarda en localStorage

// let leftWindow   = localStorage.getItem( 'leftWindow' ) || false;

if ( /* !leftWindow  && */ (!from || from.nodeName === 'HTML') ) {

    // Haz lo que quieras aquí
    alert( '!Estas a punto de salir!' );
    // localStorage.setItem( 'leftWindow', true );
}
} );
  </script>
  <!--fin de la funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
</body>




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


function mayus(e) {
    e.value = e.value.toUpperCase();
  }
</script>
