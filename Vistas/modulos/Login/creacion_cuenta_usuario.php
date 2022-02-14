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
           background-color:#E8E8E1;
           background: linear-gradient(to right,#F9DD94);
       }
       .bg{
        background-size: cover;
         background-image:url(../imagenes/fondo_login.jpg);
         background-position: center center;
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
    <div class="container w-50  mt-5 rounded ">
        <div class="row align-items-stretch">
            <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded-end">
              <!--ESPACIO DONDE ESTA COLOCADA LA IMAGEN -->
            </div>
            <div class="col bg-white p-4 rounded-end">
                 <h3 class="fw-bold text-center py-4">REGISTRATE</h3>
                 </br>
                <!--LOGIN USUARIO -->
              <form  action=""   class="formulario" id="formulario">
                  <div class="input-group mb-4"  >
                      <span class="input-group-text" id=""><i class="fas fa-user"></i></span>
                      <input name = "ingusuario" type="text" class="form-control" placeholder="Ingresa nombre de usuario" onkeyup="mayus(this);"  onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required="">
                  </div>
              
                  <div class="input-group mb-4" id="grupo__clave_nueva">
                      <span  class="input-group-text" id=""><i class="fas fa-lock"></i></span> 
                      <input type="password" class="form-control" placeholder="Ingresa tu contrase&ntilde;a"  id="clave_nueva" name="clave_nueva" required onblur="quitarespacios(this);"  onkeyup="sinespacio(this);" required="" minlength="8" maxlength="9" >
                      <p class="formulario__input-error">La contraseña tiene que tener mayusculas,minisculas y caracteres especiales.</p>
                  </div>
                  <div class="input-group mb-4" id="grupo__confirmar_clave">
                      <span    class="input-group-text" id=""><i class="fas fa-lock"></i></span> 
                      <input name = "ingcontrasena" type="password" class="form-control" placeholder="Ingresa tu contrase&ntilde;a"  id="confirmar_clave" name="confirmar_clave" required onblur="quitarespacios(this);"  onkeyup="sinespacio(this);" required="" minlength="8" maxlength="9" >
                      <p class="formulario__input-error">La contraseña tiene que coincidir con la contraseña anterior.</p>
                  </div>


                  <div class="input-group mb-4">
                      <span    class="input-group-text" id=""><i class="fa fa-envelope"></i></span> 
                      <input name ="ingcorreo" type="text" class="form-control" placeholder="Ingresa un correo electronico"  >
                  </div>
                  
                  <div class="d-grid">
                      <button name = "btnregistrar" type="submit" class="btn btn-danger btn-block">REGISTRATE</button>
                  </div>
                  
              </form>
            </div>
        </div>
    <div>

    <script src="../../../js/cambio_clave.js"></script>
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>

<script>
      function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz123456789";
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
