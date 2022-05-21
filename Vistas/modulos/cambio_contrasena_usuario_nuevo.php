<?php
  session_start();
  include_once "../../modelos/conexion3.php";
  $_SESSION['vario'];
  $parametro ="NUM_MAX_CARACTER";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($parametro));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor = $row;
  }
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./fontawesome-free/css/all.min.css">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Cambio de contraseña por correo</title>
  </head>
 <style>
     /*Estilos aplicados para usar en las validaciones de js,donde los
     inputs cambien de colores  */
     body{
           background-color:#E8E8E1;
       }
    .fa-eye:hover{
        color:steelblue;
    }
    .formulario__input-error {
      font-size: 13px;
      margin-bottom: 0;
      display: none;
     }
    .formulario__input-error-activo {
     display: block;
     }
    .formulario__grupo-incorrecto .form-control{
     border: 3px solid #bb2929;
    }
    .formulario__grupo-correcto .form-control{
     border:  solid #1ed12d;
     }
 </style>

<body>
    <div class="row align-items-center justify-content-center mt-5">
          <div class="col-md-5 rounded" style="width: 20rem;" >
            <H3 class="fw-bold text-center py-4">Cambiar Contraseña</H3>
          <div  class="card">           
              <div class="card-body">
                <form  action="../../modelos/validar_contrasena_usuario_nuevo.php" method="POST" class="formulario" id="formulario">
                  <div class="row">
                    <label class="control-label mb-2">Contrase&ntilde;a anterior:</label>
                    <div class="input-group mb-3" >
                      <input type="password" id="contra_anterior" name="contraAnte" class="form-control" 
                       required minlength="5" maxlength="<?php echo "$valor"?>" title="Configure con los valores solicitados" onkeyup="sinespacio(this);">
                       <div class="input-group-prepend">
                          <button id="show_password" class="form-control btn-outline-secondary  btn-block" type="button" onKeyDown="sinespacio(this);" onclick="mostrar()"><span class="icon fa fa-eye-slash"></button>
                        </div>
                      <p class="formulario__input-error">Su contraseña debe que tener letras mayusculas, minisculas caracteres especiales y un numero.</p>
                    </div>
                    <label class="control-label mb-2">Contrase&ntilde;a:</label>
                    <div class="input-group mb-3" id="grupo__clave_nueva">
                        <input  type="password" id="clave_nueva" name="clave_nueva" class="form-control" 
                          required  minlength="5" maxlength="<?php echo "$valor"?>"  title="Configure con los valores solicitados" onkeyup="sinespacio(this);">
                          <div class="input-group-prepend">
                            <button id="show_password" class="form-control btn-outline-secondary  btn-block" type="button" onKeyDown="sinespacio(this);" onclick="mostrar1()"><span class="icon1 fa fa-eye-slash"></button>
                          </div>
                        <p class="formulario__input-error">Su contraseña debe que tener letras mayusculas, minisculas y caracteres especiales y un numero.</p>
                    </div>
                    <label class="control-label mb-2">Confirmar contrase&ntilde;a:</label>
                    <div class="input-group mb-3 " id="grupo__confirmar_clave">
                        <input  type="password" id="confirmar_clave" name="confirmar_clave" class="form-control"
                         required minlength="5"  maxlength="<?php echo "$valor"?>"   title="Configure con los valores solicitados" onkeyup="sinespacio(this);">
                         <div class="input-group-append">
                           <button id="show_password" class="form-control btn-outline-secondary btn-block" type="button"  onclick="mostrar2()"><span class="icon2 fa fa-eye-slash"></button>
                         </div>
                        <p class="formulario__input-error" >Ambas contraseñas deben ser iguales.</p>
                    </div>
                    <br><br>
                    <div class="d-grid">
                      <button type="submit" name="GUARDARCONTRA" id="GUARDARCONTRA" class="btn btn btn-success btn-block">Cambiar Contrase&ntilde;a</button>
                    </div>
                  </div>
                </form>
              </div>
           </div>
        </div>
    </div>
    

<script type="text/javascript">// funcion que convierte en mayuscula lo que se vaya ingresando.
function mayus(e) {
 e.value = e.value.toUpperCase();
}
</script>
<script type="text/javascript">
//funciones para ver la contraseña por cada input
function mostrar2(){ 
 var cla1 = document.getElementById("confirmar_clave");
    if(cla1.type == "password"){
      cla1.type = "text";
      $('.icon2').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
   }else{
      cla1.type = "password";
      $('.icon2').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
    }
}
</script>
<script type="text/javascript">
  function mostrar(){
    var cla2 = document.getElementById("contra_anterior");
    if (cla2.type == "password"){
      cla2.type = "text";
      $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    }else{
      cla2.type = "password";
      $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
    }
 }
 </script>
 <script type="text/javascript">
 function mostrar1(){
  var cla = document.getElementById("clave_nueva");//se debe de crear un variable que recoja el id del input donde se quiera ver la clave.
    if(cla.type == "password"){
      cla.type = "text";
      $('.icon1').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    }else{
      cla.type = "password";
      $('.icon1').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
    }
  }
</script>
<script type="text/javascript">
function sinespacio(e) { //funcion sin espacion la clave
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

<script src="../../modelos/validacion_clave.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
-->
</body>
</html>
