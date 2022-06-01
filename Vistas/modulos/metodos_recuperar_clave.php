<!--Elaborado por Diana Rut Garcia 
-----------------------------------------------------------------------
	           Universidad Nacional Autonoma de Honduras (UNAH)
		           Facultad de Ciencias Economicas
	        Departamento de Informatica administrativa
         Analisis, Programacion y Evaluacion de Sistemas
                    Segundo Periodo 2022
Equipo:

Catedratico:
Lic. Karla Melisa Garcia Pineda 
---------------------------------------------------------------------
Programa:          Restablacer contraseña
Fecha:             10-dic-2021
Programador:       Erika Zuniga
Descripcion:       Pantalla Metodos para restablecer la contraseña
-----------------------------------------------------------------------
 Historial de Cambio
-----------------------------------------------------------------------
Programador            Fecha                Descripcion
Diana Rut Garcia	 	26-may-2021       Cambio apariencia pantalla -->
<?php
 include "conexionpdo.php";
?>
<?php
  // Parametro de minimo usuario
  $min_usuario = "MIN_USUARIO";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($min_usuario));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor1 = $row;
  }
?>
<?php
  //Parametro de maximo usuario
  $max_usuario = "MAX_USUARIO";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($max_usuario));
  $row1=$sentencia1->fetchColumn();
  if($row1>0){
    $valor2 = $row1;
  }
?>
<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="./fontawesome-free/css/all.min.css">

    <title>Restablecer contraseña</title>
    <link rel="shortcut icon" href="../assets/dist/img/logoparroquia.jpg" type="image/x-icon">

  </head>
  <style>
      body{
        background-color:#e9ecef; 
      }
  </style>
  <body class="login-page" _c_t_common="1" >
      <div class="container-fluid">
         <div class="row justify-content-center mt-5">
            <div class="col-md-3 d-lg-block col-md-5  col-sm-8  col-xl-3 " >
                <div  class="card card-outline card-primary">
                    <div class="card-header bg-white ">
                       <h3 class=" text-center">Restablecer la contrase&ntilde;a </h3>
                    </div>
                    <div class="card-body">
                        <form class="needs-validation" novalidate method="POST" action="../../modelos/metodo_seleccionado_recuperacion.php">
                            <div class="input-group mb-1">
                             <p><strong>¿Olvidaste tu contraseña?</strong></p></br>
                               <p class="fw-normal ">Ingresa tu nombre  usuario para restablecer la contraseña mediante 2 formas.</p>
                            </div>
                            <div class="input-group mb-3">
                              <div class="input-group-prepend">
                               <span class="input-group-text" ><i class="fas fa-user"></i></span>
                              </div>
                              <input required pattern="[A-Z]{<?php echo $valor1;?>,<?php echo $valor2;?>}"  onkeyup="noespacio(this, event);mayus(this)"  required type="text" name="usuario" class="form-control"  placeholder="Nombre de usuario"   minlength="<?php echo $valor1;?>" maxlength="<?php echo $valor2;?>"
                                autocomplete = "off"  onkeypress="return soloLetras(event);"; onkeydown="sinespacio(this);">
                                <div class="invalid-feedback">
                                   Debe tener minimo <?php echo $valor1; ?> caracteres.
                                </div>
                            </div>
                            <div class="d-grid gap-2"><!--Botones  -->
                              <button type="submit" name="correo"  class="btn btn-block btn-outline-primary">
                                <i class="fa fa-envelope mr-2"></i>Recuperar por Correo Electrónico
                              </button>
                              <button type="submit" name="recu" class="btn btn-block btn-outline-success">
                                <i class="fa fa-question-circle mr-2"></i>Por Preguntas de Seguridad </button><br>
                              <button type="button"  onclick="location.href='../../index.php'" class="btn btn-block btn-danger btn-flat">CANCELAR</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
         </div>
      </div>
  </body>
  <!--Elaborado por Diana Rut -->

  <!--Funciones js -->

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <script>
      function mayus(e) {//Funcion mayuscula
        e.value = e.value.toUpperCase();
     }
      (function () {'use strict' //funcion de validacion de campos con js
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
      function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
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
  <script type="text/javascript">
    function sinespacio(e) {
      var cadena =  e.value;
      var limpia = "";
      var parts = cadena.split(" ");
      var length = parts.length;
      for (var i = 0; i < length; i++) {
        nuevacadena = parts[i];
        subcadena = nuevacadena.trim();
        if(subcadena != "") {
          limpia += subcadena + " ";
        }
      }
      limpia = limpia.trim();
      e.value = limpia;
    };
  </script>
  <!-- Codigo para evitar los espacios cuando se coloca el cursor en medio de la constraseña-->
  <script language="javascript">
    function noespacio(campo, event) {
      CadenaaReemplazar = " ";
      CadenaReemplazo = "";
      CadenaTexto = campo.value;
      CadenaTextoNueva = CadenaTexto.split(CadenaaReemplazar).join(CadenaReemplazo);
      campo.value = CadenaTextoNueva;
    }
  </script>

</html>