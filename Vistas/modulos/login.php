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
Programa:          Login del sistema
Fecha:             10-dic-2021
Programador:       Erika Zuniga
Descripcion:       Pantalla de inicio de sesion por el usuario
-----------------------------------------------------------------------
 Historial de Cambio
-----------------------------------------------------------------------
Programador                 Fecha                Descripcion
Diana Rut Garcia Amador	 	25-may-2021       Cambio en parametos
Diana Rut Garcia Amador	 	27-may-2021       Se agrego otro parametro que faltaba
Diana Rut Garcia Amador	 	28-may-2021       Se cambio la pantalla para que se viera mejor en dispositivos moviles
 -->
 <?php
 include "conexionpdo.php";
  // Parametro de minimo nombre usuario
  $min_usuario = "MIN_USUARIO";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($min_usuario));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor1 = $row;
  }
  ?>
  <?php
  //Parametro de maximo nombre usuario
  $max_usuario = "MAX_USUARIO";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($max_usuario));
  $row1=$sentencia1->fetchColumn();
  if($row1>0){
    $valor2 = $row1;
  }
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
  $min_clave ="NUM_MIN_CARACTER";
  $sentencia3 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia3->execute(array($min_clave));
  $row3 = $sentencia3->fetchColumn();
  if($row1>0){
    $valor4 = $row3;
  }
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../fontawesome-free/css/all.min.css">
    <title>Login Usuario</title>
  </head>
  <style>
       body{
        background-color:#e9ecef; 
      }
      .bg{
        background-size: cover;
         background-image:url(assets/imagenes/prosecar.PNG);
         background-position: center center;
       }
  </style>
<body oncopy="return false" onpaste="return false">
<div class="container-fluid">
  <div class="row justify-content-center ">
   <div class="card mb-3 rounded shadow " style="max-width: 740px;">
     <div class="row g-0 ">
        <div class="col-md-6 bg d-lg-block col-md-5  col-sm-6  col-xl-6 rounded-end">
        </div>
        <div class="col-md-6  d-lg-block col-md-5  col-sm-6  col-xl-6 rounded-end">
          <div class="card-body">
            <h3 class="fw-bold text-center py-4">INICIAR SESIÓN</h3><hr></br>
             <!--LOGIN USUARIO -->
            <form method="POST" class="needs-validation" novalidate>
              <div class="input-group mb-4"><!--Para ingresar el nombre de usuario -->
                <span class="input-group-text" ><i class="fas fa-user"></i></span>
                <input type="text" name="ingUsuario" class="form-control" placeholder="Ingresa tu nombre de usuario" autocomplete = "off"  onkeypress="return soloLetras(event);" autocomplete = "off" minlength="<?php echo $valor1;?>" maxlength="<?php echo $valor2;?>" onkeyup="mayus(this);" required onblur="quitarespacios(this);" onkeydown="sinespacio(this);">
                  <div class="invalid-tooltip">
                    Debe teber minimo <?php echo $valor1; ?> caracteres.
                  </div>
              </div>
              <div class="input-group mb-3"><!--Para ingresar la contraseña -->
                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                <input type="password" name="ingPassword" id="contra" class="form-control" placeholder="Ingresa tu contrase&ntilde;a"  minlength="<?php echo $valor4;?>" maxlength="<?php echo $valor3;?>" required onblur="quitarespacios(this);"onkeyup="sinespacio(this);">
                  <span class="input-group-text" onclick="mostrar1()"><i class=" icon1 fa fa-eye-slash"></i></span>
                  <div class="invalid-tooltip">
                      Llene este campo
                  </div>
              </div></br>
              <div class="d-grid">
                <button style="border-radius: 20px;" name = "btningresar" 
                type="submit" class="btn btn-danger btn-block"><i class=" fas fa-sign-in-alt mx-1"></i> INGRESAR</button>
              </div>
              <div class=" text-center my-3"> 
                <p class="semibold-text mb-2"><a style="color:black; text-decoration:none" href="vistas/modulos/metodos_recuperar_clave.php">¿Olvidaste tu contrase&ntilde;a? </a></p>
                 <div class="mt-2"><a style=" text-decoration:none" href="vistas/modulos/auto_registro.php">Autoregistro</a></div>
                <?php
                 //Funcion del usuario controlado que hace posible el logeo :)
                 $login = new ControladorUsuarios();
                 $login -> ctrIngresoUsuario();
                ?>
            </form>
        </div>
      </div>
    </div>
    </div>       
  </div>
</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
<!--Codigo de algunas validaciones para la entrada de datos  -->
<script  type="text/javascript">
   //codigo para mostrar la contraseña
  function mostrar1(){
    var cambio1 = document.getElementById("contra");
    if(cambio1.type == "password"){
        cambio1.type = "text";
    $('.icon1').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    }else{
        cambio1.type = "password";
    $('.icon1').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
    }        
  }
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
        function mayus(e) {
          e.value = e.value.toUpperCase();
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

 <script type="text/javascript">
    function quitarespacios(e) {
      var cadena =  e.value;
      cadena = cadena.trim();
      e.value = cadena;
    };
  </script>
</html>
